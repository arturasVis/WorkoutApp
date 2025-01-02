using WorkoutApp.ViewModels.WorkoutPageViewmodels;
namespace WorkoutApp.Views;

public partial class WorkoutView : ContentPage
{
	public WorkoutView(WorkoutViewModel workoutViewModel)
	{
		InitializeComponent();
        BindingContext = workoutViewModel;
    }
}