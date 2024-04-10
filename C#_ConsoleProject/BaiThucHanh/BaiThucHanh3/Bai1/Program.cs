namespace Bai1
{
    internal class Program
    {
        static void Process()
        {
            // Create 2 objects
            Circle c1 = new Circle();
            float r;

            Console.Write("Enter the radius: ");
            while (!float.TryParse(Console.ReadLine(), out r))
            {
                Console.WriteLine("Invalid input. Please enter again: ");
            }

            Circle c2 = new Circle(4);

            // Print info
            c1.Info();
            c2.Info();

            // Change the radius of c1
            Console.Write("Enter the radius (Update for object 1): ");
            while (!float.TryParse(Console.ReadLine(), out r))
            {
                Console.WriteLine("Invalid input. Please enter again: ");
            }

            c2.SetRadius(r);

            // Sum of 2 areas
            Console.WriteLine("Sum of 2 areas: " + (c1 + c2));
        }

        static void CalculateManyCircle()
        {
            ListCircle listCircle = new ListCircle();

            listCircle.Input();
            listCircle.Output();

            Console.WriteLine("Sum of perimeters: " + listCircle.SumPerimeter());

            Console.WriteLine("Circle with the largest area: ");
            listCircle.FindMaxArea();

        }

        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            Process();
            CalculateManyCircle();
        }
    }
}
