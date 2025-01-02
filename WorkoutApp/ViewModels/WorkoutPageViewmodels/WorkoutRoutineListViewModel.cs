using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WorkoutApp.Models;
using WorkoutApp.Resources.Services;

namespace WorkoutApp.ViewModels.WorkoutPageViewmodels
{
    public class WorkoutRoutineListViewModel: BaseViewModel
    {
        private readonly IDataTransferService _dataTransferService;
        private WorkoutPlan _workoutPlan;
		public WorkoutPlan WorkoutPlan
		{
			get
			{
				return _workoutPlan;
			}
			set
			{
				_workoutPlan = value;
				OnPropertyChanged(nameof(WorkoutPlan));
			}
		}
		public WorkoutRoutineListViewModel(IDataTransferService dataTransferService)
        {
            WorkoutPlan = new WorkoutPlan();
            _dataTransferService = dataTransferService;
            _workoutPlan = _dataTransferService.GetData<WorkoutPlan>();

        }
    }
}
