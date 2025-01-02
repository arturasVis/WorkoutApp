using WorkoutApp.ViewModels.WorkoutPageViewmodels;
namespace WorkoutApp.Views;

public partial class WorkoutRoutineListView : ContentPage
{
	public WorkoutRoutineListView(WorkoutRoutineListViewModel workoutRoutineListViewModel)
	{
		InitializeComponent();
        BindingContext = workoutRoutineListViewModel;
    }
    protected override bool OnBackButtonPressed()
    {
        Shell.Current.GoToAsync("//workout");
        return true;
    }
}