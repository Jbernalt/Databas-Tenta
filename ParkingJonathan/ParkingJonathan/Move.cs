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
    class Move
    {
        public static void MoveVehicle(string Regnum, int Spot)
        {
            string querystring =
                "SET XACT_ABORT ON " +
                    "BEGIN TRY " +
                        "BEGIN TRANSACTION " +
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

                            "Update Vehicle SET vehicle.SpotsID = @spot " +
                            "WHERE Vehicle.Regnum = @regnum " +

                            "Update Spots " +
                            "SET UsedSize = CASE " +
                                    "WHEN vt.VehicleTypeID = 1 Then UsedSize+50 " +
                                    "WHEN vt.VehicleTypeID = 2 Then UsedSize+100 " +
                                    "END " +
                            "FROM Vehicle v " +
                            "Join Spots s " +
                            "ON v.SpotsID = s.SpotsID " +
                            "join VehicleType vt " +
                            "ON v.VehicleTypeID = vt.VehicleTypeID " +
                            "WHERE s.SpotsID = @spot " +


                            "COMMIT TRANSACTION " +
                            "END TRY " +

                            "BEGIN CATCH " +
                                "Select* from Spots " +
                            "END CATCH";

            using (SqlConnection connection = new SqlConnection(Program.connectionString))
            {
                using (SqlCommand sqlCommand = new SqlCommand(querystring))
                {
                    try
                    {
                        sqlCommand.Connection = connection;

                        sqlCommand.Parameters.Add("@regnum", SqlDbType.NVarChar).Value = Regnum;
                        sqlCommand.Parameters.Add("@spot", SqlDbType.Int).Value = Spot;

                        connection.Open();
                        sqlCommand.ExecuteNonQuery();
                    }
                    catch
                    {
                        Console.WriteLine("Spot {0} is full", Spot);
                        Console.WriteLine();
                    }
                }
            }
        }
    }
}
