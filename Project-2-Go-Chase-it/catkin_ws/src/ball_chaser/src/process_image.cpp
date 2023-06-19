#include "ros/ros.h"
#include "ball_chaser/DriveToTarget.h"
#include <sensor_msgs/Image.h>

// Define a global client that can request services
ros::ServiceClient client;

// This function calls the command_robot service to drive the robot in the specified direction
void drive_robot(float lin_x, float ang_z)
{
    ROS_INFO("Receiving Robot movement");
    
    // Request a service and pass the velocities to it to drive the robot
    ball_chaser::DriveToTarget srv;
    srv.request.linear_x = lin_x;
    srv.request.angular_z = ang_z;

    if( !client.call(srv) )
    {
      ROS_ERROR("Failed to call drive_robot Service");
    }
}

// This callback function continuously executes and reads the image data
void process_image_callback(const sensor_msgs::Image img)
{
    int img_section = img.width / 3;
    bool ball_found = false;

    // Loop through each pixel in the image and check if there's a bright white one
    for (int i = 0; i < img.data.size() - 2; i+=3)
    {
        uint8_t red = img.data[i];
        uint8_t green = img.data[i + 1];
        uint8_t blue = img.data[i + 2];
        // Red channel
        if ( red == 255 && green == 255 && blue == 255 )
        {
            ball_found = true;

            // Identify if this pixel falls in the left, mid, or right side of the image
            int pixel = i % img.width;
            // Depending on the white ball position, call the drive_bot function and pass velocities to it
            if (pixel <= img_section)
            {
                // Lies within the left side of the image
                std::cout  << "Left" << std::endl;
                drive_robot(0.0, 0.2);
            }
            else if (pixel > img_section && pixel <= 2 * img_section)
            {
                // Lies within the center of the image
                std::cout  << "Center" << std::endl;
                drive_robot(0.2, 0.0);
            }
            else
            {
                // Lies within the right side of the image
                std::cout  << "Right" << std::endl;
                drive_robot(0.0, -0.2);
            }
            return;
        }
    }
    
    // Request a stop when there's no white ball seen by the camera
    if (!ball_found)
    {
        drive_robot(0.0, 0.0);
    }
    return;
}

int main(int argc, char** argv)
{
    // Initialize the process_image node and create a handle to it
    ros::init(argc, argv, "process_image");
    ros::NodeHandle n;

    // Define a client service capable of requesting services from command_robot
    client = n.serviceClient<ball_chaser::DriveToTarget>("/ball_chaser/command_robot");

    // Subscribe to /camera/rgb/image_raw topic to read the image data inside the process_image_callback function
    ros::Subscriber subscriber = n.subscribe<sensor_msgs::Image>("/camera/rgb/image_raw", 10, process_image_callback);
    
    // Handle ROS communication events
    ros::spin();

    return 0;
}