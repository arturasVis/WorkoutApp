using WorkoutApp.Views;

namespace WorkoutApp
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
            
            MainPage = new AppShell();
            AppShell.Current.GoToAsync("//users");
        }
    }
}
