<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<div align="center">
    <h1>Garage Register Form</h1>
    <form action="<%= request.getContextPath() %>/registerGarage" method="post">
        <table style="with: 80%">
            <tr>
                <td>Garage Name</td>
                <td><label>
                    <input type="text" name="garageName"/>
                </label></td>
            </tr>
            <tr>
                <td>Set Cost</td>
                <td><label>
                    <input type="number" name="setCost"/>
                </label></td>
            </tr>
            <tr>
                <td>Zip</td>
                <td><label>
                    <input type="text" name="zip"/>
                </label></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><label>
                    <input type="text" name="garageAddress"/>
                </label></td>
            </tr>
            <tr>
                <td>Number Of Floors</td>
                <td><label>
                    <input type="number" name="numberFloors"/>
                </label></td>
            </tr>
            <tr>
                <td>Number Of Floors</td>
                <td><label>
                    <input type="number" name="numberSpots"/>
                </label></td>
            </tr>
            <tr>
                <td>Username</td>
                <td><label>
                    <input type="text" name="username"/>
                </label></td>
            </tr>
        </table>
        <input type="submit" value="Submit"/>
    </form>
</div>
</body>
</html>