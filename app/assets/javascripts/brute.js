// For ratings, see http://jsfiddle.net/leaverou/CGP87/light/
$(document).ready(function () {

    var endpointOptions = { isSource: true, isTarget: true, paintStyle: { fillStyle: "transparent" }, maxConnections: 3 };
    // Init element
    function InitMod(el) {
        jsPlumb.addEndpoint(el, {
            uuid:el.attr("id"),
        }, endpointOptions);
    }
    //initializing jsplumb on mod matrix 
    jsPlumb.ready(function () {
        jsPlumb.Defaults.Endpoint = "Dot";
        jsPlumb.Defaults.EndpointStyle = { fillStyle : "transparent" };
        jsPlumb.Defaults.Anchor = [.48, .15, 0, 0];
        jsPlumb.Defaults.PaintStyle = { lineWidth: 3, strokeStyle: "#ffa500" };
        jsPlumb.Defaults.endpointPaintStyle = { fillStyle: "blue", outlineColor: "black", outlineWidth: 1 };
        $('.mod').each(function(){
            InitMod($(this));
        });
        jsPlumb.bind("click", function(conn) {
            jsPlumb.detach(conn);
        });
        //mod1 = jsPlumb.addEndpoint("mod-env", endpointOptions),
        //mod2 = jsPlumb.addEndpoint("mod-lfo", endpointOptions),
        //mod3 = jsPlumb.addEndpoint("mod-metal", endpointOptions),
        //mod4 = jsPlumb.addEndpoint("mod-pitch", endpointOptions),
        //mod5 = jsPlumb.addEndpoint("mod-saw", endpointOptions),
        //mod6 = jsPlumb.addEndpoint("mod-filter", endpointOptions),
        // mod7 = jsPlumb.addEndpoint("mod-sub", endpointOptions),
        //mod8 = jsPlumb.addEndpoint("mod-pwm", endpointOptions);

    });

    //Get content editable content
    var initialTitle = $('#title-text').html();
    var initialDesc = $('#description-text').html();
    //console.log(initialTitle, initialDesc);
    //Submit button stuff
    var request;
    //Octave Config
    var currentOctave = 3;
    moveIndicator(currentOctave);
    $('#octave-controls .next').click(function(){
        if(currentOctave < 5){
            currentOctave ++;
        }
        moveIndicator(currentOctave);
    });
    $('#octave-controls .prev').click(function(){
        if(currentOctave > 1){
            currentOctave --;
        }
        moveIndicator(currentOctave);
    });

    // bind to the submit event of our form
    $("#patch-config").submit(function (event) {
        //Find Mod Matrix Info
        doConnections();
        //Add Title and Description
        var recievedTitle = $('#title-text').html();
        var recievedDesc = $('#description-text').html();
        if (recievedTitle  != initialTitle ){
            $('#title-input').val(recievedTitle);
        }
        if (recievedDesc != initialDesc ){
            $('#description-input').val(recievedDesc);
        }
        // abort any pending request
        if (request) {
            request.abort();
        }
        // setup some local variables
        var $form = $(this);

        // serialize the data in the form
        var serializedData = $form.serialize();
        // fire off the request to /form.php
        /*
           request = $.ajax({
           url: "/patches",
           type: "post",
           data: serializedData
           });

        // callback handler that will be called on success
        request.done(function (response, textStatus, jqXHR) {
            var patchId = response;
            window.location.href = window.location.href + "?id=" + patchId;
            console.log("Entry for " + patchId + " is successful");
        });

        // callback handler that will be called on failure
        request.fail(function (jqXHR, textStatus, errorThrown) {
            // log the error to the console
            console.error(
                    "The following error occured: " +
                    textStatus, errorThrown
                    );
        });
        // prevent default posting of form
        event.preventDefault();
        */
    });

    // Ratings stuff
    $("[name='rating']").click(function() {
        //alert($(this).attr('value'));
        var patch_id = $("#patch").attr('data-patch-id');
        var rating = $(this).attr('value');

        request = $.ajax({
            url: "/ratings/",
            type: "post",
            data: { rating: {rating: rating, patch_id: patch_id} }
        });

       // callback handler that will be called on success
        request.done(function (response, textStatus, jqXHR) {
            /*
            var patchId = response;
            window.location.href = window.location.href + "?id=" + patchId;
            console.log("Entry for " + patchId + " is successful");
            */
            //location.reload();
        });

        // callback handler that will be called on failure
        request.fail(function (jqXHR, textStatus, errorThrown) {
            // log the error to the console
            console.error(
                    "The following error occured: " +
                    textStatus, errorThrown
                    );
        });
    });

    // Cookie stuff for favorites
    // var ids = $.cookie('favs');
    // var patch_id = $("#patch").attr('data-patch-id');
    // ids.push(patch_id);
    //$.cookie('favs', ids, { expires: 365 });

    //initializing all knobs
    $(".dial").knob({
        "min": 0,
        "max": 100,
        //"bgColor": "#595959",
        "fgColor": "#fd9901",
        "angleArc": 267,
        "angleOffset": -135,
        "displayInput": false,
        "width": 69,
        "height": 69,
        "cursor": 5
    });

    //initializing the pattern knob
    $(".dial-p").knob({
        "min": 0,
        "max": 7,
        //"bgColor": "#595959",
        "fgColor": "#fd9901",
        "angleArc": 210,
        "angleOffset": 0,
        "displayInput": false,
        "width": 69,
        "height": 69,
        "cursor": 5
    });

    //initializing the toggle switches
    $(".toggle").each(function () {
        var obj = $(this);
        var sId = "#" + obj.data('id');
        var max = parseInt(obj.data('max'));

        obj.slider({
            orientation: "vertical",
            range: "max",
            min: 0,
            max: $(this).data('max'),
            value: obj.siblings('.toggle-input').val(),
            change: function (event, ui) {
                jQuery(sId).val(ui.value);
                var toggleValue = obj.slider("value");
                obj.siblings('.toggle-input').val(toggleValue);
                console.log(obj.siblings('.toggle-input').val());
            }
        });
    });


    //initializing the sliders
    $(".slider").each(function () {
        var obj = jQuery(this);
        var sId = "#" + obj.data('id');

        obj.slider({
            orientation: "vertical",
            range: "max",
            min: 0,
            max: 100,
            value: obj.siblings('.slider-input').val(),
            change: function (event, ui) {
                jQuery(sId).val(ui.value);
                var sliderValue = obj.slider("value");
                obj.siblings('.slider-input').val(sliderValue);
                //console.log(obj.siblings('.slider-input').val());
            }
        });
    });

});

//Get connection in modmatrix
function doConnections(){
    var connectionList = jsPlumb.getAllConnections();
    //jsPlumb.connect({uuids:["mod-env","mod-lfo"]});
    //for connecting based on endpoint uuid
    var connections = [];
    for(var key in connectionList) {
        var selectedConnection = connectionList[key];
        connections[key]={};
        connections[key]['source'] = selectedConnection.sourceId;
        connections[key]['target'] = selectedConnection.targetId;
    }
    var modString = JSON.stringify(connections);
    $('#modmatrix-input').val(modString);
}

//Octave goodness
function moveIndicator(octave){
    $('#octave-input').val(octave);
    $('#octave-indicators li').removeClass('active');
    switch (octave)
    {
        case 0:
            $('#neg2, #neg1').addClass('active');
            break;
        case 1:
            $('#neg2').addClass('active');
            break;
        case 2:
            $('#neg1').addClass('active');
            break;
        case 3:
            $('#zero').addClass('active');
            break;
        case 4:
            $('#pos1').addClass('active');
            break;
        case 5:
            $('#pos2').addClass('active');
            break;
    }
}
