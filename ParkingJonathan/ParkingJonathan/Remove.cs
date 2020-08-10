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
    class Remove
    {
        public static void RemoveVehicle(string Regnum)
        {
            string querystring =
                "BEGIN TRAN [Tran1] " +
                    "BEGIN TRY " +
                        "INSERT INTO History(h.VehicleID, h.SpotsID, h.VehicleTypeID, h.Regnum, h.StartTime, h.EndTime, h.CostTotal) " +
                        "SELECT v.VehicleID, v.SpotsID, v.VehicleTypeID, v.Regnum, v.StartTime, GETDATE(), " +
                            "CASE " +
                                "WHEN DATEDIFF(MINUTE, v.StartTime, GETDATE()) <= 5 THEN 0 " +
                                "WHEN DATEDIFF(MINUTE, StartTime, GETDATE()) < 120 THEN Cost * 2 " +
                                "ELSE((DATEDIFF(MINUTE, v.StartTime, GETDATE()) / 60) + 1) * Cost " +
                                "END " +

                        "FROM Vehicle v " +
                        "LEFT Join History h " +
                        "ON v.VehicleID = h.VehicleID " +
                        "join VehicleType vt " +
                        "on v.VehicleTypeID = vt.VehicleTypeID " +
                        "Where v.Regnum = @regnum " +

                        "UPDATE Spots " +
                            "SET UsedSize = CASE " +
                                "WHEN vt.VehicleTypeID = 1 Then UsedSize-50 " +
                                "WHEN vt.VehicleTypeID = 2 Then UsedSize-100 " +
                                "END " +
                        "FROM Vehicle v " +
                        "Join Spots s " +
                        "ON v.SpotsID = s.SpotsID " +
                        "join VehicleType vt " +
                        "ON v.VehicleTypeID = vt.VehicleTypeID " +
                        "Where v.Regnum = @regnum " +

                        "DELETE FROM Vehicle " +
                        "Where Vehicle.Regnum = @regnum " +

                        "COMMIT TRAN [Tran1] " +
                    "END TRY " +

                    "BEGIN CATCH " +
                        "ROLLBACK TRAN [Tran1] " +
                    "END CATCH ";

            using (SqlConnection connection = new SqlConnection(Program.connectionString))
            {
                using (SqlCommand command = new SqlCommand(querystring, connection))
                {
                    try
                    {
                        connection.Open();
                        command.Parameters.AddWithValue("@regnum", Regnum);
                        command.ExecuteNonQuery();
                    }
                    catch(Exception exp)
                    {
                        Console.WriteLine(exp);
                    }
                }
            }
            Console.WriteLine();
        }
    }
}
