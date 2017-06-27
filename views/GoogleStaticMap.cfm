<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Map Display</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/mapradius.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Map Radius Drawing Application</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-9" id="map-area">
                <img id="map-image" src="" alt="">
            </div>
            <div class="col-md-3" id="radius-selector">
                <p>Please select a radius:</p>
                <select id="radius" class="form-control">
                  <option value="500" selected>500</option> 
                  <option value="350">350</option>
                  <option value="275">275</option>
                  <option value="125">125</option>
                </select>
            </div>
        </div>
    </div>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.js"></script>
    <script src="../assets/js/MapRadius.js"></script>
</body>
</html>

<!--- <img src="https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&key=AIzaSyC2RIqiYE92YSCPEwsRpZMo6-mLP9CX_YM" alt=""> --->