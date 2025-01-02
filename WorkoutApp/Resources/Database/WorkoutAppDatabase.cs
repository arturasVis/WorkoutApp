using SQLite;
using WorkoutApp.Models;
using WorkoutApp.Resources.Helpers;

namespace WorkoutApp.Resources.Database
{
    public class WorkoutAppDatabase
    {
        SQLiteAsyncConnection _database;

        public WorkoutAppDatabase()
        {
        }
        async Task Init()
        {
            if (_database is not null)
                return;

            _database = new SQLiteAsyncConnection(Constants.DatabasePath, Constants.Flags);
            await _database.CreateTableAsync<ExercisesItem>();
            await _database.CreateTableAsync<ExcerciseCategories>();
            await _database.CreateTableAsync<MuscleGroups>();
            await _database.CreateTableAsync<User>();
            await Preload();
        }
        public async Task<List<ExercisesItem>> GetExerciseItemsAsync()
        {
            await Init();
            return await _database.Table<ExercisesItem>().ToListAsync();
            
        }
        public async Task<List<ExcerciseCategories>> GetExcerciseCategories()
        {
            await Init();
            return await _database.Table<ExcerciseCategories>().ToListAsync();
        }
        public async Task<List<MuscleGroups>> GetMuscleGroups()
        {
            await Init();
            return await _database.Table<MuscleGroups>().ToListAsync();
        }
        public async Task<ExercisesItem> GetItemAsync(int id)
        {
            await Init();
            return await _database.Table<ExercisesItem>()
                            .Where(i => i.Id == id)
                            .FirstOrDefaultAsync();
        }

        public async Task<int> SaveItemAsync(ExercisesItem item)
        {
            await Init();

            if (item.Id != 0)
            {
                await _database.UpdateAsync(item);
                return item.Id;
            }
            else
            {
                int newId = await _database.InsertAsync(item);
                return item.Id != 0 ? item.Id : newId;
            }
        }


        public async Task<int> DeleteItemAsync(ExercisesItem item)
        {
            await Init();
            return await _database.DeleteAsync(item);
        }
        public async Task<int> DeleteAllItemsAsync()
        {
            await Init();
            return await _database.DeleteAllAsync<ExercisesItem>();
        }

        internal async Task<ExcerciseCategories> GetCategoryNameByIdAsync(int v)
        {
            await Init();
            return await _database.Table<ExcerciseCategories>()
                            .Where(i => i.Id == v)
                            .FirstOrDefaultAsync();
        }

        internal async Task<MuscleGroups> GetMuscleGroupNameByIdAsync(int v)
        {
            await Init();
            return await _database.Table<MuscleGroups>()
                            .Where(i => i.Id == v)
                            .FirstOrDefaultAsync();
        }
        private async Task Preload()
        {
            int ExcerciseCategoriesCount = await _database.Table<ExcerciseCategories>().CountAsync();
            int MuscleGroupsCount = await _database.Table<MuscleGroups>().CountAsync();
            if(ExcerciseCategoriesCount == 0)
            {
                await _database.InsertAllAsync(new List<ExcerciseCategories>
                {
                    new ExcerciseCategories { Name = "Cardio" },
                    new ExcerciseCategories { Name = "Strength" },
                    new ExcerciseCategories { Name = "Flexibility" },
                    new ExcerciseCategories { Name = "Balance"}
                });
            }
            if (MuscleGroupsCount == 0)
            {
                await _database.InsertAllAsync(new List<MuscleGroups>
                {
                    new MuscleGroups { Name = "Chest" },
                    new MuscleGroups { Name = "Back" },
                    new MuscleGroups { Name = "Hamstrings" },
                    new MuscleGroups { Name = "Quads" },
                    new MuscleGroups { Name = "Calves" },
                    new MuscleGroups { Name = "Glutes" },
                    new MuscleGroups { Name = "Shoulders" },
                    new MuscleGroups { Name = "Triceps" },
                    new MuscleGroups { Name = "Biceps" },
                    new MuscleGroups { Name = "Abs" }
                });
            }
        }
        private async Task DeleteEveryhting()
        {
            await _database.Table<ExcerciseCategories>().DeleteAsync(i => i.Id > 0);
            await _database.Table<MuscleGroups>().DeleteAsync(i => i.Id > 0);
            await _database.Table<ExercisesItem>().DeleteAsync(i => i.Id > 0);

        }

        internal async Task<int> InsertUserAsync(User item)
        {
            await Init();
            if (item.Id != 0)
            {
                await _database.UpdateAsync(item);
                return item.Id;
            }
            else
            {
                int newId = await _database.InsertAsync(item);
                return item.Id != 0 ? item.Id : newId;
            }
        }

        internal async Task<List<User>> GetUsersAsync()
        {
            await Init();
            return await _database.Table<User>().ToListAsync();
        }

        internal async Task DeleteUserAsync(User exercisesItem)
        {
            await Init();
            await _database.DeleteAsync(exercisesItem);
        }
    }
}
