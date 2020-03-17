// Generated by gencpp from file web_robo/WebFeedback.msg
// DO NOT EDIT!


#ifndef WEB_ROBO_MESSAGE_WEBFEEDBACK_H
#define WEB_ROBO_MESSAGE_WEBFEEDBACK_H

#include <ros/service_traits.h>


#include <web_robo/WebFeedbackRequest.h>
#include <web_robo/WebFeedbackResponse.h>


namespace web_robo
{

struct WebFeedback
{

typedef WebFeedbackRequest Request;
typedef WebFeedbackResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct WebFeedback
} // namespace web_robo


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::web_robo::WebFeedback > {
  static const char* value()
  {
    return "46e643224170bf540f5f708583c1f716";
  }

  static const char* value(const ::web_robo::WebFeedback&) { return value(); }
};

template<>
struct DataType< ::web_robo::WebFeedback > {
  static const char* value()
  {
    return "web_robo/WebFeedback";
  }

  static const char* value(const ::web_robo::WebFeedback&) { return value(); }
};


// service_traits::MD5Sum< ::web_robo::WebFeedbackRequest> should match 
// service_traits::MD5Sum< ::web_robo::WebFeedback > 
template<>
struct MD5Sum< ::web_robo::WebFeedbackRequest>
{
  static const char* value()
  {
    return MD5Sum< ::web_robo::WebFeedback >::value();
  }
  static const char* value(const ::web_robo::WebFeedbackRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::web_robo::WebFeedbackRequest> should match 
// service_traits::DataType< ::web_robo::WebFeedback > 
template<>
struct DataType< ::web_robo::WebFeedbackRequest>
{
  static const char* value()
  {
    return DataType< ::web_robo::WebFeedback >::value();
  }
  static const char* value(const ::web_robo::WebFeedbackRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::web_robo::WebFeedbackResponse> should match 
// service_traits::MD5Sum< ::web_robo::WebFeedback > 
template<>
struct MD5Sum< ::web_robo::WebFeedbackResponse>
{
  static const char* value()
  {
    return MD5Sum< ::web_robo::WebFeedback >::value();
  }
  static const char* value(const ::web_robo::WebFeedbackResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::web_robo::WebFeedbackResponse> should match 
// service_traits::DataType< ::web_robo::WebFeedback > 
template<>
struct DataType< ::web_robo::WebFeedbackResponse>
{
  static const char* value()
  {
    return DataType< ::web_robo::WebFeedback >::value();
  }
  static const char* value(const ::web_robo::WebFeedbackResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // WEB_ROBO_MESSAGE_WEBFEEDBACK_H