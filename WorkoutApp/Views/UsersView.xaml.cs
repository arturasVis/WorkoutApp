using WorkoutApp.ViewModels;
namespace WorkoutApp.Views;

public partial class UsersView : ContentPage
{
	public UsersView(UsersViewModel usersViewModel)
	{
		InitializeComponent();
        BindingContext = usersViewModel;
    }
}