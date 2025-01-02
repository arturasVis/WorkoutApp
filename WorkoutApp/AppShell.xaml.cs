
using WorkoutApp.Views;

namespace WorkoutApp
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            RegisterRoutes();
        }

        private void RegisterRoutes()
        {
            Routing.RegisterRoute("home", typeof(MainPage));
            Routing.RegisterRoute("workout", typeof(WorkoutView));
            Routing.RegisterRoute("exercises", typeof(ExercisesView));
            Routing.RegisterRoute("users", typeof(UsersView));
        }
    }
}
