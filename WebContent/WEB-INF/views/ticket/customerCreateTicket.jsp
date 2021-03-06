<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@ include file="/WEB-INF/includes/doctype.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>TruConnect Coupon Management</title>
<%@ include file="/WEB-INF/includes/headTags.jsp"%>
  <script type="text/javascript" src="<spring:url value="/static/javascript/setupForms.js" />"></script>
  <script type="text/javascript" src="<spring:url value="/static/javascript/pages/addCoupon.js" />"></script>
</head>
<body>
  <%@ include file="/WEB-INF/includes/popups.jsp"%>
  <%@ include file="/WEB-INF/includes/header.jsp"%>

  <div class="blueTruConnectGradient">
    <div class="container">Please Describe Your Issue Specifically</div>
  </div>

  <div class="container">
    <div id="main-content">
      <div class="span-18 colborder">
        <form:form id="customerCreateTicket" cssClass="validatedForm" method="post" commandName="ticket">
          <!-- Error Alert -->
          <c:if test="${not empty requestScope['org.springframework.validation.BindingResult.ticket'].allErrors}">
            <div class="row">
              <div class="alert error">
                <h1>Please correct the following problems</h1>
                <form:errors path="category" />
                <form:errors path="description" />
                <!-- Global Errors -->
                <spring:bind path="ticket">
                  <c:forEach items="${status.errorMessages}" var="error" varStatus="status">
                    <span id="global.${status.index}.errors"><c:out value="${error}" /> </span>
                  </c:forEach>
                </spring:bind>
              </div>
            </div>
          </c:if>
          <!-- <div class="slider" style="height: 250px;">-->
          <!-- <h3 style="margin-bottom: 10px; padding-bottom: 0px;">Please Describe Your Issue Specifically</h3>-->
          <div class="row">
            <form:label path="category">Category</form:label>
            <form:select path="category" cssClass="span-8" cssErrorClass="span-8 validationFailed" cssStyle="width:312px;">
               <option value="0" selected="selected">Select One</option>            
               <c:forEach var="category" items="${categoryList}" varStatus="status">  
                  <form:option value="${category}">${category}</form:option>
               </c:forEach>   
            </form:select>
          </div>
          <div class="row">
            <form:label path="description" cssClass="required">Description</form:label>
            <form:textarea path="description" cssClass="span-9" cssErrorClass="span-8 validationFailed"/>
          </div>         
          <div class="buttons">
            <a id="customerCreateTicketButton" href="#" class="button action-m"><span>Submit</span></a> 
            <input id="customerCreateTicketSubmit" type="submit" name="_eventId_submit" value="Continue" class="hidden" />
          </div>
          <!--</div>-->
        </form:form>
      </div>
      <div class="span-6 last sub-navigation">
        <span style="float: right; float: bottom;"><%@ include file="/WEB-INF/includes/navigation/accountNav.jsp"%></span>
      </div>
    </div>
    <%@ include file="/WEB-INF/includes/footer_nolinks.jsp"%>
  </div>
</body>
</html>