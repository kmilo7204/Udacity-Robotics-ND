#include <gazebo/gazebo.hh>

namespace gazebo
{
    class WelcomePlugin : public WorldPlugin
    {
        public:
            // Constructor
            WelcomePlugin() : WorldPlugin()
            {
                printf("Welcome to Camilo's Office simulation");
            }
        public:
            void Load(physics::WorldPtr _world, sdf::ElementPtr _sdf) {}
    };
    
    // Register the plugin with the Simulator
    GZ_REGISTER_WORLD_PLUGIN(WelcomePlugin)
}