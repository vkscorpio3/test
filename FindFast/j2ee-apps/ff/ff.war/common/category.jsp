<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ taglib uri="/fenderTaglib" prefix="fender" %>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/userprofiling/ProfileErrorMessageForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

<%@ page import="atg.servlet.*" %>
<dsp:page>


<div class="left_content">

<dsp:droplet name="Switch">
    <dsp:param bean="ProfileFormHandler.profile.transient" name="value"/>
    <dsp:oparam name="false">
	<div class="title_box">Welcome Back</div>
        <ul class="left_menu">
	<li class="even">
	
	<a href="/ff/user/update.jsp"><dsp:valueof bean="Profile.login"/></a>
	</li>
	</ul>
    </dsp:oparam>
    <dsp:oparam name="true">
    <div class="title_box">User Login</div>
<dsp:droplet name="Switch">
          <dsp:param bean="ProfileFormHandler.formError" name="value"/>
          <dsp:oparam name="true">
            <font color="cc0000"><strong><ul>
              <dsp:droplet name="ProfileErrorMessageForEach">
                <dsp:param bean="ProfileFormHandler.formExceptions" name="exceptions"/>
                <dsp:oparam name="output">
                  <li> <dsp:valueof param="message"/>
                </dsp:oparam>
              </dsp:droplet>
            </ul></strong></font>
          </dsp:oparam>
        </dsp:droplet>
    <dsp:form id="login" method="post" action="/ff/index.jsp">

		<label> Login </label><dsp:input type="text" bean="ProfileFormHandler.value.login" /><br>
		<label> Password</label><dsp:input type="password" bean="ProfileFormHandler.value.password"/><br>
		 <dsp:input type="submit" bean="ProfileFormHandler.Login" value="Login"/>
	
    </dsp:form>
    </dsp:oparam>
</dsp:droplet>

<dsp:droplet name="/atg/commerce/catalog/CategoryLookup">
	<dsp:param name="id" value="cat3002" />
	<dsp:oparam name="output">
	</dsp:oparam>
</dsp:droplet>
    <div class="title_box">Categories</div>
    
        <ul class="left_menu">

		<% int i=0; %>
			<dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
			  <dsp:param name="queryRQL" value="ALL"/>
			<dsp:param name="repository" bean="/atg/commerce/catalog/ProductCatalog"/>
			<dsp:param name="itemDescriptor" value="category"/>
				<dsp:oparam name="output">
				<% i++;
					if(i%2==0){
					%>
					<li class="even">
					<% } else {%>
					<li class="odd">
					<% } %>
					<dsp:a href="/ff/catalog/display_product.jsp">
					<dsp:param name="category_id" param="element.repositoryId"/>
					<dsp:valueof param="element.displayName"/>
					</dsp:a>
					</li>
				</dsp:oparam>
				<dsp:oparam name="empty">
					Empty
				</dsp:oparam>
			</dsp:droplet>
        </ul> 
        
        
     <div class="title_box">Special Products</div>  
     <div class="border_box">
         <div class="product_title"><a href="details.html">Makita 156 MX-VL</a></div>
         <div class="product_img"><a href="details.html"><img src="/ff/css/tools_shop/images/p1.jpg" alt="" title="" border="0" /></a></div>
         <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
     </div>  
     
     
     <div class="title_box">Newsletter</div>  
     <div class="border_box">

		<input type="text" name="newsletter" class="newsletter_input" value="your email"/>
        <a href="#" class="join">subscribe</a>
     </div>  
     
     <div class="banner_adds">
     
     <a href="#"><img src="/ff/css/tools_shop/images/bann2.jpg" alt="" title="" border="0" /></a>
     </div>    
        
    
   </div><!-- end of left content --> 

</div>


</dsp:page>
