<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <div class="mui-appbar mui--appbar-line-height" style="background-color: #39A0AA">
            <div class="mui-container-fluid" style="background-color: #39A0AA">
                <div style="width:100%">
                    
                    <div style="float:left">
                        <div>
                            <div style="float:left">
                                <img src="<c:url value="/resources/images/logo.png"/>" height="80">
                            </div>
                            
                            <div style="clear: both"> </div>
                        </div>
                    </div>

                    <div style="float:right" class="mui--hidden-xs">
                        <img src="<c:url value="/resources/images/logo2.png"/>" height="80">
                    </div>
                    <div style="float:right" class="mui--visible-xs-block">
                        <span  style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Menu</span>                                               
                    </div>
                    <div style="clear: both"> </div>
                </div>
            </div>
        </div>