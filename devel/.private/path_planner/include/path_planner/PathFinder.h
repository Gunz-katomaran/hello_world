// Generated by gencpp from file path_planner/PathFinder.msg
// DO NOT EDIT!


#ifndef PATH_PLANNER_MESSAGE_PATHFINDER_H
#define PATH_PLANNER_MESSAGE_PATHFINDER_H

#include <ros/service_traits.h>


#include <path_planner/PathFinderRequest.h>
#include <path_planner/PathFinderResponse.h>


namespace path_planner
{

struct PathFinder
{

typedef PathFinderRequest Request;
typedef PathFinderResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct PathFinder
} // namespace path_planner


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::path_planner::PathFinder > {
  static const char* value()
  {
    return "e90150a274192f3b93435f5aadb8f247";
  }

  static const char* value(const ::path_planner::PathFinder&) { return value(); }
};

template<>
struct DataType< ::path_planner::PathFinder > {
  static const char* value()
  {
    return "path_planner/PathFinder";
  }

  static const char* value(const ::path_planner::PathFinder&) { return value(); }
};


// service_traits::MD5Sum< ::path_planner::PathFinderRequest> should match 
// service_traits::MD5Sum< ::path_planner::PathFinder > 
template<>
struct MD5Sum< ::path_planner::PathFinderRequest>
{
  static const char* value()
  {
    return MD5Sum< ::path_planner::PathFinder >::value();
  }
  static const char* value(const ::path_planner::PathFinderRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::path_planner::PathFinderRequest> should match 
// service_traits::DataType< ::path_planner::PathFinder > 
template<>
struct DataType< ::path_planner::PathFinderRequest>
{
  static const char* value()
  {
    return DataType< ::path_planner::PathFinder >::value();
  }
  static const char* value(const ::path_planner::PathFinderRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::path_planner::PathFinderResponse> should match 
// service_traits::MD5Sum< ::path_planner::PathFinder > 
template<>
struct MD5Sum< ::path_planner::PathFinderResponse>
{
  static const char* value()
  {
    return MD5Sum< ::path_planner::PathFinder >::value();
  }
  static const char* value(const ::path_planner::PathFinderResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::path_planner::PathFinderResponse> should match 
// service_traits::DataType< ::path_planner::PathFinder > 
template<>
struct DataType< ::path_planner::PathFinderResponse>
{
  static const char* value()
  {
    return DataType< ::path_planner::PathFinder >::value();
  }
  static const char* value(const ::path_planner::PathFinderResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PATH_PLANNER_MESSAGE_PATHFINDER_H
