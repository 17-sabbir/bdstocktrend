package iit.nstu.bdstocktrendbackend.security;

import java.io.IOException;
import java.util.regex.Pattern;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Order(Integer.MIN_VALUE)
@Component
public class SimpleCORSFilter implements Filter {

    private static final Logger LOGGER = LoggerFactory.getLogger(SimpleCORSFilter.class);
    private static final Pattern PATTERN = Pattern.compile("^[a-zA-Z0-9 ,-_]*$");

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) res;
        HttpServletRequest request = (HttpServletRequest) req;

        String origin;
        String credentialFlag;
        if (request.getHeader("Origin") == null) {
            origin = "*";
            credentialFlag = "false";
        } else {
            origin = request.getHeader("Origin");
            credentialFlag = "true";
        }

        // need to do origin.toString() to avoid findbugs error about response splitting
        response.addHeader("Access-Control-Allow-Origin", origin.toString());
        response.setHeader("Access-Control-Allow-Credentials", credentialFlag);
        if ("OPTIONS".equals(request.getMethod())) {
            LOGGER.info("Received OPTIONS request from origin:" + request.getHeader("Origin"));
            response.setHeader("Access-Control-Allow-Methods", "GET,POST,HEAD,OPTIONS,PUT,DELETE");
            response.setHeader("Access-Control-Max-Age", "3600");
            String headers = StringUtils.trimToEmpty(request.getHeader("Access-Control-Request-Headers"));
            if (!PATTERN.matcher(headers).matches()) {
                throw new ServletException("Invalid value provided for 'Access-Control-Request-Headers' header");
            }
            response.setHeader("Access-Control-Allow-Headers", headers); // allow any headers
        }
        chain.doFilter(req, res);
    }

    @Override
    public void init(FilterConfig filterConfig) {
        // Do nothing
    }

    @Override
    public void destroy() {
        // Do nothing
    }
}


