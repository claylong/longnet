# Intranet for the Long Family

This is an early (c. 2013) attempt at an intranet-style website
for the Long family.

## Overview

.Net based web application, using Microsoft's Account Services
and Entity framework.

Site structure is simple, and intended to allow for quick and
easy deployment of new web applciations inside the main 
solution.

Application specific behavior should be isolated to their own
projects so they can eventually be factored out of the main
solution (and hopefuly into a dependency package of some sort).