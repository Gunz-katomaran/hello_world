// Generated by gencpp from file patrol_planner/Obstacle.msg
// DO NOT EDIT!


#ifndef PATROL_PLANNER_MESSAGE_OBSTACLE_H
#define PATROL_PLANNER_MESSAGE_OBSTACLE_H

#include <ros/service_traits.h>


#include <patrol_planner/ObstacleRequest.h>
#include <patrol_planner/ObstacleResponse.h>


namespace patrol_planner
{

struct Obstacle
{

typedef ObstacleRequest Request;
typedef ObstacleResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Obstacle
} // namespace patrol_planner


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::patrol_planner::Obstacle > {
  static const char* value()
  {
    return "4a4b2bdf33b9dce4f3e033bed4cd41b8";
  }

  static const char* value(const ::patrol_planner::Obstacle&) { return value(); }
};

template<>
struct DataType< ::patrol_planner::Obstacle > {
  static const char* value()
  {
    return "patrol_planner/Obstacle";
  }

  static const char* value(const ::patrol_planner::Obstacle&) { return value(); }
};


// service_traits::MD5Sum< ::patrol_planner::ObstacleRequest> should match 
// service_traits::MD5Sum< ::patrol_planner::Obstacle > 
template<>
struct MD5Sum< ::patrol_planner::ObstacleRequest>
{
  static const char* value()
  {
    return MD5Sum< ::patrol_planner::Obstacle >::value();
  }
  static const char* value(const ::patrol_planner::ObstacleRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::patrol_planner::ObstacleRequest> should match 
// service_traits::DataType< ::patrol_planner::Obstacle > 
template<>
struct DataType< ::patrol_planner::ObstacleRequest>
{
  static const char* value()
  {
    return DataType< ::patrol_planner::Obstacle >::value();
  }
  static const char* value(const ::patrol_planner::ObstacleRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::patrol_planner::ObstacleResponse> should match 
// service_traits::MD5Sum< ::patrol_planner::Obstacle > 
template<>
struct MD5Sum< ::patrol_planner::ObstacleResponse>
{
  static const char* value()
  {
    return MD5Sum< ::patrol_planner::Obstacle >::value();
  }
  static const char* value(const ::patrol_planner::ObstacleResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::patrol_planner::ObstacleResponse> should match 
// service_traits::DataType< ::patrol_planner::Obstacle > 
template<>
struct DataType< ::patrol_planner::ObstacleResponse>
{
  static const char* value()
  {
    return DataType< ::patrol_planner::Obstacle >::value();
  }
  static const char* value(const ::patrol_planner::ObstacleResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PATROL_PLANNER_MESSAGE_OBSTACLE_H
