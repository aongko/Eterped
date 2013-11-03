<div class="container">
<div class="row">
	<h2 style="text-align:center">REGISTER</h2><br>
	<h3 style="text-align:center">Register Form</h3><br>
	<form method="post" class="form-signin" action="services/doRegister.jsp">
		<table class="table" align="center" style="width:50%">
			<tr>
				<td align="left" style="width:51%">Username</td>
				<td align="right" style="width:100%"><input type="text" class="form-control" name="user"></td>
			</tr>
			<tr>
				<td align="left" style="width:51%">Password</td>
				<td align="right" style="width:100%"><input type="password" class="form-control" name="pass"></td>
			</tr>
			<tr>
				<td align="left" style="width:51%">Confirm Password</td>
				<td align="right" style="width:100%"><input type="password" class="form-control" name="confpass"></td>
			</tr>
			<tr>
				<td align="left" style="width:51%">Address</td>
				<td align="right" style="width:100%"><textarea class="form-control" name="address"></textarea></td>
			</tr>
			<tr>
				<td align="left" style="width:51%">Telephone</td>
				<td align="right" style="width:100%"><input type="text" class="form-control" name="phone"></td>
			</tr>
			<tr>
				<td align="left" style="width:51%">Email</td>
				<td align="right" style="width:100%"><input type="text" class="form-control" name="email"></td>
			</tr>
		</table>
		<br>
		<p align="center">
			<input type="submit" class="btn btn-success" value="Register" style="text-align:center">
		</p>
	</form>
</div>