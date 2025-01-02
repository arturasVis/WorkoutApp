using WorkoutApp.ViewModels.WorkoutPageViewmodels;
namespace WorkoutApp.Views;

public partial class CreateWorkoutPage : ContentPage
{
	public CreateWorkoutPage(CreateWorkoutPageViewModel createWorkoutPage)
	{
		InitializeComponent();
        BindingContext = createWorkoutPage;
    }
}