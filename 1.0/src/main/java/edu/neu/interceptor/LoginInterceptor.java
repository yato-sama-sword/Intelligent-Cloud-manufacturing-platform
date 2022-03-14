package edu.neu.interceptor;

import edu.neu.pojo.Userinfo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {
        @Override
        public boolean preHandle(HttpServletRequest request,
                                 HttpServletResponse response, Object handler) throws Exception {
            // 获取请求的URL
            String url = request.getRequestURI();
            System.out.println(url);
            // URL:除了view.jsp和reg.jsp是可以公开访问的，其它的URL都进行拦截控制
            if(url.contains("/view") || url.contains("/reg") ||
                    url.contains("/toReg") || url.contains("/toView")){
                return true;
            }
            // 获取Session
            HttpSession session = request.getSession();
            Userinfo userinfo = (Userinfo) session.getAttribute("userinfo");
            // 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
            if(userinfo != null){
                return true;
            }
            // 不符合条件的给出提示信息，并转发到登录
            request.setAttribute("msg", "您还没有登录，请先登录！");
            request.getRequestDispatcher("/login/toView").forward(request,response);
            return false;
        }
        @Override
        public void postHandle(HttpServletRequest request,
                               HttpServletResponse response, Object handler,
                               ModelAndView modelAndView) throws Exception {
        }
        @Override
        public void afterCompletion(HttpServletRequest request,
                                    HttpServletResponse response, Object handler, Exception ex)
                throws Exception {
        }
    }


