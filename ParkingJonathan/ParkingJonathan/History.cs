using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ParkingJonathan
{
    class History
    {
        public static void ShowHistory()
        {
            string querystring =
                            "SELECT * " +
                            "FROM History";

            using (SqlConnection connection = new SqlConnection(Program.connectionString))
            {
                using (SqlCommand command = new SqlCommand(querystring, connection))
                {
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        Console.WriteLine();
                        Console.WriteLine("H_ID \tV_ID \tSpotsID \tVT_ID \tRegnum \t\tStartTime \t\tEndTime \t\tCosttotal");
                        Console.WriteLine("----------------------------------------------------------------------------------------------------------");
                        while (reader.Read())
                        {
                            Console.WriteLine("{0} \t{1} \t{2} \t\t{3} \t{4} \t\t{5} \t{6} \t{7}", reader[0], reader[1], reader[2], reader[3], reader[4], reader[5], reader[6], reader[7]);
                        }
                        reader.Close();
                    }
                    catch (Exception exp)
                    {
                        Console.WriteLine(exp);
                    }
                }
            }
            Console.WriteLine();

        }
    }
}
