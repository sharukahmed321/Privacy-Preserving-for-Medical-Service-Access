

<!DOCTYPE HTML>

<html>
<head>
	<meta charset="UTF-8">
	<title>Medical Data Sharing</title>
	<link rel="stylesheet" href="css/regi.css" type="text/css">
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript">
$(function() {
$('#submit').click(function() {
var param1 = new Date();
var ddate = $('#dob').val();
//var time = $('#txttime').val();
//var hours = Number(time.match(/^(\d+)/)[1]);
//var minutes = Number(time.match(/:(\d+)/)[1]);
//var format = time.match(/\s(.*)$/)[1];
//if (format == "PM" && hours < 12) hours = hours + 12;
//if (format == "AM" && hours == 12) hours = hours - 12;
//var sHours = hours.toString();
//var sMinutes = minutes.toString();
//if (hours < 10) sHours = "0" + sHours;
//if (minutes < 10) sMinutes = "0" + sMinutes;
//ddate = ddate + " " + sHours + ":" + sMinutes + ":00";
var date1 = new Date(ddate);
var date2 = new Date();
if (date1 > date2) {
alert('Please Enter Date less  than Current Date time');
$('#dob').focus();
return false;
}
})
})
</script>
</head>
<body>
       
	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
			
			<li>
				<a href="owner.jsp">Back</a>
			</li>
		</ul>
	</div>
	<div id="body">
		<div class="content">
                    <img src="images/reg.jpg" style="height: 320px; width: 920px" alt="">
			<h2>Registration</h2>
                        <form action="loginaction.jsp" method="get" name="reg" ">
				<label for="firstName"> <span>First name*</span>
                                    <input type="text" name="first" placeholder="First Name" required="" id="firstName"  pattern="[a-z]*">
				</label>
				<label for="lastName"> <span>Last name*</span>
                                    <input type="text" name="last" placeholder="Last Name" required="" id="lastName"  pattern="[a-z]*">
				</label>
				<label for="email"> <span>Email*</span>
                                    <input type="email" name="email" placeholder="Email" required="" id="email">
				</label>
                            <label for="email"> <span>Take care Email*</span>
                                    <input type="email" name="temail" placeholder="Email" required="" id="email">
				</label>
                                <label for="uname"> <span>User Name</span>
                                    <input type="text" name="uname" placeholder="User Name" required="" id="email"  pattern="[a-z]*">
				</label>
                                <label for="password"> <span>Password</span>
                                    <input type="password" name="pass" placeholder="Password" required="" id="pass" pattern="(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$">
                                    <span><sub>Password (UpperCase, LowerCase, Number/SpecialChar and min 8 Chars)</sub>
                                </label>
				<label for="DateOfBirth"> <span>Date Of Birth</span>
                                    <input type="date" name="dob" required="" id="dob" >
				</label>
                                <label for="State"> <span>Your State</span>
                                    <input type="text" name="state" placeholder="Your State" required="" id="state">
				</label>
                                <label for="Country"> <span>Your Country</span>
                                    <input type="text" name="country" placeholder="Your Country" required="" id="country">
				</label>
                            <label for="Role"><span>Role</span>
                                <select name="gender" id="email">
                                 <option value="#">------------- Select Role ----------</option>
                                 <option value="Owner">Data Owner</option>
<!--                                 <option value="User">User</option>-->

                                </select>
                                 <input type="hidden" value="3" name="status" />
                            </label>
				<input type="submit" value="" id="submit">
			</form>
		</div>
		
	</div>
	<div id="footer">
		<div>
			<p>
				<span> </span>
			</p>
			<ul>
				<li id="facebook">
					<a href="#">facebook</a>
				</li>
				<li id="twitter">
					<a href="#">twitter</a>
				</li>
				<li id="googleplus">
					<a href="#">googleplus</a>
				</li>
				<li id="rss">
					<a href="#" >rss</a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>