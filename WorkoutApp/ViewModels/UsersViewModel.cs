using CommunityToolkit.Maui.Views;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using WorkoutApp.Models;
using WorkoutApp.Resources.Controls;
using WorkoutApp.Resources.Database;
using WorkoutApp.Resources.Services;

namespace WorkoutApp.ViewModels
{
    public class UsersViewModel : BaseViewModel
    {
		public ICommand CreateUserCommand { get; set; }
        public ICommand DeleteItemCommand { get; }
        public ICommand EditItemCommand { get; }
        private ObservableCollection<User> _users;
        WorkoutAppDatabase workoutAppDatabase = new WorkoutAppDatabase();
        private readonly IDataTransferService _dataTransferService;
        public ObservableCollection<User> Users
		{
			get
			{
				return _users;
			}
			set
			{
				_users = value;
				OnPropertyChanged(nameof(Users));
			}
		}
		private User _selectedItem;
		public User SelectedItem
		{
			get
			{
				return _selectedItem;
			}
			set
			{
				if(_selectedItem != value)
				{
                    _selectedItem = value;
                    OnPropertyChanged(nameof(SelectedItem));
                    ChangeToHompage();
                }

            }
		}
        public UsersViewModel(IDataTransferService dataTransferService)
        {
            _users = new ObservableCollection<User>();
            CreateUserCommand = new Command(() => CreateUser());
            DeleteItemCommand = new Command<User>(DeleteItem);
            EditItemCommand = new Command<User>(EditItem);
            _dataTransferService = dataTransferService;
            Load();
        }

        private async void CreateUser(User user=null)
        {
			var currentPage=App.Current.MainPage;
			if(currentPage != null)
			{
				User result=(User) await currentPage.ShowPopupAsync(new UserCreationPopUp(user));
				if(result != null)
				{

                    WorkoutAppDatabase workoutAppDatabase = new WorkoutAppDatabase();
                    if(result.Id != 0)
                    {
                        var item = _users.FirstOrDefault(x => x.Id == result.Id);
                        if (item != null)
                        {
                            await workoutAppDatabase.InsertUserAsync(new User
                            {
                                Id= result.Id,
                                Name = result.Name,
                                Weight = result.Weight,
                                Height = result.Height,
                                Age = result.Age
                            });
                            
                            Load();
                        }
                    }
                    else
                    {
                        int id = await workoutAppDatabase.InsertUserAsync(result);
                        result.Id = id;
                        _users.Add(result);
                        Load();
                    }
                }
            }
        }
        private void EditItem(User item)
        {
            CreateUser(item);
        }

        private async void DeleteItem(User item)
        {
            _users.Remove(item);
            User user = new User
            {
                Id = item.Id,
                Name = item.Name,
                Weight = item.Weight,
                Height = item.Height,
                Age = item.Age

            };
            await workoutAppDatabase.DeleteUserAsync(user);
            Load();
        }
        private async void Load()
		{
			_users.Clear();

			List<User> users = await workoutAppDatabase.GetUsersAsync();
			foreach (User user in users)
			{
				_users.Add(user);
            }
        }
        private async void ChangeToHompage()
        {
            _dataTransferService.SetData(SelectedItem);
            await Shell.Current.GoToAsync($"home");
        }
    }
}
