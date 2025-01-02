
using WorkoutApp.Views;
using WorkoutApp.UserControls;

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
            Routing.RegisterRoute("createWorkout", typeof(CreateWorkoutPage));
            Routing.RegisterRoute("workoutRoutineList", typeof(WorkoutRoutineListView));
        }
    }
}
