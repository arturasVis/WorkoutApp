using WorkoutApp.ViewModels;
namespace WorkoutApp.Views;

public partial class MainPage : ContentPage
{

    public MainPage(HomePageViewModel homePageViewModel)
    {
        InitializeComponent();
        BindingContext = homePageViewModel;
    }
}

