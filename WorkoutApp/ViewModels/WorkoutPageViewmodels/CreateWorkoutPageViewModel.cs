using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using WorkoutApp.Models;
using WorkoutApp.Resources.Database;
using WorkoutApp.Resources.Services;

namespace WorkoutApp.ViewModels.WorkoutPageViewmodels
{
    public class CreateWorkoutPageViewModel : BaseViewModel
    {
        private readonly IDataTransferService _dataTransferService;
        WorkoutAppDatabase database = new WorkoutAppDatabase();
        private string name;
		public string Name
		{
			get
			{
				return name;
			}
			set
			{
				name = value;
				OnPropertyChanged(nameof(Name));
			}
		}
		private string _description;
		public string Description
		{
			get
			{
				return _description;
			}
			set
			{
				_description = value;
				OnPropertyChanged(nameof(Description));
			}
		}
		public ICommand SaveWorkoutCommand { get; set; }

        public CreateWorkoutPageViewModel( IDataTransferService dataTransferService)
        {
            _dataTransferService = dataTransferService;
            SaveWorkoutCommand = new Command(async () => await SaveWorkout());
        }

        private async Task SaveWorkout()
        {
            WorkoutPlan workoutPlan = new WorkoutPlan()
            {
                Name = Name,
                Description = Description
            };
			if(name == null || name == "" || Description == null || Description == "")
			{
                return;
            }
            await database.SaveWorkoutPlan(workoutPlan);
			_dataTransferService.SetData(workoutPlan);
            await Shell.Current.GoToAsync("workoutRoutineList");
        }
    }
}
