use <linalg.scad>
use <se3.scad>

function left_multiply(a,bs,i_=0) = i_ >= len(bs) ? [] :
  concat([
    a * bs[i_]
  ], left_multiply(a,bs,i_+1));


function right_multiply(as,b,i_=0) = i_ >= len(as) ? [] :
  concat([
    as[i_] * b
  ], right_multiply(as,b,i_+1));

function quantize_trajectory(trajectory,step=undef,start_position=0,steps=undef,i_=0,length_=undef) =
  length_ == undef ? quantize_trajectory(
    trajectory=trajectory,
    start_position=(step==undef?norm(take3(trajectory))/steps*start_position:start_position),
    length_=norm(take3(trajectory)),
    step=step,steps=steps,i_=i_) :
  (steps==undef?start_position > length_:i_>=steps) ? [] :
  concat([
  // if steps is defined, ignore start_position
    se3_exp(trajectory*(steps==undef ? start_position/length_
                                         : i_/(steps>1?steps-1:1)))
  ], quantize_trajectory(trajectory=trajectory,step=step,start_position=(steps==undef?start_position+step:start_position),steps=steps,i_=i_+1,length_=length_));

function close_trajectory_loop(trajectories) = concat(trajectories,[se3_ln(invert_rt(trajectories_end_position(trajectories)))]);

function quantize_trajectories(trajectories,step=undef,start_position=0,steps=undef,loop=false,last_=identity4(),i_=0,current_length_=undef,j_=0) =
    // due to quantization differences, the last step may be missed. In that case, add it:
  loop==true ? quantize_trajectories(
    trajectories=close_trajectory_loop(trajectories),
    step=step,
    start_position = start_position,
    steps=steps,
    loop=false,
    last_=last_,
    i_=i_,
    current_length_=current_length_,
    j_=j_) :
  i_ >= len(trajectories) ? (j_ < steps ? [last_] : []) :
  current_length_ == undef ?
  quantize_trajectories(
    trajectories=trajectories,
    step = (step == undef ? trajectories_length(trajectories) / steps : step),
    start_position = (step == undef ? start_position * trajectories_length(trajectories) / steps : start_position),
    steps=steps,
    loop=loop,
    last_=last_,
    i_=i_,
    current_length_=norm(take3(trajectories[i_])),
    j_=j_) :
  concat(
    left_multiply(last_,quantize_trajectory(
      trajectory=trajectories[i_],
      start_position=start_position,
      step=step)),
  quantize_trajectories(
    trajectories=trajectories,
    step=step,
    start_position = start_position > current_length_
      ? start_position - current_length_
      : step - ((current_length_-start_position) % step),
    steps=steps,
    loop=loop,
      last_=last_ * se3_exp(trajectories[i_]),
      i_=i_+1,
    current_length_ = undef,
    j_=j_+len(

    quantize_trajectory(
      trajectory=trajectories[i_],
      start_position=start_position,
      step=step

    ))
  ))
;


function trajectories_length(trajectories, i_=0) = i_ >= len(trajectories) ? 0
  : norm(take3(trajectories[i_])) + trajectories_length(trajectories,i_+1);


function trajectories_end_position(rt,i_=0,last_=identity4()) =
  i_ >= len(rt) ? last_ :
  trajectories_end_position(rt, i_+1, last_ * se3_exp(rt[i_]));
