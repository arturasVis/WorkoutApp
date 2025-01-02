using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using WorkoutApp.Models;
using WorkoutApp.Resources.Database;
using WorkoutApp.Resources.Services;

namespace WorkoutApp.ViewModels.WorkoutPageViewmodels
{
    public class WorkoutViewModel : BaseViewModel
    {
        private readonly IDataTransferService _dataTransferService;
        public ICommand NavigateToWorkoutEditPageCommand { get; set; }
        private WorkoutAppDatabase WorkoutAppDatabase= new WorkoutAppDatabase();

        private ObservableCollection<WorkoutPlan> workoutPlans;
		public ObservableCollection<WorkoutPlan> WorkoutPlans
		{
			get
			{
				return workoutPlans;
			}
			set
			{
				workoutPlans = value;
				OnPropertyChanged(nameof(WorkoutPlans));
			}
		}
		public WorkoutViewModel( IDataTransferService dataTransferService)
        {
            _dataTransferService = dataTransferService;
            NavigateToWorkoutEditPageCommand = new Command(async () => await NavigateToWorkoutEditPage());
            workoutPlans = new ObservableCollection<WorkoutPlan>();
			Load();
        }
		private WorkoutPlan _selectedItem;
		public WorkoutPlan SelectedItem
		{
			get
			{
				return _selectedItem;
			}
			set
			{
				_selectedItem = value;
				OnPropertyChanged(nameof(SelectedItem));
				OnItemSelected();
			}
		}

        private async void OnItemSelected()
        {
            _dataTransferService.SetData(SelectedItem);
            await Shell.Current.GoToAsync("workoutRoutineList");
        }

        private async void Load()
        {
            var plans = await WorkoutAppDatabase.GetWorkoutPlans();
            foreach (var plan in plans)
            {
                workoutPlans.Add(plan);
            }
        }

        private async Task NavigateToWorkoutEditPage()
        {
            await Shell.Current.GoToAsync("createWorkout");
        }
    }
}
