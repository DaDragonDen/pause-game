extends Area2D

# Measured in pixels/second.
var speed = 400;

# Called when the node enters the scene tree for the first time.
func _ready():
  pass;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  
  # Move the character when the player presses a key.
  var velocity = Vector2.ZERO;
  if Input.is_action_pressed("move_left"):
    velocity.x -= 1;
    pass
  elif Input.is_action_pressed("move_up"):
    velocity.y -= 1;
    pass
  elif Input.is_action_pressed("move_down"):
    velocity.y += 1;
    pass
  elif Input.is_action_pressed("move_right"):
    velocity.x += 1;
    pass
    
  # Check if the new position is out of bounds.
  velocity = velocity.normalized() * speed;
  var newPosition = position + velocity * delta;
  var animatedSprite = get_node("AnimatedSprite");
  var animatedSpriteSize = animatedSprite.frames.get_frame(animatedSprite.animation, animatedSprite.frame).get_size();
  if (
    newPosition.x - (animatedSpriteSize.x / 2) < 0 or 
    newPosition.x + (animatedSpriteSize.x / 2) > get_viewport_rect().size.x or
    newPosition.y - (animatedSpriteSize.y / 2) < 0 or
    newPosition.y + (animatedSpriteSize.y / 2) > get_viewport_rect().size.y
  ):
    return;
  
  print(newPosition.x - (animatedSpriteSize.x / 2));
  position = newPosition;
  
  pass;
