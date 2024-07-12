/**
 * The contents of this file are subject to the license and copyright
 * detailed in the LICENSE and NOTICE files at the root of the source
 * tree and available online at
 * <p>
 * http://www.dspace.org/license/
 */

package org.dspace.saml2;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dspace.services.ConfigurationService;
import org.dspace.services.factory.DSpaceServicesFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

/**
 * Failure handler for SAML authentication.
 * <p>
 * When a SAML authentication fails:
 * </p>
 * <ul>
 * <li>Log the error message and redirect to frontend.</li>
 * </ul>
 *
 * @author Mark Cooper
 */
public class DSpaceSamlAuthenticationFailureHandler implements AuthenticationFailureHandler {
    private static final Logger logger = LoggerFactory.getLogger(DSpaceSamlAuthenticationFailureHandler.class);

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {
        logger.error("SAML authentication failed: {}", exception.getMessage());

        // At least for this testing we'll just redirect to the frontend login page.
        // This will not help the user understand what went wrong, but the default error page is a 404 with DSpace.
        ConfigurationService configurationService = DSpaceServicesFactory.getInstance().getConfigurationService();
        response.sendRedirect(configurationService.getProperty("dspace.ui.url") + "/login");
    }
}
