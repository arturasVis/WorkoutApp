using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WorkoutApp.Models;
using WorkoutApp.Resources.Database;

namespace WorkoutApp.ViewModels
{
    public class ExerciseItemViewModel : BaseViewModel
    {
        private WorkoutAppDatabase _database;
        public ExerciseItemViewModel()
        {
        }
        public static async Task<ExerciseItemViewModel> CreateExerciseItemViewModelAsync(int id,ExercisesItem item, WorkoutAppDatabase database)
        {
            ExerciseItemViewModel exerciseItem = new ExerciseItemViewModel();
            exerciseItem.Id = id;
            exerciseItem.Name = item.Name;
            exerciseItem.Description = item.Description;
            exerciseItem._database = database;
            await exerciseItem.UpdateCategory(item.CategoryFK);
            await exerciseItem.UpdateMuscleGroup(item.MuscleGroupFK);
            return exerciseItem;
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public ExcerciseCategories Category { get; set; }
        public MuscleGroups MuscleGroup { get; set; }
        public string Description { get; set; }

        public async Task UpdateCategory(int categoryFk)
        {
            Category = (await _database.GetCategoryNameByIdAsync(categoryFk));
        }
        public async Task UpdateMuscleGroup(int muscleGroupFk)
        {
            MuscleGroup = (await _database.GetMuscleGroupNameByIdAsync(muscleGroupFk));
        }

    }
}
