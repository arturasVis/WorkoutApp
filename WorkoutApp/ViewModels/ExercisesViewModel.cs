using CommunityToolkit.Maui.Views;
using Microsoft.Maui.Controls.Handlers.Items;
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

namespace WorkoutApp.ViewModels
{
    public class ExercisesViewModel : BaseViewModel
    {
		public ICommand ShowPopUpcommand { get; }
        public ICommand DeleteItemCommand { get; }
        public ICommand EditItemCommand { get; }
        private WorkoutAppDatabase workoutAppDatabase;
        private ObservableCollection<ExerciseItemViewModel> exercisesItems;
		public ObservableCollection<ExerciseItemViewModel> ExercisesItems
		{
			get
			{
				return exercisesItems;
			}
			set
			{
				exercisesItems = value;
				OnPropertyChanged(nameof(ExercisesItems));
			}
		}
        public ExercisesViewModel()
        {
            exercisesItems = new ObservableCollection<ExerciseItemViewModel>();
            workoutAppDatabase = new WorkoutAppDatabase();
            Load();
            ShowPopUpcommand = new Command(() => ShowPopUp());
            DeleteItemCommand = new Command<ExerciseItemViewModel>(DeleteItem);
            EditItemCommand = new Command<ExerciseItemViewModel>(EditItem);
        }

        private async void Load()
        {
            exercisesItems.Clear();
            await workoutAppDatabase.GetExerciseItemsAsync().ContinueWith(async (task) =>
            {
                List<ExercisesItem> items = await workoutAppDatabase.GetExerciseItemsAsync();
                foreach (ExercisesItem item in items)
                {
                    
                    ExerciseItemViewModel exerciseItem = await ExerciseItemViewModel.CreateExerciseItemViewModelAsync(item.Id,item,workoutAppDatabase);
                    exercisesItems.Add(exerciseItem);
                }
            });
        }

        private void EditItem(ExerciseItemViewModel item)
        {
            ExercisesItem exercisesItem = new ExercisesItem
            {
                Id = item.Id,
                Name = item.Name,
                Description = item.Description,
                CategoryFK = item.Category.Id,
                MuscleGroupFK = item.MuscleGroup.Id
            };
            ShowPopUp(exercisesItem);
        }

        private async void DeleteItem(ExerciseItemViewModel item)
        {
            exercisesItems.Remove(item);
            ExercisesItem exercisesItem = new ExercisesItem
            {
                Id = item.Id,
                Name = item.Name,
                Description = item.Description,
                CategoryFK = item.Category.Id,
                MuscleGroupFK = item.MuscleGroup.Id
            };
            await workoutAppDatabase.DeleteItemAsync(exercisesItem);
            Load();
        }

        private async void ShowPopUp(ExercisesItem exercisesItem=null)
        {
            var currentPage = App.Current.MainPage;
			if(currentPage != null)
			{
                List<MuscleGroups> muscleGroups = await workoutAppDatabase.GetMuscleGroups();
                List<ExcerciseCategories> excerciseCategories = await workoutAppDatabase.GetExcerciseCategories();
                ExercisesItem result = (ExercisesItem) await currentPage.ShowPopupAsync(new CustomPopup(exercisesItem,muscleGroups,excerciseCategories));
                if (result != null)
                {
                    if(result.Id != 0)
                    {
                        var item = exercisesItems.FirstOrDefault(i => i.Id == exercisesItem.Id);
                        if(item != null)
                        {
                            await workoutAppDatabase.SaveItemAsync(new ExercisesItem
                            {
                                Id = result.Id,
                                Name = result.Name,
                                Description = result.Description,
                                CategoryFK = result.CategoryFK,
                                MuscleGroupFK = result.MuscleGroupFK
                            });
                            //Can be optimized to only update the item in the list
                            Load();
                        }
                    }
                    else
                    {
                        
                        int id=await workoutAppDatabase.SaveItemAsync(result);
                        ExerciseItemViewModel item = await ExerciseItemViewModel.CreateExerciseItemViewModelAsync(id,result, workoutAppDatabase);
                        exercisesItems.Add(item);
                    }
                }
            }
        }
    }
}
