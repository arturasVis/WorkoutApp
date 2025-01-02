using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using WorkoutApp.Models;
using WorkoutApp.Resources.Database;
using WorkoutApp.Resources.Services;

namespace WorkoutApp.ViewModels
{
    public class HomePageViewModel : BaseViewModel
    {
		public ICommand NavigateWorkoutPageCommand { get; set; }
		public ICommand NavigateExercsicesPageCommand { get; set; }
		private readonly IDataTransferService _dataTransferService;
		private User _currentUser;
		public User CurrentUser
		{
			get
			{
				return _currentUser;
			}
			set
			{
                _currentUser = value;
				OnPropertyChanged(nameof(CurrentUser));
			}
		}
		public WorkoutAppDatabase Database { get; set; }
        public HomePageViewModel(IDataTransferService dataTransferService)
        {
            _dataTransferService = dataTransferService;
            _currentUser = _dataTransferService.GetData<User>();
            NavigateWorkoutPageCommand = new Command(async () => await NavigateToWorkoutPage());
            NavigateExercsicesPageCommand = new Command(async () => await NavigateToExercisesPage());
        }

        private async Task NavigateToExercisesPage()
        {
			await Shell.Current.GoToAsync("exercises");
        }

        private async Task NavigateToWorkoutPage()
        {
			await Shell.Current.GoToAsync("workout");
        }

        private string userName;
		public string UserName
		{
			get
			{
				return userName;
			}
			set
			{
				userName = value;
				OnPropertyChanged(nameof(UserName));
			}
		}

	}
}
