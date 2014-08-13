/*
  YOUR TASK:  To fill in the following function.

  --- BASIC REQUIREMENTS ---
    * It should return a number equal to the area of the shape.

  --- EXTRA CREDIT ---
    * Have the algorithm only halt after a certain degree of precision has been reached.
    * Refine your algorithm to choose points in a "smarter" fashion.

      first, refine the bounding grid, then divide the boinding grid into smaller parts, and 
      then throw random points in these smaller parts, and then get more precise estimation. 
      
    * Dig into base.js and improve performance there.

  --- AVAILABLE METHODS ---

    The following methods are available to you in the global scope:

      evalPoint: function(x, y)
        -- Returns "true" if a point is inside the shape, and false otherwise.

      getGraphDimensions: function()
        -- Returns an objects with the dimensions of the graph.
        -- Has properties x and y, each of which has properties min and max.
           (ex. { x:{min: 3, max: 10}, y:{min:-5, max: 6} })

  --- SOME THINGS TO THINK ABOUT ---
    * Which shapes are easier/harder to integrate?
    * What ratio of window size to shape size maximizes accuracy?
    * 
*/

var integrate = function() {

  var dimensions = getGraphDimensions()
  var totalArea = (dimensions.x.max - dimensions.x.min) * (dimensions.y.max - dimensions.y.min)
  var total_points = 1000
  var points_inside = 0
  var points = []

  function getRandomInt(min, max) {
    return (Math.random() * (max - min + 1)) + min;
  }


  for (i = 0; i < total_points; i++) {
    points[i] = [getRandomInt(dimensions.x.min, dimensions.x.max), getRandomInt(dimensions.y.min, dimensions.y.max)];
  }

  for (i = 0; i < points.length; i++){
     if (evalPoint(points[i][0], points[i][1])){
        points_inside++
     }
  }

  var area = (points_inside/total_points) * totalArea

  return area
    
  };



