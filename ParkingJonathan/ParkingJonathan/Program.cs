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
    class Program
    {
        public static string connectionString =
       @"Data Source=DESKTOP-7OOHLF8\SQLEXPRESS;Initial Catalog=ParkingJonathan;Integrated Security=True";

        static void Main()
        {
            string getregnum;

            while (true)
            {
                Console.WriteLine(
                    "1: Add Vehicle\n" +
                    "2: Remove Vehicle\n" +
                    "3: Show Spots\n" +
                    "4: Search Vehicle\n" +
                    "5: Move Vehicle\n" +
                    "6: Show History\n"
                    );
                
                
                switch (Console.ReadLine())
                { 
                    case "1":
                        Console.Clear();
                        Console.WriteLine("Type: \n\t1 For MC" +
                                                "\n\t2 For Car");
                        switch (Console.ReadLine())
                        {
                            case "1":
                                    Console.Clear();
                                    Console.WriteLine("Enter Your License Plate");
                                    getregnum = Console.ReadLine();
                                    Console.WriteLine();
                                    RegInput(getregnum);
                                    if (RegInput(getregnum) == false)
                                    {
                                        Console.Clear();
                                        Console.WriteLine("Incorrect Input, Input should be 10 or less characters \nTry Again");
                                        Console.WriteLine();
                                        break;
                                    }
                                    MC.AddMC(getregnum);
                                    break;
                                

                            case "2":
                                Console.Clear();
                                Console.WriteLine("Enter Your License Plate");
                                getregnum = Console.ReadLine();
                                Console.WriteLine();
                                RegInput(getregnum);
                                if (RegInput(getregnum) == false)
                                {
                                    Console.WriteLine();
                                    Console.WriteLine("Incorrect Input, Input should be 10 or less characters \nTry Again");
                                    Console.WriteLine();
                                    break;
                                }
                                Car.AddCar(getregnum);
                                break;

                            default:
                                Console.WriteLine("Incorrect Input Try Again!");
                                Console.WriteLine();
                                break;
                        }
                        break;

                    case "2":
                        Console.Clear();
                        Console.WriteLine("Enter your License Plate");
                        getregnum = Console.ReadLine();
                        Remove.RemoveVehicle(getregnum);
                        break;

                    case "3":
                        Spots.ShowSpots();
                        break;

                    case "4":
                        Console.WriteLine("Enter your License Plate");
                        getregnum = Console.ReadLine();
                        Search.SearchVehicle(getregnum);
                        break;

                    case "5":
                        Console.Clear();
                        Console.WriteLine("Enter your License Plate");
                        getregnum = Console.ReadLine();
                        Console.WriteLine("Enter the spot you want to move to");
                        int getspot = int.Parse(Console.ReadLine());
                        Move.MoveVehicle(getregnum, getspot);
                        break;

                    case "6":
                        History.ShowHistory();
                        break;

                    default:
                        Console.WriteLine("Wrong Input Try Again!");
                        Console.WriteLine();
                        break;
                }
            }
        }

        static bool RegInput(string regnum)
        {
            int RegLenght = regnum.Length;
            bool Nospace = regnum.Contains(" ");
            Regex reg = new Regex(@"^[a-zA-Z0-9]+$");

            if (RegLenght <= 10 && RegLenght >= 1 && Nospace == false && reg.Match(regnum).Success)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
