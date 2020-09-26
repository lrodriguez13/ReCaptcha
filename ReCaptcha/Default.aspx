<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ReCaptcha._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

    
   <div id="ReCaptchContainer"></div>  
    <div class="g-recaptcha" data-sitekey="6LcelNAZAAAAAOlRYbbBQ2uvB74Nb_Gr_zJu1owX"></div> 
    <label id="lblMessage" runat="server" clientidmode="static"></label>  
    <br />  
<button type="button" >Submit</button>  
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>   

    <script src="https://www.google.com/recaptcha/api.js?onload=renderRecaptcha&render=explicit" async defer></script> 

    <script  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>  
 
<script type="text/javascript">  
    var your_site_key = '<%= ConfigurationManager.AppSettings["SiteKey"]%>';  
    var renderRecaptcha = function () {  
        grecaptcha.render('ReCaptchContainer', {  
            'sitekey': your_site_key,  
            'callback': reCaptchaCallback,  
            theme: 'light', //light or dark    
            type: 'image',// image or audio    
            size: 'normal'//normal or compact    
        });  
    };  
  
    var reCaptchaCallback = function (response) {  
        if (response !== '') {  
            jQuery('#lblMessage').css('color', 'green').html('Success');  
        }  
    };  
  
    jQuery('button[type="button"]').click(function(e) {  
        var message = 'Please checck the checkbox';  
        if (typeof (grecaptcha) != 'undefined') {  
            var response = grecaptcha.getResponse();  
            (response.length === 0) ? (message = 'Captcha verification failed') : (message = 'Success!');  
        }  
        jQuery('#lblMessage').html(message);  
        jQuery('#lblMessage').css('color', (message.toLowerCase() == 'success!') ? "green" : "red");  
    });  
  
</script>  

</asp:Content>
