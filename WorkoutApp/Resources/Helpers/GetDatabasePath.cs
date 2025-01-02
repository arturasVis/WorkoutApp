using System.Reflection;

namespace WorkoutApp.Resources.Helpers
{
    public class DatabaseHelper
    {
        public static string GetDatabasePath()
        {
            // Get the writable folder path
            string folderPath = FileSystem.AppDataDirectory;
            string databasePath = Path.Combine(folderPath, "WorkoutApp.db3");

            // Check if the database already exists
            if (!File.Exists(databasePath))
            {
                // Get the resource stream of the database
                using Stream stream = Assembly.GetExecutingAssembly()
                    .GetManifestResourceStream("WorkoutApp.Resources.Database.WorkoutApp.db3");

                // Copy the database to the writable location
                using FileStream outputFile = File.Create(databasePath);
                stream.CopyTo(outputFile);
            }

            return databasePath;
        }
    }
}
