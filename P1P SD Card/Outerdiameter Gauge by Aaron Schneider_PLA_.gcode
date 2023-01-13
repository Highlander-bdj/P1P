; HEADER_BLOCK_START
; BambuStudio 01.03.00.01
; total estimated time: 26m 51s
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; adaptive_layer_height = 0
; additional_cooling_fan_speed = 70,70
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_difference = 10,10
; before_layer_change_gcode = 
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = no_brim
; brim_width = 5
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\n{if toolchange_count > 1}\nG17\nG2 Z{max_layer_z + 0.4} I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift\n{endif}\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F12000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\n{if old_filament_temp > 0 && next_extruder < 255}M109 S[old_filament_temp]{endif}\nG1 X90 F3000\nG1 Y250 F4000\nG1 X100 F5000\nG1 X120 F12000\n\nG1 X20 Y50 F12000\nG1 Y-3\n\nT[next_extruder]\n\n; always use highest temperature to flush\nM400\nM109 S[nozzle_temperature_range_high]\n\n{if next_extruder < 255}\nG1 X54  F12000\nG1 Y265\n\nM400\n\nG92 E0\n{if flush_length_1 > 1}\n; FLUSH_START\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM400\nM109 S[new_filament_temp]\n\nM400\nM106 P1 S255\nM400 S3\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z[z_after_toolchange] F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A
; close_fan_the_first_x_layers = 1,1
; cool_plate_temp = 65,65
; cool_plate_temp_initial_layer = 65,65
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_profile = "Bambu PLA Basic @BBL X1"
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; different_settings_to_system = brim_type;ironing_flow;ironing_speed;ironing_type;top_surface_speed;cool_plate_temp;cool_plate_temp_initial_layer;filament_flow_ratio;textured_plate_temp;textured_plate_temp_initial_layer;cool_plate_temp;cool_plate_temp_initial_layer;filament_flow_ratio;textured_plate_temp;textured_plate_temp_initial_layer;machine_start_gcode
; draft_shield = disabled
; elefant_foot_compensation = 0
; enable_arc_fitting = 1
; enable_overhang_bridge_fan = 1,1
; enable_overhang_speed = 1
; enable_prime_tower = 1
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0
; eng_plate_temp_initial_layer = 0,0
; extruder_clearance_height_to_lid = 140
; extruder_clearance_height_to_rod = 36
; extruder_clearance_radius = 65
; extruder_colour = #018001
; extruder_offset = 0x2
; fan_cooling_layer_time = 100,100
; fan_max_speed = 100,100
; fan_min_speed = 100,100
; filament_colour = #FFFFFF;#80FF00
; filament_cost = 24.99,24.99
; filament_density = 1.26,1.26
; filament_diameter = 1.75,1.75
; filament_end_gcode = "; filament end gcode \n;M106 P3 S0\n";"; filament end gcode \n;M106 P3 S0\n"
; filament_flow_ratio = 0.93,0.93
; filament_ids = GFA00;GFA00
; filament_is_support = 0,0
; filament_max_volumetric_speed = 21,21
; filament_minimal_purge_on_wipe_tower = 15,15
; filament_settings_id = "Bambu PLA Basic @BBL X1";"Bambu PLA Basic @BBL X1(Outerdiameter Gauge by Aaron Schneider.3mf)"
; filament_soluble = 0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif}"
; filament_type = PLA;PLA
; filament_vendor = "Bambu Lab";"Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,241,387,0
; flush_volumes_vector = 140,140,140,140
; full_fan_speed_layer = 0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; host_type = octoprint
; hot_plate_temp = 55,55
; hot_plate_temp_initial_layer = 55,55
; independent_support_layer_height = 0
; infill_combination = 0
; infill_direction = 45
; infill_wall_overlap = 25%
; inherits_group = ;;"Bambu PLA Basic @BBL X1";
; initial_layer_acceleration = 500
; initial_layer_infill_speed = 105
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_speed = 250
; ironing_flow = 15%
; ironing_spacing = 0.15
; ironing_speed = 60
; ironing_type = top
; layer_change_gcode = {if timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 E-[retraction_length] F1800\nG1 X65 Y245 F12000 ; move to safe pos\nG1 Y265 F3000\nM400 P100\nM971 S11 C10 O0\nG92 E0\nG1 E[retraction_length] F300\nG1 X100 F5000\nG1 Y255\n{elsif timelapse_type == 2} ; timelapse without wipe tower\nM971 S11 C10 O0\n{endif}
; layer_height = 0.2
; line_width = 0.42
; machine_end_gcode = ;===== date: 202200913 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X128 Y250 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n\n
; machine_load_filament_time = 17
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,200
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 0.2,0.4
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 12,12
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1\n
; machine_start_gcode = ;===== machine: P1P ========================\n;===== date: 202200929 =====================\n;===== reset machine status =================\nG91\nM17 Z0.4 ; lower the z-motor current\nG0 Z12 F300 ; lower the hotbed , to prevent the nozzle is below the hotbed\nG0 Z-6;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\n{if bbl_bed_temperature_gcode}\nM1002 set_heatbed_surface_temp:[bed_temperature_initial_layer_vector] ;config bed temps\nM140 A S[bed_temperature_initial_layer_single] ;set bed temp\nM190 A S[bed_temperature_initial_layer_single] ;wait for bed temp\n{else}\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n{endif}\n\n\n=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_tool]=="PLA"}\n    {if (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on \nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_tool]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_tool]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_tool]A\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_tool]=="PLA"}\n    {if (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY \n;===== fmech mode fast check============================\n\n\n;===== noozle load line ===============================\nM975 S1\nG90 \nM83\nT1000\nG1 X18.0 Y5.0 Z0.2 F18000;Move to start position\nM109 S{nozzle_temperature[initial_extruder]}\nG0 E3 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60} \nG0 Y15 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E1\nG0 Y5.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60} \nM400\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan \nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nM900 K0.02 L1000 M1000
; machine_unload_filament_time = 16
; max_bridge_length = 20
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; nozzle_diameter = 0.4
; nozzle_temperature = 220,220
; nozzle_temperature_initial_layer = 220,220
; nozzle_temperature_range_high = 240,240
; nozzle_temperature_range_low = 190,190
; nozzle_type = stainless_steel
; nozzle_volume = 0
; only_one_wall_top = 0
; ooze_prevention = 0
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100
; overhang_fan_threshold = 50%,50%
; prime_tower_brim_width = 3
; prime_tower_width = 35
; prime_volume = 45
; print_host = 
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_model = Bambu Lab P1P
; printer_settings_id = Bambu Lab P1P 0.4 nozzle
; printer_technology = FFF
; printer_variant = 0.4
; printhost_apikey = 
; printhost_authorization_type = key
; printhost_cafile = 
; printhost_password = 
; printhost_port = 
; printhost_ssl_ignore_revoke = 0
; printhost_user = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1
; reduce_infill_retraction = 1
; resolution = 0.012
; retract_before_wipe = 70%
; retract_length_toolchange = 2
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; scan_first_layer = 0
; seam_position = aligned
; silent_mode = 0
; single_extruder_multi_material = 1
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slow_down_for_layer_cooling = 1,1
; slow_down_layer_time = 8,8
; slow_down_min_speed = 20,20
; solid_infill_filament = 1
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; standby_temperature_delta = -5
; support_angle = 0
; support_base_pattern = rectilinear
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_critical_regions_only = 1
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_pattern = rectilinear
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_speed = 150
; support_style = grid
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = normal(auto)
; temperature_vitrification = 55,55
; template_custom_gcode = 
; textured_plate_temp = 65,65
; textured_plate_temp_initial_layer = 65,65
; thick_bridges = 0
; timelapse_type = 0
; top_shell_layers = 4
; top_shell_thickness = 0.8
; top_surface_acceleration = 500
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 100
; travel_speed = 480
; travel_speed_z = 0
; tree_support_branch_angle = 30
; tree_support_branch_diameter = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = 0
; tree_support_with_infill = 0
; wall_filament = 1
; wall_infill_order = inner wall/outer wall/infill
; wall_loops = 2
; wipe = 1
; wipe_distance = 2
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 155
; wipe_tower_y = 221
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_hop = 0.4
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R26
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z12 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z0.20 E2.50
M204 S10000
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1P ========================
;===== date: 202200929 =====================
;===== reset machine status =================
G91
M17 Z0.4 ; lower the z-motor current
G0 Z12 F300 ; lower the hotbed , to prevent the nozzle is below the hotbed
G0 Z-6;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem

;===== heatbed preheat ====================
M1002 gcode_claim_action : 2

M140 S65 ;set bed temp
M190 S65 ;wait for bed temp



=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on 
G1 X60 F12000
M73 P16 R22
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A

M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
G1 E50 F200
M400
M104 S220
G92 E0
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

G1 X70 F9000
M73 P17 R22
G1 X76 F15000
M73 P18 R21
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
M73 P19 R21
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X81.3606 Y97.861 I112.068 J147.067
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY 
;===== fmech mode fast check============================


;===== noozle load line ===============================
M975 S1
G90 
M83
T1000
G1 X18.0 Y5.0 Z0.2 F18000;Move to start position
M109 S220
G0 E3 F300
G0 X240 E15 F6033.27 
G0 Y15 E0.700 F1508.32
G0 X239.5
G0 E1
G0 Y5.5 E0.700
G0 X18 E15 F6033.27 
M400

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan 
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
M900 K0.02 L1000 M1000
G90
G21
M83 ; only support relative e
M620 S0A
M204 S9000

G1 Z3 F1200

G1 X70 F12000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0

G1 X90 F3000
G1 Y250 F4000
G1 X100 F5000
G1 X120 F12000

G1 X20 Y50 F12000
G1 Y-3

T0

; always use highest temperature to flush
M400
M109 S240


M73 P20 R21
G1 X54  F12000
G1 Y265

M400

G92 E0








M400
M109 S220

M400
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60 F15000
G1 X80 F15000
G1 X60 F15000; shake to put down garbage

G92 E0
G1 E-2 F1800

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265 F5000
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
M73 P21 R21
G1 Z0 F3000

M204 S500


M621 S0A
;_FORCE_RESUME_FAN_SPEED
; filament start gcode
M106 P3 S255
M981 S1 P20000 ;open spaghetti detector
G1 Z.2 F28800
M106 S0
M106 P2 S0
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2

M204 S500
G1 E-.8 F1800
G1 X189.5 Y239 Z.6 F28800
G1 Z.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.2
; FEATURE: Prime tower
; LINE_WIDTH: 0.5
G1  X155.500 Y239.000  E1.2922 F3000
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X155.500 
G1  Y219.500 
G1  X156.500 
;--------------------
; CP EMPTY GRID START
; layer #2
G1  Y220.000  E0.0190
G1  X189.000  E1.2352
G1  Y220.500  E0.0190
G1  X156.000  E1.2542
G1  Y221.000  E0.0190
G1  X189.000  E1.2542
G1  Y221.500  E0.0190
G1  X156.000  E1.2542
G1  Y222.000  E0.0190
G1  X189.000  E1.2542
G1  Y222.500  E0.0190
M73 P21 R20
G1  X156.000  E1.2542
M73 P22 R20
G1  Y223.000  E0.0190
G1  X189.000  E1.2542
G1  Y223.500  E0.0190
G1  X156.000  E1.2542
G1  Y224.000  E0.0190
G1  X189.000  E1.2542
G1  Y224.500  E0.0190
G1  X156.000  E1.2542
G1  Y225.000  E0.0190
G1  X189.000  E1.2542
G1  Y225.500  E0.0190
G1  X156.000  E1.2542
G1  Y226.000  E0.0190
G1  X189.000  E1.2542
G1  Y226.500  E0.0190
G1  X156.000  E1.2542
G1  Y227.000  E0.0190
G1  X189.000  E1.2542
G1  Y227.500  E0.0190
G1  X156.000  E1.2542
G1  Y228.000  E0.0190
G1  X189.000  E1.2542
G1  Y228.500  E0.0190
G1  X156.000  E1.2542
G1  Y229.000  E0.0190
G1  X189.000  E1.2542
G1  Y229.500  E0.0190
G1  X156.000  E1.2542
G1  Y230.000  E0.0190
G1  X189.000  E1.2542
G1  Y230.500  E0.0190
G1  X156.000  E1.2542
G1  Y231.000  E0.0190
G1  X189.000  E1.2542
G1  Y231.500  E0.0190
G1  X156.000  E1.2542
G1  Y232.000  E0.0190
G1  X189.000  E1.2542
G1  Y232.500  E0.0190
G1  X156.000  E1.2542
G1  Y233.000  E0.0190
G1  X189.000  E1.2542
G1  Y233.500  E0.0190
G1  X156.000  E1.2542
G1  Y234.000  E0.0190
G1  X189.000  E1.2542
G1  Y234.500  E0.0190
G1  X156.000  E1.2542
M73 P23 R20
G1  Y235.000  E0.0190
G1  X189.000  E1.2542
G1  Y235.500  E0.0190
G1  X156.000  E1.2542
G1  Y236.000  E0.0190
G1  X189.000  E1.2542
G1  Y236.500  E0.0190
G1  X156.000  E1.2542
G1  Y237.000  E0.0190
G1  X189.000  E1.2542
G1  Y237.500  E0.0190
G1  X156.000  E1.2542
G1  Y238.000  E0.0190
G1  X189.000  E1.2542
G1  Y238.500  E0.0190
G1  X156.000  E1.2542
G1  Y239.000  E0.0190
; CP EMPTY GRID END
;------------------






G1  X155.000 
G1  Y239.500 
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
G1  X155.000  E1.3302
G1  X154.543 
G1  Y239.957 
G1  Y218.543  E0.8139
G1  X190.457  E1.3650
G1  Y239.957  E0.8139
G1  X154.543  E1.3650
G1  X154.086 
G1  Y240.414 
G1  Y218.086  E0.8486
G1  X190.914  E1.3997
G1  Y240.414  E0.8486
G1  X154.086  E1.3997
G1  X153.629 
G1  Y240.871 
G1  Y217.629  E0.8834
G1  X191.371  E1.4345
G1  Y240.871  E0.8834
G1  X153.629  E1.4345
G1  X153.172 
M73 P24 R20
G1  Y241.328 
G1  Y217.172  E0.9181
G1  X191.828  E1.4692
G1  Y241.328  E0.9181
G1  X153.172  E1.4692
G1  X152.715 
G1  Y241.785 
G1  Y216.715  E0.9528
G1  X192.285  E1.5039
G1  Y241.785  E0.9528
G1  X152.715  E1.5039
G1  X152.258 
G1  Y242.242 
G1  Y216.258  E0.9876
G1  X192.742  E1.5387
G1  Y242.242  E0.9876
G1  X152.258  E1.5387
G1  X151.800 
G1  Y242.700 
G1  Y215.800  E1.0223
G1  X193.200  E1.5734
G1  Y242.700  E1.0223
G1  X151.800  E1.5734

G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X151.8 Y240.7 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I1.067 J-.585 P1  F28800
G1 X101.621 Y149.154 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
G1 X101.552 Y148.712 E.01581
G1 X101.024 Y147.676 E.0411
G1 X100.202 Y146.855 E.04107
G2 X99.166 Y146.326 I-93.083 J181.266 E.0411
G1 X98.017 Y146.143 E.04115
G1 X96.869 Y146.326 E.04108
G1 X95.834 Y146.854 E.04106
G1 X95.012 Y147.676 E.04111
G1 X94.484 Y148.711 E.04107
G1 X94.413 Y149.154 E.01584
G1 X93.285 Y149.154 E.03988
M73 P25 R20
G1 X93.24 Y148.866 E.01032
G1 X92.781 Y147.97 E.03556
G1 X92.069 Y147.258 E.0356
G1 X91.174 Y146.802 E.03552
G1 X90.181 Y146.645 E.03552
G1 X89.186 Y146.802 E.0356
G1 X88.29 Y147.258 E.03553
G1 X87.577 Y147.97 E.03563
G1 X87.122 Y148.866 E.03553
G1 X87.076 Y149.154 E.01029
G1 X82.068 Y149.154 E.17703
G1 X82.068 Y145.664 E.12337
G1 X83.923 Y145.439 E.06606
G1 X86.338 Y144.522 E.0913
G1 X88.463 Y143.054 E.09128
G1 X90.176 Y141.122 E.09127
G2 X91.377 Y138.836 I-831.036 J-437.697 E.09129
G1 X91.994 Y136.329 E.09125
G1 X91.994 Y133.745 E.09132
M73 P25 R19
G1 X91.377 Y131.239 E.09125
G1 X90.177 Y128.952 E.09127
G1 X88.463 Y127.02 E.0913
G1 X86.338 Y125.552 E.09128
G1 X83.923 Y124.635 E.0913
G1 X82.068 Y124.411 E.06606
G1 X82.068 Y122.729 E.05942
G1 X83.803 Y122.519 E.0618
G1 X86.106 Y121.644 E.08706
G1 X88.131 Y120.246 E.08696
G1 X89.765 Y118.404 E.08705
G1 X90.909 Y116.224 E.08702
G1 X91.498 Y113.833 E.08703
M73 P26 R19
G1 X91.498 Y111.371 E.08701
G1 X90.909 Y108.981 E.08703
G1 X89.765 Y106.8 E.08702
G1 X88.131 Y104.958 E.08704
G1 X86.106 Y103.558 E.08701
G1 X83.803 Y102.685 E.08704
G1 X82.068 Y102.475 E.06179
G1 X82.068 Y96.568 E.20877
G1 X85.012 Y96.568 E.10409
G1 X85.25 Y98.374 E.06437
G1 X86.221 Y100.718 E.08969
G1 X87.765 Y102.727 E.08956
G1 X89.776 Y104.271 E.08961
G2 X92.118 Y105.242 I516.816 J-1242.901 E.08963
G1 X94.633 Y105.572 E.08964
G1 X97.145 Y105.242 E.08956
G1 X99.489 Y104.271 E.08969
G1 X101.501 Y102.727 E.08961
G1 X103.044 Y100.717 E.08958
G1 X104.014 Y98.374 E.08965
G1 X104.252 Y96.568 E.06437
G1 X106.635 Y96.568 E.08421
G1 X106.856 Y98.243 E.05973
G1 X107.775 Y100.468 E.08506
G1 X109.241 Y102.376 E.08504
G1 X111.148 Y103.839 E.08498
G1 X113.37 Y104.758 E.085
G1 X115.755 Y105.072 E.08501
G1 X118.139 Y104.758 E.08501
G1 X120.361 Y103.839 E.08499
G1 X122.269 Y102.376 E.08498
G1 X123.734 Y100.468 E.08504
G1 X124.654 Y98.243 E.08506
G1 X124.875 Y96.568 E.05973
G1 X126.888 Y96.568 E.07118
G1 X127.092 Y98.116 E.05519
G1 X127.963 Y100.216 E.08035
G1 X129.348 Y102.021 E.08043
G1 X131.152 Y103.407 E.0804
G1 X133.254 Y104.276 E.0804
G1 X135.508 Y104.574 E.08038
G1 X137.765 Y104.276 E.08046
G1 X139.867 Y103.407 E.0804
G1 X141.671 Y102.021 E.0804
G1 X143.056 Y100.216 E.08044
G1 X143.926 Y98.115 E.08034
G1 X144.129 Y96.568 E.05516
G1 X145.784 Y96.568 E.05848
G1 X146.013 Y98.174 E.05735
G1 X146.986 Y100.301 E.08267
G1 X148.517 Y102.067 E.08261
G1 X150.484 Y103.331 E.08263
G1 X152.727 Y103.99 E.08264
G1 X155.063 Y103.99 E.08257
G2 X157.308 Y103.331 I-75.717 J-261.914 E.08269
G1 X159.274 Y102.067 E.08263
G1 X160.806 Y100.301 E.08261
G1 X161.776 Y98.175 E.08263
G1 X162.009 Y96.568 E.05737
G1 X165.652 Y96.568 E.12876
G1 X165.652 Y99.853 E.11609
G1 X164.185 Y100.064 E.05236
G1 X162.189 Y100.976 E.0776
G1 X160.529 Y102.413 E.0776
G1 X159.343 Y104.26 E.07758
G1 X158.724 Y106.367 E.07762
G1 X158.724 Y108.563 E.0776
G1 X159.343 Y110.67 E.07762
G1 X160.529 Y112.517 E.07758
G1 X162.188 Y113.956 E.07765
G1 X164.186 Y114.869 E.07762
G1 X165.652 Y115.078 E.05234
G1 X165.652 Y117.047 E.06958
G1 X164.327 Y117.238 E.04729
G1 X162.459 Y118.09 E.07259
G1 X160.907 Y119.433 E.07255
G1 X159.797 Y121.163 E.07264
G1 X159.22 Y123.132 E.07252
G1 X159.22 Y125.184 E.07256
G1 X159.797 Y127.156 E.0726
G1 X160.907 Y128.883 E.07257
G1 X162.459 Y130.228 E.07259
G1 X164.327 Y131.08 E.0726
G1 X165.652 Y131.271 E.04729
G1 X165.652 Y132.875 E.05669
G1 X164.286 Y133.092 E.04889
G1 X162.412 Y134.046 E.0743
G1 X160.926 Y135.532 E.0743
G1 X159.972 Y137.404 E.07424
G1 X159.643 Y139.479 E.07427
G1 X159.972 Y141.554 E.07426
G1 X160.926 Y143.428 E.07432
G1 X162.412 Y144.912 E.07426
G1 X164.286 Y145.866 E.07429
G1 X165.652 Y146.083 E.04889
G1 X165.652 Y149.154 E.10856
G1 X159.328 Y149.154 E.2235
G1 X159.136 Y147.94 E.04345
G1 X158.254 Y146.206 E.06875
G1 X156.877 Y144.832 E.06875
G2 X155.146 Y143.948 I-211.24 J411.816 E.06872
G1 X153.225 Y143.643 E.06875
G1 X151.304 Y143.948 E.06874
G2 X149.572 Y144.832 I154.057 J304.069 E.06873
G1 X148.196 Y146.206 E.06875
G1 X147.312 Y147.94 E.06879
G1 X147.12 Y149.154 E.04344
G1 X145.797 Y149.154 E.04678
G1 X145.63 Y148.094 E.03793
G1 X144.818 Y146.5 E.06322
G1 X143.553 Y145.236 E.06321
G1 X141.96 Y144.424 E.06322
G1 X140.193 Y144.145 E.06323
G1 X138.428 Y144.424 E.06316
G1 X136.834 Y145.236 E.06322
G1 X135.57 Y146.5 E.06321
G1 X134.758 Y148.094 E.06322
G1 X134.59 Y149.154 E.03793
G1 X133.227 Y149.154 E.0482
G1 X133.084 Y148.248 E.03243
G1 X132.342 Y146.794 E.05768
G1 X131.187 Y145.64 E.0577
G1 X129.734 Y144.9 E.05765
G1 X128.123 Y144.645 E.05765
G1 X126.512 Y144.9 E.05764
G1 X125.056 Y145.64 E.05771
G2 X123.904 Y146.794 I545.341 J545.466 E.05767
G1 X123.162 Y148.248 E.05767
G1 X123.019 Y149.154 E.03243
G1 X121.755 Y149.154 E.04468
G1 X121.636 Y148.404 E.02684
G1 X120.966 Y147.088 E.05218
G1 X119.923 Y146.046 E.05212
G1 X118.608 Y145.376 E.05216
G1 X117.151 Y145.143 E.05218
G1 X115.693 Y145.377 E.05219
G1 X114.38 Y146.046 E.05208
G1 X113.336 Y147.088 E.05215
G1 X112.666 Y148.404 E.05221
G1 X112.548 Y149.154 E.02682
G1 X111.097 Y149.154 E.05127
G1 X111.004 Y148.558 E.02132
G1 X110.407 Y147.389 E.0464
G2 X109.522 Y146.493 I-23.726 J22.56 E.04452
G1 X109.335 Y146.369 E.00793
G2 X108.274 Y145.847 I-4.893 J8.595 E.04183
G1 X106.993 Y145.645 E.04584
G1 X105.692 Y145.85 E.04653
G1 X104.516 Y146.448 E.04664
G1 X103.583 Y147.383 E.04666
G1 X102.984 Y148.557 E.04662
G1 X102.889 Y149.154 E.02135
G1 X101.681 Y149.154 E.04269
G1 X101.23 Y149.611 F28800
; FEATURE: Outer wall
G1 F3000
G1 X101.112 Y148.855 E.02705
G1 X100.649 Y147.948 E.03597
G1 X99.93 Y147.229 E.03598
G2 X99.023 Y146.766 I-81.562 J158.895 E.03597
G1 X98.017 Y146.606 E.03602
G1 X97.012 Y146.766 E.03595
G1 X96.106 Y147.228 E.03596
G1 X95.386 Y147.948 E.03599
G1 X94.924 Y148.855 E.03596
G1 X94.803 Y149.611 E.02707
G1 X92.894 Y149.611 E.06748
G1 X92.799 Y149.009 E.02155
G1 X92.407 Y148.242 E.03043
G1 X91.797 Y147.632 E.03049
G1 X91.031 Y147.242 E.0304
G1 X90.181 Y147.108 E.03042
G1 X89.329 Y147.242 E.03049
G1 X88.562 Y147.632 E.0304
G1 X87.952 Y148.242 E.0305
G1 X87.562 Y149.009 E.0304
G1 X87.467 Y149.611 E.02154
G1 X81.611 Y149.611 E.207
G1 X81.611 Y145.259 E.15384
G1 X83.813 Y144.992 E.07841
G1 X86.124 Y144.114 E.08737
G1 X88.158 Y142.71 E.08736
G1 X89.798 Y140.861 E.08736
G2 X90.946 Y138.672 I-794.955 J-418.665 E.08735
G1 X91.537 Y136.273 E.08732
G1 X91.537 Y133.801 E.0874
G1 X90.946 Y131.402 E.08732
G1 X89.798 Y129.214 E.08734
G1 X88.158 Y127.365 E.08737
G1 X86.124 Y125.96 E.08736
G1 X83.813 Y125.083 E.08737
G1 X81.611 Y124.816 E.07841
G1 X81.611 Y122.325 E.08805
G1 X83.693 Y122.072 E.07414
G1 X85.892 Y121.236 E.08314
G1 X87.826 Y119.902 E.08305
G1 X89.386 Y118.142 E.08312
G1 X90.478 Y116.06 E.0831
G1 X91.041 Y113.777 E.08311
G1 X91.041 Y111.427 E.08309
G1 X90.478 Y109.144 E.08311
G1 X89.386 Y107.062 E.0831
G1 X87.826 Y105.303 E.08312
G1 X85.892 Y103.966 E.08309
G1 X83.693 Y103.133 E.08312
G1 X81.611 Y102.88 E.07414
G1 X81.611 Y96.111 E.23924
G1 X85.413 Y96.111 E.13441
G1 X85.695 Y98.254 E.07641
G1 X86.62 Y100.487 E.08543
G1 X88.09 Y102.401 E.08531
G1 X90.007 Y103.871 E.08536
G2 X92.238 Y104.797 I491.745 J-1182.538 E.08537
G1 X94.633 Y105.111 E.08539
G1 X97.026 Y104.797 E.08532
G1 X99.259 Y103.871 E.08543
G1 X101.175 Y102.401 E.08536
G1 X102.645 Y100.487 E.08532
G1 X103.568 Y98.254 E.0854
G1 X103.852 Y96.111 E.07642
G1 X107.036 Y96.111 E.11253
G1 X107.301 Y98.124 E.07177
G1 X108.174 Y100.237 E.08081
G1 X109.566 Y102.049 E.08078
G1 X111.379 Y103.439 E.08073
G1 X111.488 Y103.485 E.0042
G1 X113.489 Y104.313 E.07654
G1 X115.755 Y104.611 E.08076
G1 X118.02 Y104.313 E.08076
G1 X120.131 Y103.439 E.08074
G1 X121.943 Y102.049 E.08073
G1 X123.335 Y100.237 E.08078
G1 X124.208 Y98.124 E.08081
G1 X124.474 Y96.111 E.07177
G1 X127.289 Y96.111 E.09952
G1 X127.537 Y97.997 E.06722
G1 X128.362 Y99.985 E.07609
G1 X129.674 Y101.695 E.07618
G1 X131.383 Y103.007 E.07614
G1 X133.373 Y103.831 E.07614
G1 X135.509 Y104.113 E.07612
G1 X137.646 Y103.831 E.07621
G1 X139.637 Y103.007 E.07614
G1 X141.345 Y101.695 E.07614
G1 X142.657 Y99.985 E.07619
G1 X143.48 Y97.996 E.07608
G1 X143.728 Y96.111 E.06721
G1 X146.18 Y96.111 E.08666
G1 X146.456 Y98.044 E.06902
G1 X147.374 Y100.052 E.07802
G2 X148.819 Y101.718 I1441.555 J-1248.712 E.07796
G1 X150.676 Y102.911 E.07799
G1 X152.793 Y103.533 E.07799
G1 X154.998 Y103.533 E.07795
G2 X157.116 Y102.911 I-71.524 J-247.301 E.07801
G1 X158.972 Y101.718 E.07799
G1 X160.417 Y100.052 E.07796
G1 X161.333 Y98.044 E.07799
G1 X161.613 Y96.111 E.06905
G1 X166.109 Y96.111 E.1589
G1 X166.109 Y100.248 E.14624
G1 X164.316 Y100.507 E.06404
M73 P27 R19
G1 X162.438 Y101.365 E.07295
G1 X160.878 Y102.716 E.07295
G1 X159.763 Y104.452 E.07294
G1 X159.181 Y106.433 E.07298
G1 X159.181 Y108.497 E.07295
G1 X159.763 Y110.478 E.07298
G1 X160.878 Y112.214 E.07294
G1 X162.438 Y113.568 E.073
G1 X164.316 Y114.425 E.07296
G1 X166.109 Y114.682 E.06402
G1 X166.109 Y117.443 E.09758
G1 X164.458 Y117.681 E.05897
G1 X162.708 Y118.479 E.06796
G1 X161.256 Y119.736 E.0679
G1 X160.217 Y121.354 E.06798
G1 X159.677 Y123.197 E.06788
G1 X159.677 Y125.119 E.06792
G1 X160.217 Y126.964 E.06795
G1 X161.256 Y128.581 E.06792
G1 X162.708 Y129.84 E.06794
G1 X164.458 Y130.637 E.06796
G1 X166.109 Y130.876 E.05897
G1 X166.109 Y133.266 E.08448
G1 X164.429 Y133.532 E.06013
G1 X162.684 Y134.42 E.06919
G1 X161.3 Y135.804 E.06918
G1 X160.412 Y137.547 E.06913
G1 X160.106 Y139.479 E.06915
G1 X160.412 Y141.411 E.06915
G1 X161.3 Y143.156 E.06919
G1 X162.684 Y144.538 E.06914
G1 X164.429 Y145.426 E.06919
G1 X166.109 Y145.693 E.06013
G1 X166.109 Y149.611 E.1385
G1 X158.938 Y149.611 E.25345
G1 X158.695 Y148.083 E.05469
G1 X157.88 Y146.478 E.06363
G1 X156.605 Y145.206 E.06363
G2 X155.003 Y144.388 I-195.75 J381.553 E.0636
G1 X153.225 Y144.106 E.06364
G1 X151.447 Y144.388 E.06363
G2 X149.844 Y145.206 I142.581 J281.349 E.0636
G1 X148.57 Y146.478 E.06364
G1 X147.752 Y148.083 E.06366
G1 X147.511 Y149.611 E.05468
G1 X145.406 Y149.611 E.07439
G1 X145.189 Y148.237 E.04917
G1 X144.444 Y146.772 E.0581
G1 X143.281 Y145.61 E.05809
G1 X141.817 Y144.864 E.0581
G1 X140.193 Y144.608 E.05812
G1 X138.571 Y144.864 E.05805
G1 X137.106 Y145.61 E.0581
G1 X135.944 Y146.772 E.05809
G1 X135.198 Y148.237 E.0581
G1 X134.981 Y149.611 E.04917
G1 X132.836 Y149.611 E.07581
G1 X132.643 Y148.391 E.04367
G1 X131.967 Y147.066 E.05256
G1 X130.915 Y146.014 E.05259
G1 X129.591 Y145.34 E.05253
G1 X128.123 Y145.108 E.05254
G1 X126.655 Y145.34 E.05254
G1 X125.328 Y146.014 E.05259
G2 X124.278 Y147.066 I496.98 J497.051 E.05254
G1 X123.602 Y148.391 E.05256
G1 X123.409 Y149.611 E.04367
G1 X121.364 Y149.611 E.07228
G1 X121.195 Y148.547 E.03808
G1 X120.592 Y147.36 E.04706
G1 X119.651 Y146.42 E.04699
G1 X118.465 Y145.816 E.04705
G1 X117.151 Y145.606 E.04705
G1 X115.836 Y145.816 E.04706
G1 X114.652 Y146.42 E.04698
G1 X113.71 Y147.36 E.04704
G1 X113.106 Y148.547 E.04707
G1 X112.939 Y149.611 E.03807
G1 X110.707 Y149.611 E.07891
G1 X110.564 Y148.701 E.03256
G1 X110.031 Y147.657 E.04144
G2 X109.231 Y146.849 I-21.399 J20.376 E.04018
G1 X109.104 Y146.765 E.00537
G2 X108.145 Y146.289 I-4.452 J7.771 E.03787
G1 X106.993 Y146.108 E.04123
G1 X105.835 Y146.29 E.04143
G1 X104.788 Y146.822 E.04151
G1 X103.958 Y147.654 E.04154
G1 X103.424 Y148.701 E.04152
G1 X103.279 Y149.611 E.03258
G1 X101.29 Y149.611 E.0703
G1 X101.344 Y149.228 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X101.112 Y148.855 E-.08858
G1 X100.649 Y147.948 E-.11601
G1 X100.504 Y147.803 E-.02341
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I.287 J1.183 P1  F28800
G1 X165.515 Y132.049 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.502074
G1 F6300
G1 X164.988 Y131.522 E.02645
G1 X164.228 Y131.412 E.02724
G1 X165.515 Y132.698 E.06458
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X164.228 Y131.412 E-.20734
G1 X164.408 Y131.438 E-.02066
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I1.214 J.086 P1  F28800
G1 X165.515 Y115.815 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X165.036 Y115.336 E.02404
G1 X164.278 Y115.228 E.02718
G1 X165.309 Y116.259 E.05176
G1 X165.309 Y116.75 E.01743
G1 X165.17 Y116.77 E.00497
G1 X162.776 Y114.375 E.12025
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X164.19 Y115.789 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I1.214 J.089 P1  F28800
G1 X165.515 Y97.634 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X164.792 Y96.911 E.03629
G1 X164.142 Y96.911 E.02306
G1 X165.309 Y98.077 E.05857
G1 X165.309 Y98.727 E.02306
G1 X163.493 Y96.911 E.09117
G1 X162.844 Y96.911 E.02306
G1 X165.309 Y99.376 E.12378
G1 X165.309 Y99.556 E.00638
G1 X164.898 Y99.615 E.01473
G1 X162.291 Y97.008 E.1309
G1 X162.209 Y97.575 E.02035
G1 X164.331 Y99.696 E.10652
G2 X163.833 Y99.848 I.009 J.924 E.01873
G1 X162.127 Y98.142 E.08565
G1 X162.108 Y98.272 E.00466
G1 X161.951 Y98.616 E.01341
G1 X163.387 Y100.052 E.07209
G1 X162.941 Y100.255 E.0174
G1 X161.748 Y99.062 E.05993
G1 X161.545 Y99.508 E.0174
G1 X162.496 Y100.459 E.04776
G1 X162.05 Y100.663 E.0174
G1 X161.341 Y99.954 E.0356
G1 X161.138 Y100.4 E.0174
G1 X161.691 Y100.953 E.0278
G1 X161.343 Y101.255 E.01634
G1 X160.856 Y100.767 E.02449
G1 X160.554 Y101.115 E.01634
G1 X160.995 Y101.556 E.02216
G1 X160.647 Y101.857 E.01634
G1 X160.253 Y101.462 E.01982
G1 X159.951 Y101.81 E.01634
G1 X160.299 Y102.159 E.01749
G1 X160.037 Y102.545 E.0166
G1 X159.649 Y102.158 E.01945
G3 X159.3 Y102.458 I-.686 J-.445 E.01657
G1 X159.783 Y102.941 E.02424
G1 X159.529 Y103.336 E.01669
G1 X158.905 Y102.712 E.03134
G1 X158.509 Y102.966 E.01668
G1 X159.275 Y103.732 E.03844
G1 X159.024 Y104.13 E.01672
G1 X158.114 Y103.22 E.04569
G1 X157.719 Y103.474 E.01668
G1 X158.876 Y104.632 E.05813
G1 X158.729 Y105.134 E.01857
G1 X157.289 Y103.694 E.07231
G1 X156.787 Y103.841 E.01857
G1 X158.581 Y105.635 E.0901
G1 X158.434 Y106.137 E.01857
G1 X156.285 Y103.989 E.10789
G1 X155.784 Y104.136 E.01857
G1 X158.381 Y106.733 E.13042
G1 X158.381 Y107.383 E.02306
G1 X155.282 Y104.284 E.15562
G1 X155.112 Y104.333 E.00629
G1 X154.682 Y104.333 E.01527
G1 X158.381 Y108.032 E.18575
G1 X158.381 Y108.612 E.02059
G1 X158.41 Y108.71 E.00363
G1 X154.032 Y104.333 E.21981
G1 X153.383 Y104.333 E.02306
G1 X158.68 Y109.63 E.26599
G1 X158.95 Y110.55 E.03404
G1 X152.734 Y104.333 E.31217
G1 X152.678 Y104.333 E.00199
G1 X151.837 Y104.086 E.0311
G1 X164.603 Y116.852 E.64101
G1 X164.23 Y116.905 E.01338
G1 X164.077 Y116.975 E.00596
G1 X150.614 Y103.512 E.67603
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X152.028 Y104.926 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I.37 J-1.159 P1  F28800
G1 X126.275 Y96.705 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X126.604 Y97.034 E.01652
G1 X126.702 Y97.782 E.02677
G1 X125.831 Y96.911 E.04373
G1 X125.182 Y96.911 E.02306
G1 X126.957 Y98.686 E.08915
G1 X127.418 Y99.796 E.04267
G1 X124.917 Y97.295 E.12558
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X126.331 Y98.71 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I.051 J-1.216 P1  F28800
G1 X106.669 Y97.879 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X105.702 Y96.911 E.04859
G1 X105.052 Y96.911 E.02306
G1 X106.555 Y98.414 E.07547
G1 X107.013 Y99.521 E.04252
G1 X104.352 Y96.86 E.1336
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X105.766 Y98.274 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I.036 J-1.216 P1  F28800
G1 X85.017 Y97.654 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X84.273 Y96.911 E.03734
G1 X83.624 Y96.911 E.02306
G1 X84.876 Y98.163 E.06288
G1 X84.916 Y98.463 E.01074
G1 X85.191 Y99.127 E.02552
G1 X82.975 Y96.911 E.11128
G1 X82.41 Y96.911 E.02004
M73 P28 R19
G1 X82.41 Y96.996 E.00302
G1 X86.031 Y100.616 E.18178
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X84.616 Y99.202 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I.05 J1.216 P1  F28800
G1 X145.106 Y96.705 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X145.515 Y97.115 E.02056
G1 X145.624 Y97.872 E.02718
G1 X144.662 Y96.911 E.04828
G1 X144.43 Y96.911 E.00826
G1 X144.381 Y97.279 E.01319
G1 X146.356 Y99.254 E.09918
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X144.942 Y97.84 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I.248 J-1.192 P1  F28800
G1 X144.122 Y97.67 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X146.487 Y100.034 E.11872
G1 X146.695 Y100.489 E.01775
G1 X148.29 Y102.329 E.08648
G1 X149.664 Y103.212 E.05798
G1 X163.631 Y117.179 E.70133
G1 X163.185 Y117.382 E.0174
G1 X144.186 Y98.383 E.95401
G1 X143.996 Y98.842 E.01765
G1 X162.739 Y117.585 E.94117
G1 X162.293 Y117.789 E.0174
G1 X143.806 Y99.301 E.92832
G1 X143.616 Y99.761 E.01765
G1 X161.94 Y118.085 E.92015
G1 X161.592 Y118.386 E.01635
G1 X143.426 Y100.22 E.91221
G3 X143.177 Y100.621 I-.872 J-.262 E.01694
G1 X161.244 Y118.688 E.9072
G1 X160.896 Y118.989 E.01635
G1 X142.896 Y100.988 E.90387
G1 X142.614 Y101.356 E.01644
G1 X160.574 Y119.316 E.90187
G1 X160.321 Y119.712 E.01669
G1 X142.332 Y101.723 E.90328
G1 X142.05 Y102.091 E.01644
G1 X160.067 Y120.107 E.90469
G1 X159.813 Y120.503 E.01669
G1 X141.723 Y102.413 E.90834
G1 X141.356 Y102.695 E.01644
G1 X159.559 Y120.898 E.91403
G1 X159.482 Y121.019 E.00508
G1 X159.379 Y121.368 E.01292
G1 X140.989 Y102.978 E.92345
G1 X140.622 Y103.26 E.01644
G1 X159.232 Y121.87 E.9345
G1 X159.085 Y122.372 E.01858
G1 X140.254 Y103.542 E.94555
G3 X139.849 Y103.785 I-.655 J-.632 E.017
G1 X158.938 Y122.875 E.95853
G1 X158.877 Y123.082 E.00769
G1 X158.877 Y123.463 E.01352
G1 X139.389 Y103.975 E.97854
G1 X138.93 Y104.165 E.01765
G1 X158.877 Y124.112 E1.00161
G1 X158.877 Y124.762 E.02306
G1 X138.47 Y104.355 E1.02468
G1 X138.011 Y104.545 E.01765
G1 X158.95 Y125.485 E1.05143
G1 X159.219 Y126.403 E.03397
G1 X137.476 Y104.66 E1.09178
G1 X136.903 Y104.736 E.02054
G1 X159.509 Y127.342 E1.13514
G1 X160.645 Y129.11 E.07461
G1 X162.271 Y130.519 E.07642
G1 X163.035 Y130.868 E.02979
G1 X164.826 Y132.659 E.08997
G1 X164.266 Y132.748 E.02015
G1 X136.329 Y104.812 E1.4028
G1 X135.756 Y104.887 E.02054
G1 X163.815 Y132.947 E1.40897
G1 X163.385 Y133.166 E.01714
G1 X135.083 Y104.864 E1.42115
G1 X134.334 Y104.765 E.0268
G1 X162.955 Y133.385 E1.43712
G1 X162.524 Y133.604 E.01714
G1 X133.586 Y104.666 E1.4531
G1 X133.165 Y104.61 E.01509
G1 X132.681 Y104.41 E.01859
G1 X162.122 Y133.851 E1.47835
G1 X161.797 Y134.176 E.0163
G1 X131.194 Y103.573 E1.53669
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X132.608 Y104.987 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I.822 J-.897 P1  F28800
G1 X124.841 Y97.869 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X161.473 Y134.5 E1.83939
G1 X161.148 Y134.825 E.0163
G1 X124.891 Y98.568 E1.82061
G1 X124.701 Y99.027 E.01765
G1 X160.823 Y135.15 E1.81384
G2 X160.546 Y135.522 I.434 J.613 E.01675
G1 X124.511 Y99.486 E1.80946
G1 X124.321 Y99.946 E.01765
G1 X160.327 Y135.952 E1.80799
G1 X160.108 Y136.382 E.01714
G1 X124.131 Y100.405 E1.80652
G3 X123.896 Y100.82 I-.887 J-.229 E.01711
G1 X159.889 Y136.812 E1.80731
G1 X159.669 Y137.242 E.01714
G1 X123.614 Y101.187 E1.81046
G1 X123.332 Y101.554 E.01644
G1 X159.564 Y137.786 E1.81934
G1 X159.475 Y138.347 E.02015
M73 P29 R19
G1 X123.05 Y101.922 E1.82905
G1 X122.768 Y102.289 E.01644
G1 X159.386 Y138.907 E1.83875
G1 X159.297 Y139.468 E.02015
G1 X122.477 Y102.648 E1.84887
G1 X122.11 Y102.93 E.01644
G1 X159.416 Y140.235 E1.87326
G1 X159.538 Y141.007 E.02774
G1 X121.742 Y103.211 E1.89785
G1 X121.375 Y103.493 E.01644
G1 X160.214 Y142.333 E1.95026
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X158.8 Y140.918 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I-.808 J.91 P1  F28800
G1 X164.583 Y146.052 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M73 P29 R18
G1 X165.309 Y146.778 E.03646
G1 X165.309 Y147.427 E.02306
G1 X163.503 Y145.621 E.09067
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X164.917 Y147.036 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I-1.098 J.526 P1  F28800
G1 X165.515 Y148.282 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X121.007 Y103.775 E2.23486
G1 X120.64 Y104.057 E.01644
G1 X165.309 Y148.726 E2.24298
G1 X165.309 Y148.811 E.00303
G1 X164.745 Y148.811 E.02003
G1 X120.207 Y104.274 E2.23639
G1 X119.748 Y104.464 E.01765
G1 X164.095 Y148.811 E2.22685
G1 X163.446 Y148.811 E.02306
G1 X119.288 Y104.654 E2.21731
G1 X118.829 Y104.844 E.01765
G1 X162.797 Y148.811 E2.20777
G1 X162.147 Y148.811 E.02306
G1 X118.37 Y105.034 E2.19823
G1 X118.229 Y105.092 E.00542
G1 X117.831 Y105.144 E.01423
G1 X161.498 Y148.811 E2.19267
G1 X160.849 Y148.811 E.02306
G1 X159.047 Y147.009 E.09047
G1 X158.535 Y146.002 E.04012
G1 X157.081 Y144.551 E.07292
G1 X156.075 Y144.038 E.04011
G1 X117.257 Y105.22 E1.94918
G1 X116.684 Y105.296 E.02055
G1 X154.96 Y143.572 E1.92197
G1 X154.188 Y143.449 E.02775
G1 X116.11 Y105.371 E1.91202
G1 X115.755 Y105.418 E.01272
M73 P30 R18
G1 X115.47 Y105.38 E.0102
G1 X153.416 Y143.326 E1.9054
G1 X153.225 Y143.296 E.00687
G1 X152.803 Y143.363 E.01516
G1 X114.722 Y105.282 E1.91218
G1 X113.974 Y105.183 E.02679
G1 X152.243 Y143.452 E1.9216
G1 X151.682 Y143.541 E.02015
G1 X113.2 Y105.058 E1.93234
G1 X112.092 Y104.6 E.04255
G1 X151.139 Y143.647 E1.96069
G1 X150.709 Y143.867 E.01714
G1 X110.985 Y104.142 E1.99471
G1 X108.996 Y102.62 E.08892
G1 X107.47 Y100.627 E.08912
G1 X104.459 Y97.617 E.15117
G1 X104.384 Y98.19 E.02054
G1 X150.28 Y144.086 E2.30459
G1 X149.85 Y144.305 E.01714
G1 X104.248 Y98.704 E2.28982
G1 X104.058 Y99.163 E.01765
G1 X149.42 Y144.525 E2.27776
G1 X149.368 Y144.551 E.00206
G1 X149.082 Y144.837 E.01435
G1 X103.868 Y99.623 E2.27035
G1 X103.678 Y100.082 E.01765
G1 X148.757 Y145.161 E2.26358
G1 X148.432 Y145.486 E.0163
G1 X103.488 Y100.541 E2.2568
G1 X103.344 Y100.89 E.0134
G1 X103.276 Y100.979 E.00396
G1 X148.107 Y145.81 E2.25113
G1 X147.915 Y146.002 E.00966
G1 X147.825 Y146.177 E.00699
G1 X102.994 Y101.346 E2.25114
G1 X102.712 Y101.713 E.01644
G1 X147.606 Y146.608 E2.2543
G1 X147.387 Y147.038 E.01714
G1 X102.43 Y102.081 E2.25745
G1 X102.148 Y102.448 E.01644
G1 X147.168 Y147.468 E2.26061
G1 X146.982 Y147.833 E.01455
G1 X146.968 Y147.918 E.00305
G1 X101.866 Y102.815 E2.26475
G3 X101.535 Y103.133 I-.76 J-.459 E.01649
G1 X142.94 Y144.539 E2.0791
G1 X143.757 Y144.955 E.03257
G1 X145.099 Y146.296 E.06735
G1 X145.515 Y147.114 E.03257
G1 X146.88 Y148.479 E.06853
G1 X146.827 Y148.811 E.01196
G1 X146.563 Y148.811 E.00938
G1 X145.719 Y147.967 E.04241
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X146.563 Y148.811 E-.13616
G1 X146.827 Y148.811 E-.03012
G1 X146.88 Y148.479 E-.03839
G1 X146.735 Y148.334 E-.02333
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I.794 J-.923 P1  F28800
G1 X142.087 Y144.335 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M73 P31 R18
G1 X101.167 Y103.415 E2.05472
G1 X100.8 Y103.697 E.01644
G1 X141.034 Y143.931 E2.02027
G1 X140.263 Y143.809 E.02772
G1 X100.432 Y103.979 E2
G1 X100.065 Y104.261 E.01644
G1 X139.683 Y143.879 E1.98934
G1 X139.122 Y143.967 E.02016
G1 X99.698 Y104.543 E1.97964
G1 X99.247 Y104.742 E.01748
G1 X138.561 Y144.056 E1.97409
G2 X138.075 Y144.219 I.008 J.829 E.01851
G1 X98.788 Y104.932 E1.97273
G1 X98.329 Y105.123 E.01764
G1 X137.645 Y144.438 E1.97418
G1 X137.215 Y144.657 E.01714
G1 X97.87 Y105.313 E1.97563
G1 X97.411 Y105.503 E.01765
G1 X136.784 Y144.876 E1.97708
G1 X136.63 Y144.955 E.00615
G1 X136.422 Y145.163 E.01045
G1 X96.881 Y105.622 E1.98548
G1 X96.307 Y105.698 E.02055
G1 X136.097 Y145.488 E1.998
G1 X135.772 Y145.813 E.0163
G1 X95.733 Y105.773 E2.01051
G1 X95.159 Y105.849 E.02055
G1 X135.448 Y146.137 E2.02302
G2 X135.177 Y146.516 I.447 J.606 E.0168
G1 X94.571 Y105.91 E2.03896
G1 X93.824 Y105.812 E.02677
G1 X134.958 Y146.946 E2.0655
G1 X134.739 Y147.376 E.01714
G1 X93.076 Y105.714 E2.09203
G1 X92.329 Y105.615 E.02677
G1 X134.52 Y147.806 E2.11856
G1 X134.428 Y147.987 E.00719
G1 X134.376 Y148.312 E.0117
G1 X91.364 Y105.301 E2.15978
G1 X90.255 Y104.84 E.04265
G1 X130.133 Y144.719 E2.00244
G1 X131.391 Y145.359 E.05011
G1 X132.622 Y146.59 E.06182
G1 X133.267 Y147.852 E.05031
G1 X134.226 Y148.811 E.04816
G1 X133.576 Y148.811 E.02306
G1 X133.262 Y148.497 E.0158
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X133.576 Y148.811 E-.05072
G1 X134.226 Y148.811 E-.07402
G1 X133.585 Y148.171 E-.10326
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I-.038 J1.216 P1  F28800
G1 X160.405 Y149.017 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X159.249 Y147.861 E.05804
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X160.405 Y149.017 E-.228
; WIPE_END
G1 E-.012 F1800
G17
M73 P32 R18
G3 Z.6 I.167 J-1.205 P1  F28800
G1 X129.488 Y144.722 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X82.41 Y97.645 E2.3639
G1 X82.411 Y98.295 E.02306
G1 X128.469 Y144.353 E2.31274
G1 X128.123 Y144.298 E.01244
G1 X127.814 Y144.347 E.01112
G1 X82.411 Y98.944 E2.27984
G1 X82.411 Y99.593 E.02306
G1 X85.95 Y103.133 E.17772
G1 X84.904 Y102.736 E.03971
G1 X82.411 Y100.243 E.1252
G1 X82.411 Y100.892 E.02306
G1 X83.866 Y102.348 E.0731
G1 X83.127 Y102.258 E.02644
G1 X82.205 Y101.336 E.04631
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X83.127 Y102.258 E-.14869
G1 X83.818 Y102.342 E-.07931
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I-.755 J.954 P1  F28800
G1 X90.253 Y107.436 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X127.253 Y144.436 E1.85788
G1 X126.692 Y144.525 E.02015
G1 X91.299 Y109.131 E1.77723
G1 X91.511 Y109.993 E.03151
G1 X126.195 Y144.677 E1.7416
G1 X125.764 Y144.895 E.01715
G1 X91.724 Y110.854 E1.70931
G1 X91.841 Y111.33 E.01738
G1 X91.841 Y111.621 E.01034
G1 X125.334 Y145.114 E1.68181
G1 X124.903 Y145.333 E.01715
G1 X91.841 Y112.27 E1.66019
G1 X91.841 Y112.92 E.02306
G1 X124.566 Y145.645 E1.64327
G1 X124.242 Y145.97 E.0163
G1 X91.841 Y113.569 E1.62698
G3 X91.773 Y114.15 I-1.214 J.153 E.02099
G1 X123.918 Y146.295 E1.61411
G1 X123.623 Y146.59 E.01482
G1 X123.603 Y146.63 E.00156
G1 X91.644 Y114.671 E1.60475
G1 X91.516 Y115.192 E.01905
G1 X123.383 Y147.06 E1.60017
G1 X123.164 Y147.49 E.01714
G1 X91.388 Y115.713 E1.5956
G1 X91.259 Y116.234 E.01905
G1 X122.945 Y147.919 E1.59103
G2 X122.789 Y148.413 I.679 J.486 E.01868
G1 X91.056 Y116.68 E1.5934
G1 X90.833 Y117.106 E.01708
G1 X118.832 Y145.106 E1.40594
G1 X120.127 Y145.765 E.05161
G1 X121.247 Y146.884 E.05621
G1 X121.906 Y148.18 E.05161
G1 X122.743 Y149.017 E.04203
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X121.906 Y148.18 E-.13495
G1 X121.536 Y147.452 E-.09305
; WIPE_END
G1 E-.012 F1800
G17
M73 P33 R18
G3 Z.6 I.693 J-1 P1  F28800
G1 X118.259 Y145.182 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X90.609 Y117.532 E1.38837
G1 X90.386 Y117.958 E.01708
G1 X117.237 Y144.81 E1.34831
M73 P33 R17
G1 X117.151 Y144.796 E.00311
G1 X116.654 Y144.875 E.01787
G1 X90.162 Y118.384 E1.33022
G3 X89.899 Y118.77 I-.912 J-.341 E.01675
G1 X116.094 Y144.965 E1.31536
G1 X115.585 Y145.047 E.0183
G1 X115.546 Y145.066 E.00156
G1 X89.593 Y119.114 E1.30318
G1 X89.288 Y119.458 E.01633
G1 X115.116 Y145.286 E1.29691
G1 X114.686 Y145.505 E.01714
G1 X88.983 Y119.802 E1.29064
G1 X88.678 Y120.146 E.01633
G1 X114.256 Y145.724 E1.28437
G1 X114.176 Y145.765 E.00318
G1 X113.911 Y146.029 E.01328
G1 X88.373 Y120.49 E1.28239
G1 X87.992 Y120.759 E.01655
G1 X113.586 Y146.354 E1.2852
G1 X113.261 Y146.678 E.0163
G1 X87.608 Y121.024 E1.28817
G1 X87.223 Y121.289 E.01657
G1 X112.975 Y147.041 E1.29308
G1 X112.756 Y147.471 E.01714
G1 X86.839 Y121.554 E1.30138
G1 X86.455 Y121.819 E.01657
G1 X112.537 Y147.901 E1.30967
G1 X112.335 Y148.298 E.01578
G1 X112.328 Y148.342 E.00161
G1 X86.027 Y122.04 E1.3207
G1 X85.556 Y122.219 E.01787
G1 X112.148 Y148.811 E1.33527
G1 X111.499 Y148.811 E.02306
G1 X111.066 Y148.379 E.02172
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.499 Y148.811 E-.06974
G1 X112.148 Y148.811 E-.07402
G1 X111.626 Y148.289 E-.08423
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I.756 J-.953 P1  F28800
G1 X108.486 Y145.798 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X85.086 Y122.398 E1.17499
G1 X84.615 Y122.577 E.01787
G1 X107.401 Y145.362 E1.14414
G1 X106.993 Y145.298 E.01466
G1 X106.729 Y145.34 E.00949
G1 X90.81 Y129.421 E.79933
G1 X90.461 Y128.756 E.02668
G1 X88.692 Y126.761 E.09467
G1 X86.942 Y125.553 E.07552
G1 X84.145 Y122.756 E.14045
G3 X83.625 Y122.886 I-.523 J-.986 E.0192
G1 X85.673 Y124.933 E.10282
G1 X84.626 Y124.536 E.03976
G1 X83.046 Y122.956 E.07932
G1 X82.467 Y123.026 E.02071
G1 X83.704 Y124.264 E.06213
G1 X82.966 Y124.174 E.02643
G1 X82.205 Y123.413 E.03819
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X82.966 Y124.174 E-.12263
G1 X83.704 Y124.264 E-.08486
G1 X83.577 Y124.136 E-.02052
; WIPE_END
G1 E-.012 F1800
G17
M73 P34 R17
G3 Z.6 I-.775 J.938 P1  F28800
G1 X91.038 Y130.299 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X106.168 Y145.428 E.75969
G1 X105.607 Y145.516 E.02017
G1 X91.861 Y131.771 E.69023
G1 X92.073 Y132.632 E.0315
G1 X105.171 Y145.73 E.65771
G1 X104.741 Y145.949 E.01715
G1 X92.285 Y133.493 E.62545
G1 X92.337 Y133.704 E.00769
G1 X92.337 Y134.194 E.01742
G1 X104.31 Y146.168 E.60125
G1 X103.986 Y146.493 E.0163
G1 X92.337 Y134.844 E.58497
G1 X92.337 Y135.493 E.02306
G1 X103.662 Y146.818 E.56868
G1 X103.338 Y147.144 E.0163
G1 X92.337 Y136.142 E.5524
G1 X92.337 Y136.37 E.00809
G1 X92.253 Y136.709 E.01237
G1 X103.107 Y147.562 E.545
G1 X102.888 Y147.992 E.01714
G1 X92.125 Y137.23 E.54042
G1 X91.997 Y137.751 E.01905
G1 X102.668 Y148.422 E.53585
G1 X102.597 Y148.811 E.01405
G1 X102.408 Y148.811 E.0067
G1 X91.869 Y138.272 E.52922
G1 X91.74 Y138.793 E.01905
G1 X98.881 Y145.934 E.35857
G1 X98.109 Y145.811 E.02778
G1 X91.547 Y139.249 E.32948
G1 X91.323 Y139.675 E.01708
G1 X97.523 Y145.875 E.31132
G1 X96.964 Y145.964 E.02013
G1 X91.1 Y140.101 E.29443
G1 X90.876 Y140.526 E.01708
G1 X96.487 Y146.137 E.28171
G1 X96.056 Y146.356 E.01714
G1 X90.653 Y140.952 E.27133
G1 X90.53 Y141.187 E.00942
G3 X90.418 Y141.367 I-.421 J-.138 E.00757
G1 X95.627 Y146.576 E.26157
G1 X95.303 Y146.901 E.0163
G1 X90.113 Y141.711 E.2606
G1 X89.808 Y142.055 E.01633
G1 X94.978 Y147.225 E.25962
G1 X94.731 Y147.472 E.01241
G1 X94.678 Y147.575 E.0041
G1 X89.502 Y142.399 E.25991
G1 X89.197 Y142.743 E.01633
G1 X94.459 Y148.005 E.26423
G1 X94.24 Y148.435 E.01714
G1 X88.892 Y143.087 E.26855
G3 X88.559 Y143.404 I-.811 J-.518 E.01647
G1 X94.172 Y149.017 E.28183
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X92.758 Y147.603 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I.62 J-1.047 P1  F28800
G1 X91.168 Y146.662 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X88.175 Y143.669 E.15029
G1 X87.791 Y143.935 E.01657
G1 X90.158 Y146.302 E.11886
G1 X89.597 Y146.39 E.02016
G1 X87.407 Y144.2 E.10998
G1 X87.023 Y144.465 E.01657
G1 X89.046 Y146.488 E.1016
G1 X88.616 Y146.707 E.01715
G1 X86.639 Y144.73 E.09927
G1 X86.498 Y144.827 E.00606
G1 X86.2 Y144.941 E.01134
G1 X88.186 Y146.926 E.0997
G1 X88.086 Y146.977 E.00396
G1 X87.836 Y147.227 E.01254
G1 X85.729 Y145.119 E.10581
G1 X85.259 Y145.298 E.01787
G1 X87.512 Y147.551 E.11313
G1 X87.296 Y147.767 E.01081
G1 X87.223 Y147.912 E.00578
G1 X84.788 Y145.477 E.12225
G1 X84.317 Y145.656 E.01787
G1 X87.004 Y148.342 E.13489
G1 X86.789 Y148.776 E.01721
G1 X83.81 Y145.798 E.14957
G1 X83.231 Y145.868 E.02071
G1 X86.174 Y148.811 E.14779
G1 X85.525 Y148.811 E.02306
G1 X82.652 Y145.938 E.14427
G1 X82.411 Y145.967 E.00863
G1 X82.411 Y146.346 E.01345
G1 X84.876 Y148.811 E.12378
G1 X84.226 Y148.811 E.02306
G1 X82.411 Y146.995 E.09118
G1 X82.411 Y147.645 E.02306
G1 X83.577 Y148.811 E.05857
G1 X82.928 Y148.811 E.02306
G1 X82.205 Y148.088 E.03629
M106 S255
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X82.928 Y148.811 E-.11652
G1 X83.577 Y148.811 E-.07402
G1 X83.345 Y148.579 E-.03745
; WIPE_END
G1 E-.012 F1800

; open powerlost recovery
M1003 S1
M204 S10000
G17
G3 Z.6 I-.789 J.926 P1  F28800
G1 X189.5 Y239 Z.6
G1 Z.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.2
; FEATURE: Prime tower
; LINE_WIDTH: 0.5
G1  X155.500 Y239.000  E1.2922 F5400
M73 P35 R17
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X155.500 
G1  Y219.500 
G1  X156.500 
;--------------------
; CP EMPTY GRID START
; layer #3
G1  Y239.000  E0.7411
G1  X164.500 
G1  Y219.500  E0.7411
G1  X172.500 
G1  Y239.000  E0.7411
G1  X180.500 
G1  Y219.500  E0.7411
G1  X188.500 
G1  Y239.000  E0.7411
; CP EMPTY GRID END
;------------------






G1  X190.000 
G1  Y239.500 
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
G1  X190.457 
G1  Y239.957 
G1  X154.543  E1.3650
G1  Y218.543  E0.8139
G1  X190.457  E1.3650
G1  Y239.957  E0.8139
G1  X190.914 
G1  Y240.414 
G1  X154.086  E1.3997
G1  Y218.086  E0.8486
G1  X190.914  E1.3997
G1  Y240.414  E0.8486
G1  X191.371 
G1  Y240.871 
G1  X153.629  E1.4345
G1  Y217.629  E0.8834
G1  X191.371  E1.4345
G1  Y240.871  E0.8834
G1  X191.828 
G1  Y241.328 
G1  X153.172  E1.4692
G1  Y217.172  E0.9181
G1  X191.828  E1.4692
G1  Y241.328  E0.9181
G1  X192.285 
G1  Y241.785 
G1  X152.715  E1.5039
G1  Y216.715  E0.9528
G1  X192.285  E1.5039
G1  Y241.785  E0.9528

G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X190.285 Y241.785 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.8 I1.13 J-.451 P1  F28800
G1 X151.294 Y144.071 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X149.634 Y144.918 E.05864
G1 X148.282 Y146.268 E.06017
G1 X147.413 Y147.973 E.06022
G1 X147.21 Y149.259 E.04099
G1 X145.707 Y149.259 E.04731
G1 X145.529 Y148.127 E.03608
G1 X144.732 Y146.563 E.05525
G1 X143.491 Y145.322 E.05524
G1 X141.927 Y144.525 E.05526
G1 X140.193 Y144.252 E.05527
G1 X138.46 Y144.525 E.0552
G1 X136.896 Y145.322 E.05525
G1 X135.656 Y146.563 E.05524
G1 X134.859 Y148.127 E.05525
G1 X134.68 Y149.259 E.03608
G1 X133.137 Y149.259 E.04858
G1 X132.982 Y148.281 E.03118
G1 X132.256 Y146.857 E.05033
G1 X131.125 Y145.726 E.05034
G1 X129.701 Y145.001 E.0503
G1 X128.123 Y144.751 E.0503
G1 X126.545 Y145.001 E.05029
G1 X125.119 Y145.726 E.05035
G2 X123.99 Y146.857 I494.001 J494.187 E.05032
G1 X123.263 Y148.281 E.05031
G1 X123.108 Y149.259 E.03118
G1 X121.665 Y149.259 E.04544
G1 X121.534 Y148.437 E.02621
G1 X120.88 Y147.151 E.04542
G1 X119.861 Y146.132 E.04537
G1 X118.575 Y145.478 E.04541
G1 X117.151 Y145.249 E.04542
G1 X115.726 Y145.478 E.04543
G1 X114.443 Y146.132 E.04534
G1 X113.422 Y147.151 E.0454
G1 X112.767 Y148.437 E.04545
G1 X112.638 Y149.259 E.02619
G1 X111.008 Y149.259 E.05132
G1 X110.903 Y148.591 E.02129
G1 X110.321 Y147.45 E.04031
G2 X109.394 Y146.532 I-7.299 J6.438 E.04111
G2 X108.244 Y145.948 I-3.686 J5.839 E.04064
G1 X106.993 Y145.752 E.03988
G1 X105.725 Y145.951 E.0404
G1 X104.578 Y146.534 E.04049
G1 X103.67 Y147.445 E.04051
G1 X103.085 Y148.59 E.04048
G1 X102.979 Y149.259 E.02131
G1 X101.531 Y149.259 E.04556
G1 X101.451 Y148.745 E.01638
G1 X100.938 Y147.739 E.03555
G1 X100.14 Y146.941 E.03554
G2 X99.133 Y146.427 I-87.594 J170.557 E.03556
G1 X98.017 Y146.249 E.0356
G1 X96.902 Y146.428 E.03553
G1 X95.896 Y146.94 E.03553
G1 X95.098 Y147.739 E.03556
G1 X94.585 Y148.744 E.03553
G1 X94.503 Y149.259 E.0164
G1 X93.195 Y149.259 E.04117
G1 X93.138 Y148.898 E.01149
G1 X92.696 Y148.032 E.03062
G1 X92.007 Y147.344 E.03066
G1 X91.141 Y146.903 E.03059
G1 X90.181 Y146.752 E.03059
M73 P36 R17
G1 X89.219 Y146.903 E.03066
G1 X88.353 Y147.344 E.03059
G1 X87.663 Y148.033 E.03068
G1 X87.223 Y148.899 E.03059
G1 X87.166 Y149.259 E.01147
G1 X81.963 Y149.259 E.1638
G1 X81.963 Y145.571 E.11611
G1 X83.898 Y145.336 E.06136
G1 X86.289 Y144.428 E.08051
G1 X88.393 Y142.975 E.08049
G1 X90.09 Y141.062 E.08051
G1 X91.278 Y138.798 E.08048
G1 X91.889 Y136.316 E.08046
G1 X91.889 Y133.758 E.08053
G1 X91.278 Y131.276 E.08046
G1 X90.09 Y129.012 E.08048
G1 X88.393 Y127.099 E.08051
G1 X86.289 Y125.646 E.08049
G1 X83.898 Y124.738 E.0805
G1 X81.963 Y124.504 E.06136
G1 X81.963 Y122.636 E.05878
G1 X83.778 Y122.416 E.05756
G1 X86.057 Y121.55 E.07673
G1 X88.061 Y120.167 E.07665
G1 X89.678 Y118.344 E.07672
G1 X90.81 Y116.186 E.0767
G1 X91.393 Y113.82 E.07671
G1 X91.393 Y111.384 E.07669
G1 X90.81 Y109.018 E.07671
G1 X89.678 Y106.86 E.0767
G1 X88.061 Y105.037 E.07671
G1 X86.057 Y103.652 E.07669
G1 X83.778 Y102.788 E.07672
G1 X81.963 Y102.568 E.05756
G1 X81.962 Y96.463 E.19217
G1 X85.105 Y96.463 E.09891
G1 X85.352 Y98.346 E.05979
G1 X86.313 Y100.665 E.07901
G1 X87.839 Y102.653 E.0789
G1 X89.829 Y104.179 E.07894
G2 X92.146 Y105.14 I473.033 J-1137.341 E.07895
G1 X94.633 Y105.466 E.07896
G1 X97.118 Y105.14 E.0789
G2 X99.436 Y104.179 I-722.804 J-1747.734 E.07901
G1 X101.426 Y102.653 E.07894
G1 X102.953 Y100.665 E.0789
G1 X103.911 Y98.346 E.07897
G1 X104.16 Y96.463 E.05979
G1 X106.727 Y96.463 E.08079
G1 X106.958 Y98.216 E.05566
G1 X107.867 Y100.415 E.07489
G1 X109.315 Y102.301 E.07486
G1 X111.201 Y103.747 E.07481
G1 X113.398 Y104.656 E.07483
G1 X115.755 Y104.966 E.07484
G1 X118.112 Y104.656 E.07484
G1 X120.308 Y103.747 E.07482
G1 X122.194 Y102.301 E.07482
G1 X123.643 Y100.415 E.07486
G1 X124.551 Y98.216 E.07489
G1 X124.783 Y96.463 E.05566
G1 X126.981 Y96.463 E.06919
G1 X127.194 Y98.088 E.0516
G1 X128.055 Y100.163 E.0707
G1 X129.423 Y101.946 E.07076
G1 X131.205 Y103.315 E.07073
G1 X133.282 Y104.174 E.07073
G1 X135.509 Y104.468 E.07072
G1 X137.738 Y104.174 E.07078
G1 X139.814 Y103.315 E.07073
G1 X141.596 Y101.946 E.07073
G1 X142.965 Y100.163 E.07077
G1 X143.823 Y98.088 E.07068
G1 X144.037 Y96.463 E.05159
G1 X145.875 Y96.463 E.05785
G1 X146.115 Y98.144 E.05346
G1 X147.075 Y100.244 E.07268
G2 X148.587 Y101.987 I1314.985 J-1138.86 E.07262
G1 X150.528 Y103.234 E.07264
G1 X152.742 Y103.885 E.07265
G1 X155.048 Y103.885 E.07259
G2 X157.264 Y103.234 I-72.359 J-250.398 E.07269
G1 X159.205 Y101.987 E.07264
G1 X160.716 Y100.244 E.07262
G1 X161.674 Y98.145 E.07264
G1 X161.918 Y96.463 E.05348
G1 X165.757 Y96.463 E.12084
G1 X165.757 Y99.943 E.10956
G1 X164.215 Y100.165 E.04902
G1 X162.246 Y101.065 E.06816
G1 X160.609 Y102.483 E.06816
G1 X159.439 Y104.304 E.06815
G1 X158.829 Y106.382 E.06818
G1 X158.829 Y108.548 E.06816
G1 X159.439 Y110.626 E.06818
G1 X160.609 Y112.447 E.06814
G1 X162.246 Y113.867 E.0682
G1 X164.215 Y114.767 E.06817
G1 X165.757 Y114.987 E.04901
G1 X165.757 Y117.138 E.06769
G1 X164.357 Y117.339 E.0445
G1 X162.516 Y118.179 E.0637
G1 X160.987 Y119.503 E.06366
G1 X159.893 Y121.207 E.06374
G1 X159.325 Y123.147 E.06364
G1 X159.325 Y125.169 E.06367
G1 X159.893 Y127.112 E.0637
G1 X160.987 Y128.813 E.06368
G1 X162.516 Y130.139 E.0637
G1 X164.357 Y130.979 E.06371
G1 X165.757 Y131.181 E.0445
G1 X165.757 Y132.965 E.05618
G1 X164.318 Y133.193 E.04584
G1 X162.475 Y134.132 E.06513
G1 X161.012 Y135.595 E.06513
G1 X160.073 Y137.437 E.06508
G1 X159.749 Y139.479 E.0651
G1 X160.073 Y141.521 E.06509
G1 X161.012 Y143.365 E.06514
G1 X162.475 Y144.826 E.06509
G1 X164.318 Y145.765 E.06512
G1 X165.757 Y145.993 E.04584
G1 X165.757 Y149.259 E.10281
G1 X159.239 Y149.259 E.20518
G1 X159.034 Y147.973 E.04099
G1 X158.168 Y146.269 E.06018
G1 X156.815 Y144.918 E.06018
G2 X155.113 Y144.049 I-197.995 J385.879 E.06016
G1 X153.225 Y143.749 E.06018
G1 X151.348 Y144.047 E.05981
G1 X151.35 Y144.483 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X149.868 Y145.239 E.04852
G1 X148.603 Y146.502 E.05212
G1 X147.79 Y148.095 E.05215
G1 X147.545 Y149.651 E.04592
G1 X145.372 Y149.651 E.06337
G1 X145.151 Y148.249 E.04138
G1 X144.411 Y146.796 E.04756
G1 X143.258 Y145.643 E.04755
G1 X141.804 Y144.903 E.04756
G1 X140.193 Y144.648 E.04758
G1 X138.583 Y144.903 E.04752
G1 X137.13 Y145.643 E.04756
G1 X135.977 Y146.796 E.04755
G1 X135.236 Y148.249 E.04756
G1 X135.015 Y149.651 E.04138
G1 X132.802 Y149.651 E.06453
G1 X132.605 Y148.403 E.03684
G1 X131.935 Y147.09 E.04299
G1 X130.892 Y146.047 E.04301
G1 X129.578 Y145.379 E.04297
G1 X128.123 Y145.148 E.04297
G1 X126.667 Y145.379 E.04297
G1 X125.352 Y146.047 E.04302
G2 X124.311 Y147.09 I456.8 J456.937 E.04298
G1 X123.641 Y148.403 E.04299
G1 X123.443 Y149.651 E.03684
G1 X121.33 Y149.651 E.06162
G1 X121.157 Y148.559 E.03223
G1 X120.559 Y147.384 E.03845
G1 X119.628 Y146.453 E.0384
G1 X118.453 Y145.855 E.03845
G1 X117.151 Y145.646 E.03844
G1 X115.849 Y145.855 E.03845
G1 X114.676 Y146.453 E.03839
G1 X113.743 Y147.384 E.03843
G1 X113.144 Y148.56 E.03846
G1 X112.973 Y149.651 E.03222
G1 X110.672 Y149.651 E.06709
G1 X110.525 Y148.713 E.02768
G1 X109.998 Y147.68 E.03383
G2 X109.17 Y146.854 I-7.53 J6.717 E.0341
G2 X108.134 Y146.328 I-3.393 J5.396 E.03395
G1 X106.993 Y146.148 E.03368
G1 X105.847 Y146.329 E.03381
G1 X104.812 Y146.855 E.03387
G1 X103.991 Y147.678 E.0339
G1 X103.463 Y148.713 E.03388
G1 X103.313 Y149.651 E.02769
G1 X101.196 Y149.651 E.06174
G1 X101.073 Y148.867 E.02313
G1 X100.617 Y147.972 E.0293
G1 X99.906 Y147.261 E.02931
G2 X99.011 Y146.805 I-77.921 J151.773 E.02931
G1 X98.017 Y146.646 E.02935
G1 X97.025 Y146.805 E.02929
G1 X96.13 Y147.261 E.0293
G1 X95.419 Y147.972 E.02932
G1 X94.963 Y148.867 E.0293
G1 X94.838 Y149.651 E.02314
G1 X92.86 Y149.651 E.05766
G1 X92.761 Y149.021 E.01859
G1 X92.375 Y148.266 E.02474
G1 X91.774 Y147.665 E.02478
G1 X91.018 Y147.281 E.02471
G1 X90.181 Y147.148 E.02473
G1 X89.341 Y147.281 E.02478
G1 X88.586 Y147.665 E.02471
G1 X87.985 Y148.266 E.02479
G1 X87.6 Y149.022 E.02471
G1 X87.501 Y149.651 E.01858
G1 X81.571 Y149.651 E.17293
G1 X81.571 Y145.223 E.12912
G1 X83.803 Y144.952 E.06558
G1 X86.105 Y144.078 E.07179
G1 X88.131 Y142.679 E.07179
G1 X89.765 Y140.837 E.0718
G1 X90.909 Y138.658 E.07177
G1 X91.497 Y136.269 E.07176
G1 X91.497 Y133.806 E.07182
G1 X90.909 Y131.416 E.07176
G1 X89.765 Y129.237 E.07177
G1 X88.131 Y127.395 E.0718
G1 X86.105 Y125.996 E.07179
G1 X83.803 Y125.122 E.07179
G1 X81.571 Y124.851 E.06558
G1 X81.571 Y122.289 E.0747
G1 X83.683 Y122.032 E.06206
G1 X85.873 Y121.2 E.0683
G1 X87.799 Y119.871 E.06823
G1 X89.353 Y118.119 E.06829
G1 X90.441 Y116.046 E.06827
G1 X91.001 Y113.773 E.06828
G1 X91.001 Y111.432 E.06826
G1 X90.441 Y109.158 E.06828
G1 X89.353 Y107.085 E.06827
G1 X87.799 Y105.333 E.06829
G1 X85.873 Y104.002 E.06826
G1 X83.683 Y103.172 E.06829
G1 X81.571 Y102.915 E.06206
G1 X81.57 Y96.071 E.19957
G1 X85.449 Y96.071 E.11309
G1 X85.486 Y96.355 E.00834
G1 X85.734 Y98.244 E.05556
G1 X86.655 Y100.467 E.07017
G1 X88.119 Y102.373 E.07007
G1 X90.027 Y103.836 E.07011
G2 X92.248 Y104.758 I453.296 J-1089.832 E.07012
G1 X94.633 Y105.071 E.07014
G1 X97.015 Y104.758 E.07008
G2 X99.239 Y103.836 I-693.263 J-1676.251 E.07017
G1 X101.146 Y102.373 E.07012
G1 X102.61 Y100.467 E.07007
G1 X103.529 Y98.244 E.07015
G1 X103.817 Y96.071 E.06391
G1 X107.071 Y96.071 E.09488
G1 X107.34 Y98.114 E.06008
G1 X108.209 Y100.217 E.06636
G1 X109.595 Y102.021 E.06633
G1 X111.399 Y103.405 E.06629
G1 X111.662 Y103.514 E.00832
G1 X113.5 Y104.274 E.05799
G1 X115.755 Y104.571 E.06632
G1 X118.01 Y104.274 E.06632
G1 X120.111 Y103.405 E.0663
G1 X121.914 Y102.021 E.06629
G1 X123.3 Y100.217 E.06633
G1 X124.169 Y98.114 E.06636
G1 X124.439 Y96.071 E.06008
G1 X127.325 Y96.071 E.08414
G1 X127.576 Y97.986 E.05632
G1 X128.397 Y99.965 E.06248
G1 X129.703 Y101.667 E.06254
G1 X131.403 Y102.973 E.0625
G1 X133.384 Y103.792 E.06251
G1 X135.509 Y104.073 E.0625
G1 X137.636 Y103.792 E.06256
G1 X139.617 Y102.973 E.06251
G1 X141.317 Y101.667 E.0625
G1 X142.622 Y99.965 E.06255
G1 X143.441 Y97.986 E.06246
G1 X143.693 Y96.071 E.05631
G1 X146.215 Y96.071 E.07353
G1 X146.495 Y98.033 E.05779
G1 X147.408 Y100.03 E.06403
G2 X148.846 Y101.687 I1250.983 J-1083.453 E.06398
G1 X150.693 Y102.874 E.06401
G1 X152.798 Y103.493 E.06401
G1 X154.992 Y103.493 E.06398
G2 X157.099 Y102.874 I-68.889 J-238.304 E.06402
G1 X158.946 Y101.687 E.06401
G1 X160.383 Y100.03 E.06398
G1 X161.294 Y98.033 E.064
G1 X161.578 Y96.071 E.0578
G1 X166.149 Y96.071 E.13327
G1 X166.149 Y100.283 E.12282
G1 X164.327 Y100.546 E.05367
G1 X162.46 Y101.399 E.05985
G1 X160.908 Y102.742 E.05985
G1 X159.8 Y104.469 E.05984
G1 X159.221 Y106.439 E.05987
G1 X159.221 Y108.491 E.05985
G1 X159.8 Y110.461 E.05987
G1 X160.908 Y112.188 E.05983
G1 X162.46 Y113.534 E.05989
G1 X164.327 Y114.387 E.05986
G1 X166.149 Y114.647 E.05366
G1 X166.149 Y117.477 E.08252
G1 X164.469 Y117.72 E.04949
G1 X162.73 Y118.513 E.05573
G1 X161.286 Y119.762 E.05568
G1 X160.254 Y121.371 E.05575
G1 X159.717 Y123.203 E.05566
G1 X159.717 Y125.113 E.0557
G1 X160.254 Y126.947 E.05572
G1 X161.286 Y128.554 E.0557
G1 X162.73 Y129.806 E.05571
G1 X164.469 Y130.599 E.05573
G1 X166.149 Y130.841 E.04949
G1 X166.149 Y133.3 E.0717
G1 X164.441 Y133.571 E.05042
G1 X162.708 Y134.453 E.05671
G1 X161.333 Y135.828 E.0567
G1 X160.451 Y137.559 E.05666
G1 X160.146 Y139.479 E.05668
G1 X160.451 Y141.399 E.05668
G1 X161.333 Y143.132 E.05671
G1 X162.708 Y144.505 E.05667
G1 X164.441 Y145.387 E.05671
G1 X166.149 Y145.658 E.05042
G1 X166.149 Y149.651 E.11643
G1 X158.904 Y149.651 E.21125
G1 X158.657 Y148.095 E.04593
G1 X157.847 Y146.502 E.05212
G1 X156.582 Y145.239 E.05213
G2 X154.99 Y144.427 I-185.007 J360.512 E.0521
G1 X153.225 Y144.146 E.05213
G1 X151.459 Y144.427 E.05213
G1 X151.403 Y144.455 E.00183
G1 X151.037 Y144.233 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X149.868 Y145.239 E-.19653
G1 X149.672 Y145.434 E-.03147
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.8 I-.777 J-.937 P1  F28800
G1 X147.758 Y147.022 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420509
G1 F15000
G1 X145.939 Y148.841 E.07512
G1 X145.959 Y148.965 E.00367
G1 X146.349 Y148.965 E.0114
G1 X147.073 Y148.241 E.0299
G1 X146.973 Y148.875 E.01874
G1 X146.713 Y149.135 E.01073
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X146.973 Y148.875 E-.04188
G1 X147.073 Y148.241 E-.07316
G1 X146.372 Y148.942 E-.11296
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.8 I.532 J-1.094 P1  F28800
G1 X137.751 Y144.747 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X159.031 Y123.467 E.87871
G1 X159.031 Y124.001 E.01559
G1 X138.869 Y144.163 E.83254
G1 X139.503 Y144.063 E.01875
G1 X159.031 Y124.535 E.80635
G1 X159.031 Y125.069 E.01559
G1 X140.137 Y143.963 E.78016
G1 X140.193 Y143.954 E.00163
G1 X140.614 Y144.02 E.01245
G1 X159.119 Y125.515 E.76416
G1 X159.24 Y125.928 E.01257
G1 X141.075 Y144.093 E.75011
G1 X141.536 Y144.166 E.01363
G1 X159.361 Y126.341 E.73606
G1 X159.482 Y126.754 E.01257
G1 X141.997 Y144.239 E.72201
G1 X142.356 Y144.414 E.01166
G1 X159.603 Y127.167 E.71219
G1 X159.623 Y127.235 E.00207
G1 X159.798 Y127.506 E.00943
G1 X142.71 Y144.594 E.70561
G1 X143.064 Y144.774 E.01159
G1 X160.006 Y127.832 E.69962
G1 X160.215 Y128.157 E.01128
G1 X143.418 Y144.954 E.69364
G1 X143.666 Y145.081 E.00814
G1 X143.745 Y145.16 E.00328
G1 X160.424 Y128.482 E.68873
G1 X160.633 Y128.807 E.01128
G1 X144.012 Y145.427 E.68633
G1 X144.279 Y145.694 E.01103
G1 X160.872 Y129.102 E.68514
G1 X161.158 Y129.35 E.01105
G1 X144.546 Y145.961 E.68593
G1 X144.813 Y146.228 E.01103
G1 X161.444 Y129.598 E.68671
G1 X161.73 Y129.846 E.01105
G1 X145.045 Y146.53 E.68895
G1 X145.226 Y146.884 E.01159
G1 X162.016 Y130.094 E.69332
G1 X162.302 Y130.342 E.01105
G1 X145.406 Y147.238 E.69769
G1 X145.586 Y147.592 E.01159
G1 X162.653 Y130.525 E.70476
G1 X163.02 Y130.692 E.01177
G1 X145.766 Y147.946 E.71247
G1 X145.812 Y148.035 E.00293
G1 X145.866 Y148.38 E.01019
G1 X163.387 Y130.859 E.72348
G1 X163.753 Y131.026 E.01177
G1 X150.773 Y144.007 E.53601
G1 X151.245 Y143.766 E.01547
G1 X151.605 Y143.709 E.01065
G1 X164.12 Y131.194 E.5168
G1 X164.274 Y131.264 E.00493
G1 X164.545 Y131.303 E.008
G1 X152.24 Y143.608 E.50813
G1 X152.874 Y143.507 E.01877
G1 X165.012 Y131.37 E.50119
G1 X165.463 Y131.435 E.0133
G1 X165.463 Y131.453 E.00053
G1 X163.777 Y133.139 E.06961
G1 X164.226 Y132.91 E.01473
G1 X164.599 Y132.851 E.01101
G1 X165.463 Y131.987 E.03567
G1 X165.463 Y132.521 E.01559
G1 X165.029 Y132.955 E.0179
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X165.463 Y132.521 E-.06987
G1 X165.463 Y131.987 E-.06087
G1 X164.859 Y132.59 E-.09726
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.8 I-.804 J-.914 P1  F28800
G1 X160.405 Y136.51 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X153.431 Y143.485 E.28798
G1 X153.892 Y143.558 E.01362
G1 X159.73 Y137.719 E.24109
G1 X159.63 Y138.354 E.01876
G1 X154.353 Y143.631 E.2179
G1 X154.814 Y143.704 E.01362
G1 X159.529 Y138.989 E.19472
G1 X159.451 Y139.479 E.0145
G1 X159.468 Y139.584 E.0031
G1 X155.258 Y143.793 E.17383
G1 X155.612 Y143.974 E.01159
G1 X159.541 Y140.045 E.16225
G1 X159.614 Y140.506 E.01363
G1 X155.965 Y144.154 E.15067
G1 X156.319 Y144.335 E.01159
G1 X159.687 Y140.966 E.13909
G1 X159.76 Y141.427 E.01363
G1 X156.673 Y144.515 E.12751
G1 X157.017 Y144.704 E.01148
G1 X159.897 Y141.824 E.11893
M73 P36 R16
G1 X160.077 Y142.178 E.01159
G1 X157.285 Y144.971 E.11533
G1 X157.552 Y145.238 E.01103
G1 X160.258 Y142.532 E.11173
G1 X160.438 Y142.886 E.01159
G1 X157.819 Y145.505 E.10813
G1 X158.086 Y145.772 E.01103
G1 X160.618 Y143.24 E.10454
G1 X160.771 Y143.541 E.00985
G1 X160.811 Y143.581 E.00166
G1 X158.353 Y146.038 E.10148
G1 X158.409 Y146.094 E.00229
G1 X158.551 Y146.374 E.00919
G1 X161.078 Y143.848 E.10434
G1 X161.345 Y144.114 E.01103
G1 X158.731 Y146.728 E.10794
G1 X158.911 Y147.082 E.0116
G1 X161.613 Y144.381 E.11154
G1 X161.88 Y144.648 E.01103
G1 X159.091 Y147.436 E.11514
G1 X159.271 Y147.79 E.0116
G1 X162.147 Y144.915 E.11874
G2 X162.451 Y145.144 I.506 J-.354 E.01132
G1 X159.372 Y148.224 E.12715
G1 X159.445 Y148.684 E.01362
G1 X162.805 Y145.325 E.13874
G1 X163.159 Y145.505 E.01159
G1 X159.699 Y148.965 E.14289
G1 X160.233 Y148.965 E.01559
G1 X163.513 Y145.685 E.13545
G1 X163.867 Y145.865 E.01159
G1 X160.767 Y148.965 E.12801
G1 X161.301 Y148.965 E.01559
G1 X164.221 Y146.045 E.12057
G1 X164.68 Y146.12 E.01358
G1 X161.835 Y148.965 E.11748
G1 X162.369 Y148.965 E.01559
G1 X165.141 Y146.193 E.11446
G1 X165.463 Y146.244 E.00952
G1 X165.463 Y146.405 E.0047
G1 X162.903 Y148.965 E.10571
G1 X163.437 Y148.965 E.01559
G1 X165.463 Y146.939 E.08366
G1 X165.463 Y147.473 E.01559
G1 X163.971 Y148.965 E.06161
G1 X164.505 Y148.965 E.01559
G1 X165.463 Y148.007 E.03956
G1 X165.463 Y148.541 E.01559
G1 X164.869 Y149.135 E.02451
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X165.463 Y148.541 E-.09571
G1 X165.463 Y148.007 E-.06088
G1 X165.02 Y148.45 E-.07141
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.8 I1.134 J-.442 P1  F28800
G1 X144.793 Y96.588 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X144.245 Y97.136 E.02263
G1 X144.164 Y97.75 E.01811
G1 X145.157 Y96.757 E.04101
G1 X145.62 Y96.757 E.01349
G1 X145.629 Y96.82 E.00185
G1 X143.987 Y98.462 E.06779
G1 X143.61 Y99.373 E.02879
G1 X145.695 Y97.287 E.08612
G1 X145.762 Y97.754 E.01378
G1 X142.355 Y101.162 E.1407
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X143.769 Y99.747 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.8 I.208 J-1.199 P1  F28800
G1 X125.569 Y96.588 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X124.986 Y97.171 E.0241
G1 X124.905 Y97.786 E.01812
G1 X125.934 Y96.757 E.0425
G1 X126.468 Y96.757 E.01559
G1 X124.771 Y98.454 E.07005
G1 X124.395 Y99.364 E.02875
G1 X126.755 Y97.004 E.09745
G1 X126.817 Y97.476 E.0139
G1 X123.539 Y100.754 E.13538
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X124.953 Y99.34 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.8 I.129 J-1.21 P1  F28800
G1 X104.197 Y97.134 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X104.574 Y96.757 E.01557
G1 X105.108 Y96.757 E.01559
G1 X104.313 Y97.552 E.03284
G1 X104.231 Y98.168 E.01813
G1 X105.642 Y96.757 E.05825
G1 X106.176 Y96.757 E.01559
G1 X103.977 Y98.956 E.09079
G1 X103.601 Y99.866 E.02876
G1 X106.497 Y96.97 E.11959
G1 X106.559 Y97.442 E.01389
G1 X102.358 Y101.643 E.1735
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X103.772 Y100.229 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.8 I.209 J-1.199 P1  F28800
G1 X82.85 Y96.588 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X82.257 Y97.181 E.02451
G1 X82.257 Y97.715 E.01559
G1 X83.214 Y96.757 E.03956
G1 X83.748 Y96.757 E.01559
G1 X82.257 Y98.249 E.0616
G1 X82.257 Y98.783 E.01559
G1 X84.282 Y96.757 E.08365
G1 X84.816 Y96.757 E.01559
G1 X82.257 Y99.317 E.1057
G1 X82.257 Y99.851 E.01559
G1 X84.905 Y97.202 E.10937
G1 X84.967 Y97.674 E.0139
G1 X82.257 Y100.385 E.11193
G1 X82.257 Y100.919 E.01559
G1 X85.029 Y98.146 E.11449
G2 X85.13 Y98.579 I.857 J.028 E.01313
G1 X82.257 Y101.453 E.11866
G1 X82.257 Y101.987 E.01559
G1 X85.287 Y98.957 E.12512
G1 X85.443 Y99.334 E.01193
G1 X82.447 Y102.33 E.12371
G1 X82.923 Y102.388 E.01401
G1 X85.6 Y99.712 E.11051
G1 X85.756 Y100.089 E.01193
G1 X83.4 Y102.446 E.09731
G1 X83.871 Y102.509 E.01388
G1 X85.913 Y100.467 E.08432
G1 X86.075 Y100.838 E.01184
G1 X84.258 Y102.656 E.07505
G1 X84.645 Y102.802 E.01209
G1 X86.307 Y101.14 E.06864
G1 X86.539 Y101.442 E.01112
G1 X85.032 Y102.949 E.06223
G1 X85.419 Y103.096 E.01209
G1 X86.771 Y101.744 E.05582
G1 X87.003 Y102.046 E.01112
G1 X85.807 Y103.243 E.0494
M73 P37 R16
G1 X86.194 Y103.39 E.01209
G1 X87.235 Y102.348 E.04299
G1 X87.467 Y102.65 E.01112
G1 X86.51 Y103.608 E.03953
G1 X86.826 Y103.826 E.01121
G1 X87.72 Y102.932 E.03693
G1 X88.022 Y103.163 E.01112
G1 X87.141 Y104.044 E.03637
G1 X87.457 Y104.262 E.01121
G1 X88.324 Y103.395 E.03581
G1 X88.626 Y103.627 E.01112
G1 X87.773 Y104.481 E.03525
G1 X88.089 Y104.699 E.01121
G1 X88.929 Y103.859 E.03469
G1 X89.231 Y104.091 E.01112
G1 X88.374 Y104.947 E.03537
G1 X88.625 Y105.23 E.01104
G1 X89.533 Y104.322 E.03749
G2 X89.874 Y104.516 I.532 J-.541 E.01157
G1 X88.876 Y105.513 E.04119
G1 X89.127 Y105.796 E.01104
G1 X90.251 Y104.672 E.04641
G1 X90.628 Y104.829 E.01193
G1 X89.378 Y106.079 E.05163
G1 X89.629 Y106.362 E.01105
G1 X91.006 Y104.986 E.05685
G1 X91.383 Y105.142 E.01193
G1 X89.88 Y106.645 E.06207
G1 X89.922 Y106.692 E.00183
G1 X90.075 Y106.984 E.00964
G1 X91.761 Y105.299 E.06961
G1 X92.069 Y105.426 E.00974
G1 X92.156 Y105.438 E.00255
G1 X90.259 Y107.335 E.07834
G1 X90.442 Y107.685 E.01155
G1 X92.628 Y105.5 E.09024
G1 X93.1 Y105.562 E.0139
G1 X90.626 Y108.035 E.10214
G1 X90.81 Y108.385 E.01155
G1 X93.572 Y105.624 E.11405
G1 X94.044 Y105.686 E.0139
G1 X90.994 Y108.736 E.12595
G3 X91.139 Y109.124 I-.716 J.489 E.01224
G1 X94.516 Y105.748 E.13944
G1 X94.633 Y105.763 E.00344
G1 X95.095 Y105.702 E.01362
G1 X91.244 Y109.553 E.15901
G1 X91.35 Y109.981 E.01288
G1 X95.71 Y105.621 E.18004
G1 X96.325 Y105.54 E.01811
G1 X91.456 Y110.41 E.20107
G1 X91.561 Y110.838 E.01288
G1 X96.94 Y105.46 E.2221
G1 X97.194 Y105.426 E.0075
G1 X97.728 Y105.205 E.01686
G1 X91.667 Y111.267 E.25029
G1 X91.687 Y111.348 E.00246
G1 X91.687 Y111.78 E.01262
G1 X98.64 Y104.827 E.28712
G1 X99.552 Y104.449 E.02882
G1 X91.687 Y112.314 E.32477
G1 X91.687 Y112.848 E.01559
G1 X106.622 Y97.914 E.61671
G1 X106.672 Y98.293 E.01117
G1 X106.702 Y98.367 E.00234
G1 X91.687 Y113.382 E.62004
G1 X91.687 Y113.856 E.01382
G1 X91.667 Y113.936 E.00242
G1 X106.858 Y98.745 E.62731
G1 X107.015 Y99.123 E.01194
G1 X91.492 Y114.645 E.64096
G1 X91.318 Y115.353 E.02131
G1 X107.171 Y99.5 E.65462
G1 X107.327 Y99.878 E.01194
G1 X91.143 Y116.062 E.66828
G1 X91.087 Y116.291 E.00689
G1 X90.688 Y117.051 E.02506
G1 X107.483 Y100.256 E.69353
G1 X107.61 Y100.563 E.00969
G1 X107.653 Y100.62 E.00209
G1 X89.174 Y119.099 E.76306
G1 X82.087 Y123.516 F28800
G1 F15000
G1 X82.768 Y122.835 E.02813
G1 X83.376 Y122.761 E.01788
G1 X82.257 Y123.88 E.04623
G1 X82.257 Y124.243 E.01059
G1 X82.41 Y124.262 E.0045
G1 X84.04 Y122.631 E.06734
G1 X84.902 Y122.303 E.0269
G1 X82.886 Y124.319 E.08324
G1 X83.362 Y124.377 E.01401
G1 X85.763 Y121.976 E.09914
G1 X86.194 Y121.812 E.01347
G1 X87.054 Y121.219 E.03051
G1 X83.838 Y124.435 E.1328
G1 X83.969 Y124.451 E.00384
G1 X84.25 Y124.557 E.00878
G1 X107.885 Y100.922 E.97599
G1 X108.117 Y101.224 E.01112
G1 X84.637 Y124.704 E.96959
G1 X85.024 Y124.851 E.01209
G1 X108.349 Y101.526 E.96319
G1 X108.581 Y101.828 E.01112
G1 X85.411 Y124.998 E.95679
G1 X85.798 Y125.145 E.01209
G1 X108.813 Y102.13 E.95039
G1 X109.045 Y102.432 E.01112
G1 X86.185 Y125.292 E.94399
G3 X86.545 Y125.466 I-.173 J.819 E.01179
G1 X109.329 Y102.682 E.94083
G1 X109.632 Y102.914 E.01112
G1 X86.861 Y125.684 E.94027
G1 X87.177 Y125.902 E.01121
G1 X109.934 Y103.145 E.9397
G1 X110.236 Y103.377 E.01112
G1 X87.493 Y126.12 E.93914
G1 X87.809 Y126.338 E.01121
G1 X110.538 Y103.609 E.93857
G1 X110.84 Y103.841 E.01112
G1 X88.125 Y126.556 E.93801
G1 X88.44 Y126.775 E.01121
G1 X111.165 Y104.05 E.93837
G1 X111.543 Y104.206 E.01194
G1 X88.722 Y127.027 E.94234
G1 X88.973 Y127.31 E.01104
G1 X111.92 Y104.363 E.94757
G1 X112.298 Y104.519 E.01194
G1 X89.224 Y127.593 E.95281
G1 X89.475 Y127.876 E.01104
G1 X112.676 Y104.675 E.95804
G1 X113.054 Y104.832 E.01194
G1 X89.726 Y128.159 E.96327
G1 X89.977 Y128.442 E.01104
G1 X113.459 Y104.96 E.96964
G1 X113.931 Y105.022 E.0139
G1 X90.228 Y128.725 E.97876
G3 X90.44 Y129.047 I-.545 J.59 E.01137
G1 X114.402 Y105.085 E.98949
G1 X114.874 Y105.147 E.0139
G1 X90.624 Y129.397 E1.00138
G1 X90.808 Y129.747 E.01155
G1 X115.346 Y105.209 E1.01327
G1 X115.755 Y105.263 E.01204
G1 X115.837 Y105.252 E.00242
G1 X90.991 Y130.098 E1.02596
G1 X91.175 Y130.448 E.01155
G1 X116.452 Y105.171 E1.04376
G1 X117.067 Y105.09 E.01811
G1 X91.359 Y130.798 E1.06157
G1 X91.543 Y131.148 E.01155
G1 X117.682 Y105.009 E1.07938
G1 X118.189 Y104.942 E.01491
G1 X118.349 Y104.876 E.00508
G1 X91.653 Y131.572 E1.10237
G1 X91.759 Y132 E.01289
G1 X119.26 Y104.499 E1.13562
G1 X120.171 Y104.122 E.02878
G1 X91.864 Y132.429 E1.16887
G1 X91.97 Y132.857 E.01289
G1 X126.879 Y97.948 E1.44152
G2 X126.992 Y98.369 I.839 J0 E.01287
G1 X92.075 Y133.286 E1.44184
G1 X92.181 Y133.714 E.01289
G1 X127.149 Y98.746 E1.44395
G1 X127.305 Y99.124 E.01193
G1 X92.183 Y134.246 E1.45033
G1 X92.183 Y134.78 E.01559
G1 X127.462 Y99.501 E1.45679
G1 X127.619 Y99.878 E.01193
G1 X92.183 Y135.314 E1.46326
G1 X92.183 Y135.848 E.01559
G1 X127.775 Y100.256 E1.46973
G1 X127.798 Y100.311 E.00175
G1 X127.996 Y100.569 E.00949
G1 X92.173 Y136.392 E1.47925
G1 X91.999 Y137.1 E.0213
G1 X128.228 Y100.871 E1.49603
G1 X128.46 Y101.173 E.01112
G1 X91.824 Y137.809 E1.5128
G1 X91.65 Y138.517 E.0213
G1 X128.691 Y101.476 E1.52957
G1 X128.923 Y101.778 E.01112
G1 X91.286 Y139.414 E1.55415
G1 X90.697 Y140.538 E.03706
G1 X129.155 Y102.08 E1.58808
G1 X129.213 Y102.156 E.0028
G1 X129.439 Y102.33 E.00832
G1 X82.804 Y148.965 E1.92574
G1 X83.338 Y148.965 E.01559
G1 X129.741 Y102.561 E1.91616
G1 X130.043 Y102.793 E.01112
G1 X83.872 Y148.965 E1.90658
G1 X84.406 Y148.965 E.01559
G1 X130.345 Y103.025 E1.897
G1 X130.647 Y103.257 E.01112
G1 X84.94 Y148.965 E1.88742
G1 X85.474 Y148.965 E.01559
G1 X130.949 Y103.489 E1.87784
G2 X131.3 Y103.673 I.516 J-.56 E.01169
G1 X86.008 Y148.965 E1.87028
G1 X86.542 Y148.965 E.01559
G1 X131.678 Y103.829 E1.86383
G1 X132.056 Y103.985 E.01194
G1 X89.476 Y146.565 E1.75828
G1 X90.11 Y146.465 E.01874
G1 X132.434 Y104.141 E1.7477
G1 X132.811 Y104.297 E.01194
G1 X90.59 Y146.519 E1.74346
G1 X91.051 Y146.591 E.01363
G1 X133.189 Y104.454 E1.74002
G1 X133.657 Y104.52 E.01379
G1 X91.447 Y146.729 E1.74297
G1 X91.801 Y146.909 E.0116
G1 X134.128 Y104.582 E1.74783
G1 X134.6 Y104.645 E.01389
G1 X92.155 Y147.089 E1.75269
G1 X92.429 Y147.35 E.01103
G1 X135.072 Y104.707 E1.76087
G1 X135.554 Y104.759 E.01416
G1 X92.696 Y147.617 E1.76975
G1 X92.954 Y147.892 E.01103
G1 X136.169 Y104.678 E1.78449
G1 X136.784 Y104.596 E.01812
G1 X93.135 Y148.246 E1.80244
G1 X93.316 Y148.599 E.01159
G1 X137.4 Y104.515 E1.82039
G1 X137.815 Y104.46 E.01222
G1 X138.111 Y104.337 E.00937
G1 X93.314 Y149.135 E1.84983
G1 X93.848 Y149.135 F28800
G1 F15000
G1 X94.661 Y148.322 E.03357
G1 X96.479 Y146.503 F28800
G1 F15000
G1 X139.022 Y103.961 E1.75672
G1 X139.932 Y103.585 E.02877
G1 X97.479 Y146.037 E1.75303
G1 X98.017 Y145.952 E.01589
G1 X98.088 Y145.963 E.0021
G1 X145.829 Y98.222 E1.9714
G1 X145.995 Y98.589 E.01178
G1 X98.548 Y146.036 E1.95925
G1 X99.009 Y146.11 E.01362
G1 X146.163 Y98.956 E1.94715
G1 X146.33 Y99.322 E.01177
G1 X99.413 Y146.24 E1.93739
G1 X99.766 Y146.42 E.01159
G1 X146.498 Y99.689 E1.9297
G1 X146.665 Y100.055 E.01177
G1 X100.12 Y146.6 E1.92202
G3 X100.435 Y146.82 I-.18 J.594 E.01139
G1 X146.837 Y100.418 E1.91609
G1 X147.085 Y100.704 E.01105
G1 X100.702 Y147.087 E1.91531
G1 X100.969 Y147.354 E.01103
G1 X147.333 Y100.99 E1.91453
G1 X147.581 Y101.276 E.01105
G1 X101.217 Y147.639 E1.91451
G1 X101.397 Y147.993 E.01159
G1 X147.829 Y101.562 E1.91731
G1 X148.077 Y101.848 E.01105
G1 X101.578 Y148.347 E1.9201
G1 X101.734 Y148.653 E.01004
G1 X101.744 Y148.715 E.00183
G1 X148.325 Y102.134 E1.9235
G1 X148.392 Y102.211 E.003
G1 X148.629 Y102.364 E.00822
G1 X105.006 Y145.987 E1.80135
M73 P38 R16
G1 X105.633 Y145.668 E.02055
G1 X105.901 Y145.626 E.00791
G1 X148.954 Y102.573 E1.77782
G1 X149.279 Y102.781 E.01128
G1 X106.534 Y145.526 E1.76507
G1 X106.993 Y145.454 E.01354
G1 X107.12 Y145.474 E.00378
G1 X149.604 Y102.99 E1.7543
G1 X149.929 Y103.199 E.01128
G1 X107.582 Y145.547 E1.74867
G1 X108.043 Y145.619 E.01364
G1 X150.254 Y103.408 E1.74304
G2 X150.627 Y103.57 I.462 J-.554 E.01201
G1 X108.471 Y145.726 E1.74077
G3 X108.842 Y145.889 I-1.171 J3.181 E.01185
G1 X151.039 Y103.691 E1.74248
G1 X151.452 Y103.812 E.01256
G1 X109.196 Y146.069 E1.7449
G3 X109.524 Y146.275 I-.686 J1.454 E.01134
G1 X151.865 Y103.934 E1.7484
G1 X152.277 Y104.055 E.01256
G1 X109.818 Y146.514 E1.75328
G1 X110.082 Y146.784 E.01103
G1 X152.69 Y104.176 E1.75944
G1 X153.221 Y104.179 E.01551
G1 X110.346 Y147.055 E1.77048
G1 X110.562 Y147.277 E.00906
G1 X110.594 Y147.34 E.00207
G1 X153.755 Y104.179 E1.78226
G1 X154.289 Y104.179 E.01559
G1 X110.775 Y147.694 E1.79686
G1 X110.955 Y148.047 E.01159
G1 X154.823 Y104.179 E1.81146
G1 X155.09 Y104.179 E.00778
G2 X155.467 Y104.069 I-12.223 J-42.651 E.01148
G1 X111.01 Y148.527 E1.83581
G1 X112.004 Y149.135 F28800
G1 F15000
G1 X112.426 Y148.712 E.01743
G1 X112.483 Y148.345 E.01085
G1 X112.716 Y147.888 E.01498
G1 X111.639 Y148.965 E.04447
G1 X111.259 Y148.965 E.01111
G1 X111.238 Y148.832 E.00392
G1 X156.224 Y103.847 E1.85761
G1 X156.98 Y103.624 E.02303
G1 X115.177 Y145.427 E1.7262
G1 X115.634 Y145.195 E.01496
G1 X116.003 Y145.135 E.01093
G1 X158.642 Y102.496 E1.76071
G1 X159.869 Y103.406 F28800
G1 F15000
G1 X118.161 Y145.113 E1.72225
G1 X118.621 Y145.187 E.01361
G1 X158.978 Y104.83 E1.66649
G1 X158.756 Y105.586 E.02302
G1 X118.986 Y145.356 E1.64225
G1 X119.34 Y145.537 E.01159
G1 X158.535 Y106.342 E1.61849
G1 X158.535 Y106.876 E.01559
G1 X119.694 Y145.717 E1.60388
G1 X120.045 Y145.9 E.01156
G1 X158.535 Y107.41 E1.58938
G1 X158.535 Y107.944 E.01559
G1 X120.312 Y146.167 E1.57836
G1 X120.579 Y146.434 E.01103
G1 X158.535 Y108.478 E1.56733
G1 X158.535 Y108.59 E.00328
G1 X158.63 Y108.916 E.00992
G1 X120.846 Y146.701 E1.56026
G1 X121.113 Y146.968 E.01103
G1 X158.752 Y109.329 E1.55425
G1 X158.873 Y109.741 E.01256
G1 X121.295 Y147.319 E1.55171
G1 X121.476 Y147.673 E.01159
G1 X158.994 Y110.154 E1.54928
G1 X159.116 Y110.567 E.01256
G1 X121.656 Y148.027 E1.54685
G1 X121.818 Y148.345 E.01043
G1 X121.825 Y148.391 E.00137
G1 X159.286 Y110.931 E1.54688
G1 X159.494 Y111.256 E.01128
G1 X125.598 Y145.152 E1.39971
G1 X126.453 Y144.718 E.02801
G1 X126.587 Y144.697 E.00398
G1 X159.703 Y111.581 E1.36747
G1 X159.912 Y111.906 E.01128
G1 X127.222 Y144.596 E1.34989
G1 X127.856 Y144.496 E.01875
G1 X160.121 Y112.231 E1.33232
G1 X160.33 Y112.557 E.01128
G1 X128.39 Y144.496 E1.31889
G1 X128.851 Y144.569 E.01363
G1 X160.595 Y112.825 E1.31083
G1 X160.881 Y113.073 E.01105
G1 X129.312 Y144.642 E1.3036
G1 X129.773 Y144.715 E.01363
G1 X161.167 Y113.321 E1.29638
G1 X161.453 Y113.569 E.01105
G1 X130.132 Y144.891 E1.29338
G1 X130.486 Y145.071 E.01159
G1 X161.739 Y113.817 E1.29058
G1 X162.025 Y114.065 E.01105
G1 X130.839 Y145.251 E1.28777
G1 X131.193 Y145.431 E.01159
G1 X162.375 Y114.249 E1.2876
G1 X162.742 Y114.417 E.01177
G1 X131.487 Y145.672 E1.29063
G1 X131.754 Y145.939 E.01103
G1 X163.108 Y114.584 E1.29474
G1 X163.475 Y114.752 E.01177
G1 X132.021 Y146.206 E1.29885
G1 X132.288 Y146.473 E.01103
G1 X163.841 Y114.919 E1.30296
G1 X164.132 Y115.052 E.00933
G1 X164.228 Y115.066 E.00285
G1 X132.41 Y146.884 E1.31391
G1 X133.897 Y149.135 F28800
G1 F15000
G1 X134.497 Y148.535 E.02475
G1 X134.576 Y148.035 E.01479
G1 X134.693 Y147.805 E.00752
G1 X133.533 Y148.965 E.04788
G1 X133.388 Y148.965 E.00423
G1 X133.335 Y148.629 E.00994
G1 X159.101 Y122.863 E1.06398
G1 X159.323 Y122.107 E.02299
G1 X133.257 Y148.173 E1.07633
G1 X133.077 Y147.819 E.01159
G1 X159.544 Y121.352 E1.09293
G1 X159.623 Y121.083 E.00816
G1 X160.24 Y120.122 E.03336
G1 X132.897 Y147.465 E1.1291
G1 X132.716 Y147.112 E.01159
G1 X164.696 Y115.132 E1.32054
G1 X165.163 Y115.199 E.01378
G1 X162.498 Y117.864 E.11005
G1 X163.479 Y117.417 E.03151
G1 X165.463 Y115.433 E.08189
G1 X165.463 Y115.967 E.01559
M73 P39 R16
G1 X164.393 Y117.037 E.04417
G1 X165.017 Y116.947 E.01841
G1 X165.632 Y116.332 E.02541
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X165.017 Y116.947 E-.09922
G1 X164.393 Y117.037 E-.07187
G1 X164.746 Y116.684 E-.0569
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.8 I1.217 J.014 P1  F28800
G1 X164.941 Y99.935 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X165.463 Y99.414 E.02154
G1 X165.463 Y98.88 E.01559
G1 X164.517 Y99.825 E.03903
G1 X164.131 Y99.88 E.01139
G1 X163.757 Y100.052 E.01203
G1 X165.463 Y98.346 E.07045
G1 X165.463 Y97.812 E.01559
G1 X162.43 Y100.845 E.12524
G1 X161.96 Y97.043 F28800
G1 F15000
G1 X162.245 Y96.757 E.0118
G1 X162.779 Y96.757 E.01559
G1 X162.07 Y97.467 E.0293
G1 X161.979 Y98.091 E.01842
G1 X163.313 Y96.757 E.05509
G1 X163.847 Y96.757 E.01559
G1 X161.61 Y98.995 E.0924
G1 X161.162 Y99.977 E.03152
G1 X164.381 Y96.757 E.13295
G1 X164.915 Y96.757 E.01559
G1 X116.639 Y145.033 E1.9935
G1 X117.151 Y144.951 E.01514
G1 X117.24 Y144.966 E.00265
G1 X165.463 Y96.757 E1.99098
G1 X165.463 Y97.278 E.0152
G1 X117.553 Y145.188 E1.97837
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X118.967 Y143.774 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.8 I-1 J.693 P1  F28800
G1 X122.684 Y149.135 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X122.858 Y148.96 E.00719
G1 X122.958 Y148.326 E.01875
G1 X122.319 Y148.965 E.02638
G1 X121.916 Y148.965 E.01178
G1 X121.898 Y148.852 E.00333
G1 X123.805 Y146.946 E.07873
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.39 Y148.36 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.8 I-.047 J-1.216 P1  F28800
G1 X102.392 Y149.135 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X102.759 Y148.767 E.01517
G1 X102.802 Y148.498 E.00796
G1 X103.122 Y147.87 E.02059
G1 X101.858 Y149.135 E.05222
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X103.122 Y147.87 E-.20388
G1 X103.026 Y148.059 E-.02412
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.8 I-.062 J-1.215 P1  F28800
G1 X82.1 Y149.135 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X86.808 Y144.427 E.19441
G1 X86.426 Y144.69 E.01354
G1 X85.756 Y144.945 E.02094
G1 X82.257 Y148.444 E.14449
G1 X82.257 Y147.91 E.01559
G1 X84.895 Y145.272 E.10894
G1 X84.034 Y145.599 E.02689
G1 X82.257 Y147.376 E.07339
G1 X82.257 Y146.842 E.01559
G1 X83.407 Y145.692 E.0475
G1 X82.8 Y145.765 E.01787
G1 X82.087 Y146.478 E.02942
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X82.8 Y145.765 E-.11485
G1 X83.407 Y145.692 E-.06978
G1 X83.138 Y145.961 E-.04337
; WIPE_END
G1 E-.012 F1800

G17
G3 Z.8 I-.801 J.916 P1  F28800
G1 X189.5 Y239 Z.8
G1 Z.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.2
; FEATURE: Prime tower
; LINE_WIDTH: 0.5
G1  X155.500 Y239.000  E1.2922 F5400
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X155.500 
G1  Y219.500 
G1  X156.500 
;--------------------
; CP EMPTY GRID START
; layer #4
G1  Y239.000  E0.7411
G1  X164.500 
G1  Y219.500  E0.7411
G1  X172.500 
G1  Y239.000  E0.7411
G1  X180.500 
G1  Y219.500  E0.7411
G1  X188.500 
G1  Y239.000  E0.7411
; CP EMPTY GRID END
;------------------






G1  X190.000 
G1  Y239.500 
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
G1  X190.457 
G1  Y239.957 
G1  X154.543  E1.3650
G1  Y218.543  E0.8139
G1  X190.457  E1.3650
G1  Y239.957  E0.8139
G1  X190.914 
G1  Y240.414 
G1  X154.086  E1.3997
G1  Y218.086  E0.8486
G1  X190.914  E1.3997
G1  Y240.414  E0.8486
G1  X191.371 
G1  Y240.871 
G1  X153.629  E1.4345
G1  Y217.629  E0.8834
G1  X191.371  E1.4345
G1  Y240.871  E0.8834
G1  X191.828 
G1  Y241.328 
G1  X153.172  E1.4692
G1  Y217.172  E0.9181
G1  X191.828  E1.4692
G1  Y241.328  E0.9181

G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X189.828 Y241.328 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1 I1.131 J-.448 P1  F28800
G1 X151.294 Y144.071 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X149.634 Y144.918 E.05863
G1 X148.282 Y146.268 E.06017
G1 X147.413 Y147.973 E.06022
G1 X147.21 Y149.259 E.04099
G1 X145.707 Y149.259 E.04731
G1 X145.529 Y148.127 E.03608
G1 X144.732 Y146.563 E.05525
G1 X143.491 Y145.322 E.05524
G1 X141.927 Y144.525 E.05526
G1 X140.193 Y144.252 E.05527
G1 X138.46 Y144.525 E.0552
G1 X136.896 Y145.322 E.05525
G1 X135.656 Y146.563 E.05524
G1 X134.859 Y148.127 E.05525
G1 X134.68 Y149.259 E.03608
G1 X133.137 Y149.259 E.04858
G1 X132.982 Y148.281 E.03118
G1 X132.256 Y146.857 E.05033
G1 X131.125 Y145.726 E.05034
G1 X129.701 Y145.001 E.0503
G1 X128.123 Y144.751 E.0503
G1 X126.545 Y145.001 E.05029
G1 X125.119 Y145.726 E.05035
G2 X123.99 Y146.857 I457.348 J457.597 E.05032
G1 X123.263 Y148.281 E.05031
G1 X123.108 Y149.259 E.03118
G1 X121.665 Y149.259 E.04544
G1 X121.534 Y148.437 E.02621
G1 X120.88 Y147.151 E.04542
G1 X119.861 Y146.132 E.04537
G1 X118.575 Y145.478 E.04541
G1 X117.151 Y145.249 E.04542
G1 X115.726 Y145.478 E.04543
G2 X114.443 Y146.132 I863.33 J1694.744 E.04534
G1 X113.422 Y147.151 E.0454
G1 X112.767 Y148.437 E.04545
M73 P40 R16
G1 X112.638 Y149.259 E.02619
G1 X111.008 Y149.259 E.05132
G1 X110.903 Y148.591 E.02129
G1 X110.321 Y147.45 E.04031
G1 X109.118 Y146.198 E.05466
G1 X109.04 Y146.294 E.00392
G1 X108.244 Y145.948 E.02732
G1 X106.993 Y145.752 E.03988
G1 X105.725 Y145.951 E.0404
G1 X104.578 Y146.534 E.04049
G1 X103.67 Y147.445 E.04051
G1 X103.085 Y148.59 E.04048
G1 X102.979 Y149.259 E.02131
G1 X101.531 Y149.259 E.04556
G1 X101.451 Y148.745 E.01638
G1 X100.938 Y147.739 E.03555
G1 X100.14 Y146.941 E.03554
G2 X99.133 Y146.427 I-84.017 J163.545 E.03556
G1 X98.017 Y146.249 E.0356
G1 X96.902 Y146.428 E.03553
G1 X95.896 Y146.94 E.03553
G1 X95.098 Y147.739 E.03556
G1 X94.585 Y148.744 E.03553
G1 X94.503 Y149.259 E.0164
G1 X93.195 Y149.259 E.04117
G1 X93.138 Y148.898 E.01149
G1 X92.696 Y148.032 E.03062
G1 X92.007 Y147.344 E.03066
G1 X91.141 Y146.903 E.03059
G1 X90.181 Y146.752 E.03059
G1 X89.219 Y146.903 E.03066
G1 X88.353 Y147.344 E.03059
G1 X87.663 Y148.033 E.03068
G1 X87.223 Y148.899 E.03059
G1 X87.166 Y149.259 E.01147
G1 X81.963 Y149.259 E.1638
G1 X81.963 Y145.571 E.11611
G1 X83.898 Y145.336 E.06136
G1 X86.289 Y144.428 E.08051
G1 X88.393 Y142.975 E.08049
G1 X90.09 Y141.062 E.08051
G1 X91.278 Y138.798 E.08048
G1 X91.889 Y136.316 E.08046
G1 X91.889 Y133.758 E.08053
G1 X91.278 Y131.276 E.08046
G1 X90.09 Y129.012 E.08048
G1 X88.393 Y127.099 E.08051
G1 X86.289 Y125.646 E.08049
G1 X83.898 Y124.738 E.0805
G1 X81.963 Y124.504 E.06136
G1 X81.963 Y122.636 E.05878
G1 X83.778 Y122.416 E.05756
G1 X86.057 Y121.55 E.07673
G1 X88.061 Y120.167 E.07665
G1 X89.678 Y118.344 E.07672
G1 X90.81 Y116.186 E.0767
G1 X91.393 Y113.82 E.07671
G1 X91.393 Y111.384 E.07669
G1 X90.81 Y109.018 E.07671
G1 X89.678 Y106.86 E.0767
G1 X88.061 Y105.037 E.07671
G1 X86.057 Y103.652 E.07669
G1 X83.778 Y102.788 E.07672
G1 X81.963 Y102.568 E.05756
G1 X81.962 Y96.463 E.19217
G1 X85.105 Y96.463 E.09892
G1 X85.138 Y96.717 E.00805
G1 X85.352 Y98.346 E.05174
G1 X86.313 Y100.665 E.07901
G1 X87.839 Y102.653 E.0789
G1 X89.829 Y104.179 E.07894
G2 X92.146 Y105.14 I434.795 J-1045.128 E.07896
G1 X94.633 Y105.466 E.07896
G1 X97.118 Y105.14 E.0789
G2 X99.436 Y104.179 I-670.335 J-1621.091 E.07901
G1 X101.426 Y102.653 E.07894
G1 X102.953 Y100.665 E.0789
G1 X103.911 Y98.346 E.07897
G1 X104.16 Y96.463 E.05979
G1 X106.727 Y96.463 E.08079
G1 X106.958 Y98.216 E.05566
G1 X107.867 Y100.415 E.07489
G1 X109.315 Y102.301 E.07486
G1 X111.201 Y103.747 E.07481
G1 X113.398 Y104.656 E.07483
G1 X115.755 Y104.966 E.07484
G1 X118.112 Y104.656 E.07484
G1 X120.308 Y103.747 E.07482
G1 X122.194 Y102.301 E.07482
G1 X123.643 Y100.415 E.07486
G1 X124.551 Y98.216 E.07489
G1 X124.783 Y96.463 E.05566
G1 X126.981 Y96.463 E.06919
G1 X127.194 Y98.088 E.0516
G1 X128.055 Y100.163 E.0707
G1 X129.423 Y101.946 E.07076
G1 X131.205 Y103.315 E.07073
G1 X133.282 Y104.174 E.07073
G1 X135.509 Y104.468 E.07072
G1 X137.738 Y104.174 E.07078
G1 X139.814 Y103.315 E.07073
G1 X141.596 Y101.946 E.07073
G1 X142.965 Y100.163 E.07077
G1 X143.823 Y98.088 E.07068
G1 X144.037 Y96.463 E.05159
G1 X145.875 Y96.463 E.05785
G1 X146.115 Y98.144 E.05346
G1 X147.075 Y100.244 E.07268
G2 X148.587 Y101.987 I1122.849 J-972.243 E.07262
G1 X150.528 Y103.234 E.07264
G1 X152.742 Y103.885 E.07265
G1 X155.048 Y103.885 E.07259
G2 X157.264 Y103.234 I-70.167 J-242.933 E.07269
G1 X159.205 Y101.987 E.07264
G1 X160.716 Y100.244 E.07262
G1 X161.674 Y98.145 E.07264
G1 X161.918 Y96.463 E.05348
G1 X165.757 Y96.463 E.12084
G1 X165.757 Y99.943 E.10956
G1 X164.215 Y100.165 E.04902
G1 X162.246 Y101.065 E.06816
G1 X160.609 Y102.483 E.06816
G1 X159.439 Y104.304 E.06815
G1 X158.829 Y106.382 E.06818
G1 X158.829 Y108.548 E.06816
G1 X159.439 Y110.626 E.06818
G1 X160.609 Y112.447 E.06814
G1 X162.246 Y113.867 E.0682
G1 X164.215 Y114.767 E.06817
G1 X165.757 Y114.987 E.04901
G1 X165.757 Y117.138 E.06769
G1 X164.357 Y117.339 E.0445
G1 X162.516 Y118.179 E.0637
G1 X160.987 Y119.503 E.06366
G1 X159.893 Y121.207 E.06374
G1 X159.325 Y123.147 E.06364
G1 X159.325 Y125.169 E.06367
G1 X159.893 Y127.112 E.0637
G1 X160.987 Y128.813 E.06368
G1 X162.516 Y130.139 E.0637
G1 X164.357 Y130.979 E.06371
G1 X165.757 Y131.181 E.0445
G1 X165.757 Y132.965 E.05618
G1 X164.318 Y133.193 E.04584
G1 X162.475 Y134.132 E.06513
G1 X161.012 Y135.595 E.06513
G1 X160.073 Y137.437 E.06508
G1 X159.749 Y139.479 E.0651
G1 X160.073 Y141.521 E.06509
G1 X161.012 Y143.365 E.06514
G1 X162.475 Y144.826 E.06509
G1 X164.318 Y145.765 E.06512
G1 X165.757 Y145.993 E.04584
G1 X165.757 Y149.259 E.10281
G1 X159.239 Y149.259 E.20518
G1 X159.034 Y147.973 E.04099
G1 X158.168 Y146.269 E.06018
G1 X156.815 Y144.918 E.06018
G2 X155.113 Y144.049 I-188.626 J367.513 E.06016
G1 X153.225 Y143.749 E.06018
G1 X151.348 Y144.047 E.05982
G1 X151.405 Y144.455 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X149.868 Y145.239 E.05031
G1 X148.603 Y146.502 E.05212
G1 X147.79 Y148.095 E.05215
G1 X147.545 Y149.651 E.04592
G1 X145.372 Y149.651 E.06337
G1 X145.151 Y148.249 E.04138
G1 X144.411 Y146.796 E.04756
G1 X143.258 Y145.643 E.04755
G1 X141.804 Y144.903 E.04756
G1 X140.193 Y144.648 E.04758
G1 X138.583 Y144.903 E.04752
G1 X137.13 Y145.643 E.04756
G1 X135.977 Y146.796 E.04755
G1 X135.236 Y148.249 E.04756
G1 X135.015 Y149.651 E.04138
G1 X132.802 Y149.651 E.06453
G1 X132.605 Y148.403 E.03684
G1 X131.935 Y147.09 E.04299
G1 X130.892 Y146.047 E.04301
G1 X129.578 Y145.379 E.04297
G1 X128.123 Y145.148 E.04297
G1 X126.667 Y145.379 E.04297
G1 X125.352 Y146.047 E.04302
G2 X124.311 Y147.09 I421.263 J421.468 E.04298
G1 X123.641 Y148.403 E.04299
G1 X123.443 Y149.651 E.03684
G1 X121.33 Y149.651 E.06162
G1 X121.157 Y148.559 E.03223
G1 X120.559 Y147.384 E.03845
G1 X119.628 Y146.453 E.0384
G1 X118.453 Y145.855 E.03845
G1 X117.151 Y145.646 E.03844
G1 X115.849 Y145.855 E.03845
G2 X114.676 Y146.453 I786.954 J1544.838 E.03839
G1 X113.743 Y147.384 E.03843
G1 X113.144 Y148.56 E.03846
G1 X112.973 Y149.651 E.03222
G1 X110.672 Y149.651 E.06709
G1 X110.525 Y148.713 E.02768
G1 X109.998 Y147.68 E.03383
G1 X109.143 Y146.79 E.03598
G1 X109.088 Y146.851 E.00239
G1 X108.801 Y146.618 E.01079
G1 X108.134 Y146.328 E.02121
G1 X106.993 Y146.148 E.03368
G1 X105.847 Y146.329 E.03381
G1 X104.812 Y146.855 E.03387
G1 X103.991 Y147.678 E.0339
G1 X103.463 Y148.713 E.03388
G1 X103.313 Y149.651 E.02769
G1 X101.196 Y149.651 E.06174
G1 X101.073 Y148.867 E.02313
G1 X100.617 Y147.972 E.0293
G1 X99.906 Y147.261 E.02931
G2 X99.01 Y146.805 I-74.757 J145.566 E.02931
G1 X98.017 Y146.646 E.02935
G1 X97.025 Y146.805 E.02929
G1 X96.13 Y147.261 E.0293
G1 X95.419 Y147.972 E.02932
G1 X94.963 Y148.867 E.0293
G1 X94.838 Y149.651 E.02314
G1 X92.86 Y149.651 E.05766
G1 X92.761 Y149.021 E.01859
G1 X92.375 Y148.266 E.02474
G1 X91.774 Y147.665 E.02478
G1 X91.018 Y147.281 E.02471
G1 X90.181 Y147.148 E.02473
G1 X89.341 Y147.281 E.02478
G1 X88.586 Y147.665 E.02471
G1 X87.985 Y148.266 E.02479
G1 X87.6 Y149.022 E.02471
G1 X87.501 Y149.651 E.01858
G1 X81.571 Y149.651 E.17293
G1 X81.571 Y145.223 E.12912
G1 X83.803 Y144.952 E.06558
G1 X86.105 Y144.078 E.07179
G1 X88.131 Y142.679 E.07179
G1 X89.765 Y140.837 E.0718
G1 X90.909 Y138.658 E.07177
G1 X91.497 Y136.269 E.07176
G1 X91.497 Y133.806 E.07182
G1 X90.909 Y131.416 E.07176
G1 X89.765 Y129.237 E.07177
G1 X88.131 Y127.395 E.0718
G1 X86.105 Y125.996 E.07179
G1 X83.803 Y125.122 E.07179
G1 X81.571 Y124.851 E.06558
G1 X81.571 Y122.289 E.0747
G1 X83.683 Y122.032 E.06206
G1 X85.873 Y121.2 E.0683
G1 X87.799 Y119.871 E.06823
G1 X89.353 Y118.119 E.06829
G1 X90.441 Y116.046 E.06827
G1 X91.001 Y113.773 E.06828
G1 X91.001 Y111.432 E.06826
G1 X90.441 Y109.158 E.06828
G1 X89.353 Y107.085 E.06827
G1 X87.799 Y105.333 E.06829
G1 X85.873 Y104.002 E.06826
G1 X83.683 Y103.172 E.06829
M73 P40 R15
G1 X81.571 Y102.915 E.06206
G1 X81.57 Y96.071 E.19957
G1 X85.449 Y96.071 E.11309
G1 X85.734 Y98.244 E.0639
G1 X86.655 Y100.467 E.07017
G1 X88.119 Y102.373 E.07007
G1 X90.027 Y103.836 E.07011
G2 X92.248 Y104.758 I416.903 J-1002.081 E.07012
G1 X94.633 Y105.071 E.07014
G1 X97.015 Y104.758 E.07008
G2 X99.239 Y103.836 I-640.986 J-1550.083 E.07017
G1 X101.146 Y102.373 E.07012
G1 X102.61 Y100.467 E.07007
G1 X103.529 Y98.244 E.07015
G1 X103.817 Y96.071 E.06391
G1 X107.071 Y96.071 E.09488
G1 X107.34 Y98.114 E.06008
G1 X108.209 Y100.217 E.06636
G1 X109.595 Y102.021 E.06633
G1 X111.399 Y103.405 E.06629
G1 X111.821 Y103.579 E.01332
G1 X113.5 Y104.274 E.05298
G1 X115.755 Y104.571 E.06632
G1 X118.01 Y104.274 E.06632
G1 X120.111 Y103.405 E.0663
G1 X121.914 Y102.021 E.06629
G1 X123.3 Y100.217 E.06633
G1 X124.169 Y98.114 E.06636
G1 X124.439 Y96.071 E.06008
G1 X127.325 Y96.071 E.08414
G1 X127.576 Y97.986 E.05632
G1 X128.397 Y99.965 E.06248
G1 X129.703 Y101.667 E.06254
G1 X131.403 Y102.973 E.0625
G1 X133.384 Y103.792 E.06251
G1 X135.509 Y104.073 E.0625
G1 X137.636 Y103.792 E.06256
G1 X139.617 Y102.973 E.06251
G1 X141.317 Y101.667 E.0625
G1 X142.622 Y99.965 E.06255
G1 X143.441 Y97.986 E.06246
G1 X143.693 Y96.071 E.05631
G1 X146.215 Y96.071 E.07353
G1 X146.495 Y98.033 E.05779
G1 X147.408 Y100.03 E.06403
G2 X148.846 Y101.687 I1068.655 J-925.334 E.06398
G1 X150.693 Y102.874 E.06401
G1 X152.798 Y103.493 E.06401
G1 X154.992 Y103.493 E.06398
G2 X157.099 Y102.874 I-66.744 J-231.003 E.06402
G1 X158.946 Y101.687 E.06401
G1 X160.383 Y100.03 E.06398
G1 X161.294 Y98.033 E.064
G1 X161.578 Y96.071 E.0578
G1 X166.149 Y96.071 E.13327
G1 X166.149 Y100.283 E.12282
G1 X164.327 Y100.546 E.05367
G1 X162.46 Y101.399 E.05985
G1 X160.908 Y102.742 E.05985
G1 X159.8 Y104.469 E.05984
G1 X159.221 Y106.439 E.05987
G1 X159.221 Y108.491 E.05985
G1 X159.8 Y110.461 E.05987
G1 X160.908 Y112.188 E.05983
G1 X162.46 Y113.534 E.05989
G1 X164.327 Y114.387 E.05986
G1 X166.149 Y114.647 E.05366
G1 X166.149 Y117.477 E.08252
G1 X164.469 Y117.72 E.04949
G1 X162.73 Y118.513 E.05573
G1 X161.286 Y119.762 E.05568
G1 X160.254 Y121.371 E.05575
G1 X159.717 Y123.203 E.05566
G1 X159.717 Y125.113 E.0557
G1 X160.254 Y126.947 E.05572
G1 X161.286 Y128.554 E.0557
G1 X162.73 Y129.806 E.05571
G1 X164.469 Y130.599 E.05573
G1 X166.149 Y130.841 E.04949
G1 X166.149 Y133.3 E.0717
G1 X164.441 Y133.571 E.05042
G1 X162.708 Y134.453 E.05671
G1 X161.333 Y135.828 E.0567
G1 X160.451 Y137.559 E.05666
G1 X160.146 Y139.479 E.05668
G1 X160.451 Y141.399 E.05668
G1 X161.333 Y143.132 E.05671
G1 X162.708 Y144.505 E.05667
G1 X164.441 Y145.387 E.05671
G1 X166.149 Y145.658 E.05042
G1 X166.149 Y149.651 E.11643
G1 X158.904 Y149.651 E.21125
G1 X158.657 Y148.095 E.04593
G1 X157.847 Y146.502 E.05212
G1 X156.582 Y145.239 E.05213
G2 X154.99 Y144.427 I-176.386 J343.618 E.0521
G1 X153.225 Y144.146 E.05213
G1 X151.459 Y144.427 E.05213
G1 X151.458 Y144.427 E.00004
G1 X151.093 Y144.204 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X149.868 Y145.239 E-.20354
G1 X149.716 Y145.391 E-.02446
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1 I1.05 J.615 P1  F28800
G1 X150.262 Y144.458 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420508
G1 F15000
G1 X104.201 Y98.397 E1.90202
G1 X104.05 Y98.78 E.01202
G1 X149.783 Y144.512 E1.88845
G1 X149.437 Y144.7 E.0115
G1 X103.894 Y99.157 E1.8806
G1 X103.738 Y99.535 E.01194
G1 X149.169 Y144.967 E1.87602
G1 X148.902 Y145.234 E.01103
G1 X103.582 Y99.913 E1.87144
G1 X103.425 Y100.291 E.01194
G1 X148.635 Y145.5 E1.86685
G1 X148.368 Y145.767 E.01103
G1 X103.269 Y100.669 E1.86227
G3 X103.066 Y101 I-.716 J-.212 E.01147
G1 X148.101 Y146.034 E1.85962
G1 X148.041 Y146.093 E.00246
G1 X147.901 Y146.368 E.00901
G1 X102.834 Y101.302 E1.86095
G1 X102.602 Y101.604 E.01112
G1 X147.721 Y146.722 E1.86308
G1 X147.54 Y147.076 E.01159
G1 X102.37 Y101.906 E1.86521
G1 X102.138 Y102.208 E.01112
G1 X147.36 Y147.429 E1.86735
G1 X147.18 Y147.783 E.01159
G1 X101.906 Y102.51 E1.86948
G1 X101.674 Y102.812 E.01112
G1 X147.077 Y148.214 E1.87483
G1 X147.004 Y148.676 E.01363
G1 X145.239 Y146.91 E.07291
G1 X145.793 Y147.998 E.03566
G1 X146.76 Y148.965 E.03991
G1 X146.226 Y148.965 E.01559
G1 X145.704 Y148.444 E.02152
G1 X143.532 Y145.203 F28800
G1 F15000
G1 X101.384 Y103.055 E1.74042
G1 X101.082 Y103.287 E.01112
G1 X142.055 Y144.261 E1.69193
G1 X141.406 Y144.145 E.01926
G1 X100.78 Y103.519 E1.6776
G1 X100.478 Y103.751 E.01112
G1 X140.772 Y144.045 E1.66389
G1 X140.153 Y143.96 E.01825
G1 X100.175 Y103.983 E1.6508
G1 X99.873 Y104.214 E.01112
G1 X139.692 Y144.033 E1.64424
G1 X139.231 Y144.106 E.01363
G1 X99.568 Y104.443 E1.63782
G1 X99.19 Y104.599 E.01193
G1 X138.769 Y144.179 E1.63437
G1 X138.369 Y144.242 E.01185
G1 X138.322 Y144.266 E.00151
G1 X98.813 Y104.756 E1.63149
G1 X98.435 Y104.912 E.01193
G1 X137.969 Y144.446 E1.63247
G1 X137.615 Y144.626 E.01159
G1 X98.058 Y105.069 E1.63345
G1 X97.68 Y105.225 E.01193
G1 X137.261 Y144.806 E1.63443
G1 X136.907 Y144.986 E.01159
G1 X97.302 Y105.382 E1.63542
G1 X97.194 Y105.426 E.00341
G1 X96.857 Y105.47 E.00993
G1 X136.595 Y145.208 E1.64089
G1 X136.328 Y145.475 E.01103
G1 X96.385 Y105.533 E1.64935
G1 X95.913 Y105.595 E.0139
G1 X136.061 Y145.742 E1.65781
G1 X135.794 Y146.009 E.01103
G1 X95.441 Y105.657 E1.66628
G1 X94.97 Y105.719 E.0139
G1 X135.527 Y146.276 E1.67474
G2 X135.31 Y146.593 I.38 J.492 E.01141
G1 X94.457 Y105.74 E1.68697
G1 X93.842 Y105.659 E.0181
G1 X135.13 Y146.947 E1.70492
G1 X134.95 Y147.301 E.01159
G1 X93.227 Y105.578 E1.72286
G1 X92.612 Y105.498 E.0181
G1 X134.769 Y147.655 E1.7408
G1 X134.589 Y148.008 E.01159
G1 X91.963 Y105.382 E1.76016
G3 X91.051 Y105.005 I169.986 J-411.451 E.02882
G1 X134.508 Y148.461 E1.79448
G1 X134.436 Y148.923 E.01363
G1 X132.811 Y147.298 E.06707
G1 X133.266 Y148.189 E.02918
G1 X133.284 Y148.305 E.00345
G1 X133.944 Y148.965 E.02725
G1 X133.41 Y148.965 E.01559
G1 X133.18 Y148.735 E.00948
G1 E-.56 F1800
; WIPE_START
M73 P41 R15
G1 F23040
G1 X133.41 Y148.965 E-.03702
G1 X133.944 Y148.965 E-.06087
G1 X133.284 Y148.305 E-.10637
G1 X133.266 Y148.189 E-.01346
G1 X133.225 Y148.108 E-.01027
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1 I-.12 J-1.211 P1  F28800
G1 X122.9 Y149.135 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X121.515 Y147.749 E.0572
G1 X121.818 Y148.345 E.01951
G1 X121.863 Y148.632 E.00849
G1 X122.366 Y149.135 E.02076
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X121.863 Y148.632 E-.08104
G1 X121.818 Y148.345 E-.03314
G1 X121.515 Y147.749 E-.07616
G1 X121.748 Y147.983 E-.03766
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1 I-.146 J-1.208 P1  F28800
G1 X112.22 Y149.135 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X110.771 Y147.685 E.05985
G1 X111.186 Y148.499 E.02667
G1 X111.211 Y148.66 E.00475
G1 X111.686 Y149.135 E.01961
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.211 Y148.66 E-.07656
G1 X111.186 Y148.499 E-.01855
G1 X110.771 Y147.685 E-.10413
G1 X110.949 Y147.864 E-.02876
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1 I-.088 J-1.214 P1  F28800
G1 X101.492 Y148.553 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X102.074 Y149.135 E.02403
G1 X106.632 Y145.682 F28800
G1 F15000
G1 X90.93 Y129.981 E.64838
G1 X91.52 Y131.104 E.03706
G1 X106.022 Y145.607 E.59885
G1 X105.633 Y145.668 E.01149
G1 X105.578 Y145.696 E.00182
G1 X91.719 Y131.837 E.57227
G1 X91.893 Y132.546 E.0213
G1 X105.224 Y145.876 E.55045
G1 X104.869 Y146.056 E.0116
G1 X92.068 Y133.254 E.52863
G1 X92.183 Y133.722 E.01408
G1 X92.183 Y133.903 E.00529
G1 X104.515 Y146.236 E.50925
G1 X104.403 Y146.293 E.00367
G1 X104.221 Y146.476 E.00753
G1 X92.183 Y134.437 E.4971
G1 X92.183 Y134.971 E.01559
G1 X103.954 Y146.743 E.48609
G1 X103.688 Y147.01 E.01103
G1 X92.183 Y135.505 E.47508
G1 X92.183 Y136.039 E.01559
G1 X103.424 Y147.28 E.46417
G1 X103.243 Y147.634 E.01159
G1 X92.139 Y136.53 E.45852
G1 X92.034 Y136.958 E.01289
G1 X103.063 Y147.987 E.45543
G1 X102.882 Y148.341 E.01159
G1 X91.928 Y137.387 E.45234
G1 X91.823 Y137.815 E.01289
G1 X102.761 Y148.754 E.4517
G1 X102.728 Y148.965 E.00624
G1 X102.438 Y148.965 E.00845
G1 X91.717 Y138.244 E.44272
G1 X91.612 Y138.672 E.01289
G1 X99.057 Y146.118 E.30745
G1 X98.422 Y146.016 E.01878
G1 X91.47 Y139.065 E.28706
G1 X91.286 Y139.415 E.01155
G1 X97.85 Y145.978 E.27103
G1 X97.389 Y146.052 E.01361
G1 X91.102 Y139.765 E.25961
G1 X90.919 Y140.115 E.01155
G1 X96.929 Y146.125 E.24818
G1 X96.81 Y146.144 E.00353
G1 X96.548 Y146.278 E.00859
G1 X90.735 Y140.465 E.24003
G1 X90.551 Y140.815 E.01155
G1 X96.194 Y146.458 E.23301
G1 X95.84 Y146.639 E.01159
G1 X90.367 Y141.166 E.22599
G1 X90.334 Y141.23 E.00212
G1 X90.129 Y141.461 E.00901
G1 X95.544 Y146.876 E.22362
G1 X95.277 Y147.143 E.01103
G1 X89.878 Y141.744 E.22296
G1 X89.627 Y142.027 E.01104
G1 X95.01 Y147.41 E.2223
G2 X94.78 Y147.714 I.353 J.506 E.01132
G1 X89.376 Y142.31 E.22316
G1 X89.125 Y142.593 E.01104
G1 X94.6 Y148.068 E.22608
G1 X94.419 Y148.422 E.01159
G1 X88.874 Y142.876 E.229
G1 X88.623 Y143.159 E.01104
G1 X94.276 Y148.813 E.23346
G1 X94.252 Y148.965 E.0045
G1 X93.895 Y148.965 E.01044
G1 X88.316 Y143.386 E.23038
G1 X88 Y143.604 E.01121
G1 X90.975 Y146.579 E.12286
G1 X90.341 Y146.479 E.01875
G1 X87.684 Y143.822 E.10972
G1 X87.368 Y144.04 E.01121
G1 X89.836 Y146.508 E.10191
G1 X89.375 Y146.581 E.01364
G1 X87.052 Y144.258 E.09591
G1 X86.736 Y144.476 E.01121
G1 X88.963 Y146.703 E.09196
G1 X88.609 Y146.883 E.0116
G1 X86.419 Y144.693 E.09044
G1 X86.032 Y144.84 E.01209
G1 X88.255 Y147.063 E.09181
G1 X88.178 Y147.103 E.00254
G1 X87.969 Y147.311 E.00861
G1 X85.645 Y144.987 E.09598
G1 X85.258 Y145.134 E.01209
G1 X87.702 Y147.578 E.10093
G1 X87.435 Y147.845 E.01103
G1 X84.871 Y145.281 E.10589
G1 X84.484 Y145.428 E.01209
G1 X87.251 Y148.195 E.11427
G1 X87.071 Y148.549 E.0116
G1 X84.097 Y145.575 E.12281
G1 X83.969 Y145.624 E.004
G1 X83.65 Y145.662 E.00938
G1 X86.92 Y148.932 E.13503
G1 X86.915 Y148.965 E.00097
G1 X86.419 Y148.965 E.01448
G1 X83.174 Y145.72 E.134
G1 X82.698 Y145.778 E.01401
G1 X85.885 Y148.965 E.13161
G1 X85.351 Y148.965 E.01559
G1 X82.257 Y145.871 E.12776
G1 X82.257 Y146.405 E.01559
G1 X84.817 Y148.965 E.10571
G1 X84.283 Y148.965 E.01559
G1 X82.257 Y146.939 E.08366
G1 X82.257 Y147.473 E.01559
G1 X83.749 Y148.965 E.06161
G1 X83.215 Y148.965 E.01559
G1 X82.257 Y148.007 E.03956
G1 X82.257 Y148.541 E.01559
G1 X82.851 Y149.135 E.02451
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X82.257 Y148.541 E-.09571
G1 X82.257 Y148.007 E-.06087
G1 X82.7 Y148.45 E-.07141
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1 I1.217 J-.03 P1  F28800
G1 X82.087 Y123.808 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X82.559 Y124.28 E.01949
G1 X83.167 Y124.353 E.01787
G1 X82.257 Y123.443 E.03757
G1 X82.257 Y122.909 E.01559
G1 X83.774 Y124.427 E.06267
G1 X83.969 Y124.451 E.00572
G1 X84.554 Y124.673 E.01829
G1 X82.722 Y122.84 E.07567
G1 X83.198 Y122.783 E.01401
G1 X85.415 Y125 E.09156
G1 X86.276 Y125.327 E.02689
G1 X83.674 Y122.725 E.10745
G2 X84.094 Y122.61 I-.021 J-.906 E.01283
G1 X106.945 Y145.461 E.94359
G1 X106.993 Y145.454 E.00141
G1 X107.561 Y145.543 E.01679
G1 X84.481 Y122.463 E.95304
G1 X84.868 Y122.316 E.01209
G1 X108.194 Y145.643 E.96322
G1 X108.327 Y145.664 E.00393
G1 X108.952 Y145.936 E.0199
G1 X108.983 Y145.898 E.00143
G1 X85.255 Y122.169 E.97982
G1 X85.642 Y122.022 E.01209
G1 X112.413 Y148.794 E1.10548
G1 X112.489 Y148.335 E.01357
G1 X86.029 Y121.875 E1.09263
G2 X86.375 Y121.688 I-.209 J-.799 E.01161
G1 X112.669 Y147.981 E1.08576
G1 X112.849 Y147.628 E.01159
G1 X86.691 Y121.47 E1.08015
G1 X87.007 Y121.252 E.01121
G1 X113.029 Y147.274 E1.07454
G1 X113.181 Y146.975 E.00977
G1 X113.223 Y146.934 E.00173
G1 X87.323 Y121.034 E1.0695
G1 X87.639 Y120.816 E.01121
G1 X113.49 Y146.667 E1.06749
G1 X113.757 Y146.4 E.01103
G1 X87.955 Y120.598 E1.06548
G1 X88.268 Y120.377 E.01119
G1 X114.025 Y146.133 E1.06358
G1 X114.3 Y145.875 E.01103
G1 X88.519 Y120.094 E1.06458
G1 X88.77 Y119.811 E.01104
G1 X114.654 Y145.694 E1.06882
G1 X115.007 Y145.514 E.01159
G1 X89.021 Y119.528 E1.07306
G1 X89.272 Y119.245 E.01104
G1 X115.361 Y145.334 E1.0773
G1 X115.634 Y145.195 E.00894
G1 X115.739 Y145.178 E.00312
G1 X89.523 Y118.962 E1.08255
G1 X89.774 Y118.679 E.01104
G1 X116.199 Y145.104 E1.09119
G1 X116.659 Y145.03 E.01361
G1 X89.997 Y118.368 E1.10097
G1 X90.181 Y118.018 E.01155
G1 X117.12 Y144.956 E1.11239
G1 X117.744 Y145.046 E.01841
G1 X90.365 Y117.667 E1.13057
G1 X90.548 Y117.317 E.01155
G1 X118.38 Y145.148 E1.14924
G1 X118.668 Y145.194 E.00852
G1 X119.262 Y145.497 E.01949
G1 X90.732 Y116.967 E1.17811
G1 X90.916 Y116.617 E.01155
G1 X122.913 Y148.613 E1.32125
G1 X122.994 Y148.161 E.01343
G1 X91.094 Y116.261 E1.31725
G1 X91.2 Y115.833 E.01288
G1 X123.174 Y147.807 E1.32034
G1 X123.355 Y147.454 E.01159
G1 X91.305 Y115.404 E1.32343
G1 X91.411 Y114.976 E.01288
G1 X123.535 Y147.1 E1.32652
G1 X123.716 Y146.747 E.01159
G1 X91.516 Y114.547 E1.32961
G1 X91.622 Y114.119 E.01288
G1 X123.967 Y146.464 E1.33562
G1 X124.233 Y146.196 E.01103
G1 X91.687 Y113.65 E1.34396
G1 X91.687 Y113.116 E.01559
G1 X124.5 Y145.929 E1.35497
G1 X124.767 Y145.662 E.01103
G1 X91.687 Y112.582 E1.36599
G1 X91.687 Y112.048 E.01559
G1 X125.063 Y145.424 E1.37822
G1 X125.417 Y145.244 E.0116
G1 X91.687 Y111.514 E1.39284
G1 X91.687 Y111.348 E.00483
G1 X91.566 Y110.859 E.0147
G1 X125.771 Y145.064 E1.41244
G1 X126.125 Y144.884 E.0116
G1 X91.392 Y110.151 E1.43427
G1 X91.217 Y109.442 E.02131
G1 X126.488 Y144.713 E1.45643
G1 X126.949 Y144.64 E.01363
G1 X90.938 Y108.629 E1.48702
G1 X90.348 Y107.505 E.03704
G1 X127.558 Y144.715 E1.53652
G1 X131.073 Y145.56 F28800
G1 F15000
G1 X89.825 Y104.312 E1.70326
G1 X82.087 Y101.914 F28800
G1 F15000
G1 X82.511 Y102.338 E.01751
G1 X83.119 Y102.412 E.01788
G1 X82.257 Y101.55 E.03561
G1 X82.257 Y101.016 E.01559
G1 X83.727 Y102.486 E.06071
G1 X83.849 Y102.501 E.00359
G1 X84.536 Y102.761 E.02147
G1 X82.257 Y100.482 E.09413
G1 X82.257 Y99.948 E.01559
G1 X85.396 Y103.087 E.12965
G1 X86.194 Y103.39 E.02492
G1 X86.319 Y103.476 E.00441
G1 X82.257 Y99.414 E.16774
G1 X82.256 Y98.879 E.01559
G1 X127.871 Y144.494 E1.88356
G1 X128.123 Y144.454 E.00745
G1 X128.41 Y144.499 E.0085
G1 X82.256 Y98.345 E1.90585
G1 X82.256 Y97.811 E.01559
G1 X129.045 Y144.6 E1.93205
M73 P42 R15
G1 X129.679 Y144.7 E.01875
G1 X82.256 Y97.277 E1.95824
G1 X82.256 Y96.757 E.01519
G1 X85.865 Y100.352 E.14873
G1 X85.487 Y99.44 E.02882
G1 X82.804 Y96.757 E.11079
G1 X83.338 Y96.757 E.01559
G1 X85.109 Y98.528 E.07314
G1 X85.066 Y98.423 E.00333
G1 X84.994 Y97.879 E.01601
G1 X83.872 Y96.757 E.04633
G1 X84.406 Y96.757 E.01559
G1 X85.11 Y97.461 E.02908
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X84.406 Y96.757 E-.11354
G1 X83.872 Y96.757 E-.06087
G1 X84.204 Y97.09 E-.05358
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1 I-.005 J1.217 P1  F28800
G1 X145.876 Y97.352 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X145.281 Y96.757 E.02458
G1 X144.747 Y96.757 E.01559
G1 X145.765 Y97.775 E.04205
G1 X145.83 Y98.228 E.01335
G1 X145.953 Y98.497 E.00864
G1 X144.285 Y96.83 E.06887
G1 X144.223 Y97.301 E.0139
G1 X146.747 Y99.825 E.1042
G1 X149.901 Y102.979 F28800
G1 F15000
G1 X164.069 Y117.148 E.58505
G3 X164.48 Y117.025 I.416 J.641 E.0127
G1 X151.192 Y103.736 E.54873
G1 X151.948 Y103.958 E.02302
G1 X159.941 Y111.951 E.33005
G1 X159.169 Y110.749 E.04171
G1 X159.126 Y110.602 E.00447
G1 X152.703 Y104.179 E.26523
G1 X153.237 Y104.179 E.01559
G1 X158.904 Y109.846 E.234
G1 X158.681 Y109.09 E.02302
G1 X153.771 Y104.179 E.20277
G1 X154.305 Y104.179 E.01559
G1 X158.535 Y108.409 E.17466
G1 X158.535 Y107.875 E.01559
G1 X154.839 Y104.179 E.15261
G2 X155.309 Y104.116 I.125 J-.845 E.01405
G1 X158.535 Y107.341 E.13318
G1 X158.535 Y106.807 E.01559
G1 X155.722 Y103.994 E.11613
G1 X156.135 Y103.873 E.01256
G1 X158.55 Y106.288 E.09973
G1 X158.671 Y105.875 E.01256
G1 X156.547 Y103.752 E.0877
G1 X156.96 Y103.63 E.01256
G1 X158.792 Y105.463 E.07567
G1 X158.914 Y105.05 E.01256
G1 X157.372 Y103.509 E.06365
G1 X157.701 Y103.303 E.01131
G1 X159.035 Y104.637 E.0551
G1 X159.156 Y104.225 E.01256
G1 X158.026 Y103.094 E.04669
G1 X158.351 Y102.885 E.01128
G1 X159.356 Y103.89 E.0415
G1 X159.565 Y103.565 E.01128
G1 X158.676 Y102.676 E.0367
G1 X159.001 Y102.467 E.01128
G1 X159.773 Y103.24 E.0319
G1 X159.982 Y102.915 E.01128
G1 X159.326 Y102.259 E.02709
G1 X159.399 Y102.211 E.00254
G1 X159.592 Y101.99 E.00856
G1 X160.191 Y102.589 E.02476
G1 X160.406 Y102.27 E.01124
G1 X159.84 Y101.704 E.02337
G1 X160.088 Y101.418 E.01105
G1 X160.692 Y102.022 E.02495
G1 X160.978 Y101.774 E.01105
G1 X160.336 Y101.132 E.02652
G1 X160.584 Y100.846 E.01105
G1 X161.264 Y101.527 E.0281
G1 X161.55 Y101.279 E.01105
G1 X160.832 Y100.56 E.02968
G2 X161.043 Y100.237 I-.443 J-.52 E.01142
G1 X161.836 Y101.031 E.03277
G1 X162.085 Y100.815 E.00961
G1 X162.133 Y100.794 E.00153
G1 X161.21 Y99.871 E.03812
G1 X161.377 Y99.504 E.01177
G1 X162.5 Y100.626 E.04634
G1 X162.866 Y100.459 E.01177
G1 X161.545 Y99.137 E.05457
G1 X161.712 Y98.77 E.01177
G1 X163.233 Y100.291 E.0628
G1 X163.599 Y100.124 E.01177
G1 X161.879 Y98.404 E.07102
G2 X161.994 Y97.985 I-.659 J-.407 E.01285
G1 X163.966 Y99.956 E.0814
G3 X164.387 Y99.844 I.402 J.661 E.01291
G1 X162.062 Y97.519 E.09601
G1 X162.13 Y97.052 E.01376
G1 X164.854 Y99.776 E.11249
G1 X165.321 Y99.709 E.01377
G1 X162.369 Y96.757 E.1219
G1 X162.903 Y96.757 E.01559
G1 X165.463 Y99.317 E.10571
G1 X165.463 Y98.783 E.01559
G1 X163.437 Y96.757 E.08366
G1 X163.971 Y96.757 E.01559
G1 X165.463 Y98.249 E.06161
G1 X165.463 Y97.715 E.01559
G1 X164.505 Y96.757 E.03956
G1 X165.039 Y96.757 E.01559
G1 X165.632 Y97.351 E.02451
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X165.039 Y96.757 E-.09571
G1 X164.505 Y96.757 E-.06087
G1 X164.948 Y97.2 E-.07141
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1 I-1.17 J-.335 P1  F28800
G1 X160.554 Y112.565 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X164.947 Y116.957 E.18139
G1 X165.414 Y116.89 E.01377
G1 X163.108 Y114.584 E.09523
G1 X164.091 Y115.033 E.03157
G1 X165.463 Y116.405 E.05664
G1 X165.463 Y115.871 E.01559
G1 X164.729 Y115.137 E.03029
G1 X165.352 Y115.226 E.01838
G1 X165.632 Y115.507 E.01157
G1 X163.831 Y117.443 F28800
G1 F15000
G1 X144.161 Y97.773 E.81222
G1 X144.11 Y98.165 E.01152
G1 X144.083 Y98.229 E.00204
G1 X163.336 Y117.482 E.79501
G1 X162.969 Y117.649 E.01177
G1 X143.927 Y98.607 E.78632
G1 X143.77 Y98.985 E.01193
G1 X162.602 Y117.817 E.77763
G1 X162.356 Y117.929 E.00792
G1 X162.262 Y118.01 E.00361
G1 X143.614 Y99.362 E.77003
G1 X143.458 Y99.74 E.01193
G1 X161.976 Y118.258 E.76467
G1 X161.69 Y118.506 E.01105
G1 X143.302 Y100.118 E.7593
G3 X143.108 Y100.458 I-.732 J-.19 E.01157
G1 X161.403 Y118.753 E.75546
G1 X161.117 Y119.001 E.01105
G1 X142.877 Y100.761 E.75321
G1 X142.645 Y101.063 E.01112
G1 X160.831 Y119.249 E.75097
G1 X160.762 Y119.308 E.00264
G1 X160.604 Y119.556 E.00859
G1 X142.413 Y101.365 E.75115
G1 X142.181 Y101.667 E.01112
G1 X160.395 Y119.881 E.75211
G1 X160.186 Y120.206 E.01128
G1 X141.949 Y101.969 E.75306
G3 X141.691 Y102.245 I-.644 J-.346 E.01116
G1 X159.977 Y120.531 E.75512
G1 X159.769 Y120.857 E.01128
G1 X141.389 Y102.477 E.75897
G1 X141.087 Y102.709 E.01112
G1 X159.586 Y121.208 E.76392
G1 X159.465 Y121.621 E.01256
G1 X140.785 Y102.941 E.77139
G1 X140.483 Y103.173 E.01112
G1 X159.344 Y122.034 E.77886
G1 X159.223 Y122.447 E.01256
G1 X140.181 Y103.405 E.78634
G1 X139.963 Y103.572 E.00802
G1 X139.857 Y103.615 E.00332
G1 X159.102 Y122.86 E.79468
G2 X159.031 Y123.323 I.753 J.353 E.01385
G1 X139.48 Y103.772 E.80732
G1 X139.102 Y103.928 E.01194
G1 X159.031 Y123.857 E.82292
G1 X159.031 Y124.391 E.01559
G1 X138.724 Y104.084 E.83852
G1 X138.346 Y104.24 E.01194
G1 X159.031 Y124.925 E.85412
G1 X159.031 Y125.212 E.00838
G1 X159.133 Y125.561 E.01062
G1 X137.968 Y104.396 E.87395
G3 X137.535 Y104.497 I-.405 J-.762 E.01314
G1 X159.354 Y126.316 E.90097
G1 X159.575 Y127.071 E.02297
G1 X137.063 Y104.559 E.92958
G1 X136.592 Y104.622 E.01389
G1 X164.791 Y132.821 E1.16443
G1 X165.252 Y132.747 E.01362
G1 X163.344 Y130.84 E.07879
G1 X164.306 Y131.268 E.03078
G1 X165.463 Y132.425 E.04774
G1 X165.463 Y131.891 E.01559
G1 X164.73 Y131.158 E.03024
G1 X164.478 Y133.042 F28800
G1 F15000
G1 X136.12 Y104.684 E1.17099
G1 X135.649 Y104.747 E.01389
G1 X163.952 Y133.05 E1.16874
G1 X163.598 Y133.23 E.01159
G1 X135.076 Y104.708 E1.17778
G1 X134.46 Y104.626 E.01813
G1 X163.244 Y133.41 E1.18858
G1 X162.89 Y133.59 E.01159
G1 X133.845 Y104.545 E1.19938
G1 X133.229 Y104.463 E.01813
G1 X162.536 Y133.77 E1.21018
G1 X162.3 Y133.891 E.00776
G1 X162.211 Y133.979 E.00364
G1 X132.331 Y104.099 E1.23386
G1 X131.42 Y103.722 E.02877
G1 X161.944 Y134.246 E1.26043
G1 X161.677 Y134.513 E.01103
G1 X124.91 Y97.746 E1.51825
G1 X124.972 Y97.274 E.01389
G1 X127.648 Y99.95 E.1105
G1 X127.27 Y99.037 E.02885
G1 X125.034 Y96.802 E.0923
G1 X125.04 Y96.757 E.00133
G1 X125.523 Y96.757 E.0141
G1 X126.904 Y98.138 E.05701
G1 X126.823 Y97.523 E.0181
G1 X126.057 Y96.757 E.03163
G1 X126.591 Y96.757 E.01559
G1 X126.94 Y97.105 E.01438
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X126.591 Y96.757 E-.05614
G1 X126.057 Y96.757 E-.06087
G1 X126.746 Y97.446 E-.11099
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1 I.051 J-1.216 P1  F28800
G1 X106.13 Y96.588 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X106.495 Y96.952 E.01506
G1 X106.576 Y97.567 E.01812
G1 X105.766 Y96.757 E.03346
G1 X105.232 Y96.757 E.01559
G1 X106.657 Y98.183 E.05886
G1 X106.672 Y98.293 E.00324
G1 X106.98 Y99.04 E.0236
G1 X104.698 Y96.757 E.09426
G1 X104.418 Y96.757 E.00816
G1 X104.388 Y96.982 E.00662
G1 X107.356 Y99.95 E.12256
G1 X107.61 Y100.563 E.01937
G1 X108.187 Y101.315 E.02769
G1 X104.326 Y97.453 E.15945
G1 X104.264 Y97.925 E.01389
G1 X150.49 Y144.151 E1.90884
G1 X150.843 Y143.971 E.01159
G1 X110.295 Y103.423 E1.67436
G1 X111.053 Y104.004 E.02787
G1 X111.663 Y104.256 E.01927
G1 X151.197 Y143.79 E1.6325
G1 X151.245 Y143.766 E.00156
G1 X151.643 Y143.703 E.01179
G1 X112.573 Y104.633 E1.61333
G1 X113.321 Y104.942 E.02362
G1 X113.431 Y104.957 E.00325
G1 X152.104 Y143.63 E1.59694
G1 X152.565 Y143.556 E.01362
G1 X114.046 Y105.038 E1.59057
G1 X114.661 Y105.119 E.01811
G1 X153.026 Y143.483 E1.5842
G1 X153.225 Y143.452 E.00588
G1 X153.585 Y143.509 E.01067
G1 X115.276 Y105.2 E1.58191
G1 X115.755 Y105.263 E.01409
G1 X115.86 Y105.249 E.00309
G1 X154.22 Y143.61 E1.58404
G1 X154.855 Y143.711 E.01877
G1 X116.331 Y105.187 E1.59077
G1 X116.803 Y105.125 E.0139
G1 X156.084 Y144.405 E1.62202
G1 X159.269 Y148.659 F28800
G1 F15000
G1 X159.575 Y148.965 E.01264
G1 X160.109 Y148.965 E.01559
G1 X159.373 Y148.228 E.03042
G1 X159.318 Y147.881 E.01027
G1 X159.067 Y147.389 E.01611
G1 X160.643 Y148.965 E.06507
G1 X161.177 Y148.965 E.01559
G1 X117.275 Y105.063 E1.81288
G1 X117.747 Y105 E.0139
G1 X161.711 Y148.965 E1.81544
G1 X162.245 Y148.965 E.01559
G1 X118.213 Y104.932 E1.81826
G1 X118.59 Y104.776 E.01194
G1 X162.779 Y148.965 E1.82471
G1 X163.313 Y148.965 E.01559
G1 X118.968 Y104.62 E1.83116
G1 X119.346 Y104.463 E.01194
G1 X163.847 Y148.965 E1.83762
G1 X164.381 Y148.965 E.01559
G1 X119.724 Y104.307 E1.84407
G1 X120.101 Y104.151 E.01194
G1 X164.915 Y148.965 E1.85052
G1 X165.449 Y148.965 E.01559
G1 X120.474 Y103.99 E1.85716
G1 X120.777 Y103.758 E.01112
G1 X165.632 Y148.614 E1.85224
G1 X165.182 Y146.028 F28800
G1 F15000
G1 X165.463 Y146.308 E.01158
G1 X165.463 Y146.842 E.01559
G1 X164.752 Y146.131 E.02936
G1 X164.226 Y146.048 E.01553
G1 X164.039 Y145.952 E.00615
G1 X165.463 Y147.376 E.05879
G1 X165.463 Y147.91 E.01559
G1 X162.951 Y145.399 E.1037
M73 P43 R15
G1 X162.3 Y145.067 E.02134
G1 X160.771 Y143.541 E.0631
G1 X160.437 Y142.884 E.0215
G1 X121.079 Y103.527 E1.62522
G1 X121.381 Y103.295 E.01112
G1 X159.883 Y141.797 E1.58989
G1 X159.79 Y141.613 E.00602
G1 X159.706 Y141.086 E.01559
G1 X121.683 Y103.063 E1.57009
G1 X121.985 Y102.831 E.01112
G1 X159.606 Y140.451 E1.55346
G1 X159.505 Y139.817 E.01876
G1 X122.288 Y102.599 E1.53683
G2 X122.547 Y102.324 I-.385 J-.621 E.01116
G1 X159.486 Y139.263 E1.52534
G1 X159.559 Y138.802 E.01363
G1 X122.779 Y102.022 E1.51877
G1 X123.011 Y101.72 E.01112
G1 X159.632 Y138.341 E1.51221
G1 X159.705 Y137.881 E.01363
G1 X123.243 Y101.418 E1.50565
G1 X123.475 Y101.116 E.01112
G1 X159.778 Y137.42 E1.49909
G1 X159.79 Y137.345 E.00222
G1 X159.941 Y137.048 E.0097
G1 X123.707 Y100.814 E1.49623
G1 X123.9 Y100.563 E.00925
G1 X123.926 Y100.5 E.002
G1 X160.121 Y136.695 E1.49462
G1 X160.301 Y136.341 E.01159
G1 X124.082 Y100.122 E1.49562
G1 X124.238 Y99.744 E.01194
G1 X160.482 Y135.987 E1.49661
G1 X160.662 Y135.634 E.01159
G1 X124.394 Y99.366 E1.49761
G1 X124.55 Y98.988 E.01194
G1 X160.876 Y135.314 E1.50002
G1 X161.143 Y135.047 E.01103
G1 X124.707 Y98.61 E1.5046
G1 X124.838 Y98.293 E.01003
G1 X124.848 Y98.218 E.00222
G1 X161.53 Y134.9 E1.51475
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X160.116 Y133.486 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z1 I-1.172 J.326 P1  F28800
G1 X189.5 Y239 Z1
G1 Z.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.2
; FEATURE: Prime tower
; LINE_WIDTH: 0.5
G1  X155.500 Y239.000  E1.2922 F5400
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X155.500 
G1  Y219.500 
G1  X156.500 
;--------------------
; CP EMPTY GRID START
; layer #5
G1  Y239.000  E0.7411
G1  X164.500 
G1  Y219.500  E0.7411
G1  X172.500 
G1  Y239.000  E0.7411
G1  X180.500 
G1  Y219.500  E0.7411
G1  X188.500 
G1  Y239.000  E0.7411
; CP EMPTY GRID END
;------------------






G1  X190.000 
G1  Y239.500 
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
G1  X190.457 
G1  Y239.957 
G1  X154.543  E1.3650
G1  Y218.543  E0.8139
G1  X190.457  E1.3650
G1  Y239.957  E0.8139
G1  X190.914 
G1  Y240.414 
G1  X154.086  E1.3997
G1  Y218.086  E0.8486
G1  X190.914  E1.3997
G1  Y240.414  E0.8486
G1  X191.371 
G1  Y240.871 
G1  X153.629  E1.4345
G1  Y217.629  E0.8834
G1  X191.371  E1.4345
G1  Y240.871  E0.8834

G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X189.371 Y240.871 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.2 I1.132 J-.445 P1  F28800
G1 X151.293 Y144.072 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X149.634 Y144.918 E.05862
G1 X148.282 Y146.268 E.06017
G1 X147.413 Y147.973 E.06022
G1 X147.21 Y149.259 E.04099
G1 X145.707 Y149.259 E.04731
G1 X145.529 Y148.127 E.03608
G1 X144.732 Y146.563 E.05525
G1 X143.491 Y145.322 E.05524
G1 X141.927 Y144.525 E.05526
G1 X140.193 Y144.252 E.05527
G1 X138.46 Y144.525 E.0552
G1 X136.896 Y145.322 E.05525
G1 X135.656 Y146.563 E.05524
G1 X134.859 Y148.127 E.05525
G1 X134.68 Y149.259 E.03608
G1 X133.137 Y149.259 E.04858
G1 X132.982 Y148.281 E.03118
G1 X132.256 Y146.857 E.05033
G1 X131.125 Y145.726 E.05034
G1 X129.701 Y145.001 E.0503
G1 X128.123 Y144.751 E.0503
G1 X126.545 Y145.001 E.05029
G1 X125.119 Y145.726 E.05035
G2 X123.99 Y146.857 I417.9 J418.218 E.05032
G1 X123.263 Y148.281 E.05031
G1 X123.108 Y149.259 E.03118
G1 X121.665 Y149.259 E.04544
G1 X121.534 Y148.437 E.02621
G1 X120.88 Y147.151 E.04542
G1 X119.861 Y146.132 E.04537
G1 X118.575 Y145.478 E.04541
G1 X117.151 Y145.249 E.04542
G1 X115.726 Y145.478 E.04543
G2 X114.443 Y146.132 I685.13 J1345.276 E.04534
G1 X113.422 Y147.151 E.0454
M73 P44 R15
G1 X112.767 Y148.437 E.04545
G1 X112.638 Y149.259 E.02619
G1 X111.008 Y149.259 E.05132
G1 X110.903 Y148.591 E.02129
G1 X110.321 Y147.45 E.04031
G1 X109.118 Y146.198 E.05466
G1 X109.04 Y146.294 E.00392
G1 X108.244 Y145.948 E.02732
G1 X106.993 Y145.752 E.03988
G1 X105.725 Y145.951 E.0404
G1 X104.578 Y146.534 E.04049
G1 X103.67 Y147.445 E.04051
G1 X103.085 Y148.59 E.04048
G1 X102.979 Y149.259 E.02131
G1 X101.531 Y149.259 E.04556
G1 X101.451 Y148.745 E.01638
G1 X100.938 Y147.739 E.03555
G1 X100.14 Y146.941 E.03554
G2 X99.133 Y146.427 I-80.632 J156.911 E.03556
G1 X98.017 Y146.249 E.0356
G1 X96.902 Y146.428 E.03553
G1 X95.896 Y146.94 E.03553
G1 X95.098 Y147.739 E.03556
G1 X94.585 Y148.744 E.03553
G1 X94.503 Y149.259 E.0164
G1 X93.195 Y149.259 E.04117
G1 X93.138 Y148.898 E.01149
G1 X92.696 Y148.032 E.03062
G1 X92.007 Y147.344 E.03066
G1 X91.141 Y146.903 E.03059
G1 X90.181 Y146.752 E.03059
G1 X89.219 Y146.903 E.03066
G1 X88.353 Y147.344 E.03059
G1 X87.663 Y148.033 E.03068
G1 X87.223 Y148.899 E.03059
G1 X87.166 Y149.259 E.01147
G1 X81.963 Y149.259 E.1638
G1 X81.963 Y145.571 E.11611
M73 P44 R14
G1 X83.898 Y145.336 E.06136
G1 X86.289 Y144.428 E.08051
G1 X88.393 Y142.975 E.08049
G1 X90.09 Y141.062 E.08051
G1 X91.278 Y138.798 E.08048
G1 X91.889 Y136.316 E.08046
G1 X91.889 Y133.758 E.08053
G1 X91.278 Y131.276 E.08046
G1 X90.09 Y129.012 E.08048
G1 X88.393 Y127.099 E.08051
G1 X86.289 Y125.646 E.08049
G1 X83.898 Y124.738 E.0805
G1 X81.963 Y124.504 E.06136
G1 X81.963 Y122.636 E.05878
G1 X83.778 Y122.416 E.05756
G1 X86.057 Y121.55 E.07673
G1 X88.061 Y120.167 E.07665
G1 X89.678 Y118.344 E.07672
G1 X90.81 Y116.186 E.0767
G1 X91.393 Y113.82 E.07671
G1 X91.393 Y111.384 E.07669
G1 X90.81 Y109.018 E.07671
G1 X89.678 Y106.86 E.0767
G1 X88.061 Y105.037 E.07671
G1 X86.057 Y103.652 E.07669
G1 X83.778 Y102.788 E.07672
G1 X81.963 Y102.568 E.05756
G1 X81.962 Y96.463 E.19217
G1 X85.105 Y96.463 E.09893
G1 X85.179 Y97.027 E.01791
G1 X85.352 Y98.346 E.04187
G1 X86.313 Y100.665 E.07901
G1 X87.839 Y102.653 E.0789
G1 X89.829 Y104.179 E.07893
G2 X92.146 Y105.14 I399.05 J-958.93 E.07896
G1 X94.633 Y105.466 E.07896
G1 X97.118 Y105.14 E.0789
G2 X99.436 Y104.179 I-614.812 J-1487.083 E.07901
G1 X101.426 Y102.653 E.07894
G1 X102.953 Y100.665 E.0789
G1 X103.911 Y98.346 E.07897
G1 X104.16 Y96.463 E.05979
G1 X106.727 Y96.463 E.08079
G1 X106.958 Y98.216 E.05566
G1 X107.867 Y100.415 E.07489
G1 X109.315 Y102.301 E.07486
G1 X111.201 Y103.747 E.07481
G1 X113.398 Y104.656 E.07483
G1 X115.755 Y104.966 E.07484
G1 X118.112 Y104.656 E.07484
G1 X120.308 Y103.747 E.07482
G1 X122.194 Y102.301 E.07482
G1 X123.643 Y100.415 E.07486
G1 X124.551 Y98.216 E.07489
G1 X124.783 Y96.463 E.05566
G1 X126.981 Y96.463 E.06919
G1 X127.194 Y98.088 E.0516
G1 X128.055 Y100.163 E.0707
G1 X129.423 Y101.946 E.07076
G1 X131.205 Y103.315 E.07073
G1 X133.282 Y104.174 E.07073
G1 X135.509 Y104.468 E.07072
G1 X137.738 Y104.174 E.07078
G1 X139.814 Y103.315 E.07073
G1 X141.596 Y101.946 E.07073
G1 X142.965 Y100.163 E.07077
G1 X143.823 Y98.088 E.07068
G1 X144.037 Y96.463 E.05159
G1 X145.875 Y96.463 E.05785
G1 X146.115 Y98.144 E.05346
G1 X147.075 Y100.244 E.07268
G2 X148.587 Y101.987 I925.383 J-801.005 E.07263
G1 X150.528 Y103.234 E.07264
G1 X152.742 Y103.885 E.07265
G1 X155.048 Y103.885 E.07259
G2 X157.264 Y103.234 I-67.648 J-234.355 E.07269
G1 X159.205 Y101.987 E.07264
G1 X160.716 Y100.244 E.07262
G1 X161.674 Y98.145 E.07264
G1 X161.918 Y96.463 E.05348
G1 X165.757 Y96.463 E.12084
G1 X165.757 Y99.943 E.10956
G1 X164.215 Y100.165 E.04902
G1 X162.246 Y101.065 E.06816
G1 X160.609 Y102.483 E.06816
G1 X159.439 Y104.304 E.06815
G1 X158.829 Y106.382 E.06818
G1 X158.829 Y108.548 E.06816
G1 X159.439 Y110.626 E.06818
G1 X160.609 Y112.447 E.06814
G1 X162.246 Y113.867 E.0682
G1 X164.215 Y114.767 E.06817
G1 X165.757 Y114.987 E.04901
G1 X165.757 Y117.138 E.06769
G1 X164.357 Y117.339 E.0445
G1 X162.516 Y118.179 E.0637
G1 X160.987 Y119.503 E.06366
G1 X159.893 Y121.207 E.06374
G1 X159.325 Y123.147 E.06364
G1 X159.325 Y125.169 E.06367
G1 X159.893 Y127.112 E.0637
G1 X160.987 Y128.813 E.06368
G1 X162.516 Y130.139 E.0637
G1 X164.357 Y130.979 E.06371
G1 X165.757 Y131.181 E.0445
G1 X165.757 Y132.965 E.05618
G1 X164.318 Y133.193 E.04584
G1 X162.475 Y134.132 E.06513
G1 X161.012 Y135.595 E.06513
G1 X160.073 Y137.437 E.06508
G1 X159.749 Y139.479 E.0651
G1 X160.073 Y141.521 E.06509
G1 X161.012 Y143.365 E.06514
G1 X162.475 Y144.826 E.06509
G1 X164.318 Y145.765 E.06512
G1 X165.757 Y145.993 E.04584
G1 X165.757 Y149.259 E.10281
G1 X159.239 Y149.259 E.20518
G1 X159.034 Y147.973 E.04099
G1 X158.168 Y146.269 E.06018
G1 X156.815 Y144.918 E.06018
G2 X155.113 Y144.049 I-179.154 J348.948 E.06016
G1 X153.225 Y143.749 E.06018
G1 X151.348 Y144.048 E.05983
G1 X151.469 Y144.425 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.459 Y144.427 E.00028
G2 X149.868 Y145.239 I131.056 J258.745 E.0521
G1 X148.603 Y146.502 E.05212
G1 X147.79 Y148.095 E.05215
G1 X147.545 Y149.651 E.04592
G1 X145.372 Y149.651 E.06337
G1 X145.151 Y148.249 E.04138
G1 X144.411 Y146.796 E.04756
G1 X143.258 Y145.643 E.04755
G1 X141.804 Y144.903 E.04756
G1 X140.193 Y144.648 E.04758
G1 X138.583 Y144.903 E.04752
G1 X137.13 Y145.643 E.04756
G1 X135.977 Y146.796 E.04755
G1 X135.236 Y148.249 E.04756
G1 X135.015 Y149.651 E.04138
G1 X132.802 Y149.651 E.06453
G1 X132.605 Y148.403 E.03684
G1 X131.935 Y147.09 E.04299
G1 X130.892 Y146.047 E.04301
G1 X129.578 Y145.379 E.04297
G1 X128.123 Y145.148 E.04297
G1 X126.667 Y145.379 E.04297
G1 X125.352 Y146.047 E.04302
G2 X124.311 Y147.09 I385.376 J385.651 E.04298
G1 X123.641 Y148.403 E.04299
G1 X123.443 Y149.651 E.03684
G1 X121.33 Y149.651 E.06162
G1 X121.157 Y148.559 E.03223
G1 X120.559 Y147.384 E.03845
G1 X119.628 Y146.453 E.0384
G1 X118.453 Y145.855 E.03845
G1 X117.151 Y145.646 E.03844
G1 X115.849 Y145.855 E.03845
G2 X114.676 Y146.453 I628.219 J1233.533 E.03839
G1 X113.743 Y147.384 E.03843
G1 X113.144 Y148.56 E.03846
G1 X112.973 Y149.651 E.03222
G1 X110.672 Y149.651 E.06709
G1 X110.525 Y148.713 E.02768
G1 X109.998 Y147.68 E.03383
G1 X109.143 Y146.79 E.03598
G1 X109.092 Y146.854 E.00239
G1 X108.801 Y146.618 E.01092
G1 X108.134 Y146.328 E.02121
G1 X106.993 Y146.148 E.03368
G1 X105.847 Y146.329 E.03381
G1 X104.812 Y146.855 E.03387
G1 X103.991 Y147.678 E.0339
G1 X103.463 Y148.713 E.03388
G1 X103.313 Y149.651 E.02769
G1 X101.196 Y149.651 E.06174
G1 X101.073 Y148.867 E.02313
G1 X100.617 Y147.972 E.0293
G1 X99.906 Y147.261 E.02931
G2 X99.01 Y146.805 I-71.79 J139.747 E.02931
G1 X98.017 Y146.646 E.02934
G1 X97.025 Y146.805 E.02929
G1 X96.13 Y147.261 E.0293
G1 X95.419 Y147.972 E.02932
G1 X94.963 Y148.867 E.0293
G1 X94.838 Y149.651 E.02314
G1 X92.86 Y149.651 E.05766
G1 X92.761 Y149.021 E.01859
G1 X92.375 Y148.266 E.02474
G1 X91.774 Y147.665 E.02478
G1 X91.018 Y147.281 E.02471
G1 X90.181 Y147.148 E.02473
G1 X89.341 Y147.281 E.02478
G1 X88.586 Y147.665 E.02471
G1 X87.985 Y148.266 E.02479
G1 X87.6 Y149.022 E.02471
G1 X87.501 Y149.651 E.01858
G1 X81.571 Y149.651 E.17293
G1 X81.571 Y145.223 E.12912
G1 X83.803 Y144.952 E.06558
G1 X86.105 Y144.078 E.07179
G1 X88.131 Y142.679 E.07179
G1 X89.765 Y140.837 E.0718
G1 X90.909 Y138.658 E.07177
G1 X91.497 Y136.269 E.07176
G1 X91.497 Y133.806 E.07182
G1 X90.909 Y131.416 E.07176
G1 X89.765 Y129.237 E.07177
G1 X88.131 Y127.395 E.0718
G1 X86.105 Y125.996 E.07179
G1 X83.803 Y125.122 E.07179
G1 X81.571 Y124.851 E.06558
G1 X81.571 Y122.289 E.0747
G1 X83.683 Y122.032 E.06206
G1 X85.873 Y121.2 E.0683
G1 X87.799 Y119.871 E.06823
G1 X89.353 Y118.119 E.06829
G1 X90.441 Y116.046 E.06827
G1 X91.001 Y113.773 E.06828
G1 X91.001 Y111.432 E.06826
G1 X90.441 Y109.158 E.06828
G1 X89.353 Y107.085 E.06827
G1 X87.799 Y105.333 E.06829
G1 X85.873 Y104.002 E.06826
G1 X83.683 Y103.172 E.06829
G1 X81.571 Y102.915 E.06206
G1 X81.57 Y96.071 E.19957
G1 X85.449 Y96.071 E.1131
G1 X85.568 Y96.976 E.02662
G1 X85.734 Y98.244 E.03728
G1 X86.655 Y100.467 E.07017
G1 X88.119 Y102.373 E.07007
G1 X90.027 Y103.836 E.07011
G2 X92.248 Y104.758 I382.246 J-918.513 E.07012
G1 X94.633 Y105.071 E.07014
G1 X97.015 Y104.758 E.07008
G2 X99.239 Y103.836 I-588.379 J-1423.121 E.07017
G1 X101.146 Y102.373 E.07012
G1 X102.61 Y100.467 E.07007
G1 X103.529 Y98.244 E.07015
G1 X103.817 Y96.071 E.06391
G1 X107.071 Y96.071 E.09488
G1 X107.34 Y98.114 E.06008
G1 X108.209 Y100.217 E.06636
G1 X109.595 Y102.021 E.06633
G1 X111.399 Y103.405 E.06629
G1 X111.98 Y103.645 E.01833
G1 X113.5 Y104.274 E.04797
G1 X115.755 Y104.571 E.06632
G1 X118.01 Y104.274 E.06632
G1 X120.111 Y103.405 E.0663
G1 X121.914 Y102.021 E.06629
G1 X123.3 Y100.217 E.06633
G1 X124.169 Y98.114 E.06636
G1 X124.439 Y96.071 E.06008
G1 X127.325 Y96.071 E.08414
G1 X127.576 Y97.986 E.05632
G1 X128.397 Y99.965 E.06248
G1 X129.703 Y101.667 E.06254
G1 X131.403 Y102.973 E.0625
G1 X133.384 Y103.792 E.06251
G1 X135.509 Y104.073 E.0625
G1 X137.636 Y103.792 E.06256
G1 X139.617 Y102.973 E.06251
G1 X141.317 Y101.667 E.0625
G1 X142.622 Y99.965 E.06255
G1 X143.441 Y97.986 E.06246
G1 X143.693 Y96.071 E.05631
G1 X146.215 Y96.071 E.07353
G1 X146.495 Y98.033 E.05779
G1 X147.408 Y100.03 E.06403
G2 X148.846 Y101.687 I880.86 J-762.473 E.06398
G1 X150.693 Y102.874 E.06401
G1 X152.798 Y103.493 E.06401
G1 X154.992 Y103.493 E.06398
G2 X157.099 Y102.874 I-64.352 J-222.861 E.06402
G1 X158.946 Y101.687 E.06401
G1 X160.383 Y100.03 E.06398
G1 X161.294 Y98.033 E.064
G1 X161.578 Y96.071 E.0578
G1 X166.149 Y96.071 E.13327
G1 X166.149 Y100.283 E.12282
G1 X164.327 Y100.546 E.05367
G1 X162.46 Y101.399 E.05985
G1 X160.908 Y102.742 E.05985
G1 X159.8 Y104.469 E.05984
G1 X159.221 Y106.439 E.05987
G1 X159.221 Y108.491 E.05985
G1 X159.8 Y110.461 E.05987
G1 X160.908 Y112.188 E.05983
G1 X162.46 Y113.534 E.05989
G1 X164.327 Y114.387 E.05986
G1 X166.149 Y114.647 E.05366
G1 X166.149 Y117.477 E.08252
G1 X164.469 Y117.72 E.04949
G1 X162.73 Y118.513 E.05573
G1 X161.286 Y119.762 E.05568
G1 X160.254 Y121.371 E.05575
G1 X159.717 Y123.203 E.05566
G1 X159.717 Y125.113 E.0557
G1 X160.254 Y126.947 E.05572
G1 X161.286 Y128.554 E.0557
G1 X162.73 Y129.806 E.05571
G1 X164.469 Y130.599 E.05573
G1 X166.149 Y130.841 E.04949
G1 X166.149 Y133.3 E.0717
G1 X164.441 Y133.571 E.05042
G1 X162.708 Y134.453 E.05671
G1 X161.333 Y135.828 E.0567
G1 X160.451 Y137.559 E.05666
G1 X160.146 Y139.479 E.05668
G1 X160.451 Y141.399 E.05668
G1 X161.333 Y143.132 E.05671
G1 X162.708 Y144.505 E.05667
G1 X164.441 Y145.387 E.05671
G1 X166.149 Y145.658 E.05042
G1 X166.149 Y149.651 E.11643
G1 X158.904 Y149.651 E.21125
G1 X158.657 Y148.095 E.04593
G1 X157.847 Y146.502 E.05212
G1 X156.582 Y145.239 E.05213
G2 X154.99 Y144.427 I-167.518 J326.242 E.0521
G1 X153.225 Y144.146 E.05213
G1 X151.528 Y144.416 E.0501
G1 X151.463 Y144.418 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X151.459 Y144.427 E-.00792
G1 X149.868 Y145.239 E-.20369
G1 X149.766 Y145.341 E-.01639
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.2 I-.781 J-.933 P1  F28800
G1 X147.758 Y147.022 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42051
G1 F15000
G1 X145.939 Y148.841 E.07512
G1 X145.959 Y148.965 E.00367
G1 X146.349 Y148.965 E.0114
G1 X147.073 Y148.241 E.0299
G1 X146.973 Y148.875 E.01874
G1 X146.713 Y149.135 E.01073
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X146.973 Y148.875 E-.04189
G1 X147.073 Y148.241 E-.07316
G1 X146.372 Y148.941 E-.11295
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.2 I-.013 J1.217 P1  F28800
G1 X164.869 Y149.135 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X165.463 Y148.541 E.02451
G1 X165.463 Y148.007 E.01559
G1 X164.505 Y148.965 E.03956
G1 X163.971 Y148.965 E.01559
G1 X165.463 Y147.473 E.06161
G1 X165.463 Y146.939 E.01559
G1 X163.437 Y148.965 E.08366
G1 X162.903 Y148.965 E.01559
G1 X165.463 Y146.405 E.10571
G1 X165.463 Y146.244 E.0047
G1 X165.141 Y146.193 E.00952
G1 X162.369 Y148.965 E.11446
G1 X161.835 Y148.965 E.01559
G1 X164.68 Y146.12 E.11748
G1 X164.221 Y146.045 E.01358
G1 X161.301 Y148.965 E.12058
G1 X160.767 Y148.965 E.01559
G1 X163.867 Y145.865 E.12801
G1 X163.513 Y145.685 E.01159
G1 X160.233 Y148.965 E.13545
G1 X159.699 Y148.965 E.01559
G1 X163.159 Y145.505 E.14289
G1 X162.805 Y145.325 E.01159
G1 X159.445 Y148.684 E.13874
G1 X159.372 Y148.224 E.01362
G1 X162.451 Y145.144 E.12715
G3 X162.147 Y144.915 I.202 J-.584 E.01132
G1 X159.271 Y147.79 E.11874
G1 X159.091 Y147.436 E.0116
G1 X161.88 Y144.648 E.11514
G1 X161.613 Y144.381 E.01103
G1 X158.911 Y147.082 E.11154
G1 X158.731 Y146.728 E.0116
G1 X161.345 Y144.114 E.10794
G1 X161.078 Y143.848 E.01103
G1 X158.551 Y146.374 E.10434
G1 X158.409 Y146.094 E.00919
G1 X158.353 Y146.038 E.00229
G1 X160.811 Y143.581 E.10148
G1 X160.771 Y143.541 E.00166
G1 X160.618 Y143.24 E.00985
G1 X158.086 Y145.772 E.10454
G1 X157.819 Y145.505 E.01103
G1 X160.438 Y142.886 E.10813
G1 X160.257 Y142.532 E.01159
G1 X157.552 Y145.238 E.11173
G1 X157.284 Y144.971 E.01103
G1 X160.077 Y142.178 E.11533
G1 X159.897 Y141.824 E.01159
G1 X157.017 Y144.704 E.11893
G1 X156.673 Y144.515 E.01148
G1 X159.76 Y141.427 E.12751
G1 X159.687 Y140.966 E.01363
G1 X156.319 Y144.335 E.13909
G1 X155.965 Y144.154 E.01159
G1 X159.614 Y140.506 E.15067
G1 X159.541 Y140.045 E.01363
G1 X155.612 Y143.974 E.16225
G1 X155.258 Y143.793 E.01159
G1 X159.468 Y139.584 E.17383
G1 X159.451 Y139.479 E.0031
G1 X159.529 Y138.989 E.0145
G1 X154.814 Y143.704 E.19472
G1 X154.353 Y143.631 E.01362
G1 X159.63 Y138.354 E.2179
G1 X159.73 Y137.719 E.01876
G1 X153.892 Y143.558 E.24109
G1 X153.431 Y143.484 E.01362
G1 X160.405 Y136.51 E.28799
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X158.991 Y137.925 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.2 I.773 J.94 P1  F28800
G1 X165.029 Y132.955 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X165.463 Y132.521 E.0179
G1 X165.463 Y131.987 E.01559
G1 X164.599 Y132.851 E.03568
G1 X164.226 Y132.91 E.01101
G1 X163.777 Y133.139 E.01474
G1 X165.463 Y131.453 E.06962
G1 X165.463 Y131.435 E.00052
G1 X165.012 Y131.37 E.0133
G1 X152.874 Y143.507 E.50119
G1 X152.24 Y143.608 E.01877
G1 X164.545 Y131.303 E.50813
G1 X164.274 Y131.264 E.008
G1 X164.12 Y131.194 E.00493
G1 X151.605 Y143.709 E.5168
G1 X151.245 Y143.766 E.01065
G1 X150.773 Y144.007 E.01547
G1 X163.753 Y131.026 E.53601
G1 X163.387 Y130.859 E.01177
G1 X145.866 Y148.38 E.72348
G1 X145.812 Y148.035 E.01019
G1 X145.766 Y147.946 E.00293
G1 X163.02 Y130.692 E.71247
G1 X162.653 Y130.525 E.01177
G1 X145.586 Y147.592 E.70476
G1 X145.406 Y147.238 E.01159
G1 X162.302 Y130.342 E.69769
G1 X162.016 Y130.094 E.01105
G1 X145.226 Y146.884 E.69332
G1 X145.045 Y146.53 E.01159
G1 X161.73 Y129.846 E.68895
G1 X161.444 Y129.598 E.01105
G1 X144.813 Y146.228 E.68672
G1 X144.546 Y145.961 E.01103
G1 X161.157 Y129.35 E.68593
G1 X160.871 Y129.102 E.01105
G1 X144.279 Y145.694 E.68515
G1 X144.012 Y145.427 E.01103
G1 X160.633 Y128.807 E.68633
G1 X160.424 Y128.482 E.01128
G1 X143.745 Y145.16 E.68873
G1 X143.666 Y145.081 E.00328
G1 X143.417 Y144.954 E.00814
G1 X160.215 Y128.157 E.69364
G1 X160.006 Y127.831 E.01128
G1 X143.064 Y144.774 E.69963
G1 X142.71 Y144.594 E.01159
G1 X159.797 Y127.506 E.70561
G1 X159.623 Y127.235 E.00942
G1 X159.603 Y127.167 E.00207
G1 X142.356 Y144.414 E.71219
G1 X141.997 Y144.239 E.01166
G1 X159.482 Y126.754 E.72201
G1 X159.361 Y126.341 E.01257
G1 X141.536 Y144.166 E.73606
G1 X141.075 Y144.093 E.01363
G1 X159.24 Y125.928 E.75011
G1 X159.119 Y125.515 E.01257
G1 X140.614 Y144.02 E.76416
G1 X140.193 Y143.954 E.01245
G1 X140.137 Y143.963 E.00163
G1 X159.031 Y125.069 E.78017
G1 X159.031 Y124.535 E.01559
G1 X139.503 Y144.063 E.80636
G1 X138.869 Y144.163 E.01875
G1 X159.031 Y124.001 E.83255
G1 X159.031 Y123.467 E.01559
G1 X137.751 Y144.747 E.87872
G1 X133.897 Y149.135 F28800
G1 F15000
G1 X134.497 Y148.535 E.02475
G1 X134.576 Y148.035 E.01479
G1 X134.693 Y147.805 E.00753
G1 X133.533 Y148.965 E.04789
G1 X133.388 Y148.965 E.00422
G1 X133.335 Y148.629 E.00994
G1 X159.102 Y122.862 E1.06398
G1 X159.323 Y122.107 E.02299
G1 X133.257 Y148.172 E1.07634
G1 X133.077 Y147.819 E.01159
G1 X159.544 Y121.352 E1.09293
G1 X159.623 Y121.083 E.00816
G1 X160.24 Y120.122 E.03336
G1 X132.897 Y147.465 E1.12912
G1 X132.716 Y147.112 E.01159
G1 X164.696 Y115.132 E1.32054
G1 X164.228 Y115.066 E.01378
G1 X132.536 Y146.758 E1.3087
G1 X132.497 Y146.682 E.00252
G1 X132.287 Y146.473 E.00863
G1 X163.841 Y114.919 E1.30296
G1 X163.475 Y114.751 E.01177
G1 X132.02 Y146.206 E1.29885
G1 X131.753 Y145.939 E.01103
G1 X163.108 Y114.584 E1.29474
G1 X162.741 Y114.417 E.01177
M73 P45 R14
G1 X131.487 Y145.672 E1.29063
G1 X131.3 Y145.485 E.00771
G1 X131.193 Y145.431 E.00349
G1 X162.375 Y114.249 E1.2876
G1 X162.085 Y114.117 E.00931
G1 X162.025 Y114.065 E.00231
G1 X130.839 Y145.251 E1.28778
G1 X130.485 Y145.071 E.01159
G1 X161.739 Y113.817 E1.29058
G1 X161.453 Y113.569 E.01105
G1 X130.132 Y144.89 E1.29339
G1 X129.773 Y144.715 E.01165
G1 X161.167 Y113.321 E1.29638
G1 X160.881 Y113.073 E.01105
G1 X129.312 Y144.642 E1.30361
G1 X128.851 Y144.569 E.01363
G1 X160.595 Y112.825 E1.31084
G1 X160.384 Y112.642 E.00816
G1 X160.33 Y112.557 E.00295
G1 X128.39 Y144.496 E1.3189
G2 X127.856 Y144.496 I-.267 J.822 E.01585
G1 X160.121 Y112.231 E1.33232
G1 X159.912 Y111.906 E.01128
G1 X127.222 Y144.596 E1.3499
G1 X126.587 Y144.697 E.01875
G1 X159.703 Y111.581 E1.36747
G1 X159.494 Y111.256 E.01128
G1 X125.598 Y145.153 E1.39972
G1 X124.944 Y145.485 E.02141
G1 X123.749 Y146.682 E.04939
G1 X123.416 Y147.334 E.02138
G1 X121.898 Y148.852 E.06267
G1 X121.825 Y148.391 E.01363
G1 X159.286 Y110.93 E1.54689
G3 X159.116 Y110.567 I.536 J-.472 E.01189
G1 X121.656 Y148.027 E1.54685
G1 X121.475 Y147.673 E.01159
G1 X158.994 Y110.154 E1.54928
G1 X158.873 Y109.741 E.01256
G1 X121.295 Y147.319 E1.55171
G1 X121.113 Y146.968 E.01156
G1 X158.752 Y109.329 E1.55425
G1 X158.63 Y108.916 E.01256
G1 X120.846 Y146.701 E1.56027
G1 X120.579 Y146.434 E.01103
G1 X158.535 Y108.478 E1.56734
G1 X158.535 Y107.944 E.01559
G1 X120.312 Y146.167 E1.57836
G1 X120.045 Y145.9 E.01103
G1 X158.535 Y107.41 E1.58939
G1 X158.535 Y106.876 E.01559
G1 X119.694 Y145.717 E1.60389
G1 X119.34 Y145.537 E.01159
G1 X158.535 Y106.342 E1.6185
G1 X158.756 Y105.586 E.02299
G1 X118.986 Y145.356 E1.64227
G1 X118.668 Y145.194 E.01042
G1 X118.621 Y145.187 E.00137
G1 X158.979 Y104.83 E1.6665
G1 X159.169 Y104.181 E.01974
G1 X159.306 Y103.969 E.00737
G1 X118.161 Y145.113 E1.69901
G1 X117.701 Y145.04 E.01361
G1 X165.463 Y97.278 E1.97226
G1 X165.463 Y97.812 E.01559
G1 X162.773 Y100.501 E.11106
G1 X163.756 Y100.052 E.03157
G1 X165.463 Y98.346 E.07046
G1 X165.463 Y98.88 E.01559
G1 X164.517 Y99.825 E.03903
G1 X165.141 Y99.735 E.0184
G1 X165.632 Y99.244 E.02028
G1 X162.415 Y96.588 F28800
G1 F15000
G1 X162.16 Y96.842 E.01052
G1 X162.07 Y97.467 E.01842
G1 X162.779 Y96.757 E.0293
G1 X163.313 Y96.757 E.01559
G1 X161.979 Y98.091 E.05508
G1 X161.959 Y98.228 E.00405
G1 X161.61 Y98.995 E.02459
G1 X163.847 Y96.757 E.09239
G1 X164.381 Y96.757 E.01559
G1 X160.795 Y100.343 E.14809
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X162.209 Y98.929 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.2 I.107 J-1.212 P1  F28800
G1 X144.048 Y97.332 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X144.623 Y96.757 E.02375
G1 X145.157 Y96.757 E.01559
G1 X144.164 Y97.75 E.041
G1 X144.11 Y98.165 E.01221
G1 X143.987 Y98.461 E.00937
G1 X145.629 Y96.82 E.06778
G1 X145.695 Y97.287 E.01378
G1 X143.61 Y99.373 E.08611
G1 X143.233 Y100.284 E.02879
G1 X145.762 Y97.754 E.10444
G1 X145.829 Y98.221 E.01378
G1 X98.088 Y145.963 E1.97141
G1 X98.548 Y146.036 E.01362
G1 X145.995 Y98.589 E1.95926
G1 X146.163 Y98.956 E.01177
G1 X99.009 Y146.11 E1.94716
G3 X99.413 Y146.24 I.001 J.688 E.0126
G1 X146.33 Y99.322 E1.9374
G1 X146.498 Y99.689 E.01177
G1 X99.766 Y146.42 E1.92971
G1 X100.12 Y146.6 E.01159
G1 X146.665 Y100.055 E1.92202
G1 X146.837 Y100.418 E.01171
G1 X100.435 Y146.82 E1.9161
G1 X100.702 Y147.087 E.01103
G1 X147.085 Y100.704 E1.91532
G1 X147.333 Y100.99 E.01105
G1 X100.969 Y147.354 E1.91453
G1 X101.179 Y147.564 E.00867
G1 X101.217 Y147.639 E.00247
G1 X147.581 Y101.276 E1.91451
G1 X147.829 Y101.562 E.01105
G1 X101.397 Y147.993 E1.91731
G1 X101.578 Y148.347 E.01159
G1 X148.077 Y101.848 E1.92011
G1 X148.325 Y102.134 E.01105
G1 X101.744 Y148.715 E1.9235
G1 X101.783 Y148.965 E.00739
G1 X102.027 Y148.965 E.00714
G1 X103.123 Y147.87 E.04523
G1 X103.429 Y147.27 E.01965
G1 X104.403 Y146.293 E.0403
G1 X105.005 Y145.987 E.01972
G1 X148.629 Y102.364 E1.80136
G1 X148.954 Y102.572 E.01128
G1 X105.901 Y145.626 E1.77783
G1 X106.534 Y145.526 E.01873
G1 X149.279 Y102.781 E1.76508
G1 X149.604 Y102.99 E.01128
G1 X107.12 Y145.474 E1.75431
G1 X107.582 Y145.546 E.01364
G1 X149.929 Y103.199 E1.74867
G1 X150.254 Y103.408 E.01128
G1 X108.043 Y145.619 E1.74304
G3 X108.47 Y145.726 I.008 J.874 E.01299
G1 X150.627 Y103.57 E1.74078
G1 X151.039 Y103.691 E.01256
G1 X108.842 Y145.888 E1.74245
G1 X108.952 Y145.936 E.00349
G1 X109.1 Y145.753 E.00684
G1 X109.301 Y145.963 E.00849
G1 X151.452 Y103.812 E1.74056
G1 X151.865 Y103.934 E.01256
G1 X109.563 Y146.236 E1.7468
G1 X109.824 Y146.508 E.01103
G1 X152.277 Y104.055 E1.75304
G1 X152.69 Y104.176 E.01256
G1 X110.086 Y146.781 E1.75929
G1 X110.347 Y147.053 E.01103
G1 X153.221 Y104.179 E1.77042
G1 X153.755 Y104.179 E.01559
G1 X110.594 Y147.34 E1.78226
G1 X110.775 Y147.693 E.01159
G1 X154.289 Y104.179 E1.79686
G1 X154.823 Y104.179 E.01559
G1 X110.955 Y148.047 E1.81146
G1 X111.136 Y148.401 E.01159
G1 X155.466 Y104.07 E1.83056
G1 X156.223 Y103.847 E.02304
G1 X111.238 Y148.832 E1.85759
G1 X111.259 Y148.965 E.00393
G1 X111.639 Y148.965 E.0111
G1 X112.716 Y147.888 E.04448
G1 X113.181 Y146.975 E.02989
G1 X114.268 Y145.891 E.04483
G1 X115.177 Y145.427 E.02979
G1 X156.98 Y103.624 E1.7262
G1 X157.387 Y103.504 E.01239
G1 X158.077 Y103.061 E.02396
G1 X116.003 Y145.135 E1.73741
G1 X116.639 Y145.034 E.0188
G1 X164.915 Y96.757 E1.9935
G1 X165.449 Y96.757 E.01559
G1 X117.07 Y145.136 E1.99775
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X118.484 Y143.722 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.2 I-.77 J-.942 P1  F28800
G1 X112.63 Y148.509 Z1.2
G1 Z.8
G1 E.8 F1800
M73 P46 R14
G1 F15000
G1 X112.004 Y149.135 E.02585
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.63 Y148.509 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.2 I-.007 J-1.217 P1  F28800
G1 X102.964 Y148.563 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X102.392 Y149.135 E.02361
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X102.964 Y148.563 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.2 I.46 J-1.127 P1  F28800
G1 X97.274 Y146.242 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X139.932 Y103.585 E1.76147
G1 X139.021 Y103.961 E.02877
G1 X96.479 Y146.503 E1.75672
G1 X94.661 Y148.321 F28800
G1 F15000
G1 X93.848 Y149.135 E.03358
G1 X93.314 Y149.135 F28800
G1 F15000
G1 X138.111 Y104.338 E1.84983
G1 X137.815 Y104.46 E.00936
G1 X137.4 Y104.515 E.01223
G1 X93.316 Y148.599 E1.82038
G1 X93.135 Y148.246 E.01159
G1 X136.784 Y104.596 E1.80243
G1 X136.169 Y104.678 E.01812
G1 X92.954 Y147.892 E1.78449
G1 X92.696 Y147.617 E.01103
G1 X135.553 Y104.759 E1.76975
G1 X135.071 Y104.707 E.01416
G1 X92.429 Y147.35 E1.76087
G1 X92.155 Y147.089 E.01103
G1 X134.6 Y104.645 E1.75269
G1 X134.128 Y104.582 E.01389
G1 X91.801 Y146.909 E1.74783
G1 X91.447 Y146.729 E.0116
G1 X133.657 Y104.52 E1.74298
G1 X133.189 Y104.454 E.01379
G1 X91.051 Y146.591 E1.74002
G1 X90.59 Y146.518 E.01363
G1 X132.811 Y104.297 E1.74346
G1 X132.433 Y104.141 E.01194
G1 X90.109 Y146.465 E1.74771
G1 X89.476 Y146.565 E.01874
G1 X132.056 Y103.985 E1.75828
G1 X131.678 Y103.829 E.01194
G1 X86.542 Y148.965 E1.86384
G1 X86.008 Y148.965 E.01559
G1 X131.3 Y103.673 E1.87029
G3 X130.949 Y103.489 I.165 J-.743 E.01169
G1 X85.474 Y148.965 E1.87785
G1 X84.94 Y148.965 E.01559
G1 X130.647 Y103.257 E1.88743
G1 X130.345 Y103.025 E.01112
G1 X84.406 Y148.965 E1.89701
G1 X83.872 Y148.965 E.01559
G1 X130.043 Y102.793 E1.90659
G1 X129.741 Y102.561 E.01112
G1 X83.338 Y148.965 E1.91617
G1 X82.804 Y148.965 E.01559
G1 X129.439 Y102.329 E1.92575
G1 X129.213 Y102.156 E.00831
G1 X129.155 Y102.08 E.00281
G1 X90.697 Y140.538 E1.58807
G1 X91.287 Y139.414 E.03706
G1 X128.923 Y101.778 E1.55414
G1 X128.691 Y101.475 E.01112
G1 X91.65 Y138.517 E1.52957
G1 X91.824 Y137.808 E.0213
G1 X128.459 Y101.173 E1.5128
G1 X128.228 Y100.871 E.01112
G1 X91.999 Y137.1 E1.49602
G1 X92.173 Y136.392 E.0213
G1 X127.996 Y100.569 E1.47925
G1 X127.798 Y100.311 E.00948
G1 X127.775 Y100.256 E.00176
G1 X92.183 Y135.848 E1.46973
G1 X92.183 Y135.314 E.01559
G1 X127.618 Y99.878 E1.46326
G1 X127.462 Y99.501 E.01193
G1 X92.183 Y134.78 E1.4568
G1 X92.183 Y134.246 E.01559
G1 X127.305 Y99.123 E1.45033
G1 X127.149 Y98.746 E.01193
G1 X92.181 Y133.714 E1.44395
G1 X92.075 Y133.285 E.01289
G1 X126.992 Y98.369 E1.44184
G3 X126.879 Y97.948 I.726 J-.421 E.01287
G1 X91.97 Y132.857 E1.44153
G1 X91.864 Y132.428 E.01289
G1 X120.17 Y104.122 E1.16886
G1 X119.26 Y104.499 E.02878
G1 X91.759 Y132 E1.13561
G1 X91.653 Y131.571 E.01289
G1 X118.349 Y104.876 E1.10236
G1 X118.189 Y104.942 E.00507
G1 X117.682 Y105.009 E.01492
G1 X91.543 Y131.148 E1.07938
G1 X91.359 Y130.798 E.01155
G1 X117.067 Y105.09 E1.06157
G1 X116.452 Y105.171 E.01811
G1 X91.175 Y130.448 E1.04376
G1 X90.991 Y130.097 E.01155
G1 X115.837 Y105.252 E1.02595
G1 X115.755 Y105.263 E.00241
G1 X115.346 Y105.209 E.01205
G1 X90.808 Y129.747 E1.01327
G1 X90.624 Y129.397 E.01155
G1 X114.874 Y105.147 E1.00138
G1 X114.402 Y105.085 E.0139
G1 X90.44 Y129.047 E.98948
G2 X90.228 Y128.725 I-.758 J.268 E.01137
G1 X113.93 Y105.022 E.97876
G1 X113.459 Y104.96 E.0139
G1 X89.977 Y128.442 E.96964
G1 X89.726 Y128.159 E.01105
G1 X113.053 Y104.831 E.96328
G1 X112.676 Y104.675 E.01194
G1 X89.475 Y127.876 E.95804
G1 X89.224 Y127.593 E.01105
G1 X112.298 Y104.519 E.95281
G1 X111.92 Y104.363 E.01194
G1 X88.973 Y127.31 E.94757
G1 X88.722 Y127.027 E.01105
G1 X111.542 Y104.206 E.94234
G1 X111.165 Y104.05 E.01194
G1 X88.44 Y126.774 E.93837
G1 X88.124 Y126.556 E.01121
G1 X110.84 Y103.841 E.93801
G1 X110.538 Y103.609 E.01112
G1 X87.809 Y126.338 E.93858
G1 X87.493 Y126.12 E.01121
G1 X110.236 Y103.377 E.93914
G1 X109.934 Y103.145 E.01112
G1 X87.177 Y125.902 E.93971
G1 X86.861 Y125.684 E.01121
G1 X109.631 Y102.914 E.94027
G1 X109.329 Y102.682 E.01112
G1 X86.545 Y125.466 E.94084
G2 X86.185 Y125.292 I-.533 J.645 E.01179
G1 X109.045 Y102.432 E.94399
G1 X108.813 Y102.13 E.01112
G1 X85.798 Y125.145 E.95039
G1 X85.411 Y124.998 E.01209
G1 X108.581 Y101.828 E.9568
G1 X108.349 Y101.526 E.01112
G1 X85.024 Y124.851 E.9632
M73 P47 R14
G1 X84.637 Y124.704 E.01209
G1 X108.117 Y101.224 E.9696
G1 X107.885 Y100.922 E.01112
G1 X84.25 Y124.557 E.976
G1 X83.969 Y124.451 E.00877
G1 X83.838 Y124.435 E.00384
G1 X87.053 Y121.219 E.13277
G1 X86.194 Y121.812 E.03047
G1 X85.763 Y121.976 E.01349
G1 X83.362 Y124.377 E.09913
G1 X82.886 Y124.319 E.01401
G1 X84.901 Y122.304 E.08323
G1 X84.04 Y122.631 E.0269
G1 X82.409 Y124.262 E.06733
G1 X82.257 Y124.243 E.00449
G1 X82.257 Y123.88 E.0106
G1 X83.376 Y122.761 E.04621
G1 X82.768 Y122.835 E.01788
G1 X82.087 Y123.516 E.02812
G1 X89.177 Y119.096 F28800
G1 F15000
G1 X107.653 Y100.62 E.76297
G1 X107.61 Y100.563 E.00209
G1 X107.483 Y100.256 E.0097
G1 X90.688 Y117.051 E.69351
G1 X91.087 Y116.291 E.02504
G1 X91.143 Y116.062 E.0069
G1 X107.327 Y99.878 E.66827
G1 X107.171 Y99.5 E.01194
G1 X91.318 Y115.353 E.65461
G1 X91.493 Y114.644 E.02131
G1 X107.015 Y99.122 E.64096
G1 X106.858 Y98.745 E.01194
G1 X91.667 Y113.936 E.6273
G1 X91.687 Y113.856 E.0024
G1 X91.687 Y113.382 E.01383
G1 X106.702 Y98.367 E.62004
G1 X106.672 Y98.293 E.00234
G1 X106.622 Y97.913 E.01117
G1 X91.687 Y112.848 E.61671
G1 X91.687 Y112.314 E.01559
G1 X99.551 Y104.45 E.32476
G1 X98.639 Y104.828 E.02883
G1 X91.687 Y111.78 E.28709
G1 X91.687 Y111.348 E.01261
G1 X91.667 Y111.266 E.00246
G1 X97.727 Y105.206 E.25026
G1 X97.194 Y105.426 E.01684
G1 X96.939 Y105.46 E.00751
G1 X91.561 Y110.838 E.22208
G1 X91.456 Y110.409 E.01288
G1 X96.324 Y105.541 E.20106
G1 X95.71 Y105.621 E.01811
G1 X91.35 Y109.981 E.18003
G1 X91.244 Y109.553 E.01288
G1 X95.095 Y105.702 E.159
G1 X94.633 Y105.763 E.01361
G1 X94.516 Y105.748 E.00345
G1 X91.139 Y109.124 E.13944
G2 X90.994 Y108.735 I-.862 J.1 E.01224
G1 X94.044 Y105.686 E.12594
G1 X93.572 Y105.624 E.0139
G1 X90.81 Y108.385 E.11404
G1 X90.626 Y108.035 E.01155
G1 X93.1 Y105.562 E.10214
G1 X92.628 Y105.5 E.0139
G1 X90.442 Y107.685 E.09023
G1 X90.259 Y107.334 E.01155
G1 X92.156 Y105.438 E.07833
G1 X92.069 Y105.426 E.00254
G1 X91.761 Y105.299 E.00975
G1 X90.075 Y106.984 E.06961
G1 X89.922 Y106.692 E.00963
G1 X89.88 Y106.645 E.00183
G1 X91.383 Y105.142 E.06206
G1 X91.005 Y104.986 E.01193
G1 X89.629 Y106.362 E.05684
G1 X89.378 Y106.079 E.01105
G1 X90.628 Y104.829 E.05162
G1 X90.251 Y104.672 E.01193
G1 X89.127 Y105.796 E.0464
G1 X88.876 Y105.513 E.01105
G1 X89.873 Y104.516 E.04119
G3 X89.533 Y104.322 I.192 J-.734 E.01157
G1 X88.625 Y105.23 E.03749
G1 X88.374 Y104.947 E.01105
G1 X89.231 Y104.09 E.03537
G1 X88.928 Y103.859 E.01112
G1 X88.088 Y104.699 E.03469
G1 X87.773 Y104.48 E.01121
G1 X88.626 Y103.627 E.03525
G1 X88.324 Y103.395 E.01112
G1 X87.457 Y104.262 E.03581
G1 X87.141 Y104.044 E.01121
G1 X88.022 Y103.163 E.03637
G1 X87.72 Y102.931 E.01112
G1 X86.825 Y103.826 E.03693
G1 X86.51 Y103.608 E.01121
G1 X87.467 Y102.65 E.03953
G1 X87.235 Y102.348 E.01112
G1 X86.194 Y103.39 E.043
G1 X85.806 Y103.243 E.01209
G1 X87.003 Y102.046 E.04941
G1 X86.771 Y101.744 E.01112
G1 X85.419 Y103.096 E.05582
G1 X85.032 Y102.949 E.01209
G1 X86.539 Y101.442 E.06223
G1 X86.307 Y101.14 E.01112
G1 X84.645 Y102.802 E.06864
G1 X84.258 Y102.656 E.01209
G1 X86.075 Y100.838 E.07505
G1 X85.912 Y100.467 E.01184
G1 X83.87 Y102.509 E.08432
G1 X83.399 Y102.446 E.01388
G1 X85.756 Y100.089 E.09732
G1 X85.6 Y99.712 E.01193
G1 X82.923 Y102.388 E.11052
G1 X82.447 Y102.33 E.01401
G1 X85.443 Y99.334 E.12372
G1 X85.287 Y98.957 E.01193
G1 X82.257 Y101.987 E.12512
G1 X82.257 Y101.453 E.01559
G1 X85.13 Y98.579 E.11866
G3 X85.029 Y98.146 I.756 J-.405 E.01313
G1 X82.257 Y100.919 E.11449
G1 X82.257 Y100.385 E.01559
G1 X84.967 Y97.674 E.11193
G1 X84.905 Y97.202 E.0139
G1 X82.256 Y99.851 E.10937
G1 X82.256 Y99.317 E.01559
G1 X84.816 Y96.757 E.1057
G1 X84.282 Y96.757 E.01559
G1 X82.256 Y98.783 E.08365
G1 X82.256 Y98.249 E.01559
G1 X83.748 Y96.757 E.0616
G1 X83.214 Y96.757 E.01559
G1 X82.256 Y97.715 E.03956
G1 X82.256 Y97.181 E.01559
G1 X82.85 Y96.588 E.02452
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X82.256 Y97.181 E-.09572
G1 X82.256 Y97.715 E-.06087
G1 X82.699 Y97.272 E-.07141
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.2 I-.264 J1.188 P1  F28800
G1 X102.359 Y101.642 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X106.559 Y97.442 E.17346
G1 X106.497 Y96.97 E.01389
G1 X103.601 Y99.866 E.11958
G1 X103.978 Y98.955 E.02876
G1 X106.176 Y96.757 E.09077
G1 X105.642 Y96.757 E.01559
G1 X104.232 Y98.167 E.05824
G1 X104.313 Y97.552 E.01813
G1 X105.108 Y96.757 E.03282
G1 X104.574 Y96.757 E.01559
G1 X104.197 Y97.134 E.01556
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X104.574 Y96.757 E-.06074
G1 X105.108 Y96.757 E-.06088
G1 X104.448 Y97.417 E-.10639
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.2 I-.209 J1.199 P1  F28800
G1 X123.539 Y100.753 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X126.817 Y97.476 E.13535
G1 X126.755 Y97.004 E.0139
G1 X124.395 Y99.363 E.09744
G1 X124.771 Y98.453 E.02875
G1 X126.468 Y96.757 E.07004
G1 X125.934 Y96.757 E.01559
G1 X124.905 Y97.786 E.04249
G1 X124.986 Y97.171 E.01812
G1 X125.569 Y96.588 E.02409
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X124.986 Y97.171 E-.09406
G1 X124.905 Y97.786 E-.07074
G1 X125.297 Y97.394 E-.0632
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.2 I-.629 J1.042 P1  F28800
G1 X161.261 Y119.101 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X165.163 Y115.199 E.16113
G1 X165.463 Y115.242 E.00885
G1 X165.463 Y115.433 E.00558
G1 X163.479 Y117.417 E.0819
G1 X164.274 Y117.054 E.0255
G1 X164.393 Y117.037 E.00351
G1 X165.463 Y115.967 E.04418
G1 X165.463 Y116.501 E.01559
G1 X164.816 Y117.148 E.02668
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X165.463 Y116.501 E-.10418
G1 X165.463 Y115.967 E-.06088
G1 X165.072 Y116.358 E-.06294
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.2 I-.744 J-.963 P1  F28800
G1 X122.683 Y149.135 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X122.858 Y148.96 E.0072
G1 X122.958 Y148.326 E.01875
G1 X122.149 Y149.135 E.03339
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.958 Y148.326 E-.13036
G1 X122.858 Y148.96 E-.0732
G1 X122.706 Y149.112 E-.02444
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.2 I-.001 J-1.217 P1  F28800
G1 X82.1 Y149.135 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15000
G1 X86.807 Y144.427 E.19439
G1 X86.426 Y144.69 E.01352
G1 X85.756 Y144.945 E.02095
G1 X82.257 Y148.444 E.14448
G1 X82.257 Y147.91 E.01559
G1 X84.895 Y145.272 E.10892
G1 X84.034 Y145.599 E.02689
G1 X82.257 Y147.376 E.07337
G1 X82.257 Y146.842 E.01559
G1 X83.407 Y145.692 E.04749
G1 X82.799 Y145.765 E.01787
G1 X82.087 Y146.477 E.02941
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X82.799 Y145.765 E-.11481
G1 X83.407 Y145.692 E-.06978
G1 X83.138 Y145.961 E-.04341
; WIPE_END
G1 E-.012 F1800

G17
G3 Z1.2 I-.801 J.916 P1  F28800
G1 X189.5 Y239 Z1.2
G1 Z1
G1 E.8 F1800
; LAYER_HEIGHT: 0.2
; FEATURE: Prime tower
; LINE_WIDTH: 0.5
G1  X155.500 Y239.000  E1.2922 F5400
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X155.500 
G1  Y219.500 
G1  X156.500 
;--------------------
; CP EMPTY GRID START
; layer #6
G1  Y239.000  E0.7411
G1  X164.500 
G1  Y219.500  E0.7411
G1  X172.500 
G1  Y239.000  E0.7411
G1  X180.500 
G1  Y219.500  E0.7411
G1  X188.500 
G1  Y239.000  E0.7411
; CP EMPTY GRID END
;------------------






G1  X190.000 
G1  Y239.500 
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
G1  X190.457 
G1  Y239.957 
G1  X154.543  E1.3650
G1  Y218.543  E0.8139
G1  X190.457  E1.3650
G1  Y239.957  E0.8139
G1  X190.914 
G1  Y240.414 
G1  X154.086  E1.3997
G1  Y218.086  E0.8486
G1  X190.914  E1.3997
G1  Y240.414  E0.8486

G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X188.914 Y240.414 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.4 I1.134 J-.443 P1  F28800
G1 X151.292 Y144.072 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X149.634 Y144.918 E.05859
G1 X148.282 Y146.268 E.06017
G1 X147.413 Y147.973 E.06022
G1 X147.21 Y149.259 E.04099
G1 X145.707 Y149.259 E.04731
G1 X145.529 Y148.127 E.03608
G1 X144.732 Y146.563 E.05526
G1 X143.491 Y145.322 E.05524
G1 X141.927 Y144.525 E.05526
G1 X140.193 Y144.252 E.05527
G1 X138.46 Y144.525 E.0552
G1 X136.896 Y145.322 E.05525
G1 X135.656 Y146.563 E.05524
G1 X134.859 Y148.127 E.05525
G1 X134.68 Y149.259 E.03608
G1 X133.137 Y149.259 E.04858
G1 X132.982 Y148.281 E.03118
G1 X132.256 Y146.857 E.05033
G1 X131.125 Y145.726 E.05034
G1 X129.701 Y145.001 E.0503
G1 X128.123 Y144.751 E.0503
G1 X126.545 Y145.001 E.05029
G1 X125.119 Y145.726 E.05035
G2 X123.989 Y146.857 I378.014 J378.403 E.05032
G1 X123.263 Y148.281 E.05031
G1 X123.108 Y149.259 E.03118
G1 X121.665 Y149.259 E.04544
G1 X121.534 Y148.437 E.02621
M73 P47 R13
G1 X120.88 Y147.151 E.04542
G1 X119.861 Y146.132 E.04537
G1 X118.575 Y145.478 E.04541
G1 X117.151 Y145.249 E.04542
G1 X115.726 Y145.478 E.04542
G1 X114.443 Y146.132 E.04534
M73 P48 R13
G1 X113.422 Y147.151 E.0454
G1 X112.767 Y148.437 E.04545
G1 X112.638 Y149.259 E.02619
G1 X111.008 Y149.259 E.05132
G1 X110.903 Y148.591 E.02129
G1 X110.321 Y147.45 E.04031
G1 X109.118 Y146.198 E.05466
G1 X109.04 Y146.294 E.00392
G1 X108.244 Y145.948 E.02732
G1 X106.993 Y145.752 E.03988
G1 X105.725 Y145.951 E.0404
G1 X104.578 Y146.534 E.04049
G1 X103.67 Y147.445 E.04051
G1 X103.085 Y148.59 E.04048
G1 X102.979 Y149.259 E.02131
G1 X101.531 Y149.259 E.04556
G1 X101.451 Y148.745 E.01638
G1 X100.938 Y147.739 E.03555
G1 X100.14 Y146.941 E.03554
G2 X99.133 Y146.427 I-77.265 J150.31 E.03556
G1 X98.017 Y146.249 E.03559
G1 X96.902 Y146.428 E.03553
G1 X95.896 Y146.94 E.03553
G1 X95.098 Y147.739 E.03556
G1 X94.585 Y148.744 E.03553
G1 X94.503 Y149.259 E.0164
G1 X93.195 Y149.259 E.04117
G1 X93.138 Y148.898 E.01149
G1 X92.696 Y148.032 E.03062
G1 X92.007 Y147.344 E.03066
G1 X91.141 Y146.903 E.03059
G1 X90.181 Y146.752 E.03059
G1 X89.219 Y146.903 E.03066
G1 X88.353 Y147.344 E.03059
G1 X87.663 Y148.033 E.03068
G1 X87.223 Y148.899 E.03059
G1 X87.166 Y149.259 E.01147
G1 X81.963 Y149.259 E.1638
G1 X81.963 Y145.571 E.11611
G1 X83.898 Y145.336 E.06136
G1 X86.289 Y144.428 E.08051
G1 X88.393 Y142.975 E.08049
G1 X90.09 Y141.062 E.08051
G1 X91.278 Y138.798 E.08048
G1 X91.889 Y136.316 E.08046
G1 X91.889 Y133.758 E.08053
G1 X91.278 Y131.276 E.08046
G1 X90.09 Y129.012 E.08048
G1 X88.393 Y127.099 E.08051
G1 X86.289 Y125.646 E.08049
G1 X83.898 Y124.738 E.0805
G1 X81.963 Y124.504 E.06136
G1 X81.963 Y122.636 E.05878
G1 X83.778 Y122.416 E.05756
G1 X86.057 Y121.55 E.07673
G1 X88.061 Y120.167 E.07665
G1 X89.678 Y118.344 E.07672
G1 X90.81 Y116.186 E.0767
G1 X91.393 Y113.82 E.07671
G1 X91.393 Y111.384 E.07669
G1 X90.81 Y109.018 E.07671
G1 X89.678 Y106.86 E.0767
G1 X88.061 Y105.037 E.07671
G1 X86.057 Y103.652 E.07669
G1 X83.778 Y102.788 E.07672
G1 X81.963 Y102.568 E.05756
G1 X81.962 Y96.463 E.19217
G1 X85.105 Y96.463 E.09894
G1 X85.22 Y97.338 E.02778
G1 X85.352 Y98.346 E.032
G1 X86.313 Y100.665 E.07901
G1 X87.839 Y102.653 E.0789
G1 X89.829 Y104.179 E.07893
G2 X92.146 Y105.14 I362.604 J-871.041 E.07896
G1 X94.633 Y105.466 E.07896
G1 X97.118 Y105.14 E.0789
G2 X99.436 Y104.179 I-557.937 J-1349.81 E.07901
G1 X101.426 Y102.653 E.07894
G1 X102.953 Y100.665 E.0789
G1 X103.911 Y98.346 E.07897
G1 X104.16 Y96.463 E.05979
G1 X106.727 Y96.463 E.08079
G1 X106.958 Y98.216 E.05566
G1 X107.867 Y100.415 E.07489
G1 X109.315 Y102.301 E.07486
G1 X111.201 Y103.747 E.07481
G1 X113.398 Y104.656 E.07483
G1 X115.755 Y104.966 E.07484
G1 X118.112 Y104.656 E.07484
G1 X120.308 Y103.747 E.07482
G1 X122.194 Y102.301 E.07482
G1 X123.643 Y100.415 E.07486
G1 X124.551 Y98.216 E.07489
G1 X124.783 Y96.463 E.05566
G1 X126.981 Y96.463 E.06919
G1 X127.194 Y98.088 E.0516
G1 X128.055 Y100.163 E.0707
G1 X129.423 Y101.946 E.07076
G1 X131.205 Y103.315 E.07073
G1 X133.282 Y104.174 E.07073
G1 X135.509 Y104.468 E.07072
G1 X137.738 Y104.174 E.07078
G1 X139.814 Y103.315 E.07073
G1 X141.596 Y101.946 E.07073
G1 X142.965 Y100.163 E.07077
G1 X143.823 Y98.088 E.07068
G1 X144.037 Y96.463 E.05159
G1 X145.875 Y96.463 E.05785
G1 X146.115 Y98.144 E.05346
G1 X147.075 Y100.244 E.07268
G2 X148.587 Y101.987 I729.877 J-631.467 E.07263
G1 X150.528 Y103.234 E.07264
G1 X152.742 Y103.885 E.07265
G1 X155.048 Y103.885 E.07259
G2 X157.264 Y103.234 I-65.292 J-226.329 E.07269
G1 X159.205 Y101.987 E.07264
G1 X160.716 Y100.244 E.07262
G1 X161.674 Y98.145 E.07264
G1 X161.918 Y96.463 E.05348
G1 X165.757 Y96.463 E.12084
G1 X165.757 Y99.943 E.10956
G1 X164.215 Y100.165 E.04902
G1 X162.246 Y101.065 E.06816
G1 X160.609 Y102.483 E.06816
G1 X159.439 Y104.304 E.06815
G1 X158.829 Y106.382 E.06818
G1 X158.829 Y108.548 E.06816
G1 X159.439 Y110.626 E.06818
G1 X160.609 Y112.447 E.06814
G1 X162.246 Y113.867 E.0682
G1 X164.215 Y114.767 E.06817
G1 X165.757 Y114.987 E.04901
G1 X165.757 Y117.138 E.06769
G1 X164.357 Y117.339 E.0445
G1 X162.516 Y118.179 E.0637
G1 X160.987 Y119.503 E.06366
G1 X159.893 Y121.207 E.06374
G1 X159.325 Y123.147 E.06364
G1 X159.325 Y125.169 E.06367
G1 X159.893 Y127.112 E.0637
G1 X160.987 Y128.813 E.06368
G1 X162.516 Y130.139 E.0637
G1 X164.357 Y130.979 E.06371
G1 X165.757 Y131.181 E.0445
G1 X165.757 Y132.965 E.05618
G1 X164.318 Y133.193 E.04584
G1 X162.475 Y134.132 E.06513
G1 X161.012 Y135.595 E.06513
G1 X160.073 Y137.437 E.06508
G1 X159.749 Y139.479 E.0651
G1 X160.073 Y141.521 E.06509
G1 X161.012 Y143.365 E.06514
G1 X162.475 Y144.826 E.06509
G1 X164.318 Y145.765 E.06512
G1 X165.757 Y145.993 E.04584
G1 X165.757 Y149.259 E.10281
G1 X159.239 Y149.259 E.20518
G1 X159.034 Y147.973 E.04099
G1 X158.168 Y146.269 E.06018
G1 X156.815 Y144.918 E.06018
G2 X155.113 Y144.049 I-169.958 J330.924 E.06016
G1 X153.225 Y143.749 E.06018
G1 X151.347 Y144.048 E.05987
G1 X151.539 Y144.414 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.459 Y144.427 E.00237
G2 X149.868 Y145.239 I127.88 J252.52 E.0521
G1 X148.603 Y146.502 E.05212
G1 X147.79 Y148.095 E.05215
G1 X147.545 Y149.651 E.04592
G1 X145.372 Y149.651 E.06337
G1 X145.151 Y148.249 E.04138
G1 X144.411 Y146.796 E.04756
G1 X143.258 Y145.643 E.04755
G1 X141.804 Y144.903 E.04756
G1 X140.193 Y144.648 E.04758
G1 X138.583 Y144.903 E.04752
G1 X137.13 Y145.643 E.04756
G1 X135.977 Y146.796 E.04755
G1 X135.236 Y148.249 E.04756
G1 X135.015 Y149.651 E.04138
G1 X132.802 Y149.651 E.06453
G1 X132.605 Y148.403 E.03684
G1 X131.935 Y147.09 E.04299
G1 X130.892 Y146.047 E.04301
G1 X129.578 Y145.379 E.04297
G1 X128.123 Y145.148 E.04297
G1 X126.667 Y145.379 E.04297
G1 X125.352 Y146.047 E.04302
G2 X124.311 Y147.09 I348.538 J348.883 E.04298
G1 X123.641 Y148.403 E.04299
G1 X123.443 Y149.651 E.03684
G1 X121.33 Y149.651 E.06162
G1 X121.157 Y148.559 E.03223
G1 X120.559 Y147.384 E.03845
G1 X119.628 Y146.453 E.0384
G1 X118.453 Y145.855 E.03845
G1 X117.151 Y145.646 E.03844
G1 X115.849 Y145.855 E.03845
G2 X114.676 Y146.453 I479.975 J942.801 E.0384
G1 X113.743 Y147.384 E.03843
G1 X113.144 Y148.56 E.03846
G1 X112.973 Y149.651 E.03222
G1 X110.672 Y149.651 E.06709
G1 X110.525 Y148.713 E.02768
G1 X109.998 Y147.68 E.03383
G1 X109.143 Y146.79 E.03598
G1 X109.092 Y146.854 E.00239
G1 X108.801 Y146.618 E.01092
G1 X108.134 Y146.328 E.02121
G1 X106.993 Y146.148 E.03368
G1 X105.847 Y146.329 E.03381
G1 X104.812 Y146.855 E.03387
G1 X103.991 Y147.678 E.0339
G1 X103.463 Y148.713 E.03388
G1 X103.313 Y149.651 E.02769
G1 X101.196 Y149.651 E.06174
G1 X101.073 Y148.867 E.02313
G1 X100.617 Y147.972 E.0293
G1 X99.906 Y147.261 E.02931
G2 X99.01 Y146.805 I-68.769 J133.821 E.02931
G1 X98.017 Y146.646 E.02934
G1 X97.025 Y146.805 E.02929
G1 X96.13 Y147.261 E.0293
G1 X95.419 Y147.972 E.02932
G1 X94.963 Y148.867 E.0293
G1 X94.838 Y149.651 E.02314
G1 X92.86 Y149.651 E.05766
G1 X92.761 Y149.021 E.01859
G1 X92.375 Y148.266 E.02474
G1 X91.774 Y147.665 E.02478
G1 X91.018 Y147.281 E.02471
G1 X90.181 Y147.148 E.02473
G1 X89.341 Y147.281 E.02478
G1 X88.586 Y147.665 E.02471
G1 X87.985 Y148.266 E.02479
G1 X87.6 Y149.022 E.02471
G1 X87.501 Y149.651 E.01858
G1 X81.571 Y149.651 E.17293
G1 X81.571 Y145.223 E.12912
G1 X83.803 Y144.952 E.06558
G1 X86.105 Y144.078 E.07179
G1 X88.131 Y142.679 E.07179
G1 X89.765 Y140.837 E.0718
G1 X90.909 Y138.658 E.07177
G1 X91.497 Y136.269 E.07176
G1 X91.497 Y133.806 E.07182
G1 X90.909 Y131.416 E.07176
G1 X89.765 Y129.237 E.07177
G1 X88.131 Y127.395 E.0718
G1 X86.105 Y125.996 E.07179
G1 X83.803 Y125.122 E.07179
G1 X81.571 Y124.851 E.06558
G1 X81.571 Y122.289 E.0747
G1 X83.683 Y122.032 E.06206
G1 X85.873 Y121.2 E.0683
G1 X87.799 Y119.871 E.06823
G1 X89.353 Y118.119 E.06829
G1 X90.441 Y116.046 E.06827
G1 X91.001 Y113.773 E.06828
G1 X91.001 Y111.432 E.06826
G1 X90.441 Y109.158 E.06828
G1 X89.353 Y107.085 E.06827
G1 X87.799 Y105.333 E.06829
G1 X85.873 Y104.002 E.06826
G1 X83.683 Y103.172 E.06829
G1 X81.571 Y102.915 E.06206
G1 X81.57 Y96.071 E.19957
G1 X85.449 Y96.071 E.11311
G1 X85.608 Y97.287 E.03576
G1 X85.734 Y98.244 E.02814
G1 X86.655 Y100.467 E.07017
G1 X88.119 Y102.373 E.07007
G1 X90.027 Y103.836 E.07011
G2 X92.248 Y104.758 I347.675 J-835.156 E.07012
G1 X94.633 Y105.071 E.07014
G1 X97.015 Y104.758 E.07008
G2 X99.239 Y103.836 I-535.358 J-1295.158 E.07017
G1 X101.146 Y102.373 E.07012
G1 X102.61 Y100.467 E.07007
G1 X103.529 Y98.244 E.07015
G1 X103.817 Y96.071 E.06391
G1 X107.071 Y96.071 E.09488
G1 X107.34 Y98.114 E.06008
G1 X108.209 Y100.217 E.06636
G1 X109.595 Y102.021 E.06633
G1 X111.399 Y103.405 E.06629
G2 X113.5 Y104.274 I689.731 J-1664.41 E.0663
G1 X115.755 Y104.571 E.06632
G1 X118.01 Y104.274 E.06632
G1 X120.111 Y103.405 E.0663
G1 X121.914 Y102.021 E.06629
G1 X123.3 Y100.217 E.06633
G1 X124.169 Y98.114 E.06636
G1 X124.439 Y96.071 E.06008
G1 X127.325 Y96.071 E.08414
G1 X127.576 Y97.986 E.05632
G1 X128.397 Y99.965 E.06248
G1 X129.703 Y101.667 E.06254
G1 X131.403 Y102.973 E.0625
G1 X133.384 Y103.792 E.06251
G1 X135.509 Y104.073 E.0625
G1 X137.636 Y103.792 E.06256
G1 X139.617 Y102.973 E.06251
G1 X141.317 Y101.667 E.0625
G1 X142.622 Y99.965 E.06255
G1 X143.441 Y97.986 E.06246
G1 X143.693 Y96.071 E.05631
G1 X146.215 Y96.071 E.07353
G1 X146.495 Y98.033 E.05779
G1 X147.408 Y100.03 E.06403
G2 X148.846 Y101.687 I694.205 J-600.602 E.06398
G1 X150.693 Y102.874 E.06401
G1 X152.798 Y103.493 E.06401
G1 X154.992 Y103.493 E.06398
G2 X157.099 Y102.874 I-62.118 J-215.259 E.06402
G1 X158.946 Y101.687 E.06401
G1 X160.383 Y100.03 E.06398
G1 X161.294 Y98.033 E.064
G1 X161.578 Y96.071 E.0578
G1 X166.149 Y96.071 E.13327
G1 X166.149 Y100.283 E.12282
G1 X164.327 Y100.546 E.05367
G1 X162.46 Y101.399 E.05985
G1 X160.908 Y102.742 E.05985
G1 X159.8 Y104.469 E.05984
G1 X159.221 Y106.439 E.05987
G1 X159.221 Y108.491 E.05985
G1 X159.8 Y110.461 E.05987
G1 X160.908 Y112.188 E.05983
G1 X162.46 Y113.534 E.05989
G1 X164.327 Y114.387 E.05986
G1 X166.149 Y114.647 E.05366
G1 X166.149 Y117.477 E.08252
G1 X164.469 Y117.72 E.04949
G1 X162.73 Y118.513 E.05573
G1 X161.286 Y119.762 E.05568
G1 X160.254 Y121.371 E.05575
G1 X159.717 Y123.203 E.05566
G1 X159.717 Y125.113 E.0557
G1 X160.254 Y126.947 E.05572
G1 X161.286 Y128.554 E.0557
G1 X162.73 Y129.806 E.05571
G1 X164.469 Y130.599 E.05573
G1 X166.149 Y130.841 E.04949
G1 X166.149 Y133.3 E.0717
G1 X164.441 Y133.571 E.05042
G1 X162.708 Y134.453 E.05671
G1 X161.333 Y135.828 E.0567
G1 X160.451 Y137.559 E.05666
G1 X160.146 Y139.479 E.05668
G1 X160.451 Y141.399 E.05668
G1 X161.333 Y143.132 E.05671
G1 X162.708 Y144.505 E.05667
G1 X164.441 Y145.387 E.05671
G1 X166.149 Y145.658 E.05042
G1 X166.149 Y149.651 E.11643
G1 X158.904 Y149.651 E.21125
G1 X158.657 Y148.095 E.04593
G1 X157.847 Y146.502 E.05212
G1 X156.582 Y145.239 E.05213
G2 X154.99 Y144.427 I-158.876 J309.309 E.0521
G1 X153.225 Y144.146 E.05213
G1 X151.599 Y144.405 E.04801
G1 X151.492 Y144.348 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X151.459 Y144.427 E-.01611
G1 X149.868 Y145.239 E-.20369
G1 X149.817 Y145.29 E-.0082
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.4 I1.073 J.575 P1  F28800
G1 X150.262 Y144.458 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420508
G1 F15000
G1 X104.201 Y98.397 E1.90202
G1 X104.05 Y98.78 E.01202
G1 X149.783 Y144.512 E1.88845
G1 X149.437 Y144.7 E.0115
G1 X103.894 Y99.157 E1.8806
G1 X103.738 Y99.535 E.01194
G1 X149.169 Y144.967 E1.87602
G1 X148.902 Y145.234 E.01103
G1 X103.582 Y99.913 E1.87144
G1 X103.425 Y100.291 E.01194
G1 X148.635 Y145.5 E1.86685
G1 X148.368 Y145.767 E.01103
G1 X103.269 Y100.669 E1.86227
G3 X103.066 Y101 I-.716 J-.212 E.01147
G1 X148.101 Y146.034 E1.85962
G1 X148.041 Y146.093 E.00246
G1 X147.901 Y146.368 E.00901
G1 X102.834 Y101.302 E1.86095
G1 X102.602 Y101.604 E.01112
G1 X147.721 Y146.722 E1.86308
G1 X147.54 Y147.076 E.01159
G1 X102.37 Y101.906 E1.86521
G1 X102.138 Y102.208 E.01112
G1 X147.36 Y147.429 E1.86735
G1 X147.18 Y147.783 E.01159
G1 X101.906 Y102.51 E1.86948
G1 X101.674 Y102.812 E.01112
G1 X147.077 Y148.214 E1.87483
G1 X147.004 Y148.676 E.01363
G1 X145.239 Y146.91 E.07291
G1 X145.793 Y147.998 E.03566
G1 X146.76 Y148.965 E.03991
G1 X146.226 Y148.965 E.01559
G1 X145.704 Y148.444 E.02152
G1 X143.532 Y145.203 F28800
G1 F15000
G1 X101.384 Y103.055 E1.74042
G1 X101.082 Y103.287 E.01112
G1 X142.055 Y144.261 E1.69193
G1 X141.406 Y144.145 E.01926
G1 X100.78 Y103.519 E1.6776
G1 X100.478 Y103.751 E.01112
G1 X140.772 Y144.045 E1.66389
G1 X140.153 Y143.96 E.01825
G1 X100.175 Y103.983 E1.6508
G1 X99.873 Y104.214 E.01112
G1 X139.692 Y144.033 E1.64424
G1 X139.231 Y144.106 E.01363
G1 X99.568 Y104.443 E1.63782
G1 X99.19 Y104.599 E.01193
G1 X138.769 Y144.179 E1.63436
G1 X138.369 Y144.242 E.01185
G1 X138.322 Y144.266 E.00151
G1 X98.813 Y104.756 E1.63149
G1 X98.435 Y104.912 E.01193
G1 X137.969 Y144.446 E1.63247
G1 X137.615 Y144.626 E.01159
G1 X98.058 Y105.069 E1.63344
G1 X97.68 Y105.225 E.01193
G1 X137.261 Y144.806 E1.63443
G1 X136.907 Y144.986 E.01159
G1 X97.302 Y105.382 E1.63542
G1 X97.194 Y105.426 E.00341
G1 X96.857 Y105.47 E.00993
G1 X136.595 Y145.208 E1.64089
G1 X136.328 Y145.475 E.01103
G1 X96.385 Y105.533 E1.64935
G1 X95.913 Y105.595 E.0139
G1 X136.061 Y145.742 E1.65781
G1 X135.794 Y146.009 E.01103
G1 X95.441 Y105.657 E1.66628
G1 X94.97 Y105.719 E.0139
G1 X135.527 Y146.276 E1.67474
G2 X135.31 Y146.593 I.38 J.492 E.01141
G1 X94.457 Y105.74 E1.68697
G1 X93.842 Y105.659 E.0181
G1 X135.13 Y146.947 E1.70492
G1 X134.95 Y147.301 E.01159
G1 X93.227 Y105.578 E1.72286
G1 X92.612 Y105.498 E.0181
G1 X134.769 Y147.655 E1.7408
G1 X134.589 Y148.008 E.01159
G1 X91.963 Y105.382 E1.76016
G3 X91.052 Y105.005 I141.89 J-343.951 E.0288
G1 X134.508 Y148.461 E1.79446
G1 X134.436 Y148.923 E.01363
G1 X132.811 Y147.298 E.06707
G1 X133.266 Y148.189 E.02918
G1 X133.284 Y148.305 E.00345
M73 P49 R13
G1 X133.944 Y148.965 E.02725
G1 X133.41 Y148.965 E.01559
G1 X133.18 Y148.735 E.00948
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X133.41 Y148.965 E-.03702
G1 X133.944 Y148.965 E-.06087
G1 X133.284 Y148.305 E-.10637
G1 X133.266 Y148.189 E-.01346
G1 X133.225 Y148.108 E-.01027
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.4 I-.12 J-1.211 P1  F28800
G1 X122.9 Y149.135 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X121.515 Y147.749 E.0572
G1 X121.818 Y148.345 E.01951
G1 X121.863 Y148.632 E.00849
G1 X122.366 Y149.135 E.02076
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X121.863 Y148.632 E-.08104
G1 X121.818 Y148.345 E-.03314
G1 X121.515 Y147.749 E-.07616
G1 X121.748 Y147.983 E-.03766
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.4 I-.146 J-1.208 P1  F28800
G1 X112.22 Y149.135 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X110.771 Y147.685 E.05985
G1 X111.186 Y148.499 E.02667
G1 X111.211 Y148.66 E.00475
G1 X111.686 Y149.135 E.01961
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.211 Y148.66 E-.07656
G1 X111.186 Y148.499 E-.01855
G1 X110.771 Y147.685 E-.10413
G1 X110.949 Y147.864 E-.02876
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.4 I-.088 J-1.214 P1  F28800
G1 X101.492 Y148.553 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X102.074 Y149.135 E.02403
G1 X106.632 Y145.682 F28800
G1 F15000
G1 X90.93 Y129.981 E.64838
G1 X91.52 Y131.104 E.03706
G1 X106.022 Y145.607 E.59885
G1 X105.633 Y145.668 E.01149
G1 X105.578 Y145.696 E.00182
G1 X91.719 Y131.837 E.57227
G1 X91.893 Y132.546 E.0213
G1 X105.224 Y145.876 E.55045
G1 X104.869 Y146.056 E.0116
G1 X92.068 Y133.254 E.52863
G1 X92.183 Y133.722 E.01408
G1 X92.183 Y133.903 E.00529
G1 X104.515 Y146.236 E.50925
G1 X104.403 Y146.293 E.00367
G1 X104.221 Y146.476 E.00753
G1 X92.183 Y134.437 E.4971
G1 X92.183 Y134.971 E.01559
G1 X103.954 Y146.743 E.48609
G1 X103.688 Y147.01 E.01103
G1 X92.183 Y135.505 E.47508
G1 X92.183 Y136.039 E.01559
G1 X103.424 Y147.28 E.46417
G1 X103.243 Y147.634 E.01159
G1 X92.139 Y136.53 E.45852
G1 X92.034 Y136.958 E.01289
G1 X103.063 Y147.987 E.45543
G1 X102.882 Y148.341 E.01159
G1 X91.928 Y137.387 E.45234
G1 X91.823 Y137.815 E.01289
G1 X102.761 Y148.754 E.4517
G1 X102.728 Y148.965 E.00624
G1 X102.438 Y148.965 E.00845
G1 X91.717 Y138.244 E.44272
G1 X91.612 Y138.672 E.01289
G1 X99.057 Y146.118 E.30745
G1 X98.422 Y146.016 E.01878
G1 X91.47 Y139.065 E.28706
G1 X91.286 Y139.415 E.01155
G1 X97.85 Y145.978 E.27103
G1 X97.389 Y146.052 E.01361
G1 X91.102 Y139.765 E.25961
G1 X90.919 Y140.115 E.01155
G1 X96.929 Y146.125 E.24818
G1 X96.81 Y146.144 E.00353
G1 X96.548 Y146.278 E.00859
G1 X90.735 Y140.465 E.24003
G1 X90.551 Y140.815 E.01155
G1 X96.194 Y146.458 E.23301
G1 X95.84 Y146.639 E.01159
G1 X90.367 Y141.166 E.22599
G1 X90.334 Y141.23 E.00212
G1 X90.129 Y141.461 E.00901
G1 X95.544 Y146.876 E.22362
G1 X95.277 Y147.143 E.01103
G1 X89.878 Y141.744 E.22296
G1 X89.627 Y142.027 E.01104
G1 X95.01 Y147.41 E.2223
G2 X94.78 Y147.714 I.353 J.506 E.01132
G1 X89.376 Y142.31 E.22316
G1 X89.125 Y142.593 E.01104
G1 X94.6 Y148.068 E.22608
G1 X94.419 Y148.422 E.01159
G1 X88.874 Y142.876 E.229
G1 X88.623 Y143.159 E.01104
G1 X94.276 Y148.813 E.23346
G1 X94.252 Y148.965 E.0045
G1 X93.895 Y148.965 E.01044
G1 X88.316 Y143.386 E.23038
G1 X88 Y143.604 E.01121
G1 X90.975 Y146.579 E.12286
G1 X90.341 Y146.479 E.01875
G1 X87.684 Y143.822 E.10972
G1 X87.368 Y144.04 E.01121
G1 X89.836 Y146.508 E.10191
G1 X89.375 Y146.581 E.01364
G1 X87.052 Y144.258 E.09591
G1 X86.736 Y144.476 E.01121
G1 X88.963 Y146.703 E.09196
G1 X88.609 Y146.883 E.0116
G1 X86.419 Y144.693 E.09044
G1 X86.032 Y144.84 E.01209
G1 X88.255 Y147.063 E.09181
G1 X88.178 Y147.103 E.00254
G1 X87.969 Y147.311 E.00861
G1 X85.645 Y144.987 E.09598
G1 X85.258 Y145.134 E.01209
G1 X87.702 Y147.578 E.10093
G1 X87.435 Y147.845 E.01103
G1 X84.871 Y145.281 E.10589
G1 X84.484 Y145.428 E.01209
G1 X87.251 Y148.195 E.11427
G1 X87.071 Y148.549 E.0116
G1 X84.097 Y145.575 E.12281
G1 X83.969 Y145.624 E.004
G1 X83.65 Y145.662 E.00938
G1 X86.92 Y148.932 E.13503
G1 X86.915 Y148.965 E.00097
G1 X86.419 Y148.965 E.01448
G1 X83.174 Y145.72 E.134
G1 X82.698 Y145.778 E.01401
G1 X85.885 Y148.965 E.13161
G1 X85.351 Y148.965 E.01559
G1 X82.257 Y145.871 E.12776
G1 X82.257 Y146.405 E.01559
G1 X84.817 Y148.965 E.10571
G1 X84.283 Y148.965 E.01559
G1 X82.257 Y146.939 E.08366
G1 X82.257 Y147.473 E.01559
G1 X83.749 Y148.965 E.06161
G1 X83.215 Y148.965 E.01559
G1 X82.257 Y148.007 E.03956
G1 X82.257 Y148.541 E.01559
G1 X82.851 Y149.135 E.02451
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X82.257 Y148.541 E-.09571
G1 X82.257 Y148.007 E-.06087
G1 X82.7 Y148.45 E-.07141
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.4 I1.217 J-.03 P1  F28800
G1 X82.087 Y123.808 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X82.559 Y124.28 E.01949
G1 X83.167 Y124.353 E.01787
G1 X82.257 Y123.443 E.03757
G1 X82.257 Y122.909 E.01559
G1 X83.774 Y124.427 E.06267
G1 X83.969 Y124.451 E.00572
G1 X84.554 Y124.673 E.01829
G1 X82.722 Y122.84 E.07567
G1 X83.198 Y122.783 E.01401
G1 X85.415 Y125 E.09156
G1 X86.276 Y125.327 E.02689
G1 X83.674 Y122.725 E.10745
G2 X84.094 Y122.61 I-.021 J-.906 E.01283
G1 X106.945 Y145.461 E.94359
G1 X106.993 Y145.454 E.00141
G1 X107.561 Y145.543 E.01679
G1 X84.481 Y122.463 E.95304
G1 X84.868 Y122.316 E.01209
G1 X108.194 Y145.643 E.96322
G1 X108.327 Y145.664 E.00393
G1 X108.952 Y145.936 E.0199
G1 X108.983 Y145.898 E.00143
G1 X85.255 Y122.169 E.97982
G1 X85.642 Y122.022 E.01209
G1 X112.413 Y148.794 E1.10548
G1 X112.489 Y148.335 E.01357
G1 X86.029 Y121.875 E1.09263
G2 X86.375 Y121.688 I-.209 J-.799 E.01161
G1 X112.669 Y147.981 E1.08576
G1 X112.849 Y147.628 E.01159
G1 X86.691 Y121.47 E1.08015
G1 X87.007 Y121.252 E.01121
G1 X113.029 Y147.274 E1.07454
G1 X113.181 Y146.975 E.00977
G1 X113.223 Y146.934 E.00173
G1 X87.323 Y121.034 E1.0695
G1 X87.639 Y120.816 E.01121
G1 X113.49 Y146.667 E1.06749
G1 X113.757 Y146.4 E.01103
G1 X87.955 Y120.598 E1.06548
G1 X88.268 Y120.377 E.01119
G1 X114.025 Y146.133 E1.06358
G1 X114.3 Y145.875 E.01103
G1 X88.519 Y120.094 E1.06458
G1 X88.77 Y119.811 E.01104
G1 X114.654 Y145.694 E1.06882
G1 X115.007 Y145.514 E.01159
G1 X89.021 Y119.528 E1.07306
G1 X89.272 Y119.245 E.01104
G1 X115.361 Y145.334 E1.0773
G1 X115.634 Y145.195 E.00894
G1 X115.739 Y145.178 E.00311
G1 X89.523 Y118.962 E1.08255
G1 X89.774 Y118.679 E.01104
G1 X116.199 Y145.104 E1.09119
G1 X116.659 Y145.03 E.01361
G1 X89.997 Y118.368 E1.10097
G1 X90.181 Y118.018 E.01155
G1 X117.12 Y144.956 E1.11239
G1 X117.744 Y145.046 E.01841
G1 X90.365 Y117.667 E1.13057
G1 X90.548 Y117.317 E.01155
G1 X118.38 Y145.148 E1.14924
G1 X118.668 Y145.194 E.00852
G1 X119.262 Y145.497 E.01949
G1 X90.732 Y116.967 E1.17811
G1 X90.916 Y116.617 E.01155
G1 X122.913 Y148.613 E1.32125
G1 X122.994 Y148.161 E.01343
G1 X91.094 Y116.261 E1.31725
G1 X91.2 Y115.833 E.01288
G1 X123.174 Y147.807 E1.32034
G1 X123.355 Y147.454 E.01159
G1 X91.305 Y115.404 E1.32343
G1 X91.411 Y114.976 E.01288
G1 X123.535 Y147.1 E1.32652
G1 X123.716 Y146.747 E.01159
G1 X91.516 Y114.547 E1.32961
G1 X91.622 Y114.119 E.01288
G1 X123.967 Y146.464 E1.33562
G1 X124.233 Y146.196 E.01103
G1 X91.687 Y113.65 E1.34396
G1 X91.687 Y113.116 E.01559
G1 X124.5 Y145.929 E1.35497
G1 X124.767 Y145.662 E.01103
G1 X91.687 Y112.582 E1.36599
G1 X91.687 Y112.048 E.01559
G1 X125.063 Y145.424 E1.37822
G1 X125.417 Y145.244 E.0116
G1 X91.687 Y111.514 E1.39284
G1 X91.687 Y111.348 E.00483
G1 X91.566 Y110.859 E.0147
G1 X125.771 Y145.064 E1.41244
G1 X126.125 Y144.884 E.0116
G1 X91.392 Y110.151 E1.43427
G1 X91.217 Y109.442 E.02131
G1 X126.488 Y144.713 E1.45643
G1 X126.949 Y144.64 E.01363
G1 X90.938 Y108.629 E1.48702
G1 X90.348 Y107.505 E.03704
G1 X127.558 Y144.715 E1.53652
G1 X131.073 Y145.56 F28800
G1 F15000
G1 X89.825 Y104.312 E1.70326
G1 X82.087 Y101.914 F28800
G1 F15000
G1 X82.511 Y102.338 E.01752
G1 X83.119 Y102.412 E.01788
G1 X82.257 Y101.55 E.03561
G1 X82.257 Y101.015 E.01559
G1 X83.727 Y102.486 E.06071
G1 X83.849 Y102.501 E.00359
G1 X84.536 Y102.761 E.02147
G1 X82.256 Y100.481 E.09414
G1 X82.256 Y99.947 E.01559
G1 X85.396 Y103.087 E.12966
G1 X86.194 Y103.39 E.02492
G1 X86.319 Y103.476 E.00441
G1 X82.256 Y99.413 E.16775
G1 X82.256 Y98.879 E.01559
M73 P50 R13
G1 X127.871 Y144.494 E1.88358
G1 X128.123 Y144.454 E.00745
G1 X128.41 Y144.499 E.0085
G1 X82.256 Y98.345 E1.90586
G1 X82.256 Y97.811 E.01559
G1 X129.045 Y144.6 E1.93206
G1 X129.679 Y144.7 E.01875
G1 X82.256 Y97.277 E1.95826
G1 X82.256 Y96.757 E.01518
G1 X85.865 Y100.352 E.14874
G1 X85.487 Y99.44 E.02882
G1 X82.804 Y96.757 E.11079
G1 X83.338 Y96.757 E.01559
G1 X85.109 Y98.528 E.07314
G1 X85.066 Y98.423 E.00333
G1 X84.994 Y97.879 E.01601
G1 X83.872 Y96.757 E.04633
G1 X84.406 Y96.757 E.01559
G1 X85.11 Y97.461 E.02908
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X84.406 Y96.757 E-.11354
G1 X83.872 Y96.757 E-.06087
G1 X84.204 Y97.09 E-.05358
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.4 I-.005 J1.217 P1  F28800
G1 X145.876 Y97.352 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X145.281 Y96.757 E.02458
G1 X144.747 Y96.757 E.01559
G1 X145.765 Y97.775 E.04205
G1 X145.83 Y98.228 E.01335
G1 X145.953 Y98.497 E.00864
G1 X144.285 Y96.83 E.06887
G1 X144.223 Y97.301 E.0139
G1 X146.747 Y99.825 E.1042
G1 X149.901 Y102.979 F28800
G1 F15000
G1 X164.069 Y117.148 E.58505
G3 X164.48 Y117.025 I.416 J.641 E.0127
G1 X151.192 Y103.736 E.54873
G1 X151.948 Y103.958 E.02302
G1 X159.941 Y111.951 E.33005
G1 X159.169 Y110.749 E.04171
G1 X159.126 Y110.602 E.00447
G1 X152.703 Y104.179 E.26523
G1 X153.237 Y104.179 E.01559
G1 X158.904 Y109.846 E.234
G1 X158.681 Y109.09 E.02302
G1 X153.771 Y104.179 E.20277
G1 X154.305 Y104.179 E.01559
G1 X158.535 Y108.409 E.17466
G1 X158.535 Y107.875 E.01559
G1 X154.839 Y104.179 E.15261
G2 X155.309 Y104.116 I.125 J-.845 E.01405
G1 X158.535 Y107.341 E.13318
G1 X158.535 Y106.807 E.01559
G1 X155.723 Y103.995 E.11612
G1 X156.135 Y103.873 E.01256
G1 X158.55 Y106.288 E.09972
G1 X158.671 Y105.875 E.01256
G1 X156.547 Y103.752 E.08769
G1 X156.96 Y103.63 E.01256
G1 X158.792 Y105.463 E.07567
G1 X158.914 Y105.05 E.01256
G1 X157.372 Y103.509 E.06365
G1 X157.701 Y103.303 E.01131
G1 X159.035 Y104.637 E.0551
G1 X159.156 Y104.225 E.01256
G1 X158.026 Y103.094 E.04669
G1 X158.351 Y102.885 E.01128
G1 X159.356 Y103.89 E.0415
G1 X159.565 Y103.565 E.01128
G1 X158.676 Y102.676 E.0367
G1 X159.001 Y102.467 E.01128
G1 X159.773 Y103.24 E.0319
G1 X159.982 Y102.915 E.01128
G1 X159.326 Y102.259 E.02709
G1 X159.399 Y102.211 E.00254
G1 X159.592 Y101.99 E.00856
G1 X160.191 Y102.589 E.02476
G1 X160.406 Y102.27 E.01124
G1 X159.84 Y101.704 E.02337
G1 X160.088 Y101.418 E.01105
G1 X160.692 Y102.022 E.02495
G1 X160.978 Y101.774 E.01105
G1 X160.336 Y101.132 E.02652
G1 X160.584 Y100.846 E.01105
G1 X161.264 Y101.527 E.0281
G1 X161.55 Y101.279 E.01105
G1 X160.832 Y100.56 E.02968
G2 X161.043 Y100.237 I-.443 J-.52 E.01142
G1 X161.836 Y101.031 E.03277
G1 X162.085 Y100.815 E.00961
G1 X162.133 Y100.794 E.00153
G1 X161.21 Y99.871 E.03812
G1 X161.377 Y99.504 E.01177
G1 X162.5 Y100.626 E.04634
G1 X162.866 Y100.459 E.01177
G1 X161.545 Y99.137 E.05457
G1 X161.712 Y98.77 E.01177
G1 X163.233 Y100.291 E.0628
G1 X163.599 Y100.124 E.01177
G1 X161.879 Y98.404 E.07102
G2 X161.994 Y97.985 I-.659 J-.407 E.01285
G1 X163.966 Y99.956 E.0814
G3 X164.387 Y99.844 I.402 J.661 E.01291
G1 X162.062 Y97.519 E.09601
G1 X162.13 Y97.052 E.01376
G1 X164.854 Y99.776 E.11249
G1 X165.321 Y99.709 E.01377
G1 X162.369 Y96.757 E.1219
G1 X162.903 Y96.757 E.01559
G1 X165.463 Y99.317 E.10571
G1 X165.463 Y98.783 E.01559
G1 X163.437 Y96.757 E.08366
G1 X163.971 Y96.757 E.01559
G1 X165.463 Y98.249 E.06161
G1 X165.463 Y97.715 E.01559
G1 X164.505 Y96.757 E.03956
G1 X165.039 Y96.757 E.01559
G1 X165.632 Y97.351 E.02451
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X165.039 Y96.757 E-.09571
G1 X164.505 Y96.757 E-.06087
G1 X164.948 Y97.2 E-.07141
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.4 I-1.17 J-.335 P1  F28800
G1 X160.554 Y112.565 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X164.947 Y116.957 E.18139
G1 X165.414 Y116.89 E.01377
G1 X163.108 Y114.584 E.09523
G1 X164.091 Y115.033 E.03157
G1 X165.463 Y116.405 E.05664
G1 X165.463 Y115.871 E.01559
G1 X164.729 Y115.137 E.03029
G1 X165.352 Y115.226 E.01838
G1 X165.632 Y115.507 E.01157
G1 X163.831 Y117.443 F28800
G1 F15000
G1 X144.161 Y97.773 E.81222
G1 X144.11 Y98.165 E.01152
G1 X144.083 Y98.229 E.00204
G1 X163.336 Y117.482 E.79501
G1 X162.969 Y117.649 E.01177
G1 X143.927 Y98.607 E.78632
G1 X143.77 Y98.985 E.01193
G1 X162.602 Y117.817 E.77763
G1 X162.356 Y117.929 E.00792
G1 X162.262 Y118.01 E.00361
G1 X143.614 Y99.362 E.77003
G1 X143.458 Y99.74 E.01193
G1 X161.976 Y118.258 E.76467
G1 X161.69 Y118.506 E.01105
G1 X143.302 Y100.118 E.7593
G3 X143.108 Y100.458 I-.732 J-.19 E.01157
G1 X161.403 Y118.753 E.75546
G1 X161.117 Y119.001 E.01105
G1 X142.877 Y100.761 E.75321
G1 X142.645 Y101.063 E.01112
G1 X160.831 Y119.249 E.75097
G1 X160.762 Y119.308 E.00264
G1 X160.604 Y119.556 E.00859
G1 X142.413 Y101.365 E.75115
G1 X142.181 Y101.667 E.01112
G1 X160.395 Y119.881 E.75211
G1 X160.186 Y120.206 E.01128
G1 X141.949 Y101.969 E.75306
G3 X141.691 Y102.245 I-.644 J-.346 E.01116
G1 X159.977 Y120.531 E.75512
G1 X159.769 Y120.857 E.01128
G1 X141.389 Y102.477 E.75897
G1 X141.087 Y102.709 E.01112
G1 X159.586 Y121.208 E.76392
G1 X159.465 Y121.621 E.01256
G1 X140.785 Y102.941 E.77139
G1 X140.483 Y103.173 E.01112
G1 X159.344 Y122.034 E.77886
G1 X159.223 Y122.447 E.01256
G1 X140.181 Y103.405 E.78634
G1 X139.963 Y103.572 E.00802
G1 X139.857 Y103.615 E.00332
G1 X159.102 Y122.86 E.79468
G2 X159.031 Y123.323 I.753 J.353 E.01385
G1 X139.48 Y103.772 E.80732
G1 X139.102 Y103.928 E.01194
G1 X159.031 Y123.857 E.82292
G1 X159.031 Y124.391 E.01559
G1 X138.724 Y104.084 E.83852
G1 X138.346 Y104.24 E.01194
G1 X159.031 Y124.925 E.85412
G1 X159.031 Y125.212 E.00838
G1 X159.133 Y125.561 E.01062
G1 X137.968 Y104.396 E.87395
G3 X137.535 Y104.497 I-.405 J-.762 E.01314
G1 X159.354 Y126.316 E.90097
G1 X159.575 Y127.071 E.02297
G1 X137.063 Y104.559 E.92958
G1 X136.592 Y104.622 E.01389
G1 X164.791 Y132.821 E1.16443
G1 X165.252 Y132.747 E.01362
G1 X163.344 Y130.84 E.07879
G1 X164.306 Y131.268 E.03078
G1 X165.463 Y132.425 E.04774
G1 X165.463 Y131.891 E.01559
G1 X164.73 Y131.158 E.03024
G1 X164.478 Y133.042 F28800
G1 F15000
G1 X136.12 Y104.684 E1.17099
G1 X135.649 Y104.747 E.01389
G1 X163.952 Y133.05 E1.16874
G1 X163.598 Y133.23 E.01159
G1 X135.076 Y104.708 E1.17778
G1 X134.46 Y104.626 E.01813
G1 X163.244 Y133.41 E1.18858
G1 X162.89 Y133.59 E.01159
G1 X133.845 Y104.545 E1.19938
G1 X133.229 Y104.463 E.01813
G1 X162.536 Y133.77 E1.21018
G1 X162.3 Y133.891 E.00776
G1 X162.211 Y133.979 E.00364
G1 X132.331 Y104.099 E1.23386
G1 X131.42 Y103.722 E.02877
G1 X161.944 Y134.246 E1.26043
G1 X161.677 Y134.513 E.01103
G1 X124.91 Y97.746 E1.51825
G1 X124.972 Y97.274 E.01389
G1 X127.648 Y99.95 E.1105
G1 X127.27 Y99.037 E.02885
G1 X125.034 Y96.802 E.0923
G1 X125.04 Y96.757 E.00133
G1 X125.523 Y96.757 E.0141
G1 X126.904 Y98.138 E.05701
G1 X126.823 Y97.523 E.0181
G1 X126.057 Y96.757 E.03163
G1 X126.591 Y96.757 E.01559
G1 X126.94 Y97.105 E.01438
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X126.591 Y96.757 E-.05614
G1 X126.057 Y96.757 E-.06087
G1 X126.746 Y97.446 E-.11099
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.4 I.051 J-1.216 P1  F28800
G1 X106.13 Y96.588 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15000
G1 X106.495 Y96.952 E.01506
G1 X106.576 Y97.567 E.01812
G1 X105.766 Y96.757 E.03346
G1 X105.232 Y96.757 E.01559
G1 X106.657 Y98.183 E.05886
G1 X106.672 Y98.293 E.00324
G1 X106.98 Y99.04 E.0236
G1 X104.698 Y96.757 E.09426
G1 X104.418 Y96.757 E.00816
G1 X104.388 Y96.982 E.00662
G1 X107.356 Y99.95 E.12256
G1 X107.61 Y100.563 E.01937
G1 X108.187 Y101.315 E.02769
G1 X104.326 Y97.453 E.15945
G1 X104.264 Y97.925 E.01389
G1 X150.49 Y144.151 E1.90884
G1 X150.843 Y143.971 E.01159
G1 X110.295 Y103.423 E1.67436
G1 X111.053 Y104.004 E.02787
G1 X111.663 Y104.256 E.01927
G1 X151.197 Y143.79 E1.6325
G1 X151.245 Y143.766 E.00156
G1 X151.643 Y143.703 E.01179
G1 X112.573 Y104.633 E1.61333
G1 X113.321 Y104.942 E.02362
G1 X113.431 Y104.957 E.00325
G1 X152.104 Y143.63 E1.59694
G1 X152.565 Y143.556 E.01362
G1 X114.046 Y105.038 E1.59057
G1 X114.661 Y105.119 E.01811
G1 X153.026 Y143.483 E1.5842
G1 X153.225 Y143.452 E.00588
G1 X153.585 Y143.509 E.01067
G1 X115.276 Y105.2 E1.58191
G1 X115.755 Y105.263 E.01409
G1 X115.86 Y105.249 E.00309
G1 X154.22 Y143.61 E1.58404
G1 X154.855 Y143.711 E.01877
G1 X116.331 Y105.187 E1.59077
G1 X116.803 Y105.125 E.0139
G1 X156.084 Y144.405 E1.62202
G1 X159.269 Y148.659 F28800
G1 F15000
G1 X159.575 Y148.965 E.01264
G1 X160.109 Y148.965 E.01559
G1 X159.373 Y148.228 E.03042
G1 X159.318 Y147.881 E.01027
G1 X159.067 Y147.389 E.01611
G1 X160.643 Y148.965 E.06507
G1 X161.177 Y148.965 E.01559
G1 X117.275 Y105.063 E1.81288
G1 X117.747 Y105 E.0139
G1 X161.711 Y148.965 E1.81544
G1 X162.245 Y148.965 E.01559
G1 X118.213 Y104.932 E1.81826
G1 X118.59 Y104.776 E.01194
G1 X162.779 Y148.965 E1.82471
G1 X163.313 Y148.965 E.01559
G1 X118.968 Y104.62 E1.83116
G1 X119.346 Y104.463 E.01194
G1 X163.847 Y148.965 E1.83762
G1 X164.381 Y148.965 E.01559
G1 X119.724 Y104.307 E1.84407
G1 X120.101 Y104.151 E.01194
G1 X164.915 Y148.965 E1.85052
G1 X165.449 Y148.965 E.01559
G1 X120.474 Y103.99 E1.85716
G1 X120.777 Y103.758 E.01112
G1 X165.632 Y148.614 E1.85224
G1 X165.182 Y146.028 F28800
G1 F15000
G1 X165.463 Y146.308 E.01158
G1 X165.463 Y146.842 E.01559
M73 P51 R13
G1 X164.752 Y146.131 E.02936
G1 X164.226 Y146.048 E.01553
G1 X164.039 Y145.952 E.00615
G1 X165.463 Y147.376 E.05879
G1 X165.463 Y147.91 E.01559
G1 X162.951 Y145.399 E.1037
G1 X162.3 Y145.067 E.02134
G1 X160.771 Y143.541 E.0631
G1 X160.437 Y142.884 E.0215
G1 X121.079 Y103.527 E1.62522
G1 X121.381 Y103.295 E.01112
G1 X159.883 Y141.797 E1.58989
G1 X159.79 Y141.613 E.00602
G1 X159.706 Y141.086 E.01559
G1 X121.683 Y103.063 E1.57009
G1 X121.985 Y102.831 E.01112
G1 X159.606 Y140.451 E1.55346
G1 X159.505 Y139.817 E.01876
G1 X122.288 Y102.599 E1.53683
G2 X122.547 Y102.324 I-.385 J-.621 E.01116
G1 X159.486 Y139.263 E1.52534
G1 X159.559 Y138.802 E.01363
G1 X122.779 Y102.022 E1.51877
G1 X123.011 Y101.72 E.01112
G1 X159.632 Y138.341 E1.51221
G1 X159.705 Y137.881 E.01363
G1 X123.243 Y101.418 E1.50565
G1 X123.475 Y101.116 E.01112
G1 X159.778 Y137.42 E1.49909
G1 X159.79 Y137.345 E.00222
G1 X159.941 Y137.048 E.0097
G1 X123.707 Y100.814 E1.49623
G1 X123.9 Y100.563 E.00925
G1 X123.926 Y100.5 E.002
G1 X160.121 Y136.695 E1.49462
G1 X160.301 Y136.341 E.01159
G1 X124.082 Y100.122 E1.49562
G1 X124.238 Y99.744 E.01194
G1 X160.482 Y135.987 E1.49661
G1 X160.662 Y135.634 E.01159
G1 X124.394 Y99.366 E1.49761
G1 X124.55 Y98.988 E.01194
G1 X160.876 Y135.314 E1.50002
G1 X161.143 Y135.047 E.01103
G1 X124.707 Y98.61 E1.5046
G1 X124.838 Y98.293 E.01003
G1 X124.848 Y98.218 E.00222
G1 X161.53 Y134.9 E1.51475
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X160.116 Y133.486 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z1.4 I-1.172 J.326 P1  F28800
G1 X189.5 Y239 Z1.4
G1 Z1.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.2
; FEATURE: Prime tower
; LINE_WIDTH: 0.5
G1  X155.500 Y239.000  E1.2922 F5400
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X155.500 
G1  Y219.500 
G1  X156.500 
;--------------------
; CP EMPTY GRID START
; layer #7
G1  Y239.000  E0.7411
G1  X164.500 
G1  Y219.500  E0.7411
G1  X172.500 
G1  Y239.000  E0.7411
G1  X180.500 
G1  Y219.500  E0.7411
G1  X188.500 
G1  Y239.000  E0.7411
; CP EMPTY GRID END
;------------------






G1  X190.000 
G1  Y239.500 
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
G1  X190.457 
G1  Y239.957 
G1  X154.543  E1.3650
G1  Y218.543  E0.8139
G1  X190.457  E1.3650
G1  Y239.957  E0.8139

G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X188.457 Y239.957 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.6 I1.135 J-.44 P1  F28800
G1 X151.291 Y144.073 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X149.634 Y144.918 E.05855
G1 X148.282 Y146.268 E.06017
G1 X147.413 Y147.973 E.06022
G1 X147.21 Y149.259 E.04099
G1 X145.707 Y149.259 E.04731
G1 X145.529 Y148.127 E.03608
G1 X144.732 Y146.563 E.05525
G1 X143.491 Y145.322 E.05524
G1 X141.927 Y144.525 E.05526
G1 X140.193 Y144.252 E.05527
G1 X138.46 Y144.525 E.0552
G1 X136.896 Y145.322 E.05525
G1 X135.656 Y146.563 E.05524
G1 X134.859 Y148.127 E.05525
G1 X134.68 Y149.259 E.03608
G1 X133.137 Y149.259 E.04858
M73 P51 R12
G1 X132.982 Y148.281 E.03118
G1 X132.256 Y146.857 E.05033
G1 X131.125 Y145.726 E.05034
G1 X129.701 Y145.001 E.0503
G1 X128.123 Y144.751 E.0503
G1 X126.545 Y145.001 E.05029
G1 X125.119 Y145.726 E.05035
G2 X123.989 Y146.857 I338.552 J339.012 E.05032
G1 X123.263 Y148.281 E.05031
G1 X123.108 Y149.259 E.03118
G1 X121.665 Y149.259 E.04544
G1 X121.534 Y148.437 E.02621
G1 X120.88 Y147.151 E.04542
G1 X119.861 Y146.132 E.04537
G1 X118.575 Y145.478 E.04541
G1 X117.151 Y145.249 E.04542
G1 X115.726 Y145.478 E.04542
G2 X114.443 Y146.132 I363.275 J714.098 E.04535
G1 X113.422 Y147.151 E.0454
G1 X112.767 Y148.437 E.04545
G1 X112.638 Y149.259 E.02619
G1 X111.008 Y149.259 E.05132
G1 X110.903 Y148.591 E.02129
G1 X110.321 Y147.45 E.04031
G1 X109.118 Y146.198 E.05466
G1 X109.04 Y146.294 E.00392
G1 X108.244 Y145.948 E.02732
G1 X106.993 Y145.752 E.03988
G1 X105.725 Y145.951 E.0404
G1 X104.578 Y146.534 E.04049
M73 P52 R12
G1 X103.67 Y147.445 E.04051
G1 X103.085 Y148.59 E.04048
G1 X102.979 Y149.259 E.02131
G1 X101.531 Y149.259 E.04556
G1 X101.451 Y148.745 E.01638
G1 X100.938 Y147.739 E.03555
G1 X100.14 Y146.941 E.03554
G2 X99.133 Y146.427 I-73.809 J143.535 E.03556
G1 X98.017 Y146.249 E.03559
G1 X96.902 Y146.428 E.03553
G1 X95.896 Y146.94 E.03553
G1 X95.098 Y147.739 E.03556
G1 X94.585 Y148.744 E.03553
G1 X94.503 Y149.259 E.0164
G1 X93.195 Y149.259 E.04117
G1 X93.138 Y148.898 E.01149
G1 X92.696 Y148.032 E.03062
G1 X92.007 Y147.344 E.03066
G1 X91.141 Y146.903 E.03059
G1 X90.181 Y146.752 E.03059
G1 X89.219 Y146.903 E.03066
G1 X88.353 Y147.344 E.03059
G1 X87.663 Y148.033 E.03068
G1 X87.223 Y148.899 E.03059
G1 X87.166 Y149.259 E.01147
G1 X81.963 Y149.259 E.1638
G1 X81.963 Y145.571 E.11611
G1 X83.898 Y145.336 E.06136
G1 X86.289 Y144.428 E.08051
G1 X88.393 Y142.975 E.08049
G1 X90.09 Y141.062 E.08051
G1 X91.278 Y138.798 E.08048
G1 X91.889 Y136.316 E.08046
G1 X91.889 Y133.758 E.08053
G1 X91.278 Y131.276 E.08046
G1 X90.09 Y129.012 E.08048
G1 X88.393 Y127.099 E.08051
G1 X86.289 Y125.646 E.08049
G1 X83.898 Y124.738 E.0805
G1 X81.963 Y124.504 E.06136
G1 X81.963 Y122.636 E.05878
G1 X83.778 Y122.416 E.05756
G1 X86.057 Y121.55 E.07673
G1 X88.061 Y120.167 E.07665
G1 X89.678 Y118.344 E.07672
G1 X90.81 Y116.186 E.0767
G1 X91.393 Y113.82 E.07671
G1 X91.393 Y111.384 E.07669
G1 X90.81 Y109.018 E.07671
G1 X89.678 Y106.86 E.0767
G1 X88.061 Y105.037 E.07671
G1 X86.057 Y103.652 E.07669
G1 X83.778 Y102.788 E.07672
G1 X81.963 Y102.568 E.05756
G1 X81.961 Y96.463 E.19217
G1 X85.105 Y96.463 E.09894
G1 X85.26 Y97.649 E.03765
G1 X85.352 Y98.346 E.02214
G1 X86.313 Y100.665 E.07901
G1 X87.839 Y102.653 E.0789
G1 X89.829 Y104.179 E.07893
G2 X92.146 Y105.14 I327.462 J-786.296 E.07896
G1 X94.633 Y105.466 E.07896
G1 X97.118 Y105.14 E.0789
G2 X99.436 Y104.179 I-504.897 J-1221.791 E.07901
G1 X101.426 Y102.653 E.07894
G1 X102.953 Y100.665 E.0789
G1 X103.911 Y98.346 E.07897
G1 X104.16 Y96.463 E.05979
G1 X106.727 Y96.463 E.08079
G1 X106.958 Y98.216 E.05566
G1 X107.867 Y100.415 E.07489
G1 X109.315 Y102.301 E.07486
G1 X111.201 Y103.747 E.07481
G2 X113.398 Y104.656 I637.956 J-1539.107 E.07483
G1 X115.755 Y104.966 E.07484
G1 X118.112 Y104.656 E.07484
G1 X120.308 Y103.747 E.07482
G1 X122.194 Y102.301 E.07482
G1 X123.643 Y100.415 E.07486
G1 X124.551 Y98.216 E.07489
G1 X124.783 Y96.463 E.05566
G1 X126.981 Y96.463 E.06919
G1 X127.194 Y98.088 E.0516
G1 X128.055 Y100.163 E.0707
G1 X129.423 Y101.946 E.07076
G1 X131.205 Y103.315 E.07073
G1 X133.282 Y104.174 E.07073
G1 X135.509 Y104.468 E.07072
G1 X137.738 Y104.174 E.07078
G1 X139.814 Y103.315 E.07073
G1 X141.596 Y101.946 E.07073
G1 X142.965 Y100.163 E.07077
G1 X143.823 Y98.088 E.07068
G1 X144.037 Y96.463 E.05159
G1 X145.875 Y96.463 E.05785
G1 X146.115 Y98.144 E.05346
G1 X147.075 Y100.244 E.07268
G2 X148.587 Y101.987 I535.29 J-462.724 E.07263
G1 X150.528 Y103.234 E.07263
G1 X152.742 Y103.885 E.07265
G1 X155.048 Y103.885 E.07259
G2 X157.264 Y103.234 I-62.972 J-218.427 E.07269
G1 X159.205 Y101.987 E.07264
G1 X160.716 Y100.244 E.07262
G1 X161.674 Y98.145 E.07264
G1 X161.918 Y96.463 E.05348
G1 X165.757 Y96.463 E.12084
G1 X165.757 Y99.943 E.10956
G1 X164.215 Y100.165 E.04902
G1 X162.246 Y101.065 E.06816
G1 X160.609 Y102.483 E.06816
G1 X159.439 Y104.304 E.06815
G1 X158.829 Y106.382 E.06818
G1 X158.829 Y108.548 E.06816
G1 X159.439 Y110.626 E.06818
G1 X160.609 Y112.447 E.06814
G1 X162.246 Y113.867 E.0682
G1 X164.215 Y114.767 E.06817
G1 X165.757 Y114.987 E.04901
G1 X165.757 Y117.138 E.06769
G1 X164.357 Y117.339 E.0445
G1 X162.516 Y118.179 E.0637
G1 X160.987 Y119.503 E.06366
G1 X159.893 Y121.207 E.06374
G1 X159.325 Y123.147 E.06364
G1 X159.325 Y125.169 E.06367
G1 X159.893 Y127.112 E.0637
G1 X160.987 Y128.813 E.06368
G1 X162.516 Y130.139 E.0637
G1 X164.357 Y130.979 E.06371
G1 X165.757 Y131.181 E.0445
G1 X165.757 Y132.965 E.05618
G1 X164.318 Y133.193 E.04584
G1 X162.475 Y134.132 E.06513
G1 X161.012 Y135.595 E.06513
G1 X160.073 Y137.437 E.06508
G1 X159.749 Y139.479 E.0651
G1 X160.073 Y141.521 E.06509
G1 X161.012 Y143.365 E.06514
G1 X162.475 Y144.826 E.06509
G1 X164.318 Y145.765 E.06512
G1 X165.757 Y145.993 E.04584
G1 X165.757 Y149.259 E.10281
G1 X159.239 Y149.259 E.20518
G1 X159.034 Y147.973 E.04099
G1 X158.168 Y146.269 E.06018
G1 X156.815 Y144.918 E.06018
G2 X155.113 Y144.049 I-160.463 J312.313 E.06016
G1 X153.225 Y143.749 E.06018
G1 X151.345 Y144.048 E.0599
G1 X151.613 Y144.402 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.459 Y144.427 E.00455
G2 X149.868 Y145.239 I124.159 J245.229 E.0521
G1 X148.603 Y146.502 E.05212
G1 X147.79 Y148.095 E.05215
G1 X147.545 Y149.651 E.04592
G1 X145.372 Y149.651 E.06337
G1 X145.151 Y148.249 E.04138
G1 X144.411 Y146.796 E.04756
G1 X143.258 Y145.643 E.04755
G1 X141.804 Y144.903 E.04756
G1 X140.193 Y144.648 E.04758
G1 X138.583 Y144.903 E.04752
G1 X137.13 Y145.643 E.04756
G1 X135.977 Y146.796 E.04755
G1 X135.236 Y148.249 E.04756
G1 X135.015 Y149.651 E.04138
G1 X132.802 Y149.651 E.06453
G1 X132.605 Y148.403 E.03684
G1 X131.935 Y147.09 E.04299
G1 X130.892 Y146.047 E.04301
G1 X129.578 Y145.379 E.04297
G1 X128.123 Y145.148 E.04297
G1 X126.667 Y145.379 E.04297
G1 X125.352 Y146.047 E.04302
G2 X124.311 Y147.09 I312.148 J312.563 E.04298
G1 X123.641 Y148.403 E.04299
G1 X123.443 Y149.651 E.03684
G1 X121.33 Y149.651 E.06162
G1 X121.157 Y148.559 E.03223
G1 X120.559 Y147.384 E.03845
G1 X119.628 Y146.453 E.0384
G1 X118.453 Y145.855 E.03845
G1 X117.151 Y145.646 E.03844
G1 X115.849 Y145.855 E.03844
G2 X114.676 Y146.453 I331.757 J652.119 E.0384
G1 X113.743 Y147.384 E.03843
G1 X113.144 Y148.56 E.03846
G1 X112.973 Y149.651 E.03222
G1 X110.672 Y149.651 E.06709
G1 X110.525 Y148.713 E.02768
G1 X109.998 Y147.68 E.03383
G1 X109.143 Y146.79 E.03598
G1 X109.092 Y146.854 E.00239
G1 X108.801 Y146.618 E.01092
G1 X108.134 Y146.328 E.02121
G1 X106.993 Y146.148 E.03368
G1 X105.847 Y146.329 E.03381
G1 X104.812 Y146.855 E.03387
G1 X103.991 Y147.678 E.0339
G1 X103.463 Y148.713 E.03388
G1 X103.313 Y149.651 E.02769
G1 X101.196 Y149.651 E.06174
G1 X101.073 Y148.867 E.02313
G1 X100.617 Y147.972 E.0293
G1 X99.906 Y147.261 E.02931
G2 X99.01 Y146.805 I-65.641 J127.684 E.02931
G1 X98.017 Y146.646 E.02934
G1 X97.025 Y146.805 E.02929
G1 X96.13 Y147.261 E.0293
G1 X95.419 Y147.972 E.02932
G1 X94.963 Y148.867 E.0293
G1 X94.838 Y149.651 E.02314
G1 X92.86 Y149.651 E.05766
G1 X92.761 Y149.021 E.01859
G1 X92.375 Y148.266 E.02474
G1 X91.774 Y147.665 E.02478
G1 X91.018 Y147.281 E.02471
G1 X90.181 Y147.148 E.02473
G1 X89.341 Y147.281 E.02478
G1 X88.586 Y147.665 E.02471
G1 X87.985 Y148.266 E.02479
G1 X87.6 Y149.022 E.02471
G1 X87.501 Y149.651 E.01858
G1 X81.571 Y149.651 E.17293
G1 X81.571 Y145.223 E.12912
G1 X83.803 Y144.952 E.06558
G1 X86.105 Y144.078 E.07179
G1 X88.131 Y142.679 E.07179
G1 X89.765 Y140.837 E.0718
G1 X90.909 Y138.658 E.07177
G1 X91.497 Y136.269 E.07176
G1 X91.497 Y133.806 E.07182
G1 X90.909 Y131.416 E.07176
G1 X89.765 Y129.237 E.07177
G1 X88.131 Y127.395 E.0718
G1 X86.105 Y125.996 E.07179
G1 X83.803 Y125.122 E.07179
G1 X81.571 Y124.851 E.06558
G1 X81.571 Y122.289 E.0747
G1 X83.683 Y122.032 E.06206
G1 X85.873 Y121.2 E.0683
G1 X87.799 Y119.871 E.06823
G1 X89.353 Y118.119 E.06829
G1 X90.441 Y116.046 E.06827
G1 X91.001 Y113.773 E.06828
G1 X91.001 Y111.432 E.06826
G1 X90.441 Y109.158 E.06828
G1 X89.353 Y107.085 E.06827
G1 X87.799 Y105.333 E.06829
G1 X85.873 Y104.002 E.06826
G1 X83.683 Y103.172 E.06829
G1 X81.571 Y102.915 E.06206
G1 X81.569 Y96.071 E.19957
G1 X85.449 Y96.071 E.11312
G1 X85.649 Y97.598 E.04491
G1 X85.734 Y98.244 E.019
G1 X86.655 Y100.467 E.07017
G1 X88.119 Y102.373 E.07007
G1 X90.027 Y103.836 E.07011
G2 X92.248 Y104.758 I313.843 J-753.579 E.07012
G1 X94.633 Y105.071 E.07014
G1 X97.015 Y104.758 E.07008
G2 X99.239 Y103.836 I-483.776 J-1170.668 E.07017
G1 X101.146 Y102.373 E.07012
G1 X102.61 Y100.467 E.07007
G1 X103.529 Y98.244 E.07015
G1 X103.817 Y96.071 E.06391
G1 X107.071 Y96.071 E.09488
G1 X107.34 Y98.114 E.06008
G1 X108.209 Y100.217 E.06636
G1 X109.595 Y102.021 E.06633
G1 X111.399 Y103.405 E.06629
G2 X113.5 Y104.274 I608.931 J-1469.087 E.0663
G1 X115.755 Y104.571 E.06632
G1 X118.01 Y104.274 E.06632
G1 X120.111 Y103.405 E.0663
G1 X121.914 Y102.021 E.06629
G1 X123.3 Y100.217 E.06633
G1 X124.169 Y98.114 E.06636
G1 X124.439 Y96.071 E.06008
G1 X127.325 Y96.071 E.08414
G1 X127.576 Y97.986 E.05632
G1 X128.397 Y99.965 E.06248
G1 X129.703 Y101.667 E.06254
G1 X131.403 Y102.973 E.0625
G1 X133.384 Y103.792 E.06251
G1 X135.509 Y104.073 E.0625
G1 X137.636 Y103.792 E.06256
G1 X139.617 Y102.973 E.06251
G1 X141.317 Y101.667 E.0625
G1 X142.622 Y99.965 E.06255
G1 X143.441 Y97.986 E.06246
G1 X143.693 Y96.071 E.05631
G1 X146.215 Y96.071 E.07353
G1 X146.495 Y98.033 E.05779
G1 X147.408 Y100.03 E.06403
G2 X148.846 Y101.687 I509.048 J-440.028 E.06398
G1 X150.693 Y102.874 E.064
G1 X152.798 Y103.493 E.06401
G1 X154.992 Y103.493 E.06398
G2 X157.099 Y102.874 I-59.915 J-207.759 E.06402
G1 X158.946 Y101.687 E.06401
G1 X160.383 Y100.03 E.06398
G1 X161.294 Y98.033 E.064
G1 X161.578 Y96.071 E.0578
G1 X166.149 Y96.071 E.13327
G1 X166.149 Y100.283 E.12282
G1 X164.327 Y100.546 E.05367
G1 X162.46 Y101.399 E.05985
G1 X160.908 Y102.742 E.05985
G1 X159.8 Y104.469 E.05984
G1 X159.221 Y106.439 E.05987
G1 X159.221 Y108.491 E.05985
G1 X159.8 Y110.461 E.05987
G1 X160.908 Y112.188 E.05983
G1 X162.46 Y113.534 E.05989
G1 X164.327 Y114.387 E.05986
G1 X166.149 Y114.647 E.05366
G1 X166.149 Y117.477 E.08252
G1 X164.469 Y117.72 E.04949
G1 X162.73 Y118.513 E.05573
G1 X161.286 Y119.762 E.05568
G1 X160.254 Y121.371 E.05575
G1 X159.717 Y123.203 E.05566
G1 X159.717 Y125.113 E.0557
G1 X160.254 Y126.947 E.05572
G1 X161.286 Y128.554 E.0557
G1 X162.73 Y129.806 E.05571
G1 X164.469 Y130.599 E.05573
G1 X166.149 Y130.841 E.04949
G1 X166.149 Y133.3 E.0717
G1 X164.441 Y133.571 E.05042
G1 X162.708 Y134.453 E.05671
G1 X161.333 Y135.828 E.0567
G1 X160.451 Y137.559 E.05666
G1 X160.146 Y139.479 E.05668
G1 X160.451 Y141.399 E.05668
G1 X161.333 Y143.132 E.05671
G1 X162.708 Y144.505 E.05667
G1 X164.441 Y145.387 E.05671
G1 X166.149 Y145.658 E.05042
G1 X166.149 Y149.651 E.11643
G1 X158.904 Y149.651 E.21125
G1 X158.657 Y148.095 E.04593
G1 X157.847 Y146.502 E.05212
G1 X156.582 Y145.239 E.05212
G2 X154.99 Y144.427 I-149.99 J291.896 E.0521
G1 X153.225 Y144.146 E.05213
G1 X151.673 Y144.393 E.04582
G1 X151.522 Y144.276 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X151.459 Y144.427 E-.02465
G1 X149.87 Y145.238 E-.20335
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.6 I-.785 J-.93 P1  F28800
G1 X147.758 Y147.021 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420512
G1 F15000
G1 X145.939 Y148.841 E.07513
G1 X145.959 Y148.965 E.00367
G1 X146.349 Y148.965 E.01139
G1 X147.073 Y148.241 E.02991
G1 X146.973 Y148.875 E.01874
G1 X146.713 Y149.135 E.01073
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X146.973 Y148.875 E-.04191
G1 X147.073 Y148.241 E-.07316
G1 X146.373 Y148.941 E-.11293
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.6 I.532 J-1.094 P1  F28800
G1 X137.75 Y144.747 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X159.031 Y123.467 E.87874
G1 X159.031 Y124.001 E.01559
G1 X138.869 Y144.163 E.83256
G1 X139.503 Y144.063 E.01875
G1 X159.031 Y124.535 E.80637
G1 X159.031 Y125.069 E.01559
G1 X140.137 Y143.963 E.78018
G1 X140.193 Y143.954 E.00164
G1 X140.614 Y144.02 E.01244
G1 X159.119 Y125.514 E.76417
G1 X159.24 Y125.928 E.01257
G1 X141.075 Y144.093 E.75012
G1 X141.536 Y144.166 E.01363
G1 X159.361 Y126.341 E.73607
G1 X159.482 Y126.754 E.01257
G1 X141.997 Y144.239 E.72202
G1 X142.356 Y144.414 E.01166
G1 X159.603 Y127.167 E.7122
G1 X159.623 Y127.235 E.00207
G1 X159.797 Y127.506 E.00942
G1 X142.71 Y144.594 E.70561
G1 X143.064 Y144.774 E.01159
G1 X160.006 Y127.831 E.69963
G1 X160.215 Y128.156 E.01128
G1 X143.417 Y144.954 E.69365
G1 X143.666 Y145.081 E.00815
G1 X143.745 Y145.16 E.00328
G1 X160.424 Y128.482 E.68873
G1 X160.633 Y128.807 E.01128
G1 X144.012 Y145.427 E.68633
G1 X144.279 Y145.694 E.01103
G1 X160.871 Y129.102 E.68515
G1 X161.157 Y129.35 E.01105
G1 X144.546 Y145.961 E.68593
G1 X144.813 Y146.228 E.01103
G1 X161.443 Y129.598 E.68672
G1 X161.729 Y129.846 E.01105
G1 X145.045 Y146.53 E.68895
G1 X145.226 Y146.884 E.01159
G1 X162.015 Y130.094 E.69332
G1 X162.302 Y130.342 E.01105
G1 X145.406 Y147.238 E.69769
G1 X145.586 Y147.592 E.01159
G1 X162.653 Y130.525 E.70477
G1 X163.02 Y130.692 E.01177
G1 X145.766 Y147.946 E.71247
G1 X145.812 Y148.035 E.00293
G1 X145.866 Y148.38 E.01019
G1 X163.387 Y130.859 E.72349
G1 X163.753 Y131.026 E.01177
G1 X150.773 Y144.007 E.53602
G1 X151.245 Y143.766 E.01548
G1 X151.605 Y143.709 E.01064
G1 X164.12 Y131.194 E.51681
G1 X164.274 Y131.264 E.00493
G1 X164.545 Y131.303 E.008
G1 X152.239 Y143.608 E.50814
G1 X152.874 Y143.507 E.01877
G1 X165.012 Y131.37 E.50119
G1 X165.463 Y131.435 E.01331
G1 X165.463 Y131.453 E.00052
G1 X163.776 Y133.139 E.06963
G1 X164.226 Y132.91 E.01474
G1 X164.599 Y132.851 E.011
G1 X165.463 Y131.987 E.03568
G1 X165.463 Y132.521 E.01559
G1 X165.029 Y132.955 E.0179
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X165.463 Y132.521 E-.06989
G1 X165.463 Y131.987 E-.06088
G1 X164.859 Y132.59 E-.09723
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.6 I-.804 J-.914 P1  F28800
G1 X160.406 Y136.51 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X153.431 Y143.484 E.288
G1 X153.892 Y143.558 E.01362
G1 X159.73 Y137.719 E.24109
G1 X159.63 Y138.354 E.01876
G1 X154.353 Y143.631 E.21791
G1 X154.814 Y143.704 E.01362
G1 X159.529 Y138.988 E.19472
G1 X159.451 Y139.479 E.0145
G1 X159.468 Y139.584 E.00309
G1 X155.258 Y143.793 E.17384
G1 X155.612 Y143.974 E.01159
G1 X159.541 Y140.045 E.16225
G1 X159.614 Y140.505 E.01363
G1 X155.965 Y144.154 E.15067
G1 X156.319 Y144.335 E.01159
G1 X159.687 Y140.966 E.13909
G1 X159.76 Y141.427 E.01363
G1 X156.672 Y144.515 E.12751
G1 X157.017 Y144.704 E.01148
G1 X159.897 Y141.824 E.11893
G1 X160.077 Y142.178 E.01159
G1 X157.284 Y144.971 E.11533
G1 X157.552 Y145.238 E.01103
G1 X160.257 Y142.532 E.11173
G1 X160.438 Y142.886 E.01159
G1 X157.819 Y145.505 E.10814
G1 X158.086 Y145.771 E.01103
G1 X160.618 Y143.24 E.10454
G1 X160.771 Y143.541 E.00985
G1 X160.811 Y143.581 E.00166
G1 X158.353 Y146.038 E.10148
G1 X158.409 Y146.094 E.00229
G1 X158.551 Y146.374 E.00919
G1 X161.078 Y143.847 E.10434
G1 X161.345 Y144.114 E.01103
G1 X158.731 Y146.728 E.10794
G1 X158.911 Y147.082 E.0116
G1 X161.613 Y144.381 E.11154
G1 X161.88 Y144.648 E.01103
G1 X159.091 Y147.436 E.11514
G1 X159.271 Y147.79 E.0116
G1 X162.147 Y144.915 E.11874
G2 X162.451 Y145.144 I.506 J-.354 E.01132
G1 X159.372 Y148.224 E.12715
G1 X159.445 Y148.684 E.01362
G1 X162.805 Y145.325 E.13874
G1 X163.159 Y145.505 E.01159
G1 X159.699 Y148.965 E.14289
G1 X160.233 Y148.965 E.01559
G1 X163.513 Y145.685 E.13545
G1 X163.867 Y145.865 E.01159
G1 X160.767 Y148.965 E.12801
G1 X161.301 Y148.965 E.01559
G1 X164.221 Y146.045 E.12058
G1 X164.68 Y146.12 E.01358
G1 X161.835 Y148.965 E.11748
G1 X162.369 Y148.965 E.01559
G1 X165.141 Y146.193 E.11446
G1 X165.463 Y146.244 E.00952
G1 X165.463 Y146.405 E.0047
G1 X162.903 Y148.965 E.10571
G1 X163.437 Y148.965 E.01559
G1 X165.463 Y146.939 E.08366
G1 X165.463 Y147.473 E.01559
G1 X163.971 Y148.965 E.06161
G1 X164.505 Y148.965 E.01559
G1 X165.463 Y148.007 E.03956
G1 X165.463 Y148.541 E.01559
G1 X164.869 Y149.135 E.02451
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X165.463 Y148.541 E-.09571
G1 X165.463 Y148.007 E-.06088
G1 X165.02 Y148.45 E-.07141
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.6 I1.217 J.023 P1  F28800
G1 X165.632 Y116.332 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X165.017 Y116.947 E.02543
G1 X164.392 Y117.037 E.01841
G1 X165.463 Y115.967 E.04419
G1 X165.463 Y115.433 E.01559
G1 X163.479 Y117.417 E.08191
G1 X162.497 Y117.865 E.03151
G1 X165.163 Y115.199 E.11006
G1 X164.695 Y115.132 E.01378
G1 X132.716 Y147.112 E1.32055
G1 X132.897 Y147.465 E.01159
G1 X160.241 Y120.121 E1.12914
G1 X159.623 Y121.083 E.03338
G1 X159.544 Y121.351 E.00815
G1 X133.077 Y147.819 E1.09294
G1 X133.257 Y148.172 E.01159
G1 X159.323 Y122.107 E1.07635
G1 X159.102 Y122.862 E.02299
G1 X133.335 Y148.629 E1.06399
G1 X133.388 Y148.965 E.00994
G1 X133.533 Y148.965 E.00422
G1 X134.693 Y147.805 E.0479
G1 X134.576 Y148.035 E.00754
G1 X134.497 Y148.535 E.01478
G1 X133.897 Y149.135 E.02476
G1 X132.409 Y146.884 F28800
G1 F15000
G1 X164.228 Y115.066 E1.31391
G1 X164.132 Y115.052 E.00284
G1 X163.841 Y114.919 E.00934
G1 X132.287 Y146.472 E1.30296
G1 X132.02 Y146.205 E.01103
G1 X163.474 Y114.751 E1.29885
G1 X163.108 Y114.584 E.01177
G1 X131.753 Y145.938 E1.29474
G1 X131.486 Y145.671 E.01103
G1 X162.741 Y114.416 E1.29064
G1 X162.375 Y114.249 E.01177
G1 X131.193 Y145.431 E1.28761
G1 X130.839 Y145.251 E.0116
G1 X162.025 Y114.065 E1.28778
G1 X161.739 Y113.817 E.01105
G1 X130.485 Y145.07 E1.29059
G1 X130.131 Y144.89 E.0116
G1 X161.453 Y113.569 E1.29339
G1 X161.167 Y113.321 E.01105
G1 X129.773 Y144.715 E1.29639
G1 X129.312 Y144.642 E.01363
G1 X160.881 Y113.073 E1.30362
G1 X160.595 Y112.825 E.01105
G1 X128.851 Y144.569 E1.31085
G1 X128.39 Y144.496 E.01363
G1 X160.329 Y112.556 E1.31891
G1 X160.121 Y112.231 E.01128
G1 X127.856 Y144.496 E1.33234
G1 X127.221 Y144.596 E.01875
G1 X159.912 Y111.906 E1.34991
G1 X159.703 Y111.581 E.01128
G1 X126.587 Y144.697 E1.36749
G1 X126.453 Y144.718 E.00396
G1 X125.597 Y145.153 E.02803
G1 X159.494 Y111.256 E1.39975
M73 P53 R12
G1 X159.286 Y110.93 E.01128
G1 X121.825 Y148.391 E1.54689
G1 X121.818 Y148.345 E.00136
G1 X121.656 Y148.026 E.01043
G1 X159.115 Y110.566 E1.54686
G1 X158.994 Y110.154 E.01256
G1 X121.475 Y147.672 E1.54929
G1 X121.295 Y147.319 E.01159
G1 X158.873 Y109.741 E1.55172
G1 X158.752 Y109.328 E.01256
G1 X121.112 Y146.967 E1.55426
G1 X120.845 Y146.7 E.01103
G1 X158.63 Y108.916 E1.56028
G1 X158.535 Y108.59 E.00991
G1 X158.535 Y108.477 E.00329
G1 X120.578 Y146.433 E1.56735
G1 X120.311 Y146.166 E.01103
G1 X158.535 Y107.943 E1.57838
G1 X158.535 Y107.409 E.01559
G1 X120.044 Y145.899 E1.5894
G1 X119.693 Y145.717 E.01156
G1 X158.535 Y106.875 E1.6039
G1 X158.535 Y106.341 E.01559
G1 X119.339 Y145.536 E1.61851
G1 X118.986 Y145.356 E.01159
G1 X158.756 Y105.586 E1.64229
G1 X158.979 Y104.829 E.02302
G1 X118.621 Y145.187 E1.66652
G1 X118.161 Y145.113 E.01361
G1 X159.869 Y103.405 E1.72231
G1 X162.429 Y100.845 F28800
G1 F15000
G1 X165.463 Y97.811 E.12527
G1 X165.463 Y98.345 E.01559
G1 X163.756 Y100.052 E.07048
G1 X164.131 Y99.88 E.01206
G1 X164.517 Y99.825 E.01137
G1 X165.463 Y98.879 E.03905
G1 X165.463 Y99.413 E.01559
G1 X164.941 Y99.935 E.02156
G1 X161.96 Y97.042 F28800
G1 F15000
G1 X162.245 Y96.757 E.01178
G1 X162.779 Y96.757 E.01559
G1 X162.07 Y97.466 E.02928
G1 X161.979 Y98.091 E.01842
G1 X163.313 Y96.757 E.05507
G1 X163.847 Y96.757 E.01559
G1 X161.61 Y98.994 E.09237
G1 X161.162 Y99.976 E.03152
G1 X164.381 Y96.757 E.13292
G1 X164.915 Y96.757 E.01559
G1 X116.638 Y145.034 E1.99351
G1 X117.151 Y144.951 E.01515
G1 X117.24 Y144.966 E.00264
G1 X165.463 Y96.757 E1.991
G1 X165.463 Y97.277 E.01519
G1 X117.552 Y145.188 E1.9784
G1 X115.798 Y145.34 F28800
G1 F15000
G1 X158.077 Y103.061 E1.74585
G1 X157.387 Y103.504 E.02392
G1 X156.979 Y103.625 E.01242
G1 X114.788 Y145.816 E1.74226
G1 X112.003 Y149.135 F28800
G1 F15000
G1 X112.426 Y148.712 E.01745
G1 X112.483 Y148.345 E.01083
G1 X112.717 Y147.887 E.01501
G1 X111.639 Y148.965 E.0445
G1 X111.259 Y148.965 E.01109
G1 X111.238 Y148.832 E.00393
G1 X156.222 Y103.848 E1.85756
G3 X155.465 Y104.07 I-22.313 J-74.448 E.02303
G1 X111.136 Y148.4 E1.83055
G1 X110.955 Y148.047 E.01159
G1 X154.823 Y104.179 E1.81146
G1 X154.289 Y104.179 E.01559
G1 X110.775 Y147.693 E1.79686
G1 X110.594 Y147.34 E.01159
G1 X153.755 Y104.179 E1.78226
G1 X153.221 Y104.179 E.01559
G1 X110.347 Y147.053 E1.77042
G1 X110.085 Y146.781 E.01103
G1 X152.69 Y104.176 E1.75929
G1 X152.277 Y104.055 E.01256
G1 X109.824 Y146.508 E1.75305
G1 X109.562 Y146.236 E.01103
G1 X151.864 Y103.934 E1.74681
G1 X151.452 Y103.812 E.01256
G1 X109.301 Y145.963 E1.74057
G1 X109.1 Y145.753 E.00849
G1 X108.952 Y145.936 E.00684
G1 X108.842 Y145.888 E.0035
G1 X151.039 Y103.691 E1.74246
G1 X150.626 Y103.57 E.01256
G1 X108.47 Y145.726 E1.74079
G2 X108.043 Y145.619 I-.419 J.767 E.013
G1 X150.254 Y103.408 E1.74306
G1 X149.929 Y103.199 E.01128
G1 X107.582 Y145.546 E1.74869
G1 X107.12 Y145.474 E.01364
G1 X149.604 Y102.99 E1.75432
G1 X149.279 Y102.781 E.01128
G1 X106.534 Y145.526 E1.7651
G1 X105.9 Y145.626 E.01873
G1 X148.954 Y102.572 E1.77784
G1 X148.629 Y102.363 E.01128
G1 X105.005 Y145.987 E1.80139
G1 X104.403 Y146.293 E.0197
G1 X103.429 Y147.27 E.0403
G1 X103.123 Y147.869 E.01963
G1 X102.027 Y148.965 E.04526
G1 X101.783 Y148.965 E.00713
G1 X101.743 Y148.715 E.0074
G1 X148.325 Y102.133 E1.92351
G1 X148.077 Y101.847 E.01105
G1 X101.578 Y148.346 E1.92012
G1 X101.397 Y147.993 E.01159
G1 X147.829 Y101.562 E1.91732
G1 X147.58 Y101.276 E.01105
G1 X101.217 Y147.639 E1.91452
G1 X101.179 Y147.564 E.00247
G1 X100.969 Y147.354 E.00868
G1 X147.332 Y100.99 E1.91454
G1 X147.084 Y100.704 E.01105
G1 X100.702 Y147.087 E1.91533
G1 X100.435 Y146.82 E.01103
G1 X146.836 Y100.418 E1.91611
G1 X146.665 Y100.055 E.01171
G1 X100.12 Y146.6 E1.92204
G1 X99.766 Y146.42 E.01159
G1 X146.498 Y99.688 E1.92973
G1 X146.33 Y99.322 E.01177
G1 X99.412 Y146.24 E1.93741
G2 X99.008 Y146.11 I-.403 J.559 E.0126
G1 X146.163 Y98.956 E1.94718
G1 X145.995 Y98.589 E.01177
G1 X98.548 Y146.036 E1.95928
G1 X98.087 Y145.963 E.01362
G1 X145.829 Y98.221 E1.97144
G1 X145.762 Y97.754 E.01378
G1 X143.233 Y100.283 E.10443
G1 X143.61 Y99.372 E.02879
G1 X145.695 Y97.287 E.0861
G1 X145.629 Y96.82 E.01378
G1 X143.987 Y98.461 E.06777
G1 X144.11 Y98.165 E.00935
G1 X144.164 Y97.75 E.01222
G1 X145.157 Y96.757 E.04099
G1 X144.623 Y96.757 E.01559
G1 X144.048 Y97.332 E.02374
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X144.623 Y96.757 E-.09267
G1 X145.157 Y96.757 E-.06088
G1 X144.695 Y97.219 E-.07446
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.6 I.04 J-1.216 P1  F28800
G1 X125.569 Y96.588 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X124.986 Y97.17 E.02407
G1 X124.905 Y97.786 E.01812
G1 X125.933 Y96.757 E.04246
G1 X126.467 Y96.757 E.01559
G1 X124.772 Y98.452 E.07
G1 X124.396 Y99.363 E.02875
G1 X126.755 Y97.003 E.09742
G1 X126.817 Y97.475 E.0139
G1 X123.541 Y100.751 E.13528
G1 E-.56 F1800
; WIPE_START
G1 F23040
M73 P54 R12
G1 X124.955 Y99.337 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.6 I.128 J-1.21 P1  F28800
G1 X104.197 Y97.133 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X104.573 Y96.757 E.01553
G1 X105.107 Y96.757 E.01559
G1 X104.313 Y97.551 E.0328
G1 X104.232 Y98.167 E.01813
G1 X105.641 Y96.757 E.05821
G1 X106.175 Y96.757 E.01559
G1 X103.978 Y98.954 E.09073
G1 X103.602 Y99.865 E.02877
G1 X106.497 Y96.969 E.11956
G1 X106.559 Y97.441 E.01389
G1 X102.361 Y101.64 E.17338
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X103.775 Y100.225 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.6 I.208 J-1.199 P1  F28800
G1 X82.849 Y96.588 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X82.256 Y97.181 E.02451
G1 X82.256 Y97.715 E.01559
G1 X83.213 Y96.757 E.03954
G1 X83.747 Y96.757 E.01559
G1 X82.256 Y98.249 E.06159
G1 X82.256 Y98.783 E.01559
G1 X84.281 Y96.757 E.08364
G1 X84.815 Y96.757 E.01559
G1 X82.256 Y99.316 E.10568
G1 X82.256 Y99.85 E.01559
G1 X84.905 Y97.202 E.10938
G1 X84.967 Y97.673 E.0139
G1 X82.256 Y100.384 E.11194
G1 X82.256 Y100.918 E.01559
G1 X85.029 Y98.145 E.1145
G2 X85.13 Y98.578 I.857 J.028 E.01313
G1 X82.257 Y101.452 E.11866
G1 X82.257 Y101.986 E.01559
G1 X85.287 Y98.956 E.12512
G1 X85.443 Y99.334 E.01193
G1 X82.446 Y102.33 E.12374
G1 X82.922 Y102.388 E.01401
G1 X85.599 Y99.711 E.11054
G1 X85.756 Y100.089 E.01193
G1 X83.399 Y102.446 E.09734
G1 X83.87 Y102.509 E.01388
G1 X85.912 Y100.466 E.08434
G1 X86.075 Y100.838 E.01184
G1 X84.257 Y102.655 E.07506
G1 X84.644 Y102.802 E.01209
G1 X86.307 Y101.14 E.06865
G1 X86.539 Y101.442 E.01112
G1 X85.032 Y102.949 E.06224
G1 X85.419 Y103.096 E.01209
G1 X86.771 Y101.744 E.05583
G1 X87.003 Y102.046 E.01112
G1 X85.806 Y103.243 E.04942
G1 X86.193 Y103.389 E.01209
G1 X87.235 Y102.348 E.04301
G1 X87.467 Y102.65 E.01112
G1 X86.509 Y103.607 E.03954
G1 X86.825 Y103.826 E.01121
G1 X87.719 Y102.931 E.03693
G1 X88.022 Y103.163 E.01112
G1 X87.141 Y104.044 E.03637
G1 X87.456 Y104.262 E.01121
G1 X88.324 Y103.395 E.03581
G1 X88.626 Y103.627 E.01112
G1 X87.772 Y104.48 E.03525
G1 X88.088 Y104.698 E.01121
G1 X88.928 Y103.858 E.03469
G1 X89.23 Y104.09 E.01112
G1 X88.374 Y104.947 E.03537
G1 X88.625 Y105.23 E.01105
G1 X89.532 Y104.322 E.03748
G2 X89.873 Y104.516 I.533 J-.541 E.01157
G1 X88.876 Y105.513 E.04118
G1 X89.127 Y105.796 E.01105
G1 X90.25 Y104.672 E.04639
G1 X90.627 Y104.829 E.01193
G1 X89.378 Y106.079 E.05161
G1 X89.629 Y106.362 E.01105
G1 X91.005 Y104.986 E.05682
G1 X91.382 Y105.142 E.01193
G1 X89.88 Y106.645 E.06205
G1 X89.922 Y106.692 E.00185
G1 X90.075 Y106.984 E.00962
G1 X91.76 Y105.298 E.0696
G1 X92.069 Y105.426 E.00977
G1 X92.155 Y105.437 E.00253
G1 X90.258 Y107.334 E.07832
G1 X90.442 Y107.684 E.01155
G1 X92.627 Y105.499 E.09022
G1 X93.099 Y105.561 E.0139
G1 X90.626 Y108.035 E.10212
G1 X90.81 Y108.385 E.01155
G1 X93.571 Y105.623 E.11403
G1 X94.043 Y105.685 E.0139
G1 X90.993 Y108.735 E.12593
G3 X91.139 Y109.124 I-.716 J.489 E.01224
G1 X94.515 Y105.747 E.13942
G1 X94.633 Y105.763 E.00347
G1 X95.094 Y105.702 E.01359
G1 X91.244 Y109.552 E.15898
G1 X91.35 Y109.981 E.01288
G1 X95.709 Y105.621 E.18
G1 X96.324 Y105.541 E.01811
G1 X91.455 Y110.409 E.20103
G1 X91.561 Y110.837 E.01288
G1 X96.939 Y105.46 E.22206
G1 X97.194 Y105.426 E.00753
G1 X97.726 Y105.206 E.01681
G1 X91.667 Y111.266 E.25023
G1 X91.687 Y111.348 E.00248
G1 X91.687 Y111.78 E.01259
G1 X98.638 Y104.828 E.28704
G1 X99.55 Y104.45 E.02884
G1 X91.687 Y112.314 E.32472
G1 X91.687 Y112.848 E.01559
G1 X106.622 Y97.913 E.61671
G1 X106.672 Y98.293 E.01119
G1 X106.702 Y98.366 E.00233
G1 X91.687 Y113.382 E.62003
G1 X91.687 Y113.856 E.01385
G1 X91.667 Y113.935 E.00238
G1 X106.858 Y98.744 E.62729
G1 X107.014 Y99.122 E.01194
G1 X91.493 Y114.644 E.64095
G1 X91.318 Y115.352 E.02131
G1 X107.17 Y99.5 E.6546
G1 X107.327 Y99.878 E.01194
G1 X91.144 Y116.061 E.66826
G1 X91.087 Y116.291 E.00692
G1 X90.689 Y117.049 E.02501
G1 X107.483 Y100.256 E.69348
G1 X107.61 Y100.563 E.00971
G1 X107.653 Y100.619 E.00207
G1 X89.181 Y119.091 E.76278
G1 X82.087 Y123.515 F28800
G1 F15000
G1 X82.767 Y122.835 E.02809
G1 X83.375 Y122.761 E.01788
G1 X82.257 Y123.88 E.04619
G1 X82.257 Y124.243 E.01061
G1 X82.409 Y124.261 E.00447
G1 X84.039 Y122.631 E.06731
G1 X84.9 Y122.304 E.0269
G1 X82.885 Y124.319 E.08321
G1 X83.361 Y124.377 E.01401
G1 X85.762 Y121.977 E.09912
G1 X86.194 Y121.812 E.01352
G1 X87.052 Y121.221 E.03041
G1 X83.838 Y124.435 E.13272
G1 X83.969 Y124.451 E.00386
G1 X84.249 Y124.557 E.00876
G1 X107.885 Y100.921 E.97601
G1 X108.117 Y101.223 E.01112
G1 X84.636 Y124.704 E.96961
G1 X85.023 Y124.851 E.01209
G1 X108.349 Y101.525 E.96321
G1 X108.581 Y101.827 E.01112
G1 X85.41 Y124.998 E.95681
G1 X85.797 Y125.145 E.01209
G1 X108.813 Y102.129 E.95041
G1 X109.045 Y102.431 E.01112
G1 X86.184 Y125.292 E.944
G3 X86.545 Y125.466 I-.172 J.819 E.01179
G1 X109.329 Y102.681 E.94084
G1 X109.631 Y102.913 E.01112
G1 X86.861 Y125.684 E.94028
G1 X87.177 Y125.902 E.01121
G1 X109.933 Y103.145 E.93971
G1 X110.235 Y103.377 E.01112
G1 X87.492 Y126.12 E.93915
G1 X87.808 Y126.338 E.01121
G1 X110.538 Y103.609 E.93858
G1 X110.84 Y103.84 E.01112
G1 X88.124 Y126.556 E.93802
G1 X88.44 Y126.774 E.01121
G1 X111.164 Y104.05 E.93837
G1 X111.542 Y104.206 E.01194
G1 X88.722 Y127.027 E.94234
G1 X88.973 Y127.31 E.01105
G1 X111.92 Y104.363 E.94757
G1 X112.298 Y104.519 E.01194
G1 X89.224 Y127.593 E.95281
G1 X89.475 Y127.876 E.01105
G1 X112.675 Y104.675 E.95804
G1 X113.053 Y104.831 E.01194
G1 X89.726 Y128.159 E.96328
G1 X89.977 Y128.442 E.01105
G1 X113.458 Y104.96 E.96964
G1 X113.93 Y105.022 E.0139
G1 X90.228 Y128.725 E.97876
G3 X90.44 Y129.046 I-.545 J.59 E.01137
G1 X114.402 Y105.085 E.98948
G1 X114.873 Y105.147 E.0139
G1 X90.624 Y129.397 E1.00137
G1 X90.807 Y129.747 E.01155
G1 X115.345 Y105.209 E1.01326
G1 X115.755 Y105.263 E.01206
G1 X115.836 Y105.252 E.00239
G1 X90.991 Y130.097 E1.02594
G1 X91.175 Y130.447 E.01155
G1 X116.451 Y105.171 E1.04375
G1 X117.066 Y105.09 E.01811
G1 X91.359 Y130.797 E1.06156
G1 X91.543 Y131.148 E.01155
G1 X117.681 Y105.009 E1.07937
G1 X118.189 Y104.942 E.01494
G1 X118.348 Y104.876 E.00504
G1 X91.653 Y131.571 E1.10233
G1 X91.759 Y131.999 E.01289
G1 X119.259 Y104.499 E1.13558
G1 X120.17 Y104.123 E.02878
G1 X91.864 Y132.428 E1.16884
G1 X91.97 Y132.857 E.01289
G1 X126.879 Y97.947 E1.44154
G2 X126.992 Y98.368 I.839 J.001 E.01288
G1 X92.075 Y133.285 E1.44184
G1 X92.181 Y133.714 E.01289
G1 X127.149 Y98.746 E1.44395
G1 X127.305 Y99.123 E.01193
G1 X92.183 Y134.245 E1.45033
G1 X92.183 Y134.779 E.01559
G1 X127.462 Y99.501 E1.4568
G1 X127.618 Y99.878 E.01193
G1 X92.183 Y135.313 E1.46326
G1 X92.183 Y135.847 E.01559
G1 X127.775 Y100.255 E1.46973
G1 X127.798 Y100.311 E.00177
G1 X127.996 Y100.569 E.00947
G1 X92.173 Y136.391 E1.47924
G1 X91.999 Y137.099 E.0213
G1 X128.227 Y100.871 E1.49602
G1 X128.459 Y101.173 E.01112
G1 X91.824 Y137.808 E1.51279
G1 X91.65 Y138.516 E.0213
G1 X128.691 Y101.475 E1.52956
G1 X128.923 Y101.777 E.01112
G1 X91.287 Y139.413 E1.55412
G1 X90.697 Y140.537 E.03706
G1 X129.155 Y102.079 E1.58805
G1 X129.213 Y102.156 E.00282
G1 X129.439 Y102.329 E.0083
G1 X82.803 Y148.965 E1.92577
G1 X83.337 Y148.965 E.01559
G1 X129.741 Y102.561 E1.91619
G1 X130.043 Y102.793 E.01112
G1 X83.871 Y148.965 E1.90661
G1 X84.405 Y148.965 E.01559
G1 X130.345 Y103.025 E1.89703
G1 X130.647 Y103.257 E.01112
G1 X84.939 Y148.965 E1.88745
G1 X85.473 Y148.965 E.01559
G1 X130.949 Y103.489 E1.87787
G2 X131.3 Y103.672 I.516 J-.56 E.01169
G1 X86.007 Y148.965 E1.8703
G1 X86.541 Y148.965 E.01559
G1 X131.678 Y103.829 E1.86385
G1 X132.055 Y103.985 E.01194
G1 X89.475 Y146.565 E1.7583
G1 X90.109 Y146.465 E.01874
G1 X132.433 Y104.141 E1.74773
G1 X132.811 Y104.297 E.01194
G1 X90.59 Y146.518 E1.74347
G1 X91.051 Y146.591 E.01363
G1 X133.189 Y104.453 E1.74003
G1 X133.656 Y104.52 E.01379
G1 X91.447 Y146.729 E1.74298
G1 X91.801 Y146.909 E.0116
G1 X134.128 Y104.582 E1.74784
G1 X134.599 Y104.645 E.01389
G1 X92.155 Y147.089 E1.75269
G1 X92.429 Y147.35 E.01103
G1 X135.071 Y104.707 E1.76087
G1 X135.553 Y104.759 E.01415
G1 X92.696 Y147.617 E1.76975
G1 X92.954 Y147.892 E.01103
G1 X136.168 Y104.678 E1.78448
G1 X136.784 Y104.596 E.01812
G1 X93.135 Y148.245 E1.80243
G1 X93.315 Y148.599 E.01159
G1 X137.399 Y104.515 E1.82038
G1 X137.815 Y104.46 E.01224
G1 X138.11 Y104.338 E.00934
G1 X93.313 Y149.135 E1.84983
G1 X93.847 Y149.135 F28800
G1 F15000
G1 X94.661 Y148.321 E.03361
G1 X96.478 Y146.504 F28800
G1 F15000
G1 X139.021 Y103.961 E1.75674
G1 X139.931 Y103.585 E.02877
G1 X97.274 Y146.242 E1.76148
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.688 Y144.828 E-.228
; WIPE_END
M73 P55 R12
G1 E-.012 F1800
G17
G3 Z1.6 I-.923 J.793 P1  F28800
G1 X102.391 Y149.135 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X102.964 Y148.562 E.02363
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X102.391 Y149.135 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.6 I0 J1.217 P1  F28800
G1 X122.683 Y149.135 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X122.858 Y148.96 E.00721
G1 X122.958 Y148.326 E.01875
G1 X122.319 Y148.965 E.02639
G1 X121.916 Y148.965 E.01177
G1 X121.898 Y148.852 E.00334
G1 X123.805 Y146.945 E.07875
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.391 Y148.359 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.6 I.057 J-1.216 P1  F28800
G1 X82.087 Y146.477 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15000
G1 X82.799 Y145.765 E.02939
G1 X83.406 Y145.692 E.01787
G1 X82.257 Y146.841 E.04747
G1 X82.257 Y147.375 E.01559
G1 X84.033 Y145.599 E.07334
G1 X84.894 Y145.272 E.02689
G1 X82.257 Y147.909 E.1089
G1 X82.257 Y148.443 E.01559
G1 X85.755 Y144.945 E.14445
G1 X86.426 Y144.69 E.02098
M73 P55 R11
G1 X86.806 Y144.428 E.01347
G1 X82.1 Y149.135 E.19435
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X83.514 Y147.72 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z1.6 I-.794 J.922 P1  F28800
G1 X189.5 Y239 Z1.6
G1 Z1.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.2
; FEATURE: Prime tower
; LINE_WIDTH: 0.5
G1  X155.500 Y239.000  E1.2922 F5400
G1  Y219.500  E0.7411
G1  X189.500  E1.2922
G1  Y239.000  E0.7411
G1  X155.500 
G1  Y219.500 
G1  X156.500 
;--------------------
; CP EMPTY GRID START
; layer #8
G1  Y239.000  E0.7411
G1  X164.500 
G1  Y219.500  E0.7411
G1  X172.500 
G1  Y239.000  E0.7411
G1  X180.500 
G1  Y219.500  E0.7411
G1  X188.500 
G1  Y239.000  E0.7411
; CP EMPTY GRID END
;------------------






G1  X190.000 
G1  Y239.500 
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X190.000  E1.3302
G1  Y239.500  E0.7791

G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X188 Y239.5 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.136 J-.437 P1  F28800
G1 X151.29 Y144.073 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X149.634 Y144.918 E.05851
G1 X148.282 Y146.268 E.06017
G1 X147.413 Y147.973 E.06022
G1 X147.21 Y149.259 E.04099
G1 X145.707 Y149.259 E.04731
G1 X145.529 Y148.127 E.03608
G1 X144.732 Y146.563 E.05526
G1 X143.491 Y145.322 E.05524
G1 X141.927 Y144.525 E.05526
G1 X140.193 Y144.252 E.05527
G1 X138.46 Y144.525 E.0552
G1 X136.896 Y145.322 E.05525
G1 X135.656 Y146.563 E.05524
G1 X134.859 Y148.127 E.05525
G1 X134.68 Y149.259 E.03608
G1 X133.137 Y149.259 E.04858
G1 X132.982 Y148.281 E.03118
G1 X132.256 Y146.857 E.05033
G1 X131.125 Y145.726 E.05034
G1 X129.701 Y145.001 E.0503
G1 X128.123 Y144.751 E.0503
G1 X126.545 Y145.001 E.05029
G1 X125.119 Y145.726 E.05035
G2 X123.989 Y146.857 I300.017 J300.546 E.05032
G1 X123.263 Y148.281 E.05031
G1 X123.108 Y149.259 E.03118
G1 X121.665 Y149.259 E.04544
G1 X121.534 Y148.437 E.02621
G1 X120.88 Y147.151 E.04542
G1 X119.861 Y146.132 E.04537
G1 X118.575 Y145.478 E.04541
G1 X117.151 Y145.249 E.04542
G1 X115.726 Y145.478 E.04541
G2 X114.443 Y146.132 I200.167 J394.231 E.04535
G1 X113.422 Y147.151 E.0454
G1 X112.767 Y148.437 E.04545
G1 X112.638 Y149.259 E.02619
G1 X111.008 Y149.259 E.05132
G1 X110.903 Y148.591 E.02129
G1 X110.321 Y147.45 E.04031
G1 X109.118 Y146.198 E.05466
G1 X109.04 Y146.294 E.00392
G1 X108.244 Y145.948 E.02732
G1 X106.993 Y145.752 E.03988
G1 X105.725 Y145.951 E.0404
G1 X104.578 Y146.534 E.04049
G1 X103.67 Y147.445 E.04051
G1 X103.085 Y148.59 E.04048
G1 X102.979 Y149.259 E.02131
G1 X101.531 Y149.259 E.04556
G1 X101.451 Y148.745 E.01638
G1 X100.938 Y147.739 E.03555
G1 X100.14 Y146.941 E.03554
G2 X99.133 Y146.427 I-70.452 J136.956 E.03556
G1 X98.017 Y146.249 E.03559
G1 X96.902 Y146.428 E.03553
G1 X95.896 Y146.94 E.03553
G1 X95.098 Y147.739 E.03556
G1 X94.585 Y148.744 E.03553
G1 X94.503 Y149.259 E.0164
G1 X93.195 Y149.259 E.04117
G1 X93.138 Y148.898 E.01149
G1 X92.696 Y148.032 E.03062
G1 X92.007 Y147.344 E.03066
G1 X91.141 Y146.903 E.03059
G1 X90.181 Y146.752 E.03059
G1 X89.219 Y146.903 E.03066
G1 X88.353 Y147.344 E.03059
G1 X87.663 Y148.033 E.03068
G1 X87.223 Y148.899 E.03059
G1 X87.166 Y149.259 E.01147
G1 X81.963 Y149.259 E.1638
G1 X81.963 Y145.571 E.11611
G1 X83.898 Y145.336 E.06136
G1 X86.289 Y144.428 E.08051
G1 X88.393 Y142.975 E.08049
G1 X90.09 Y141.062 E.08051
G1 X91.278 Y138.798 E.08048
G1 X91.889 Y136.316 E.08046
G1 X91.889 Y133.758 E.08053
G1 X91.278 Y131.276 E.08046
G1 X90.09 Y129.012 E.08048
G1 X88.393 Y127.099 E.08051
G1 X86.289 Y125.646 E.08049
G1 X83.898 Y124.738 E.0805
G1 X81.963 Y124.504 E.06136
G1 X81.963 Y122.636 E.05878
G1 X83.778 Y122.416 E.05756
G1 X86.057 Y121.55 E.07673
G1 X88.061 Y120.167 E.07665
G1 X89.678 Y118.344 E.07672
G1 X90.81 Y116.186 E.0767
G1 X91.393 Y113.82 E.07671
G1 X91.393 Y111.384 E.07669
G1 X90.81 Y109.018 E.07671
G1 X89.678 Y106.86 E.0767
G1 X88.061 Y105.037 E.07671
G1 X86.057 Y103.652 E.07669
G1 X83.778 Y102.788 E.07672
G1 X81.963 Y102.568 E.05756
G1 X81.961 Y96.463 E.19217
G1 X85.105 Y96.463 E.09895
G1 X85.352 Y98.346 E.05979
G1 X86.313 Y100.665 E.07901
G1 X87.839 Y102.653 E.0789
G1 X89.829 Y104.179 E.07893
G2 X92.146 Y105.14 I291.183 J-698.809 E.07896
G1 X94.633 Y105.466 E.07896
G1 X97.118 Y105.14 E.0789
G2 X99.436 Y104.179 I-448.357 J-1085.327 E.07901
G1 X101.426 Y102.653 E.07894
G1 X102.953 Y100.665 E.0789
G1 X103.911 Y98.346 E.07897
G1 X104.16 Y96.463 E.05979
G1 X106.727 Y96.463 E.08079
G1 X106.958 Y98.216 E.05566
G1 X107.867 Y100.415 E.07489
G1 X109.315 Y102.301 E.07486
G1 X111.201 Y103.747 E.07481
G2 X113.398 Y104.656 I550.99 J-1328.888 E.07483
G1 X115.755 Y104.966 E.07484
G1 X118.112 Y104.656 E.07484
G1 X120.308 Y103.747 E.07482
G1 X122.194 Y102.301 E.07482
G1 X123.643 Y100.415 E.07486
G1 X124.551 Y98.216 E.07489
G1 X124.783 Y96.463 E.05566
G1 X126.981 Y96.463 E.06919
G1 X127.194 Y98.088 E.0516
G1 X128.055 Y100.163 E.0707
G1 X129.423 Y101.946 E.07076
G1 X131.205 Y103.315 E.07074
G1 X133.282 Y104.174 E.07073
G1 X135.509 Y104.468 E.07072
G1 X137.738 Y104.174 E.07078
G1 X139.814 Y103.315 E.07073
G1 X141.596 Y101.946 E.07073
G1 X142.965 Y100.163 E.07077
G1 X143.823 Y98.088 E.07068
G1 X144.037 Y96.463 E.05159
G1 X145.875 Y96.463 E.05785
G1 X146.115 Y98.144 E.05346
G1 X147.075 Y100.244 E.07268
G2 X148.587 Y101.987 I340.629 J-293.917 E.07264
G1 X150.528 Y103.234 E.07263
G1 X152.742 Y103.885 E.07265
G1 X155.048 Y103.885 E.07259
G2 X157.264 Y103.234 I-60.619 J-210.413 E.0727
G1 X159.205 Y101.987 E.07263
G1 X160.716 Y100.244 E.07262
G1 X161.674 Y98.145 E.07264
G1 X161.918 Y96.463 E.05348
G1 X165.757 Y96.463 E.12084
G1 X165.757 Y99.943 E.10956
G1 X164.215 Y100.165 E.04902
G1 X162.246 Y101.065 E.06816
G1 X160.609 Y102.483 E.06816
G1 X159.439 Y104.304 E.06815
G1 X158.829 Y106.382 E.06818
G1 X158.829 Y108.548 E.06816
G1 X159.439 Y110.626 E.06818
G1 X160.609 Y112.447 E.06814
G1 X162.246 Y113.867 E.0682
G1 X164.215 Y114.767 E.06817
G1 X165.757 Y114.987 E.04901
G1 X165.757 Y117.138 E.06769
G1 X164.357 Y117.339 E.0445
G1 X162.516 Y118.179 E.0637
G1 X160.987 Y119.503 E.06366
G1 X159.893 Y121.207 E.06374
G1 X159.325 Y123.147 E.06364
G1 X159.325 Y125.169 E.06367
G1 X159.893 Y127.112 E.0637
G1 X160.987 Y128.813 E.06368
G1 X162.516 Y130.139 E.0637
G1 X164.357 Y130.979 E.06371
G1 X165.757 Y131.181 E.0445
G1 X165.757 Y132.965 E.05618
G1 X164.318 Y133.193 E.04584
G1 X162.475 Y134.132 E.06513
G1 X161.012 Y135.595 E.06513
G1 X160.073 Y137.437 E.06508
G1 X159.749 Y139.479 E.0651
G1 X160.073 Y141.521 E.06509
G1 X161.012 Y143.365 E.06514
M73 P56 R11
G1 X162.475 Y144.826 E.06509
G1 X164.318 Y145.765 E.06512
G1 X165.757 Y145.993 E.04584
G1 X165.757 Y149.259 E.10281
G1 X159.239 Y149.259 E.20518
G1 X159.034 Y147.973 E.04099
G1 X158.168 Y146.269 E.06018
G1 X156.815 Y144.918 E.06018
G2 X155.113 Y144.049 I-151.181 J294.118 E.06016
G1 X153.225 Y143.749 E.06018
G1 X151.344 Y144.048 E.05994
G1 X151.687 Y144.391 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.459 Y144.427 E.00674
G2 X149.868 Y145.239 I120.514 J238.087 E.0521
G1 X148.603 Y146.502 E.05212
G1 X147.79 Y148.095 E.05215
G1 X147.545 Y149.651 E.04592
G1 X145.372 Y149.651 E.06337
G1 X145.151 Y148.249 E.04138
G1 X144.411 Y146.796 E.04756
G1 X143.258 Y145.643 E.04755
G1 X141.804 Y144.903 E.04756
G1 X140.193 Y144.648 E.04758
G1 X138.583 Y144.903 E.04752
G1 X137.13 Y145.643 E.04756
G1 X135.977 Y146.796 E.04755
G1 X135.236 Y148.249 E.04756
G1 X135.015 Y149.651 E.04138
G1 X132.802 Y149.651 E.06453
G1 X132.605 Y148.403 E.03684
G1 X131.935 Y147.09 E.04299
G1 X130.892 Y146.047 E.04301
G1 X129.578 Y145.379 E.04297
G1 X128.123 Y145.148 E.04297
G1 X126.667 Y145.379 E.04297
G1 X125.352 Y146.047 E.04302
G2 X124.311 Y147.09 I276.388 J276.872 E.04298
G1 X123.641 Y148.403 E.04299
G1 X123.443 Y149.651 E.03684
G1 X121.33 Y149.651 E.06162
G1 X121.157 Y148.559 E.03223
G1 X120.559 Y147.384 E.03845
G1 X119.628 Y146.453 E.0384
G1 X118.453 Y145.855 E.03845
G1 X117.151 Y145.646 E.03844
G1 X115.849 Y145.855 E.03844
G2 X114.676 Y146.453 I182.811 J360.009 E.0384
G1 X113.743 Y147.384 E.03843
G1 X113.144 Y148.56 E.03846
G1 X112.973 Y149.651 E.03222
G1 X110.672 Y149.651 E.06709
G1 X110.525 Y148.713 E.02768
G1 X109.998 Y147.68 E.03383
G1 X109.143 Y146.79 E.03598
G1 X109.092 Y146.854 E.00239
G1 X108.801 Y146.618 E.01092
G1 X108.134 Y146.328 E.02121
G1 X106.993 Y146.148 E.03368
G1 X105.847 Y146.329 E.03381
G1 X104.812 Y146.855 E.03387
G1 X103.991 Y147.678 E.0339
G1 X103.463 Y148.713 E.03388
G1 X103.313 Y149.651 E.02769
G1 X101.196 Y149.651 E.06174
G1 X101.073 Y148.867 E.02313
G1 X100.617 Y147.972 E.0293
G1 X99.906 Y147.261 E.02931
G2 X99.01 Y146.805 I-62.638 J121.795 E.02931
G1 X98.017 Y146.646 E.02934
G1 X97.025 Y146.805 E.02929
G1 X96.13 Y147.261 E.0293
G1 X95.419 Y147.972 E.02932
G1 X94.963 Y148.867 E.0293
G1 X94.838 Y149.651 E.02314
G1 X92.86 Y149.651 E.05766
G1 X92.761 Y149.021 E.01859
G1 X92.375 Y148.266 E.02474
G1 X91.774 Y147.665 E.02478
G1 X91.018 Y147.281 E.02471
G1 X90.181 Y147.148 E.02473
G1 X89.341 Y147.281 E.02478
G1 X88.586 Y147.665 E.02471
G1 X87.985 Y148.266 E.02479
G1 X87.6 Y149.022 E.02471
G1 X87.501 Y149.651 E.01858
G1 X81.571 Y149.651 E.17293
G1 X81.571 Y145.223 E.12912
G1 X83.803 Y144.952 E.06558
G1 X86.105 Y144.078 E.07179
G1 X88.131 Y142.679 E.07179
G1 X89.765 Y140.837 E.0718
G1 X90.909 Y138.658 E.07177
G1 X91.497 Y136.269 E.07176
G1 X91.497 Y133.806 E.07182
G1 X90.909 Y131.416 E.07176
G1 X89.765 Y129.237 E.07177
G1 X88.131 Y127.395 E.0718
G1 X86.105 Y125.996 E.07179
G1 X83.803 Y125.122 E.07179
G1 X81.571 Y124.851 E.06558
G1 X81.571 Y122.289 E.0747
G1 X83.683 Y122.032 E.06206
G1 X85.873 Y121.2 E.0683
G1 X87.799 Y119.871 E.06823
G1 X89.353 Y118.119 E.06829
G1 X90.441 Y116.046 E.06827
G1 X91.001 Y113.773 E.06828
G1 X91.001 Y111.432 E.06826
G1 X90.441 Y109.158 E.06828
G1 X89.353 Y107.085 E.06827
G1 X87.799 Y105.333 E.06829
G1 X85.873 Y104.002 E.06826
G1 X83.683 Y103.172 E.06829
G1 X81.571 Y102.915 E.06206
G1 X81.569 Y96.071 E.19957
G1 X85.449 Y96.071 E.11312
G1 X85.734 Y98.244 E.0639
G1 X86.655 Y100.467 E.07017
G1 X88.119 Y102.373 E.07007
G1 X90.027 Y103.836 E.07011
G2 X92.248 Y104.758 I279.145 J-669.912 E.07012
G1 X94.633 Y105.071 E.07014
G1 X97.015 Y104.758 E.07008
G2 X99.239 Y103.836 I-430.125 J-1041.184 E.07017
G1 X101.146 Y102.373 E.07011
G1 X102.61 Y100.467 E.07007
G1 X103.529 Y98.244 E.07015
G1 X103.817 Y96.071 E.06391
G1 X107.071 Y96.071 E.09488
G1 X107.34 Y98.114 E.06008
G1 X108.209 Y100.217 E.06636
G1 X109.595 Y102.021 E.06633
G1 X111.399 Y103.405 E.06629
G2 X113.5 Y104.274 I526.699 J-1270.298 E.0663
G1 X115.755 Y104.571 E.06632
G1 X118.01 Y104.274 E.06632
G1 X120.111 Y103.405 E.0663
G1 X121.914 Y102.021 E.06629
G1 X123.3 Y100.217 E.06633
G1 X124.169 Y98.114 E.06636
G1 X124.439 Y96.071 E.06008
G1 X127.325 Y96.071 E.08414
G1 X127.576 Y97.986 E.05632
G1 X128.397 Y99.965 E.06248
G1 X129.703 Y101.667 E.06254
G1 X131.403 Y102.973 E.06251
G1 X133.384 Y103.792 E.06251
G1 X135.509 Y104.073 E.0625
G1 X137.636 Y103.792 E.06256
G1 X139.617 Y102.973 E.06251
G1 X141.317 Y101.667 E.0625
G1 X142.622 Y99.965 E.06255
G1 X143.441 Y97.986 E.06246
G1 X143.693 Y96.071 E.05631
G1 X146.215 Y96.071 E.07353
G1 X146.495 Y98.033 E.05779
G1 X147.408 Y100.03 E.06403
G2 X148.846 Y101.688 I323.845 J-279.414 E.06399
G1 X150.693 Y102.874 E.064
G1 X152.798 Y103.493 E.06401
G1 X154.992 Y103.493 E.06398
G2 X157.099 Y102.874 I-57.676 J-200.138 E.06402
G1 X158.946 Y101.687 E.064
G1 X160.383 Y100.03 E.06398
G1 X161.294 Y98.033 E.064
G1 X161.578 Y96.071 E.0578
G1 X166.149 Y96.071 E.13327
G1 X166.149 Y100.283 E.12282
G1 X164.327 Y100.546 E.05367
G1 X162.46 Y101.399 E.05985
G1 X160.908 Y102.742 E.05985
G1 X159.8 Y104.469 E.05984
G1 X159.221 Y106.439 E.05987
G1 X159.221 Y108.491 E.05985
G1 X159.8 Y110.461 E.05987
G1 X160.908 Y112.188 E.05983
G1 X162.46 Y113.534 E.05989
G1 X164.327 Y114.387 E.05986
G1 X166.149 Y114.647 E.05366
G1 X166.149 Y117.477 E.08252
G1 X164.469 Y117.72 E.04949
G1 X162.73 Y118.513 E.05573
G1 X161.286 Y119.762 E.05568
G1 X160.254 Y121.371 E.05575
G1 X159.717 Y123.203 E.05566
G1 X159.717 Y125.113 E.0557
G1 X160.254 Y126.947 E.05572
G1 X161.286 Y128.554 E.0557
G1 X162.73 Y129.806 E.05571
G1 X164.469 Y130.599 E.05573
G1 X166.149 Y130.841 E.04949
G1 X166.149 Y133.3 E.0717
G1 X164.441 Y133.571 E.05042
G1 X162.708 Y134.453 E.05671
G1 X161.333 Y135.828 E.0567
G1 X160.451 Y137.559 E.05666
G1 X160.146 Y139.479 E.05668
G1 X160.451 Y141.399 E.05668
G1 X161.333 Y143.132 E.05671
G1 X162.708 Y144.505 E.05667
G1 X164.441 Y145.387 E.05671
G1 X166.149 Y145.658 E.05042
G1 X166.149 Y149.651 E.11643
G1 X158.904 Y149.651 E.21125
G1 X158.657 Y148.095 E.04593
G1 X157.847 Y146.502 E.05212
G1 X156.582 Y145.239 E.05212
G2 X154.99 Y144.427 I-141.358 J274.982 E.0521
G1 X153.225 Y144.146 E.05213
G1 X151.747 Y144.381 E.04364
G1 X151.552 Y144.203 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X151.459 Y144.427 E-.03319
G1 X149.937 Y145.204 E-.19481
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.161 J.364 P1  F28800
G1 X165.142 Y96.686 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
; FEATURE: Top surface
G1 F6000
G1 X165.534 Y97.078 E.01618
G1 X165.534 Y97.611
G1 X164.609 Y96.686 E.03817
G1 X164.075 Y96.686
G1 X165.534 Y98.145 E.06017
G1 X165.534 Y98.678
G1 X163.542 Y96.686 E.08216
G1 X163.009 Y96.686
G1 X165.534 Y99.211 E.10415
G1 X165.534 Y99.744
G1 X162.475 Y96.686 E.12614
G1 X162.089 Y96.832
G1 X165.074 Y99.817 E.12308
G1 X164.608 Y99.884
G1 X162.022 Y97.298 E.10664
G1 X161.954 Y97.764
G1 X164.144 Y99.954 E.0903
G1 X163.778 Y100.121
G1 X161.882 Y98.225 E.07818
G1 X161.715 Y98.591
G1 X163.412 Y100.288 E.06997
G1 X163.046 Y100.455
G1 X161.548 Y98.958 E.06177
G1 X161.381 Y99.324
G1 X162.68 Y100.623 E.05356
G1 X162.314 Y100.79
G1 X161.214 Y99.69 E.04536
G1 X161.047 Y100.056
G1 X161.986 Y100.996 E.03875
G1 X161.701 Y101.243
G1 X160.867 Y100.41 E.03437
G1 X160.619 Y100.695
G1 X161.415 Y101.491 E.0328
G1 X161.129 Y101.738
G1 X160.372 Y100.981 E.03123
G1 X160.124 Y101.267
G1 X160.843 Y101.986 E.02966
G1 X160.557 Y102.233
G1 X159.876 Y101.552 E.02809
G1 X159.629 Y101.838
G1 X160.317 Y102.526 E.02838
G1 X160.108 Y102.851
G1 X159.381 Y102.123 E.03
G1 X159.065 Y102.341
G1 X159.9 Y103.176 E.03442
G1 X159.691 Y103.5
G1 X158.741 Y102.55 E.03921
G1 X158.416 Y102.758
G1 X159.483 Y103.825 E.044
G1 X159.274 Y104.15
G1 X158.091 Y102.967 E.04879
G1 X157.767 Y103.175
G1 X159.137 Y104.546 E.0565
G1 X159.016 Y104.958
G1 X157.442 Y103.384 E.06489
G1 X157.053 Y103.528
G1 X158.894 Y105.37 E.07594
G1 X158.773 Y105.782
G1 X156.641 Y103.65 E.08793
G1 X156.229 Y103.771
G1 X158.652 Y106.194 E.09991
G1 X158.606 Y106.681
G1 X155.818 Y103.893 E.115
G1 X155.405 Y104.013
G1 X158.606 Y107.215 E.13201
G1 X158.606 Y107.748
G1 X154.966 Y104.108 E.15012
G1 X154.433 Y104.108
G1 X158.606 Y108.281 E.17211
G1 X158.704 Y108.912
G1 X153.899 Y104.108 E.19813
G1 X153.366 Y104.108
G1 X158.926 Y109.667 E.22928
G1 X159.148 Y110.423
G1 X152.833 Y104.108 E.26042
G1 X152.129 Y103.937
G1 X159.816 Y111.624 E.31702
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X158.402 Y110.21 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.732 J.972 P1  F28800
G1 X164.878 Y115.086 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X165.534 Y115.742 E.02706
G1 X165.534 Y116.276
G1 X164.256 Y114.997 E.05272
G1 X163.334 Y114.608
G1 X165.534 Y116.809 E.09075
G1 X165.187 Y116.995
G1 X162.352 Y114.16 E.11693
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X163.766 Y115.574 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.024 J.657 P1  F28800
G1 X164.721 Y117.062 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X151.373 Y103.715 E.55043
G1 X150.618 Y103.493
G1 X164.263 Y117.138 E.5627
G1 X163.897 Y117.305
G1 X149.305 Y102.713 E.60174
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X150.719 Y104.127 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.972 J-.733 P1  F28800
G1 X145.816 Y97.624 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X144.878 Y96.686 E.0387
G1 X144.344 Y96.686
G1 X145.927 Y98.268 E.06528
G1 X146.377 Y99.251
G1 X144.183 Y97.058 E.09045
G1 X144.121 Y97.529
G1 X146.826 Y100.234 E.11154
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X145.412 Y98.819 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.63 J-1.041 P1  F28800
G1 X144.059 Y98 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X163.531 Y117.472 E.80297
G1 X163.165 Y117.639
G1 X143.932 Y98.407 E.7931
G1 X143.776 Y98.784
G1 X162.798 Y117.806 E.78444
G1 X162.432 Y117.973
G1 X143.62 Y99.161 E.77577
G1 X143.464 Y99.538
G1 X162.138 Y118.212 E.77008
G1 X161.852 Y118.46
G1 X143.308 Y99.915 E.76473
G1 X143.148 Y100.289
G1 X161.566 Y118.707 E.75953
G1 X161.281 Y118.954
G1 X142.917 Y100.591 E.75729
G1 X142.685 Y100.892
G1 X160.995 Y119.202 E.75504
G1 X160.738 Y119.479
G1 X142.454 Y101.194 E.75401
G1 X142.222 Y101.496
G1 X160.53 Y119.803 E.75496
G1 X160.321 Y120.128
G1 X141.991 Y101.798 E.75591
G1 X141.759 Y102.099
G1 X160.113 Y120.453 E.75686
G1 X159.904 Y120.778
G1 X141.459 Y102.332 E.76065
G1 X141.157 Y102.564
G1 X159.696 Y121.103 E.76449
G1 X159.572 Y121.512
G1 X140.856 Y102.796 E.77182
G1 X140.554 Y103.027
G1 X159.451 Y121.925 E.77928
G1 X159.33 Y122.337
G1 X140.252 Y103.259 E.78673
G1 X139.951 Y103.491
G1 X159.209 Y122.749 E.79418
G1 X159.102 Y123.175
G1 X139.58 Y103.653 E.80507
G1 X139.202 Y103.809
G1 X159.102 Y123.709 E.82063
G1 X159.102 Y124.242
G1 X138.825 Y103.965 E.83619
G1 X138.448 Y104.121
G1 X159.102 Y124.775 E.85175
G1 X159.147 Y125.353
G1 X138.07 Y104.277 E.86914
G1 X137.668 Y104.407
G1 X159.367 Y126.107 E.89485
G1 X159.588 Y126.861
G1 X137.197 Y104.469 E.92338
G1 X136.726 Y104.532
G1 X160.211 Y128.017 E.96847
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X158.797 Y126.603 E-.228
; WIPE_END
G1 E-.012 F1800
G17
M73 P57 R11
G3 Z1.8 I-.728 J.975 P1  F28800
G1 X165.105 Y131.311 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X165.534 Y131.741 E.01771
G1 X165.534 Y132.274
G1 X164.482 Y131.221 E.0434
G1 X163.609 Y130.882
G1 X165.507 Y132.78 E.07826
G1 X165.046 Y132.853
G1 X162.629 Y130.435 E.09971
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X164.043 Y131.849 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.086 J.548 P1  F28800
G1 X164.586 Y132.926 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X136.255 Y104.594 E1.16833
G1 X135.784 Y104.656
G1 X164.155 Y133.027 E1.16995
G1 X163.801 Y133.207
G1 X135.253 Y104.659 E1.17726
G1 X134.638 Y104.578
G1 X163.448 Y133.387 E1.18804
G1 X163.094 Y133.567
G1 X134.024 Y104.496 E1.19881
G1 X133.409 Y104.415
G1 X162.741 Y133.747 E1.20958
G1 X162.388 Y133.927
G1 X132.589 Y104.128 E1.22883
G1 X131.68 Y103.752
G1 X162.11 Y134.182 E1.25487
G1 X161.843 Y134.449
G1 X130.277 Y102.883 E1.30171
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X131.691 Y104.297 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.988 J-.711 P1  F28800
G1 X126.213 Y96.686 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X126.872 Y97.345 E.02718
G1 X126.953 Y97.958
G1 X125.68 Y96.686 E.05249
G1 X125.147 Y96.686
G1 X127.24 Y98.779 E.08632
G1 X127.618 Y99.69
G1 X124.935 Y97.007 E.11064
G1 X124.873 Y97.478
G1 X128.491 Y101.096 E.14919
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X127.077 Y99.682 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.739 J-.967 P1  F28800
G1 X124.811 Y97.95 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X161.576 Y134.715 E1.51614
G1 X161.31 Y134.982
G1 X124.719 Y98.392 E1.50891
G1 X124.563 Y98.769
G1 X161.043 Y135.249 E1.50434
G1 X160.794 Y135.532
G1 X124.408 Y99.146 E1.50048
G1 X124.252 Y99.524
G1 X160.614 Y135.886 E1.49949
G1 X160.434 Y136.239
G1 X124.096 Y99.901 E1.4985
G1 X123.94 Y100.278
G1 X160.254 Y136.592 E1.49751
G1 X160.074 Y136.945
G1 X123.758 Y100.63 E1.49758
G1 X123.526 Y100.931
G1 X159.894 Y137.299 E1.49971
G1 X159.8 Y137.738
G1 X123.295 Y101.233 E1.5054
G1 X123.063 Y101.534
G1 X159.727 Y138.199 E1.51194
M73 P58 R11
G1 X159.654 Y138.659
G1 X122.831 Y101.836 E1.51849
G1 X122.6 Y102.138
G1 X159.581 Y139.119 E1.52503
G1 X159.546 Y139.617
G1 X122.368 Y102.439 E1.53313
G1 X122.071 Y102.675
G1 X159.646 Y140.251 E1.54953
G1 X159.747 Y140.885
G1 X121.769 Y102.907 E1.56612
G1 X121.467 Y103.138
G1 X159.847 Y141.518 E1.58271
G1 X160.348 Y142.553
G1 X121.165 Y103.37 E1.61582
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.58 Y104.784 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.513 J-1.103 P1  F28800
G1 X106.62 Y97.357 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X105.949 Y96.686 E.0277
G1 X105.416 Y96.686
G1 X106.702 Y97.972 E.05303
G1 X106.932 Y98.735
G1 X104.882 Y96.686 E.08453
G1 X104.355 Y96.691
G1 X107.308 Y99.644 E.12178
G1 X107.724 Y100.593
G1 X104.292 Y97.162 E.1415
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X105.706 Y98.576 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.761 J.949 P1  F28800
G1 X164.953 Y146.091 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X165.534 Y146.672 E.02398
G1 X165.534 Y147.205
G1 X164.319 Y145.99 E.05012
G1 X163.283 Y145.487
G1 X165.534 Y147.739 E.09284
G1 X165.534 Y148.272
G1 X120.864 Y103.601 E1.84212
G1 X120.562 Y103.833
G1 X165.534 Y148.805 E1.85456
G1 X165.232 Y149.037
G1 X120.22 Y104.024 E1.85621
G1 X119.843 Y104.18
G1 X164.699 Y149.037 E1.84977
G1 X164.166 Y149.037
G1 X119.466 Y104.336 E1.84334
G1 X119.088 Y104.492
G1 X163.633 Y149.037 E1.8369
G1 X163.099 Y149.037
G1 X118.711 Y104.648 E1.83047
G1 X118.334 Y104.804
G1 X162.566 Y149.037 E1.82403
G1 X162.033 Y149.037
G1 X117.904 Y104.907 E1.81979
G1 X117.432 Y104.97
G1 X161.499 Y149.037 E1.81723
G1 X160.966 Y149.037
G1 X158.644 Y146.714 E.09576
G1 X159.196 Y147.799
G1 X160.433 Y149.037 E.05102
G1 X159.9 Y149.037
G1 X159.34 Y148.477 E.02309
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X159.9 Y149.037 E-.09029
G1 X160.433 Y149.037 E-.06079
M73 P59 R11
G1 X159.956 Y148.56 E-.07692
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.918 J-.799 P1  F28800
G1 X156.372 Y144.442 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X116.961 Y105.032 E1.6252
G1 X116.49 Y105.094
G1 X155.283 Y143.886 E1.59972
G1 X154.607 Y143.744
G1 X116.019 Y105.156 E1.59128
G1 X115.485 Y105.155
G1 X153.973 Y143.643 E1.58716
G1 X153.339 Y143.542
G1 X114.871 Y105.074 E1.58634
G1 X114.256 Y104.993
G1 X152.847 Y143.584 E1.59141
G1 X152.387 Y143.657
G1 X113.642 Y104.912 E1.59776
G1 X112.878 Y104.681
G1 X151.927 Y143.73 E1.61029
M73 P59 R10
G1 X151.467 Y143.803
G1 X111.969 Y104.305 E1.62882
G1 X111.014 Y103.884
G1 X151.067 Y143.937 E1.65172
G1 X150.714 Y144.117
G1 X104.23 Y97.633 E1.91691
G1 X104.168 Y98.104
G1 X150.361 Y144.298 E1.90492
G1 X150.008 Y144.478
G1 X104.071 Y98.541 E1.89433
G1 X103.915 Y98.918
G1 X149.655 Y144.658 E1.8862
G1 X149.351 Y144.887
G1 X103.759 Y99.296 E1.88009
G1 X103.603 Y99.673
G1 X149.084 Y145.153 E1.87551
G1 X148.817 Y145.42
G1 X103.447 Y100.05 E1.87094
G1 X103.291 Y100.427
G1 X148.55 Y145.686 E1.86637
G1 X148.283 Y145.953
G1 X103.13 Y100.799 E1.86203
G1 X102.898 Y101.101
G1 X148.044 Y146.246 E1.86169
G1 X147.863 Y146.599
G1 X102.667 Y101.402 E1.86382
G1 X102.435 Y101.704
G1 X147.683 Y146.952 E1.86595
G1 X147.503 Y147.306
G1 X102.203 Y102.006 E1.86807
G1 X101.972 Y102.307
G1 X147.323 Y147.659 E1.8702
G1 X147.176 Y148.045
G1 X101.74 Y102.609 E1.87369
G1 X101.485 Y102.887
G1 X147.104 Y148.506 E1.8812
G1 X147.031 Y148.966
G1 X145.349 Y147.284 E.06936
G1 X145.772 Y148.24
G1 X146.568 Y149.037 E.03284
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X145.772 Y148.24 E-.12839
G1 X145.418 Y147.441 E-.09961
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.874 J-.846 P1  F28800
G1 X142.769 Y144.705 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X101.184 Y103.119 E1.71491
G1 X100.882 Y103.35
M73 P60 R10
G1 X141.814 Y144.282 E1.68793
G1 X141.18 Y144.182
G1 X100.58 Y103.582 E1.67427
G1 X100.278 Y103.813
G1 X140.547 Y144.082 E1.6606
G1 X139.99 Y144.058
G1 X99.976 Y104.045 E1.65007
G1 X99.675 Y104.276
G1 X139.529 Y144.131 E1.64352
G1 X139.069 Y144.204
G1 X99.329 Y104.464 E1.63878
G1 X98.952 Y104.621
G1 X138.608 Y144.277 E1.63533
G1 X138.205 Y144.406
G1 X98.575 Y104.777 E1.63422
G1 X98.198 Y104.933
G1 X137.851 Y144.586 E1.63519
G1 X137.498 Y144.766
G1 X97.821 Y105.089 E1.63618
G1 X97.444 Y105.245
G1 X137.145 Y144.946 E1.63716
G1 X136.791 Y145.126
G1 X97.04 Y105.374 E1.63927
G1 X96.568 Y105.436
G1 X136.518 Y145.386 E1.64743
G1 X136.251 Y145.652
G1 X96.097 Y105.498 E1.65587
G1 X95.626 Y105.56
G1 X135.985 Y145.919 E1.66432
G1 X135.718 Y146.186
G1 X95.154 Y105.622 E1.67276
G1 X94.683 Y105.684
G1 X135.459 Y146.46 E1.68149
G1 X135.279 Y146.813
G1 X94.084 Y105.619 E1.69876
G1 X93.47 Y105.538
G1 X135.099 Y147.166 E1.71665
G1 X134.919 Y147.519
G1 X92.857 Y105.457 E1.73455
G1 X92.243 Y105.377
G1 X134.739 Y147.873 E1.75244
G1 X134.61 Y148.277
G1 X91.408 Y105.075 E1.78157
G1 X90.496 Y104.697
G1 X134.537 Y148.738 E1.81615
G1 X134.303 Y149.037
G1 X132.904 Y147.638 E.05767
G1 X133.244 Y148.511
G1 X133.769 Y149.037 E.02166
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
M73 P61 R10
G1 X133.244 Y148.511 E-.0847
G1 X132.904 Y147.638 E-.1068
G1 X133.131 Y147.865 E-.0365
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.861 J-.861 P1  F28800
G1 X130.346 Y145.08 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X89.384 Y104.118 E1.6892
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X90.798 Y105.532 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.983 J-.717 P1  F28800
G1 X85.034 Y97.635 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X84.085 Y96.686 E.03916
G1 X83.551 Y96.686
G1 X85.115 Y98.249 E.06448
G1 X85.417 Y99.085
G1 X83.018 Y96.686 E.09894
G1 X82.485 Y96.686
G1 X85.795 Y99.995 E.13649
G1 X86.368 Y101.102
G1 X82.184 Y96.918 E.17257
G1 X82.184 Y97.451
G1 X129.473 Y144.74 E1.95009
G1 X128.839 Y144.64
G1 X82.184 Y97.984 E1.92396
G1 X82.184 Y98.518
G1 X128.206 Y144.539 E1.89783
G1 X127.723 Y144.59
G1 X89.831 Y106.698 E1.56257
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X91.245 Y108.112 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.384 J-1.155 P1  F28800
G1 X90.446 Y107.847 Z1.8
M73 P62 R10
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X127.262 Y144.663 E1.51821
G1 X126.802 Y144.735
G1 X91.024 Y108.957 E1.4754
G1 X91.198 Y109.665
G1 X126.373 Y144.839 E1.45051
G1 X126.019 Y145.019
G1 X91.373 Y110.373 E1.42873
G1 X91.547 Y111.08
G1 X125.665 Y145.199 E1.40696
G1 X125.312 Y145.378
G1 X91.615 Y111.682 E1.38956
G1 X91.615 Y112.215
G1 X124.965 Y145.565 E1.37527
G1 X124.699 Y145.832
G1 X91.615 Y112.748 E1.36429
G1 X91.615 Y113.282
G1 X124.432 Y146.099 E1.3533
G1 X124.166 Y146.366
G1 X91.615 Y113.815 E1.34232
G1 X91.516 Y114.249
G1 X123.899 Y146.632 E1.33542
G1 X123.689 Y146.956
G1 X91.411 Y114.677 E1.3311
G1 X91.305 Y115.105
G1 X123.509 Y147.309 E1.32802
G1 X123.329 Y147.662
G1 X91.2 Y115.533 E1.32494
G1 X91.094 Y115.96
G1 X123.149 Y148.015 E1.32185
G1 X123.016 Y148.416
G1 X90.967 Y116.366 E1.32166
G1 X90.783 Y116.716
G1 X122.944 Y148.876 E1.32623
G1 X122.571 Y149.037
G1 X121.59 Y148.056 E.04043
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.571 Y149.037 E-.15808
G1 X122.944 Y148.876 E-.04628
G1 X122.797 Y148.73 E-.02364
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.794 J-.922 P1  F28800
G1 X118.956 Y145.422 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X90.6 Y117.065 E1.16934
G1 X90.416 Y117.415
G1 X118.192 Y145.191 E1.14541
G1 X117.557 Y145.089
G1 X90.233 Y117.765 E1.12679
G1 X90.049 Y118.115
G1 X116.985 Y145.051 E1.11078
G1 X116.525 Y145.124
G1 X89.866 Y118.464 E1.09939
G1 X89.616 Y118.748
G1 X116.066 Y145.198 E1.09072
G1 X115.618 Y145.283
G1 X89.366 Y119.031 E1.08258
G1 X89.115 Y119.314
G1 X115.265 Y145.463 E1.07835
G1 X114.911 Y145.643
G1 X88.864 Y119.596 E1.07412
G1 X88.614 Y119.879
G1 X114.558 Y145.823 E1.06989
G1 X114.231 Y146.029
G1 X88.363 Y120.162 E1.06672
G1 X88.087 Y120.419
G1 X113.964 Y146.296 E1.06709
M73 P62 R9
G1 X113.697 Y146.562
G1 X87.772 Y120.637 E1.06909
G1 X87.456 Y120.855
G1 X113.43 Y146.828 E1.0711
G1 X113.188 Y147.119
G1 X87.141 Y121.072 E1.07413
G1 X86.825 Y121.29
G1 X113.008 Y147.473 E1.07972
M73 P63 R9
G1 X112.828 Y147.826
G1 X86.51 Y121.508 E1.08532
G1 X86.194 Y121.725
G1 X112.648 Y148.18 E1.09091
G1 X112.519 Y148.583
G1 X85.815 Y121.88 E1.1012
G1 X85.429 Y122.027
G1 X112.439 Y149.037 E1.11383
G1 X111.905 Y149.037
G1 X110.832 Y147.963 E.04426
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.905 Y149.037 E-.17303
G1 X112.388 Y149.037 E-.05497
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.796 J-.921 P1  F28800
G1 X108.829 Y145.96 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X85.042 Y122.173 E.98091
G1 X84.656 Y122.32
G1 X108.024 Y145.689 E.96365
G1 X107.391 Y145.589
G1 X84.269 Y122.467 E.9535
G1 X83.883 Y122.614
G1 X87.439 Y126.17 E.14666
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X86.025 Y124.756 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.215 J.065 P1  F28800
G1 X86.055 Y125.32 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X83.419 Y122.684 E.1087
G1 X82.944 Y122.741
G1 X85.195 Y124.993 E.09286
G1 X84.336 Y124.667
G1 X82.468 Y122.799 E.07701
G1 X82.185 Y123.049
G1 X83.616 Y124.48 E.059
G1 X83.009 Y124.406
G1 X82.185 Y123.583 E.03397
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X83.009 Y124.406 E-.13281
G1 X83.616 Y124.48 E-.06969
G1 X83.458 Y124.322 E-.0255
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.693 J1 P1  F28800
G1 X90.407 Y129.138 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X106.822 Y145.553 E.67694
G1 X106.361 Y145.626
G1 X90.996 Y130.26 E.63365
G1 X91.516 Y131.314
G1 X105.901 Y145.698 E.59319
G1 X105.49 Y145.821
G1 X91.69 Y132.021 E.56908
G1 X91.864 Y132.729
G1 X105.137 Y146.001 E.54731
G1 X104.783 Y146.18
G1 X92.039 Y133.436 E.52555
G1 X92.111 Y134.042
G1 X104.433 Y146.364 E.50814
G1 X104.167 Y146.631
G1 X92.111 Y134.575 E.49716
G1 X92.111 Y135.108
G1 X103.901 Y146.898 E.48618
G1 X103.635 Y147.165
G1 X92.111 Y135.642 E.4752
G1 X92.111 Y136.175
G1 X103.407 Y147.471 E.46581
M73 P64 R9
G1 X103.227 Y147.824
G1 X92.039 Y136.636 E.46135
G1 X91.934 Y137.064
G1 X103.046 Y148.177 E.45826
G1 X102.869 Y148.533
G1 X91.828 Y137.492 E.45529
G1 X91.723 Y137.92
G1 X102.796 Y148.993 E.45662
G1 X102.306 Y149.037
G1 X101.373 Y148.103 E.03848
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X102.306 Y149.037 E-.15045
G1 X102.796 Y148.993 E-.05602
G1 X102.662 Y148.859 E-.02153
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.769 J-.943 P1  F28800
G1 X99.775 Y146.505 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X91.618 Y138.348 E.33638
G1 X91.512 Y138.776
G1 X98.902 Y146.165 E.30473
G1 X98.268 Y146.064
G1 X91.347 Y139.144 E.28537
G1 X91.164 Y139.494
G1 X97.739 Y146.069 E.27113
G1 X97.279 Y146.142
G1 X90.98 Y139.843 E.25974
G1 X90.797 Y140.193
G1 X96.822 Y146.219 E.24847
G1 X96.469 Y146.399
G1 X90.613 Y140.543 E.24147
G1 X90.43 Y140.893
G1 X96.116 Y146.579 E.23448
G1 X95.763 Y146.759
G1 X90.236 Y141.232 E.22792
G1 X89.985 Y141.515
G1 X95.496 Y147.026 E.22726
G1 X95.229 Y147.292
G1 X89.735 Y141.797 E.2266
G1 X89.484 Y142.08
G1 X94.963 Y147.559 E.22594
G1 X94.767 Y147.897
G1 X89.233 Y142.363 E.22822
G1 X88.983 Y142.645
G1 X94.587 Y148.25 E.23113
G1 X94.407 Y148.603
G1 X88.732 Y142.928 E.23404
G1 X88.466 Y143.195
G1 X94.307 Y149.037 E.2409
G1 X93.774 Y149.037
G1 X93.129 Y148.391 E.02661
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.774 Y149.037 E-.10403
G1 X94.307 Y149.037 E-.06079
G1 X93.916 Y148.645 E-.06318
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.739 J-.967 P1  F28800
G1 X91.651 Y146.913 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X88.15 Y143.413 E.14434
G1 X87.835 Y143.631
G1 X90.834 Y146.63 E.12367
G1 X90.201 Y146.529
G1 X87.519 Y143.848 E.11056
G1 X87.204 Y144.066
G1 X89.735 Y146.597 E.10435
G1 X89.274 Y146.669
G1 X86.889 Y144.284 E.09836
G1 X86.573 Y144.502
G1 X88.891 Y146.82 E.0956
G1 X88.538 Y147
G1 X86.227 Y144.689 E.09529
G1 X85.841 Y144.836
G1 X88.193 Y147.189 E.09701
G1 X87.927 Y147.455
G1 X85.454 Y144.983 E.10196
G1 X85.068 Y145.13
G1 X87.66 Y147.722 E.1069
G1 X87.422 Y148.017
G1 X84.681 Y145.276 E.11302
G1 X84.295 Y145.423
G1 X87.242 Y148.371 E.12154
G1 X87.062 Y148.724
G1 X83.898 Y145.56 E.13048
G1 X83.423 Y145.618
G1 X86.842 Y149.037 E.14099
G1 X86.308 Y149.037
G1 X82.947 Y145.675 E.13861
G1 X82.471 Y145.733
G1 X85.775 Y149.037 E.13624
G1 X85.242 Y149.037
G1 X82.185 Y145.98 E.12605
G1 X82.185 Y146.513
G1 X84.709 Y149.037 E.10406
G1 X84.175 Y149.037
G1 X82.185 Y147.046 E.08207
G1 X82.185 Y147.58
G1 X83.642 Y149.037 E.06008
G1 X83.109 Y149.037
G1 X82.185 Y148.113 E.03809
G1 X82.185 Y148.646
G1 X82.575 Y149.037 E.0161
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X82.185 Y148.646 E-.06293
G1 X82.185 Y148.113 E-.06079
G1 X82.832 Y148.76 E-.10428
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.217 J-.016 P1  F28800
G1 X82.184 Y99.051 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X87.54 Y104.406 E.22084
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X86.125 Y102.992 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.15 J-.399 P1  F28800
G1 X85.988 Y103.388 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S500
G1 F6000
G1 X82.184 Y99.585 E.15685
G1 X82.184 Y100.118
G1 X85.129 Y103.063 E.12143
G1 X84.27 Y102.737
G1 X82.185 Y100.651 E.08601
G1 X82.185 Y101.185
G1 X83.535 Y102.535 E.05566
G1 X82.928 Y102.461
G1 X82.185 Y101.718 E.03063
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X82.928 Y102.461 E-.11974
G1 X83.535 Y102.535 E-.06971
G1 X83.295 Y102.295 E-.03856
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.228 J1.195 P1  F28800
G1 X104.122 Y98.325 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.121055
G1 F15000
G1 X104.148 Y98.408 E.00052
G1 X104.092 Y98.501 E.00066
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X104.148 Y98.408 E-.12711
G1 X104.122 Y98.325 E-.10089
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.773 J.94 P1  F28800
G1 X110.953 Y103.944 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.236845
G1 F15000
G1 X110.639 Y103.668 E.00627
; LINE_WIDTH: 0.187287
G1 X110.324 Y103.392 E.00467
; LINE_WIDTH: 0.137729
G1 X110.01 Y103.116 E.00307
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X110.324 Y103.392 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.507 J1.106 P1  F28800
G1 X124.992 Y96.667 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.12576
G1 F15000
G1 X124.982 Y96.85 E.00118
G1 X125.01 Y96.933 E.00056
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X124.982 Y96.85 E-.07323
G1 X124.992 Y96.667 E-.15477
; WIPE_END
M73 P65 R9
G1 E-.012 F1800
G17
G3 Z1.8 I-.755 J.955 P1  F28800
G1 X127.034 Y98.28 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X126.953 Y98.159 E.00051
; LINE_WIDTH: 0.136005
G1 X126.879 Y98.032 E.00106
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X126.953 Y98.159 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.118 J.481 P1  F28800
G1 X127.79 Y100.103 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X127.712 Y99.986 E.00049
; LINE_WIDTH: 0.1289
G1 X127.634 Y99.87 E.00093
; LINE_WIDTH: 0.16963
G1 X127.556 Y99.753 E.00138
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X127.634 Y99.87 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.766 J.946 P1  F28800
G1 X133.336 Y104.488 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.144533
G1 F15000
G1 X133.081 Y104.341 E.00231
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X133.336 Y104.488 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.581 J1.07 P1  F28800
G1 X145.701 Y97.775 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0943666
G1 F15000
G1 X145.837 Y97.639 E.00077
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X145.701 Y97.775 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.106 J.507 P1  F28800
G1 X146.579 Y99.694 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.088171
G1 F15000
G1 X146.491 Y99.567 E.00054
; LINE_WIDTH: 0.130105
G1 X146.403 Y99.44 E.00104
; LINE_WIDTH: 0.17204
G1 X146.315 Y99.313 E.00155
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X146.403 Y99.44 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.05 J.615 P1  F28800
G1 X147.301 Y100.976 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.200258
G1 F15000
G3 X146.764 Y100.296 I4.525 J-4.128 E.01056
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X147.301 Y100.976 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.826 J.893 P1  F28800
G1 X149.244 Y102.774 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.228392
G1 F15000
G1 X149.044 Y102.612 E.00369
; LINE_WIDTH: 0.181651
G1 X148.844 Y102.451 E.00276
; LINE_WIDTH: 0.134911
G1 X148.644 Y102.29 E.00183
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X148.844 Y102.451 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.76 J.95 P1  F28800
G1 X159.277 Y110.799 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.102036
G1 F15000
G1 X159.07 Y110.5 E.00166
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X159.277 Y110.799 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.914 J.804 P1  F28800
G1 X162.29 Y114.222 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.213948
G1 F15000
G1 X162.109 Y114.096 E.00291
; LINE_WIDTH: 0.166641
G1 X161.66 Y113.734 E.00552
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X162.109 Y114.096 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.539 J1.091 P1  F28800
G1 X163.272 Y114.67 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.213949
G1 F15000
G1 X163.145 Y114.582 E.00205
; LINE_WIDTH: 0.172023
G1 X163.018 Y114.494 E.00154
; LINE_WIDTH: 0.130097
G1 X162.891 Y114.406 E.00104
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X163.018 Y114.494 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.216 J-.034 P1  F28800
G1 X162.567 Y130.497 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.213872
G1 F15000
G1 X162.473 Y130.432 E.0015
; LINE_WIDTH: 0.168055
G3 X161.942 Y130.014 I2.668 J-3.944 E.00655
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X162.473 Y130.432 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.524 J1.099 P1  F28800
G1 X163.547 Y130.944 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.213874
G1 F15000
G1 X163.42 Y130.856 E.00204
; LINE_WIDTH: 0.171973
G1 X163.293 Y130.768 E.00154
; LINE_WIDTH: 0.130072
G1 X163.167 Y130.68 E.00104
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X163.293 Y130.768 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.189 J-.261 P1  F28800
G1 X160.596 Y143.04 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881709
G1 F15000
G1 X160.518 Y142.933 E.00047
; LINE_WIDTH: 0.122776
G1 X160.402 Y142.773 E.00121
; LINE_WIDTH: 0.170501
G1 X160.287 Y142.614 E.00194
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X160.402 Y142.773 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.579 J-1.07 P1  F28800
G1 X156.861 Y144.691 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881701
G1 F15000
G1 X156.718 Y144.588 E.00062
; LINE_WIDTH: 0.13156
G1 X156.576 Y144.484 E.00121
; LINE_WIDTH: 0.174951
G1 X156.433 Y144.381 E.0018
G1 X155.772 Y144.136 F28800
; LINE_WIDTH: 0.0881702
G1 F15000
G1 X155.629 Y144.032 E.00062
; LINE_WIDTH: 0.13156
G1 X155.487 Y143.928 E.00121
; LINE_WIDTH: 0.174951
G1 X155.344 Y143.825 E.0018
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X155.487 Y143.928 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.378 J-1.157 P1  F28800
G1 X145.411 Y147.223 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.218257
G1 F15000
G1 X145.307 Y147.081 E.00238
; LINE_WIDTH: 0.174895
G1 X145.204 Y146.939 E.00179
; LINE_WIDTH: 0.131533
G1 X145.101 Y146.797 E.0012
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X145.204 Y146.939 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.869 J-.852 P1  F28800
G1 X143.257 Y144.953 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881707
G1 F15000
G1 X143.115 Y144.85 E.00061
; LINE_WIDTH: 0.131533
G1 X142.973 Y144.746 E.0012
; LINE_WIDTH: 0.174894
G1 X142.831 Y144.643 E.00179
G1 X142.17 Y144.399 F28800
; LINE_WIDTH: 0.0881706
G1 F15000
G1 X142.092 Y144.342 E.00034
; LINE_WIDTH: 0.131275
G2 X141.887 Y144.208 I-.935 J1.205 E.00167
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X142.092 Y144.342 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.106 J-1.212 P1  F28800
G1 X130.833 Y145.328 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881708
G1 F15000
G1 X130.692 Y145.225 E.00061
; LINE_WIDTH: 0.131518
G1 X130.55 Y145.122 E.0012
; LINE_WIDTH: 0.174866
G1 X130.408 Y145.019 E.00179
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X130.55 Y145.122 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.374 J-1.158 P1  F28800
G1 X121.652 Y147.995 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.218228
G1 F15000
G1 X121.549 Y147.853 E.00238
; LINE_WIDTH: 0.174875
G1 X121.445 Y147.711 E.00179
; LINE_WIDTH: 0.131523
G1 X121.342 Y147.569 E.0012
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X121.445 Y147.711 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.869 J-.852 P1  F28800
G1 X119.443 Y145.669 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881699
G1 F15000
G1 X119.301 Y145.566 E.00061
; LINE_WIDTH: 0.131522
G1 X119.159 Y145.463 E.0012
; LINE_WIDTH: 0.174875
G1 X119.017 Y145.36 E.00179
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X119.159 Y145.463 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.083 J-1.214 P1  F28800
G1 X100.263 Y146.754 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881699
G1 F15000
G1 X100.121 Y146.65 E.00062
; LINE_WIDTH: 0.131544
G1 X99.979 Y146.547 E.00121
; LINE_WIDTH: 0.174918
G1 X99.836 Y146.443 E.0018
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X99.979 Y146.547 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.309 J-1.177 P1  F28800
G1 X93.19 Y148.33 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.218432
G1 F15000
G1 X93.086 Y148.187 E.0024
; LINE_WIDTH: 0.175012
G1 X92.983 Y148.044 E.0018
; LINE_WIDTH: 0.131591
G1 X92.879 Y147.901 E.00121
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X92.983 Y148.044 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.149 J-1.208 P1  F28800
G1 X87.03 Y148.777 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.109571
G1 F15000
G2 X87.011 Y148.939 I.079 J.092 E.00092
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X86.984 Y148.857 E-.1094
G1 X87.03 Y148.777 E-.1186
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.189 J.258 P1  F28800
G1 X91.057 Y130.199 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.219497
G1 F15000
G1 X90.949 Y130.052 E.0025
; LINE_WIDTH: 0.175722
G1 X90.841 Y129.904 E.00188
; LINE_WIDTH: 0.131946
G1 X90.732 Y129.757 E.00126
G1 X90.468 Y129.076 F28800
; LINE_WIDTH: 0.219497
G1 F15000
G1 X90.391 Y128.972 E.00178
; LINE_WIDTH: 0.172127
G2 X89.872 Y128.337 I-5.523 J3.983 E.0082
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X90.391 Y128.972 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.877 J-.844 P1  F28800
G1 X88.2 Y126.694 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881701
G1 F15000
G1 X87.967 Y126.499 E.00106
; LINE_WIDTH: 0.136034
G1 X87.733 Y126.304 E.00219
; LINE_WIDTH: 0.183897
G1 X87.5 Y126.11 E.00331
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X87.733 Y126.304 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.654 J-1.026 P1  F28800
G1 X86.477 Y125.504 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.098825
G1 F15000
G2 X86.132 Y125.243 I-2.31 J2.694 E.00187
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X86.477 Y125.504 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.173 J.325 P1  F28800
G1 X91.087 Y108.894 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.215368
G1 F15000
G1 X90.982 Y108.751 E.00237
; LINE_WIDTH: 0.172969
G1 X90.877 Y108.609 E.00178
; LINE_WIDTH: 0.13057
G1 X90.772 Y108.466 E.0012
G1 X90.508 Y107.785 F28800
; LINE_WIDTH: 0.219482
G1 F15000
G1 X90.399 Y107.638 E.00249
; LINE_WIDTH: 0.175712
G1 X90.291 Y107.491 E.00188
; LINE_WIDTH: 0.131941
G1 X90.183 Y107.344 E.00126
G1 X89.891 Y106.638 F28800
; LINE_WIDTH: 0.244122
G1 F15000
G1 X89.334 Y106.046 E.01264
; LINE_WIDTH: 0.197455
G1 X88.777 Y105.455 E.00971
; LINE_WIDTH: 0.150367
G1 X88.214 Y104.858 E.00681
; LINE_WIDTH: 0.104567
G1 X88.01 Y104.688 E.00127
; LINE_WIDTH: 0.146977
G1 X87.805 Y104.517 E.00215
; LINE_WIDTH: 0.189388
G1 X87.6 Y104.346 E.00302
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X87.805 Y104.517 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.252 J1.19 P1  F28800
G1 X92.176 Y105.444 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.171118
G1 F15000
G3 X91.898 Y105.291 I1.046 J-2.236 E.00314
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X92.176 Y105.444 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.118 J1.211 P1  F28800
G1 X94.663 Y105.685 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0923415
G1 F15000
G1 X94.489 Y105.757 E.00072
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X94.663 Y105.685 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.285 J-1.183 P1  F28800
G1 X86.575 Y103.738 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.0881702
G1 F15000
G1 X86.382 Y103.577 E.00088
; LINE_WIDTH: 0.148569
G2 X86.057 Y103.319 I-2.271 J2.528 E.0034
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X86.382 Y103.577 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.487 J1.115 P1  F28800
G1 X107.884 Y112.963 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X107.884 Y111.911 E.00183
G2 X107.734 Y111.603 I-.872 J.235 E.0006
G1 X107.734 Y113.067 E.00255
G3 X107.584 Y113.171 I-.45 J-.489 E.00032
G1 X107.584 Y111.502 E.0029
G1 X107.557 Y111.499 E.00005
G2 X107.434 Y111.565 I.082 J.302 E.00024
G1 X107.434 Y113.109 E.00269
G3 X107.284 Y112.875 I.353 J-.391 E.00049
G1 X107.284 Y111.639 E.00215
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X107.284 Y112.875 E-.14098
G1 X107.359 Y113.026 E-.01928
G1 X107.434 Y113.109 E-.0127
G1 X107.434 Y112.627 E-.05504
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.163 J.359 P1  F28800
G1 X107.884 Y114.083 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X107.884 Y114.636 E.00096
G1 X107.813 Y114.901 E.00048
G1 X107.734 Y115.03 E.00026
G1 X107.734 Y113.941 E.00189
G2 X107.584 Y113.83 I-.355 J.32 E.00033
G1 X107.584 Y115.14 E.00228
G3 X107.434 Y115.078 I-.001 J-.209 E.00029
G1 X107.434 Y113.895 E.00206
G2 X107.284 Y114.177 I.419 J.404 E.00056
G1 X107.284 Y114.989 E.00141
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X107.284 Y114.177 E-.0926
G1 X107.313 Y114.068 E-.01279
G1 X107.434 Y113.895 E-.02413
G1 X107.434 Y114.759 E-.09848
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.999 J-.695 P1  F28800
G1 X98.884 Y127.039 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X98.884 Y124.314 E.00474
G1 X98.734 Y123.942 F28800
G1 F3600
G1 X98.734 Y127.274 E.0058
G3 X98.584 Y127.48 I-.404 J-.137 E.00045
G1 X98.584 Y123.876 E.00627
G2 X98.434 Y123.833 I-.132 J.177 E.00028
G1 X98.434 Y127.523 E.00642
G3 X98.284 Y127.447 I.023 J-.231 E.0003
G1 X98.284 Y123.922 E.00613
G2 X98.134 Y124.164 I1.197 J.91 E.0005
G1 X98.134 Y127.347 E.00554
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.134 Y125.347 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.519 J1.101 P1  F28800
G1 X124.084 Y137.582 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X124.084 Y136.912 E.00117
G2 X123.934 Y136.652 I-.487 J.108 E.00053
G1 X123.934 Y137.688 E.0018
G1 X123.784 Y137.826 E.00035
G1 X123.784 Y136.515 E.00228
G2 X123.634 Y136.428 I-.222 J.21 E.00031
G1 X123.634 Y137.902 E.00256
G3 X123.484 Y137.957 I-.168 J-.224 E.00028
G1 X123.484 Y136.375 E.00275
G2 X123.334 Y136.353 I-.11 J.234 E.00027
G1 X123.334 Y137.981 E.00283
G3 X123.184 Y137.979 I-.072 J-.247 E.00026
G1 X123.184 Y136.347 E.00284
G2 X123.034 Y136.381 I-.019 J.267 E.00027
G1 X123.034 Y137.959 E.00275
G3 X122.884 Y137.9 I.022 J-.277 E.00028
G1 X122.884 Y136.427 E.00256
G1 X122.734 Y136.517 E.0003
G1 X122.734 Y137.816 E.00226
G1 X122.584 Y137.684 E.00035
G1 X122.584 Y136.658 E.00179
G2 X122.434 Y136.913 I.331 J.367 E.00052
G1 X122.434 Y137.576 E.00115
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.434 Y136.913 E-.07557
G1 X122.522 Y136.725 E-.0236
G1 X122.584 Y136.658 E-.01043
G1 X122.584 Y137.684 E-.11696
G1 X122.593 Y137.692 E-.00144
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.025 J.657 P1  F28800
G1 X123.934 Y139.784 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X123.934 Y139.114 E.00117
G1 X123.82 Y138.911 E.00041
G1 X123.784 Y138.878 E.00009
G1 X123.784 Y139.874 E.00173
G3 X123.634 Y139.993 I-.267 J-.182 E.00034
G1 X123.634 Y138.753 E.00216
G1 X123.484 Y138.681 E.00029
G1 X123.484 Y140.06 E.0024
G3 X123.334 Y140.094 I-.131 J-.234 E.00027
G1 X123.334 Y138.654 E.00251
G2 X123.184 Y138.647 I-.095 J.431 E.00026
G1 X123.184 Y140.101 E.00253
G1 X123.034 Y140.063 E.00027
G1 X123.034 Y138.684 E.0024
G2 X122.884 Y138.754 I.037 J.276 E.00029
G1 X122.884 Y139.993 E.00216
G3 X122.734 Y139.872 I.119 J-.302 E.00034
G1 X122.734 Y138.876 E.00173
G2 X122.584 Y139.112 I.318 J.368 E.00049
G1 X122.584 Y139.795 E.00119
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.584 Y139.112 E-.07785
G1 X122.652 Y138.967 E-.01823
G1 X122.734 Y138.876 E-.01395
G1 X122.734 Y139.872 E-.11358
G1 X122.759 Y139.901 E-.00439
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.057 J1.216 P1  F28800
G1 X132.184 Y139.46 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X132.184 Y138.231 E.00214
G1 X132.034 Y138.323 E.00031
G1 X132.034 Y139.584 E.00219
G3 X131.884 Y139.764 I-.368 J-.153 E.00041
G1 X131.884 Y138.414 E.00235
G1 X131.856 Y138.431 E.00006
G1 X131.734 Y138.283 E.00033
G1 X131.734 Y139.888 E.00279
G3 X131.584 Y139.947 I-.206 J-.301 E.00028
G1 X131.584 Y138.153 E.00312
G2 X131.434 Y138.072 I-.206 J.202 E.0003
G1 X131.434 Y139.989 E.00334
G1 X131.284 Y139.994 E.00026
G1 X131.284 Y138.035 E.00341
G1 X131.134 Y138.038 E.00026
G1 X131.134 Y139.988 E.00339
G1 X130.984 Y139.948 E.00027
G1 X130.984 Y138.067 E.00327
G2 X130.834 Y138.141 I.055 J.304 E.00029
G1 X130.834 Y139.863 E.003
G3 X130.684 Y139.729 I.148 J-.316 E.00035
G1 X130.684 Y138.27 E.00254
G2 X130.534 Y138.501 I.291 J.353 E.00049
G1 X130.534 Y139.658 E.00201
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X130.534 Y138.501 E-.13191
G1 X130.579 Y138.393 E-.0134
G1 X130.684 Y138.27 E-.01836
G1 X130.684 Y138.835 E-.06434
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.22 J1.197 P1  F28800
G1 X141.334 Y136.875 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X141.334 Y139.483 E.00454
G1 X141.184 Y139.903 F28800
G1 F3600
G1 X141.184 Y136.616 E.00572
G1 X141.071 Y136.407 E.00041
G1 X141.034 Y136.372 E.00009
G1 X141.034 Y139.985 E.00629
G3 X140.884 Y139.932 I-.056 J-.079 E.00033
G1 X140.884 Y136.422 E.00611
G2 X140.734 Y136.748 I.605 J.476 E.00063
G1 X140.734 Y139.797 E.00531
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.734 Y137.797 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.509 J1.105 P1  F28800
G1 X154.684 Y131.376 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X154.684 Y132.564 E.00207
G3 X154.534 Y132.751 I-.582 J-.312 E.00042
G1 X154.534 Y131.275 E.00257
G1 X154.384 Y131.055 E.00046
G1 X154.384 Y132.816 E.00306
G3 X154.234 Y132.818 I-.083 J-.545 E.00026
G1 X154.234 Y130.835 E.00345
G1 X154.084 Y130.615 E.00046
G1 X154.084 Y132.754 E.00372
G3 X153.934 Y132.594 I.476 J-.596 E.00038
G1 X153.934 Y130.394 E.00383
G3 X153.784 Y130.158 I1.808 J-1.311 E.00049
G1 X153.784 Y131.884 E.003
G1 X153.634 Y131.884 E.00026
G1 X153.634 Y129.905 E.00344
G1 X153.484 Y129.652 E.00051
G1 X153.484 Y131.885 E.00389
G1 X153.334 Y131.886 E.00026
G1 X153.334 Y129.152 E.00476
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X153.334 Y131.152 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.196 J.223 P1  F28800
G1 X154.684 Y123.897 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X154.684 Y122.972 E.00161
G2 X154.534 Y122.784 I-.344 J.12 E.00043
G1 X154.534 Y123.964 E.00205
G3 X154.384 Y124.023 I-.179 J-.235 E.00028
G1 X154.384 Y122.693 E.00231
G2 X154.234 Y122.661 I-.133 J.257 E.00027
G1 X154.234 Y124.077 E.00246
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X154.234 Y122.661 E-.16142
G1 X154.384 Y122.693 E-.01748
G1 X154.384 Y123.123 E-.0491
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.151 J.395 P1  F28800
G1 X154.834 Y121.812 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X154.834 Y120.847 E.00168
G2 X154.684 Y120.52 I-.718 J.132 E.00063
G1 X154.684 Y121.919 E.00243
G3 X154.534 Y122.042 I-.363 J-.29 E.00034
G1 X154.534 Y120.382 E.00289
G2 X154.384 Y120.334 I-.184 J.32 E.00028
G1 X154.384 Y122.069 E.00302
G3 X154.234 Y122.038 I-.025 J-.259 E.00027
G1 X154.234 Y120.355 E.00293
G2 X154.084 Y120.472 I.164 J.366 E.00033
G1 X154.084 Y123.889 E.00595
G1 X154.061 Y123.865 E.00006
G3 X153.934 Y123.502 I.604 J-.415 E.00068
G1 X153.934 Y120.593 E.00506
G1 X153.784 Y121.131 F28800
G1 F3600
G1 X153.784 Y123.184 E.00357
G1 X153.634 Y123.198 E.00026
G1 X153.634 Y121.236 E.00341
G1 X153.484 Y121.217 E.00026
G1 X153.484 Y123.213 E.00347
G1 X153.334 Y123.227 E.00026
G1 X153.334 Y121.13 E.00365
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X153.334 Y123.13 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.122 J1.211 P1  F28800
G1 X159.784 Y122.479 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X159.784 Y122.983 E.00088
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X159.784 Y122.479 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.756 J.954 P1  F28800
G1 X166.084 Y117.489 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X166.084 Y114.704 E.00485
G1 X165.934 Y114.682 E.00026
G1 X165.934 Y117.443 E.0048
G1 X165.784 Y117.464 E.00026
G1 X165.784 Y114.661 E.00488
G1 X165.634 Y114.639 E.00026
G1 X165.634 Y117.486 E.00495
G1 X165.484 Y117.507 E.00026
G1 X165.484 Y114.618 E.00503
G1 X165.334 Y114.596 E.00026
G1 X165.334 Y117.529 E.0051
G1 X165.184 Y117.551 E.00026
G1 X165.184 Y114.575 E.00518
G1 X165.034 Y114.553 E.00026
G1 X165.034 Y117.572 E.00525
G1 X164.884 Y117.594 E.00026
G1 X164.884 Y114.532 E.00533
G1 X164.734 Y114.51 E.00026
G1 X164.734 Y117.616 E.0054
G1 X164.584 Y117.637 E.00026
G1 X164.584 Y114.489 E.00548
G1 X164.434 Y114.468 E.00026
G1 X164.434 Y117.664 E.00556
G1 X164.284 Y117.733 E.00029
G1 X164.284 Y114.438 E.00573
G1 X164.134 Y114.37 E.00029
G1 X164.134 Y117.801 E.00597
G1 X163.984 Y117.869 E.00029
G1 X163.984 Y114.301 E.00621
G1 X163.834 Y114.233 E.00029
G1 X163.834 Y117.938 E.00645
G1 X163.684 Y118.006 E.00029
G1 X163.684 Y114.164 E.00668
G1 X163.534 Y114.096 E.00029
G1 X163.534 Y118.075 E.00692
G1 X163.384 Y118.143 E.00029
G1 X163.384 Y114.027 E.00716
G1 X163.234 Y113.959 E.00029
G1 X163.234 Y118.211 E.0074
G1 X163.084 Y118.28 E.00029
G1 X163.084 Y113.89 E.00764
G1 X162.934 Y113.821 E.00029
G1 X162.934 Y118.348 E.00788
G1 X162.784 Y118.417 E.00029
G1 X162.784 Y113.753 E.00811
G1 X162.634 Y113.684 E.00029
G1 X162.634 Y118.51 E.0084
G1 X162.484 Y118.64 E.00035
G1 X162.484 Y113.616 E.00874
G3 X162.334 Y113.51 I.105 J-.308 E.00032
G1 X162.334 Y118.77 E.00915
G1 X162.184 Y118.9 E.00035
G1 X162.184 Y113.38 E.0096
G1 X162.034 Y113.25 E.00035
G1 X162.034 Y119.029 E.01006
G1 X161.884 Y119.159 E.00035
G1 X161.884 Y113.12 E.01051
G1 X161.734 Y112.99 E.00035
G1 X161.734 Y119.289 E.01096
G1 X161.584 Y119.419 E.00035
G1 X161.584 Y112.86 E.01141
G1 X161.434 Y112.73 E.00035
G1 X161.434 Y119.549 E.01186
G1 X161.284 Y119.678 E.00035
G1 X161.284 Y112.599 E.01232
G1 X161.134 Y112.469 E.00035
G1 X161.134 Y119.88 E.01289
G1 X160.984 Y120.113 E.00048
G1 X160.984 Y112.339 E.01353
G3 X160.834 Y112.192 I.176 J-.329 E.00037
G1 X160.834 Y120.347 E.01419
G1 X160.684 Y120.581 E.00048
G1 X160.684 Y111.958 E.015
G1 X160.534 Y111.725 E.00048
G1 X160.534 Y120.814 E.01582
G1 X160.384 Y121.048 E.00048
G1 X160.384 Y111.491 E.01663
G1 X160.234 Y111.257 E.00048
G1 X160.234 Y121.448 E.01773
G1 X160.084 Y121.96 F28800
G1 F3600
G1 X160.084 Y111.024 E.01903
G1 X159.934 Y110.79 E.00048
G1 X159.934 Y122.472 E.02033
G1 X159.784 Y121.863 F28800
G1 F3600
G1 X159.784 Y110.398 E.01995
G1 X159.634 Y109.887 F28800
G1 F3600
G1 X159.634 Y121.788 E.02071
G1 X159.484 Y121.779 E.00026
G1 X159.484 Y110.094 E.02033
G1 X159.334 Y110.168 E.00029
M73 P66 R9
G1 X159.334 Y121.771 E.02019
G1 X159.184 Y121.763 E.00026
G1 X159.184 Y110.242 E.02004
G1 X159.034 Y110.316 E.00029
G1 X159.034 Y121.754 E.0199
G1 X158.884 Y121.746 E.00026
G1 X158.884 Y110.391 E.01976
G1 X158.734 Y110.465 E.00029
G1 X158.734 Y121.737 E.01961
G1 X158.584 Y121.729 E.00026
G1 X158.584 Y110.539 E.01947
G1 X158.434 Y110.613 E.00029
G1 X158.434 Y121.721 E.01933
G1 X158.284 Y121.712 E.00026
G1 X158.284 Y110.687 E.01918
G1 X158.134 Y110.762 E.00029
G1 X158.134 Y121.704 E.01904
G1 X157.984 Y121.696 E.00026
G1 X157.984 Y110.836 E.0189
G1 X157.834 Y110.91 E.00029
G1 X157.834 Y121.687 E.01875
G1 X157.684 Y121.679 E.00026
G1 X157.684 Y110.984 E.01861
G1 X157.534 Y111.058 E.00029
G1 X157.534 Y121.67 E.01846
G1 X157.384 Y121.662 E.00026
G1 X157.384 Y111.132 E.01832
G1 X157.234 Y111.207 E.00029
G1 X157.234 Y121.654 E.01818
G1 X157.084 Y121.645 E.00026
G1 X157.084 Y111.281 E.01803
G1 X156.934 Y111.355 E.00029
G1 X156.934 Y121.637 E.01789
G1 X156.784 Y121.629 E.00026
G1 X156.784 Y111.429 E.01775
G1 X156.634 Y111.503 E.00029
G1 X156.634 Y121.62 E.0176
G1 X156.484 Y121.612 E.00026
G1 X156.484 Y111.578 E.01746
G1 X156.334 Y111.652 E.00029
G1 X156.334 Y121.603 E.01732
G1 X156.184 Y121.595 E.00026
G1 X156.184 Y111.651 E.0173
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X156.184 Y113.651 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.079 J-.563 P1  F28800
G1 X150.484 Y102.737 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X150.484 Y102.987 E.00043
G1 X150.334 Y103.113 E.00034
G1 X150.334 Y102.721 E.00068
G1 X150.184 Y102.624 E.00031
G1 X150.184 Y103.238 E.00107
G1 X150.034 Y103.364 E.00034
G1 X150.034 Y102.528 E.00146
G1 X149.884 Y102.432 E.00031
G1 X149.884 Y103.49 E.00184
G1 X149.734 Y103.616 E.00034
G1 X149.734 Y102.335 E.00223
G1 X149.584 Y102.239 E.00031
G1 X149.584 Y103.742 E.00262
G1 X149.434 Y103.868 E.00034
G1 X149.434 Y102.142 E.003
G1 X149.284 Y102.046 E.00031
G1 X149.284 Y103.994 E.00339
G1 X149.134 Y104.119 E.00034
G1 X149.134 Y101.95 E.00378
G1 X148.984 Y101.853 E.00031
G1 X148.984 Y104.245 E.00416
G1 X148.834 Y104.371 E.00034
G1 X148.834 Y101.757 E.00455
G3 X148.684 Y101.6 I.194 J-.336 E.00038
G1 X148.684 Y104.497 E.00504
G1 X148.534 Y104.623 E.00034
G1 X148.534 Y101.428 E.00556
G1 X148.384 Y101.255 E.0004
G1 X148.384 Y104.749 E.00608
G1 X148.234 Y104.875 E.00034
G1 X148.234 Y101.082 E.0066
G1 X148.084 Y100.909 E.0004
G1 X148.084 Y105 E.00712
G1 X147.934 Y105.126 E.00034
G1 X147.934 Y100.736 E.00764
G1 X147.784 Y100.562 E.0004
G1 X147.784 Y105.252 E.00816
G1 X147.634 Y105.378 E.00034
G1 X147.634 Y100.389 E.00868
G1 X147.484 Y100.216 E.0004
G1 X147.484 Y105.504 E.0092
G1 X147.334 Y105.63 E.00034
G1 X147.334 Y100.023 E.00976
G1 X147.184 Y99.695 E.00063
G1 X147.184 Y105.756 E.01055
G1 X147.034 Y105.882 E.00034
G1 X147.034 Y99.367 E.01133
G1 X146.884 Y99.039 E.00063
G1 X146.884 Y106.007 E.01212
G1 X146.734 Y106.133 E.00034
G1 X146.734 Y98.711 E.01291
G1 X146.584 Y98.383 E.00063
G1 X146.584 Y106.259 E.0137
G1 X146.434 Y106.385 E.00034
G1 X146.434 Y97.585 E.01531
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X146.434 Y99.585 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.215 J-.06 P1  F28800
G1 X146.284 Y96.536 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X146.284 Y106.511 E.01735
G1 X146.134 Y106.637 E.00034
G1 X146.134 Y96.136 E.01827
G1 X145.984 Y96.136 E.00026
G1 X145.984 Y106.763 E.01849
G1 X145.834 Y106.888 E.00034
G1 X145.834 Y96.136 E.01871
G1 X145.684 Y96.136 E.00026
G1 X145.684 Y107.014 E.01893
G1 X145.534 Y107.14 E.00034
G1 X145.534 Y96.136 E.01915
G1 X145.384 Y96.136 E.00026
G1 X145.384 Y107.266 E.01937
G1 X145.234 Y107.392 E.00034
G1 X145.234 Y96.136 E.01958
G1 X145.084 Y96.136 E.00026
G1 X145.084 Y107.518 E.0198
G1 X144.934 Y107.644 E.00034
G1 X144.934 Y96.136 E.02002
M73 P66 R8
G1 X144.784 Y96.136 E.00026
G1 X144.784 Y107.769 E.02024
G1 X144.634 Y107.895 E.00034
G1 X144.634 Y96.136 E.02046
G1 X144.484 Y96.136 E.00026
G1 X144.484 Y108.021 E.02068
G1 X144.334 Y108.147 E.00034
G1 X144.334 Y96.136 E.0209
G1 X144.184 Y96.136 E.00026
G1 X144.184 Y108.273 E.02112
G1 X144.034 Y108.399 E.00034
G1 X144.034 Y96.136 E.02134
G1 X143.884 Y96.136 E.00026
G1 X143.884 Y108.525 E.02156
G1 X143.734 Y108.651 E.00034
G1 X143.734 Y96.069 E.02189
G1 X143.584 Y96.883 F28800
G1 F3600
G1 X143.584 Y108.776 E.02069
G1 X143.434 Y108.902 E.00034
G1 X143.434 Y98.174 E.01867
G1 X143.284 Y98.537 E.00068
G1 X143.284 Y109.028 E.01825
G1 X143.134 Y109.154 E.00034
G1 X143.134 Y98.899 E.01784
G1 X142.984 Y99.261 E.00068
G1 X142.984 Y109.28 E.01743
G1 X142.834 Y109.406 E.00034
G1 X142.834 Y99.624 E.01702
G1 X142.684 Y99.986 E.00068
G1 X142.684 Y109.532 E.01661
G1 X142.534 Y109.657 E.00034
G1 X142.534 Y100.187 E.01648
G1 X142.384 Y100.383 E.00043
G1 X142.384 Y109.783 E.01636
G1 X142.234 Y109.909 E.00034
G1 X142.234 Y100.578 E.01624
G1 X142.084 Y100.774 E.00043
G1 X142.084 Y110.123 E.01627
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X142.084 Y108.123 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.216 J.049 P1  F28800
G1 X142.234 Y111.862 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X142.234 Y112.973 E.00193
G1 X142.222 Y113.073 E.00018
G1 X142.084 Y113.371 E.00057
G1 X142.084 Y111.669 E.00296
G2 X141.934 Y111.478 I-.482 J.225 E.00043
G1 X141.932 Y113.5 E.00352
G3 X141.784 Y113.365 I.157 J-.322 E.00035
G1 X141.78 Y111.464 E.00331
G2 X141.634 Y111.612 I.132 J.277 E.00037
G1 X141.634 Y113.206 E.00277
G1 X141.484 Y113.047 E.00038
G1 X141.484 Y112.046 E.00174
G2 X141.456 Y112.303 I.773 J.213 E.00045
G1 X141.334 Y112.295 E.00021
G1 X141.334 Y113.038 E.00129
G1 X141.184 Y113.107 E.00029
G1 X141.184 Y112.285 E.00143
G1 X141.034 Y112.276 E.00026
G1 X141.034 Y113.176 E.00157
G1 X140.884 Y113.246 E.00029
G1 X140.884 Y112.198 E.00182
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.884 Y113.246 E-.11939
G1 X141.034 Y113.176 E-.01883
G1 X141.034 Y112.389 E-.08978
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.073 J-.574 P1  F28800
G1 X137.434 Y119.117 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X137.434 Y131.536 E.02161
G1 X137.284 Y131.536 E.00026
G1 X137.284 Y119.184 E.02149
G1 X137.134 Y119.184 E.00026
G1 X137.134 Y131.536 E.02149
G1 X136.984 Y131.536 E.00026
G1 X136.984 Y119.184 E.02149
G1 X136.834 Y119.184 E.00026
G1 X136.834 Y131.536 E.02149
G1 X136.684 Y131.536 E.00026
G1 X136.684 Y119.184 E.02149
G1 X136.534 Y119.184 E.00026
G1 X136.534 Y131.536 E.02149
G1 X136.384 Y131.536 E.00026
G1 X136.384 Y119.184 E.02149
G1 X136.234 Y119.184 E.00026
G1 X136.234 Y131.536 E.02149
G1 X136.084 Y131.536 E.00026
G1 X136.084 Y119.184 E.02149
G1 X135.934 Y119.184 E.00026
G1 X135.934 Y131.604 E.02161
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X135.934 Y129.604 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.086 J-.549 P1  F28800
G1 X132.184 Y137.026 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
M73 P67 R8
G1 X132.184 Y137.816 E.00138
G2 X132.034 Y137.677 I-.302 J.174 E.00036
G1 X132.034 Y136.878 E.00139
G2 X131.884 Y136.647 I-.436 J.118 E.00049
G1 X131.884 Y137.578 E.00162
G2 X131.734 Y137.489 I-.283 J.304 E.00031
G1 X131.734 Y136.507 E.00171
G1 X131.584 Y136.427 E.0003
G1 X131.584 Y137.431 E.00175
G2 X131.434 Y137.409 I-.121 J.301 E.00027
G1 X131.434 Y136.386 E.00178
G1 X131.284 Y136.357 E.00027
G1 X131.284 Y137.389 E.00179
G2 X131.134 Y137.387 I-.078 J.255 E.00026
G1 X131.134 Y136.37 E.00177
G1 X130.984 Y136.384 E.00026
G1 X130.984 Y137.41 E.00179
G1 X130.834 Y137.433 E.00026
G1 X130.834 Y136.447 E.00172
G2 X130.684 Y136.573 I.578 J.843 E.00034
G1 X130.684 Y137.491 E.0016
G1 X130.534 Y137.567 E.00029
G1 X130.534 Y136.937 E.0011
G2 X130.505 Y137.093 I.573 J.185 E.00028
G1 X130.384 Y137.078 E.00021
G1 X130.384 Y137.661 E.00102
G1 X130.234 Y137.808 E.00037
G1 X130.234 Y137.059 E.0013
G1 X130.084 Y137.04 E.00026
G1 X130.084 Y138.115 E.00187
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X130.084 Y137.04 E-.12252
G1 X130.234 Y137.059 E-.01723
G1 X130.234 Y137.808 E-.08546
G1 X130.251 Y137.791 E-.00278
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.191 J-.248 P1  F28800
G1 X128.734 Y145.086 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X128.734 Y145.179 E.00016
G1 X128.584 Y145.156 E.00026
G1 X128.584 Y145.066 E.00016
G1 X128.434 Y144.966 E.00031
G1 X128.434 Y145.2 E.00041
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X128.434 Y144.966 E-.07129
G1 X128.584 Y145.066 E-.05494
G1 X128.584 Y145.156 E-.02712
G1 X128.734 Y145.179 E-.0462
G1 X128.734 Y145.086 E-.02846
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.869 J-.852 P1  F28800
G1 X122.284 Y138.5 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X122.284 Y138.28 E.00038
G1 X122.134 Y138.15 E.00034
G1 X122.134 Y138.592 E.00077
G1 X121.984 Y138.839 E.0005
G1 X121.984 Y137.819 E.00178
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X121.984 Y138.839 E-.1163
G1 X122.134 Y138.592 E-.0329
G1 X122.134 Y138.15 E-.0504
G1 X122.284 Y138.28 E-.02258
G1 X122.284 Y138.331 E-.00583
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.256 J-1.19 P1  F28800
G1 X115.684 Y139.753 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X115.684 Y139.868 E.0002
G1 X115.534 Y139.868 E.00026
G1 X115.534 Y139.666 E.00035
G1 X115.384 Y139.468 E.00043
G1 X115.384 Y139.868 E.0007
G1 X115.234 Y139.868 E.00026
G1 X115.234 Y139.224 E.00112
G1 X115.084 Y138.968 E.00052
G1 X115.084 Y139.868 E.00157
G1 X114.934 Y139.868 E.00026
G1 X114.934 Y138.703 E.00203
G1 X114.784 Y138.376 E.00063
G1 X114.784 Y139.868 E.0026
G1 X114.634 Y139.868 E.00026
G1 X114.634 Y137.85 E.00351
G1 X114.484 Y137.387 F28800
G1 F3600
G1 X114.484 Y139.868 E.00432
G1 X114.334 Y139.868 E.00026
G1 X114.334 Y136.786 E.00536
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.334 Y138.786 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.349 J-1.166 P1  F28800
G1 X107.734 Y136.809 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X107.734 Y137.745 E.00163
G3 X107.584 Y138.05 I-.536 J-.074 E.0006
G1 X107.584 Y136.686 E.00237
G2 X107.434 Y136.519 I-.391 J.199 E.0004
G1 X107.434 Y138.187 E.0029
G3 X107.284 Y138.255 I-.186 J-.208 E.00029
G1 X107.284 Y136.43 E.00318
G2 X107.134 Y136.382 I-.152 J.218 E.00028
G1 X107.134 Y138.28 E.0033
G3 X106.984 Y138.269 I-.056 J-.261 E.00027
G1 X106.984 Y136.359 E.00332
G2 X106.834 Y136.37 I-.056 J.266 E.00027
G1 X106.834 Y138.219 E.00322
G3 X106.684 Y138.114 I.098 J-.3 E.00032
G1 X106.684 Y136.39 E.003
G2 X106.534 Y136.452 I.028 J.278 E.00029
G1 X106.534 Y137.893 E.00251
G1 X106.486 Y137.799 E.00018
G1 X106.384 Y137.834 E.00019
G1 X106.384 Y136.556 E.00222
G2 X106.234 Y136.704 I.21 J.364 E.00037
G1 X106.234 Y137.884 E.00205
G1 X106.084 Y137.934 E.00028
G1 X106.084 Y136.836 E.00191
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X106.084 Y137.934 E-.12519
G1 X106.234 Y137.884 E-.01803
G1 X106.234 Y137.14 E-.08479
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.056 J-1.216 P1  F28800
G1 X98.584 Y136.79 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X98.584 Y137.954 E.00203
G1 X98.434 Y138.161 E.00044
G1 X98.434 Y136.682 E.00257
G1 X98.284 Y136.532 E.00037
G1 X98.284 Y138.275 E.00303
G3 X98.134 Y138.353 I-.198 J-.201 E.0003
G1 X98.134 Y136.442 E.00332
G2 X97.984 Y136.393 I-.156 J.22 E.00028
G1 X97.984 Y138.386 E.00347
G3 X97.834 Y138.391 I-.084 J-.254 E.00026
G1 X97.834 Y136.362 E.00353
G2 X97.684 Y136.366 I-.067 J.263 E.00026
G1 X97.684 Y138.375 E.00349
G1 X97.534 Y138.32 E.00028
G1 X97.534 Y136.378 E.00338
G2 X97.384 Y136.407 I-.029 J.248 E.00027
G1 X97.384 Y138.233 E.00318
G1 X97.234 Y138.129 E.00032
G1 X97.234 Y136.468 E.00289
G1 X97.084 Y136.587 E.00033
G1 X97.084 Y138.025 E.0025
G1 X96.934 Y137.921 E.00032
G1 X96.934 Y136.67 E.00218
G1 X96.784 Y137.056 F28800
G1 F3600
G1 X96.784 Y138.001 E.00165
G1 X96.634 Y138.097 E.00031
G1 X96.634 Y137.2 E.00156
G1 X96.484 Y137.186 E.00026
G1 X96.484 Y138.272 E.00189
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X96.484 Y137.186 E-.12375
G1 X96.634 Y137.2 E-.01717
G1 X96.634 Y137.964 E-.08708
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.217 J-.017 P1  F28800
G1 X96.484 Y127.487 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X96.484 Y126.129 E.00236
G2 X96.334 Y125.833 I-1.142 J.392 E.00058
G1 X96.334 Y127.501 E.0029
G3 X96.184 Y127.422 I-.006 J-.171 E.00031
G1 X96.184 Y125.598 E.00317
G1 X96.034 Y125.362 E.00049
G1 X96.034 Y126.889 E.00266
G1 X95.988 Y126.615 E.00048
G1 X95.884 Y126.62 E.00018
G1 X95.884 Y125.128 E.0026
G1 X95.734 Y124.9 E.00047
G1 X95.734 Y126.628 E.00301
G1 X95.584 Y126.636 E.00026
G1 X95.584 Y124.673 E.00342
G3 X95.434 Y124.41 I.623 J-.53 E.00053
G1 X95.434 Y126.711 E.004
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X95.434 Y124.711 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.111 J.496 P1  F28800
G1 X99.784 Y114.957 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X99.784 Y113.196 E.00306
G1 X99.634 Y113.326 E.00035
G1 X99.634 Y115.119 E.00312
G3 X99.484 Y115.287 I-.349 J-.161 E.0004
G1 X99.484 Y113.425 E.00324
G2 X99.375 Y113.329 I-.195 J.112 E.00026
G1 X99.372 Y113.329 E0
G2 X99.334 Y113.363 I.043 J.087 E.00009
G1 X99.329 Y115.243 E.00327
G3 X99.184 Y114.96 I.381 J-.375 E.00056
G1 X99.184 Y113.466 E.0026
G1 X99.784 Y112.918 F28800
G1 F3600
G1 X99.784 Y112.127 E.00138
G1 X99.634 Y111.762 F28800
G1 F3600
G1 X99.634 Y112.738 E.0017
G2 X99.484 Y112.692 I-.148 J.221 E.00028
G1 X99.484 Y111.693 E.00174
G2 X99.334 Y111.671 I-.095 J.121 E.00028
G1 X99.334 Y112.684 E.00176
G2 X99.184 Y112.71 I-.029 J.279 E.00027
G1 X99.184 Y111.774 E.00163
G1 X99.034 Y112.293 F28800
G1 F3600
G1 X99.034 Y112.776 E.00084
G2 X98.884 Y112.895 I.115 J.298 E.00034
G1 X98.884 Y112.349 E.00095
G1 X98.734 Y112.337 E.00026
G1 X98.734 Y113.093 E.00132
G2 X98.584 Y113.387 I.426 J.403 E.00058
G1 X98.584 Y112.257 E.00197
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.584 Y113.387 E-.12884
G1 X98.62 Y113.267 E-.01432
G1 X98.734 Y113.093 E-.02367
G1 X98.734 Y112.557 E-.06116
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.211 J.123 P1  F28800
G1 X99.634 Y103.731 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X99.634 Y103.53 E.00035
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X99.634 Y103.731 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.972 J.732 P1  F28800
G1 X106.834 Y113.284 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X106.834 Y113.621 E.00059
G2 X106.684 Y113.926 I.414 J.393 E.0006
G1 X106.684 Y112.922 E.00175
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X106.684 Y113.926 E-.13589
G1 X106.715 Y113.809 E-.0165
G1 X106.834 Y113.621 E-.02999
G1 X106.834 Y113.284 E-.04561
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.166 J1.206 P1  F28800
G1 X116.284 Y114.585 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X116.284 Y114.97 E.00067
G1 X116.134 Y114.97 E.00026
G1 X116.134 Y114.406 E.00098
G1 X115.984 Y114.055 E.00066
G1 X115.984 Y114.97 E.00159
G1 X115.834 Y114.97 E.00026
G1 X115.834 Y113.332 E.00285
G1 X115.684 Y112.734 F28800
G1 F3600
G1 X115.684 Y114.97 E.00389
G1 X115.534 Y114.97 E.00026
G1 X115.534 Y112.004 E.00516
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X115.534 Y114.004 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.215 J-.076 P1  F28800
G1 X114.934 Y104.46 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X114.934 Y104.542 E.00014
G1 X114.784 Y104.542 E.00026
G1 X114.784 Y104.508 E.00006
G1 X114.634 Y104.489 E.00026
G1 X114.634 Y104.61 E.00021
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.634 Y104.489 E-.05126
G1 X114.784 Y104.508 E-.06415
G1 X114.784 Y104.542 E-.01425
G1 X114.934 Y104.542 E-.0636
G1 X114.934 Y104.46 E-.03474
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.023 J1.217 P1  F28800
G1 X132.484 Y104.129 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X132.484 Y103.49 E.00111
G1 X132.334 Y103.428 E.00028
G1 X132.334 Y104.7 E.00221
G1 X132.184 Y105.271 F28800
G1 F3600
G1 X132.184 Y103.366 E.00331
G1 X132.034 Y103.304 E.00028
G1 X132.034 Y105.841 E.00442
G1 X131.884 Y106.412 F28800
G1 F3600
G1 X131.884 Y103.242 E.00552
G1 X131.734 Y103.18 E.00028
G1 X131.734 Y106.983 E.00662
G1 X131.584 Y107.553 F28800
G1 F3600
G1 X131.584 Y103.118 E.00772
G1 X131.434 Y103.056 E.00028
G1 X131.434 Y108.124 E.00882
G1 X131.284 Y108.695 F28800
G1 F3600
G1 X131.284 Y102.963 E.00997
G1 X131.134 Y102.848 E.00033
G1 X131.134 Y109.265 E.01117
G1 X130.984 Y109.836 F28800
G1 F3600
G1 X130.984 Y102.647 E.01251
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X130.984 Y104.647 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.204 J.18 P1  F28800
G1 X132.034 Y111.67 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X132.034 Y112.823 E.00201
G1 X132.023 Y112.91 E.00015
G1 X131.884 Y113.216 E.00059
G1 X131.884 Y111.506 E.00298
G2 X131.734 Y111.356 I-.209 J.06 E.00038
G1 X131.734 Y113.301 E.00338
G3 X131.584 Y113.281 I-.04 J-.269 E.00027
G1 X131.584 Y111.442 E.0032
G2 X131.434 Y111.718 I.408 J.4 E.00055
G1 X131.434 Y113.374 E.00288
G1 X131.284 Y113.657 E.00056
G1 X131.284 Y111.998 E.00289
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X131.284 Y113.657 E-.18909
G1 X131.434 Y113.374 E-.03655
G1 X131.434 Y113.353 E-.00236
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.044 J1.216 P1  F28800
G1 X152.584 Y112.593 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X152.584 Y114.099 E.00262
G1 X152.434 Y113.766 E.00064
G1 X152.434 Y112.66 E.00192
G1 X152.284 Y112.66 E.00026
G1 X152.284 Y113.432 E.00134
G1 X152.134 Y113.098 E.00064
G1 X152.134 Y112.66 E.00076
G1 X151.984 Y112.66 E.00026
G1 X151.984 Y112.929 E.00047
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X151.984 Y112.66 E-.03068
G1 X152.134 Y112.66 E-.0171
G1 X152.134 Y113.098 E-.04996
G1 X152.284 Y113.432 E-.04171
G1 X152.284 Y112.66 E-.088
G1 X152.288 Y112.66 E-.00054
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.51 J1.105 P1  F28800
G1 X159.334 Y109.409 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X159.334 Y108.867 E.00094
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X159.334 Y109.409 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.978 J.724 P1  F28800
G1 X166.084 Y100.295 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X166.084 Y96.136 E.00724
G1 X165.934 Y96.136 E.00026
G1 X165.934 Y100.248 E.00716
G1 X165.784 Y100.27 E.00026
G1 X165.784 Y96.136 E.00719
G1 X165.634 Y96.136 E.00026
G1 X165.634 Y100.292 E.00723
G1 X165.484 Y100.313 E.00026
G1 X165.484 Y96.136 E.00727
G1 X165.334 Y96.136 E.00026
G1 X165.334 Y100.335 E.00731
G1 X165.184 Y100.356 E.00026
G1 X165.184 Y96.136 E.00734
G1 X165.034 Y96.136 E.00026
G1 X165.034 Y100.378 E.00738
G1 X164.884 Y100.4 E.00026
G1 X164.884 Y96.136 E.00742
G1 X164.734 Y96.136 E.00026
G1 X164.734 Y100.421 E.00746
G1 X164.584 Y100.443 E.00026
G1 X164.584 Y96.136 E.00749
G1 X164.434 Y96.136 E.00026
G1 X164.434 Y100.464 E.00753
G2 X164.284 Y100.494 I-.025 J.27 E.00027
G1 X164.284 Y96.136 E.00758
G1 X164.134 Y96.136 E.00026
G1 X164.134 Y100.562 E.0077
G1 X163.984 Y100.631 E.00029
G1 X163.984 Y96.136 E.00782
G1 X163.834 Y96.136 E.00026
G1 X163.834 Y100.699 E.00794
G1 X163.684 Y100.768 E.00029
G1 X163.684 Y96.136 E.00806
G1 X163.534 Y96.136 E.00026
G1 X163.534 Y100.837 E.00818
G1 X163.384 Y100.905 E.00029
G1 X163.384 Y96.136 E.0083
G1 X163.234 Y96.136 E.00026
G1 X163.234 Y100.974 E.00842
G1 X163.084 Y101.042 E.00029
G1 X163.084 Y96.136 E.00854
G1 X162.934 Y96.136 E.00026
G1 X162.934 Y101.111 E.00866
G1 X162.784 Y101.179 E.00029
G1 X162.784 Y96.136 E.00877
G1 X162.634 Y96.136 E.00026
G1 X162.634 Y101.248 E.00889
G1 X162.484 Y101.316 E.00029
G1 X162.484 Y96.136 E.00901
G1 X162.334 Y96.136 E.00026
G1 X162.334 Y101.422 E.0092
G1 X162.184 Y101.552 E.00035
G1 X162.184 Y96.136 E.00942
G1 X162.034 Y96.136 E.00026
G1 X162.034 Y101.682 E.00965
G1 X161.884 Y101.812 E.00035
G1 X161.884 Y96.136 E.00988
G1 X161.734 Y96.136 E.00026
G1 X161.734 Y101.942 E.0101
G1 X161.584 Y102.071 E.00035
G1 X161.584 Y96.069 E.01044
G1 X161.434 Y97.053 F28800
G1 F3600
G1 X161.434 Y102.201 E.00896
G1 X161.284 Y102.331 E.00035
G1 X161.284 Y98.213 E.00717
G1 X161.134 Y98.541 E.00063
G1 X161.134 Y102.461 E.00682
G1 X160.984 Y102.591 E.00035
G1 X160.984 Y98.87 E.00647
G1 X160.834 Y99.199 E.00063
G1 X160.834 Y102.738 E.00616
G1 X160.684 Y102.972 E.00048
G1 X160.684 Y99.528 E.00599
G1 X160.534 Y99.857 E.00063
G1 X160.534 Y103.205 E.00583
G1 X160.384 Y103.439 E.00048
G1 X160.384 Y100.128 E.00576
G1 X160.234 Y100.301 E.0004
G1 X160.234 Y103.673 E.00587
G1 X160.084 Y103.906 E.00048
G1 X160.084 Y100.474 E.00597
G1 X159.934 Y100.647 E.0004
G1 X159.934 Y104.14 E.00608
G1 X159.784 Y104.374 E.00048
G1 X159.784 Y100.82 E.00618
G1 X159.634 Y100.993 E.0004
G1 X159.634 Y105.043 E.00705
G1 X159.484 Y105.553 F28800
G1 F3600
G1 X159.484 Y101.166 E.00763
G1 X159.334 Y101.339 E.0004
G1 X159.334 Y106.063 E.00822
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X159.334 Y104.063 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.216 J-.034 P1  F28800
G1 X159.184 Y109.483 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X159.184 Y101.512 E.01387
G1 X159.034 Y101.685 E.0004
G1 X159.034 Y109.482 E.01357
G1 X158.884 Y109.556 E.00029
G1 X158.884 Y101.804 E.01349
G1 X158.734 Y101.901 E.00031
G1 X158.734 Y109.63 E.01345
G1 X158.584 Y109.704 E.00029
G1 X158.584 Y101.997 E.01341
G1 X158.434 Y102.094 E.00031
G1 X158.434 Y109.778 E.01337
G1 X158.284 Y109.853 E.00029
G1 X158.284 Y102.19 E.01333
G1 X158.134 Y102.286 E.00031
G1 X158.134 Y109.927 E.01329
G1 X157.984 Y110.001 E.00029
G1 X157.984 Y102.383 E.01325
G1 X157.834 Y102.479 E.00031
G1 X157.834 Y110.075 E.01322
G1 X157.684 Y110.149 E.00029
G1 X157.684 Y102.576 E.01318
G1 X157.534 Y102.672 E.00031
G1 X157.534 Y110.223 E.01314
G1 X157.384 Y110.297 E.00029
G1 X157.384 Y102.768 E.0131
G1 X157.234 Y102.865 E.00031
G1 X157.234 Y110.371 E.01306
G1 X157.084 Y110.445 E.00029
G1 X157.084 Y102.946 E.01305
G1 X156.934 Y102.991 E.00027
G1 X156.934 Y110.519 E.0131
G1 X156.784 Y110.594 E.00029
G1 X156.784 Y103.035 E.01315
G1 X156.634 Y103.079 E.00027
G1 X156.634 Y110.668 E.0132
G1 X156.484 Y110.742 E.00029
G1 X156.484 Y103.123 E.01326
G1 X156.334 Y103.168 E.00027
G1 X156.334 Y110.816 E.01331
G1 X156.184 Y110.89 E.00029
G1 X156.184 Y103.212 E.01336
G1 X156.034 Y103.256 E.00027
G1 X156.034 Y110.964 E.01341
G1 X155.884 Y111.038 E.00029
G1 X155.884 Y103.3 E.01346
G1 X155.734 Y103.345 E.00027
G1 X155.734 Y111.112 E.01352
G1 X155.584 Y111.186 E.00029
G1 X155.584 Y103.389 E.01357
G1 X155.434 Y103.433 E.00027
G1 X155.434 Y111.261 E.01362
G1 X155.284 Y111.335 E.00029
G1 X155.284 Y103.476 E.01367
G1 X155.134 Y103.52 E.00027
G1 X155.134 Y111.409 E.01373
G1 X154.984 Y111.483 E.00029
G1 X154.984 Y103.558 E.01379
G1 X154.834 Y103.558 E.00026
G1 X154.834 Y111.557 E.01392
G1 X154.684 Y111.631 E.00029
G1 X154.684 Y103.558 E.01405
G1 X154.534 Y103.558 E.00026
G1 X154.534 Y111.705 E.01418
M73 P68 R8
G1 X154.384 Y111.779 E.00029
G1 X154.384 Y103.491 E.01442
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X154.384 Y105.491 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.105 J.51 P1  F28800
G1 X166.084 Y130.829 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X166.084 Y133.244 E.0042
G1 X165.934 Y133.268 E.00026
G1 X165.934 Y130.876 E.00416
G1 X165.784 Y130.854 E.00026
G1 X165.784 Y133.292 E.00424
G1 X165.634 Y133.316 E.00026
G1 X165.634 Y130.832 E.00432
G1 X165.484 Y130.811 E.00026
G1 X165.484 Y133.34 E.0044
G1 X165.334 Y133.363 E.00026
G1 X165.334 Y130.789 E.00448
G1 X165.184 Y130.767 E.00026
G1 X165.184 Y133.387 E.00456
G1 X165.034 Y133.411 E.00026
G1 X165.034 Y130.746 E.00464
G1 X164.884 Y130.724 E.00026
G1 X164.884 Y133.435 E.00472
G1 X164.734 Y133.459 E.00026
G1 X164.734 Y130.702 E.0048
G1 X164.584 Y130.681 E.00026
G1 X164.584 Y133.482 E.00487
G1 X164.434 Y133.506 E.00026
G1 X164.434 Y130.654 E.00496
G1 X164.284 Y130.586 E.00029
G1 X164.284 Y133.578 E.00521
G1 X164.134 Y133.654 E.00029
G1 X164.134 Y130.517 E.00546
G1 X163.984 Y130.449 E.00029
G1 X163.984 Y133.731 E.00571
G1 X163.834 Y133.807 E.00029
G1 X163.834 Y130.38 E.00596
G1 X163.684 Y130.312 E.00029
G1 X163.684 Y133.883 E.00621
G1 X163.534 Y133.96 E.00029
G1 X163.534 Y130.244 E.00647
G1 X163.384 Y130.175 E.00029
G1 X163.384 Y134.036 E.00672
G1 X163.234 Y134.112 E.00029
G1 X163.234 Y130.107 E.00697
G1 X163.084 Y130.038 E.00029
G1 X163.084 Y134.189 E.00722
G1 X162.934 Y134.265 E.00029
G1 X162.934 Y129.97 E.00747
G1 X162.784 Y129.901 E.00029
G1 X162.784 Y134.341 E.00773
G1 X162.723 Y134.372 E.00012
G2 X162.634 Y134.435 I.052 J.168 E.00019
G1 X162.634 Y129.808 E.00805
G1 X162.484 Y129.678 E.00035
G1 X162.484 Y134.585 E.00854
G1 X162.334 Y134.735 E.00037
G1 X162.334 Y129.548 E.00903
G1 X162.184 Y129.418 E.00035
G1 X162.184 Y134.885 E.00951
G1 X162.034 Y135.035 E.00037
G1 X162.034 Y129.288 E.01
G1 X161.884 Y129.158 E.00035
G1 X161.884 Y135.185 E.01049
G1 X161.734 Y135.335 E.00037
G1 X161.734 Y129.028 E.01097
G1 X161.584 Y128.898 E.00035
G1 X161.584 Y135.485 E.01146
G1 X161.434 Y135.635 E.00037
G1 X161.434 Y128.768 E.01195
G1 X161.284 Y128.638 E.00035
G1 X161.284 Y135.582 E.01208
G1 X161.134 Y135.461 E.00034
G1 X161.134 Y128.437 E.01222
G1 X160.984 Y128.203 E.00048
G1 X160.984 Y135.339 E.01242
G1 X160.834 Y135.218 E.00034
G1 X160.834 Y127.97 E.01261
G1 X160.684 Y127.736 E.00048
G1 X160.684 Y135.096 E.01281
G1 X160.534 Y134.975 E.00034
G1 X160.534 Y127.503 E.013
G1 X160.384 Y127.27 E.00048
G1 X160.384 Y134.853 E.0132
G1 X160.234 Y134.732 E.00034
G1 X160.234 Y126.87 E.01368
G1 X160.084 Y126.358 F28800
G1 F3600
G1 X160.084 Y134.61 E.01436
G1 X159.934 Y134.489 E.00034
G1 X159.934 Y125.845 E.01504
G1 X159.784 Y125.333 F28800
G1 F3600
G1 X159.784 Y134.367 E.01572
G1 X159.634 Y134.246 E.00034
G1 X159.634 Y122.539 E.02037
G1 X159.484 Y122.53 E.00026
G1 X159.484 Y134.124 E.02017
G1 X159.334 Y134.003 E.00034
G1 X159.334 Y122.522 E.01998
G1 X159.184 Y122.513 E.00026
G1 X159.184 Y133.881 E.01978
G1 X159.034 Y133.76 E.00034
G1 X159.034 Y122.505 E.01958
G1 X158.884 Y122.497 E.00026
G1 X158.884 Y133.638 E.01939
G1 X158.734 Y133.517 E.00034
G1 X158.734 Y122.488 E.01919
G1 X158.584 Y122.48 E.00026
G1 X158.584 Y133.395 E.01899
G1 X158.434 Y133.274 E.00034
G1 X158.434 Y122.471 E.0188
G1 X158.284 Y122.463 E.00026
G1 X158.284 Y133.153 E.0186
G1 X158.134 Y133.031 E.00034
G1 X158.134 Y122.455 E.0184
G1 X157.984 Y122.446 E.00026
G1 X157.984 Y132.91 E.01821
G1 X157.834 Y132.788 E.00034
G1 X157.834 Y122.438 E.01801
G1 X157.684 Y122.429 E.00026
G1 X157.684 Y132.667 E.01781
G1 X157.534 Y132.545 E.00034
G1 X157.534 Y122.421 E.01762
G1 X157.384 Y122.412 E.00026
G1 X157.384 Y132.424 E.01742
G1 X157.234 Y132.303 E.00034
G1 X157.234 Y122.404 E.01722
G1 X157.084 Y122.396 E.00026
G1 X157.084 Y132.181 E.01703
G1 X156.934 Y132.06 E.00034
G1 X156.934 Y122.387 E.01683
G1 X156.784 Y122.379 E.00026
G1 X156.784 Y131.938 E.01663
G1 X156.634 Y131.817 E.00034
G1 X156.634 Y122.37 E.01644
G1 X156.484 Y122.362 E.00026
G1 X156.484 Y131.695 E.01624
G1 X156.334 Y131.574 E.00034
G1 X156.334 Y122.354 E.01604
G1 X156.184 Y122.345 E.00026
G1 X156.184 Y131.592 E.01609
G1 X156.034 Y131.777 E.00042
G1 X156.034 Y111.725 E.03489
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X156.034 Y113.725 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.186 J.273 P1  F28800
G1 X161.134 Y135.906 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X161.134 Y136.076 E.00029
G1 X160.984 Y136.37 E.00057
G1 X160.984 Y136.199 E.0003
G1 X160.932 Y136.263 E.00014
G1 X160.834 Y136.183 E.00022
G1 X160.834 Y136.664 E.00084
G1 X160.684 Y136.959 E.00057
G1 X160.684 Y136.062 E.00156
G1 X160.534 Y135.94 E.00034
G1 X160.534 Y137.253 E.00228
G1 X160.384 Y137.566 E.0006
G1 X160.384 Y135.819 E.00304
G1 X160.234 Y135.697 E.00034
G1 X160.234 Y138.943 E.00565
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X160.234 Y136.943 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.01 J.679 P1  F28800
G1 X166.084 Y145.645 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X166.084 Y149.586 E.00686
G1 X165.934 Y149.586 E.00026
G1 X165.934 Y145.69 E.00678
G1 X165.784 Y145.666 E.00026
G1 X165.784 Y149.586 E.00682
G1 X165.634 Y149.586 E.00026
G1 X165.634 Y145.642 E.00686
G1 X165.484 Y145.619 E.00026
G1 X165.484 Y149.586 E.0069
G1 X165.334 Y149.586 E.00026
G1 X165.334 Y145.595 E.00694
G1 X165.184 Y145.571 E.00026
G1 X165.184 Y149.586 E.00699
G1 X165.034 Y149.586 E.00026
G1 X165.034 Y145.547 E.00703
G1 X164.884 Y145.523 E.00026
G1 X164.884 Y149.586 E.00707
G1 X164.734 Y149.586 E.00026
G1 X164.734 Y145.5 E.00711
G1 X164.584 Y145.476 E.00026
G1 X164.584 Y149.586 E.00715
G1 X164.434 Y149.586 E.00026
G1 X164.434 Y145.452 E.00719
G3 X164.284 Y145.38 I.036 J-.267 E.00029
G1 X164.284 Y149.586 E.00732
G1 X164.134 Y149.586 E.00026
G1 X164.134 Y145.304 E.00745
G1 X163.984 Y145.227 E.00029
G1 X163.984 Y149.586 E.00758
G1 X163.834 Y149.586 E.00026
G1 X163.834 Y145.151 E.00772
G1 X163.684 Y145.075 E.00029
G1 X163.684 Y149.586 E.00785
G1 X163.534 Y149.586 E.00026
G1 X163.534 Y144.998 E.00798
G1 X163.384 Y144.922 E.00029
G1 X163.384 Y149.586 E.00812
G1 X163.234 Y149.586 E.00026
G1 X163.234 Y144.846 E.00825
G1 X163.084 Y144.769 E.00029
G1 X163.084 Y149.586 E.00838
G1 X162.934 Y149.586 E.00026
G1 X162.934 Y144.693 E.00851
G1 X162.784 Y144.617 E.00029
G1 X162.784 Y149.586 E.00865
G1 X162.634 Y149.586 E.00026
G1 X162.634 Y144.523 E.00881
G1 X162.484 Y144.373 E.00037
G1 X162.484 Y149.586 E.00907
G1 X162.334 Y149.586 E.00026
G1 X162.334 Y144.223 E.00933
G1 X162.184 Y144.074 E.00037
G1 X162.184 Y149.586 E.00959
G1 X162.034 Y149.586 E.00026
G1 X162.034 Y143.924 E.00985
G1 X161.884 Y143.774 E.00037
G1 X161.884 Y149.586 E.01011
G1 X161.734 Y149.586 E.00026
G1 X161.734 Y143.624 E.01037
G1 X161.584 Y143.474 E.00037
G1 X161.584 Y149.586 E.01063
G1 X161.434 Y149.586 E.00026
G1 X161.434 Y143.325 E.01089
G1 X161.284 Y143.175 E.00037
G1 X161.284 Y149.586 E.01115
G1 X161.134 Y149.586 E.00026
G1 X161.134 Y142.884 E.01166
G1 X160.984 Y142.59 E.00058
G1 X160.984 Y149.586 E.01217
G1 X160.834 Y149.586 E.00026
G1 X160.834 Y142.295 E.01269
G1 X160.684 Y142 E.00058
G1 X160.684 Y149.586 E.0132
G1 X160.534 Y149.586 E.00026
G1 X160.534 Y141.705 E.01371
G1 X160.384 Y141.392 E.0006
G1 X160.384 Y149.586 E.01426
G1 X160.234 Y149.586 E.00026
G1 X160.234 Y140.015 E.01665
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X160.234 Y142.015 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.217 J-.024 P1  F28800
G1 X160.084 Y149.654 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X160.084 Y135.576 E.02449
G1 X159.934 Y135.454 E.00034
G1 X159.934 Y149.586 E.02459
G1 X159.784 Y149.586 E.00026
G1 X159.784 Y135.332 E.0248
G1 X159.634 Y135.211 E.00034
G1 X159.634 Y149.586 E.02501
G1 X159.484 Y149.586 E.00026
G1 X159.484 Y135.089 E.02522
G1 X159.334 Y134.968 E.00034
G1 X159.334 Y149.586 E.02543
G1 X159.184 Y149.586 E.00026
G1 X159.184 Y134.846 E.02565
G1 X159.034 Y134.725 E.00034
G1 X159.034 Y149.654 E.02597
G1 X158.884 Y149.539 F28800
G1 F3600
G1 X158.884 Y134.603 E.02599
G1 X158.734 Y134.482 E.00034
G1 X158.734 Y148.164 E.02381
G1 X158.72 Y148.075 E.00016
G1 X158.584 Y147.808 E.00052
G1 X158.584 Y134.36 E.0234
M73 P69 R8
G1 X158.434 Y134.239 E.00034
G1 X158.434 Y147.513 E.0231
G1 X158.284 Y147.218 E.00058
G1 X158.284 Y134.117 E.02279
G1 X158.134 Y133.996 E.00034
G1 X158.134 Y146.923 E.02249
G1 X157.984 Y146.628 E.00058
G1 X157.984 Y133.874 E.02219
G1 X157.834 Y133.753 E.00034
G1 X157.834 Y146.397 E.022
G1 X157.684 Y146.247 E.00037
G1 X157.684 Y133.631 E.02195
G1 X157.534 Y133.51 E.00034
G1 X157.534 Y146.098 E.0219
G1 X157.384 Y145.948 E.00037
G1 X157.384 Y133.388 E.02185
G1 X157.234 Y133.267 E.00034
G1 X157.234 Y145.798 E.0218
G1 X157.084 Y145.648 E.00037
G1 X157.084 Y133.145 E.02175
G1 X156.934 Y133.024 E.00034
G1 X156.934 Y145.499 E.02171
G1 X156.784 Y145.349 E.00037
G1 X156.784 Y132.902 E.02166
G1 X156.634 Y132.781 E.00034
G1 X156.634 Y145.199 E.02161
G2 X156.484 Y145.116 I-.204 J.191 E.0003
G1 X156.484 Y132.659 E.02167
G1 X156.334 Y132.538 E.00034
G1 X156.334 Y145.039 E.02175
G1 X156.184 Y144.963 E.00029
G1 X156.184 Y132.416 E.02183
G1 X156.034 Y132.295 E.00034
G1 X156.034 Y144.886 E.02191
G1 X155.884 Y144.809 E.00029
G1 X155.884 Y132.173 E.02199
G1 X155.781 Y132.09 E.00023
G1 X155.884 Y131.963 E.00028
G1 X155.884 Y111.874 E.03495
G1 X155.734 Y111.948 E.00029
G1 X155.734 Y144.732 E.05704
G1 X155.584 Y144.656 E.00029
G1 X155.584 Y112.023 E.05678
G1 X155.434 Y112.097 E.00029
G1 X155.434 Y120.588 E.01477
G1 X155.319 Y120.295 E.00055
G1 X155.284 Y120.251 E.0001
G1 X155.284 Y112.171 E.01406
G1 X155.134 Y112.245 E.00029
G1 X155.134 Y120.058 E.01359
G2 X154.984 Y119.91 I-.309 J.162 E.00037
G1 X154.984 Y112.319 E.01321
G1 X154.834 Y112.394 E.00029
G1 X154.834 Y119.807 E.0129
G2 X154.684 Y119.744 I-.177 J.211 E.00029
G1 X154.684 Y112.468 E.01266
G1 X154.559 Y112.53 E.00024
G1 X154.534 Y112.479 E.0001
G1 X154.534 Y119.697 E.01256
G2 X154.384 Y119.69 I-.087 J.251 E.00026
G1 X154.384 Y112.023 E.01334
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X154.384 Y114.023 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.217 J-.032 P1  F28800
G1 X154.234 Y119.756 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X154.234 Y103.558 E.02818
G1 X154.084 Y103.558 E.00026
G1 X154.084 Y119.726 E.02813
G2 X153.934 Y119.777 I.009 J.275 E.00028
G1 X153.934 Y103.558 E.02822
G1 X153.784 Y103.558 E.00026
G1 X153.784 Y119.874 E.02839
G2 X153.634 Y120.006 I.17 J.344 E.00035
G1 X153.634 Y103.558 E.02862
G1 X153.484 Y103.558 E.00026
G1 X153.484 Y112.01 E.01471
G1 X153.334 Y112.01 E.00026
G1 X153.334 Y103.558 E.01471
G1 X153.184 Y103.558 E.00026
G1 X153.184 Y110.886 E.01275
G1 X153.034 Y110.886 E.00026
G1 X153.034 Y103.558 E.01275
G1 X152.884 Y103.558 E.00026
G1 X152.884 Y110.886 E.01275
G1 X152.734 Y110.886 E.00026
G1 X152.734 Y103.542 E.01278
G1 X152.584 Y103.498 E.00027
G1 X152.584 Y112.01 E.01481
G1 X152.434 Y112.01 E.00026
G1 X152.434 Y103.454 E.01489
G1 X152.284 Y103.409 E.00027
G1 X152.284 Y112.01 E.01496
G1 X152.134 Y112.01 E.00026
G1 X152.134 Y103.365 E.01504
G1 X151.984 Y103.321 E.00027
G1 X151.984 Y112.01 E.01512
G1 X151.834 Y112.01 E.00026
G1 X151.834 Y103.277 E.01519
G1 X151.684 Y103.233 E.00027
G1 X151.684 Y112.01 E.01527
G1 X151.534 Y112.01 E.00026
G1 X151.534 Y103.189 E.01535
G1 X151.384 Y103.145 E.00027
G1 X151.384 Y112.078 E.01554
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X151.384 Y110.078 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.934 J.78 P1  F28800
G1 X153.484 Y112.593 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X153.484 Y120.197 E.01323
G1 X153.334 Y120.501 E.00059
G1 X153.334 Y112.593 E.01376
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X153.334 Y114.593 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.165 J.351 P1  F28800
G1 X155.434 Y121.575 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X155.434 Y144.579 E.04003
G1 X155.284 Y144.503 E.00029
G1 X155.284 Y132.8 E.02036
G3 X155.134 Y133.063 I-.598 J-.167 E.00053
G1 X155.134 Y144.427 E.01977
G2 X154.984 Y144.36 I-.178 J.199 E.00029
G1 X154.984 Y133.219 E.01938
G3 X154.834 Y133.325 I-.252 J-.196 E.00032
G1 X154.834 Y144.336 E.01916
G1 X154.684 Y144.312 E.00026
G1 X154.684 Y133.407 E.01897
G1 X154.534 Y133.443 E.00027
G1 X154.534 Y144.289 E.01887
G1 X154.384 Y144.265 E.00026
G1 X154.384 Y133.472 E.01878
G1 X154.234 Y133.468 E.00026
G1 X154.234 Y144.241 E.01874
G1 X154.084 Y144.217 E.00026
G1 X154.084 Y133.449 E.01874
G1 X153.934 Y133.404 E.00027
G1 X153.934 Y144.193 E.01877
G1 X153.784 Y144.169 E.00026
G1 X153.784 Y133.329 E.01886
G3 X153.634 Y133.232 I.085 J-.294 E.00032
G1 X153.634 Y144.146 E.01899
G1 X153.484 Y144.122 E.00026
G1 X153.484 Y133.061 E.01925
G3 X153.334 Y132.821 I.312 J-.362 E.0005
G1 X153.334 Y144.166 E.01974
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X153.334 Y142.166 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.863 J-.859 P1  F28800
G1 X151.534 Y143.975 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X151.534 Y144.349 E.00065
G2 X151.384 Y144.392 I-.008 J.254 E.00028
G1 X151.384 Y143.846 E.00095
G1 X151.234 Y143.579 E.00053
G1 X151.234 Y144.468 E.00155
G1 X151.084 Y144.545 E.00029
G1 X151.084 Y143.312 E.00214
G1 X150.934 Y143.045 E.00053
G1 X150.934 Y144.621 E.00274
G1 X150.784 Y144.698 E.00029
G1 X150.784 Y142.778 E.00334
G1 X150.634 Y142.512 E.00053
G1 X150.634 Y144.775 E.00394
G1 X150.484 Y144.851 E.00029
G1 X150.484 Y142.245 E.00454
G1 X150.334 Y141.978 E.00053
G1 X150.334 Y144.928 E.00513
M73 P70 R8
G1 X150.184 Y145.005 E.00029
G1 X150.184 Y141.573 E.00597
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X150.184 Y143.573 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.182 J.292 P1  F28800
G1 X155.284 Y122.912 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X155.284 Y122.208 E.00122
G1 X155.134 Y122.386 E.0004
G1 X155.134 Y122.576 E.00033
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X155.134 Y122.386 E-.03844
G1 X155.284 Y122.208 E-.04706
G1 X155.284 Y122.912 E-.1425
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.217 J0 P1  F28800
G1 X155.284 Y123.799 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X155.284 Y131.313 E.01307
G2 X155.134 Y130.999 I-.841 J.209 E.00061
G1 X155.134 Y129.234 E.00307
G1 X154.984 Y129.234 E.00026
G1 X154.984 Y130.752 E.00264
G1 X154.834 Y130.506 E.0005
G1 X154.834 Y129.234 E.00221
G1 X154.684 Y129.234 E.00026
G1 X154.684 Y130.293 E.00184
G1 X154.534 Y130.085 E.00045
G1 X154.534 Y129.234 E.00148
G1 X154.384 Y129.234 E.00026
G1 X154.384 Y129.877 E.00112
G1 X154.234 Y129.669 E.00045
G1 X154.234 Y129.234 E.00076
G1 X154.084 Y129.234 E.00026
G1 X154.084 Y129.577 E.0006
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X154.084 Y129.234 E-.03905
G1 X154.234 Y129.234 E-.0171
G1 X154.234 Y129.669 E-.04961
G1 X154.384 Y129.877 E-.02923
G1 X154.384 Y129.234 E-.07331
G1 X154.534 Y129.234 E-.0171
G1 X154.534 Y129.257 E-.0026
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.863 J.858 P1  F28800
G1 X155.134 Y128.654 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X155.134 Y124.269 E.00763
G1 X154.984 Y124.437 E.00039
G1 X154.984 Y128.586 E.00722
G1 X154.834 Y128.586 E.00026
G1 X154.834 Y124.538 E.00704
G3 X154.684 Y124.615 I-.2 J-.206 E.0003
G1 X154.684 Y128.586 E.00691
G1 X154.534 Y128.586 E.00026
G1 X154.534 Y124.654 E.00684
G3 X154.384 Y124.673 I-.108 J-.251 E.00027
G1 X154.384 Y128.586 E.00681
G1 X154.234 Y128.586 E.00026
G1 X154.234 Y124.669 E.00682
G3 X154.084 Y124.637 I-.018 J-.285 E.00027
G1 X154.084 Y128.586 E.00687
G1 X153.934 Y128.586 E.00026
G1 X153.934 Y124.584 E.00696
G1 X153.784 Y124.489 E.00031
G1 X153.784 Y128.586 E.00713
G1 X153.634 Y128.586 E.00026
G1 X153.634 Y124.352 E.00737
G3 X153.484 Y124.154 I.265 J-.356 E.00044
G1 X153.484 Y128.586 E.00771
G1 X153.334 Y128.586 E.00026
G1 X153.334 Y123.471 E.0089
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X153.334 Y125.471 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.217 J-.016 P1  F28800
G1 X153.184 Y114.169 Z1.8
M73 P70 R7
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X153.184 Y144.087 E.05206
G1 X153.034 Y144.111 E.00026
G1 X153.034 Y115.572 E.04966
G1 X152.884 Y115.64 E.00029
G1 X152.884 Y144.135 E.04958
G1 X152.734 Y144.159 E.00026
G1 X152.734 Y115.708 E.0495
G1 X152.617 Y115.76 E.00022
G1 X152.584 Y115.686 E.00014
G1 X152.584 Y119.786 E.00713
G1 X152.434 Y119.786 E.00026
G1 X152.434 Y115.352 E.00771
G1 X152.284 Y115.019 E.00064
G1 X152.284 Y119.786 E.00829
G1 X152.134 Y119.786 E.00026
G1 X152.134 Y114.685 E.00887
G1 X151.984 Y114.352 E.00064
G1 X151.984 Y123.276 E.01553
G1 X151.834 Y123.123 E.00037
G1 X151.834 Y114.018 E.01584
G1 X151.684 Y113.685 E.00064
G1 X151.684 Y122.987 E.01619
G2 X151.534 Y122.868 I-.601 J.602 E.00033
G1 X151.534 Y113.351 E.01656
G1 X151.384 Y113.018 E.00064
G1 X151.384 Y122.766 E.01696
G1 X151.336 Y122.734 E.0001
G1 X151.234 Y122.91 E.00036
G1 X151.234 Y103.03 E.03459
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X151.234 Y105.03 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.194 J.235 P1  F28800
G1 X153.034 Y114.169 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X153.034 Y115.101 E.00162
G1 X152.884 Y114.767 E.00064
G1 X152.884 Y114.236 E.00092
G1 X152.734 Y114.236 E.00026
G1 X152.734 Y114.598 E.00063
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X152.734 Y114.236 E-.04124
G1 X152.884 Y114.236 E-.0171
G1 X152.884 Y114.767 E-.06052
G1 X153.034 Y115.101 E-.04171
G1 X153.034 Y114.509 E-.06743
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.217 J-.018 P1  F28800
G1 X152.584 Y144.251 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X152.584 Y124.36 E.03461
G1 X152.434 Y124.407 E.00027
G1 X152.434 Y128.586 E.00727
G1 X152.284 Y128.586 E.00026
G1 X152.284 Y124.453 E.00719
G1 X152.134 Y124.499 E.00027
G1 X152.134 Y128.586 E.00711
G1 X151.984 Y128.586 E.00026
G1 X151.984 Y124.405 E.00727
G1 X151.834 Y124.181 E.00047
G1 X151.834 Y132.021 E.01364
G2 X151.684 Y131.87 I-.871 J.719 E.00037
G1 X151.684 Y123.973 E.01374
G1 X151.534 Y123.786 E.00042
G1 X151.534 Y131.744 E.01385
G2 X151.384 Y131.634 I-.604 J.669 E.00032
G1 X151.384 Y123.598 E.01398
G2 X151.234 Y123.467 I-.349 J.249 E.00035
G1 X151.234 Y131.538 E.01404
G1 X151.084 Y131.798 E.00052
G1 X151.084 Y103.458 E.04931
G1 X151.207 Y103.354 E.00028
G1 X151.084 Y103.208 E.00033
G1 X151.084 Y102.986 E.00039
G1 X150.934 Y103.135 F28800
G1 F3600
G1 X150.934 Y102.942 E.00033
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X150.934 Y103.135 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.215 J.061 P1  F28800
G1 X152.434 Y133.097 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X152.434 Y144.206 E.01933
G1 X152.284 Y144.23 E.00026
G1 X152.413 Y144.148 E.00027
G1 X152.284 Y143.918 E.00046
G1 X152.284 Y133.214 E.01862
G1 X152.134 Y133.259 E.00027
G1 X152.134 Y143.651 E.01808
G1 X151.984 Y143.383 E.00053
G1 X151.984 Y133.305 E.01754
G1 X151.963 Y133.311 E.00004
G1 X151.834 Y133.118 E.0004
G1 X151.834 Y143.116 E.0174
G1 X151.684 Y142.849 E.00053
G1 X151.684 Y132.895 E.01732
G2 X151.534 Y132.703 I-1.151 J.743 E.00042
G1 X151.534 Y142.582 E.01719
G1 X151.384 Y142.315 E.00053
G1 X151.384 Y132.518 E.01705
G2 X151.234 Y132.344 I-.452 J.238 E.0004
G1 X151.234 Y142.048 E.01688
G1 X151.084 Y141.781 E.00053
G1 X151.084 Y140.102 E.00292
G1 X150.934 Y140.158 E.00028
G1 X150.934 Y141.514 E.00236
G1 X150.784 Y141.246 E.00053
G1 X150.784 Y140.213 E.0018
G1 X150.634 Y140.269 E.00028
G1 X150.634 Y140.979 E.00124
G1 X150.569 Y140.865 E.00023
G1 X150.484 Y140.913 E.00017
G1 X150.484 Y140.19 E.00126
G1 X150.334 Y140.039 E.00037
G1 X150.334 Y140.997 E.00167
G1 X150.184 Y141.081 E.0003
G1 X150.184 Y139.889 E.00207
G1 X150.034 Y139.739 E.00037
G1 X150.034 Y141.166 E.00248
G1 X149.915 Y141.232 E.00024
G1 X150.034 Y141.444 E.00042
G1 X150.034 Y145.081 E.00633
G1 X149.884 Y145.158 E.00029
G1 X149.884 Y139.595 E.00968
G1 X149.734 Y139.504 E.00031
G1 X149.734 Y145.281 E.01005
G1 X149.584 Y145.431 E.00037
G1 X149.584 Y139.333 E.01061
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X149.584 Y141.333 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.174 J.321 P1  F28800
G1 X151.084 Y135.852 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X151.084 Y132.142 E.00646
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X151.084 Y134.142 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.212 J-.106 P1  F28800
G1 X150.934 Y135.852 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X150.934 Y103.584 E.05614
G1 X150.784 Y103.71 E.00034
G1 X150.784 Y135.784 E.05581
G1 X150.634 Y135.784 E.00026
G1 X150.634 Y103.836 E.05559
G1 X150.484 Y103.963 E.00034
G1 X150.484 Y110.886 E.01205
G1 X150.334 Y110.886 E.00026
G1 X150.334 Y104.089 E.01183
G1 X150.184 Y104.215 E.00034
G1 X150.184 Y110.886 E.01161
G1 X150.034 Y110.886 E.00026
G1 X150.034 Y104.341 E.01139
G1 X149.884 Y104.467 E.00034
G1 X149.884 Y114.272 E.01706
G2 X149.734 Y114.129 I-.869 J.766 E.00036
G1 X149.734 Y104.593 E.01659
G1 X149.584 Y104.72 E.00034
G1 X149.584 Y114.002 E.01615
G1 X149.434 Y113.901 E.00031
G1 X149.434 Y104.846 E.01576
G1 X149.284 Y104.972 E.00034
G1 X149.284 Y114.056 E.01581
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X149.284 Y112.056 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.146 J.409 P1  F28800
G1 X150.484 Y115.417 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X150.484 Y139.237 E.04144
G1 X150.334 Y139.118 E.00033
G1 X150.334 Y115.534 E.04103
G1 X150.184 Y115.58 E.00027
G1 X150.184 Y139.012 E.04077
G1 X150.034 Y138.913 E.00031
G1 X150.034 Y115.576 E.04061
G1 X149.884 Y115.352 E.00047
G1 X149.884 Y138.832 E.04085
G1 X149.734 Y138.752 E.0003
G1 X149.734 Y115.133 E.0411
G1 X149.584 Y114.946 E.00042
G1 X149.584 Y139.18 E.04217
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X149.584 Y137.18 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.217 J-.021 P1  F28800
G1 X149.434 Y145.676 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X149.434 Y114.758 E.05379
G2 X149.284 Y114.605 I-.391 J.234 E.00038
G1 X149.284 Y145.73 E.05416
M73 P71 R7
G1 X149.134 Y145.88 E.00037
G1 X149.134 Y114.489 E.05462
G1 X149.011 Y114.394 E.00027
G1 X149.134 Y114.181 E.00043
G1 X149.134 Y105.098 E.0158
G1 X148.984 Y105.224 E.00034
G1 X148.984 Y146.03 E.071
G1 X148.834 Y146.18 E.00037
G1 X148.834 Y105.35 E.07104
G1 X148.684 Y105.476 E.00034
G1 X148.684 Y146.329 E.07108
G1 X148.534 Y146.494 E.00039
G1 X148.534 Y140.089 E.01115
G1 X148.384 Y140.145 E.00028
G1 X148.384 Y146.789 E.01156
G1 X148.234 Y147.083 E.00057
G1 X148.234 Y140.2 E.01198
G1 X148.084 Y140.256 E.00028
G1 X148.084 Y147.377 E.01239
G1 X147.934 Y147.671 E.00057
G1 X147.934 Y140.224 E.01296
G1 X147.784 Y140.074 E.00037
G1 X147.784 Y148.155 E.01406
G1 X147.634 Y149.106 F28800
G1 F3600
G1 X147.634 Y139.923 E.01598
G1 X147.484 Y139.773 E.00037
G1 X147.484 Y149.586 E.01707
G1 X147.334 Y149.586 E.00026
G1 X147.334 Y139.622 E.01734
G2 X147.184 Y139.525 I-.275 J.259 E.00031
G1 X147.184 Y149.586 E.01751
G1 X147.034 Y149.586 E.00026
G1 X147.034 Y139.354 E.0178
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X147.034 Y141.354 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.174 J.32 P1  F28800
G1 X148.534 Y135.852 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X148.534 Y105.602 E.05263
G1 X148.384 Y105.728 E.00034
G1 X148.384 Y135.784 E.0523
G1 X148.234 Y135.784 E.00026
G1 X148.234 Y105.854 E.05208
G1 X148.084 Y105.979 E.00034
G1 X148.084 Y139.507 E.05834
G1 X147.934 Y139.356 F28800
G1 F3600
G1 X147.934 Y106.105 E.05785
G1 X147.784 Y106.231 E.00034
G1 X147.784 Y139.146 E.05727
G2 X147.634 Y139.036 I-.704 J.804 E.00032
G1 X147.634 Y106.357 E.05686
G1 X147.484 Y106.483 E.00034
G1 X147.484 Y138.937 E.05647
G2 X147.334 Y138.851 I-.526 J.741 E.0003
G1 X147.334 Y106.609 E.0561
G1 X147.184 Y106.734 E.00034
G1 X147.184 Y138.771 E.05574
G1 X147.123 Y138.739 E.00012
G1 X147.034 Y138.938 E.00038
G1 X147.034 Y106.86 E.05581
G1 X146.884 Y106.986 E.00034
G1 X146.884 Y149.586 E.07412
G1 X146.734 Y149.586 E.00026
G1 X146.734 Y107.112 E.0739
G1 X146.584 Y107.238 E.00034
G1 X146.584 Y149.586 E.07368
G1 X146.434 Y149.586 E.00026
G1 X146.434 Y107.364 E.07346
G1 X146.284 Y107.489 E.00034
G1 X146.284 Y149.586 E.07324
G1 X146.134 Y149.586 E.00026
G1 X146.134 Y107.615 E.07303
G1 X145.984 Y107.741 E.00034
G1 X145.984 Y149.586 E.07281
G1 X145.834 Y149.586 E.00026
G1 X145.834 Y107.867 E.07259
G1 X145.684 Y107.993 E.00034
G1 X145.684 Y149.586 E.07237
G1 X145.534 Y149.586 E.00026
G1 X145.534 Y108.119 E.07215
G1 X145.384 Y108.244 E.00034
G1 X145.384 Y149.654 E.07205
G1 X145.234 Y148.79 F28800
G1 F3600
G1 X145.234 Y108.37 E.07033
G1 X145.084 Y108.496 E.00034
G1 X145.084 Y147.974 E.06869
G1 X144.934 Y147.68 E.00058
G1 X144.934 Y108.622 E.06796
G1 X144.784 Y108.748 E.00034
G1 X144.784 Y147.385 E.06723
G1 X144.634 Y147.091 E.00058
G1 X144.634 Y108.874 E.06649
G1 X144.484 Y108.999 E.00034
G1 X144.484 Y146.796 E.06576
G2 X144.334 Y146.627 I-.335 J.146 E.0004
G1 X144.334 Y109.125 E.06525
G1 X144.184 Y109.251 E.00034
G1 X144.184 Y146.477 E.06477
G1 X144.034 Y146.327 E.00037
G1 X144.034 Y109.377 E.06429
G1 X143.884 Y109.503 E.00034
G1 X143.884 Y146.177 E.06381
G1 X143.734 Y146.027 E.00037
G1 X143.734 Y109.629 E.06333
G1 X143.584 Y109.754 E.00034
G1 X143.584 Y145.877 E.06285
G1 X143.434 Y145.727 E.00037
G1 X143.434 Y109.88 E.06237
G1 X143.284 Y110.006 E.00034
G1 X143.284 Y145.583 E.0619
G1 X143.134 Y145.507 E.00029
M73 P72 R7
G1 X143.134 Y110.132 E.06155
G1 X142.984 Y110.258 E.00034
G1 X142.984 Y145.431 E.0612
G1 X142.834 Y145.354 E.00029
G1 X142.834 Y113.285 E.0558
G1 X142.684 Y113.628 E.00065
G1 X142.684 Y114.97 E.00233
G1 X142.534 Y114.97 E.00026
G1 X142.534 Y113.852 E.00194
G3 X142.384 Y113.99 I-.365 J-.247 E.00036
G1 X142.384 Y114.97 E.00171
G1 X142.234 Y114.97 E.00026
G1 X142.234 Y114.079 E.00155
G3 X142.084 Y114.133 I-.162 J-.218 E.00028
G1 X142.084 Y114.97 E.00146
G1 X141.934 Y114.97 E.00026
G1 X141.934 Y114.152 E.00142
G1 X141.784 Y114.13 E.00026
G1 X141.784 Y114.97 E.00146
G1 X141.634 Y114.97 E.00026
G1 X141.634 Y114.072 E.00156
G3 X141.484 Y113.974 I.1 J-.317 E.00032
G1 X141.484 Y114.598 E.00109
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X141.484 Y113.974 E-.07113
G1 X141.558 Y114.037 E-.01112
G1 X141.634 Y114.072 E-.00949
G1 X141.634 Y114.97 E-.10241
G1 X141.784 Y114.97 E-.0171
G1 X141.784 Y114.823 E-.01674
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.766 J.945 P1  F28800
G1 X142.684 Y115.553 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X142.684 Y145.278 E.05172
G1 X142.534 Y145.201 E.00029
G1 X142.534 Y115.62 E.05147
G1 X142.384 Y115.62 E.00026
G1 X142.384 Y145.125 E.05134
G1 X142.234 Y145.049 E.00029
G1 X142.234 Y115.62 E.0512
G1 X142.084 Y115.62 E.00026
G1 X142.084 Y144.972 E.05107
G1 X141.934 Y144.896 E.00029
G1 X141.934 Y138.755 E.01068
G1 E-.56 F1800
; WIPE_START
M73 P73 R7
G1 F23040
G1 X141.934 Y140.755 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.203 J-.184 P1  F28800
G1 X141.784 Y139.774 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X141.784 Y144.834 E.0088
G1 X141.634 Y144.81 E.00026
G1 X141.634 Y140.268 E.0079
G3 X141.484 Y140.457 I-.506 J-.248 E.00042
G1 X141.484 Y144.786 E.00753
G1 X141.334 Y144.763 E.00026
G1 X141.334 Y140.56 E.00731
G3 X141.184 Y140.621 I-.17 J-.202 E.00029
G1 X141.184 Y144.739 E.00717
G1 X141.034 Y144.715 E.00026
G1 X141.034 Y140.649 E.00708
G1 X140.884 Y140.642 E.00026
G1 X140.884 Y144.692 E.00705
G1 X140.734 Y144.668 E.00026
G1 X140.734 Y140.607 E.00707
G3 X140.584 Y140.534 I.045 J-.282 E.00029
G1 X140.584 Y144.644 E.00715
G1 X140.434 Y144.621 E.00026
G1 X140.434 Y143.05 E.00273
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.434 Y144.621 E-.17901
G1 X140.584 Y144.644 E-.01731
G1 X140.584 Y144.367 E-.03167
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.216 J-.056 P1  F28800
G1 X140.434 Y141.117 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X140.434 Y140.41 E.00123
G3 X140.284 Y140.181 I.45 J-.458 E.00048
G1 X140.284 Y141.04 E.0015
G1 X140.134 Y141.033 E.00026
G1 X140.134 Y139.609 E.00248
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.134 Y141.033 E-.16224
G1 X140.284 Y141.04 E-.01712
G1 X140.284 Y140.614 E-.04864
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.021 J.662 P1  F28800
G1 X141.934 Y138.068 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X141.934 Y115.62 E.03906
G1 X141.784 Y115.62 E.00026
G1 X141.784 Y136.361 E.03609
G1 X141.634 Y136.094 E.00053
G1 X141.634 Y115.62 E.03562
G1 X141.484 Y115.62 E.00026
G1 X141.484 Y135.906 E.0353
G2 X141.334 Y135.795 I-.281 J.224 E.00033
G1 X141.334 Y115.62 E.0351
G1 X141.184 Y115.62 E.00026
G1 X141.184 Y135.735 E.035
G1 X141.034 Y135.708 E.00027
G1 X141.034 Y115.137 E.03579
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X141.034 Y117.137 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.216 J-.057 P1  F28800
G1 X140.884 Y113.949 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X140.884 Y135.786 E.03799
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.884 Y133.786 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.212 J.11 P1  F28800
G1 X142.834 Y112.282 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X142.834 Y110.384 E.0033
G1 X142.684 Y110.509 E.00034
G1 X142.684 Y111.404 E.00156
G1 X142.534 Y111.18 E.00047
G1 X142.534 Y110.635 E.00095
G1 X142.384 Y110.761 E.00034
G1 X142.384 Y111.014 E.00044
G2 X142.234 Y110.904 I-.268 J.208 E.00033
G1 X142.234 Y110.664 E.00042
G1 X142.084 Y110.486 E.0004
G1 X142.084 Y110.837 E.00061
G1 X141.934 Y110.815 E.00026
G1 X141.934 Y100.969 E.01713
G1 X141.784 Y101.165 E.00043
G1 X141.784 Y110.812 E.01679
G1 X141.634 Y110.831 E.00026
G1 X141.634 Y101.36 E.01648
G1 X141.484 Y101.556 E.00043
G1 X141.484 Y110.89 E.01624
G2 X141.334 Y110.981 I.081 J.304 E.00031
G1 X141.334 Y101.736 E.01609
G1 X141.184 Y101.851 E.00033
G1 X141.184 Y111.121 E.01613
G1 X141.034 Y111.348 E.00047
G1 X141.034 Y101.966 E.01632
G1 X140.884 Y102.081 E.00033
G1 X140.884 Y112.168 E.01755
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.884 Y110.168 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.217 J-.023 P1  F28800
G1 X140.734 Y102.111 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X140.734 Y135.75 E.05853
G2 X140.584 Y135.82 I.043 J.289 E.00029
G1 X140.584 Y102.312 E.0583
G1 X140.434 Y102.427 E.00033
G1 X140.434 Y135.943 E.05832
G1 X140.284 Y136.158 E.00046
G1 X140.284 Y102.542 E.05849
G1 X140.134 Y102.657 E.00033
G1 X140.134 Y136.769 E.05935
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.134 Y134.769 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.217 J-.029 P1  F28800
G1 X139.984 Y141.092 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X139.984 Y115.499 E.04453
G1 X139.834 Y115.544 E.00027
G1 X139.834 Y142.766 E.04736
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X139.834 Y140.766 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.216 J-.046 P1  F28800
G1 X139.684 Y144.731 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X139.684 Y115.59 E.0507
G1 X139.559 Y115.627 E.00023
G1 X139.534 Y115.589 E.00008
G1 X139.534 Y144.687 E.05063
G1 X139.384 Y144.711 E.00026
G1 X139.384 Y115.364 E.05106
G2 X139.234 Y115.142 I-1.39 J.778 E.00047
G1 X139.234 Y144.734 E.05149
G1 X139.084 Y144.758 E.00026
G1 X139.084 Y140.389 E.0076
G1 X138.934 Y140.435 E.00027
G1 X138.934 Y144.782 E.00756
G1 X138.784 Y144.805 E.00026
G1 X138.784 Y140.48 E.00752
G1 X138.664 Y140.517 E.00022
G1 X138.634 Y140.473 E.00009
G1 X138.634 Y144.829 E.00758
G2 X138.484 Y144.881 I.004 J.256 E.00028
G1 X138.484 Y140.251 E.00806
G2 X138.334 Y140.033 I-1.391 J.797 E.00046
G1 X138.334 Y144.957 E.00857
G1 X138.184 Y145.033 E.00029
G1 X138.184 Y139.846 E.00902
G1 X138.034 Y139.66 E.00042
G1 X138.034 Y145.11 E.00948
G1 X137.884 Y145.186 E.00029
G1 X137.884 Y139.421 E.01003
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X137.884 Y141.421 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.19 J.256 P1  F28800
G1 X139.084 Y135.852 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X139.084 Y114.954 E.03636
G1 X138.934 Y114.766 E.00042
G1 X138.934 Y135.784 E.03657
G1 X138.784 Y135.784 E.00026
G1 X138.784 Y114.523 E.03699
M73 P73 R6
G1 E-.56 F1800
; WIPE_START
G1 F23040
M73 P74 R6
G1 X138.784 Y116.523 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.19 J.256 P1  F28800
G1 X139.984 Y110.954 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X139.984 Y102.773 E.01423
G1 X139.834 Y102.888 E.00033
G1 X139.834 Y110.886 E.01392
G1 X139.684 Y110.886 E.00026
G1 X139.684 Y103.003 E.01372
G3 X139.534 Y103.077 I-.213 J-.242 E.00029
G1 X139.534 Y114.539 E.01994
G1 X139.384 Y114.373 F28800
G1 F3600
G1 X139.384 Y103.139 E.01955
G1 X139.234 Y103.201 E.00028
G1 X139.234 Y114.131 E.01902
G1 X139.084 Y114.004 E.00034
G1 X139.084 Y103.263 E.01869
G1 X138.934 Y103.325 E.00028
G1 X138.934 Y113.9 E.0184
G1 X138.837 Y113.834 E.0002
G1 X138.784 Y113.924 E.00018
G1 X138.784 Y103.387 E.01833
G1 X138.634 Y103.449 E.00028
G1 X138.634 Y114.179 E.01867
G1 X138.509 Y114.391 E.00043
G1 X138.634 Y114.49 E.00028
G1 X138.634 Y139.443 E.04342
G1 X138.484 Y139.269 F28800
G1 F3600
G1 X138.484 Y103.511 E.06222
G1 X138.334 Y103.573 E.00028
G1 X138.334 Y139.031 E.06169
G2 X138.184 Y138.904 I-.634 J.596 E.00034
G1 X138.184 Y103.635 E.06137
G1 X138.034 Y103.697 E.00028
G1 X138.034 Y118.536 E.02582
G1 X137.884 Y118.536 E.00026
G1 X137.884 Y103.759 E.02571
G1 X137.734 Y103.821 E.00028
G1 X137.734 Y118.536 E.0256
G1 X137.584 Y118.536 E.00026
G1 X137.584 Y103.864 E.02553
G1 X137.434 Y103.884 E.00026
G1 X137.434 Y118.536 E.02549
G1 X137.284 Y118.536 E.00026
G1 X137.284 Y103.904 E.02546
G1 X137.134 Y103.924 E.00026
G1 X137.134 Y118.536 E.02542
G1 X136.984 Y118.536 E.00026
G1 X136.984 Y103.943 E.02539
G1 X136.834 Y103.963 E.00026
G1 X136.834 Y118.536 E.02536
G1 X136.684 Y118.536 E.00026
G1 X136.684 Y103.983 E.02532
G1 X136.534 Y104.003 E.00026
G1 X136.534 Y118.536 E.02529
G1 X136.384 Y118.536 E.00026
G1 X136.384 Y104.023 E.02525
G1 X136.234 Y104.043 E.00026
G1 X136.234 Y118.536 E.02522
G1 X136.084 Y118.536 E.00026
G1 X136.084 Y104.062 E.02518
G1 X135.934 Y104.082 E.00026
G1 X135.934 Y118.604 E.02527
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X135.934 Y116.604 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.206 J.163 P1  F28800
G1 X138.034 Y132.117 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X138.034 Y138.803 E.01163
G1 X137.934 Y138.736 E.00021
G1 X137.884 Y138.823 E.00017
G1 X137.884 Y132.184 E.01155
G1 X137.734 Y132.184 E.00026
G1 X137.734 Y139.082 E.012
G1 X137.611 Y139.294 E.00043
G1 X137.734 Y139.39 E.00027
G1 X137.734 Y145.263 E.01022
G1 X137.584 Y145.339 E.00029
G1 X137.584 Y132.184 E.02289
G1 X137.434 Y132.184 E.00026
G1 X137.434 Y145.415 E.02302
G1 X137.284 Y145.492 E.00029
G1 X137.284 Y132.184 E.02315
G1 X137.134 Y132.184 E.00026
G1 X137.132 Y145.569 E.02329
G2 X136.984 Y145.697 I.123 J.292 E.00035
G1 X136.984 Y132.184 E.02351
G1 X136.834 Y132.184 E.00026
G1 X136.834 Y145.847 E.02377
G1 X136.684 Y145.997 E.00037
G1 X136.684 Y132.184 E.02403
G1 X136.534 Y132.184 E.00026
G1 X136.534 Y146.147 E.02429
G1 X136.384 Y146.297 E.00037
G1 X136.384 Y132.184 E.02456
G1 X136.234 Y132.184 E.00026
G1 X136.234 Y146.447 E.02482
G1 X136.084 Y146.597 E.00037
G1 X136.084 Y132.184 E.02508
G1 X135.934 Y132.184 E.00026
G1 X135.934 Y146.747 E.02534
G1 X135.784 Y147.032 E.00056
G1 X135.784 Y104.102 E.07469
G1 X135.634 Y104.122 E.00026
G1 X135.634 Y147.326 E.07517
G1 X135.484 Y147.621 E.00058
G1 X135.484 Y104.135 E.07566
G1 X135.334 Y104.115 E.00026
G1 X135.334 Y147.915 E.07621
G1 X135.184 Y148.21 E.00058
G1 X135.184 Y127.078 E.03677
G1 X135.034 Y127.415 E.00064
G1 X135.034 Y149.551 E.03851
G1 X134.884 Y149.654 F28800
G1 F3600
G1 X134.884 Y127.708 E.03818
G1 X134.734 Y127.886 E.0004
G1 X134.734 Y149.586 E.03776
G1 X134.584 Y149.586 E.00026
G1 X134.584 Y128.064 E.03745
G1 X134.434 Y128.242 E.0004
G1 X134.434 Y149.586 E.03714
G1 X134.284 Y149.586 E.00026
G1 X134.284 Y128.345 E.03696
G1 X134.134 Y128.446 E.00031
G1 X134.134 Y149.586 E.03678
G1 X133.984 Y149.586 E.00026
G1 X133.984 Y128.546 E.03661
G1 X133.834 Y128.646 E.00031
G1 X133.834 Y149.586 E.03643
G1 X133.684 Y149.586 E.00026
G1 X133.684 Y128.711 E.03632
G1 X133.534 Y128.76 E.00027
G1 X133.534 Y149.586 E.03624
G1 X133.384 Y149.586 E.00026
G1 X133.384 Y128.808 E.03615
G1 X133.234 Y128.856 E.00027
G1 X133.234 Y149.586 E.03607
G1 X133.084 Y149.586 E.00026
G1 X133.084 Y128.905 E.03598
G3 X132.934 Y128.919 I-.1 J-.251 E.00027
G1 X132.934 Y149.654 E.03608
G1 X132.784 Y149.55 F28800
G1 F3600
G1 X132.784 Y139.468 E.01754
G3 X132.634 Y139.834 I-.669 J-.061 E.0007
G1 X132.634 Y148.317 E.01476
G1 X132.484 Y148.023 E.00057
G1 X132.484 Y140.089 E.0138
G1 X132.334 Y140.229 E.00036
G1 X132.334 Y147.729 E.01305
M73 P75 R6
G1 X132.184 Y147.435 E.00057
G1 X132.184 Y140.365 E.0123
G3 X132.034 Y140.46 I-.288 J-.286 E.00031
G1 X132.034 Y147.141 E.01162
G2 X131.884 Y146.947 I-.374 J.134 E.00043
G1 X131.884 Y140.532 E.01116
G1 X131.734 Y140.577 E.00027
G1 X131.734 Y146.797 E.01082
G1 X131.584 Y146.647 E.00037
G1 X131.584 Y140.623 E.01048
G3 X131.434 Y140.638 I-.1 J-.239 E.00027
G1 X131.434 Y146.497 E.01019
G1 X131.284 Y146.347 E.00037
G1 X131.284 Y141.574 E.00831
G1 X131.134 Y141.797 E.00047
G1 X131.134 Y146.197 E.00766
G1 X130.984 Y146.047 E.00037
G1 X130.984 Y142.021 E.00701
G1 X130.834 Y142.244 E.00047
G1 X130.834 Y145.945 E.00644
G1 X130.684 Y145.868 E.00029
G1 X130.684 Y142.468 E.00592
G1 X130.534 Y142.691 E.00047
G1 X130.534 Y145.792 E.00539
G1 X130.384 Y145.716 E.00029
G1 X130.384 Y142.915 E.00487
G1 X130.234 Y143.138 E.00047
G1 X130.234 Y145.639 E.00435
G1 X130.084 Y145.563 E.00029
G1 X130.084 Y143.362 E.00383
G1 X129.934 Y143.585 E.00047
G1 X129.934 Y145.487 E.00331
G1 X129.784 Y145.41 E.00029
G1 X129.784 Y143.809 E.00279
G1 X129.634 Y144.032 E.00047
G1 X129.634 Y145.334 E.00226
G2 X129.484 Y145.298 I-.131 J.213 E.00027
G1 X129.484 Y144.256 E.00181
G1 X129.334 Y144.479 E.00047
G1 X129.334 Y145.274 E.00138
G1 X129.184 Y145.251 E.00026
G1 X129.184 Y144.703 E.00095
G1 X129.034 Y144.927 E.00047
G1 X129.034 Y145.227 E.00052
G1 X128.884 Y145.203 E.00026
G1 X128.884 Y145.029 E.0003
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X128.884 Y145.203 E-.01986
G1 X129.034 Y145.227 E-.01731
G1 X129.034 Y144.927 E-.03424
G1 X129.184 Y144.703 E-.03069
G1 X129.184 Y145.251 E-.06242
G1 X129.334 Y145.274 E-.01731
G1 X129.334 Y144.869 E-.04617
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.075 J.571 P1  F28800
G1 X131.284 Y141.199 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X131.284 Y140.638 E.00098
G1 X131.134 Y140.638 E.00026
G1 X131.134 Y141.017 E.00066
G1 X130.984 Y140.916 E.00031
G1 X130.984 Y140.618 E.00052
G1 X130.834 Y140.572 E.00027
G1 X130.834 Y140.903 E.00058
G1 X130.684 Y141.127 E.00047
G1 X130.684 Y140.526 E.00104
G3 X130.534 Y140.44 I.065 J-.285 E.00031
G1 X130.534 Y141.35 E.00158
G1 X130.384 Y141.573 E.00047
G1 X130.384 Y140.337 E.00215
G3 X130.234 Y140.199 I.148 J-.312 E.00036
G1 X130.234 Y141.796 E.00278
G1 X130.084 Y142.02 E.00047
G1 X130.084 Y140.011 E.0035
G3 X129.934 Y139.725 I.358 J-.37 E.00057
G1 X129.934 Y142.364 E.00459
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X129.934 Y140.364 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.89 J.83 P1  F28800
G1 X132.784 Y137.305 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X132.784 Y128.924 E.01458
G1 X132.634 Y128.928 E.00026
G1 X132.634 Y136.63 E.0134
G1 X132.484 Y136.343 E.00056
G1 X132.484 Y128.932 E.01289
G1 X132.334 Y128.937 E.00026
G1 X132.334 Y136.181 E.0126
G2 X132.184 Y136.024 I-.484 J.313 E.00038
G1 X132.184 Y128.915 E.01237
G1 X132.034 Y128.876 E.00027
G1 X132.034 Y135.936 E.01228
G1 X131.884 Y135.856 E.0003
G1 X131.884 Y128.838 E.01221
G1 X131.734 Y128.8 E.00027
G1 X131.734 Y135.786 E.01216
G1 X131.584 Y135.757 E.00027
G1 X131.584 Y128.761 E.01217
G3 X131.434 Y128.692 I.046 J-.297 E.00029
G1 X131.434 Y135.727 E.01224
G2 X131.284 Y135.709 I-.108 J.256 E.00027
G1 X131.284 Y128.605 E.01236
G1 X131.134 Y128.517 E.0003
G1 X131.134 Y135.722 E.01254
G1 X130.984 Y135.734 E.00026
G1 X130.984 Y128.429 E.01271
G3 X130.834 Y128.327 I.108 J-.32 E.00032
G1 X130.834 Y135.751 E.01292
G1 X130.684 Y135.807 E.00028
G1 X130.684 Y128.17 E.01329
G1 X130.534 Y128.012 E.00038
G1 X130.534 Y135.866 E.01366
G1 X130.384 Y135.978 E.00033
G1 X130.384 Y127.881 E.01409
G1 X130.234 Y128.066 E.00041
G1 X130.234 Y136.096 E.01397
G1 X130.084 Y136.305 E.00045
G1 X130.084 Y128.251 E.01401
G1 X129.934 Y128.433 E.00041
G1 X129.934 Y138.452 E.01743
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X129.934 Y136.452 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.217 J-.03 P1  F28800
G1 X129.784 Y142.587 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X129.784 Y128.537 E.02445
G1 X129.634 Y128.64 E.00032
G1 X129.634 Y142.689 E.02445
G1 X129.484 Y142.913 E.00047
G1 X129.484 Y128.743 E.02465
G1 X129.334 Y128.847 E.00032
G1 X129.334 Y143.136 E.02486
G1 X129.184 Y143.359 E.00047
G1 X129.184 Y128.92 E.02512
G1 X129.034 Y128.97 E.00028
G1 X129.034 Y143.583 E.02542
G1 X128.884 Y143.806 E.00047
G1 X128.884 Y129.02 E.02573
G1 X128.734 Y129.07 E.00028
G1 X128.734 Y144.029 E.02603
G1 X128.584 Y144.252 E.00047
G1 X128.584 Y129.12 E.02633
G3 X128.434 Y129.153 I-.132 J-.236 E.00027
G1 X128.434 Y144.597 E.02687
G1 X128.284 Y145.176 F28800
G1 F3600
G1 X128.284 Y129.158 E.02787
G1 X128.134 Y129.163 E.00026
G1 X128.134 Y145.084 E.0277
G2 X127.984 Y145.105 I-.044 J.241 E.00027
G1 X127.984 Y129.168 E.02773
G1 X127.834 Y129.173 E.00026
G1 X127.834 Y145.128 E.02776
G1 X127.684 Y145.152 E.00026
G1 X127.684 Y129.178 E.02779
G3 X127.534 Y129.143 I-.016 J-.273 E.00027
G1 X127.534 Y145.176 E.0279
G1 X127.384 Y145.2 E.00026
G1 X127.384 Y129.104 E.028
G1 X127.234 Y129.066 E.00027
G1 X127.234 Y145.223 E.02811
G1 X127.084 Y145.247 E.00026
G1 X127.084 Y129.027 E.02822
G1 X126.934 Y128.988 E.00027
G1 X126.934 Y145.271 E.02833
G1 X126.784 Y145.295 E.00026
G1 X126.784 Y128.918 E.02849
G1 X126.634 Y128.829 E.0003
G1 X126.634 Y145.323 E.0287
G1 X126.484 Y145.399 E.00029
G1 X126.484 Y128.74 E.02898
G1 X126.334 Y128.651 E.0003
G1 X126.334 Y145.475 E.02927
G1 X126.184 Y145.552 E.00029
G1 X126.184 Y128.562 E.02956
G1 X126.034 Y128.406 E.00038
G1 X126.034 Y145.628 E.02996
G1 X125.884 Y145.704 E.00029
G1 X125.884 Y128.146 E.03055
G1 X125.734 Y127.985 F28800
G1 F3600
G1 X125.734 Y145.78 E.03096
G1 X125.584 Y145.856 E.00029
G1 X125.584 Y129.102 E.02915
G1 X125.434 Y129.102 E.00026
G1 X125.434 Y145.932 E.02928
M73 P76 R6
G2 X125.284 Y146.023 I.064 J.275 E.00031
G1 X125.284 Y129.035 E.02956
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X125.284 Y131.035 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.855 J.866 P1  F28800
G1 X135.184 Y121.254 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X135.184 Y104.095 E.02985
G1 X135.034 Y104.076 E.00026
G1 X135.034 Y121.186 E.02977
G1 X134.884 Y121.186 E.00026
G1 X134.884 Y104.056 E.02981
G1 X134.734 Y104.036 E.00026
G1 X134.734 Y126.395 E.0389
G1 X134.584 Y127.004 F28800
G1 F3600
G1 X134.584 Y104.016 E.04
G1 X134.434 Y103.996 E.00026
G1 X134.434 Y127.162 E.04031
G1 X134.332 Y127.375 E.00041
G1 X134.284 Y127.427 E.00012
G1 X134.284 Y103.976 E.0408
G1 X134.134 Y103.956 E.00026
G1 X134.134 Y127.59 E.04112
G1 X133.984 Y127.753 E.00039
G1 X133.984 Y103.937 E.04144
G1 X133.834 Y103.917 E.00026
G1 X133.834 Y127.879 E.04169
G1 X133.684 Y127.967 E.0003
G1 X133.684 Y103.897 E.04188
G1 X133.534 Y103.877 E.00026
G1 X133.534 Y128.055 E.04207
G1 X133.384 Y128.143 E.0003
G1 X133.384 Y103.857 E.04225
G3 X133.271 Y103.815 I.022 J-.231 E.00021
G1 X133.234 Y103.959 E.00026
G1 X133.234 Y128.184 E.04215
G1 X133.084 Y128.22 E.00027
G1 X133.084 Y104.264 E.04168
G1 X132.934 Y104.835 F28800
G1 F3600
G1 X132.934 Y128.255 E.04075
G1 X132.784 Y128.291 E.00027
G1 X132.784 Y105.406 E.03982
G1 X132.634 Y105.976 F28800
G1 F3600
G1 X132.634 Y111.684 E.00993
G1 X132.611 Y111.541 E.00025
G1 X132.484 Y111.265 E.00053
G1 X132.484 Y106.547 E.00821
G1 X132.334 Y107.118 F28800
G1 F3600
G1 X132.334 Y111.026 E.0068
G1 X132.184 Y110.866 E.00038
G1 X132.184 Y107.688 E.00553
G1 X132.034 Y108.259 F28800
G1 F3600
G1 X132.034 Y110.775 E.00438
G2 X131.884 Y110.729 I-.152 J.225 E.00028
G1 X131.884 Y108.83 E.0033
G1 X131.734 Y109.4 F28800
G1 F3600
G1 X131.734 Y110.712 E.00228
G2 X131.584 Y110.717 I-.066 J.26 E.00026
G1 X131.584 Y110.237 E.00084
G1 X131.482 Y110.623 E.00069
G1 X131.434 Y110.61 E.00009
G1 X131.434 Y110.764 E.00027
G2 X131.284 Y110.846 I.052 J.272 E.0003
G1 X131.284 Y110.571 E.00048
G1 X131.134 Y110.531 E.00027
G1 X131.134 Y110.972 E.00077
G1 X130.984 Y111.162 E.00042
G1 X130.984 Y110.422 E.00129
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X130.984 Y111.162 E-.08431
G1 X131.134 Y110.972 E-.02756
G1 X131.134 Y110.531 E-.05026
G1 X131.284 Y110.571 E-.01768
G1 X131.284 Y110.846 E-.03144
G1 X131.373 Y110.783 E-.01249
G1 X131.409 Y110.772 E-.00426
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.026 J-.654 P1  F28800
G1 X130.834 Y111.674 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X130.834 Y102.617 E.01576
G1 X130.684 Y102.502 E.00033
G1 X130.684 Y113.098 E.01844
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X130.684 Y111.098 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.751 J.957 P1  F28800
G1 X132.634 Y112.629 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X132.634 Y128.289 E.02725
G1 X132.484 Y128.279 E.00026
G1 X132.484 Y115.152 E.02284
G1 X132.334 Y115.385 E.00048
G1 X132.334 Y128.269 E.02242
G1 X132.184 Y128.259 E.00026
G1 X132.184 Y115.524 E.02216
G1 X132.034 Y115.601 E.00029
G1 X132.034 Y128.218 E.02195
G1 X131.884 Y128.161 E.00028
G1 X131.884 Y115.637 E.02179
G3 X131.734 Y115.65 I-.097 J-.255 E.00027
G1 X131.734 Y128.105 E.02167
G1 X131.584 Y128.048 E.00028
G1 X131.584 Y115.631 E.0216
G3 X131.434 Y115.581 I.014 J-.29 E.00028
G1 X131.434 Y127.948 E.02152
G1 X131.284 Y127.831 E.00033
G1 X131.284 Y115.493 E.02147
G3 X131.134 Y115.359 I.159 J-.329 E.00035
G1 X131.134 Y127.715 E.0215
G3 X130.984 Y127.558 I.18 J-.322 E.00038
G1 X130.984 Y115.143 E.0216
G1 X130.938 Y115.076 E.00014
G1 X130.834 Y114.807 E.0005
G1 X130.834 Y127.462 E.02202
G1 X130.684 Y127.248 F28800
G1 F3600
G1 X130.684 Y113.228 E.02439
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X130.684 Y115.228 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.217 J-.03 P1  F28800
G1 X130.534 Y121.254 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X130.534 Y102.387 E.03283
G1 X130.384 Y102.272 E.00033
G1 X130.384 Y121.186 E.03291
G1 X130.234 Y121.186 E.00026
G1 X130.234 Y102.156 E.03311
G1 X130.084 Y102.041 E.00033
G1 X130.084 Y127.223 E.04382
G1 X129.934 Y127.477 F28800
G1 F3600
G1 X129.934 Y101.926 E.04446
G1 X129.784 Y101.811 E.00033
G1 X129.784 Y110.784 E.01561
G1 X129.634 Y110.784 E.00026
G1 X129.634 Y101.683 E.01583
G1 X129.484 Y101.488 E.00043
G1 X129.484 Y110.784 E.01617
G1 X129.334 Y110.784 E.00026
M73 P77 R6
G1 X129.334 Y101.292 E.01651
G1 X129.184 Y101.097 E.00043
G1 X129.184 Y114.174 E.02275
G2 X129.034 Y114.031 I-.876 J.773 E.00036
G1 X129.034 Y100.901 E.02285
G1 X128.884 Y100.706 E.00043
G1 X128.884 Y113.904 E.02296
G1 X128.734 Y113.8 E.00032
G1 X128.734 Y100.51 E.02312
G1 X128.584 Y100.315 E.00043
G1 X128.584 Y113.959 E.02374
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X128.584 Y111.959 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.146 J.409 P1  F28800
G1 X129.784 Y115.321 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X129.784 Y127.597 E.02136
G3 X129.634 Y127.796 I-.386 J-.136 E.00044
G1 X129.634 Y115.438 E.0215
G1 X129.484 Y115.484 E.00027
G1 X129.484 Y127.929 E.02165
G1 X129.334 Y128.063 E.00035
G1 X129.334 Y115.48 E.02189
G1 X129.184 Y115.256 E.00047
G1 X129.184 Y128.192 E.02251
G1 X129.034 Y128.258 E.00029
G1 X129.034 Y115.035 E.02301
G1 X128.884 Y114.848 E.00042
G1 X128.884 Y128.325 E.02345
G1 X128.734 Y128.391 E.00029
G1 X128.734 Y114.661 E.02389
G2 X128.584 Y114.506 I-.399 J.237 E.00038
G1 X128.584 Y128.458 E.02427
G3 X128.434 Y128.48 I-.109 J-.228 E.00027
G1 X128.434 Y114.39 E.02452
G1 X128.311 Y114.294 E.00027
G1 X128.434 Y114.083 E.00043
G1 X128.434 Y100.119 E.0243
G3 X128.284 Y99.861 I.409 J-.41 E.00053
G1 X128.284 Y128.497 E.04982
G1 X128.134 Y128.514 E.00026
G1 X128.134 Y99.499 E.05048
G1 X127.984 Y99.138 E.00068
G1 X127.984 Y128.531 E.05114
G3 X127.834 Y128.529 I-.072 J-.238 E.00027
G1 X127.834 Y98.776 E.05177
G1 X127.684 Y98.415 E.00068
G1 X127.684 Y128.5 E.05235
G1 X127.534 Y128.471 E.00027
G1 X127.534 Y97.644 E.05364
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X127.534 Y99.644 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.216 J-.058 P1  F28800
G1 X127.384 Y96.502 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X127.384 Y128.442 E.05557
G1 X127.234 Y128.413 E.00027
G1 X127.234 Y96.136 E.05616
G1 X127.084 Y96.136 E.00026
G1 X127.084 Y128.333 E.05602
G1 X126.934 Y128.251 E.0003
G1 X126.934 Y96.136 E.05588
G1 X126.784 Y96.136 E.00026
G1 X126.784 Y128.17 E.05574
G1 X126.634 Y128.088 E.0003
G1 X126.634 Y96.136 E.05559
G1 X126.484 Y96.136 E.00026
G1 X126.484 Y127.934 E.05533
G1 X126.334 Y127.777 E.00038
G1 X126.334 Y96.136 E.05505
G1 X126.184 Y96.136 E.00026
G1 X126.184 Y127.621 E.05478
G1 X126.034 Y127.343 E.00055
G1 X126.034 Y96.136 E.0543
G1 X125.884 Y96.136 E.00026
G1 X125.884 Y127.192 E.05403
G1 X125.734 Y126.632 F28800
G1 F3600
G1 X125.734 Y96.136 E.05306
G1 X125.584 Y96.136 E.00026
G1 X125.584 Y121.186 E.04358
G1 X125.434 Y121.186 E.00026
G1 X125.434 Y96.136 E.04358
G1 X125.284 Y96.136 E.00026
G1 X125.284 Y121.254 E.0437
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X125.284 Y119.254 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.217 J-.007 P1  F28800
G1 X125.134 Y146.269 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
M73 P77 R5
G1 X125.134 Y96.136 E.08723
G1 X124.984 Y96.136 E.00026
G1 X124.984 Y146.323 E.08732
G1 X124.834 Y146.473 E.00037
G1 X124.834 Y96.136 E.08758
G1 X124.684 Y96.136 E.00026
G1 X124.684 Y136.658 E.07051
G1 X124.534 Y136.355 E.00059
G1 X124.534 Y96.069 E.0701
G1 X124.384 Y96.47 F28800
G1 F3600
G1 X124.384 Y136.188 E.06911
G1 X124.234 Y136.03 E.00038
G1 X124.234 Y98.123 E.06596
G1 X124.084 Y98.491 E.00069
G1 X124.084 Y135.942 E.06516
G1 X123.934 Y135.855 E.0003
G1 X123.934 Y98.854 E.06438
G1 X123.784 Y99.217 E.00068
G1 X123.784 Y135.787 E.06363
G1 X123.634 Y135.752 E.00027
G1 X123.634 Y99.58 E.06294
G1 X123.484 Y99.943 E.00068
G1 X123.484 Y135.717 E.06224
G1 X123.434 Y135.706 E.00009
G2 X123.334 Y135.701 I-.059 J.199 E.00018
M73 P78 R5
G1 X123.334 Y100.28 E.06163
G1 X123.184 Y100.475 E.00043
G1 X123.184 Y135.71 E.06131
G1 X123.034 Y135.719 E.00026
G1 X123.034 Y100.671 E.06098
G1 X122.884 Y100.866 E.00043
G1 X122.884 Y135.743 E.06068
G1 X122.734 Y135.799 E.00028
G1 X122.734 Y126.965 E.01537
G1 X122.584 Y127.302 E.00064
G1 X122.584 Y135.855 E.01488
G2 X122.434 Y135.94 I.067 J.295 E.0003
G1 X122.434 Y127.64 E.01444
G1 X122.284 Y127.827 E.00042
G1 X122.284 Y136.053 E.01431
G2 X122.134 Y136.177 I.127 J.306 E.00034
G1 X122.134 Y128.005 E.01422
G1 X121.984 Y128.183 E.0004
G1 X121.984 Y136.385 E.01427
G2 X121.834 Y136.692 I.436 J.403 E.0006
G1 X121.834 Y128.231 E.01472
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X121.834 Y130.231 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.211 J.121 P1  F28800
G1 X122.734 Y121.254 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X122.734 Y101.061 E.03513
G1 X122.584 Y101.256 E.00043
G1 X122.584 Y121.186 E.03468
G1 X122.434 Y121.186 E.00026
G1 X122.434 Y101.452 E.03434
G1 X122.284 Y101.647 E.00043
G1 X122.284 Y121.254 E.03411
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.284 Y119.254 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.217 J-.024 P1  F28800
G1 X122.134 Y126.9 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X122.134 Y101.842 E.0436
G1 X121.984 Y102.037 E.00043
G1 X121.984 Y127.057 E.04353
G1 X121.834 Y127.371 E.00061
G1 X121.834 Y102.165 E.04386
G1 X121.684 Y102.28 E.00033
G1 X121.684 Y127.536 E.04394
G1 X121.534 Y127.699 E.00039
G1 X121.534 Y102.395 E.04403
G1 X121.384 Y102.51 E.00033
G1 X121.384 Y127.85 E.04409
G1 X121.234 Y127.938 E.0003
G1 X121.234 Y102.625 E.04404
G1 X121.084 Y102.74 E.00033
G1 X121.084 Y128.025 E.04399
G1 X120.934 Y128.113 E.0003
G1 X120.934 Y102.855 E.04395
G1 X120.784 Y102.97 E.00033
G1 X120.784 Y128.172 E.04385
G1 X120.634 Y128.208 E.00027
G1 X120.634 Y103.085 E.04371
G1 X120.484 Y103.2 E.00033
G1 X120.484 Y128.244 E.04357
G1 X120.334 Y128.279 E.00027
G1 X120.334 Y103.315 E.04344
M73 P79 R5
G1 X120.184 Y103.43 E.00033
G1 X120.184 Y128.293 E.04326
G1 X120.034 Y128.282 E.00026
G1 X120.034 Y103.507 E.04311
G1 X119.884 Y103.569 E.00028
G1 X119.884 Y128.272 E.04298
G1 X119.734 Y128.262 E.00026
G1 X119.734 Y103.631 E.04286
G1 X119.584 Y103.693 E.00028
G1 X119.584 Y128.238 E.04271
G1 X119.434 Y128.181 E.00028
G1 X119.434 Y103.755 E.0425
G1 X119.284 Y103.817 E.00028
G1 X119.284 Y128.124 E.04229
G1 X119.134 Y128.067 E.00028
G1 X119.134 Y103.879 E.04209
G1 X118.984 Y103.941 E.00028
G1 X118.984 Y127.986 E.04184
G1 X118.834 Y127.87 E.00033
G1 X118.834 Y104.003 E.04153
G1 X118.684 Y104.065 E.00028
G1 X118.684 Y127.754 E.04122
G3 X118.534 Y127.629 I.128 J-.306 E.00035
G1 X118.534 Y104.127 E.04089
G1 X118.384 Y104.189 E.00028
G1 X118.384 Y127.415 E.04041
G1 X118.234 Y127.202 E.00045
G1 X118.234 Y104.251 E.03993
G1 X118.084 Y104.313 E.00028
G1 X118.084 Y121.186 E.02936
G1 X117.934 Y121.186 E.00026
G1 X117.934 Y104.349 E.02929
G1 X117.784 Y104.369 E.00026
G1 X117.784 Y121.186 E.02926
G1 X117.634 Y121.186 E.00026
G1 X117.634 Y104.389 E.02923
G1 X117.484 Y104.409 E.00026
G1 X117.484 Y127.262 E.03976
G1 X117.334 Y127.512 E.00051
G1 X117.334 Y115.62 E.02069
G1 X117.468 Y115.62 E.00023
G1 X117.334 Y115.378 E.00048
G1 X117.334 Y104.428 E.01905
G1 X117.184 Y104.448 E.00026
G1 X117.184 Y115.108 E.01855
G1 X117.034 Y114.838 E.00054
G1 X117.034 Y104.468 E.01804
G1 X116.884 Y104.488 E.00026
G1 X116.884 Y114.549 E.01751
G1 X116.734 Y114.193 E.00067
G1 X116.734 Y104.507 E.01685
G1 X116.584 Y104.527 E.00026
G1 X116.584 Y114.01 E.0165
G1 X116.434 Y113.581 F28800
G1 F3600
G1 X116.434 Y104.547 E.01572
G1 X116.284 Y104.567 E.00026
G1 X116.284 Y112.999 E.01467
G1 X116.134 Y112.416 F28800
G1 F3600
G1 X116.134 Y104.586 E.01362
G1 X115.984 Y104.606 E.00026
G1 X115.984 Y110.88 E.01092
G1 X115.834 Y110.881 E.00026
G1 X115.834 Y104.626 E.01088
G3 X115.684 Y104.627 I-.077 J-.279 E.00026
G1 X115.684 Y110.883 E.01089
G1 X115.534 Y110.885 E.00026
G1 X115.534 Y104.607 E.01092
G1 X115.384 Y104.588 E.00026
G1 X115.384 Y114.97 E.01806
G1 X115.234 Y114.97 E.00026
G1 X115.234 Y110.534 E.00772
G1 X115.084 Y110.534 E.00026
G1 X115.084 Y115.038 E.00784
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X115.084 Y113.038 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.934 J.78 P1  F28800
G1 X117.184 Y115.553 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X117.184 Y127.749 E.02122
G1 X117.034 Y127.883 E.00035
G1 X117.034 Y115.62 E.02134
G1 X116.884 Y115.62 E.00026
G1 X116.884 Y128.016 E.02157
G1 X116.734 Y128.15 E.00035
G1 X116.734 Y115.62 E.0218
G1 X116.584 Y115.62 E.00026
G1 X116.584 Y128.235 E.02195
G1 X116.434 Y128.303 E.00029
G1 X116.434 Y115.62 E.02207
G1 X116.284 Y115.62 E.00026
G1 X116.284 Y128.37 E.02218
G1 X116.134 Y128.437 E.00029
G1 X116.134 Y115.62 E.0223
G1 X115.984 Y115.62 E.00026
G1 X115.984 Y128.474 E.02236
G1 X115.834 Y128.491 E.00026
G1 X115.834 Y115.62 E.02239
M73 P80 R5
G1 X115.684 Y115.62 E.00026
G1 X115.684 Y128.508 E.02242
G1 X115.534 Y128.525 E.00026
G1 X115.534 Y115.62 E.02245
G1 X115.384 Y115.62 E.00026
G1 X115.384 Y128.539 E.02248
G1 X115.234 Y128.51 E.00027
G1 X115.234 Y115.62 E.02243
G1 X115.084 Y115.62 E.00026
G1 X115.084 Y128.481 E.02238
G1 X114.934 Y128.451 E.00027
G1 X114.934 Y110.534 E.03117
G1 X114.784 Y110.534 E.00026
G1 X114.784 Y128.422 E.03112
G3 X114.634 Y128.36 I.023 J-.268 E.00029
G1 X114.634 Y110.467 E.03113
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.634 Y112.467 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.217 J-.023 P1  F28800
G1 X114.484 Y104.401 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X114.484 Y128.279 E.04155
G1 X114.334 Y128.197 E.0003
G1 X114.334 Y104.449 E.04132
G1 X114.184 Y104.429 E.00026
G1 X114.184 Y110.886 E.01123
G1 X114.034 Y110.886 E.00026
G1 X114.034 Y104.41 E.01127
G1 X113.884 Y104.39 E.00026
G1 X113.884 Y110.886 E.0113
G1 X113.734 Y110.886 E.00026
G1 X113.734 Y104.37 E.01134
G1 X113.584 Y104.35 E.00026
G1 X113.584 Y114.376 E.01744
G1 X113.434 Y114.221 E.00037
G1 X113.434 Y104.317 E.01723
G1 X113.284 Y104.255 E.00028
G1 X113.284 Y114.088 E.01711
G2 X113.134 Y113.969 I-.645 J.664 E.00033
G1 X113.134 Y104.193 E.01701
G1 X112.984 Y104.131 E.00028
G1 X112.984 Y113.867 E.01694
G1 X112.934 Y113.834 E.0001
G1 X112.834 Y114.007 E.00035
G1 X112.834 Y103.996 E.01742
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.834 Y105.996 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.205 J.173 P1  F28800
G1 X114.184 Y115.39 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X114.184 Y128.115 E.02214
G3 X114.034 Y127.986 I.129 J-.301 E.00035
G1 X114.034 Y115.507 E.02171
G1 X113.884 Y115.553 E.00027
G1 X113.884 Y127.829 E.02136
G1 X113.734 Y127.673 E.00038
G1 X113.734 Y115.599 E.02101
G1 X113.661 Y115.621 E.00013
G1 X113.584 Y115.505 E.00024
G1 X113.584 Y127.444 E.02077
G1 X113.434 Y127.141 E.00059
G1 X113.434 Y115.281 E.02063
G2 X113.284 Y115.073 I-1.296 J.775 E.00045
G1 X113.284 Y126.953 E.02067
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.284 Y124.953 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.216 J-.049 P1  F28800
G1 X113.134 Y121.254 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X113.134 Y114.886 E.01108
G1 X112.984 Y114.698 E.00042
G1 X112.984 Y121.186 E.01129
G1 X112.834 Y121.186 E.00026
G1 X112.834 Y114.481 E.01167
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.834 Y116.481 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.216 J-.038 P1  F28800
G1 X112.684 Y121.254 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X112.684 Y103.934 E.03014
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.684 Y105.934 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.425 J1.14 P1  F28800
G1 X132.484 Y113.307 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X132.484 Y114.324 E.00177
G1 X132.334 Y114.312 E.00026
G1 X132.334 Y113.679 E.0011
G3 X132.184 Y113.8 I-.274 J-.186 E.00034
G1 X132.184 Y114.3 E.00087
G1 X132.039 Y114.288 E.00025
G1 X132.034 Y114.344 E.0001
G1 X132.034 Y113.887 E.00079
G1 X131.884 Y113.928 E.00027
G1 X131.884 Y114.9 E.00169
G3 X131.734 Y115 I-.126 J-.026 E.00035
G1 X131.734 Y113.95 E.00183
G1 X131.584 Y113.946 E.00026
G1 X131.584 Y114.876 E.00162
G3 X131.434 Y114.546 I.566 J-.456 E.00064
G1 X131.434 Y113.84 E.00123
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X131.434 Y114.546 E-.08046
G1 X131.516 Y114.777 E-.02793
G1 X131.584 Y114.876 E-.01372
G1 X131.584 Y113.948 E-.10589
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.168 J-.343 P1  F28800
G1 X124.684 Y137.406 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X124.684 Y146.624 E.01604
G1 X124.534 Y146.774 E.00037
G1 X124.534 Y139.863 E.01203
G1 X124.416 Y140.122 E.0005
G1 X124.384 Y140.16 E.00009
G1 X124.384 Y146.925 E.01177
G2 X124.234 Y147.098 I.194 J.319 E.00041
G1 X124.234 Y140.331 E.01177
G3 X124.084 Y140.469 I-.302 J-.178 E.00036
G1 X124.084 Y147.392 E.01205
G1 X123.934 Y147.686 E.00057
G1 X123.934 Y140.562 E.0124
G3 X123.784 Y140.649 I-.218 J-.202 E.00031
G1 X123.784 Y147.98 E.01275
G1 X123.634 Y148.274 E.00057
G1 X123.634 Y140.689 E.0132
G1 X123.484 Y140.729 E.00027
G1 X123.484 Y149.412 E.01511
G1 X123.334 Y149.654 F28800
G1 F3600
G1 X123.334 Y140.746 E.0155
G1 X123.184 Y140.74 E.00026
G1 X123.184 Y149.586 E.01539
G1 X123.034 Y149.586 E.00026
G1 X123.034 Y140.735 E.0154
G3 X122.884 Y140.693 I-.008 J-.259 E.00028
G1 X122.884 Y141.164 E.00082
G1 X122.734 Y141.043 E.00034
G1 X122.734 Y140.639 E.0007
G3 X122.584 Y140.574 I.037 J-.288 E.00029
G1 X122.584 Y140.922 E.00061
G3 X122.459 Y140.818 I1.634 J-2.081 E.00028
G1 X122.434 Y140.849 E.00007
G1 X122.434 Y140.465 E.00067
G1 X122.284 Y140.355 E.00032
G1 X122.284 Y141.034 E.00118
G1 X122.134 Y141.22 E.00041
G1 X122.134 Y140.154 E.00185
G3 X121.984 Y139.867 I.388 J-.386 E.00057
G1 X121.984 Y141.405 E.00268
G1 X121.834 Y141.59 E.00041
G1 X121.834 Y137.396 E.0073
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X121.834 Y139.396 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.215 J-.073 P1  F28800
G1 X121.684 Y141.883 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X121.684 Y128.413 E.02344
G1 X121.534 Y128.513 E.00031
G1 X121.534 Y141.961 E.0234
G1 X121.384 Y142.146 E.00041
G1 X121.384 Y128.614 E.02355
G3 X121.234 Y128.696 I-.218 J-.219 E.0003
G1 X121.234 Y142.331 E.02372
G1 X121.084 Y142.517 E.00041
G1 X121.084 Y128.744 E.02396
G1 X120.934 Y128.792 E.00027
G1 X120.934 Y142.702 E.0242
G1 X120.784 Y142.887 E.00041
G1 X120.784 Y128.84 E.02444
G1 X120.634 Y128.888 E.00027
G1 X120.634 Y143.073 E.02468
G1 X120.484 Y143.258 E.00041
G1 X120.484 Y128.918 E.02495
G1 X120.334 Y128.922 E.00026
G1 X120.334 Y143.443 E.02527
G1 X120.184 Y143.629 E.00041
G1 X120.184 Y128.926 E.02558
G1 X120.034 Y128.931 E.00026
G1 X120.034 Y143.814 E.0259
G1 X119.884 Y143.999 E.00041
G1 X119.884 Y128.935 E.02621
G3 X119.734 Y128.927 I-.061 J-.265 E.00026
G1 X119.734 Y144.184 E.02655
G1 X119.584 Y144.37 E.00041
G1 X119.584 Y128.889 E.02694
G1 X119.434 Y128.851 E.00027
G1 X119.434 Y144.555 E.02732
G1 X119.284 Y144.74 E.00041
G1 X119.284 Y128.812 E.02771
G1 X119.134 Y128.774 E.00027
G1 X119.134 Y144.926 E.0281
G1 X118.984 Y145.111 E.00041
G1 X118.984 Y128.721 E.02852
G1 X118.834 Y128.634 E.0003
G1 X118.834 Y145.296 E.02899
G1 X118.684 Y145.481 E.00041
G1 X118.684 Y128.468 E.0296
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X118.684 Y130.468 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.953 J.757 P1  F28800
G1 X124.534 Y137.833 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X124.534 Y138.876 E.00181
G1 X124.384 Y138.577 E.00058
G1 X124.384 Y138.144 E.00075
G3 X124.234 Y138.302 I-.442 J-.271 E.00038
G1 X124.234 Y138.515 E.00037
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X124.234 Y138.302 E-.02435
G1 X124.384 Y138.144 E-.02478
G1 X124.384 Y138.577 E-.04935
G1 X124.534 Y138.876 E-.03806
G1 X124.534 Y138.073 E-.09146
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.089 J-.543 P1  F28800
G1 X122.884 Y141.381 Z1.8
G1 Z1.4
G1 E.8 F1800
M73 P81 R5
G1 F3600
G1 X122.884 Y149.586 E.01428
G1 X122.734 Y149.586 E.00026
G1 X122.734 Y141.673 E.01377
G1 X122.584 Y141.858 E.00041
G1 X122.584 Y149.586 E.01345
G1 X122.434 Y149.586 E.00026
G1 X122.434 Y142.043 E.01312
G1 X122.284 Y142.229 E.00041
G1 X122.284 Y149.586 E.0128
G1 X122.134 Y149.586 E.00026
G1 X122.134 Y142.414 E.01248
G1 X121.984 Y142.599 E.00041
G1 X121.984 Y149.586 E.01216
G1 X121.834 Y149.586 E.00026
G1 X121.834 Y142.784 E.01183
G1 X121.684 Y142.969 E.00041
G1 X121.684 Y149.586 E.01151
G1 X121.534 Y149.586 E.00026
G1 X121.534 Y143.155 E.01119
G1 X121.384 Y143.34 E.00041
G1 X121.384 Y149.654 E.01099
G1 X121.234 Y149.059 F28800
G1 F3600
G1 X121.234 Y143.525 E.00963
G1 X121.084 Y143.71 E.00041
G1 X121.084 Y148.272 E.00794
G1 X120.934 Y147.977 E.00058
G1 X120.934 Y143.895 E.0071
G1 X120.784 Y144.081 E.00041
G1 X120.784 Y147.683 E.00627
G1 X120.634 Y147.388 E.00058
G1 X120.634 Y144.266 E.00543
G1 X120.484 Y144.451 E.00041
G1 X120.484 Y147.217 E.00481
G1 X120.334 Y147.067 E.00037
G1 X120.334 Y144.636 E.00423
G1 X120.184 Y144.821 E.00041
G1 X120.184 Y146.917 E.00365
G1 X120.034 Y146.767 E.00037
G1 X120.034 Y145.007 E.00306
G1 X119.884 Y145.192 E.00041
G1 X119.884 Y146.617 E.00248
G1 X119.734 Y146.467 E.00037
G1 X119.734 Y145.377 E.0019
G1 X119.584 Y145.562 E.00041
G1 X119.584 Y146.358 E.00138
G1 X119.434 Y146.281 E.00029
G1 X119.434 Y145.747 E.00093
G1 X119.284 Y145.933 E.00041
G1 X119.284 Y146.205 E.00047
G1 X119.134 Y146.129 E.00029
G1 X119.134 Y146.01 E.00021
G1 X118.834 Y146.052 F28800
G1 F3600
G1 X118.834 Y145.936 E.0002
G1 X118.684 Y145.814 E.00034
G1 X118.684 Y145.9 E.00015
G1 X118.534 Y145.823 E.00029
G1 X118.534 Y128.459 E.03021
G1 X118.384 Y128.369 E.0003
G1 X118.384 Y145.778 E.03029
G1 X118.234 Y145.754 E.00026
G1 X118.234 Y128.223 E.0305
G1 X118.084 Y128.066 E.00038
G1 X118.084 Y145.73 E.03073
G1 X117.934 Y145.706 E.00026
G1 X117.934 Y127.909 E.03097
G1 X117.893 Y127.867 E.0001
G1 X117.784 Y128.003 E.0003
G1 X117.784 Y145.682 E.03076
G1 X117.634 Y145.658 E.00026
G1 X117.634 Y128.189 E.03039
G1 X117.484 Y128.375 E.00042
G1 X117.484 Y145.634 E.03003
G1 X117.334 Y145.61 E.00026
G1 X117.334 Y128.502 E.02977
G1 X117.184 Y128.605 E.00032
G1 X117.184 Y145.586 E.02955
G2 X117.034 Y145.599 I-.055 J.235 E.00027
G1 X117.034 Y128.708 E.02939
G1 X116.884 Y128.811 E.00032
G1 X116.884 Y145.623 E.02925
G1 X116.734 Y145.647 E.00026
G1 X116.734 Y128.903 E.02913
G1 X116.584 Y128.953 E.00028
G1 X116.584 Y145.671 E.02909
G1 X116.434 Y145.695 E.00026
G1 X116.434 Y140.508 E.00903
G1 X116.284 Y140.518 E.00026
G1 X116.284 Y145.719 E.00905
G1 X116.134 Y145.743 E.00026
G1 X116.134 Y140.518 E.00909
G1 X115.984 Y140.518 E.00026
G1 X115.984 Y145.768 E.00913
G1 X115.834 Y145.792 E.00026
G1 X115.834 Y140.518 E.00918
G1 X115.684 Y140.518 E.00026
G1 X115.684 Y145.866 E.0093
G1 X115.534 Y145.942 E.00029
G1 X115.534 Y140.518 E.00944
G1 X115.384 Y140.518 E.00026
G1 X115.384 Y146.019 E.00957
G1 X115.234 Y146.095 E.00029
G1 X115.234 Y140.518 E.0097
G1 X115.084 Y140.518 E.00026
G1 X115.084 Y146.172 E.00984
G1 X114.934 Y146.249 E.00029
G1 X114.934 Y140.518 E.00997
G1 X114.784 Y140.518 E.00026
G1 X114.784 Y146.325 E.0101
G1 X114.634 Y146.403 E.00029
M73 P81 R4
G1 X114.634 Y140.518 E.01024
G1 X114.484 Y140.518 E.00026
G1 X114.484 Y146.553 E.0105
G1 X114.334 Y146.703 E.00037
G1 X114.334 Y140.518 E.01076
G1 X114.184 Y140.518 E.00026
G1 X114.184 Y146.852 E.01102
G1 X114.034 Y147.002 E.00037
G1 X114.034 Y140.518 E.01128
G1 X113.884 Y140.518 E.00026
G1 X113.884 Y147.152 E.01154
G1 X113.734 Y147.301 E.00037
G1 X113.734 Y141.574 E.00996
G1 X113.584 Y141.759 E.00041
G1 X113.584 Y147.553 E.01008
G1 X113.434 Y147.848 E.00058
G1 X113.434 Y141.945 E.01027
G1 X113.284 Y142.13 E.00041
G1 X113.284 Y148.143 E.01046
G1 X113.134 Y148.437 E.00058
G1 X113.134 Y142.315 E.01065
G1 X112.984 Y142.5 E.00041
G1 X112.984 Y149.6 E.01235
G1 X112.834 Y149.654 F28800
G1 F3600
G1 X112.834 Y142.686 E.01212
G1 X112.684 Y142.871 E.00041
G1 X112.684 Y149.586 E.01168
G1 X112.534 Y149.586 E.00026
G1 X112.534 Y143.056 E.01136
G1 X112.384 Y143.241 E.00041
G1 X112.384 Y149.586 E.01104
G1 X112.234 Y149.586 E.00026
G1 X112.234 Y143.427 E.01072
G1 X112.084 Y143.612 E.00041
G1 X112.084 Y149.586 E.01039
G1 X111.934 Y149.586 E.00026
G1 X111.934 Y143.797 E.01007
G1 X111.784 Y143.982 E.00041
G1 X111.784 Y149.586 E.00975
G1 X111.634 Y149.586 E.00026
G1 X111.634 Y144.168 E.00943
G1 X111.484 Y144.353 E.00041
G1 X111.484 Y149.586 E.00911
G1 X111.334 Y149.586 E.00026
G1 X111.334 Y144.538 E.00878
G1 X111.184 Y144.723 E.00041
G1 X111.184 Y149.586 E.00846
G1 X111.034 Y149.586 E.00026
G1 X111.034 Y144.908 E.00814
G1 X110.884 Y145.094 E.00041
G1 X110.884 Y149.586 E.00782
G1 X110.734 Y149.586 E.00026
G1 X110.734 Y145.279 E.00749
G1 X110.584 Y145.464 E.00041
G1 X110.584 Y148.685 E.0056
G1 X110.434 Y148.391 E.00057
G1 X110.434 Y145.649 E.00477
G1 X110.284 Y145.835 E.00041
G1 X110.284 Y148.097 E.00394
G1 X110.134 Y147.804 E.00057
G1 X110.134 Y146.02 E.0031
G1 X109.984 Y146.205 E.00041
G1 X109.984 Y147.572 E.00238
G1 X109.834 Y147.415 E.00038
G1 X109.834 Y146.39 E.00178
G1 X109.684 Y146.576 E.00041
G1 X109.684 Y147.259 E.00119
G1 X109.534 Y147.103 E.00038
G1 X109.534 Y146.761 E.00059
G1 X109.384 Y146.946 E.00041
G1 X109.384 Y147.044 E.00017
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.384 Y146.946 E-.01116
G1 X109.534 Y146.761 E-.02717
G1 X109.534 Y147.103 E-.03898
G1 X109.684 Y147.259 E-.0247
G1 X109.684 Y146.576 E-.07791
G1 X109.834 Y146.39 E-.02717
G1 X109.834 Y146.574 E-.02092
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.985 J.714 P1  F28800
G1 X113.734 Y141.194 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X113.734 Y140.518 E.00118
G1 X113.584 Y140.518 E.00026
G1 X113.584 Y141.073 E.00097
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.584 Y140.518 E-.09164
G1 X113.734 Y140.518 E-.02476
G1 X113.734 Y141.194 E-.1116
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.542 J1.09 P1  F28800
G1 X116.434 Y139.851 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X116.434 Y129.003 E.01887
G1 X116.284 Y129.053 E.00028
G1 X116.284 Y139.566 E.01829
G1 X116.134 Y139.386 E.00041
G1 X116.134 Y129.103 E.01789
G3 X115.984 Y129.152 I-.157 J-.228 E.00028
G1 X115.984 Y139.181 E.01745
G1 X115.834 Y138.938 E.0005
G1 X115.834 Y129.157 E.01702
G1 X115.684 Y129.162 E.00026
G1 X115.684 Y138.696 E.01659
G1 X115.534 Y138.453 E.0005
G1 X115.534 Y129.166 E.01616
G1 X115.384 Y129.171 E.00026
G1 X115.384 Y138.143 E.01561
G3 X115.234 Y137.777 I1.456 J-.81 E.00069
G1 X115.234 Y129.176 E.01496
G3 X115.084 Y129.156 I-.041 J-.264 E.00027
G1 X115.084 Y137.546 E.0146
G1 X114.934 Y137.105 F28800
G1 F3600
G1 X114.934 Y129.117 E.0139
G1 X114.784 Y129.078 E.00027
G1 X114.784 Y135.794 E.01168
G1 X114.781 Y135.773 E.00004
G1 X114.634 Y135.776 E.00026
G1 X114.634 Y129.04 E.01172
G1 X114.484 Y129.001 E.00027
G1 X114.484 Y135.779 E.01179
G1 X114.334 Y135.782 E.00026
G1 X114.334 Y128.947 E.01189
G1 X114.184 Y128.858 E.0003
G1 X114.184 Y139.868 E.01916
G1 X114.034 Y139.868 E.00026
G1 X114.034 Y128.769 E.01931
G1 X113.884 Y128.681 E.0003
G1 X113.884 Y139.868 E.01947
G1 X113.734 Y139.868 E.00026
G1 X113.734 Y128.592 E.01962
G3 X113.584 Y128.46 I.149 J-.321 E.00035
G1 X113.584 Y139.936 E.01997
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.584 Y137.936 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.215 J-.06 P1  F28800
G1 X113.434 Y140.952 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X113.434 Y128.299 E.02202
G1 X113.284 Y128.138 E.00038
G1 X113.284 Y140.936 E.02227
G1 X113.134 Y141.121 E.00041
G1 X113.134 Y129.102 E.02091
G1 X112.984 Y129.102 E.00026
G1 X112.984 Y141.306 E.02123
M73 P82 R4
G1 X112.834 Y141.492 E.00041
G1 X112.834 Y129.102 E.02156
G1 X112.684 Y129.102 E.00026
G1 X112.684 Y141.677 E.02188
G1 X112.534 Y141.862 E.00041
G1 X112.534 Y103.945 E.06597
G1 X112.384 Y103.883 E.00028
G1 X112.384 Y142.047 E.0664
G1 X112.234 Y142.233 E.00041
G1 X112.234 Y103.821 E.06683
G1 X112.084 Y103.758 E.00028
G1 X112.084 Y142.418 E.06726
G1 X111.934 Y142.603 E.00041
G1 X111.934 Y103.696 E.0677
G1 X111.784 Y103.634 E.00028
G1 X111.784 Y118.536 E.02593
G1 X111.634 Y118.536 E.00026
G1 X111.634 Y103.572 E.02604
G1 X111.484 Y103.51 E.00028
G1 X111.484 Y118.536 E.02614
G1 X111.334 Y118.536 E.00026
G1 X111.334 Y103.436 E.02627
G1 X111.184 Y103.321 E.00033
G1 X111.184 Y118.536 E.02647
G1 X111.034 Y118.536 E.00026
G1 X111.034 Y103.206 E.02667
G1 X110.884 Y103.091 E.00033
G1 X110.884 Y118.536 E.02687
G1 X110.734 Y118.536 E.00026
G1 X110.734 Y102.976 E.02707
G1 X110.584 Y102.861 E.00033
G1 X110.584 Y118.536 E.02727
G1 X110.434 Y118.536 E.00026
G1 X110.434 Y102.746 E.02747
G1 X110.284 Y102.631 E.00033
G1 X110.284 Y118.536 E.02767
G1 X110.134 Y118.536 E.00026
G1 X110.134 Y102.516 E.02787
G1 X109.984 Y102.401 E.00033
G1 X109.984 Y118.536 E.02807
G1 X109.834 Y118.536 E.00026
G1 X109.834 Y102.286 E.02827
G1 X109.684 Y102.171 E.00033
G1 X109.684 Y118.604 E.02859
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.684 Y116.604 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.934 J.78 P1  F28800
G1 X111.784 Y119.117 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X111.784 Y131.536 E.02161
G1 X111.634 Y131.536 E.00026
G1 X111.634 Y119.184 E.02149
G1 X111.484 Y119.184 E.00026
G1 X111.484 Y131.536 E.02149
G1 X111.334 Y131.536 E.00026
G1 X111.334 Y119.184 E.02149
G1 X111.184 Y119.184 E.00026
G1 X111.184 Y131.536 E.02149
G1 X111.034 Y131.536 E.00026
G1 X111.034 Y119.184 E.02149
G1 X110.884 Y119.184 E.00026
G1 X110.884 Y131.536 E.02149
G1 X110.734 Y131.536 E.00026
G1 X110.734 Y119.184 E.02149
G1 X110.584 Y119.184 E.00026
G1 X110.584 Y131.536 E.02149
G1 X110.434 Y131.536 E.00026
G1 X110.434 Y119.184 E.02149
G1 X110.284 Y119.184 E.00026
G1 X110.284 Y131.604 E.02161
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X110.284 Y129.604 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.045 J.624 P1  F28800
G1 X111.784 Y132.117 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X111.784 Y142.789 E.01857
G1 X111.634 Y142.974 E.00041
G1 X111.634 Y132.184 E.01877
G1 X111.484 Y132.184 E.00026
G1 X111.484 Y143.159 E.0191
G1 X111.334 Y143.345 E.00041
G1 X111.334 Y132.184 E.01942
G1 X111.184 Y132.184 E.00026
G1 X111.184 Y143.53 E.01974
G1 X111.034 Y143.715 E.00041
G1 X111.034 Y132.184 E.02006
G1 X110.884 Y132.184 E.00026
G1 X110.884 Y143.901 E.02039
G1 X110.734 Y144.086 E.00041
G1 X110.734 Y132.184 E.02071
G1 X110.584 Y132.184 E.00026
G1 X110.584 Y144.271 E.02103
G1 X110.434 Y144.457 E.00041
G1 X110.434 Y132.184 E.02135
G1 X110.284 Y132.184 E.00026
G1 X110.284 Y144.642 E.02168
G1 X110.134 Y144.827 E.00041
G1 X110.134 Y132.184 E.022
G1 X109.984 Y132.184 E.00026
G1 X109.984 Y145.012 E.02232
G1 X109.834 Y145.198 E.00041
G1 X109.834 Y132.184 E.02264
G1 X109.684 Y132.184 E.00026
G1 X109.684 Y145.383 E.02297
G1 X109.534 Y145.568 E.00041
G1 X109.534 Y102.048 E.07572
G1 X109.384 Y101.852 E.00043
G1 X109.384 Y145.754 E.07638
G1 X109.234 Y145.939 E.00041
G1 X109.234 Y101.657 E.07705
G1 X109.084 Y101.462 E.00043
G1 X109.084 Y146.124 E.07771
G1 X108.934 Y146.31 E.00041
G1 X108.934 Y101.267 E.07837
G1 X108.784 Y101.071 E.00043
G1 X108.784 Y146.495 E.07903
G1 X108.757 Y146.528 E.00007
G1 X108.634 Y146.474 E.00023
G1 X108.634 Y100.876 E.07934
G1 X108.484 Y100.681 E.00043
G1 X108.484 Y111.648 E.01908
G1 X108.334 Y111.319 E.00063
G1 X108.334 Y100.486 E.01885
G1 X108.184 Y100.29 E.00043
G1 X108.184 Y111.144 E.01888
G2 X108.034 Y111.01 I-.318 J.206 E.00035
G1 X108.034 Y99.962 E.01922
G1 X107.884 Y99.599 E.00068
G1 X107.884 Y110.92 E.0197
G1 X107.734 Y110.871 E.00027
G1 X107.734 Y99.236 E.02024
G1 X107.584 Y98.873 E.00068
G1 X107.584 Y110.857 E.02085
G2 X107.434 Y110.866 I-.059 J.264 E.00026
G1 X107.434 Y98.51 E.0215
G1 X107.284 Y98.147 E.00068
G1 X107.284 Y110.905 E.0222
G2 X107.134 Y110.987 I.054 J.277 E.0003
G1 X107.134 Y96.53 E.02515
G1 X106.984 Y96.069 F28800
G1 F3600
G1 X106.984 Y111.099 E.02615
M73 P83 R4
G1 X106.834 Y111.277 E.00041
G1 X106.834 Y110.402 E.00152
G1 X106.684 Y110.551 E.00037
G1 X106.684 Y111.745 E.00208
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X106.684 Y110.551 E-.1361
G1 X106.834 Y110.402 E-.02413
G1 X106.834 Y110.996 E-.06777
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.217 J0 P1  F28800
G1 X106.834 Y110.191 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X106.834 Y96.136 E.02446
G1 X106.684 Y96.136 E.00026
G1 X106.684 Y109.946 E.02403
G1 X106.534 Y109.795 E.00037
G1 X106.534 Y96.136 E.02377
G1 X106.384 Y96.136 E.00026
G1 X106.384 Y109.645 E.0235
G1 X106.234 Y109.495 E.00037
G1 X106.234 Y96.136 E.02324
G1 X106.084 Y96.136 E.00026
G1 X106.084 Y109.345 E.02298
G1 X105.934 Y109.195 E.00037
G1 X105.934 Y96.136 E.02272
G1 X105.784 Y96.136 E.00026
G1 X105.784 Y109.044 E.02246
G1 X105.634 Y108.894 E.00037
G1 X105.634 Y96.136 E.0222
G1 X105.484 Y96.136 E.00026
G1 X105.484 Y108.744 E.02194
G1 X105.334 Y108.594 E.00037
G1 X105.334 Y96.136 E.02168
G1 X105.184 Y96.136 E.00026
G1 X105.184 Y108.444 E.02141
G1 X105.034 Y108.293 E.00037
G1 X105.034 Y96.136 E.02115
G1 X104.884 Y96.136 E.00026
G1 X104.884 Y108.143 E.02089
G1 X104.734 Y107.993 E.00037
G1 X104.734 Y96.136 E.02063
G1 X104.584 Y96.136 E.00026
G1 X104.584 Y107.843 E.02037
G1 X104.434 Y107.693 E.00037
G1 X104.434 Y96.136 E.02011
G1 X104.284 Y96.136 E.00026
G1 X104.284 Y107.542 E.01985
G1 X104.134 Y107.392 E.00037
G1 X104.134 Y96.136 E.01958
G1 X103.984 Y96.136 E.00026
G1 X103.984 Y107.242 E.01932
G1 X103.834 Y107.092 E.00037
G1 X103.834 Y96.069 E.01918
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X103.834 Y98.069 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.204 J-.179 P1  F28800
G1 X103.684 Y97.058 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X103.684 Y106.942 E.0172
G1 X103.534 Y106.791 E.00037
G1 X103.534 Y98.403 E.01459
G1 X103.384 Y98.766 E.00068
G1 X103.384 Y106.641 E.0137
G1 X103.234 Y106.491 E.00037
G1 X103.234 Y99.129 E.01281
G1 X103.084 Y99.492 E.00068
G1 X103.084 Y106.341 E.01192
G1 X102.934 Y106.191 E.00037
G1 X102.934 Y99.855 E.01102
G1 X102.784 Y100.217 E.00068
G1 X102.784 Y106.041 E.01013
G1 X102.634 Y105.89 E.00037
G1 X102.634 Y100.543 E.0093
G1 X102.484 Y100.738 E.00043
G1 X102.484 Y105.74 E.0087
G1 X102.334 Y105.59 E.00037
G1 X102.334 Y100.934 E.0081
G1 X102.184 Y101.129 E.00043
G1 X102.184 Y105.44 E.0075
G1 X102.034 Y105.29 E.00037
G1 X102.034 Y101.324 E.0069
G1 X101.884 Y101.52 E.00043
G1 X101.884 Y105.139 E.0063
G1 X101.734 Y104.989 E.00037
G1 X101.734 Y101.715 E.0057
G1 X101.584 Y101.91 E.00043
G1 X101.584 Y104.839 E.0051
G1 X101.434 Y104.689 E.00037
G1 X101.434 Y102.106 E.00449
G1 X101.284 Y102.301 E.00043
G1 X101.284 Y104.539 E.00389
G1 X101.134 Y104.388 E.00037
G1 X101.134 Y102.465 E.00335
G1 X100.984 Y102.58 E.00033
G1 X100.984 Y104.238 E.00289
G1 X100.834 Y104.088 E.00037
G1 X100.834 Y102.695 E.00242
G1 X100.684 Y102.81 E.00033
G1 X100.684 Y103.938 E.00196
G1 X100.534 Y103.787 E.00037
G1 X100.534 Y102.925 E.0015
G1 X100.384 Y103.04 E.00033
G1 X100.384 Y103.637 E.00104
G1 X100.234 Y103.486 E.00037
G1 X100.234 Y103.155 E.00058
G1 X100.084 Y103.27 E.00033
G1 X100.084 Y103.432 E.00028
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X100.084 Y103.27 E-.01841
G1 X100.234 Y103.155 E-.02155
G1 X100.234 Y103.486 E-.03777
G1 X100.384 Y103.637 E-.02422
G1 X100.384 Y103.04 E-.06804
G1 X100.534 Y102.925 E-.02155
G1 X100.534 Y103.245 E-.03646
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.936 J.778 P1  F28800
G1 X108.484 Y112.816 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X108.484 Y146.409 E.05845
G1 X108.334 Y146.344 E.00028
G1 X108.334 Y138.015 E.01449
G1 X108.317 Y138.083 E.00012
G1 X108.184 Y138.312 E.00046
G1 X108.184 Y139.321 E.00176
G1 X108.034 Y139.302 E.00026
G1 X108.034 Y138.53 E.00134
G3 X107.884 Y138.652 I-.398 J-.333 E.00034
G1 X107.884 Y139.283 E.0011
G1 X107.734 Y139.265 E.00026
G1 X107.734 Y138.771 E.00086
G1 X107.584 Y138.83 E.00028
G1 X107.584 Y139.719 E.00155
G3 X107.434 Y139.879 I-.345 J-.173 E.00039
G1 X107.434 Y138.89 E.00172
G3 X107.284 Y138.916 I-.116 J-.23 E.00027
G1 X107.284 Y139.956 E.00181
G3 X107.134 Y139.985 I-.123 J-.235 E.00027
G1 X107.134 Y138.928 E.00184
G3 X106.984 Y138.929 I-.077 J-.248 E.00026
G1 X106.984 Y140.003 E.00187
G3 X106.834 Y139.98 I-.035 J-.275 E.00027
G1 X106.834 Y138.896 E.00189
G1 X106.684 Y138.864 E.00027
G1 X106.684 Y139.956 E.0019
G1 X106.534 Y139.882 E.00029
G1 X106.534 Y138.789 E.0019
G1 X106.384 Y138.705 E.0003
M73 P84 R4
G1 X106.384 Y139.759 E.00183
G3 X106.234 Y139.554 I.268 J-.354 E.00045
G1 X106.234 Y138.574 E.0017
G1 X106.084 Y138.418 E.00038
G1 X106.084 Y139.425 E.00175
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X106.084 Y138.418 E-.11474
G1 X106.234 Y138.574 E-.02468
G1 X106.234 Y139.351 E-.08858
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.292 J1.181 P1  F28800
G1 X108.184 Y139.833 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X108.184 Y146.279 E.01121
G2 X108.034 Y146.246 I-.137 J.272 E.00027
G1 X108.034 Y140.213 E.0105
G1 X107.884 Y140.342 E.00034
G1 X107.884 Y146.223 E.01023
G1 X107.734 Y146.199 E.00026
G1 X107.734 Y140.464 E.00998
G1 X107.584 Y140.528 E.00028
G1 X107.584 Y146.176 E.00983
G1 X107.434 Y146.152 E.00026
G1 X107.434 Y140.592 E.00967
G3 X107.284 Y140.623 I-.136 J-.288 E.00027
G1 X107.284 Y146.128 E.00958
G1 X107.134 Y146.105 E.00026
G1 X107.134 Y140.647 E.0095
G3 X106.984 Y140.641 I-.061 J-.345 E.00026
G1 X106.984 Y146.084 E.00947
G1 X106.834 Y146.108 E.00026
G1 X106.834 Y140.633 E.00953
G1 X106.684 Y140.624 E.00026
G1 X106.684 Y146.131 E.00958
G1 X106.534 Y146.155 E.00026
G1 X106.534 Y140.58 E.0097
G1 X106.384 Y140.529 E.00028
G1 X106.384 Y146.179 E.00983
G1 X106.234 Y146.202 E.00026
G1 X106.234 Y140.457 E.01
G1 X106.084 Y140.351 E.00032
G1 X106.084 Y146.226 E.01022
G1 X105.934 Y146.249 E.00026
G1 X105.934 Y140.239 E.01046
G3 X105.784 Y140.066 I.328 J-.435 E.0004
G1 X105.784 Y140.682 E.00107
G1 X105.634 Y140.529 E.00037
G1 X105.634 Y139.804 E.00126
G3 X105.484 Y139.404 I.606 J-.455 E.00075
G1 X105.484 Y140.472 E.00186
G1 X105.784 Y140.965 F28800
G1 F3600
G1 X105.784 Y146.288 E.00926
G1 X105.634 Y146.364 E.00029
G1 X105.634 Y141.208 E.00897
G1 X105.484 Y141.356 E.00037
G1 X105.484 Y146.441 E.00885
G1 X105.334 Y146.517 E.00029
G1 X105.334 Y141.504 E.00872
G1 X105.184 Y141.651 E.00037
G1 X105.184 Y146.593 E.0086
G1 X105.034 Y146.669 E.00029
G1 X105.034 Y141.799 E.00847
G1 X104.884 Y141.947 E.00037
G1 X104.884 Y146.746 E.00835
G1 X104.816 Y146.78 E.00013
G2 X104.734 Y146.841 I.052 J.156 E.00018
G1 X104.734 Y142.095 E.00826
G1 X104.584 Y142.243 E.00037
G1 X104.584 Y146.992 E.00826
G1 X104.434 Y147.142 E.00037
G1 X104.434 Y142.39 E.00827
G1 X104.284 Y142.538 E.00037
G1 X104.284 Y147.292 E.00827
G1 X104.134 Y147.443 E.00037
G1 X104.134 Y142.686 E.00828
G1 X103.984 Y142.834 E.00037
G1 X103.984 Y147.593 E.00828
G1 X103.937 Y147.64 E.00011
G1 X103.834 Y147.843 E.0004
G1 X103.834 Y142.982 E.00846
G1 X103.684 Y143.129 E.00037
G1 X103.684 Y148.137 E.00871
G1 X103.534 Y148.431 E.00057
G1 X103.534 Y143.277 E.00897
G1 X103.384 Y143.425 E.00037
G1 X103.384 Y149.225 E.01009
G1 X103.234 Y149.654 F28800
G1 F3600
G1 X103.234 Y143.573 E.01058
G1 X103.084 Y143.721 E.00037
G1 X103.084 Y149.586 E.01021
G1 X102.934 Y149.586 E.00026
G1 X102.934 Y143.868 E.00995
G1 X102.784 Y144.016 E.00037
G1 X102.784 Y149.586 E.00969
G1 X102.634 Y149.586 E.00026
G1 X102.634 Y144.164 E.00943
G1 X102.484 Y144.312 E.00037
G1 X102.484 Y149.586 E.00918
G1 X102.334 Y149.586 E.00026
G1 X102.334 Y144.459 E.00892
G1 X102.184 Y144.607 E.00037
G1 X102.184 Y149.586 E.00866
G1 X102.034 Y149.586 E.00026
G1 X102.034 Y144.755 E.00841
G1 X101.884 Y144.903 E.00037
G1 X101.884 Y149.586 E.00815
G1 X101.734 Y149.586 E.00026
G1 X101.734 Y145.051 E.00789
G1 X101.584 Y145.198 E.00037
G1 X101.584 Y149.586 E.00763
G1 X101.434 Y149.586 E.00026
G1 X101.434 Y145.346 E.00738
G1 X101.284 Y145.494 E.00037
G1 X101.284 Y149.654 E.00724
G1 X101.134 Y149.269 F28800
G1 F3600
G1 X101.134 Y145.642 E.00631
G1 X100.984 Y145.79 E.00037
G1 X100.984 Y148.549 E.0048
G1 X100.834 Y148.255 E.00057
G1 X100.834 Y145.937 E.00403
G1 X100.684 Y146.085 E.00037
G1 X100.684 Y147.96 E.00326
G1 X100.534 Y147.797 E.00039
G1 X100.534 Y146.233 E.00272
G1 X100.384 Y146.381 E.00037
G1 X100.384 Y147.647 E.0022
G1 X100.234 Y147.497 E.00037
G1 X100.234 Y146.529 E.00169
G1 X100.084 Y146.676 E.00037
G1 X100.084 Y147.347 E.00117
G1 X99.934 Y147.202 E.00036
G1 X99.934 Y146.824 E.00066
G1 X99.784 Y146.972 E.00037
G1 X99.784 Y147.201 E.0004
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X99.784 Y146.972 E-.02615
G1 X99.934 Y146.824 E-.02401
G1 X99.934 Y147.202 E-.04312
G1 X100.084 Y147.347 E-.02376
G1 X100.084 Y146.676 E-.07646
G1 X100.234 Y146.529 E-.02401
G1 X100.234 Y146.621 E-.01051
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.93 J.785 P1  F28800
G1 X108.334 Y137.017 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X108.334 Y115.281 E.03782
G1 X108.184 Y115.501 E.00046
G1 X108.184 Y136.414 E.03639
G2 X108.034 Y136.216 I-.587 J.289 E.00043
G1 X108.034 Y115.631 E.03582
G3 X107.884 Y115.719 I-.221 J-.206 E.00031
G1 X107.884 Y136.044 E.03536
G2 X107.734 Y135.928 I-.358 J.308 E.00033
G1 X107.734 Y115.771 E.03507
G1 X107.584 Y115.794 E.00026
G1 X107.584 Y135.857 E.03491
G1 X107.434 Y135.789 E.00029
G1 X107.434 Y115.778 E.03482
G3 X107.284 Y115.737 I-.005 J-.281 E.00027
G1 X107.284 Y135.751 E.03482
G1 X107.134 Y135.732 E.00026
G1 X107.134 Y115.667 E.03491
G1 X106.984 Y115.541 E.00034
G1 X106.984 Y135.712 E.0351
G2 X106.834 Y135.715 I-.07 J.269 E.00026
G1 X106.834 Y115.358 E.03542
G3 X106.684 Y115.043 I.485 J-.424 E.00061
G1 X106.684 Y135.738 E.03601
G1 X106.534 Y135.76 E.00026
G1 X106.534 Y110.7 E.0436
G1 X106.454 Y110.779 E.0002
G1 X106.384 Y110.708 E.00017
G1 X106.384 Y135.81 E.04368
G1 X106.234 Y135.879 E.00029
G1 X106.234 Y110.555 E.04406
G1 X106.084 Y110.404 E.00037
G1 X106.084 Y135.959 E.04446
G1 X105.934 Y136.096 E.00035
G1 X105.934 Y110.254 E.04496
G1 X105.784 Y110.104 E.00037
G1 X105.784 Y110.886 E.00136
G1 X105.634 Y110.886 E.00026
G1 X105.634 Y109.953 E.00162
G1 X105.484 Y109.803 E.00037
G1 X105.484 Y110.886 E.00188
G1 X105.334 Y110.886 E.00026
G1 X105.334 Y109.653 E.00215
G1 X105.184 Y109.503 E.00037
G1 X105.184 Y114.378 E.00848
G1 X105.034 Y114.223 E.00037
G1 X105.034 Y109.353 E.00847
G1 X104.884 Y109.203 E.00037
G1 X104.884 Y114.088 E.0085
G2 X104.734 Y113.969 I-.652 J.666 E.00033
G1 X104.734 Y109.052 E.00855
G1 X104.584 Y108.902 E.00037
G1 X104.584 Y113.866 E.00864
G1 X104.537 Y113.833 E.0001
G1 X104.434 Y114.01 E.00036
G1 X104.434 Y108.656 E.00931
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X104.434 Y110.656 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.664 J1.02 P1  F28800
G1 X108.334 Y113.195 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X108.334 Y113.827 E.0011
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X108.334 Y113.195 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.795 J-.922 P1  F28800
G1 X105.784 Y115.394 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X105.784 Y136.232 E.03626
G1 X105.634 Y136.447 E.00046
G1 X105.634 Y115.51 E.03643
G1 X105.484 Y115.555 E.00027
G1 X105.484 Y137.014 E.03734
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X105.484 Y135.014 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.217 J-.033 P1  F28800
G1 X105.334 Y140.546 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X105.334 Y115.601 E.0434
G1 X105.261 Y115.623 E.00013
G1 X105.184 Y115.507 E.00024
G1 X105.184 Y140.599 E.04366
G1 X105.034 Y140.746 E.00037
G1 X105.034 Y115.284 E.0443
G2 X104.884 Y115.075 I-1.313 J.787 E.00045
G1 X104.884 Y140.894 E.04492
G1 X104.734 Y141.042 E.00037
G1 X104.734 Y114.888 E.04551
G1 X104.584 Y114.701 E.00042
G1 X104.584 Y141.19 E.04609
G1 X104.434 Y141.337 E.00037
G1 X104.434 Y114.481 E.04673
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X104.434 Y116.481 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1.217 J-.023 P1  F28800
G1 X104.284 Y108.506 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X104.284 Y141.485 E.05738
G1 X104.134 Y141.633 E.00037
G1 X104.134 Y108.452 E.05773
G1 X103.984 Y108.301 E.00037
G1 X103.984 Y141.78 E.05825
G1 X103.834 Y141.928 E.00037
G1 X103.834 Y108.151 E.05877
G1 X103.684 Y108.001 E.00037
G1 X103.684 Y142.076 E.05929
G1 X103.534 Y142.224 E.00037
G1 X103.534 Y107.851 E.05981
G1 X103.384 Y107.701 E.00037
G1 X103.384 Y142.371 E.06032
G1 X103.234 Y142.519 E.00037
G1 X103.234 Y107.551 E.06084
G1 X103.084 Y107.4 E.00037
G1 X103.084 Y142.667 E.06136
G1 X102.934 Y142.814 E.00037
G1 X102.934 Y107.25 E.06188
G1 X102.784 Y107.1 E.00037
G1 X102.784 Y142.962 E.0624
G1 X102.634 Y143.11 E.00037
G1 X102.634 Y106.95 E.06292
G1 X102.484 Y106.8 E.00037
G1 X102.484 Y143.257 E.06343
G1 X102.334 Y143.405 E.00037
G1 X102.334 Y106.649 E.06395
G1 X102.184 Y106.499 E.00037
G1 X102.184 Y143.553 E.06447
G1 X102.034 Y143.701 E.00037
M73 P85 R4
G1 X102.034 Y106.349 E.06499
G1 X101.884 Y106.199 E.00037
G1 X101.884 Y143.848 E.06551
G1 X101.734 Y143.996 E.00037
G1 X101.734 Y106.049 E.06603
G1 X101.584 Y105.899 E.00037
G1 X101.584 Y144.144 E.06654
G1 X101.434 Y144.291 E.00037
G1 X101.434 Y105.748 E.06706
G1 X101.284 Y105.598 E.00037
G1 X101.284 Y144.439 E.06758
M73 P85 R3
G1 X101.134 Y144.587 E.00037
G1 X101.134 Y105.448 E.0681
G1 X100.984 Y105.298 E.00037
G1 X100.984 Y144.734 E.06862
G1 X100.834 Y144.882 E.00037
G1 X100.834 Y105.148 E.06913
G1 X100.684 Y104.997 E.00037
G1 X100.684 Y145.03 E.06965
G1 X100.534 Y145.178 E.00037
G1 X100.534 Y104.847 E.07017
G1 X100.384 Y104.697 E.00037
G1 X100.384 Y112.707 E.01394
G1 X100.234 Y111.837 F28800
G1 F3600
G1 X100.234 Y104.547 E.01268
G1 X100.084 Y104.397 E.00037
G1 X100.084 Y111.405 E.01219
G2 X99.934 Y111.233 I-.345 J.15 E.0004
G1 X99.934 Y104.247 E.01216
G1 X99.784 Y104.096 E.00037
G1 X99.784 Y111.11 E.0122
G1 X99.634 Y111.048 E.00028
G1 X99.634 Y103.851 E.01252
G1 X99.484 Y103.645 F28800
G1 F3600
G1 X99.484 Y111.015 E.01282
G2 X99.334 Y111.014 I-.077 J.315 E.00026
G1 X99.334 Y103.845 E.01247
G3 X99.184 Y103.93 I-.232 J-.239 E.0003
G1 X99.184 Y111.03 E.01235
G1 X99.034 Y111.093 E.00028
G1 X99.034 Y103.992 E.01236
G1 X98.884 Y104.054 E.00028
G1 X98.884 Y111.205 E.01244
G2 X98.734 Y111.392 I.242 J.347 E.00042
G1 X98.734 Y104.116 E.01266
G1 X98.584 Y104.179 E.00028
G1 X98.584 Y111.963 E.01354
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.584 Y109.963 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.133 J.445 P1  F28800
G1 X100.384 Y114.546 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X100.384 Y145.325 E.05355
G1 X100.234 Y145.473 E.00037
G1 X100.234 Y115.392 E.05234
G1 X100.084 Y115.601 E.00045
G1 X100.084 Y145.621 E.05223
G1 X99.934 Y145.768 E.00037
G1 X99.934 Y115.759 E.05221
M73 P86 R3
G3 X99.784 Y115.861 I-.268 J-.231 E.00032
G1 X99.784 Y145.916 E.05229
G1 X99.634 Y146.064 E.00037
G1 X99.634 Y115.929 E.05243
G1 X99.484 Y115.948 E.00026
G1 X99.484 Y124.786 E.01538
G1 X99.334 Y123.987 F28800
G1 F3600
G1 X99.334 Y115.941 E.014
G3 X99.184 Y115.91 I-.025 J-.258 E.00027
G1 X99.184 Y123.56 E.01331
G1 X99.034 Y123.41 E.00037
G1 X99.034 Y115.837 E.01318
G1 X98.884 Y115.704 E.00035
G1 X98.884 Y123.304 E.01322
G2 X98.734 Y123.226 I-.204 J.21 E.0003
G1 X98.734 Y115.514 E.01342
G1 X98.584 Y115.237 E.00055
G1 X98.584 Y123.196 E.01385
G2 X98.434 Y123.186 I-.091 J.242 E.00027
G1 X98.434 Y104.241 E.03296
G1 X98.284 Y104.303 E.00028
G1 X98.284 Y123.2 E.03288
G2 X98.134 Y123.252 I.011 J.278 E.00028
G1 X98.134 Y104.365 E.03286
G1 X97.984 Y104.427 E.00028
G1 X97.984 Y123.328 E.03288
G1 X97.834 Y123.451 E.00034
G1 X97.834 Y104.49 E.03299
G1 X97.684 Y104.552 E.00028
G1 X97.684 Y111.084 E.01137
G1 X97.534 Y111.084 E.00026
G1 X97.534 Y104.614 E.01126
G1 X97.384 Y104.676 E.00028
G1 X97.384 Y111.084 E.01115
G1 X97.234 Y111.084 E.00026
G1 X97.234 Y104.738 E.01104
G1 X97.084 Y104.8 E.00028
G1 X97.084 Y114.578 E.01701
G1 X96.934 Y114.423 E.00037
G1 X96.934 Y104.834 E.01668
G1 X96.784 Y104.854 E.00026
G1 X96.784 Y114.29 E.01642
G2 X96.634 Y114.171 I-.677 J.702 E.00033
G1 X96.634 Y112.122 E.00356
G1 X96.538 Y112.483 E.00065
G1 X96.484 Y112.468 E.0001
G1 X96.484 Y114.068 E.00278
G1 X96.437 Y114.035 E.0001
G1 X96.334 Y114.212 E.00036
G1 X96.334 Y112.359 E.00322
G1 X96.634 Y111.802 F28800
G1 F3600
G1 X96.634 Y104.873 E.01206
G1 X96.484 Y104.893 E.00026
G1 X96.484 Y111.693 E.01183
G1 X96.334 Y111.653 E.00027
G1 X96.334 Y104.913 E.01173
G1 X96.184 Y104.933 E.00026
G1 X96.184 Y111.614 E.01163
G1 X96.034 Y111.575 E.00027
G1 X96.034 Y104.952 E.01152
G1 X95.884 Y104.972 E.00026
G1 X95.884 Y111.535 E.01142
G1 X95.734 Y111.496 E.00027
G1 X95.734 Y104.992 E.01132
G1 X95.584 Y105.011 E.00026
G1 X95.584 Y111.456 E.01121
G1 X95.434 Y111.417 E.00027
G1 X95.434 Y105.031 E.01111
G1 X95.284 Y105.051 E.00026
G1 X95.284 Y111.378 E.01101
G1 X95.134 Y111.338 E.00027
G1 X95.134 Y105.071 E.01091
G1 X94.984 Y105.09 E.00026
G1 X94.984 Y111.299 E.0108
G1 X94.834 Y111.26 E.00027
G1 X94.834 Y105.11 E.0107
G1 X94.684 Y105.13 E.00026
G1 X94.684 Y111.22 E.0106
G1 X94.534 Y111.181 E.00027
G1 X94.534 Y105.123 E.01054
G1 X94.384 Y105.104 E.00026
G1 X94.384 Y111.141 E.01051
G1 X94.234 Y111.102 E.00027
G1 X94.234 Y105.084 E.01047
G1 X94.084 Y105.064 E.00026
G1 X94.084 Y111.063 E.01044
G1 X93.934 Y111.023 E.00027
G1 X93.934 Y105.045 E.0104
G1 X93.784 Y105.025 E.00026
G1 X93.784 Y110.984 E.01037
G1 X93.634 Y110.944 E.00027
G1 X93.634 Y105.005 E.01033
G1 X93.484 Y104.986 E.00026
G1 X93.484 Y110.905 E.0103
G1 X93.334 Y110.866 E.00027
G1 X93.334 Y104.966 E.01027
G1 X93.184 Y104.946 E.00026
G1 X93.184 Y110.826 E.01023
G1 X93.034 Y110.787 E.00027
G1 X93.034 Y104.926 E.0102
G1 X92.884 Y104.907 E.00026
G1 X92.884 Y110.748 E.01016
G1 X92.734 Y110.708 E.00027
G1 X92.734 Y104.887 E.01013
G1 X92.584 Y104.867 E.00026
G1 X92.584 Y110.669 E.01009
G1 X92.434 Y110.629 E.00027
G1 X92.434 Y104.848 E.01006
G1 X92.284 Y104.828 E.00026
G1 X92.284 Y110.59 E.01003
G1 X92.134 Y110.55 E.00027
G1 X92.134 Y104.781 E.01004
G1 X91.984 Y104.719 E.00028
G1 X91.984 Y110.511 E.01008
G1 X91.834 Y110.472 E.00027
G1 X91.834 Y104.657 E.01012
G1 X91.684 Y104.595 E.00028
G1 X91.684 Y110.432 E.01016
G1 X91.534 Y110.393 E.00027
G1 X91.534 Y104.533 E.0102
G1 X91.384 Y104.47 E.00028
G1 X91.384 Y110.353 E.01024
G1 X91.234 Y110.314 E.00027
G1 X91.234 Y104.408 E.01028
G1 X91.084 Y104.346 E.00028
G1 X91.084 Y110.274 E.01031
G1 X91.011 Y110.255 E.00013
G1 X90.934 Y110.551 E.00053
G1 X90.934 Y104.284 E.0109
G1 X90.784 Y104.221 E.00028
G1 X90.784 Y110.561 E.01103
G1 X90.634 Y109.952 F28800
G1 F3600
G1 X90.634 Y104.159 E.01008
G1 X90.484 Y104.097 E.00028
G1 X90.484 Y109.1 E.00871
G1 X90.334 Y108.815 E.00056
G1 X90.334 Y104.034 E.00832
G1 X90.184 Y103.972 E.00028
G1 X90.184 Y108.529 E.00793
G1 X90.034 Y108.243 E.00056
G1 X90.03 Y103.908 E.00754
G3 X89.884 Y103.809 I.113 J-.323 E.00031
G1 X89.884 Y107.957 E.00722
G1 X89.734 Y107.671 E.00056
G1 X89.734 Y103.694 E.00692
G1 X89.584 Y103.578 E.00033
G1 X89.584 Y107.385 E.00662
G1 X89.434 Y107.099 E.00056
G1 X89.434 Y103.463 E.00633
G1 X89.284 Y103.348 E.00033
G1 X89.284 Y106.909 E.0062
G1 X89.134 Y106.74 E.00039
G1 X89.134 Y103.233 E.0061
G1 X88.984 Y103.118 E.00033
G1 X88.984 Y106.571 E.00601
G1 X88.834 Y106.402 E.00039
G1 X88.834 Y103.003 E.00591
G1 X88.684 Y102.888 E.00033
G1 X88.684 Y106.232 E.00582
G1 X88.534 Y106.063 E.00039
G1 X88.534 Y102.773 E.00572
G1 X88.384 Y102.658 E.00033
G1 X88.384 Y105.894 E.00563
G1 X88.234 Y105.725 E.00039
G1 X88.234 Y102.543 E.00554
G1 X88.084 Y102.428 E.00033
G1 X88.084 Y105.556 E.00544
G1 X87.934 Y105.387 E.00039
G1 X87.934 Y102.238 E.00548
G1 X87.784 Y102.043 E.00043
G1 X87.784 Y105.243 E.00557
G1 X87.634 Y105.139 E.00032
G1 X87.634 Y101.848 E.00573
G1 X87.484 Y101.652 E.00043
G1 X87.484 Y105.036 E.00589
M73 P87 R3
G1 X87.334 Y104.932 E.00032
G1 X87.334 Y101.457 E.00605
G1 X87.184 Y101.262 E.00043
G1 X87.184 Y104.828 E.00621
G1 X87.034 Y104.725 E.00032
G1 X87.034 Y101.066 E.00637
G1 X86.884 Y100.871 E.00043
G1 X86.884 Y104.621 E.00652
G1 X86.734 Y104.518 E.00032
G1 X86.734 Y100.676 E.00668
G1 X86.584 Y100.464 E.00045
G1 X86.584 Y104.414 E.00687
G1 X86.434 Y104.31 E.00032
G1 X86.434 Y100.102 E.00732
G1 X86.284 Y99.74 E.00068
G1 X86.284 Y104.207 E.00777
G1 X86.134 Y104.103 E.00032
G1 X86.134 Y99.378 E.00822
G1 X85.984 Y99.016 E.00068
G1 X85.984 Y103.999 E.00867
G2 X85.834 Y103.917 I-.241 J.262 E.0003
G1 X85.834 Y98.654 E.00916
G1 X85.684 Y98.292 E.00068
G1 X85.684 Y103.86 E.00969
G1 X85.534 Y103.804 E.00028
G1 X85.534 Y96.7 E.01236
G1 X85.384 Y96.069 F28800
G1 F3600
G1 X85.384 Y103.747 E.01336
G1 X85.234 Y103.69 E.00028
G1 X85.234 Y96.136 E.01314
G1 X85.084 Y96.136 E.00026
G1 X85.084 Y103.633 E.01304
G1 X84.934 Y103.576 E.00028
G1 X84.934 Y96.136 E.01295
G1 X84.784 Y96.136 E.00026
G1 X84.784 Y103.519 E.01285
G1 X84.634 Y103.462 E.00028
G1 X84.634 Y96.136 E.01275
G1 X84.484 Y96.136 E.00026
G1 X84.484 Y103.406 E.01265
G1 X84.334 Y103.349 E.00028
G1 X84.334 Y96.136 E.01255
G1 X84.184 Y96.136 E.00026
G1 X84.184 Y103.292 E.01245
G1 X84.034 Y103.235 E.00028
G1 X84.034 Y96.136 E.01235
G1 X83.884 Y96.136 E.00026
G1 X83.884 Y103.178 E.01225
G1 X83.734 Y103.121 E.00028
G1 X83.734 Y96.136 E.01215
G1 X83.584 Y96.136 E.00026
G1 X83.584 Y103.094 E.01211
G1 X83.434 Y103.076 E.00026
G1 X83.434 Y96.136 E.01207
G1 X83.284 Y96.136 E.00026
G1 X83.284 Y103.058 E.01204
G1 X83.134 Y103.039 E.00026
G1 X83.134 Y96.136 E.01201
G1 X82.984 Y96.136 E.00026
G1 X82.984 Y103.021 E.01198
G1 X82.834 Y103.003 E.00026
G1 X82.834 Y96.136 E.01195
G1 X82.684 Y96.136 E.00026
G1 X82.684 Y102.985 E.01192
G1 X82.534 Y102.967 E.00026
G1 X82.534 Y96.136 E.01188
G1 X82.384 Y96.136 E.00026
G1 X82.384 Y102.948 E.01185
G1 X82.234 Y102.93 E.00026
G1 X82.234 Y96.136 E.01182
G1 X82.084 Y96.136 E.00026
G1 X82.084 Y102.912 E.01179
G1 X81.934 Y102.894 E.00026
G1 X81.934 Y96.136 E.01176
G1 X81.784 Y96.136 E.00026
G1 X81.784 Y102.943 E.01184
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X81.784 Y100.943 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.825 J.895 P1  F28800
G1 X97.684 Y115.594 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X97.684 Y123.65 E.01402
G2 X97.534 Y123.916 I.68 J.559 E.00053
G1 X97.534 Y115.639 E.0144
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.534 Y117.639 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.188 J.264 P1  F28800
G1 X99.484 Y126.412 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X99.484 Y146.211 E.03445
G1 X99.334 Y146.359 E.00037
G1 X99.334 Y127.545 E.03274
G3 X99.184 Y127.775 I-.78 J-.344 E.00048
G1 X99.184 Y136.678 E.01549
G1 X99.034 Y136.416 E.00052
G1 X99.034 Y127.943 E.01474
G3 X98.884 Y128.061 I-.277 J-.199 E.00034
G1 X98.884 Y136.22 E.0142
G1 X98.734 Y136.074 E.00036
G1 X98.734 Y128.126 E.01383
G3 X98.584 Y128.159 I-.131 J-.237 E.00027
G1 X98.584 Y135.949 E.01355
G1 X98.434 Y135.872 E.00029
G1 X98.434 Y128.177 E.01339
G1 X98.284 Y128.151 E.00026
G1 X98.284 Y135.795 E.0133
G2 X98.134 Y135.754 I-.164 J.309 E.00027
G1 X98.134 Y128.113 E.0133
G1 X97.984 Y128.033 E.0003
G1 X97.984 Y135.726 E.01339
G1 X97.834 Y135.721 E.00026
G1 X97.834 Y127.908 E.01359
G3 X97.684 Y127.723 I.25 J-.356 E.00042
G1 X97.684 Y135.715 E.0139
G2 X97.534 Y135.715 I-.074 J.277 E.00026
G1 X97.534 Y127.191 E.01483
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.534 Y129.191 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.217 J-.028 P1  F28800
G1 X97.384 Y135.819 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X97.384 Y115.755 E.03491
G1 X97.234 Y115.801 E.00027
G1 X97.234 Y135.784 E.03477
G1 X97.084 Y135.818 E.00027
G1 X97.084 Y127.601 E.0143
G3 X96.934 Y127.858 I-.648 J-.205 E.00052
G1 X96.934 Y135.902 E.014
G1 X96.784 Y135.989 E.0003
G1 X96.784 Y127.998 E.0139
G3 X96.634 Y128.087 I-.224 J-.204 E.00031
G1 X96.634 Y136.127 E.01399
G1 X96.484 Y136.288 E.00038
G1 X96.484 Y128.138 E.01418
G1 X96.334 Y128.145 E.00026
G1 X96.334 Y136.72 E.01492
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X96.334 Y134.72 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.917 J.801 P1  F28800
G1 X99.184 Y137.983 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X99.184 Y146.507 E.01483
G1 X99.034 Y146.655 E.00037
G1 X99.034 Y140.518 E.01068
G1 X98.884 Y140.518 E.00026
G1 X98.884 Y146.719 E.01079
G1 X98.734 Y146.695 E.00026
G1 X98.734 Y140.518 E.01075
G1 X98.584 Y140.518 E.00026
G1 X98.584 Y146.671 E.01071
G1 X98.434 Y146.647 E.00026
G1 X98.434 Y140.518 E.01066
G1 X98.284 Y140.518 E.00026
G1 X98.284 Y146.623 E.01062
G1 X98.134 Y146.599 E.00026
G1 X98.134 Y140.518 E.01058
G1 X97.984 Y140.518 E.00026
G1 X97.984 Y146.586 E.01056
G1 X97.834 Y146.61 E.00026
G1 X97.834 Y140.518 E.0106
G1 X97.684 Y140.518 E.00026
G1 X97.684 Y146.634 E.01064
G1 X97.534 Y146.658 E.00026
G1 X97.534 Y140.518 E.01068
G1 X97.384 Y140.518 E.00026
G1 X97.384 Y146.682 E.01072
G1 X97.234 Y146.706 E.00026
G1 X97.234 Y140.518 E.01077
G1 X97.084 Y140.518 E.00026
G1 X97.084 Y146.73 E.01081
G2 X96.934 Y146.778 I0 J.256 E.00028
G1 X96.934 Y140.518 E.01089
G1 X96.784 Y140.518 E.00026
G1 X96.784 Y146.855 E.01103
G1 X96.634 Y146.931 E.00029
G1 X96.634 Y139.435 E.01304
G1 X96.484 Y138.654 F28800
G1 F3600
G1 X96.484 Y147.008 E.01454
G1 X96.334 Y147.084 E.00029
G1 X96.334 Y141.041 E.01051
G1 X96.184 Y141.226 E.00041
G1 X96.184 Y147.161 E.01033
G2 X96.034 Y147.266 I.087 J.283 E.00032
G1 X96.034 Y141.412 E.01019
G1 X95.884 Y141.597 E.00041
G1 X95.884 Y147.415 E.01012
G1 X95.734 Y147.565 E.00037
G1 X95.734 Y141.782 E.01006
G1 X95.584 Y141.967 E.00041
G1 X95.584 Y147.715 E.01
G1 X95.434 Y147.865 E.00037
G1 X95.434 Y142.153 E.00994
G1 X95.284 Y142.338 E.00041
G1 X95.284 Y148.094 E.01002
G1 X95.134 Y148.388 E.00057
G1 X95.134 Y142.523 E.0102
G1 X94.984 Y142.708 E.00041
G1 X94.984 Y148.831 E.01065
G1 X94.834 Y149.654 F28800
G1 F3600
G1 X94.834 Y142.894 E.01176
G1 X94.684 Y143.079 E.00041
G1 X94.684 Y149.586 E.01132
G1 X94.534 Y149.586 E.00026
G1 X94.534 Y143.264 E.011
G1 X94.384 Y143.449 E.00041
G1 X94.384 Y149.586 E.01068
G1 X94.234 Y149.586 E.00026
G1 X94.234 Y143.635 E.01036
G1 X94.084 Y143.82 E.00041
G1 X94.084 Y149.586 E.01003
G1 X93.934 Y149.586 E.00026
G1 X93.934 Y144.005 E.00971
G1 X93.784 Y144.19 E.00041
G1 X93.784 Y149.586 E.00939
G1 X93.634 Y149.586 E.00026
G1 X93.634 Y144.376 E.00907
G1 X93.484 Y144.561 E.00041
G1 X93.484 Y149.586 E.00874
G1 X93.334 Y149.586 E.00026
G1 X93.334 Y144.746 E.00842
G1 X93.184 Y144.931 E.00041
G1 X93.184 Y149.586 E.0081
G1 X93.034 Y149.586 E.00026
G1 X93.034 Y145.117 E.00778
G1 X92.884 Y145.302 E.00041
G1 X92.884 Y149.654 E.00757
G1 X92.734 Y148.973 F28800
G1 F3600
G1 X92.734 Y145.487 E.00607
G1 X92.584 Y145.672 E.00041
G1 X92.584 Y148.532 E.00498
G1 X92.434 Y148.239 E.00057
G1 X92.434 Y145.857 E.00414
G1 X92.284 Y146.043 E.00041
G1 X92.284 Y148.083 E.00355
G1 X92.134 Y147.933 E.00037
G1 X92.134 Y146.228 E.00297
G1 X91.984 Y146.413 E.00041
G1 X91.984 Y147.783 E.00238
G1 X91.834 Y147.633 E.00037
G1 X91.834 Y146.598 E.0018
G1 X91.684 Y146.784 E.00041
G1 X91.684 Y147.546 E.00133
G1 X91.534 Y147.47 E.00029
G1 X91.534 Y146.969 E.00087
G1 X91.384 Y147.154 E.00041
G1 X91.384 Y147.469 E.00055
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X91.384 Y147.154 E-.03594
G1 X91.534 Y146.969 E-.02717
G1 X91.534 Y147.47 E-.05712
G1 X91.684 Y147.546 E-.01918
G1 X91.684 Y146.784 E-.08694
G1 X91.693 Y146.773 E-.00163
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.961 J.746 P1  F28800
G1 X96.334 Y140.792 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X96.334 Y137.105 E.00641
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X96.334 Y139.105 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.211 J-.116 P1  F28800
G1 X96.184 Y140.671 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X96.184 Y128.139 E.0218
M73 P88 R3
G1 X96.034 Y128.103 E.00027
G1 X96.034 Y140.462 E.0215
G1 X95.916 Y140.365 E.00026
G1 X95.884 Y140.405 E.00009
G1 X95.884 Y128.02 E.02155
G3 X95.734 Y127.884 I.156 J-.323 E.00036
G1 X95.734 Y140.59 E.02211
G1 X95.584 Y140.775 E.00041
G1 X95.584 Y127.685 E.02278
G1 X95.434 Y127.283 E.00075
G1 X95.434 Y140.961 E.0238
G1 X95.284 Y141.146 E.00041
G1 X95.284 Y124.052 E.02974
G3 X95.134 Y123.666 I3.785 J-1.694 E.00072
G1 X95.134 Y126.874 E.00558
G1 X95.134 Y127.03 F28800
G1 F3600
G1 X95.134 Y141.331 E.02488
G1 X94.984 Y141.516 E.00041
G1 X94.984 Y127.238 E.02484
G1 X94.834 Y127.36 E.00034
G1 X94.834 Y141.701 E.02495
G1 X94.684 Y141.886 E.00041
G1 X94.684 Y127.482 E.02506
G1 X94.534 Y127.603 E.00034
G1 X94.534 Y142.072 E.02517
G1 X94.384 Y142.257 E.00041
G1 X94.384 Y127.725 E.02528
G1 X94.234 Y127.846 E.00034
G1 X94.234 Y142.442 E.0254
G1 X94.084 Y142.627 E.00041
G1 X94.084 Y127.968 E.02551
G1 X93.934 Y128.089 E.00034
G1 X93.934 Y142.812 E.02562
G1 X93.784 Y142.997 E.00041
G1 X93.784 Y128.211 E.02573
G1 X93.634 Y128.333 E.00034
G1 X93.634 Y143.183 E.02584
G1 X93.484 Y143.368 E.00041
G1 X93.484 Y128.454 E.02595
G1 X93.334 Y128.576 E.00034
G1 X93.334 Y143.553 E.02606
G1 X93.184 Y143.738 E.00041
G1 X93.184 Y128.697 E.02617
G1 X93.034 Y128.819 E.00034
G1 X93.034 Y143.923 E.02628
G1 X92.884 Y144.108 E.00041
G1 X92.884 Y128.94 E.02639
G1 X92.734 Y129.062 E.00034
G1 X92.734 Y144.294 E.0265
G1 X92.584 Y144.479 E.00041
G1 X92.584 Y129.184 E.02661
G1 X92.434 Y129.305 E.00034
G1 X92.434 Y144.664 E.02672
G1 X92.284 Y144.849 E.00041
G1 X92.284 Y129.427 E.02683
G1 X92.134 Y129.548 E.00034
G1 X92.134 Y145.034 E.02694
G1 X91.984 Y145.22 E.00041
G1 X91.984 Y129.67 E.02706
G1 X91.834 Y129.791 E.00034
G1 X91.834 Y145.405 E.02717
G1 X91.684 Y145.59 E.00041
G1 X91.684 Y129.913 E.02728
G1 X91.534 Y130.035 E.00034
G1 X91.534 Y145.775 E.02739
G1 X91.384 Y145.96 E.00041
G1 X91.384 Y136.717 E.01608
G1 X91.234 Y137.327 F28800
G1 F3600
G1 X91.234 Y146.145 E.01534
G1 X91.084 Y146.331 E.00041
G1 X91.084 Y137.936 E.01461
G1 X90.934 Y138.545 F28800
G1 F3600
G1 X90.934 Y146.516 E.01387
G1 X90.784 Y146.701 E.00041
G1 X90.784 Y139.036 E.01334
G1 X90.634 Y139.322 E.00056
G1 X90.634 Y146.886 E.01316
G1 X90.484 Y147.071 E.00041
G1 X90.484 Y139.607 E.01299
G1 X90.334 Y139.893 E.00056
G1 X90.334 Y147.107 E.01255
G1 X90.184 Y147.083 E.00026
G1 X90.184 Y140.179 E.01201
G1 X90.034 Y140.465 E.00056
G1 X90.034 Y147.106 E.01155
G1 X89.884 Y147.129 E.00026
G1 X89.884 Y140.751 E.0111
G3 X89.734 Y140.97 I-.52 J-.194 E.00047
G1 X89.734 Y147.153 E.01076
G1 X89.584 Y147.177 E.00026
G1 X89.584 Y141.139 E.0105
G1 X89.434 Y141.309 E.00039
G1 X89.434 Y147.2 E.01025
G2 X89.284 Y147.237 I-.019 J.249 E.00027
G1 X89.284 Y141.478 E.01002
G1 X89.134 Y141.647 E.00039
G1 X89.134 Y147.313 E.00986
G1 X88.984 Y147.39 E.00029
G1 X88.984 Y141.816 E.0097
G1 X88.834 Y141.985 E.00039
G1 X88.834 Y147.466 E.00954
G1 X88.684 Y147.542 E.00029
G1 X88.684 Y142.154 E.00937
G1 X88.534 Y142.323 E.00039
G1 X88.534 Y147.625 E.00922
G1 X88.384 Y147.775 E.00037
G1 X88.384 Y142.492 E.00919
G1 X88.234 Y142.662 E.00039
G1 X88.234 Y147.925 E.00916
G1 X88.084 Y148.075 E.00037
G1 X88.084 Y142.791 E.00919
G1 X87.934 Y142.895 E.00032
G1 X87.934 Y148.225 E.00927
G1 X87.784 Y148.518 E.00057
G1 X87.784 Y142.998 E.0096
G1 X87.634 Y143.102 E.00032
G1 X87.634 Y148.962 E.0102
G1 X87.484 Y149.654 F28800
G1 F3600
G1 X87.484 Y143.205 E.01122
G1 X87.334 Y143.309 E.00032
G1 X87.334 Y149.586 E.01092
G1 X87.184 Y149.586 E.00026
G1 X87.184 Y143.413 E.01074
G1 X87.034 Y143.516 E.00032
G1 X87.034 Y149.586 E.01056
G1 X86.884 Y149.586 E.00026
G1 X86.884 Y143.62 E.01038
G1 X86.734 Y143.723 E.00032
G1 X86.734 Y149.586 E.0102
G1 X86.584 Y149.586 E.00026
G1 X86.584 Y143.827 E.01002
G1 X86.434 Y143.93 E.00032
G1 X86.434 Y149.586 E.00984
G1 X86.284 Y149.586 E.00026
G1 X86.284 Y144.034 E.00966
G1 X86.134 Y144.137 E.00032
G1 X86.134 Y149.586 E.00948
G1 X85.984 Y149.586 E.00026
G1 X85.984 Y144.194 E.00938
G1 X85.834 Y144.251 E.00028
G1 X85.834 Y149.586 E.00928
G1 X85.684 Y149.586 E.00026
G1 X85.684 Y144.308 E.00918
G1 X85.534 Y144.365 E.00028
G1 X85.534 Y149.586 E.00908
G1 X85.384 Y149.586 E.00026
G1 X85.384 Y144.422 E.00899
G1 X85.234 Y144.479 E.00028
G1 X85.234 Y149.586 E.00889
G1 X85.084 Y149.586 E.00026
G1 X85.084 Y144.536 E.00879
G1 X84.934 Y144.593 E.00028
G1 X84.934 Y149.586 E.00869
G1 X84.784 Y149.586 E.00026
G1 X84.784 Y144.65 E.00859
G1 X84.634 Y144.707 E.00028
G1 X84.634 Y149.586 E.00849
G1 X84.484 Y149.586 E.00026
G1 X84.484 Y144.764 E.00839
G1 X84.334 Y144.821 E.00028
G1 X84.334 Y149.586 E.00829
G1 X84.184 Y149.586 E.00026
G1 X84.184 Y144.878 E.00819
G1 X84.034 Y144.935 E.00028
G1 X84.034 Y149.586 E.00809
G1 X83.884 Y149.586 E.00026
G1 X83.884 Y144.991 E.00799
G3 X83.734 Y145.026 I-.146 J-.286 E.00027
G1 X83.734 Y149.586 E.00793
G1 X83.584 Y149.586 E.00026
G1 X83.584 Y145.045 E.0079
G1 X83.434 Y145.063 E.00026
G1 X83.434 Y149.586 E.00787
G1 X83.284 Y149.586 E.00026
G1 X83.284 Y145.081 E.00784
G1 X83.134 Y145.099 E.00026
G1 X83.134 Y149.586 E.00781
G1 X82.984 Y149.586 E.00026
G1 X82.984 Y145.117 E.00778
G1 X82.834 Y145.135 E.00026
G1 X82.834 Y149.586 E.00774
G1 X82.684 Y149.586 E.00026
G1 X82.684 Y145.154 E.00771
G1 X82.534 Y145.172 E.00026
G1 X82.534 Y149.586 E.00768
G1 X82.384 Y149.586 E.00026
G1 X82.384 Y145.19 E.00765
G1 X82.234 Y145.208 E.00026
G1 X82.234 Y149.586 E.00762
G1 X82.084 Y149.586 E.00026
G1 X82.084 Y145.226 E.00759
G1 X81.934 Y145.245 E.00026
G1 X81.934 Y149.586 E.00755
M73 P88 R2
G1 X81.784 Y149.586 E.00026
G1 X81.784 Y145.195 E.00764
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X81.784 Y147.195 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I1 J.694 P1  F28800
G1 X91.384 Y133.357 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X91.384 Y130.156 E.00557
G1 X91.234 Y130.278 E.00034
G1 X91.234 Y132.747 E.0043
G1 X91.084 Y132.138 F28800
G1 F3600
G1 X91.084 Y130.399 E.00303
G1 X90.934 Y130.521 E.00034
G1 X90.934 Y131.324 E.0014
G1 X90.784 Y131.038 E.00056
G1 X90.784 Y130.532 E.00088
G1 X90.634 Y130.347 E.00041
G1 X90.634 Y130.898 E.00096
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X90.634 Y130.347 E-.06278
G1 X90.784 Y130.532 E-.02714
G1 X90.784 Y131.038 E-.05773
G1 X90.934 Y131.324 E-.0368
G1 X90.934 Y130.942 E-.04355
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.749 J.959 P1  F28800
G1 X97.084 Y126.143 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X97.084 Y123.99 E.00375
G1 X96.934 Y123.99 E.00026
G1 X96.934 Y125.567 E.00274
G1 X96.784 Y125.313 E.00051
G1 X96.784 Y123.99 E.0023
G1 X96.634 Y123.99 E.00026
G1 X96.634 Y125.081 E.0019
G1 X96.484 Y124.856 E.00047
G1 X96.484 Y123.99 E.00151
G1 X96.334 Y123.99 E.00026
G1 X96.334 Y124.635 E.00112
G1 X96.184 Y124.415 E.00046
G1 X96.184 Y123.99 E.00074
G1 X96.034 Y123.99 E.00026
M73 P89 R2
G1 X96.034 Y124.304 E.00055
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X96.034 Y123.99 E-.03574
G1 X96.184 Y123.99 E-.0171
G1 X96.184 Y124.415 E-.04846
G1 X96.334 Y124.635 E-.03032
G1 X96.334 Y123.99 E-.07349
G1 X96.484 Y123.99 E-.0171
G1 X96.484 Y124.041 E-.0058
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I.883 J.837 P1  F28800
G1 X97.084 Y123.408 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X97.084 Y115.707 E.0134
G1 X96.934 Y115.482 E.00047
G1 X96.934 Y123.34 E.01367
G1 X96.784 Y123.34 E.00026
G1 X96.784 Y115.275 E.01403
G1 X96.634 Y115.088 E.00042
G1 X96.634 Y123.34 E.01436
G1 X96.484 Y123.34 E.00026
G1 X96.484 Y114.901 E.01468
G2 X96.334 Y114.768 I-.357 J.253 E.00035
G1 X96.334 Y123.34 E.01491
G1 X96.184 Y123.34 E.00026
G1 X96.184 Y112.39 E.01905
G1 X96.034 Y112.35 E.00027
G1 X96.034 Y123.34 E.01912
G1 X95.884 Y123.34 E.00026
G1 X95.884 Y112.311 E.01919
G1 X95.734 Y112.271 E.00027
G1 X95.734 Y123.34 E.01926
G1 X95.584 Y123.34 E.00026
G1 X95.584 Y112.232 E.01933
G1 X95.434 Y112.192 E.00027
G1 X95.434 Y123.34 E.0194
G1 X95.284 Y123.34 E.00026
G1 X95.284 Y112.153 E.01946
G1 X95.134 Y112.114 E.00027
G1 X95.134 Y123.408 E.01965
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X95.134 Y121.408 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.216 J-.035 P1  F28800
G1 X94.984 Y126.69 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X94.984 Y112.074 E.02543
G1 X94.834 Y112.035 E.00027
G1 X94.834 Y126.398 E.02499
G1 X94.684 Y126.519 E.00034
G1 X94.684 Y111.995 E.02527
G1 X94.534 Y111.956 E.00027
G1 X94.534 Y126.641 E.02555
G1 X94.384 Y126.762 E.00034
G1 X94.384 Y111.917 E.02583
G1 X94.234 Y111.877 E.00027
G1 X94.234 Y126.884 E.02611
G1 X94.084 Y127.005 E.00034
G1 X94.084 Y111.838 E.02639
G1 X93.934 Y111.798 E.00027
G1 X93.934 Y127.126 E.02667
G1 X93.784 Y127.248 E.00034
G1 X93.784 Y111.759 E.02695
G1 X93.634 Y111.72 E.00027
G1 X93.634 Y127.369 E.02723
G1 X93.484 Y127.491 E.00034
G1 X93.484 Y111.68 E.02751
G1 X93.334 Y111.641 E.00027
G1 X93.334 Y127.612 E.02779
G1 X93.184 Y127.734 E.00034
G1 X93.184 Y111.601 E.02807
G1 X93.034 Y111.562 E.00027
G1 X93.034 Y127.855 E.02835
G1 X92.884 Y127.977 E.00034
G1 X92.884 Y111.522 E.02863
G1 X92.734 Y111.483 E.00027
G1 X92.734 Y128.098 E.02891
G1 X92.584 Y128.22 E.00034
G1 X92.584 Y111.444 E.02919
G1 X92.434 Y111.404 E.00027
G1 X92.434 Y128.341 E.02947
G1 X92.284 Y128.463 E.00034
G1 X92.284 Y111.365 E.02975
G1 X92.134 Y111.325 E.00027
G1 X92.134 Y128.584 E.03003
G1 X91.984 Y128.705 E.00034
G1 X91.984 Y111.286 E.03031
G1 X91.834 Y111.247 E.00027
G1 X91.834 Y128.827 E.03059
G1 X91.684 Y128.948 E.00034
G1 X91.684 Y111.207 E.03087
G1 X91.534 Y111.168 E.00027
G1 X91.534 Y129.07 E.03115
G1 X91.384 Y129.191 E.00034
G1 X91.384 Y111.128 E.03143
G1 X91.234 Y111.089 E.00027
G1 X91.234 Y129.313 E.03171
G1 X91.084 Y129.434 E.00034
G1 X91.084 Y110.98 E.03211
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X91.084 Y112.98 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-1.205 J-.171 P1  F28800
G1 X90.934 Y114.034 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X90.934 Y129.556 E.02701
G1 X90.784 Y129.677 E.00034
G1 X90.784 Y114.643 E.02616
G1 X90.634 Y115.252 F28800
G1 F3600
G1 X90.634 Y129.885 E.02546
G1 X90.484 Y130.612 F28800
G1 F3600
G1 X90.484 Y130.162 E.00078
G1 X90.365 Y130.016 E.00033
G1 X90.484 Y129.92 E.00027
G1 X90.484 Y116.104 E.02404
G1 X90.334 Y116.39 E.00056
G1 X90.334 Y130.181 E.024
G1 X90.184 Y129.895 E.00056
G1 X90.184 Y116.676 E.023
G1 X90.034 Y116.961 E.00056
G1 X90.034 Y129.609 E.02201
G1 X89.884 Y129.324 E.00056
G1 X89.884 Y117.247 E.02101
G1 X89.734 Y117.533 E.00056
G1 X89.734 Y129.104 E.02013
G1 X89.584 Y128.935 E.00039
G1 X89.584 Y117.819 E.01934
G1 X89.434 Y118.105 E.00056
G1 X89.434 Y128.766 E.01855
G1 X89.284 Y128.596 E.00039
G1 X89.284 Y118.295 E.01792
G1 X89.134 Y118.464 E.00039
G1 X89.134 Y128.427 E.01733
G1 X88.984 Y128.258 E.00039
G1 X88.984 Y118.633 E.01675
G1 X88.834 Y118.803 E.00039
G1 X88.834 Y128.089 E.01616
G1 X88.684 Y127.92 E.00039
G1 X88.684 Y118.972 E.01557
G1 X88.534 Y119.141 E.00039
G1 X88.534 Y127.751 E.01498
G1 X88.384 Y127.582 E.00039
G1 X88.384 Y119.31 E.01439
G1 X88.234 Y119.479 E.00039
G1 X88.234 Y127.413 E.0138
G2 X88.084 Y127.283 I-.339 J.241 E.00035
G1 X88.084 Y119.648 E.01328
G1 X87.934 Y119.817 E.00039
G1 X87.934 Y127.179 E.01281
G1 X87.784 Y127.076 E.00032
G1 X87.784 Y119.961 E.01238
G1 X87.634 Y120.064 E.00032
G1 X87.634 Y126.972 E.01202
G1 X87.484 Y126.869 E.00032
G1 X87.484 Y120.168 E.01166
G1 X87.334 Y120.271 E.00032
G1 X87.334 Y126.765 E.0113
G1 X87.184 Y126.662 E.00032
G1 X87.184 Y120.375 E.01094
G1 X87.034 Y120.478 E.00032
G1 X87.034 Y126.558 E.01058
G1 X86.884 Y126.454 E.00032
G1 X86.884 Y120.582 E.01022
G1 X86.734 Y120.685 E.00032
G1 X86.734 Y126.351 E.00986
G1 X86.584 Y126.247 E.00032
G1 X86.584 Y120.789 E.0095
G1 X86.434 Y120.892 E.00032
G1 X86.434 Y126.144 E.00914
G1 X86.284 Y126.04 E.00032
G1 X86.284 Y120.996 E.00878
G1 X86.134 Y121.099 E.00032
G1 X86.134 Y125.937 E.00842
G1 X85.984 Y125.88 E.00028
G1 X85.984 Y121.203 E.00814
G3 X85.834 Y121.285 I-.242 J-.264 E.0003
G1 X85.834 Y125.823 E.0079
G1 X85.684 Y125.766 E.00028
G1 X85.684 Y121.342 E.0077
G1 X85.534 Y121.399 E.00028
G1 X85.534 Y125.709 E.0075
G1 X85.384 Y125.652 E.00028
G1 X85.384 Y121.456 E.0073
G1 X85.234 Y121.513 E.00028
G1 X85.234 Y125.595 E.0071
G1 X85.084 Y125.538 E.00028
G1 X85.084 Y121.57 E.0069
G1 X84.934 Y121.627 E.00028
G1 X84.934 Y125.481 E.00671
G1 X84.784 Y125.424 E.00028
G1 X84.784 Y121.684 E.00651
G1 X84.634 Y121.741 E.00028
G1 X84.634 Y125.367 E.00631
G1 X84.484 Y125.311 E.00028
G1 X84.484 Y121.798 E.00611
G1 X84.334 Y121.855 E.00028
G1 X84.334 Y125.254 E.00591
G1 X84.184 Y125.197 E.00028
G1 X84.184 Y121.912 E.00572
G1 X84.034 Y121.969 E.00028
G1 X84.034 Y125.14 E.00552
G1 X83.884 Y125.083 E.00028
G1 X83.884 Y122.026 E.00532
M73 P90 R2
G1 X83.734 Y122.083 E.00028
G1 X83.734 Y125.048 E.00516
M73 P91 R2
G1 X83.584 Y125.03 E.00026
G1 X83.584 Y122.11 E.00508
G1 X83.434 Y122.128 E.00026
G1 X83.434 Y125.011 E.00502
G1 X83.284 Y124.993 E.00026
G1 X83.284 Y122.146 E.00495
G1 X83.134 Y122.165 E.00026
G1 X83.134 Y124.975 E.00489
G1 X82.984 Y124.957 E.00026
G1 X82.984 Y122.183 E.00483
G1 X82.834 Y122.201 E.00026
G1 X82.834 Y124.939 E.00476
G1 X82.684 Y124.92 E.00026
G1 X82.684 Y122.219 E.0047
G1 X82.534 Y122.238 E.00026
G1 X82.534 Y124.902 E.00464
G1 X82.384 Y124.884 E.00026
G1 X82.384 Y122.256 E.00457
G1 X82.234 Y122.274 E.00026
G1 X82.234 Y124.866 E.00451
G1 X82.084 Y124.848 E.00026
G1 X82.084 Y122.292 E.00445
G1 X81.934 Y122.31 E.00026
G1 X81.934 Y124.83 E.00438
G1 X81.784 Y124.811 E.00026
G1 X81.784 Y122.261 E.00444
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X81.784 Y124.261 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.8 I-.769 J.943 P1  F28800
G1 X99.034 Y138.315 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X99.034 Y139.868 E.0027
G1 X98.884 Y139.868 E.00026
G1 X98.884 Y138.627 E.00216
G1 X98.734 Y138.748 E.00034
G1 X98.734 Y139.868 E.00195
G1 X98.584 Y139.868 E.00026
G1 X98.584 Y138.858 E.00176
G1 X98.434 Y138.924 E.00029
G1 X98.434 Y139.868 E.00164
G1 X98.284 Y139.868 E.00026
G1 X98.284 Y138.99 E.00153
G3 X98.134 Y139.014 I-.114 J-.233 E.00027
G1 X98.134 Y139.868 E.00149
G1 X97.984 Y139.868 E.00026
G1 X97.984 Y139.031 E.00146
G1 X97.834 Y139.049 E.00026
G1 X97.834 Y139.868 E.00142
G1 X97.684 Y139.868 E.00026
G1 X97.684 Y139.027 E.00146
G1 X97.534 Y139.001 E.00026
G1 X97.534 Y139.868 E.00151
G1 X97.384 Y139.868 E.00026
G1 X97.384 Y138.962 E.00158
G1 X97.234 Y138.884 E.00029
G1 X97.234 Y139.826 E.00164
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.234 Y138.884 E-.10732
G1 X97.384 Y138.962 E-.01926
G1 X97.384 Y139.852 E-.10142
; WIPE_END
G1 E-.012 F1800

; LAYER_HEIGHT: 0.2
; FEATURE: Prime tower
; LINE_WIDTH: 0.5
;--------------------
; CP TOOLCHANGE START
; toolchange #1
; material : PLA -> PLA
;--------------------
M220 S100
; filament end gcode 
;M106 P3 S0

G1 E-1.2
M620 S1A
M204 S9000

G17
G2 Z2 I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift

G1 Z4.6 F1200

G1 X70 F12000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M109 S220
G1 X90
G1 Y250 F4000
G1 X100 F5000
G1 X120 F12000

G1 X20 Y50
G1 Y-3

T1

; always use highest temperature to flush
M400
M109 S240


G1 X54
G1 Y265

M400

G92 E0

; FLUSH_START

G1 E23.7 F523 ; do not need pulsatile flushing for start part
G1 E0.527962 F50
G1 E6.07156 F523
G1 E0.527962 F50
G1 E6.07156 F523
G1 E0.527962 F50
G1 E6.07156 F523
G1 E0.527962 F50
G1 E6.07156 F523

; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; FLUSH_START
G1 E9.01765 F523
G1 E1.00196 F50
G1 E9.01765 F523
G1 E1.00196 F50
G1 E9.01765 F523
G1 E1.00196 F50
G1 E9.01765 F523
G1 E1.00196 F50
G1 E9.01765 F523
G1 E1.00196 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300






M400
M109 S220

M400
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G92 E0
G1 E-2 F1800

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z1.4 F3000

M204 S10000


M621 S1A
M106 S255
M106 P2 S178
G1 X155.5 Y219.5 Z1.8 F28800
G1 Z1.6
G1 E2 F1800

; filament start gcode
M106 P3 S255

G4 S0
G1  X155.000 Y219.500 
G1  Y219.000 
G1  X190.000  E1.3302
G1  Y239.500  E0.7791
G1  X155.000  E1.3302
G1  Y219.000  E0.7791
G1  X155.500 Y219.500  
; CP TOOLCHANGE WIPE
G1  X189.625  E1.2970 F1584
G1  Y220.833  E0.0507
G1  X155.375  E1.3017 F1800
G1  Y222.167  E0.0507
M73 P92 R2
G1  X189.625  E1.3017 F2198
G1  Y223.500  E0.0507
G1  X155.375  E1.3017 F4200
G1  Y224.833  E0.0507
G1  X189.625  E1.3017 F4250
G1  Y226.167  E0.0507
G1  X155.375  E1.3017 F4300
G1  Y227.500  E0.0507
G1  X189.625  E1.3017 F4350
G1  Y228.833  E0.0507
G1  X155.375  E1.3017 F4400
G1  Y230.167  E0.0507
G1  X189.625  E1.3017 F4450
M73 P92 R1
G1  Y231.500  E0.0507
G1  X155.375  E1.3017 F4500
G1  Y232.833  E0.0507
G1  X189.625  E1.3017 F4550
G1  Y234.167  E0.0507
G1  X155.375  E1.3017 F4600
M73 P93 R1
G1  Y235.500  E0.0507
G1  X189.625  E1.3017 F4650
G1  Y236.833  E0.0507
G1  X155.375  E1.3017 F4700
G1  Y238.167  E0.0507
G1  X189.625  E1.3017 F4750
G1  X156.250  F7200
G1 F28800
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  X189.500 Y239.000   F7200
; LAYER_HEIGHT: 0.2
; FEATURE: Prime tower
; LINE_WIDTH: 0.5
G1  X155.500 

G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X155.45 Y237.001 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.159 J-.37 P1  F28800
G1 X114.999 Y110.27 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X114.778 Y110.27 E.00575
G1 X114.778 Y104.806 E.14179
G1 X114.999 Y104.806 E.00575
G1 X114.999 Y110.21 E.14023
G1 X114.806 Y110.162 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.778 Y110.27 E-.02616
G1 X114.778 Y108.499 E-.20184
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-1.167 J.346 P1  F28800
G1 X116.775 Y115.234 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X116.143 Y113.754 E.04177
G1 X115.769 Y112.265 E.03986
G3 X115.644 Y111.148 I7.213 J-1.371 E.02919
G1 X115.764 Y111.146 E.00311
G1 X115.888 Y112.251 E.02886
G1 X116.295 Y113.832 E.04235
G1 X116.678 Y114.742 E.02563
G1 X117.019 Y115.356 E.01822
G1 X115.214 Y115.356 E.04685
G1 X115.214 Y115.234 E.00315
G1 X116.715 Y115.234 E.03897
G1 X117.158 Y115.118 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X116.143 Y113.754 E-.18091
G1 X116.042 Y113.354 E-.04709
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.61 J-1.053 P1  F28800
M73 P94 R1
G1 X113.551 Y114.798 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.903 Y114.678 E.01082
G1 X113.903 Y111.171 E.10227
G1 X113.985 Y111.171 E.00239
G1 X113.985 Y115.224 E.11818
G1 X113.78 Y115.287 E.00623
G2 X113.155 Y114.457 I-5.177 J3.249 E.03032
G1 X112.982 Y114.32 E.00644
G1 X113.026 Y114.243 E.0026
G3 X113.516 Y114.749 I-1.662 J2.099 E.02059
G1 X113.714 Y115.131 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.903 Y114.678 E-.0448
G1 X113.903 Y113.071 E-.1832
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-1.19 J-.254 P1  F28800
G1 X109.901 Y131.821 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X111.649 Y131.821 E.05097
G1 X111.649 Y131.899 E.00227
G1 X109.819 Y131.899 E.05336
G1 X109.819 Y118.821 E.38135
G1 X111.649 Y118.821 E.05336
G1 X111.649 Y118.899 E.00227
G1 X109.901 Y118.899 E.05097
G1 X109.901 Y131.761 E.37505
G1 X109.883 Y132.221 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.649 Y131.821 E-.19939
G1 X111.649 Y131.899 E-.00889
G1 X111.476 Y131.899 E-.01972
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.141 J-.422 P1  F28800
G1 X105.153 Y114.799 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X105.503 Y114.679 E.01079
G1 X105.503 Y111.171 E.1023
G1 X105.583 Y111.171 E.00233
G1 X105.583 Y115.227 E.11828
G1 X105.38 Y115.289 E.00617
G2 X104.754 Y114.457 I-5.255 J3.308 E.0304
G1 X104.582 Y114.321 E.00638
G1 X104.627 Y114.244 E.00261
G3 X105.117 Y114.751 I-1.775 J2.208 E.02061
G1 X105.321 Y115.129 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X105.503 Y114.679 E-.04469
G1 X105.503 Y113.071 E-.18331
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.303 J1.179 P1  F28800
G1 X107.453 Y113.572 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G2 X107.067 Y113.965 I.298 J.68 E.01464
G1 X106.971 Y114.325 E.00967
G1 X106.982 Y114.732 E.01057
G1 X107.087 Y115.048 E.00865
G2 X107.563 Y115.41 I.552 J-.233 E.01625
G2 X107.935 Y115.208 I-.048 J-.529 E.01129
G1 X108.058 Y115.007 E.00613
G1 X108.155 Y114.645 E.00972
G1 X108.141 Y114.24 E.0105
G1 X108.039 Y113.922 E.00868
G2 X107.566 Y113.56 I-.56 J.243 E.01613
G1 X107.513 Y113.566 E.00139
G1 X107.35 Y113.477 F28800
G1 X107.412 Y113.404
G1 F12000
G2 X107.645 Y113.432 I.177 J-.489 E.00613
G2 X107.915 Y113.271 I-.118 J-.507 E.0083
G1 X108.078 Y113.026 E.00763
G1 X108.206 Y112.599 E.01158
G1 X108.206 Y112.076 E.01355
G1 X108.089 Y111.67 E.01098
G2 X107.685 Y111.251 I-.749 J.318 E.01546
G2 X107.507 Y111.238 I-.112 J.334 E.00467
G2 X107.103 Y111.548 I.161 J.63 E.01358
G1 X106.959 Y111.894 E.00973
G1 X106.906 Y112.41 E.01347
G1 X106.991 Y112.882 E.01243
G1 X107.139 Y113.176 E.00856
G2 X107.357 Y113.381 I.45 J-.262 E.00786
G1 X107.423 Y113.524 F28800
G1 X107.253 Y113.514
G1 F12000
G1 X106.99 Y113.164 E.01137
G1 X106.836 Y112.771 E.01095
G1 X106.785 Y112.338 E.01132
G1 X106.841 Y111.878 E.01202
G1 X107.006 Y111.483 E.01111
G1 X107.192 Y111.262 E.0075
G3 X107.616 Y111.122 I.388 J.465 E.01185
G3 X107.94 Y111.266 I-.08 J.617 E.00932
G1 X108.111 Y111.466 E.00684
G1 X108.268 Y111.812 E.00985
G1 X108.342 Y112.288 E.01251
G1 X108.289 Y112.782 E.01291
G1 X108.123 Y113.189 E.01141
G1 X107.883 Y113.498 E.01016
G1 X108.133 Y113.849 E.01119
G1 X108.253 Y114.194 E.00947
G1 X108.274 Y114.631 E.01136
G1 X108.174 Y115.037 E.01086
G1 X108.011 Y115.301 E.00806
G3 X107.121 Y115.311 I-.449 J-.346 E.02656
G1 X106.982 Y115.105 E.00645
G1 X106.867 Y114.754 E.0096
G1 X106.853 Y114.317 E.01134
G1 X106.96 Y113.916 E.01077
G3 X107.21 Y113.556 I1.223 J.584 E.01143
G1 X107.547 Y113.243 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X106.99 Y113.164 E-.0513
G1 X106.836 Y112.771 E-.04811
G1 X106.785 Y112.338 E-.04973
G1 X106.841 Y111.878 E-.05279
G1 X106.929 Y111.667 E-.02606
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.14 J-.427 P1  F28800
G1 X106.456 Y110.405 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X99.852 Y103.791 E.24255
G1 X100.009 Y103.635 E.00573
G1 X100.596 Y104.224 E.02159
G1 X106.613 Y110.249 E.22098
G1 X106.499 Y110.362 E.00418
G1 X106.176 Y110.119 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X105.076 Y108.956 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.419 J-1.142 P1  F28800
G1 X96.35 Y112.16 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X91.144 Y110.792 E.1397
G1 X91.2 Y110.578 E.00574
G1 X92.487 Y110.917 E.03453
G1 X96.407 Y111.946 E.10519
G1 X96.366 Y112.102 E.00419
G1 X95.965 Y112.051 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X94.426 Y111.615 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.402 J1.148 P1  F28800
G1 X99.079 Y113.246 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X98.923 Y113.536 E.00854
G1 X98.815 Y114.059 E.01386
G1 X98.836 Y114.715 E.01705
G1 X98.975 Y115.188 E.01279
G1 X99.13 Y115.42 E.00725
G2 X99.753 Y115.41 I.307 J-.246 E.01865
G1 X99.905 Y115.192 E.00689
G1 X100.037 Y114.842 E.0097
G1 X100.134 Y114.165 E.01776
G1 X100.14 Y113.132 E.0268
G1 X100.034 Y112.241 E.02329
G1 X99.846 Y111.72 E.01438
G2 X99.496 Y111.402 I-.609 J.319 E.01253
G2 X99.073 Y111.562 I-.105 J.36 E.01257
G1 X98.958 Y111.779 E.00637
G1 X98.898 Y112.085 E.00809
G1 X98.767 Y112.074 E.0034
G1 X98.78 Y111.98 E.00246
G1 X98.907 Y111.604 E.0103
G3 X99.409 Y111.272 I.509 J.223 E.01651
G1 X99.517 Y111.285 E.00283
G3 X99.822 Y111.484 I-.155 J.572 E.00961
G1 X100.008 Y111.782 E.00912
G1 X100.15 Y112.208 E.01165
G1 X100.267 Y113.8 E.04141
G1 X100.148 Y114.893 E.02855
G1 X100.003 Y115.26 E.01023
G1 X99.829 Y115.503 E.00775
G3 X99.005 Y115.455 I-.394 J-.34 E.02476
G1 X98.839 Y115.17 E.00854
G1 X98.714 Y114.692 E.01284
G1 X98.722 Y113.844 E.022
G1 X98.862 Y113.38 E.01258
G1 X99.037 Y113.113 E.00829
G3 X99.592 Y113.012 I.333 J.255 E.01607
G1 X99.498 Y113.094 E.00326
G2 X99.195 Y113.127 I-.119 J.313 E.00821
G1 X99.121 Y113.203 E.00277
G1 X98.751 Y113.214 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.923 Y113.536 E-.04411
G1 X98.815 Y114.059 E-.06088
G1 X98.836 Y114.715 E-.07489
G1 X98.955 Y115.12 E-.04812
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I.077 J-1.215 P1  F28800
G1 X97.053 Y114.999 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.403 Y114.879 E.01079
G1 X97.403 Y111.369 E.10235
G1 X97.483 Y111.369 E.00233
G1 X97.483 Y115.427 E.11834
G1 X97.281 Y115.489 E.00616
G2 X96.653 Y114.657 I-5.133 J3.218 E.03042
G1 X96.482 Y114.523 E.00634
G1 X96.527 Y114.446 E.00259
G3 X97.017 Y114.951 I-1.711 J2.153 E.02058
G1 X97.216 Y115.331 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.403 Y114.879 E-.04468
G1 X97.403 Y113.271 E-.18332
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-1.215 J.074 P1  F28800
G1 X98.291 Y127.763 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G2 X98.87 Y127.57 I.161 J-.483 E.017
G1 X99.029 Y127.288 E.0084
G1 X99.15 Y126.753 E.01422
G1 X99.174 Y124.859 E.04918
G1 X99.054 Y124.141 E.01888
G2 X98.732 Y123.651 I-1.113 J.381 E.01538
G2 X98.399 Y123.569 I-.288 J.452 E.00906
G2 X98.022 Y123.816 I.105 J.572 E.01202
G1 X97.884 Y124.07 E.00751
G1 X97.766 Y124.61 E.01432
G1 X97.745 Y126.524 E.04968
G1 X97.899 Y127.331 E.02133
G1 X98.037 Y127.576 E.0073
G2 X98.235 Y127.741 I.414 J-.296 E.00675
G1 X98.316 Y127.905 F28800
G1 X98.257 Y127.871
G1 F12000
G3 X97.944 Y127.646 I.2 J-.608 E.01016
G3 X97.742 Y127.239 I.977 J-.737 E.01186
G1 X97.635 Y126.649 E.01557
G1 X97.596 Y125.5 E.02984
G1 X97.659 Y124.5 E.02599
G1 X97.782 Y124.008 E.01318
G3 X98.156 Y123.528 I.999 J.393 E.01602
G3 X98.651 Y123.479 I.307 J.583 E.01323
G3 X98.97 Y123.72 I-.239 J.648 E.01053
G3 X99.196 Y124.197 I-1.139 J.831 E.01378
G1 X99.292 Y124.833 E.01669
G1 X99.317 Y126.027 E.031
G1 X99.243 Y126.943 E.02383
G1 X99.134 Y127.348 E.01089
G3 X98.761 Y127.826 I-1.035 J-.423 E.01595
G3 X98.315 Y127.887 I-.304 J-.563 E.01193
G1 X98.219 Y127.691 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.092 Y127.791 E-.02771
G1 X97.944 Y127.646 E-.02356
G1 X97.79 Y127.377 E-.03541
G1 X97.742 Y127.239 E-.01659
G1 X97.635 Y126.649 E-.06838
G1 X97.619 Y126.155 E-.05635
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.995 J-.701 P1  F28800
G1 X96.517 Y127.718 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G2 X96.718 Y127.496 I-.198 J-.381 E.00794
G1 X96.838 Y127.173 E.00893
G1 X96.873 Y126.622 E.01433
G1 X96.751 Y126.078 E.01447
G1 X96.617 Y125.786 E.00833
G2 X95.708 Y124.382 I-45.773 J28.62 E.04342
G3 X95.392 Y123.604 I7.62 J-3.551 E.02179
G1 X97.001 Y123.604 E.04176
G1 X97.001 Y123.726 E.00315
G1 X95.547 Y123.726 E.03774
G2 X96.212 Y124.925 I4.869 J-1.915 E.03568
G3 X96.721 Y125.726 I-6.887 J4.937 E.02465
G1 X96.959 Y126.376 E.01796
G1 X96.992 Y126.926 E.01429
G1 X96.899 Y127.386 E.01219
G1 X96.746 Y127.671 E.00839
G3 X95.832 Y127.594 I-.432 J-.34 E.02817
G3 X95.644 Y126.897 I1.369 J-.742 E.0189
G1 X95.766 Y126.891 E.00317
G1 X95.836 Y127.309 E.01101
G1 X95.95 Y127.557 E.00709
G2 X96.462 Y127.742 I.368 J-.221 E.01528
G1 X96.614 Y127.779 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X96.61 Y127.65 E-.01984
G1 X96.718 Y127.496 E-.02147
G1 X96.838 Y127.173 E-.03923
G1 X96.873 Y126.622 E-.06294
G1 X96.751 Y126.078 E-.06355
G1 X96.674 Y125.911 E-.02097
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.619 J-1.048 P1  F28800
G1 X94.933 Y126.939 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X90.877 Y130.227 E.1355
G1 X90.737 Y130.055 E.00575
G1 X94.795 Y126.769 E.1355
G1 X94.895 Y126.893 E.00413
G1 X94.619 Y127.187 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.356 Y128.17 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-1.189 J.259 P1  F28800
G1 X96.126 Y140.877 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X90.985 Y147.227 E.21204
G1 X90.811 Y147.087 E.00579
G1 X95.954 Y140.738 E.21205
G1 X96.003 Y140.777 E.00162
G1 X96.08 Y140.84 E.00257
G1 X95.753 Y141.021 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X94.833 Y142.403 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.089 J.544 P1  F28800
G1 X96.916 Y138.23 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X97.357 Y138.536 E.01393
G2 X98.641 Y138.33 I.508 J-.933 E.03633
G1 X98.828 Y138.067 E.00837
G1 X98.935 Y137.733 E.00911
G1 X98.947 Y137.253 E.01245
G1 X98.839 Y136.834 E.01125
G2 X98.171 Y136.161 I-1.177 J.502 E.0252
G1 X97.827 Y136.09 E.00911
G1 X97.377 Y136.125 E.01172
G1 X97.082 Y136.245 E.00825
G2 X96.614 Y136.933 I.616 J.922 E.02214
G1 X96.494 Y136.922 E.00314
G1 X96.521 Y136.784 E.00365
G1 X96.673 Y136.473 E.00897
G1 X96.904 Y136.225 E.00881
G1 X97.173 Y136.069 E.00806
G1 X97.582 Y135.975 E.01091
G1 X97.995 Y135.991 E.01072
G3 X98.758 Y136.466 I-.311 J1.349 E.02374
G1 X98.958 Y136.815 E.01042
G1 X99.067 Y137.249 E.01164
G1 X99.05 Y137.76 E.01324
G1 X98.932 Y138.117 E.00978
G1 X98.721 Y138.419 E.00955
G3 X97.826 Y138.784 I-.893 J-.91 E.02572
G1 X97.506 Y138.728 E.00843
G1 X96.75 Y138.336 E.0221
G1 X96.865 Y138.262 E.00355
G1 X97.237 Y138.469 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.357 Y138.536 E-.06413
G1 X97.651 Y138.644 E-.03575
G1 X97.954 Y138.664 E-.03453
G1 X98.258 Y138.595 E-.03561
G1 X98.505 Y138.453 E-.03246
G1 X98.641 Y138.33 E-.02094
G1 X98.664 Y138.297 E-.00458
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.924 J-.792 P1  F28800
G1 X97.093 Y140.132 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X98.865 Y140.132 E.04601
G1 X98.865 Y140.254 E.00315
G1 X96.991 Y140.254 E.04864
G1 X96.637 Y138.408 E.04878
G1 X96.746 Y138.339 E.00335
G1 X97.081 Y140.073 E.04586
G1 X97.127 Y140.531 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.865 Y140.132 E-.20352
G1 X98.865 Y140.254 E-.01385
G1 X98.772 Y140.254 E-.01063
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.092 J1.213 P1  F28800
G1 X105.493 Y140.763 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X105.599 Y140.871 E.00394
G1 X99.473 Y146.907 E.2232
G1 X99.316 Y146.747 E.00581
G1 X105.444 Y140.713 E.22319
G1 X105.451 Y140.72 E.00025
G1 X105.531 Y140.91 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X105.599 Y140.871 E-.02413
G1 X104.325 Y142.126 E-.20387
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.085 J.551 P1  F28800
G1 X106.297 Y138.245 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G3 X106.243 Y138.159 I.814 J-.571 E.00263
G1 X106.354 Y138.122 E.00303
G1 X106.385 Y138.184 E.00178
G2 X107.776 Y138.24 I.718 J-.534 E.04141
G1 X107.951 Y137.965 E.00845
G1 X108.049 Y137.576 E.0104
G1 X108.037 Y137.122 E.01179
G1 X107.906 Y136.701 E.01145
G2 X107.288 Y136.138 I-1.008 J.487 E.02223
G1 X106.957 Y136.088 E.00868
G1 X106.594 Y136.135 E.00948
G1 X106.315 Y136.261 E.00795
G1 X106.047 Y136.505 E.00941
G1 X105.923 Y136.696 E.0059
G1 X105.748 Y137.215 E.01422
G1 X105.677 Y137.96 E.01941
G1 X105.731 Y138.861 E.02343
G1 X105.894 Y139.488 E.01682
G1 X106.095 Y139.848 E.01069
G1 X106.33 Y140.075 E.00848
G1 X106.596 Y140.209 E.00773
G1 X106.973 Y140.27 E.00991
G1 X107.316 Y140.23 E.00898
G2 X107.929 Y139.555 I-.212 J-.808 E.02501
G1 X108.049 Y139.57 E.00314
G1 X107.997 Y139.77 E.00536
G1 X107.833 Y140.037 E.00813
G3 X107.111 Y140.383 I-.831 J-.807 E.02123
G1 X106.715 Y140.361 E.01029
G1 X106.413 Y140.261 E.00824
G1 X106.123 Y140.055 E.00923
G1 X106.009 Y139.928 E.00444
G1 X105.788 Y139.543 E.01151
G1 X105.593 Y138.721 E.02191
G1 X105.633 Y137.193 E.03968
G1 X105.794 Y136.688 E.01375
G1 X105.955 Y136.434 E.00781
G1 X106.256 Y136.159 E.01059
G1 X106.551 Y136.024 E.0084
G1 X106.916 Y135.97 E.00959
G1 X107.301 Y136.019 E.01005
G1 X107.587 Y136.149 E.00816
G1 X107.697 Y136.232 E.00357
G3 X108.008 Y136.638 I-.894 J1.009 E.01336
G1 X108.154 Y137.102 E.01262
G1 X108.165 Y137.589 E.01263
G1 X108.069 Y137.984 E.01055
G1 X107.89 Y138.291 E.00924
G3 X106.332 Y138.293 I-.779 J-.617 E.04643
G1 X106.334 Y138.151 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X106.243 Y138.159 E-.01835
G1 X106.354 Y138.122 E-.01332
G1 X106.385 Y138.184 E-.00784
G1 X106.564 Y138.37 E-.02948
G1 X106.791 Y138.498 E-.02979
G1 X107.046 Y138.552 E-.02972
G1 X107.304 Y138.531 E-.02942
G1 X107.545 Y138.437 E-.02951
G1 X107.776 Y138.24 E-.03467
G1 X107.804 Y138.196 E-.00589
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.273 J1.186 P1  F28800
G1 X116.217 Y140.132 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X115.574 Y139.282 E.02766
G3 X114.423 Y136.044 I5.959 J-3.943 E.09006
G1 X114.547 Y136.042 E.00323
G1 X114.622 Y136.657 E.01609
G1 X114.733 Y137.126 E.01249
G1 X115.051 Y138.061 E.02564
G1 X115.296 Y138.572 E.01472
G1 X115.831 Y139.436 E.02636
G1 X116.349 Y140.057 E.02099
G1 X116.259 Y140.254 E.00562
G1 X113.756 Y140.254 E.06496
G1 X113.756 Y140.132 E.00315
G1 X116.157 Y140.132 E.06231
G1 X116.577 Y139.959 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X115.574 Y139.282 E-.11753
G1 X115.189 Y138.625 E-.08677
G1 X115.102 Y138.436 E-.0237
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-1.079 J-.563 P1  F28800
G1 X113.59 Y141.331 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X109.095 Y146.883 E.18538
G1 X108.923 Y146.743 E.00575
G1 X113.417 Y141.191 E.18536
G1 X113.544 Y141.294 E.00423
G1 X113.335 Y141.64 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.298 Y142.859 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.144 J.414 P1  F28800
G1 X117.875 Y127.435 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.245 Y128.217 E.0293
G1 X116.636 Y128.635 E.02152
G1 X115.937 Y128.868 E.02148
G1 X115.2 Y128.892 E.02151
G1 X114.488 Y128.707 E.02145
G1 X113.854 Y128.332 E.0215
G1 X112.967 Y127.38 E.03795
G1 X112.967 Y128.817 E.04192
G1 X112.887 Y128.817 E.00233
G1 X112.887 Y121.471 E.21421
G1 X112.967 Y121.471 E.00233
G1 X112.967 Y126.331 E.14172
G1 X113.082 Y127.073 E.0219
G1 X113.423 Y127.761 E.02239
G1 X113.956 Y128.316 E.02243
G1 X114.631 Y128.683 E.02241
G1 X115.384 Y128.829 E.02238
G1 X116.149 Y128.742 E.02243
G1 X116.848 Y128.43 E.02233
G1 X117.422 Y127.919 E.02241
G1 X117.831 Y127.237 E.02317
G1 X117.831 Y121.471 E.16814
G1 X117.909 Y121.471 E.00227
G1 X117.909 Y127.235 E.16809
G1 X118.339 Y127.848 E.02182
G1 X118.903 Y128.284 E.02079
G1 X119.567 Y128.536 E.02072
G1 X120.28 Y128.585 E.02083
G1 X120.974 Y128.42 E.02078
G1 X121.588 Y128.06 E.02076
G1 X122.071 Y127.536 E.02078
G1 X122.378 Y126.894 E.02077
G1 X122.483 Y126.205 E.02031
G1 X122.483 Y121.471 E.13804
G1 X122.563 Y121.471 E.00233
G1 X122.563 Y126.174 E.13714
G1 X122.463 Y126.872 E.02057
G1 X122.181 Y127.506 E.02023
G1 X121.735 Y128.035 E.02016
G1 X121.16 Y128.42 E.02017
G1 X120.499 Y128.632 E.02026
G1 X119.808 Y128.652 E.02015
G1 X119.137 Y128.481 E.02019
G3 X118.541 Y128.131 I16.924 J-29.559 E.02016
G1 X117.917 Y127.479 E.02633
G1 X117.565 Y127.183 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X117.245 Y128.217 E-.11388
G1 X116.636 Y128.635 E-.08413
G1 X116.387 Y128.718 E-.02999
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I.178 J1.204 P1  F28800
G1 X125.467 Y127.38 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X125.467 Y128.817 E.04192
G1 X125.387 Y128.817 E.00233
G1 X125.387 Y121.471 E.21421
G1 X125.467 Y121.471 E.00233
G1 X125.467 Y126.331 E.14172
G1 X125.582 Y127.073 E.0219
G1 X125.923 Y127.761 E.02239
G1 X126.456 Y128.316 E.02243
G1 X127.131 Y128.683 E.02241
G1 X127.884 Y128.829 E.02238
G1 X128.647 Y128.742 E.02237
G1 X129.35 Y128.43 E.02244
G1 X129.925 Y127.918 E.02244
G1 X130.329 Y127.237 E.0231
G1 X130.329 Y121.471 E.16812
G1 X130.409 Y121.471 E.00233
G1 X130.409 Y127.235 E.16809
G1 X130.839 Y127.848 E.02182
G1 X131.403 Y128.284 E.0208
G1 X132.069 Y128.536 E.02078
G1 X132.778 Y128.585 E.0207
G1 X133.474 Y128.42 E.02086
G1 X134.088 Y128.06 E.02076
G1 X134.571 Y127.536 E.02078
G1 X134.878 Y126.894 E.02077
G1 X134.983 Y126.205 E.02031
G1 X134.983 Y121.471 E.13804
G1 X135.061 Y121.471 E.00227
G1 X135.061 Y126.174 E.13715
G1 X134.963 Y126.873 E.02056
G1 X134.681 Y127.506 E.02023
G1 X134.235 Y128.035 E.02016
G1 X133.658 Y128.42 E.02023
G1 X133.001 Y128.632 E.02015
G1 X132.308 Y128.652 E.02021
G1 X131.637 Y128.481 E.02019
G3 X131.041 Y128.131 I16.89 J-29.501 E.02015
G1 X130.378 Y127.435 E.02804
G1 X129.745 Y128.217 E.02935
G1 X129.138 Y128.635 E.02148
G1 X128.437 Y128.868 E.02153
G1 X127.702 Y128.892 E.02145
G1 X126.986 Y128.707 E.02156
G1 X126.354 Y128.332 E.02144
G1 X125.508 Y127.423 E.0362
G1 X125.078 Y127.285 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X125.467 Y128.817 E-.15894
G1 X125.387 Y128.817 E-.00912
G1 X125.387 Y128.291 E-.05994
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-1.198 J-.214 P1  F28800
G1 X123.616 Y138.204 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G1 X123.924 Y138.055 E.00888
G1 X124.164 Y137.835 E.00845
G2 X123.815 Y136.212 I-.846 J-.668 E.04919
G1 X123.485 Y136.095 E.0091
G1 X123.141 Y136.081 E.00894
G1 X122.805 Y136.166 E.00899
G1 X122.52 Y136.337 E.00862
G1 X122.3 Y136.576 E.00845
G2 X122.37 Y137.848 I.892 J.589 E.03543
G1 X122.625 Y138.071 E.00877
G1 X122.927 Y138.211 E.00864
G1 X123.273 Y138.258 E.00906
G1 X123.557 Y138.213 E.00746
G1 X123.867 Y138.436 F28800
G1 X123.151 Y138.383
G1 F12000
G2 X123.81 Y138.544 I.107 J.986 E.14385
G2 X123.211 Y138.381 I-.598 J1.014 E.01629
G1 X122.979 Y138.158 F28800
G1 X123.768 Y138.313
G1 F12000
G1 X124.162 Y138.725 E.0148
G1 X124.311 Y139.021 E.00859
G1 X124.368 Y139.348 E.00861
G1 X124.328 Y139.676 E.00856
G1 X124.192 Y139.978 E.0086
G1 X123.975 Y140.225 E.00855
G1 X123.695 Y140.399 E.00856
G3 X123.049 Y140.471 I-.466 J-1.259 E.01704
G1 X122.742 Y140.362 E.00845
G1 X122.473 Y140.167 E.00862
G1 X122.277 Y139.905 E.00849
G1 X122.166 Y139.592 E.00862
G1 X122.149 Y139.263 E.00854
G1 X122.227 Y138.947 E.00846
G1 X122.402 Y138.66 E.00872
G1 X122.742 Y138.326 E.01236
G1 X122.288 Y137.934 E.01556
G1 X122.099 Y137.631 E.00928
G1 X122.011 Y137.296 E.00899
G1 X122.023 Y136.954 E.00888
G1 X122.137 Y136.625 E.00903
G1 X122.342 Y136.341 E.0091
G1 X122.635 Y136.119 E.00955
G1 X122.987 Y135.986 E.00974
G1 X123.38 Y135.964 E.01022
G1 X123.742 Y136.049 E.00966
G1 X124.073 Y136.242 E.00996
G1 X124.307 Y136.494 E.00892
G1 X124.466 Y136.815 E.0093
G1 X124.519 Y137.155 E.00893
G1 X124.473 Y137.494 E.00887
G1 X124.327 Y137.812 E.0091
G3 X123.82 Y138.283 I-1.45 J-1.053 E.01807
G1 X123.476 Y138.587 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X124.162 Y138.725 E-.06382
G1 X124.311 Y139.021 E-.03772
G1 X124.368 Y139.348 E-.03783
G1 X124.328 Y139.676 E-.03762
G1 X124.192 Y139.978 E-.03776
G1 X124.115 Y140.065 E-.01325
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.695 J-.999 P1  F28800
G1 X122.497 Y141.191 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X122.67 Y141.331 E.00579
G1 X119.065 Y145.783 E.14866
G1 X118.893 Y145.643 E.00575
G1 X122.459 Y141.238 E.14709
G1 X122.58 Y141.398 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.67 Y141.331 E-.02634
G1 X121.557 Y142.706 E-.20166
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I.192 J1.202 P1  F28800
G1 X130.946 Y141.21 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X131.128 Y141.331 E.00568
G1 X128.757 Y144.864 E.11042
G1 X128.573 Y144.741 E.00574
G1 X130.913 Y141.259 E.10887
G1 X131.046 Y141.404 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X131.128 Y141.331 E-.02587
G1 X130.14 Y142.804 E-.20213
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.142 J.419 P1  F28800
G1 X131.931 Y137.926 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X132.014 Y138.025 E.00336
G1 X131.914 Y138.086 E.00303
G1 X131.854 Y138.014 E.00243
G1 X131.592 Y137.843 E.00812
G1 X131.335 Y137.769 E.00695
G2 X130.571 Y137.995 I-.105 J1.053 E.0212
G1 X130.352 Y138.253 E.00878
G1 X130.222 Y138.561 E.00868
G1 X130.17 Y139.018 E.01195
G1 X130.222 Y139.439 E.01101
G1 X130.36 Y139.759 E.00903
G1 X130.581 Y140.016 E.00879
G1 X130.846 Y140.184 E.00814
G1 X131.141 Y140.263 E.00793
G1 X131.516 Y140.251 E.00974
G1 X131.825 Y140.143 E.00851
G2 X132.19 Y139.841 I-.622 J-1.123 E.01236
G1 X132.384 Y139.507 E.01
G1 X132.505 Y139.034 E.01267
G1 X132.548 Y138.29 E.01935
G1 X132.488 Y137.422 E.02259
G1 X132.377 Y136.973 E.01199
G1 X132.171 Y136.562 E.01195
G1 X131.921 Y136.308 E.00923
G1 X131.634 Y136.154 E.00845
G1 X131.294 Y136.09 E.00899
G1 X130.911 Y136.125 E.00997
G2 X130.297 Y136.8 I.21 J.808 E.02506
G1 X130.168 Y136.784 E.00337
G3 X130.908 Y136.006 I.979 J.19 E.02945
G1 X131.308 Y135.972 E.01041
G1 X131.675 Y136.043 E.00969
G1 X132.024 Y136.234 E.01033
G1 X132.278 Y136.51 E.00972
G1 X132.492 Y136.937 E.0124
G1 X132.61 Y137.423 E.01299
G1 X132.635 Y138.952 E.03969
G1 X132.491 Y139.555 E.01609
G1 X132.27 Y139.93 E.01128
G1 X131.995 Y140.179 E.00962
G1 X131.83 Y140.272 E.00493
G1 X131.495 Y140.374 E.00909
G1 X131.087 Y140.374 E.01058
G1 X130.758 Y140.273 E.00894
G1 X130.477 Y140.081 E.00882
G1 X130.234 Y139.775 E.01014
G1 X130.09 Y139.385 E.0108
G1 X130.053 Y138.876 E.01323
G1 X130.139 Y138.425 E.01191
G1 X130.318 Y138.096 E.00971
G1 X130.578 Y137.841 E.00948
G1 X130.865 Y137.696 E.00834
G1 X131.2 Y137.644 E.0088
G1 X131.509 Y137.686 E.00809
G1 X131.646 Y137.738 E.00379
G1 X131.881 Y137.893 E.0073
G1 X131.901 Y138.052 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X132.014 Y138.025 E-.02139
G1 X131.914 Y138.086 E-.01332
G1 X131.854 Y138.014 E-.01066
G1 X131.592 Y137.843 E-.03566
G1 X131.335 Y137.769 E-.03052
G1 X131.032 Y137.776 E-.03452
G1 X130.805 Y137.846 E-.02711
G1 X130.571 Y137.995 E-.03163
G1 X130.439 Y138.15 E-.0232
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.136 J.436 P1  F28800
G1 X137.821 Y118.899 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X136.069 Y118.899 E.05109
G1 X136.069 Y118.821 E.00227
G1 X137.901 Y118.821 E.05342
G1 X137.901 Y131.899 E.38135
G1 X136.069 Y131.899 E.05342
G1 X136.069 Y131.821 E.00227
G1 X137.821 Y131.821 E.05109
G1 X137.821 Y118.959 E.37505
G1 X137.839 Y118.499 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X136.069 Y118.899 E-.19985
G1 X136.069 Y118.821 E-.00889
G1 X136.238 Y118.821 E-.01926
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-1.189 J.259 P1  F28800
G1 X140.905 Y140.259 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G2 X141.229 Y140.171 I.078 J-.356 E.00906
G1 X141.356 Y140.003 E.00547
G1 X141.521 Y139.561 E.01225
G1 X141.63 Y138.838 E.01896
G1 X141.64 Y137.756 E.02809
G1 X141.549 Y136.91 E.02207
G2 X141.234 Y136.194 I-1.663 J.304 E.02048
G2 X140.876 Y136.101 I-.261 J.27 E.01005
G2 X140.577 Y136.407 I.242 J.535 E.01136
G1 X140.463 Y136.72 E.00863
G1 X140.34 Y137.513 E.02084
G1 X140.325 Y138.614 E.02857
G1 X140.416 Y139.452 E.02189
G2 X140.733 Y140.168 I1.686 J-.318 E.02047
G2 X140.848 Y140.241 I.25 J-.264 E.00357
G1 X140.943 Y140.377 F28800
G1 X140.879 Y140.376
G1 F12000
G3 X140.594 Y140.192 I.105 J-.477 E.009
G1 X140.426 Y139.894 E.00888
G1 X140.302 Y139.487 E.01104
G1 X140.201 Y137.841 E.04281
G1 X140.338 Y136.719 E.02932
G1 X140.471 Y136.353 E.0101
G1 X140.618 Y136.133 E.00687
G3 X141.143 Y135.997 I.366 J.327 E.0149
G3 X141.369 Y136.162 I-.294 J.637 E.00732
G1 X141.54 Y136.466 E.00903
G1 X141.663 Y136.875 E.01109
G1 X141.765 Y138.527 E.04295
G1 X141.62 Y139.651 E.02941
M73 P95 R1
G1 X141.474 Y140.036 E.01068
G3 X141.038 Y140.385 I-.576 J-.273 E.01501
G3 X140.938 Y140.386 I-.054 J-.485 E.00259
G1 X140.839 Y140.261 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.763 Y140.337 E-.02071
G1 X140.594 Y140.192 E-.02543
G1 X140.426 Y139.894 E-.039
G1 X140.302 Y139.487 E-.04849
G1 X140.251 Y138.661 E-.09437
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.636 J-1.038 P1  F28800
G1 X138.557 Y139.699 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X138.907 Y139.579 E.01079
G1 X138.907 Y136.069 E.10235
G1 X138.985 Y136.069 E.00227
G1 X138.985 Y140.121 E.11816
G1 X138.782 Y140.183 E.00618
G2 X138.157 Y139.358 I-5.291 J3.36 E.0302
G1 X137.982 Y139.222 E.00647
G1 X138.027 Y139.144 E.00261
G3 X138.521 Y139.651 I-1.761 J2.212 E.02069
G1 X138.726 Y140.028 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X138.907 Y139.579 E-.04471
G1 X138.907 Y137.971 E-.18329
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-1.144 J.415 P1  F28800
G1 X140.113 Y141.296 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G1 X140.298 Y141.306 E.00481
G1 X140.335 Y141.308 E.00096
G1 X140.146 Y144.643 E.08669
G1 X139.926 Y144.631 E.00572
G1 X140.11 Y141.356 E.08512
G1 X140.271 Y141.394 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.298 Y141.306 E-.02224
G1 X140.335 Y141.308 E-.00421
G1 X140.235 Y143.073 E-.20156
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.113 J1.212 P1  F28800
G1 X151.861 Y144.155 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X150.275 Y141.333 E.08401
G1 X150.468 Y141.225 E.00577
G1 X150.939 Y142.064 E.02497
G1 X152.053 Y144.047 E.05903
G1 X151.913 Y144.126 E.00417
G1 X151.676 Y143.8 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X150.901 Y142.401 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.158 J-.375 P1  F28800
G1 X149.834 Y139.105 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X149.882 Y139.13 E.00142
G3 X150.807 Y139.923 I-2.144 J3.437 E.03173
G1 X150.649 Y139.981 E.00437
G1 X150.067 Y139.397 E.0214
G1 X149.78 Y139.223 E.00871
G1 X149.809 Y139.159 E.00181
G1 X149.878 Y139.136 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X149.882 Y139.13 E-.00896
G1 X150.131 Y139.294 E-.03403
G1 X150.364 Y139.48 E-.03399
G1 X150.807 Y139.923 E-.07133
G1 X150.649 Y139.981 E-.0192
G1 X150.274 Y139.606 E-.06049
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.528 J1.096 P1  F28800
G1 X150.878 Y139.896 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X150.878 Y136.048 E.09987
G1 X150.999 Y136.048 E.00315
G1 X150.999 Y139.851 E.0987
G1 X150.934 Y139.876 E.00181
G1 X150.882 Y139.496 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X150.905 Y137.876 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.738 J-.968 P1  F28800
G1 X148.219 Y139.924 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X148.065 Y139.981 E.00428
G1 X147.483 Y139.397 E.0214
G1 X147.196 Y139.222 E.00872
G1 X147.249 Y139.105 E.00334
G1 X147.296 Y139.13 E.0014
G3 X148.18 Y139.878 I-2.072 J3.343 E.03017
G1 X148.054 Y139.922 F28800
G1 X148.413 Y139.852
G1 F12000
G1 X148.292 Y139.897 E.00336
G1 X148.292 Y136.048 E.09987
G1 X148.413 Y136.048 E.00315
G1 X148.413 Y139.792 E.09714
G1 X148.289 Y139.816 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X148.292 Y139.897 E-.01832
G1 X148.292 Y138.057 E-.20968
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.024 J.657 P1  F28800
G1 X151.859 Y132.499 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X152.209 Y132.379 E.01079
G1 X152.209 Y128.871 E.1023
G1 X152.291 Y128.871 E.00239
G1 X152.291 Y132.913 E.11787
G1 X152.082 Y132.977 E.00636
G2 X151.459 Y132.158 I-4.892 J3.078 E.03005
G1 X151.284 Y132.022 E.00647
G1 X151.329 Y131.944 E.00263
G3 X151.823 Y132.451 I-1.724 J2.176 E.02071
G1 X152.028 Y132.828 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X152.209 Y132.379 E-.04469
G1 X152.209 Y130.771 E-.18331
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.018 J.667 P1  F28800
G1 X153.466 Y128.85 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G1 X155.071 Y128.85 E.04165
G1 X155.071 Y128.97 E.0031
G1 X153.563 Y128.97 E.03913
G1 X153.885 Y129.638 E.01925
G1 X154.595 Y130.622 E.03147
G1 X154.985 Y131.263 E.01948
G1 X155.131 Y131.67 E.01123
G1 X155.184 Y132.138 E.01222
G1 X155.131 Y132.501 E.00951
G1 X154.97 Y132.848 E.00995
G3 X153.816 Y133.039 I-.666 J-.446 E.03401
G1 X153.622 Y132.818 E.00764
G1 X153.477 Y132.493 E.00922
G1 X153.433 Y132.149 E.009
G1 X153.549 Y132.149 E.00299
G2 X153.855 Y132.918 I1.096 J.008 E.02203
G2 X154.878 Y132.771 I.45 J-.5 E.03057
G1 X155.011 Y132.49 E.00807
G2 X155.059 Y131.945 I-1.451 J-.403 E.01428
G1 X154.953 Y131.499 E.0119
G1 X154.872 Y131.303 E.00551
G1 X154.082 Y130.143 E.0364
G1 X153.593 Y129.317 E.02493
G3 X153.476 Y128.91 I1.784 J-.732 E.01103
G1 X153.829 Y129.019 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X155.071 Y128.85 E-.18205
G1 X155.071 Y128.97 E-.01362
G1 X154.788 Y128.97 E-.03233
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-1.113 J.493 P1  F28800
G1 X156.153 Y132.051 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X156.291 Y131.879 E.00572
G1 X158.235 Y133.453 E.06492
G1 X161.032 Y135.719 E.09341
G1 X160.893 Y135.891 E.00575
G1 X156.199 Y132.089 E.15676
G1 X156.357 Y131.969 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X156.291 Y131.879 E-.02604
G1 X157.668 Y132.994 E-.20196
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.207 J-.152 P1  F28800
G1 X156.27 Y121.865 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X159.676 Y122.055 E.08855
G1 X159.663 Y122.276 E.00574
G1 X156.258 Y122.085 E.08851
G1 X156.266 Y121.925 E.00416
G1 X156.668 Y121.895 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X158.265 Y122.001 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.143 J-1.209 P1  F28800
G1 X154.756 Y122.415 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G3 X155.144 Y123.393 I-.978 J.955 E.02805
G1 X155.086 Y123.793 E.01048
G1 X154.948 Y124.081 E.00828
G3 X153.741 Y124.077 I-.602 J-.393 E.03717
G3 X153.535 Y123.473 I1.023 J-.686 E.01675
G1 X153.656 Y123.462 E.00315
G2 X153.997 Y124.18 I1.086 J-.076 E.02112
G2 X154.895 Y123.942 I.347 J-.505 E.02737
G1 X154.998 Y123.662 E.00773
G1 X155.023 Y123.257 E.01055
G1 X154.962 Y122.938 E.00842
G2 X154.342 Y122.405 I-.808 J.313 E.02209
G1 X154.336 Y122.334 E.00185
G2 X154.979 Y121.975 I.035 J-.691 E.02014
G1 X155.11 Y121.66 E.00886
G1 X155.159 Y121.189 E.01229
G2 X154.786 Y120.23 I-1.417 J-.001 E.02734
G2 X153.826 Y120.366 I-.423 J.468 E.0287
G2 X153.617 Y120.967 I1.243 J.768 E.01666
G1 X153.503 Y120.953 E.00298
G1 X153.588 Y120.574 E.01009
G1 X153.732 Y120.291 E.00823
G3 X154.476 Y119.956 I.639 J.425 E.02232
G3 X154.874 Y120.155 I-.123 J.743 E.01172
G1 X155.087 Y120.428 E.00899
G1 X155.227 Y120.784 E.00993
G1 X155.278 Y121.292 E.01325
G1 X155.208 Y121.749 E.012
G1 X155.053 Y122.078 E.00943
G1 X154.795 Y122.37 E.0101
G1 X154.506 Y122.657 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X154.971 Y122.687 E-.04137
G1 X155.1 Y122.982 E-.03669
G1 X155.144 Y123.393 E-.04716
G1 X155.086 Y123.793 E-.04606
G1 X154.948 Y124.081 E-.03637
G1 X154.829 Y124.214 E-.02036
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I.215 J-1.198 P1  F28800
G1 X151.955 Y123.699 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X152.305 Y123.579 E.01079
G1 X152.305 Y120.071 E.1023
G1 X152.383 Y120.071 E.00227
G1 X152.383 Y124.124 E.11818
G1 X152.18 Y124.186 E.00618
G2 X151.555 Y123.357 I-5.179 J3.25 E.03033
G1 X151.382 Y123.222 E.00639
G1 X151.428 Y123.143 E.00265
G3 X151.919 Y123.651 I-1.828 J2.26 E.02065
G1 X152.123 Y124.029 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X152.305 Y123.579 E-.04471
G1 X152.305 Y121.971 E-.18329
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.156 J-.379 P1  F28800
G1 X149.953 Y114.798 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X150.305 Y114.678 E.01082
G1 X150.305 Y111.171 E.10227
G1 X150.387 Y111.171 E.00239
G1 X150.387 Y115.22 E.11805
G1 X150.18 Y115.283 E.0063
G2 X149.557 Y114.456 I-5.224 J3.291 E.03022
G1 X149.382 Y114.321 E.00644
G1 X149.427 Y114.243 E.00264
G3 X149.918 Y114.749 I-1.71 J2.147 E.02062
G1 X150.122 Y115.128 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X150.305 Y114.678 E-.04483
G1 X150.305 Y113.072 E-.18317
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I.588 J1.065 P1  F28800
G1 X151.528 Y112.396 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G1 X152.861 Y115.36 E.08435
G1 X152.75 Y115.411 E.00316
G1 X151.474 Y112.574 E.0807
G1 X151.474 Y112.274 E.00779
G1 X152.884 Y112.274 E.03659
G1 X152.884 Y111.15 E.02917
G1 X153.025 Y111.15 E.00367
G1 X153.025 Y112.274 E.02917
G1 X153.369 Y112.274 E.00893
G1 X153.369 Y112.396 E.00315
G1 X153.025 Y112.396 E.00893
G1 X153.025 Y113.972 E.0409
G1 X152.884 Y113.972 E.00367
G1 X152.884 Y112.396 E.0409
G1 X151.588 Y112.396 E.03363
G1 X151.128 Y112.394 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X152.377 Y114.234 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I.811 J.907 P1  F28800
G1 X154.678 Y112.176 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X154.58 Y111.977 E.00575
G1 X159.265 Y109.663 E.1356
G1 X159.362 Y109.859 E.00569
G1 X154.732 Y112.149 E.13404
G1 X154.69 Y111.954 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X154.58 Y111.977 E-.02617
G1 X156.168 Y111.193 E-.20183
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I.068 J-1.215 P1  F28800
G1 X142.376 Y110.423 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X142.234 Y110.254 E.00572
G1 X150.694 Y103.155 E.28661
G1 X150.834 Y103.322 E.00566
G1 X142.422 Y110.384 E.28505
G1 X142.336 Y110.206 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X142.234 Y110.254 E-.02606
G1 X143.591 Y109.116 E-.20194
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-1.144 J-.416 P1  F28800
G1 X141.366 Y115.234 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X142.531 Y115.234 E.03025
G1 X142.531 Y115.356 E.00315
G1 X141.26 Y115.356 E.03301
G1 X141.022 Y113.473 E.04925
G1 X141.136 Y113.42 E.00327
G1 X141.358 Y115.175 E.0459
G1 X141.392 Y115.633 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X142.531 Y115.234 E-.1339
G1 X142.531 Y115.356 E-.01385
G1 X141.828 Y115.356 E-.08025
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.215 J.073 P1  F28800
G1 X141.923 Y113.764 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G2 X142.214 Y113.636 I.021 J-.346 E.00857
G1 X142.333 Y113.48 E.0051
G1 X142.479 Y113.143 E.00953
G1 X142.549 Y112.565 E.0151
G1 X142.497 Y112.02 E.01421
G1 X142.348 Y111.592 E.01178
G2 X142.08 Y111.254 I-.748 J.318 E.01133
G2 X141.473 Y111.37 I-.235 J.418 E.01744
G1 X141.329 Y111.601 E.00705
G1 X141.219 Y112.023 E.01131
G1 X141.098 Y112.015 E.00313
G1 X141.238 Y111.518 E.01339
G1 X141.402 Y111.27 E.00772
G3 X141.935 Y111.082 I.43 J.371 E.01534
G3 X142.276 Y111.27 I-.081 J.551 E.01033
G3 X142.572 Y111.835 I-1.146 J.961 E.0167
G1 X142.67 Y112.531 E.01822
G1 X142.59 Y113.183 E.01704
G1 X142.428 Y113.553 E.01049
G3 X141.941 Y113.886 I-.57 J-.311 E.0159
G3 X141.701 Y113.812 I.005 J-.44 E.0066
G1 X141.204 Y113.389 E.01696
G1 X141.37 Y113.312 E.00477
G1 X141.717 Y113.68 E.01314
G2 X141.863 Y113.755 I.226 J-.263 E.00429
G1 X141.962 Y113.849 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X142.017 Y113.759 E-.01749
G1 X142.108 Y113.722 E-.0112
G1 X142.214 Y113.636 E-.01556
G1 X142.333 Y113.48 E-.02239
G1 X142.479 Y113.143 E-.04184
G1 X142.549 Y112.565 E-.06634
G1 X142.505 Y112.101 E-.05317
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.805 J-.913 P1  F28800
G1 X139.447 Y114.798 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X139.799 Y114.678 E.01082
G1 X139.799 Y111.171 E.10227
G1 X139.881 Y111.171 E.00239
G1 X139.881 Y115.233 E.11844
G1 X139.679 Y115.293 E.00614
G2 X139.052 Y114.457 I-5.266 J3.297 E.03051
G1 X138.88 Y114.322 E.00637
G1 X138.926 Y114.244 E.00264
G3 X139.412 Y114.749 I-1.71 J2.129 E.0205
G1 X139.61 Y115.131 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X139.799 Y114.678 E-.0448
G1 X139.799 Y113.071 E-.1832
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.186 J-1.203 P1  F28800
G1 X129.255 Y114.699 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X129.605 Y114.579 E.01079
G1 X129.605 Y111.069 E.10235
G1 X129.685 Y111.069 E.00233
G1 X129.685 Y115.124 E.11823
G1 X129.48 Y115.187 E.00623
G2 X128.855 Y114.357 I-5.18 J3.251 E.03034
G1 X128.682 Y114.222 E.00639
G1 X128.727 Y114.144 E.00261
G3 X129.219 Y114.651 I-1.77 J2.211 E.02064
G1 X129.424 Y115.028 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X129.605 Y114.579 E-.0447
G1 X129.605 Y112.971 E-.1833
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I-.887 J.833 P1  F28800
G1 X131.763 Y115.269 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G2 X132.067 Y115.111 I-.018 J-.407 E.0092
G1 X132.187 Y114.903 E.00621
G1 X132.263 Y114.571 E.00883
G1 X132.384 Y114.581 E.00315
G1 X132.288 Y114.964 E.01025
G3 X131.915 Y115.365 I-.663 J-.244 E.01459
G3 X131.347 Y115.204 I-.158 J-.524 E.01617
G3 X131.05 Y114.633 I1.037 J-.903 E.01685
G1 X130.875 Y113.17 E.03824
G1 X130.993 Y111.811 E.03541
G1 X131.147 Y111.391 E.0116
G3 X131.492 Y111.023 I.873 J.473 E.01323
G3 X131.907 Y111.007 I.227 J.532 E.01102
G3 X132.193 Y111.266 I-.271 J.587 E.01015
G1 X132.356 Y111.619 E.01009
G1 X132.468 Y112.334 E.01878
G1 X132.394 Y113.017 E.01783
G1 X132.238 Y113.383 E.01032
G3 X131.57 Y113.68 I-.567 J-.374 E.02002
G1 X131.631 Y113.567 E.00334
G2 X132.139 Y113.321 I.073 J-.498 E.01555
G1 X132.282 Y112.977 E.00967
G1 X132.351 Y112.386 E.01546
G1 X132.291 Y111.843 E.01418
G2 X131.96 Y111.177 I-1.316 J.239 E.01957
G2 X131.43 Y111.209 I-.246 J.32 E.01503
G2 X131.241 Y111.47 I.973 J.906 E.00839
G1 X131.104 Y111.861 E.01074
G1 X131.009 Y112.557 E.01823
G1 X131.014 Y113.661 E.02867
G1 X131.136 Y114.499 E.02198
G1 X131.279 Y114.897 E.01098
G1 X131.43 Y115.121 E.007
G2 X131.703 Y115.267 I.315 J-.258 E.00824
G1 X131.821 Y115.369 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X131.877 Y115.254 E-.01993
G1 X131.968 Y115.206 E-.01177
G1 X132.067 Y115.111 E-.01569
G1 X132.187 Y114.903 E-.02729
G1 X132.263 Y114.571 E-.0388
G1 X132.384 Y114.581 E-.01383
G1 X132.288 Y114.964 E-.04504
G1 X132.153 Y115.192 E-.03022
G1 X132.041 Y115.3 E-.01762
G1 X131.981 Y115.331 E-.0078
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2 I1.198 J-.212 P1  F28800
G1 X131.08 Y110.244 Z2
G1 Z1.6
G1 E.8 F1800
G1 F12000
G1 X132.774 Y103.801 E.1729
G1 X132.987 Y103.856 E.00574
G1 X131.294 Y110.3 E.17291
G1 X131.138 Y110.259 E.00418
G1 X131.186 Y109.858 F28800
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X131.629 Y108.32 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z2 I-.142 J-1.209 P1  F28800
G1 X114.999 Y110.27 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X114.778 Y110.27 E.00575
G1 X114.778 Y104.806 E.14179
G1 X114.999 Y104.806 E.00575
G1 X114.999 Y110.21 E.14023
G1 X114.806 Y110.162 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.778 Y110.27 E-.02616
G1 X114.778 Y108.499 E-.20184
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-1.167 J.346 P1  F28800
G1 X116.775 Y115.234 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X116.143 Y113.754 E.04177
G1 X115.769 Y112.265 E.03986
G3 X115.644 Y111.148 I7.213 J-1.371 E.02919
G1 X115.764 Y111.146 E.00311
G1 X115.888 Y112.251 E.02885
G2 X116.295 Y113.832 I490.672 J-125.45 E.04236
G1 X116.678 Y114.742 E.02563
G1 X117.019 Y115.356 E.01822
G1 X115.214 Y115.356 E.04685
G1 X115.214 Y115.234 E.00315
G1 X116.715 Y115.234 E.03897
G1 X117.158 Y115.118 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X116.143 Y113.754 E-.18091
G1 X116.042 Y113.354 E-.04709
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.61 J-1.053 P1  F28800
G1 X113.551 Y114.798 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.903 Y114.678 E.01082
G1 X113.903 Y111.171 E.10227
G1 X113.985 Y111.171 E.00239
G1 X113.985 Y115.224 E.11818
G1 X113.78 Y115.287 E.00623
G2 X113.155 Y114.457 I-5.177 J3.249 E.03032
G1 X112.982 Y114.32 E.00644
G1 X113.026 Y114.243 E.0026
G3 X113.516 Y114.749 I-1.662 J2.099 E.02059
G1 X113.714 Y115.131 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.903 Y114.678 E-.0448
G1 X113.903 Y113.071 E-.1832
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-1.19 J-.254 P1  F28800
G1 X109.901 Y131.821 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X111.649 Y131.821 E.05097
G1 X111.649 Y131.899 E.00227
G1 X109.819 Y131.899 E.05336
G1 X109.819 Y118.821 E.38135
G1 X111.649 Y118.821 E.05336
G1 X111.649 Y118.899 E.00227
G1 X109.901 Y118.899 E.05097
G1 X109.901 Y131.761 E.37505
G1 X109.883 Y132.221 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.649 Y131.821 E-.19939
G1 X111.649 Y131.899 E-.00889
G1 X111.476 Y131.899 E-.01972
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.141 J-.422 P1  F28800
G1 X105.153 Y114.799 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X105.503 Y114.679 E.01079
G1 X105.503 Y111.171 E.1023
G1 X105.583 Y111.171 E.00233
G1 X105.583 Y115.227 E.11828
G1 X105.38 Y115.289 E.00617
G2 X104.754 Y114.457 I-5.255 J3.308 E.0304
G1 X104.582 Y114.321 E.00638
G1 X104.627 Y114.244 E.00261
G3 X105.117 Y114.751 I-1.775 J2.208 E.02061
G1 X105.321 Y115.129 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X105.503 Y114.679 E-.04469
G1 X105.503 Y113.071 E-.18331
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.292 J1.182 P1  F28800
G1 X107.509 Y113.566 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G2 X107.067 Y113.965 I.151 J.612 E.01609
G1 X106.971 Y114.325 E.00967
G1 X106.982 Y114.732 E.01057
G1 X107.087 Y115.048 E.00865
G2 X107.564 Y115.41 I.552 J-.233 E.01626
G2 X107.935 Y115.208 I-.048 J-.529 E.01128
G1 X108.058 Y115.007 E.00613
G1 X108.155 Y114.645 E.00972
G1 X108.141 Y114.24 E.0105
G1 X108.039 Y113.922 E.00868
G2 X107.569 Y113.561 I-.56 J.243 E.01606
G1 X107.481 Y113.517 F28800
G1 X107.412 Y113.404
G1 F12000
G2 X107.646 Y113.432 I.176 J-.489 E.00616
G2 X107.915 Y113.271 I-.118 J-.506 E.00828
G1 X108.078 Y113.026 E.00763
G1 X108.206 Y112.599 E.01158
G1 X108.206 Y112.076 E.01355
G1 X108.089 Y111.67 E.01098
G2 X107.685 Y111.251 I-.749 J.318 E.01546
G2 X107.517 Y111.237 I-.109 J.315 E.00442
G2 X107.103 Y111.548 I.143 J.623 E.01383
G1 X106.959 Y111.894 E.00973
G1 X106.906 Y112.41 E.01347
G1 X106.991 Y112.882 E.01243
G1 X107.139 Y113.176 E.00856
G2 X107.357 Y113.381 I.449 J-.261 E.00786
G1 X107.423 Y113.526 F28800
G1 X107.253 Y113.514
G1 F12000
G1 X106.99 Y113.164 E.01137
G1 X106.836 Y112.771 E.01095
G1 X106.785 Y112.338 E.01132
G1 X106.841 Y111.878 E.01202
G1 X107.006 Y111.483 E.01111
G1 X107.192 Y111.262 E.0075
G3 X107.564 Y111.121 I.393 J.475 E.0105
G3 X107.94 Y111.266 I-.012 J.59 E.01067
G1 X108.111 Y111.466 E.00684
G1 X108.268 Y111.812 E.00985
G1 X108.342 Y112.288 E.01251
G1 X108.289 Y112.782 E.01291
G1 X108.123 Y113.189 E.01141
G1 X107.883 Y113.498 E.01016
G1 X108.133 Y113.849 E.01119
G1 X108.253 Y114.194 E.00947
G1 X108.274 Y114.631 E.01136
G1 X108.174 Y115.037 E.01086
G1 X108.011 Y115.301 E.00806
G3 X107.121 Y115.311 I-.449 J-.346 E.02656
G1 X106.982 Y115.105 E.00645
G1 X106.867 Y114.754 E.0096
G1 X106.853 Y114.317 E.01134
G1 X106.96 Y113.916 E.01077
G3 X107.211 Y113.556 I1.227 J.586 E.01143
G1 X107.547 Y113.243 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X106.99 Y113.164 E-.05129
G1 X106.836 Y112.771 E-.0481
G1 X106.785 Y112.338 E-.04973
G1 X106.841 Y111.878 E-.05279
G1 X106.929 Y111.667 E-.02608
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.139 J-.428 P1  F28800
G1 X106.455 Y110.406 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X99.852 Y103.791 E.24255
G1 X100.009 Y103.635 E.00574
G1 X100.307 Y103.935 E.01098
G1 X106.613 Y110.249 E.23158
G1 X106.498 Y110.363 E.00422
G1 X106.175 Y110.12 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X105.076 Y108.957 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.927 J-.788 P1  F28800
G1 X99.46 Y115.567 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G2 X99.753 Y115.41 I-.022 J-.393 E.00892
G1 X99.905 Y115.192 E.00689
G1 X100.037 Y114.842 E.0097
G1 X100.134 Y114.165 E.01776
G1 X100.14 Y113.132 E.0268
G1 X100.034 Y112.241 E.02329
G1 X99.846 Y111.72 E.01438
G2 X99.495 Y111.402 I-.609 J.32 E.01255
G2 X99.073 Y111.562 I-.104 J.363 E.01254
G1 X98.958 Y111.779 E.00637
G1 X98.898 Y112.085 E.00809
G1 X98.767 Y112.074 E.0034
G1 X98.78 Y111.98 E.00246
G1 X98.907 Y111.604 E.0103
G3 X99.251 Y111.288 I.573 J.278 E.01241
G3 X99.469 Y111.279 I.128 J.454 E.00571
G3 X99.822 Y111.484 I-.116 J.607 E.0108
G1 X100.008 Y111.782 E.00912
G1 X100.15 Y112.208 E.01165
G1 X100.267 Y113.8 E.04141
G1 X100.148 Y114.893 E.02855
G1 X100.003 Y115.26 E.01022
G1 X99.829 Y115.503 E.00775
G3 X99.005 Y115.455 I-.394 J-.34 E.02476
G1 X98.839 Y115.17 E.00854
G1 X98.714 Y114.692 E.01284
G1 X98.722 Y113.844 E.022
G1 X98.862 Y113.38 E.01258
G1 X99.037 Y113.113 E.00829
G3 X99.592 Y113.012 I.333 J.255 E.01607
G1 X99.498 Y113.094 E.00326
G2 X99.195 Y113.127 I-.12 J.313 E.00821
G1 X99.079 Y113.246 E.00432
G1 X98.923 Y113.536 E.00854
G1 X98.815 Y114.059 E.01386
G1 X98.836 Y114.715 E.01705
G1 X98.975 Y115.188 E.01279
G1 X99.13 Y115.42 E.00725
G2 X99.4 Y115.566 I.307 J-.246 E.00817
G1 X99.517 Y115.654 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X99.562 Y115.548 E-.01863
G1 X99.753 Y115.41 E-.02686
G1 X99.905 Y115.192 E-.03027
G1 X100.037 Y114.842 E-.0426
G1 X100.134 Y114.165 E-.078
G1 X100.136 Y113.887 E-.03164
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.413 J-1.145 P1  F28800
G1 X97.053 Y114.999 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.403 Y114.879 E.01079
G1 X97.403 Y111.369 E.10235
G1 X97.483 Y111.369 E.00233
G1 X97.483 Y115.427 E.11834
G1 X97.281 Y115.489 E.00616
G2 X96.653 Y114.657 I-5.182 J3.254 E.03042
G1 X96.482 Y114.523 E.00634
G1 X96.527 Y114.446 E.00259
G3 X97.017 Y114.951 I-1.711 J2.153 E.02058
G1 X97.216 Y115.331 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.403 Y114.879 E-.04468
G1 X97.403 Y113.271 E-.18332
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I.884 J-.837 P1  F28800
G1 X96.35 Y112.16 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G1 X91.144 Y110.792 E.1397
G1 X91.2 Y110.578 E.00574
G1 X91.899 Y110.762 E.01875
G1 X96.407 Y111.946 E.12097
G1 X96.366 Y112.102 E.00419
G1 X95.965 Y112.052 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X94.426 Y111.615 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-1.184 J.283 P1  F28800
G1 X98.291 Y127.763 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G2 X98.87 Y127.57 I.161 J-.483 E.017
G1 X99.029 Y127.288 E.0084
G1 X99.15 Y126.753 E.01422
G1 X99.174 Y124.859 E.04918
G1 X99.054 Y124.141 E.01888
G2 X98.732 Y123.651 I-1.113 J.381 E.01538
G2 X98.435 Y123.567 I-.288 J.451 E.00813
G2 X98.022 Y123.816 I.045 J.542 E.01296
G1 X97.884 Y124.07 E.00751
G1 X97.766 Y124.61 E.01432
G1 X97.745 Y126.524 E.04968
G1 X97.899 Y127.331 E.02133
G1 X98.037 Y127.576 E.0073
G2 X98.235 Y127.741 I.414 J-.296 E.00675
G1 X98.316 Y127.905 F28800
G1 X98.257 Y127.871
G1 F12000
G3 X97.944 Y127.646 I.2 J-.608 E.01016
G3 X97.742 Y127.239 I.977 J-.737 E.01186
G1 X97.635 Y126.649 E.01557
G1 X97.596 Y125.5 E.02984
G1 X97.659 Y124.5 E.02599
G1 X97.782 Y124.008 E.01318
G3 X98.156 Y123.528 I.999 J.393 E.01602
G3 X98.592 Y123.467 I.3 J.557 E.01164
G3 X98.97 Y123.72 I-.194 J.7 E.01202
G3 X99.196 Y124.197 I-1.154 J.839 E.01378
G1 X99.292 Y124.833 E.01669
G1 X99.317 Y126.027 E.031
G1 X99.243 Y126.943 E.02383
G1 X99.134 Y127.348 E.01089
G3 X98.761 Y127.826 I-1.035 J-.423 E.01595
G3 X98.315 Y127.887 I-.304 J-.563 E.01193
G1 X98.219 Y127.691 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.092 Y127.791 E-.02771
G1 X97.944 Y127.646 E-.02356
G1 X97.79 Y127.377 E-.03541
G1 X97.742 Y127.239 E-.01658
G1 X97.635 Y126.649 E-.06838
G1 X97.619 Y126.155 E-.05635
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.995 J-.701 P1  F28800
G1 X96.517 Y127.718 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G2 X96.718 Y127.496 I-.198 J-.381 E.00794
G1 X96.838 Y127.173 E.00893
G1 X96.873 Y126.622 E.01433
G1 X96.751 Y126.078 E.01447
G1 X96.617 Y125.786 E.00833
G2 X95.708 Y124.382 I-45.781 J28.625 E.04342
G3 X95.392 Y123.604 I7.621 J-3.552 E.02179
G1 X97.001 Y123.604 E.04176
G1 X97.001 Y123.726 E.00315
G1 X95.547 Y123.726 E.03774
G2 X96.212 Y124.925 I4.87 J-1.915 E.03568
G3 X96.721 Y125.726 I-6.887 J4.938 E.02465
G1 X96.959 Y126.376 E.01796
G1 X96.992 Y126.926 E.01429
G1 X96.899 Y127.386 E.01219
G1 X96.746 Y127.671 E.00839
G3 X95.832 Y127.594 I-.432 J-.34 E.02817
G3 X95.644 Y126.897 I1.369 J-.742 E.0189
G1 X95.766 Y126.891 E.00317
G1 X95.836 Y127.309 E.01101
G1 X95.95 Y127.557 E.00709
G2 X96.462 Y127.742 I.368 J-.221 E.01528
G1 X96.614 Y127.779 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X96.61 Y127.65 E-.01984
G1 X96.718 Y127.496 E-.02147
G1 X96.838 Y127.173 E-.03923
G1 X96.873 Y126.622 E-.06294
G1 X96.751 Y126.078 E-.06355
G1 X96.674 Y125.911 E-.02097
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.62 J-1.047 P1  F28800
G1 X94.934 Y126.941 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X90.877 Y130.227 E.1355
G1 X90.737 Y130.055 E.00575
G1 X94.795 Y126.769 E.1355
G1 X94.897 Y126.895 E.00419
G1 X94.62 Y127.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.357 Y128.171 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-1.189 J.259 P1  F28800
G1 X96.127 Y140.877 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X90.985 Y147.227 E.21205
G1 X90.811 Y147.087 E.00579
G1 X95.954 Y140.738 E.21205
G1 X96.08 Y140.839 E.00419
G1 X95.872 Y141.186 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X94.833 Y142.403 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.089 J.544 P1  F28800
G1 X96.916 Y138.23 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X97.357 Y138.536 E.01393
G2 X98.641 Y138.33 I.508 J-.933 E.03633
G1 X98.828 Y138.067 E.00837
G1 X98.935 Y137.733 E.0091
G1 X98.947 Y137.253 E.01245
G1 X98.839 Y136.834 E.01125
G2 X98.171 Y136.162 I-1.177 J.502 E.0252
G1 X97.827 Y136.09 E.00912
G1 X97.377 Y136.125 E.01172
G1 X97.082 Y136.245 E.00825
G2 X96.614 Y136.933 I.616 J.922 E.02214
G1 X96.494 Y136.922 E.00314
G1 X96.521 Y136.784 E.00365
G1 X96.673 Y136.473 E.00897
G1 X96.904 Y136.225 E.00881
G1 X97.173 Y136.069 E.00806
G1 X97.582 Y135.975 E.01091
G1 X97.832 Y135.985 E.00649
G3 X98.475 Y136.19 I-.001 J1.11 E.01779
G1 X98.758 Y136.466 E.01025
G1 X98.958 Y136.815 E.01042
G1 X99.067 Y137.249 E.01164
G1 X99.05 Y137.76 E.01324
G1 X98.932 Y138.117 E.00978
G1 X98.721 Y138.419 E.00955
G3 X97.826 Y138.784 I-.893 J-.91 E.02572
G1 X97.506 Y138.728 E.00843
G1 X96.75 Y138.336 E.0221
G1 X96.865 Y138.262 E.00355
G1 X97.237 Y138.469 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.357 Y138.536 E-.06413
G1 X97.651 Y138.644 E-.03575
G1 X97.954 Y138.664 E-.03453
G1 X98.258 Y138.595 E-.03561
G1 X98.505 Y138.453 E-.03246
G1 X98.641 Y138.33 E-.02094
G1 X98.664 Y138.297 E-.00458
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.924 J-.792 P1  F28800
G1 X97.093 Y140.132 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X98.865 Y140.132 E.04601
G1 X98.865 Y140.254 E.00315
G1 X96.991 Y140.254 E.04864
G1 X96.637 Y138.408 E.04878
G1 X96.746 Y138.339 E.00335
M73 P96 R1
G1 X97.081 Y140.073 E.04586
G1 X97.127 Y140.531 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.865 Y140.132 E-.20352
G1 X98.865 Y140.254 E-.01385
G1 X98.772 Y140.254 E-.01063
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.11 J1.212 P1  F28800
G1 X105.599 Y140.871 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X99.473 Y146.907 E.2232
G1 X99.316 Y146.747 E.00581
G1 X105.444 Y140.713 E.2232
G1 X105.557 Y140.828 E.00418
G1 X105.312 Y141.149 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X104.142 Y142.242 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.071 J.577 P1  F28800
G1 X106.297 Y138.245 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G3 X106.243 Y138.159 I.814 J-.571 E.00263
G1 X106.354 Y138.122 E.00303
G1 X106.385 Y138.184 E.00178
G2 X107.793 Y138.217 I.717 J-.532 E.04213
G1 X107.951 Y137.964 E.00774
G1 X108.049 Y137.576 E.01038
G1 X108.037 Y137.122 E.01179
G1 X107.906 Y136.701 E.01145
G2 X107.288 Y136.138 I-1.008 J.487 E.02223
G1 X106.957 Y136.088 E.00868
G1 X106.594 Y136.135 E.00948
G1 X106.315 Y136.261 E.00795
G1 X106.047 Y136.505 E.00941
G1 X105.923 Y136.696 E.0059
G1 X105.748 Y137.215 E.01422
G1 X105.677 Y137.96 E.01941
G1 X105.731 Y138.861 E.02343
G1 X105.894 Y139.488 E.01682
G1 X106.095 Y139.848 E.01069
G1 X106.33 Y140.075 E.00848
G1 X106.596 Y140.209 E.00773
G1 X106.973 Y140.27 E.00991
G1 X107.316 Y140.23 E.00898
G2 X107.929 Y139.555 I-.212 J-.808 E.02501
G1 X108.049 Y139.57 E.00314
G1 X107.997 Y139.77 E.00536
G1 X107.833 Y140.037 E.00813
G3 X107.111 Y140.383 I-.831 J-.807 E.02123
G1 X106.715 Y140.361 E.01029
G1 X106.413 Y140.261 E.00824
G1 X106.123 Y140.055 E.00923
G1 X106.009 Y139.928 E.00444
G1 X105.788 Y139.543 E.01151
G1 X105.593 Y138.721 E.02191
G1 X105.633 Y137.193 E.03968
G1 X105.794 Y136.688 E.01375
G1 X105.955 Y136.434 E.00781
G1 X106.256 Y136.159 E.01059
G1 X106.551 Y136.024 E.00841
G1 X106.913 Y135.97 E.0095
G1 X107.066 Y135.989 E.00401
G1 X107.301 Y136.019 E.00614
G1 X107.587 Y136.149 E.00816
G1 X107.697 Y136.232 E.00357
G3 X108.008 Y136.638 I-.894 J1.009 E.01336
G1 X108.154 Y137.102 E.01262
G1 X108.165 Y137.589 E.01263
G1 X108.069 Y137.984 E.01055
G1 X107.89 Y138.291 E.00924
G3 X106.332 Y138.293 I-.779 J-.617 E.04643
G1 X106.334 Y138.151 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X106.243 Y138.159 E-.01835
G1 X106.354 Y138.122 E-.01332
G1 X106.385 Y138.184 E-.00784
G1 X106.564 Y138.37 E-.02948
G1 X106.791 Y138.498 E-.02979
G1 X107.046 Y138.552 E-.02972
G1 X107.304 Y138.531 E-.02942
G1 X107.546 Y138.436 E-.02963
G1 X107.793 Y138.217 E-.03769
G1 X107.806 Y138.197 E-.00275
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.273 J1.186 P1  F28800
G1 X116.217 Y140.132 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X115.574 Y139.282 E.02766
G3 X114.423 Y136.044 I5.959 J-3.943 E.09006
G1 X114.547 Y136.042 E.00323
G1 X114.583 Y136.337 E.00771
G2 X114.733 Y137.126 I3.547 J-.264 E.02088
G1 X115.051 Y138.061 E.02564
G1 X115.296 Y138.572 E.01472
G1 X115.831 Y139.436 E.02636
G1 X116.349 Y140.057 E.02099
G1 X116.259 Y140.254 E.00562
G1 X113.756 Y140.254 E.06496
G1 X113.756 Y140.132 E.00315
G1 X116.157 Y140.132 E.06231
G1 X116.577 Y139.959 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X115.574 Y139.282 E-.11753
G1 X115.189 Y138.625 E-.08677
G1 X115.102 Y138.436 E-.0237
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-1.079 J-.563 P1  F28800
G1 X113.59 Y141.331 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X109.095 Y146.883 E.18538
G1 X108.923 Y146.743 E.00575
G1 X113.417 Y141.191 E.18537
G1 X113.544 Y141.294 E.00423
G1 X113.335 Y141.64 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.298 Y142.858 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.144 J.414 P1  F28800
G1 X117.875 Y127.435 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.245 Y128.217 E.0293
G1 X116.636 Y128.635 E.02152
G1 X115.937 Y128.868 E.02148
G1 X115.2 Y128.892 E.02151
G1 X114.488 Y128.707 E.02145
G1 X113.854 Y128.332 E.0215
G1 X112.967 Y127.38 E.03795
G1 X112.967 Y128.817 E.04192
G1 X112.887 Y128.817 E.00233
G1 X112.887 Y121.471 E.21421
G1 X112.967 Y121.471 E.00233
G1 X112.967 Y126.331 E.14172
G1 X113.082 Y127.073 E.0219
G1 X113.423 Y127.761 E.02239
G1 X113.956 Y128.316 E.02243
G1 X114.631 Y128.683 E.02241
G1 X115.384 Y128.829 E.02238
G1 X116.149 Y128.742 E.02243
G1 X116.848 Y128.43 E.02233
G1 X117.422 Y127.919 E.02241
G1 X117.831 Y127.237 E.02317
G1 X117.831 Y121.471 E.16814
G1 X117.909 Y121.471 E.00227
G1 X117.909 Y127.235 E.16809
G1 X118.339 Y127.848 E.02182
G1 X118.903 Y128.284 E.02079
G1 X119.567 Y128.536 E.02072
G1 X120.28 Y128.585 E.02083
G1 X120.974 Y128.42 E.02078
G1 X121.588 Y128.06 E.02076
G1 X122.071 Y127.536 E.02078
G1 X122.378 Y126.894 E.02077
G1 X122.483 Y126.205 E.02031
G1 X122.483 Y121.471 E.13804
G1 X122.563 Y121.471 E.00233
G1 X122.563 Y126.174 E.13714
G1 X122.463 Y126.872 E.02057
G1 X122.181 Y127.506 E.02023
G1 X121.735 Y128.035 E.02016
G1 X121.16 Y128.42 E.02017
G1 X120.499 Y128.632 E.02026
G1 X119.808 Y128.652 E.02015
G1 X119.137 Y128.481 E.02019
G3 X118.54 Y128.131 I40.575 J-69.875 E.02017
G1 X117.917 Y127.479 E.02632
G1 X117.565 Y127.183 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X117.245 Y128.217 E-.11388
G1 X116.636 Y128.635 E-.08413
G1 X116.387 Y128.718 E-.02999
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I.178 J1.204 P1  F28800
G1 X125.467 Y127.38 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X125.467 Y128.817 E.04192
G1 X125.387 Y128.817 E.00233
G1 X125.387 Y121.471 E.21421
G1 X125.467 Y121.471 E.00233
G1 X125.467 Y126.331 E.14172
G1 X125.582 Y127.073 E.0219
G1 X125.923 Y127.761 E.02239
G1 X126.456 Y128.316 E.02243
G1 X127.131 Y128.683 E.02241
G1 X127.884 Y128.829 E.02238
G1 X128.647 Y128.742 E.02237
G1 X129.35 Y128.43 E.02244
G1 X129.925 Y127.918 E.02244
G1 X130.329 Y127.237 E.0231
G1 X130.329 Y121.471 E.16812
G1 X130.409 Y121.471 E.00233
G1 X130.409 Y127.235 E.16809
G1 X130.839 Y127.848 E.02182
G1 X131.403 Y128.284 E.0208
G1 X132.069 Y128.536 E.02078
G1 X132.778 Y128.585 E.0207
G1 X133.474 Y128.42 E.02085
G1 X134.088 Y128.06 E.02076
G1 X134.571 Y127.536 E.02078
G1 X134.878 Y126.894 E.02077
G1 X134.983 Y126.205 E.02031
G1 X134.983 Y121.471 E.13804
G1 X135.061 Y121.471 E.00227
G1 X135.061 Y126.174 E.13715
G1 X134.963 Y126.873 E.02056
G1 X134.681 Y127.506 E.02023
G1 X134.235 Y128.035 E.02016
G1 X133.658 Y128.42 E.02023
G1 X133.001 Y128.632 E.02015
G1 X132.308 Y128.652 E.02021
G1 X131.637 Y128.481 E.02019
G3 X131.041 Y128.131 I40.456 J-69.671 E.02017
G1 X130.378 Y127.435 E.02802
G1 X129.745 Y128.217 E.02935
G1 X129.138 Y128.635 E.02148
G1 X128.437 Y128.868 E.02153
G1 X127.702 Y128.892 E.02145
G1 X126.986 Y128.707 E.02156
G1 X126.354 Y128.332 E.02144
G1 X125.508 Y127.423 E.0362
G1 X125.078 Y127.285 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X125.467 Y128.817 E-.15894
G1 X125.387 Y128.817 E-.00912
G1 X125.387 Y128.291 E-.05994
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-1.198 J-.214 P1  F28800
G1 X123.616 Y138.204 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G1 X123.924 Y138.055 E.00888
G1 X124.164 Y137.835 E.00845
G2 X123.815 Y136.212 I-.846 J-.668 E.04919
G1 X123.485 Y136.095 E.0091
G1 X123.141 Y136.081 E.00894
G1 X122.945 Y136.131 E.00523
G1 X122.805 Y136.166 E.00375
G1 X122.52 Y136.337 E.00862
G1 X122.3 Y136.576 E.00845
G2 X122.37 Y137.848 I.892 J.589 E.03543
G1 X122.625 Y138.071 E.00877
G1 X122.927 Y138.211 E.00864
G1 X123.273 Y138.258 E.00906
G1 X123.557 Y138.213 E.00746
G1 X123.867 Y138.436 F28800
G1 X123.809 Y138.546
G1 F12000
G2 X123.2 Y138.38 I-.552 J.828 E.01664
G2 X122.876 Y138.45 I.021 J.89 E.00866
G2 X124.247 Y139.279 I.381 J.918 E.11371
G2 X123.857 Y138.581 I-.991 J.096 E.02135
G1 X123.83 Y138.255 F28800
G1 X123.768 Y138.313
G1 F12000
G1 X124.162 Y138.725 E.0148
G1 X124.311 Y139.021 E.00859
G1 X124.368 Y139.348 E.00861
G1 X124.328 Y139.676 E.00856
G1 X124.192 Y139.978 E.0086
G1 X123.975 Y140.225 E.00855
G1 X123.695 Y140.399 E.00856
G3 X123.378 Y140.483 I-9.308 J-34.709 E.00851
G1 X123.049 Y140.471 E.00855
G1 X122.742 Y140.362 E.00845
G1 X122.473 Y140.167 E.00862
G1 X122.277 Y139.905 E.00849
G1 X122.166 Y139.592 E.00862
G1 X122.149 Y139.263 E.00854
G1 X122.227 Y138.947 E.00846
G1 X122.402 Y138.66 E.00872
G1 X122.742 Y138.326 E.01236
G1 X122.288 Y137.934 E.01556
G1 X122.099 Y137.631 E.00928
G1 X122.011 Y137.296 E.00899
G1 X122.023 Y136.954 E.00888
G1 X122.137 Y136.625 E.00903
G1 X122.342 Y136.341 E.0091
G1 X122.635 Y136.119 E.00955
G1 X122.987 Y135.986 E.00974
G1 X123.374 Y135.963 E.01006
G1 X123.742 Y136.049 E.00982
G1 X124.073 Y136.242 E.00995
G1 X124.307 Y136.494 E.00892
G1 X124.466 Y136.815 E.0093
G1 X124.519 Y137.155 E.00893
G1 X124.473 Y137.494 E.00887
G1 X124.327 Y137.812 E.0091
G3 X123.82 Y138.283 I-1.45 J-1.053 E.01807
G1 X123.476 Y138.587 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X124.162 Y138.725 E-.06382
G1 X124.311 Y139.021 E-.03772
G1 X124.368 Y139.348 E-.03783
G1 X124.328 Y139.676 E-.03762
G1 X124.192 Y139.978 E-.03776
G1 X124.115 Y140.065 E-.01325
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.695 J-.999 P1  F28800
G1 X122.497 Y141.191 Z2.2
M73 P96 R0
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X122.67 Y141.331 E.00579
G1 X119.065 Y145.783 E.14866
G1 X118.893 Y145.643 E.00575
G1 X122.459 Y141.238 E.14709
G1 X122.58 Y141.398 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.67 Y141.331 E-.02634
G1 X121.557 Y142.706 E-.20166
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I.192 J1.202 P1  F28800
G1 X130.946 Y141.21 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X131.087 Y141.304 E.00439
G1 X131.13 Y141.333 E.00135
G1 X128.757 Y144.865 E.11042
G1 X128.573 Y144.741 E.00574
G1 X130.913 Y141.259 E.10887
G1 X131.024 Y141.36 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X131.087 Y141.304 E-.02048
G1 X131.13 Y141.333 E-.00591
G1 X130.144 Y142.801 E-.20161
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.143 J.419 P1  F28800
G1 X131.931 Y137.926 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X132.014 Y138.025 E.00336
G1 X131.914 Y138.086 E.00303
G1 X131.854 Y138.014 E.00243
G1 X131.592 Y137.843 E.00812
G1 X131.335 Y137.769 E.00695
G1 X131.158 Y137.773 E.0046
G2 X130.571 Y137.995 I.029 J.966 E.01658
G1 X130.352 Y138.253 E.00878
G1 X130.222 Y138.561 E.00868
G1 X130.17 Y139.018 E.01195
G1 X130.222 Y139.439 E.01101
G1 X130.36 Y139.759 E.00903
G1 X130.581 Y140.016 E.00879
G1 X130.846 Y140.184 E.00814
G1 X131.141 Y140.263 E.00793
G1 X131.516 Y140.251 E.00974
G1 X131.825 Y140.143 E.00851
G2 X132.19 Y139.841 I-.622 J-1.123 E.01236
G1 X132.384 Y139.507 E.01
G1 X132.505 Y139.034 E.01267
G1 X132.548 Y138.29 E.01935
G1 X132.488 Y137.422 E.02259
G1 X132.377 Y136.973 E.01199
G1 X132.171 Y136.562 E.01195
G1 X131.921 Y136.308 E.00923
G1 X131.634 Y136.154 E.00845
G1 X131.294 Y136.09 E.00899
G1 X130.911 Y136.125 E.00997
G2 X130.297 Y136.8 I.21 J.808 E.02506
G1 X130.168 Y136.784 E.00337
G3 X130.908 Y136.005 I.979 J.19 E.02945
G1 X131.306 Y135.972 E.01036
G1 X131.45 Y136 E.00381
G1 X131.675 Y136.043 E.00593
G1 X132.024 Y136.235 E.01033
G1 X132.278 Y136.51 E.00972
G1 X132.492 Y136.937 E.0124
G1 X132.61 Y137.423 E.01299
G1 X132.635 Y138.952 E.03969
G1 X132.491 Y139.555 E.01609
G1 X132.27 Y139.93 E.01128
G1 X131.995 Y140.179 E.00962
G1 X131.83 Y140.272 E.00493
G1 X131.495 Y140.374 E.00909
G1 X131.087 Y140.374 E.01057
G1 X130.758 Y140.273 E.00893
G1 X130.477 Y140.081 E.00884
G1 X130.234 Y139.775 E.01014
G1 X130.09 Y139.385 E.0108
G1 X130.053 Y138.876 E.01323
G1 X130.139 Y138.425 E.01191
G1 X130.318 Y138.096 E.00971
G1 X130.578 Y137.841 E.00948
G1 X130.865 Y137.696 E.00834
G1 X131.2 Y137.644 E.0088
G1 X131.509 Y137.686 E.00809
G1 X131.646 Y137.738 E.00379
G1 X131.881 Y137.893 E.0073
G1 X131.901 Y138.052 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X132.014 Y138.025 E-.02139
G1 X131.914 Y138.086 E-.01332
G1 X131.854 Y138.014 E-.01066
G1 X131.592 Y137.843 E-.03566
G1 X131.335 Y137.769 E-.03052
G1 X131.158 Y137.773 E-.0202
G1 X131.032 Y137.776 E-.01431
G1 X130.805 Y137.846 E-.02711
G1 X130.571 Y137.995 E-.03163
G1 X130.439 Y138.15 E-.0232
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.136 J.436 P1  F28800
G1 X137.821 Y118.899 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X136.069 Y118.899 E.05109
G1 X136.069 Y118.821 E.00227
G1 X137.901 Y118.821 E.05342
G1 X137.901 Y131.899 E.38135
G1 X136.069 Y131.899 E.05342
G1 X136.069 Y131.821 E.00227
G1 X137.821 Y131.821 E.05109
G1 X137.821 Y118.959 E.37505
G1 X137.839 Y118.499 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X136.069 Y118.899 E-.19985
G1 X136.069 Y118.821 E-.00889
G1 X136.238 Y118.821 E-.01926
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-1.189 J.259 P1  F28800
G1 X140.906 Y140.259 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G2 X141.229 Y140.171 I.077 J-.356 E.00905
G1 X141.356 Y140.003 E.00547
G1 X141.521 Y139.561 E.01225
G1 X141.63 Y138.838 E.01896
G1 X141.64 Y137.756 E.02809
G1 X141.549 Y136.91 E.02207
G2 X141.234 Y136.194 I-1.663 J.304 E.02048
G2 X140.927 Y136.095 I-.243 J.227 E.00876
G1 X140.927 Y136.095 E0
G2 X140.577 Y136.407 I.168 J.54 E.01255
G1 X140.463 Y136.72 E.00863
G1 X140.34 Y137.513 E.02084
G1 X140.325 Y138.614 E.02857
G1 X140.416 Y139.452 E.02189
G2 X140.733 Y140.168 I1.686 J-.318 E.02048
G2 X140.848 Y140.242 I.25 J-.264 E.00358
G1 X140.943 Y140.376 F28800
G1 X141.038 Y140.385
G1 F12000
G3 X140.594 Y140.192 I-.054 J-.485 E.01314
G1 X140.426 Y139.894 E.00888
G1 X140.302 Y139.487 E.01104
G1 X140.201 Y137.841 E.04281
G1 X140.338 Y136.719 E.02932
G1 X140.471 Y136.353 E.0101
G1 X140.618 Y136.133 E.00687
G3 X141.089 Y135.987 I.355 J.31 E.01345
G3 X141.369 Y136.162 I-.083 J.443 E.00878
G1 X141.54 Y136.466 E.00903
G1 X141.663 Y136.875 E.01109
G1 X141.765 Y138.527 E.04295
G1 X141.62 Y139.651 E.02941
G1 X141.474 Y140.036 E.01068
G3 X141.096 Y140.369 I-.576 J-.273 E.01346
G1 X140.944 Y140.256 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.879 Y140.377 E-.02472
G1 X140.764 Y140.337 E-.01388
G1 X140.594 Y140.192 E-.02549
G1 X140.426 Y139.894 E-.039
G1 X140.302 Y139.487 E-.04849
G1 X140.261 Y138.818 E-.07642
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.559 J-1.081 P1  F28800
G1 X138.557 Y139.699 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X138.907 Y139.579 E.01079
G1 X138.907 Y136.069 E.10235
G1 X138.985 Y136.069 E.00227
G1 X138.985 Y140.121 E.11816
G1 X138.782 Y140.183 E.00618
G2 X138.157 Y139.358 I-5.291 J3.36 E.0302
G1 X137.982 Y139.222 E.00647
G1 X138.027 Y139.144 E.00261
G3 X138.521 Y139.651 I-1.761 J2.212 E.02069
G1 X138.726 Y140.028 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X138.907 Y139.579 E-.04471
G1 X138.907 Y137.971 E-.18329
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-1.144 J.415 P1  F28800
G1 X140.113 Y141.296 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G1 X140.149 Y141.298 E.00093
G1 X140.335 Y141.309 E.00484
G1 X140.146 Y144.643 E.08667
G1 X139.926 Y144.631 E.00572
G1 X140.11 Y141.356 E.08512
G1 X140.144 Y141.315 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.149 Y141.298 E-.00798
G1 X140.335 Y141.309 E-.02125
G1 X140.237 Y143.05 E-.19877
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.115 J1.211 P1  F28800
G1 X151.861 Y144.155 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X150.275 Y141.333 E.08401
G1 X150.468 Y141.225 E.00577
G1 X150.714 Y141.662 E.01302
G1 X152.053 Y144.047 E.07098
G1 X151.913 Y144.126 E.00417
G1 X151.674 Y143.801 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X150.901 Y142.401 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.158 J-.375 P1  F28800
G1 X149.834 Y139.105 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X149.882 Y139.13 E.00142
G3 X150.807 Y139.923 I-2.144 J3.437 E.03173
G1 X150.649 Y139.981 E.00436
G2 X150.067 Y139.397 I-167.601 J166.675 E.02141
G1 X149.78 Y139.223 E.0087
G1 X149.809 Y139.159 E.00181
G1 X149.878 Y139.136 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X149.882 Y139.13 E-.00896
G1 X150.131 Y139.294 E-.03403
G1 X150.364 Y139.48 E-.03399
G1 X150.807 Y139.923 E-.07133
G1 X150.649 Y139.981 E-.01915
G1 X150.274 Y139.605 E-.06054
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.529 J1.096 P1  F28800
G1 X150.878 Y139.896 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X150.878 Y136.048 E.09987
G1 X150.999 Y136.048 E.00315
G1 X150.999 Y139.851 E.0987
G1 X150.934 Y139.876 E.00181
G1 X150.882 Y139.496 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X150.905 Y137.876 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.738 J-.968 P1  F28800
G1 X148.219 Y139.924 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X148.065 Y139.981 E.00428
G3 X147.483 Y139.397 I331.644 J-331.058 E.02139
G1 X147.196 Y139.222 E.00872
G1 X147.249 Y139.105 E.00334
G1 X147.296 Y139.13 E.0014
G3 X148.18 Y139.878 I-2.072 J3.343 E.03017
G1 X148.054 Y139.922 F28800
G1 X148.413 Y139.852
G1 F12000
G1 X148.292 Y139.897 E.00336
G1 X148.292 Y136.048 E.09987
G1 X148.413 Y136.048 E.00315
G1 X148.413 Y139.792 E.09714
G1 X148.289 Y139.816 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X148.292 Y139.897 E-.01832
G1 X148.292 Y138.057 E-.20968
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.024 J.657 P1  F28800
G1 X151.859 Y132.499 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X152.209 Y132.379 E.01079
G1 X152.209 Y128.871 E.1023
G1 X152.291 Y128.871 E.00239
G1 X152.291 Y132.913 E.11787
G1 X152.082 Y132.977 E.00636
G2 X151.459 Y132.158 I-4.892 J3.079 E.03005
G1 X151.284 Y132.022 E.00647
G1 X151.329 Y131.944 E.00263
G3 X151.823 Y132.451 I-1.724 J2.176 E.02071
G1 X152.028 Y132.828 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X152.209 Y132.379 E-.04469
G1 X152.209 Y130.771 E-.18331
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I.973 J.731 P1  F28800
G1 X153.563 Y128.97 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G1 X153.885 Y129.638 E.01925
G1 X154.595 Y130.622 E.03147
G1 X154.985 Y131.263 E.01948
G1 X155.131 Y131.67 E.01123
G1 X155.184 Y132.138 E.01222
G1 X155.131 Y132.501 E.00951
G1 X154.97 Y132.848 E.00995
G3 X153.816 Y133.039 I-.666 J-.446 E.03401
G1 X153.622 Y132.818 E.00764
G1 X153.477 Y132.493 E.00922
G1 X153.433 Y132.149 E.009
G1 X153.549 Y132.149 E.00299
G2 X153.856 Y132.918 I1.096 J.008 E.02203
G2 X154.878 Y132.771 I.45 J-.5 E.03057
G1 X155.011 Y132.49 E.00807
G2 X155.059 Y131.945 I-1.451 J-.403 E.01428
G1 X154.953 Y131.499 E.0119
G1 X154.872 Y131.303 E.00551
G1 X154.082 Y130.143 E.0364
G1 X153.593 Y129.317 E.02493
G3 X153.466 Y128.85 I1.784 J-.732 E.01258
G1 X155.071 Y128.85 E.04165
G1 X155.071 Y128.97 E.0031
G1 X153.623 Y128.97 E.03758
G1 X153.184 Y129.098 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X153.885 Y129.638 E-.08184
G1 X154.595 Y130.622 E-.13825
G1 X154.631 Y130.681 E-.00791
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.814 J.904 P1  F28800
G1 X156.153 Y132.051 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X156.291 Y131.879 E.00572
G1 X157.399 Y132.776 E.03698
G1 X161.032 Y135.719 E.12135
G1 X160.893 Y135.891 E.00575
G1 X156.199 Y132.089 E.15676
G1 X156.357 Y131.969 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X156.291 Y131.879 E-.02604
G1 X157.399 Y132.776 E-.16246
G1 X157.668 Y132.994 E-.0395
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.207 J-.152 P1  F28800
G1 X156.27 Y121.865 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X158.265 Y121.976 E.05187
G1 X159.676 Y122.054 E.03668
G1 X159.663 Y122.276 E.00577
G1 X156.258 Y122.085 E.08851
G1 X156.266 Y121.925 E.00416
G1 X156.668 Y121.895 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X158.265 Y121.976 E-.22793
G1 X158.266 Y121.976 E-.00007
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.151 J-1.208 P1  F28800
G1 X154.756 Y122.415 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G3 X155.144 Y123.393 I-.978 J.955 E.02805
G1 X155.086 Y123.793 E.01048
G1 X154.948 Y124.081 E.00828
G3 X153.741 Y124.077 I-.602 J-.393 E.03717
G3 X153.535 Y123.473 I1.023 J-.686 E.01675
G1 X153.656 Y123.462 E.00315
G2 X153.997 Y124.18 I1.086 J-.076 E.02112
G2 X154.895 Y123.942 I.347 J-.505 E.02737
G1 X154.998 Y123.662 E.00773
G1 X155.023 Y123.257 E.01055
G1 X154.962 Y122.938 E.00842
G2 X154.342 Y122.405 I-.808 J.313 E.02209
G1 X154.336 Y122.334 E.00185
G2 X154.979 Y121.975 I.035 J-.691 E.02014
G1 X155.11 Y121.66 E.00886
G1 X155.159 Y121.189 E.01229
G2 X154.786 Y120.23 I-1.417 J-.001 E.02734
G2 X153.826 Y120.366 I-.423 J.468 E.0287
G2 X153.617 Y120.967 I1.243 J.768 E.01666
G1 X153.503 Y120.953 E.00298
G1 X153.588 Y120.574 E.01009
G1 X153.732 Y120.291 E.00823
G3 X154.391 Y119.955 I.627 J.414 E.02009
G3 X154.874 Y120.155 I-.041 J.781 E.01381
G1 X155.087 Y120.428 E.00899
G1 X155.227 Y120.784 E.00993
G1 X155.278 Y121.292 E.01325
G1 X155.208 Y121.749 E.012
G1 X155.053 Y122.078 E.00943
G1 X154.795 Y122.37 E.0101
G1 X154.506 Y122.657 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X154.971 Y122.687 E-.04137
G1 X155.1 Y122.982 E-.03669
G1 X155.144 Y123.393 E-.04716
G1 X155.086 Y123.793 E-.04606
G1 X154.948 Y124.081 E-.03637
G1 X154.829 Y124.214 E-.02036
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I.215 J-1.198 P1  F28800
G1 X151.955 Y123.699 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X152.305 Y123.579 E.01079
G1 X152.305 Y120.071 E.1023
G1 X152.383 Y120.071 E.00227
G1 X152.383 Y124.124 E.11818
G1 X152.18 Y124.186 E.00618
G2 X151.555 Y123.357 I-5.179 J3.25 E.03033
G1 X151.382 Y123.222 E.00639
G1 X151.428 Y123.143 E.00265
G3 X151.919 Y123.651 I-1.828 J2.26 E.02065
G1 X152.123 Y124.029 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X152.305 Y123.579 E-.04471
G1 X152.305 Y121.971 E-.18329
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.156 J-.379 P1  F28800
G1 X149.953 Y114.798 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X150.305 Y114.678 E.01082
G1 X150.305 Y111.171 E.10227
G1 X150.387 Y111.171 E.00239
G1 X150.387 Y115.22 E.11805
G1 X150.18 Y115.283 E.0063
G2 X149.557 Y114.456 I-5.224 J3.291 E.03022
G1 X149.382 Y114.321 E.00644
G1 X149.427 Y114.243 E.00264
G3 X149.918 Y114.749 I-1.71 J2.147 E.02062
G1 X150.122 Y115.128 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X150.305 Y114.678 E-.04483
G1 X150.305 Y113.072 E-.18317
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I.588 J1.065 P1  F28800
G1 X151.528 Y112.396 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G1 X152.861 Y115.36 E.08435
G1 X152.75 Y115.411 E.00316
G1 X151.474 Y112.574 E.0807
G1 X151.474 Y112.274 E.00779
G1 X152.884 Y112.274 E.03659
G1 X152.884 Y111.15 E.02917
G1 X153.025 Y111.15 E.00367
G1 X153.025 Y112.274 E.02917
G1 X153.369 Y112.274 E.00893
G1 X153.369 Y112.396 E.00315
G1 X153.025 Y112.396 E.00893
G1 X153.025 Y113.972 E.0409
G1 X152.884 Y113.972 E.00367
G1 X152.884 Y112.396 E.0409
G1 X151.588 Y112.396 E.03363
G1 X151.128 Y112.394 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X152.377 Y114.234 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I.811 J.907 P1  F28800
G1 X154.679 Y112.176 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X154.58 Y111.977 E.00575
G1 X159.265 Y109.663 E.1356
G1 X159.34 Y109.814 E.0044
G1 X159.363 Y109.861 E.00135
G1 X154.732 Y112.149 E.13404
G1 X154.692 Y111.954 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X154.58 Y111.977 E-.02618
G1 X156.168 Y111.193 E-.20182
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I.068 J-1.215 P1  F28800
G1 X142.376 Y110.423 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X142.234 Y110.254 E.00572
G1 X150.694 Y103.155 E.28661
G1 X150.803 Y103.285 E.00439
G1 X150.836 Y103.324 E.00133
G1 X142.422 Y110.384 E.28505
G1 X142.337 Y110.206 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X142.234 Y110.254 E-.02606
G1 X143.591 Y109.116 E-.20194
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-1.144 J-.416 P1  F28800
G1 X141.366 Y115.234 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X142.531 Y115.234 E.03025
G1 X142.531 Y115.356 E.00315
G1 X141.26 Y115.356 E.03301
G1 X141.022 Y113.473 E.04925
G1 X141.136 Y113.42 E.00327
G1 X141.358 Y115.175 E.0459
G1 X141.392 Y115.633 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X142.531 Y115.234 E-.1339
G1 X142.531 Y115.356 E-.01385
G1 X141.828 Y115.356 E-.08025
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.215 J.074 P1  F28800
G1 X141.924 Y113.764 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G2 X142.214 Y113.636 I.02 J-.347 E.00853
G1 X142.333 Y113.48 E.0051
G1 X142.479 Y113.143 E.00953
G1 X142.549 Y112.565 E.0151
G1 X142.497 Y112.02 E.01421
G1 X142.348 Y111.592 E.01178
G2 X142.08 Y111.254 I-.748 J.318 E.01133
G2 X141.473 Y111.37 I-.235 J.418 E.01744
G1 X141.329 Y111.601 E.00705
G1 X141.219 Y112.023 E.01131
G1 X141.098 Y112.015 E.00313
G1 X141.238 Y111.518 E.01339
G1 X141.402 Y111.27 E.00772
G3 X141.891 Y111.076 I.43 J.371 E.0142
G3 X142.276 Y111.27 I-.045 J.568 E.01147
G3 X142.572 Y111.835 I-1.146 J.961 E.0167
G1 X142.67 Y112.531 E.01822
G1 X142.59 Y113.183 E.01704
G1 X142.428 Y113.553 E.01049
G3 X141.941 Y113.886 I-.57 J-.311 E.0159
G3 X141.701 Y113.812 I.005 J-.44 E.0066
G1 X141.204 Y113.389 E.01696
G1 X141.37 Y113.312 E.00477
G1 X141.717 Y113.68 E.01314
G2 X141.865 Y113.755 I.226 J-.264 E.00432
G1 X141.965 Y113.85 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X142.019 Y113.757 E-.01766
G1 X142.108 Y113.722 E-.01087
G1 X142.214 Y113.636 E-.01554
G1 X142.333 Y113.48 E-.02239
G1 X142.479 Y113.143 E-.04184
G1 X142.549 Y112.565 E-.06634
G1 X142.505 Y112.1 E-.05335
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.805 J-.912 P1  F28800
G1 X139.447 Y114.798 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X139.799 Y114.678 E.01082
G1 X139.799 Y111.171 E.10227
G1 X139.881 Y111.171 E.00239
G1 X139.881 Y115.233 E.11844
G1 X139.679 Y115.293 E.00614
G2 X139.052 Y114.457 I-5.266 J3.297 E.03051
G1 X138.88 Y114.322 E.00637
G1 X138.926 Y114.244 E.00264
G3 X139.412 Y114.749 I-1.71 J2.129 E.0205
G1 X139.61 Y115.131 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X139.799 Y114.678 E-.0448
G1 X139.799 Y113.071 E-.1832
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.186 J-1.203 P1  F28800
G1 X129.255 Y114.699 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X129.605 Y114.579 E.01079
G1 X129.605 Y111.069 E.10235
G1 X129.685 Y111.069 E.00233
G1 X129.685 Y115.124 E.11823
G1 X129.48 Y115.187 E.00623
G2 X128.855 Y114.357 I-5.18 J3.251 E.03034
G1 X128.682 Y114.222 E.00639
G1 X128.727 Y114.144 E.00261
G3 X129.219 Y114.651 I-1.77 J2.211 E.02064
G1 X129.424 Y115.028 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X129.605 Y114.579 E-.0447
G1 X129.605 Y112.971 E-.1833
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I-.887 J.833 P1  F28800
G1 X131.763 Y115.269 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G2 X132.067 Y115.111 I-.018 J-.407 E.0092
G1 X132.187 Y114.903 E.00621
G1 X132.263 Y114.571 E.00883
G1 X132.384 Y114.581 E.00315
G1 X132.288 Y114.964 E.01025
G3 X131.915 Y115.365 I-.663 J-.244 E.01459
G3 X131.347 Y115.204 I-.158 J-.524 E.01617
G3 X131.05 Y114.633 I1.037 J-.903 E.01686
G1 X130.875 Y113.17 E.03824
G1 X130.993 Y111.811 E.03541
G1 X131.147 Y111.391 E.0116
G3 X131.492 Y111.023 I.873 J.473 E.01323
G3 X131.826 Y110.987 I.225 J.519 E.00886
G3 X132.193 Y111.266 I-.154 J.583 E.01226
G1 X132.356 Y111.619 E.01009
G1 X132.468 Y112.334 E.01878
G1 X132.394 Y113.017 E.01783
G1 X132.238 Y113.383 E.01032
G3 X131.57 Y113.68 I-.567 J-.374 E.02002
G1 X131.631 Y113.567 E.00334
G2 X132.139 Y113.321 I.073 J-.498 E.01555
G1 X132.282 Y112.977 E.00967
G1 X132.351 Y112.386 E.01546
G1 X132.291 Y111.843 E.01418
G2 X131.96 Y111.176 I-1.325 J.243 E.01956
G2 X131.43 Y111.209 I-.246 J.32 E.01503
G2 X131.24 Y111.47 I.974 J.907 E.00839
G1 X131.104 Y111.861 E.01073
G1 X131.009 Y112.557 E.01823
G1 X131.014 Y113.661 E.02867
G1 X131.136 Y114.499 E.02198
G1 X131.279 Y114.896 E.01095
G1 X131.43 Y115.121 E.00702
G2 X131.703 Y115.267 I.315 J-.258 E.00825
G1 X131.821 Y115.369 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X131.877 Y115.254 E-.01997
G1 X131.969 Y115.206 E-.01177
G1 X132.067 Y115.111 E-.01565
G1 X132.187 Y114.903 E-.02729
G1 X132.263 Y114.571 E-.0388
G1 X132.384 Y114.581 E-.01383
G1 X132.288 Y114.964 E-.04504
G1 X132.153 Y115.192 E-.03022
G1 X132.041 Y115.3 E-.01762
G1 X131.981 Y115.331 E-.00781
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.2 I1.198 J-.212 P1  F28800
G1 X131.08 Y110.244 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12000
G1 X132.774 Y103.8 E.17291
G1 X132.987 Y103.856 E.00574
G1 X131.294 Y110.3 E.17291
G1 X131.138 Y110.259 E.00418
G1 X131.186 Y109.858 F28800
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X131.629 Y108.32 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z2.2 I-.125 J-1.211 P1  F28800
G1 X96.407 Y111.946 Z2.2
G1 Z2
G1 E.8 F1800
G1 F12000
G1 X96.35 Y112.16 E.00575
G1 X91.144 Y110.792 E.1397
G1 X91.2 Y110.578 E.00574
M73 P97 R0
G1 X91.311 Y110.607 E.00298
G1 X96.349 Y111.931 E.13519
G1 X96.251 Y112.103 F28800
G1 X95.76 Y111.986
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X96.378 Y111.986 E.00108
G1 X95.917 Y111.836 F28800
G1 F3600
G1 X95.189 Y111.836 E.00127
G1 X94.618 Y111.686 F28800
G1 F3600
G1 X95.346 Y111.686 E.00127
G1 X94.775 Y111.536 F28800
G1 F3600
G1 X94.047 Y111.536 E.00127
G1 X93.476 Y111.386 F28800
G1 F3600
G1 X94.203 Y111.386 E.00127
G1 X93.632 Y111.236 F28800
G1 F3600
G1 X92.905 Y111.236 E.00127
G1 X92.334 Y111.086 F28800
G1 F3600
G1 X93.061 Y111.086 E.00126
G1 X92.49 Y110.936 F28800
G1 F3600
G1 X91.763 Y110.936 E.00126
G1 X91.192 Y110.786 F28800
G1 F3600
G1 X91.919 Y110.786 E.00126
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X91.192 Y110.786 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.026 J1.217 P1  F28800
G1 X114.999 Y110.27 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X114.778 Y110.27 E.00575
G1 X114.778 Y104.806 E.14179
G1 X114.999 Y104.806 E.00575
G1 X114.999 Y110.21 E.14023
G1 X114.806 Y110.162 F28800
G1 X114.981 Y110.036
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X114.864 Y110.036 E.0002
G1 X114.864 Y109.886 E.00026
G1 X114.914 Y109.886 E.00009
G1 X114.914 Y109.736 E.00026
G1 X114.864 Y109.736 E.00009
G1 X114.864 Y109.586 E.00026
G1 X114.914 Y109.586 E.00009
G1 X114.914 Y109.436 E.00026
G1 X114.864 Y109.436 E.00009
G1 X114.864 Y109.286 E.00026
G1 X114.914 Y109.286 E.00009
G1 X114.914 Y109.136 E.00026
G1 X114.864 Y109.136 E.00009
G1 X114.864 Y108.986 E.00026
G1 X114.914 Y108.986 E.00009
G1 X114.914 Y108.836 E.00026
G1 X114.864 Y108.836 E.00009
G1 X114.864 Y108.686 E.00026
G1 X114.914 Y108.686 E.00009
G1 X114.914 Y108.536 E.00026
G1 X114.864 Y108.536 E.00009
G1 X114.864 Y108.386 E.00026
G1 X114.914 Y108.386 E.00009
G1 X114.914 Y108.236 E.00026
G1 X114.864 Y108.236 E.00009
G1 X114.864 Y108.086 E.00026
G1 X114.914 Y108.086 E.00009
G1 X114.914 Y107.936 E.00026
G1 X114.864 Y107.936 E.00009
G1 X114.864 Y107.786 E.00026
G1 X114.914 Y107.786 E.00009
G1 X114.914 Y107.636 E.00026
G1 X114.864 Y107.636 E.00009
G1 X114.864 Y107.486 E.00026
G1 X114.914 Y107.486 E.00009
G1 X114.914 Y107.336 E.00026
G1 X114.864 Y107.336 E.00009
G1 X114.864 Y107.186 E.00026
G1 X114.914 Y107.186 E.00009
G1 X114.914 Y107.036 E.00026
G1 X114.864 Y107.036 E.00009
G1 X114.864 Y106.886 E.00026
G1 X114.914 Y106.886 E.00009
G1 X114.914 Y106.736 E.00026
G1 X114.864 Y106.736 E.00009
G1 X114.864 Y106.586 E.00026
G1 X114.914 Y106.586 E.00009
G1 X114.914 Y106.436 E.00026
G1 X114.864 Y106.436 E.00009
G1 X114.864 Y106.286 E.00026
G1 X114.914 Y106.286 E.00009
G1 X114.914 Y106.136 E.00026
G1 X114.864 Y106.136 E.00009
G1 X114.864 Y105.986 E.00026
G1 X114.914 Y105.986 E.00009
G1 X114.914 Y105.836 E.00026
G1 X114.864 Y105.836 E.00009
G1 X114.864 Y105.686 E.00026
G1 X114.914 Y105.686 E.00009
G1 X114.914 Y105.536 E.00026
G1 X114.864 Y105.536 E.00009
G1 X114.864 Y105.386 E.00026
G1 X114.914 Y105.386 E.00009
G1 X114.914 Y105.236 E.00026
G1 X114.864 Y105.236 E.00009
G1 X114.864 Y105.086 E.00026
G1 X114.914 Y105.086 E.00009
G1 X114.914 Y104.936 E.00026
G1 X114.796 Y104.936 E.0002
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.914 Y104.936 E-.0134
G1 X114.914 Y105.086 E-.0171
G1 X114.864 Y105.086 E-.0057
G1 X114.864 Y105.236 E-.0171
G1 X114.914 Y105.236 E-.0057
G1 X114.914 Y105.386 E-.0171
G1 X114.864 Y105.386 E-.0057
G1 X114.864 Y105.536 E-.0171
G1 X114.914 Y105.536 E-.0057
G1 X114.914 Y105.686 E-.0171
G1 X114.864 Y105.686 E-.0057
G1 X114.864 Y105.836 E-.0171
G1 X114.914 Y105.836 E-.0057
G1 X114.914 Y105.986 E-.0171
G1 X114.864 Y105.986 E-.0057
G1 X114.864 Y106.136 E-.0171
G1 X114.914 Y106.136 E-.0057
G1 X114.914 Y106.286 E-.0171
G1 X114.864 Y106.286 E-.0057
G1 X114.864 Y106.368 E-.00938
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-1.19 J.257 P1  F28800
G1 X116.775 Y115.234 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X116.143 Y113.754 E.04177
G1 X115.769 Y112.265 E.03986
G3 X115.644 Y111.148 I7.213 J-1.371 E.02919
G1 X115.764 Y111.146 E.00311
G1 X115.888 Y112.251 E.02885
G2 X116.233 Y113.592 I12.685 J-2.548 E.03595
G1 X116.295 Y113.832 E.00642
G1 X116.678 Y114.742 E.02563
G1 X117.019 Y115.356 E.01822
G1 X115.214 Y115.356 E.04685
G1 X115.214 Y115.234 E.00315
G1 X116.715 Y115.234 E.03897
G1 X117.158 Y115.118 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X116.143 Y113.754 E-.18091
G1 X116.042 Y113.354 E-.04709
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.61 J-1.053 P1  F28800
G1 X113.551 Y114.798 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.903 Y114.678 E.01082
G1 X113.903 Y111.171 E.10227
G1 X113.985 Y111.171 E.00239
G1 X113.985 Y115.224 E.11818
G1 X113.78 Y115.287 E.00623
G2 X113.155 Y114.457 I-5.177 J3.249 E.03032
G1 X112.982 Y114.32 E.00644
G1 X113.026 Y114.243 E.0026
G3 X113.516 Y114.749 I-1.662 J2.099 E.02059
G1 X113.714 Y115.131 F28800
G1 X113.987 Y115.136
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X113.758 Y115.136 E.0004
G1 X113.657 Y114.986 E.00031
G1 X113.92 Y114.986 E.00046
G1 X113.92 Y114.836 E.00026
G1 X113.456 Y114.836 E.00081
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.92 Y114.836 E-.08222
G1 X113.92 Y114.986 E-.02659
G1 X113.657 Y114.986 E-.04652
G1 X113.758 Y115.136 E-.032
G1 X113.987 Y115.136 E-.04068
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-1.182 J-.29 P1  F28800
G1 X109.901 Y131.821 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X111.649 Y131.821 E.05097
G1 X111.649 Y131.899 E.00227
G1 X109.819 Y131.899 E.05336
G1 X109.819 Y118.821 E.38135
G1 X111.649 Y118.821 E.05336
G1 X111.649 Y118.899 E.00227
G1 X109.901 Y118.899 E.05097
G1 X109.901 Y131.761 E.37505
G1 X109.883 Y132.221 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.649 Y131.821 E-.19939
G1 X111.649 Y131.899 E-.00889
G1 X111.476 Y131.899 E-.01972
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I1.141 J-.422 P1  F28800
G1 X105.153 Y114.799 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
G1 X105.503 Y114.679 E.01079
G1 X105.503 Y111.171 E.1023
G1 X105.583 Y111.171 E.00233
G1 X105.583 Y115.227 E.11828
G1 X105.38 Y115.289 E.00617
G2 X104.754 Y114.457 I-5.255 J3.308 E.0304
G1 X104.582 Y114.321 E.00638
G1 X104.627 Y114.244 E.00261
G3 X105.117 Y114.751 I-1.775 J2.208 E.02061
G1 X105.321 Y115.129 F28800
G1 X105.585 Y115.136
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X105.356 Y115.136 E.0004
G1 X105.255 Y114.986 E.00031
G1 X105.518 Y114.986 E.00046
G1 X105.518 Y114.836 E.00026
G1 X105.054 Y114.836 E.00081
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X105.518 Y114.836 E-.08223
G1 X105.518 Y114.986 E-.02659
G1 X105.255 Y114.986 E-.04652
G1 X105.356 Y115.136 E-.03203
G1 X105.585 Y115.136 E-.04063
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.781 J.933 P1  F28800
G1 X107.453 Y113.573 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G2 X107.067 Y113.965 I.299 J.68 E.01463
G1 X106.971 Y114.325 E.00967
G1 X106.982 Y114.732 E.01057
G1 X107.087 Y115.048 E.00865
G2 X107.564 Y115.41 I.552 J-.233 E.01626
G2 X107.935 Y115.208 I-.048 J-.529 E.01128
G1 X108.058 Y115.007 E.00613
G1 X108.155 Y114.645 E.00972
G1 X108.141 Y114.24 E.0105
G1 X108.039 Y113.922 E.00868
G2 X107.67 Y113.574 I-.641 J.309 E.01345
G2 X107.512 Y113.564 I-.112 J.523 E.00413
G1 X107.354 Y113.473 F28800
G1 X107.647 Y113.431
G1 F12000
G2 X107.915 Y113.271 I-.118 J-.504 E.00825
G1 X108.078 Y113.026 E.00763
G1 X108.206 Y112.599 E.01158
G1 X108.206 Y112.076 E.01355
G1 X108.089 Y111.67 E.01098
G2 X107.685 Y111.251 I-.749 J.318 E.01546
G2 X107.507 Y111.238 I-.112 J.334 E.00467
G2 X107.103 Y111.548 I.162 J.63 E.01358
G1 X106.959 Y111.894 E.00973
G1 X106.906 Y112.41 E.01347
G1 X106.991 Y112.882 E.01243
G1 X107.139 Y113.176 E.00856
G2 X107.587 Y113.435 I.449 J-.261 E.01405
G1 X107.733 Y113.528 F28800
G1 X107.253 Y113.514
G1 F12000
G1 X106.99 Y113.164 E.01137
G1 X106.836 Y112.771 E.01095
G1 X106.785 Y112.338 E.01132
G1 X106.841 Y111.878 E.01202
G1 X107.006 Y111.483 E.01111
G1 X107.192 Y111.262 E.0075
G3 X107.661 Y111.125 I.392 J.473 E.01302
G3 X108.111 Y111.466 I-.205 J.74 E.01502
G1 X108.268 Y111.812 E.00985
G1 X108.342 Y112.288 E.01251
G1 X108.289 Y112.782 E.01291
G1 X108.123 Y113.189 E.01141
G1 X107.883 Y113.498 E.01016
G1 X108.133 Y113.849 E.01119
G1 X108.253 Y114.194 E.00947
G1 X108.274 Y114.631 E.01136
G1 X108.174 Y115.037 E.01086
G1 X108.011 Y115.301 E.00806
G3 X107.121 Y115.311 I-.449 J-.346 E.02656
G1 X106.982 Y115.105 E.00645
G1 X106.867 Y114.754 E.0096
G1 X106.853 Y114.317 E.01134
G1 X106.96 Y113.916 E.01077
G3 X107.211 Y113.556 I1.224 J.584 E.01143
G1 X107.547 Y113.243 F28800
G1 X107.255 Y113.486
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X107.869 Y113.486 E.00107
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X107.255 Y113.486 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I1.178 J-.306 P1  F28800
G1 X106.455 Y110.406 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X99.852 Y103.791 E.24255
G1 X100.009 Y103.635 E.00574
G1 X100.019 Y103.645 E.00038
G1 X106.613 Y110.249 E.24218
G1 X106.498 Y110.363 E.00422
G1 X106.175 Y110.12 F28800
G1 X106.525 Y110.186
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X106.357 Y110.186 E.00029
G1 X106.207 Y110.036 E.00037
G1 X106.279 Y110.036 E.00013
G1 X106.13 Y109.886 E.00037
G1 X106.058 Y109.886 E.00013
G1 X105.908 Y109.736 E.00037
G1 X105.98 Y109.736 E.00013
G1 X105.83 Y109.586 E.00037
G1 X105.758 Y109.586 E.00013
G1 X105.608 Y109.436 E.00037
G1 X105.68 Y109.436 E.00012
G1 X105.53 Y109.286 E.00037
G1 X105.459 Y109.286 E.00012
G1 X105.309 Y109.136 E.00037
G1 X105.381 Y109.136 E.00012
G1 X105.231 Y108.986 E.00037
G1 X105.159 Y108.986 E.00012
G1 X105.009 Y108.836 E.00037
G1 X105.081 Y108.836 E.00012
G1 X104.931 Y108.686 E.00037
G1 X104.86 Y108.686 E.00012
G1 X104.71 Y108.536 E.00037
G1 X104.781 Y108.536 E.00012
G1 X104.632 Y108.386 E.00037
G1 X104.56 Y108.386 E.00012
G1 X104.41 Y108.236 E.00037
G1 X104.482 Y108.236 E.00012
G1 X104.332 Y108.086 E.00037
G1 X104.261 Y108.086 E.00012
G1 X104.111 Y107.936 E.00037
G1 X104.182 Y107.936 E.00012
G1 X104.033 Y107.786 E.00037
G1 X103.961 Y107.786 E.00012
G1 X103.812 Y107.636 E.00037
G1 X103.883 Y107.636 E.00012
G1 X103.733 Y107.486 E.00037
G1 X103.662 Y107.486 E.00012
G1 X103.512 Y107.336 E.00037
G1 X103.583 Y107.336 E.00012
G1 X103.433 Y107.186 E.00037
G1 X103.362 Y107.186 E.00012
G1 X103.213 Y107.036 E.00037
G1 X103.284 Y107.036 E.00012
G1 X103.134 Y106.886 E.00037
G1 X103.063 Y106.886 E.00012
G1 X102.913 Y106.736 E.00037
G1 X102.984 Y106.736 E.00012
G1 X102.834 Y106.586 E.00037
G1 X102.763 Y106.586 E.00012
G1 X102.614 Y106.436 E.00037
G1 X102.684 Y106.436 E.00012
G1 X102.535 Y106.286 E.00037
G1 X102.464 Y106.286 E.00012
G1 X102.314 Y106.136 E.00037
G1 X102.385 Y106.136 E.00012
G1 X102.235 Y105.986 E.00037
G1 X102.164 Y105.986 E.00012
G1 X102.015 Y105.836 E.00037
G1 X102.085 Y105.836 E.00012
G1 X101.936 Y105.686 E.00037
G1 X101.865 Y105.686 E.00012
G1 X101.715 Y105.536 E.00037
G1 X101.786 Y105.536 E.00012
G1 X101.636 Y105.386 E.00037
G1 X101.565 Y105.386 E.00012
G1 X101.416 Y105.236 E.00037
G1 X101.486 Y105.236 E.00012
G1 X101.336 Y105.086 E.00037
G1 X101.266 Y105.086 E.00012
G1 X101.116 Y104.936 E.00037
G1 X101.187 Y104.936 E.00012
G1 X101.037 Y104.786 E.00037
G1 X100.966 Y104.786 E.00012
G1 X100.817 Y104.636 E.00037
G1 X100.887 Y104.636 E.00012
G1 X100.737 Y104.486 E.00037
G1 X100.667 Y104.486 E.00012
G1 X100.517 Y104.336 E.00037
G1 X100.587 Y104.336 E.00012
G1 X100.438 Y104.186 E.00037
G1 X100.368 Y104.186 E.00012
G1 X100.218 Y104.036 E.00037
G1 X100.288 Y104.036 E.00012
G1 X100.138 Y103.886 E.00037
G1 X99.973 Y103.886 E.00029
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X100.138 Y103.886 E-.01886
G1 X100.288 Y104.036 E-.02417
G1 X100.218 Y104.036 E-.00799
G1 X100.368 Y104.186 E-.02416
G1 X100.438 Y104.186 E-.008
G1 X100.587 Y104.336 E-.02417
G1 X100.517 Y104.336 E-.008
G1 X100.667 Y104.486 E-.02416
G1 X100.737 Y104.486 E-.00801
G1 X100.887 Y104.636 E-.02417
G1 X100.817 Y104.636 E-.00801
G1 X100.966 Y104.786 E-.02416
G1 X101.037 Y104.786 E-.00802
G1 X101.137 Y104.886 E-.01612
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-1.202 J-.189 P1  F28800
G1 X99.46 Y115.567 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G2 X99.753 Y115.41 I-.022 J-.393 E.00892
G1 X99.905 Y115.192 E.00689
G1 X100.037 Y114.842 E.0097
G1 X100.134 Y114.165 E.01776
G1 X100.14 Y113.132 E.0268
G1 X100.034 Y112.241 E.02329
G1 X99.846 Y111.72 E.01438
G2 X99.495 Y111.402 I-.609 J.32 E.01253
G2 X99.073 Y111.562 I-.105 J.361 E.01256
G1 X98.958 Y111.779 E.00637
G1 X98.898 Y112.085 E.00809
G1 X98.767 Y112.074 E.0034
G1 X98.78 Y111.98 E.00246
G1 X98.907 Y111.604 E.0103
G3 X99.251 Y111.288 I.573 J.278 E.01241
G3 X99.414 Y111.272 I.115 J.335 E.00429
G3 X99.822 Y111.484 I-.056 J.607 E.01224
G1 X100.008 Y111.782 E.00912
G1 X100.15 Y112.208 E.01165
G1 X100.267 Y113.8 E.04141
G1 X100.148 Y114.893 E.02855
G1 X100.003 Y115.26 E.01022
G1 X99.829 Y115.503 E.00775
G3 X99.005 Y115.455 I-.394 J-.34 E.02476
G1 X98.839 Y115.17 E.00854
G1 X98.714 Y114.692 E.01284
G1 X98.722 Y113.844 E.022
G1 X98.862 Y113.38 E.01258
G1 X99.037 Y113.113 E.00829
G3 X99.592 Y113.012 I.333 J.255 E.01607
G1 X99.498 Y113.094 E.00326
G2 X99.195 Y113.127 I-.12 J.313 E.00821
G1 X99.079 Y113.246 E.00432
G1 X98.923 Y113.536 E.00854
G1 X98.815 Y114.059 E.01386
G1 X98.836 Y114.715 E.01705
G1 X98.975 Y115.188 E.01279
G1 X99.13 Y115.42 E.00725
G2 X99.4 Y115.566 I.307 J-.247 E.00817
G1 X99.517 Y115.654 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X99.562 Y115.548 E-.01861
G1 X99.753 Y115.41 E-.02688
G1 X99.905 Y115.192 E-.03027
G1 X100.037 Y114.842 E-.0426
G1 X100.134 Y114.165 E-.078
G1 X100.136 Y113.887 E-.03165
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.413 J-1.145 P1  F28800
G1 X97.053 Y114.999 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.403 Y114.879 E.01079
G1 X97.403 Y111.369 E.10235
G1 X97.483 Y111.369 E.00233
G1 X97.483 Y115.427 E.11834
G1 X97.28 Y115.489 E.00616
G2 X96.653 Y114.657 I-5.232 J3.29 E.03042
G1 X96.482 Y114.523 E.00634
G1 X96.527 Y114.446 E.00259
G3 X97.017 Y114.951 I-1.711 J2.153 E.02058
G1 X97.216 Y115.331 F28800
G1 X97.485 Y115.286
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X97.223 Y115.286 E.00046
G2 X97.12 Y115.136 I-.938 J.529 E.00032
G1 X97.418 Y115.136 E.00052
G1 X97.418 Y114.986 E.00026
G1 X97.084 Y114.986 E.00058
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.418 Y114.986 E-.06215
G1 X97.418 Y115.136 E-.02791
G1 X97.12 Y115.136 E-.05531
G1 X97.223 Y115.286 E-.03377
G1 X97.485 Y115.286 E-.04886
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-1.214 J.078 P1  F28800
G1 X98.291 Y127.763 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G2 X98.87 Y127.57 I.161 J-.483 E.017
G1 X99.029 Y127.288 E.0084
G1 X99.15 Y126.753 E.01422
G1 X99.174 Y124.859 E.04918
G1 X99.054 Y124.141 E.01888
G2 X98.732 Y123.651 I-1.113 J.381 E.01538
G2 X98.399 Y123.569 I-.293 J.47 E.00905
G2 X98.022 Y123.816 I.105 J.572 E.01202
G1 X97.884 Y124.07 E.00751
G1 X97.766 Y124.61 E.01432
G1 X97.745 Y126.524 E.04968
G1 X97.899 Y127.331 E.02133
G1 X98.037 Y127.576 E.0073
G2 X98.235 Y127.741 I.414 J-.296 E.00675
G1 X98.316 Y127.905 F28800
G1 X98.257 Y127.871
G1 F12000
G3 X97.944 Y127.646 I.2 J-.608 E.01016
G3 X97.742 Y127.239 I.977 J-.737 E.01186
G1 X97.635 Y126.649 E.01557
G1 X97.596 Y125.5 E.02984
G1 X97.659 Y124.5 E.02599
G1 X97.782 Y124.008 E.01318
G3 X98.156 Y123.528 I.999 J.393 E.01602
G3 X98.505 Y123.449 I.335 J.676 E.00935
G3 X98.97 Y123.72 I-.103 J.712 E.01432
G3 X99.196 Y124.197 I-1.17 J.846 E.01378
G1 X99.292 Y124.833 E.01669
G1 X99.317 Y126.027 E.031
G1 X99.243 Y126.943 E.02383
G1 X99.134 Y127.348 E.01089
G3 X98.761 Y127.826 I-1.035 J-.423 E.01595
G3 X98.315 Y127.887 I-.304 J-.563 E.01193
G1 X98.219 Y127.691 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.092 Y127.791 E-.02771
G1 X97.944 Y127.646 E-.02356
G1 X97.79 Y127.377 E-.03541
G1 X97.742 Y127.239 E-.01658
G1 X97.635 Y126.649 E-.06838
G1 X97.619 Y126.155 E-.05635
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.995 J-.701 P1  F28800
G1 X96.517 Y127.718 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
G2 X96.718 Y127.496 I-.198 J-.381 E.00794
G1 X96.838 Y127.173 E.00893
G1 X96.873 Y126.622 E.01433
G1 X96.751 Y126.078 E.01447
G1 X96.617 Y125.786 E.00833
G2 X95.708 Y124.382 I-45.781 J28.625 E.04342
G3 X95.392 Y123.604 I7.62 J-3.551 E.02179
G1 X97.001 Y123.604 E.04176
G1 X97.001 Y123.726 E.00315
G1 X95.547 Y123.726 E.03774
G2 X96.212 Y124.925 I4.87 J-1.915 E.03568
G3 X96.721 Y125.726 I-6.887 J4.938 E.02465
G1 X96.959 Y126.376 E.01796
G1 X96.992 Y126.926 E.01429
G1 X96.899 Y127.386 E.01219
G1 X96.746 Y127.671 E.00839
G3 X95.832 Y127.594 I-.432 J-.34 E.02817
G3 X95.644 Y126.897 I1.369 J-.742 E.0189
G1 X95.766 Y126.891 E.00317
G1 X95.836 Y127.309 E.01101
G1 X95.95 Y127.557 E.00709
G2 X96.462 Y127.742 I.368 J-.221 E.01528
G1 X96.614 Y127.779 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X96.61 Y127.65 E-.01984
G1 X96.718 Y127.496 E-.02148
G1 X96.838 Y127.173 E-.03924
G1 X96.873 Y126.622 E-.06294
G1 X96.751 Y126.078 E-.06355
G1 X96.674 Y125.911 E-.02097
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.62 J-1.047 P1  F28800
G1 X94.934 Y126.941 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
G1 X90.877 Y130.227 E.1355
G1 X90.737 Y130.055 E.00575
G1 X94.795 Y126.769 E.1355
G1 X94.897 Y126.895 E.00419
G1 X94.62 Y127.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.357 Y128.171 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.772 J-.941 P1  F28800
G1 X91.145 Y129.986 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X90.958 Y129.986 E.00033
G1 X91.144 Y129.836 E.00041
G1 X91.223 Y129.836 E.00014
G1 X91.408 Y129.686 E.00041
G1 X91.329 Y129.686 E.00014
G1 X91.514 Y129.536 E.00041
G1 X91.594 Y129.536 E.00014
G1 X91.779 Y129.386 E.00041
G1 X91.699 Y129.386 E.00014
G1 X91.885 Y129.236 E.00041
G1 X91.964 Y129.236 E.00014
G1 X92.149 Y129.086 E.00041
G1 X92.07 Y129.086 E.00014
G1 X92.255 Y128.936 E.00041
G1 X92.335 Y128.936 E.00014
G1 X92.52 Y128.786 E.00041
G1 X92.44 Y128.786 E.00014
G1 X92.626 Y128.636 E.00041
G1 X92.705 Y128.636 E.00014
G1 X92.89 Y128.486 E.00041
G1 X92.811 Y128.486 E.00014
G1 X92.996 Y128.336 E.00041
G1 X93.076 Y128.336 E.00014
G1 X93.261 Y128.186 E.00041
G1 X93.181 Y128.186 E.00014
G1 X93.367 Y128.036 E.00041
G1 X93.446 Y128.036 E.00014
G1 X93.631 Y127.886 E.00041
G1 X93.552 Y127.886 E.00014
G1 X93.737 Y127.736 E.00041
G1 X93.817 Y127.736 E.00014
G1 X94.002 Y127.586 E.00041
G1 X93.922 Y127.586 E.00014
G1 X94.108 Y127.436 E.00041
G1 X94.187 Y127.436 E.00014
G1 X94.372 Y127.286 E.00041
G1 X94.293 Y127.286 E.00014
G1 X94.478 Y127.136 E.00041
G1 X94.558 Y127.136 E.00014
G1 X94.743 Y126.986 E.00041
G1 X94.556 Y126.986 E.00033
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X94.743 Y126.986 E-.0213
G1 X94.558 Y127.136 E-.02717
G1 X94.478 Y127.136 E-.00907
G1 X94.293 Y127.286 E-.02717
G1 X94.372 Y127.286 E-.00907
G1 X94.187 Y127.436 E-.02717
G1 X94.108 Y127.436 E-.00907
G1 X93.922 Y127.586 E-.02717
G1 X94.002 Y127.586 E-.00907
G1 X93.817 Y127.736 E-.02717
G1 X93.737 Y127.736 E-.00907
G1 X93.563 Y127.877 E-.0255
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-1.194 J.235 P1  F28800
G1 X96.127 Y140.877 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X90.985 Y147.227 E.21205
G1 X90.811 Y147.087 E.00579
G1 X95.954 Y140.737 E.21206
G1 X96.08 Y140.839 E.00419
G1 X95.872 Y141.186 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X94.833 Y142.403 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.926 J-.79 P1  F28800
G1 X90.839 Y147.086 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X90.988 Y147.086 E.00026
G1 X91.11 Y146.936 E.00034
G1 X91.044 Y146.936 E.00012
G1 X91.165 Y146.786 E.00034
G1 X91.231 Y146.786 E.00012
G1 X91.353 Y146.636 E.00034
G1 X91.287 Y146.636 E.00012
G1 X91.408 Y146.486 E.00034
G1 X91.474 Y146.486 E.00012
G1 X91.596 Y146.336 E.00034
G1 X91.53 Y146.336 E.00012
G1 X91.651 Y146.186 E.00034
G1 X91.717 Y146.186 E.00011
G1 X91.839 Y146.036 E.00034
G1 X91.773 Y146.036 E.00011
G1 X91.894 Y145.886 E.00034
G1 X91.96 Y145.886 E.00011
G1 X92.082 Y145.736 E.00034
G1 X92.016 Y145.736 E.00011
G1 X92.137 Y145.586 E.00034
G1 X92.203 Y145.586 E.00011
G1 X92.325 Y145.436 E.00034
G1 X92.259 Y145.436 E.00011
G1 X92.38 Y145.286 E.00034
G1 X92.446 Y145.286 E.00011
G1 X92.568 Y145.136 E.00034
G1 X92.502 Y145.136 E.00011
G1 X92.623 Y144.986 E.00034
G1 X92.689 Y144.986 E.00011
G1 X92.81 Y144.836 E.00034
G1 X92.745 Y144.836 E.00011
G1 X92.866 Y144.686 E.00034
G1 X92.932 Y144.686 E.00011
G1 X93.053 Y144.536 E.00034
G1 X92.988 Y144.536 E.00011
G1 X93.109 Y144.386 E.00034
G1 X93.175 Y144.386 E.00011
G1 X93.296 Y144.236 E.00034
G1 X93.231 Y144.236 E.00011
G1 X93.352 Y144.086 E.00034
G1 X93.418 Y144.086 E.00011
G1 X93.539 Y143.936 E.00034
G1 X93.474 Y143.936 E.00011
G1 X93.595 Y143.786 E.00034
G1 X93.661 Y143.786 E.00011
G1 X93.782 Y143.636 E.00034
G1 X93.717 Y143.636 E.00011
G1 X93.838 Y143.486 E.00034
G1 X93.904 Y143.486 E.00011
G1 X94.025 Y143.336 E.00034
G1 X93.96 Y143.336 E.00011
G1 X94.081 Y143.186 E.00034
G1 X94.147 Y143.186 E.00011
G1 X94.268 Y143.036 E.00034
G1 X94.203 Y143.036 E.00011
G1 X94.324 Y142.886 E.00034
G1 X94.389 Y142.886 E.00011
G1 X94.511 Y142.736 E.00034
G1 X94.446 Y142.736 E.00011
G1 X94.567 Y142.586 E.00034
G1 X94.632 Y142.586 E.00011
G1 X94.754 Y142.436 E.00034
G1 X94.689 Y142.436 E.00011
G1 X94.81 Y142.286 E.00034
G1 X94.875 Y142.286 E.00011
G1 X94.997 Y142.136 E.00034
G1 X94.932 Y142.136 E.00011
G1 X95.053 Y141.986 E.00034
G1 X95.118 Y141.986 E.00011
G1 X95.24 Y141.836 E.00034
G1 X95.175 Y141.836 E.00011
G1 X95.296 Y141.686 E.00034
G1 X95.361 Y141.686 E.00011
G1 X95.483 Y141.536 E.00034
G1 X95.418 Y141.536 E.00011
G1 X95.539 Y141.386 E.00034
G1 X95.604 Y141.386 E.00011
G1 X95.726 Y141.236 E.00034
G1 X95.661 Y141.236 E.00011
G1 X95.782 Y141.086 E.00034
G1 X95.847 Y141.086 E.00011
G1 X95.968 Y140.936 E.00034
G1 X95.817 Y140.936 E.00026
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X95.968 Y140.936 E-.01726
G1 X95.847 Y141.086 E-.022
G1 X95.782 Y141.086 E-.00736
G1 X95.661 Y141.236 E-.02201
G1 X95.726 Y141.236 E-.00736
G1 X95.604 Y141.386 E-.022
G1 X95.539 Y141.386 E-.00737
G1 X95.418 Y141.536 E-.02201
G1 X95.483 Y141.536 E-.00737
G1 X95.361 Y141.686 E-.022
G1 X95.296 Y141.686 E-.00738
G1 X95.175 Y141.836 E-.02201
G1 X95.24 Y141.836 E-.00738
G1 X95.118 Y141.986 E-.022
G1 X95.053 Y141.986 E-.00739
G1 X95.025 Y142.021 E-.0051
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I1.089 J.543 P1  F28800
G1 X96.916 Y138.23 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X97.357 Y138.536 E.01393
G2 X98.641 Y138.33 I.508 J-.933 E.03633
G1 X98.828 Y138.067 E.00837
G1 X98.935 Y137.733 E.0091
G1 X98.947 Y137.253 E.01245
G1 X98.839 Y136.834 E.01125
G2 X98.171 Y136.161 I-1.177 J.502 E.0252
G1 X97.827 Y136.09 E.00911
G1 X97.377 Y136.125 E.01172
G1 X97.082 Y136.245 E.00825
G2 X96.614 Y136.933 I.616 J.922 E.02214
G1 X96.494 Y136.922 E.00314
G1 X96.521 Y136.784 E.00365
G1 X96.673 Y136.473 E.00897
G1 X96.904 Y136.225 E.00881
G1 X97.173 Y136.069 E.00806
G1 X97.582 Y135.975 E.01091
G1 X97.649 Y135.978 E.00173
G1 X97.997 Y135.991 E.00904
G3 X98.758 Y136.466 I-.315 J1.352 E.0237
G1 X98.958 Y136.815 E.01042
G1 X99.067 Y137.249 E.01164
G1 X99.05 Y137.76 E.01324
G1 X98.932 Y138.117 E.00978
G1 X98.721 Y138.419 E.00955
G3 X97.826 Y138.784 I-.893 J-.91 E.02572
G1 X97.506 Y138.728 E.00843
G1 X96.75 Y138.336 E.0221
G1 X96.865 Y138.262 E.00355
G1 X97.237 Y138.469 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.357 Y138.536 E-.06413
G1 X97.651 Y138.644 E-.03575
G1 X97.954 Y138.664 E-.03453
G1 X98.258 Y138.595 E-.03561
G1 X98.505 Y138.453 E-.03246
G1 X98.641 Y138.33 E-.02094
G1 X98.664 Y138.297 E-.00458
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.924 J-.792 P1  F28800
G1 X97.093 Y140.132 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
G1 X98.865 Y140.132 E.04601
G1 X98.865 Y140.254 E.00315
G1 X96.991 Y140.254 E.04864
G1 X96.637 Y138.408 E.04878
G1 X96.746 Y138.339 E.00335
G1 X97.081 Y140.073 E.04586
G1 X97.127 Y140.531 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.865 Y140.132 E-.20352
G1 X98.865 Y140.254 E-.01385
G1 X98.772 Y140.254 E-.01063
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.084 J1.214 P1  F28800
G1 X105.444 Y140.713 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
G1 X105.599 Y140.871 E.00574
G1 X99.473 Y146.907 E.2232
G1 X99.316 Y146.747 E.00581
G1 X105.402 Y140.755 E.22164
G1 X105.502 Y140.927 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X105.599 Y140.871 E-.02612
G1 X104.338 Y142.114 E-.20188
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.827 J-.893 P1  F28800
G1 X99.455 Y146.636 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X99.626 Y146.636 E.0003
G1 X99.778 Y146.486 E.00037
G1 X99.704 Y146.486 E.00013
G1 X99.856 Y146.336 E.00037
G1 X99.93 Y146.336 E.00013
G1 X100.083 Y146.186 E.00037
G1 X100.008 Y146.186 E.00013
G1 X100.161 Y146.036 E.00037
G1 X100.235 Y146.036 E.00013
G1 X100.387 Y145.886 E.00037
G1 X100.313 Y145.886 E.00013
G1 X100.465 Y145.736 E.00037
G1 X100.539 Y145.736 E.00013
G1 X100.692 Y145.586 E.00037
G1 X100.618 Y145.586 E.00013
G1 X100.77 Y145.436 E.00037
G1 X100.844 Y145.436 E.00013
G1 X100.996 Y145.286 E.00037
G1 X100.922 Y145.286 E.00013
G1 X101.075 Y145.136 E.00037
G1 X101.148 Y145.136 E.00013
G1 X101.301 Y144.986 E.00037
G1 X101.227 Y144.986 E.00013
G1 X101.379 Y144.836 E.00037
G1 X101.453 Y144.836 E.00013
G1 X101.605 Y144.686 E.00037
G1 X101.532 Y144.686 E.00013
G1 X101.684 Y144.536 E.00037
G1 X101.757 Y144.536 E.00013
G1 X101.91 Y144.386 E.00037
G1 X101.836 Y144.386 E.00013
G1 X101.989 Y144.236 E.00037
G1 X102.062 Y144.236 E.00013
G1 X102.214 Y144.086 E.00037
G1 X102.141 Y144.086 E.00013
G1 X102.293 Y143.936 E.00037
G1 X102.366 Y143.936 E.00013
G1 X102.519 Y143.786 E.00037
G1 X102.446 Y143.786 E.00013
G1 X102.598 Y143.636 E.00037
G1 X102.671 Y143.636 E.00013
G1 X102.823 Y143.486 E.00037
G1 X102.75 Y143.486 E.00013
G1 X102.903 Y143.336 E.00037
G1 X102.975 Y143.336 E.00013
G1 X103.127 Y143.186 E.00037
G1 X103.055 Y143.186 E.00013
G1 X103.207 Y143.036 E.00037
G1 X103.28 Y143.036 E.00013
G1 X103.432 Y142.886 E.00037
G1 X103.36 Y142.886 E.00013
G1 X103.512 Y142.736 E.00037
G1 X103.584 Y142.736 E.00013
G1 X103.736 Y142.586 E.00037
G1 X103.664 Y142.586 E.00013
G1 X103.817 Y142.436 E.00037
G1 X103.889 Y142.436 E.00013
G1 X104.041 Y142.286 E.00037
G1 X103.969 Y142.286 E.00012
G1 X104.121 Y142.136 E.00037
G1 X104.193 Y142.136 E.00012
G1 X104.345 Y141.986 E.00037
G1 X104.274 Y141.986 E.00012
G1 X104.426 Y141.836 E.00037
G1 X104.498 Y141.836 E.00012
G1 X104.65 Y141.686 E.00037
G1 X104.578 Y141.686 E.00012
G1 X104.731 Y141.536 E.00037
G1 X104.802 Y141.536 E.00012
G1 X104.954 Y141.386 E.00037
G1 X104.883 Y141.386 E.00012
G1 X105.035 Y141.236 E.00037
G1 X105.107 Y141.236 E.00012
G1 X105.259 Y141.086 E.00037
G1 X105.188 Y141.086 E.00012
G1 X105.34 Y140.936 E.00037
G1 X105.507 Y140.936 E.00029
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X105.34 Y140.936 E-.01905
G1 X105.188 Y141.086 E-.02437
G1 X105.259 Y141.086 E-.0081
G1 X105.107 Y141.236 E-.02436
G1 X105.035 Y141.236 E-.00811
G1 X104.883 Y141.386 E-.02437
G1 X104.954 Y141.386 E-.00812
G1 X104.802 Y141.536 E-.02436
G1 X104.731 Y141.536 E-.00813
G1 X104.578 Y141.686 E-.02437
G1 X104.65 Y141.686 E-.00814
G1 X104.498 Y141.836 E-.02436
G1 X104.426 Y141.836 E-.00815
G1 X104.339 Y141.922 E-.01398
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I1.074 J.572 P1  F28800
G1 X106.297 Y138.245 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G3 X106.243 Y138.159 I.814 J-.571 E.00263
G1 X106.354 Y138.122 E.00303
G1 X106.385 Y138.184 E.00178
G2 X107.793 Y138.218 I.717 J-.532 E.0421
G1 X107.951 Y137.964 E.00777
G1 X108.049 Y137.576 E.01038
G1 X108.037 Y137.122 E.01179
G1 X107.906 Y136.701 E.01145
G2 X107.288 Y136.138 I-1.008 J.487 E.02223
G1 X106.957 Y136.088 E.00868
G1 X106.594 Y136.135 E.00948
G1 X106.315 Y136.261 E.00795
G1 X106.047 Y136.505 E.00941
G1 X105.923 Y136.696 E.0059
G1 X105.748 Y137.215 E.01422
G1 X105.677 Y137.96 E.01941
G1 X105.731 Y138.861 E.02343
G1 X105.894 Y139.488 E.01683
G1 X106.096 Y139.849 E.01072
G1 X106.33 Y140.075 E.00844
G1 X106.596 Y140.209 E.00773
G1 X106.973 Y140.27 E.00991
G1 X107.316 Y140.23 E.00898
G2 X107.929 Y139.555 I-.212 J-.808 E.02501
G1 X108.049 Y139.57 E.00314
G1 X107.997 Y139.77 E.00536
G1 X107.833 Y140.037 E.00813
G3 X107.111 Y140.383 I-.831 J-.807 E.02123
G1 X106.715 Y140.361 E.01029
G1 X106.413 Y140.261 E.00824
G1 X106.123 Y140.055 E.00923
G1 X106.009 Y139.928 E.00444
G1 X105.788 Y139.543 E.01151
G1 X105.593 Y138.721 E.02191
G1 X105.633 Y137.193 E.03968
G1 X105.794 Y136.688 E.01375
G1 X105.955 Y136.434 E.00781
G1 X106.256 Y136.159 E.01059
G1 X106.551 Y136.024 E.00841
G1 X106.913 Y135.97 E.00949
G1 X107.241 Y136.012 E.00859
G1 X107.301 Y136.019 E.00156
G1 X107.587 Y136.149 E.00816
G1 X107.697 Y136.232 E.00357
G3 X108.008 Y136.638 I-.894 J1.009 E.01336
G1 X108.154 Y137.102 E.01262
G1 X108.165 Y137.589 E.01263
G1 X108.069 Y137.984 E.01055
G1 X107.89 Y138.291 E.00924
G3 X106.332 Y138.293 I-.779 J-.617 E.04643
G1 X106.334 Y138.151 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X106.243 Y138.159 E-.01835
G1 X106.354 Y138.122 E-.01332
G1 X106.385 Y138.184 E-.00784
G1 X106.564 Y138.37 E-.02948
G1 X106.791 Y138.498 E-.02979
G1 X107.046 Y138.552 E-.02972
G1 X107.304 Y138.531 E-.02942
G1 X107.545 Y138.437 E-.02951
G1 X107.743 Y138.278 E-.02892
G1 X107.793 Y138.218 E-.00892
G1 X107.805 Y138.198 E-.00273
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.273 J1.186 P1  F28800
G1 X116.217 Y140.132 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
G1 X115.574 Y139.282 E.02766
G3 X114.423 Y136.044 I5.959 J-3.943 E.09006
G1 X114.547 Y136.042 E.00323
G1 X114.622 Y136.66 E.01617
G1 X114.733 Y137.126 E.01241
G1 X115.051 Y138.061 E.02564
G1 X115.296 Y138.572 E.01472
G1 X115.831 Y139.436 E.02636
G1 X116.349 Y140.057 E.02099
G1 X116.259 Y140.254 E.00562
G1 X113.756 Y140.254 E.06496
G1 X113.756 Y140.132 E.00315
G1 X116.157 Y140.132 E.06231
G1 X116.577 Y139.959 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X115.574 Y139.282 E-.11753
G1 X115.189 Y138.625 E-.08677
G1 X115.102 Y138.436 E-.0237
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-1.079 J-.563 P1  F28800
G1 X113.59 Y141.331 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
G1 X109.095 Y146.883 E.18539
G1 X108.923 Y146.743 E.00575
G1 X113.417 Y141.191 E.18537
G1 X113.544 Y141.294 E.00423
G1 X113.335 Y141.639 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.298 Y142.858 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.95 J-.761 P1  F28800
G1 X109.271 Y146.636 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X109.12 Y146.636 E.00026
G1 X109.241 Y146.486 E.00034
G1 X109.306 Y146.486 E.00011
G1 X109.427 Y146.336 E.00034
G1 X109.363 Y146.336 E.00011
G1 X109.484 Y146.186 E.00034
G1 X109.549 Y146.186 E.00011
G1 X109.67 Y146.036 E.00034
G1 X109.605 Y146.036 E.00011
G1 X109.727 Y145.886 E.00034
G1 X109.792 Y145.886 E.00011
G1 X109.913 Y145.736 E.00034
G1 X109.848 Y145.736 E.00011
G1 X109.97 Y145.586 E.00034
G1 X110.035 Y145.586 E.00011
G1 X110.156 Y145.436 E.00034
G1 X110.091 Y145.436 E.00011
G1 X110.213 Y145.286 E.00034
G1 X110.278 Y145.286 E.00011
G1 X110.399 Y145.136 E.00034
G1 X110.334 Y145.136 E.00011
G1 X110.455 Y144.986 E.00034
G1 X110.52 Y144.986 E.00011
G1 X110.642 Y144.836 E.00034
G1 X110.577 Y144.836 E.00011
G1 X110.698 Y144.686 E.00034
G1 X110.763 Y144.686 E.00011
G1 X110.885 Y144.536 E.00034
G1 X110.82 Y144.536 E.00011
G1 X110.941 Y144.386 E.00034
G1 X111.006 Y144.386 E.00011
G1 X111.128 Y144.236 E.00034
G1 X111.062 Y144.236 E.00011
G1 X111.184 Y144.086 E.00034
G1 X111.249 Y144.086 E.00011
G1 X111.371 Y143.936 E.00034
G1 X111.305 Y143.936 E.00011
G1 X111.427 Y143.786 E.00034
G1 X111.492 Y143.786 E.00011
G1 X111.614 Y143.636 E.00034
G1 X111.548 Y143.636 E.00011
G1 X111.67 Y143.486 E.00034
G1 X111.735 Y143.486 E.00011
G1 X111.857 Y143.336 E.00034
G1 X111.791 Y143.336 E.00011
G1 X111.912 Y143.186 E.00034
G1 X111.978 Y143.186 E.00011
G1 X112.1 Y143.036 E.00034
G1 X112.034 Y143.036 E.00011
G1 X112.155 Y142.886 E.00034
G1 X112.221 Y142.886 E.00011
G1 X112.342 Y142.736 E.00034
G1 X112.277 Y142.736 E.00011
G1 X112.398 Y142.586 E.00034
G1 X112.464 Y142.586 E.00011
G1 X112.585 Y142.436 E.00034
G1 X112.519 Y142.436 E.00011
G1 X112.641 Y142.286 E.00034
G1 X112.707 Y142.286 E.00011
G1 X112.828 Y142.136 E.00034
G1 X112.762 Y142.136 E.00011
G1 X112.884 Y141.986 E.00034
G1 X112.95 Y141.986 E.00012
G1 X113.071 Y141.836 E.00034
G1 X113.005 Y141.836 E.00012
G1 X113.127 Y141.686 E.00034
G1 X113.193 Y141.686 E.00012
G1 X113.314 Y141.536 E.00034
G1 X113.248 Y141.536 E.00012
G1 X113.369 Y141.386 E.00034
G1 X113.523 Y141.386 E.00027
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.369 Y141.386 E-.01746
G1 X113.248 Y141.536 E-.022
G1 X113.314 Y141.536 E-.00755
G1 X113.193 Y141.686 E-.022
G1 X113.127 Y141.686 E-.00755
G1 X113.005 Y141.836 E-.022
G1 X113.071 Y141.836 E-.00754
G1 X112.95 Y141.986 E-.022
G1 X112.884 Y141.986 E-.00754
G1 X112.762 Y142.136 E-.022
G1 X112.828 Y142.136 E-.00753
G1 X112.707 Y142.286 E-.022
G1 X112.641 Y142.286 E-.00752
G1 X112.519 Y142.436 E-.022
G1 X112.585 Y142.436 E-.00752
G1 X112.565 Y142.462 E-.00377
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I1.147 J.406 P1  F28800
G1 X117.875 Y127.435 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X117.245 Y128.217 E.0293
G1 X116.636 Y128.635 E.02152
G1 X115.937 Y128.868 E.02148
G1 X115.2 Y128.892 E.02151
G1 X114.488 Y128.707 E.02145
G1 X113.854 Y128.332 E.0215
G1 X112.967 Y127.379 E.03795
G1 X112.967 Y128.817 E.04192
G1 X112.887 Y128.817 E.00233
G1 X112.887 Y121.471 E.21421
G1 X112.967 Y121.471 E.00233
G1 X112.967 Y126.331 E.14172
G1 X113.082 Y127.073 E.0219
G1 X113.423 Y127.761 E.02239
G1 X113.956 Y128.316 E.02243
G1 X114.631 Y128.683 E.02241
G1 X115.384 Y128.829 E.02238
G1 X116.149 Y128.742 E.02243
G1 X116.848 Y128.43 E.02233
G1 X117.422 Y127.919 E.02241
G1 X117.831 Y127.237 E.02317
G1 X117.831 Y121.471 E.16814
G1 X117.909 Y121.471 E.00227
G1 X117.909 Y127.235 E.16809
G1 X118.339 Y127.848 E.02182
G1 X118.903 Y128.284 E.02079
G1 X119.567 Y128.536 E.02072
G1 X120.28 Y128.585 E.02083
G1 X120.974 Y128.42 E.02078
G1 X121.588 Y128.06 E.02076
G1 X122.071 Y127.536 E.02078
G1 X122.378 Y126.894 E.02077
G1 X122.483 Y126.205 E.02031
G1 X122.483 Y121.471 E.13804
G1 X122.563 Y121.471 E.00233
G1 X122.563 Y126.174 E.13714
G1 X122.463 Y126.872 E.02057
G1 X122.181 Y127.506 E.02023
G1 X121.735 Y128.035 E.02016
G1 X121.16 Y128.42 E.02017
G1 X120.499 Y128.632 E.02026
G1 X119.808 Y128.652 E.02015
G1 X119.137 Y128.481 E.02019
G3 X118.54 Y128.131 I64.093 J-109.962 E.02018
G1 X117.917 Y127.479 E.02631
G1 X117.565 Y127.183 F28800
G1 X117.709 Y127.436
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X118.053 Y127.436 E.0006
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X117.709 Y127.436 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.042 J-1.216 P1  F28800
G1 X113.339 Y127.586 Z2.4
G1 Z2
G1 E.8 F1800
G1 F3600
G1 X113.248 Y127.586 E.00016
G1 X113.108 Y127.436 E.00036
G1 X113.189 Y127.436 E.00014
G1 X113.115 Y127.286 E.00029
G1 X112.968 Y127.286 E.00025
G1 X112.952 Y127.268 E.00004
G1 X112.952 Y127.136 E.00023
G1 X113.041 Y127.136 E.00015
G3 X113.003 Y126.986 I.219 J-.135 E.00027
G1 X112.952 Y126.986 E.00009
G1 X112.952 Y126.836 E.00026
G1 X112.979 Y126.836 E.00005
G1 X112.956 Y126.686 E.00026
G1 X112.884 Y126.686 E.00013
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.956 Y126.686 E-.01062
G1 X112.979 Y126.836 E-.02242
G1 X112.952 Y126.836 E-.0041
G1 X112.952 Y126.986 E-.02215
G1 X113.003 Y126.986 E-.00755
G1 X113.041 Y127.136 E-.02285
G1 X112.952 Y127.136 E-.01314
G1 X112.952 Y127.268 E-.01949
G1 X112.968 Y127.286 E-.00363
G1 X113.115 Y127.286 E-.02164
G1 X113.189 Y127.436 E-.02472
G1 X113.108 Y127.436 E-.01198
G1 X113.248 Y127.586 E-.03027
G1 X113.339 Y127.586 E-.01344
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.021 J1.217 P1  F28800
G1 X125.467 Y127.38 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X125.467 Y128.817 E.04192
G1 X125.387 Y128.817 E.00233
G1 X125.387 Y121.471 E.21421
G1 X125.467 Y121.471 E.00233
G1 X125.467 Y126.331 E.14172
G1 X125.582 Y127.073 E.0219
G1 X125.923 Y127.761 E.02239
G1 X126.456 Y128.316 E.02243
G1 X127.131 Y128.683 E.02241
G1 X127.884 Y128.829 E.02238
G1 X128.647 Y128.742 E.02237
G1 X129.35 Y128.43 E.02244
G1 X129.925 Y127.918 E.02244
G1 X130.329 Y127.237 E.0231
G1 X130.329 Y121.471 E.16812
G1 X130.409 Y121.471 E.00233
G1 X130.409 Y127.235 E.16809
G1 X130.839 Y127.848 E.02182
G1 X131.403 Y128.284 E.0208
G1 X132.069 Y128.536 E.02078
G1 X132.778 Y128.585 E.02071
G1 X133.474 Y128.42 E.02084
G1 X134.088 Y128.06 E.02076
G1 X134.571 Y127.536 E.02078
G1 X134.878 Y126.894 E.02077
G1 X134.983 Y126.205 E.02031
G1 X134.983 Y121.471 E.13804
G1 X135.061 Y121.471 E.00227
G1 X135.061 Y126.174 E.13715
G1 X134.963 Y126.873 E.02056
G1 X134.681 Y127.506 E.02023
G1 X134.235 Y128.035 E.02016
G1 X133.658 Y128.42 E.02023
G1 X133.001 Y128.632 E.02015
G1 X132.308 Y128.652 E.02021
G1 X131.637 Y128.481 E.02019
G3 X131.04 Y128.131 I64.178 J-110.106 E.02017
G1 X130.378 Y127.435 E.02801
G1 X129.745 Y128.217 E.02935
G1 X129.138 Y128.635 E.02148
G1 X128.437 Y128.868 E.02153
G1 X127.702 Y128.892 E.02145
G1 X126.986 Y128.707 E.02156
G1 X126.354 Y128.332 E.02144
G1 X125.508 Y127.423 E.0362
G1 X125.078 Y127.285 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X125.467 Y128.817 E-.15894
G1 X125.387 Y128.817 E-.00912
G1 X125.387 Y128.291 E-.05994
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.213 J1.198 P1  F28800
G1 X130.208 Y127.436 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X130.553 Y127.436 E.0006
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X130.208 Y127.436 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.042 J-1.216 P1  F28800
G1 X125.839 Y127.586 Z2.4
G1 Z2
G1 E.8 F1800
G1 F3600
G1 X125.748 Y127.586 E.00016
G1 X125.608 Y127.436 E.00036
G1 X125.689 Y127.436 E.00014
G1 X125.615 Y127.286 E.00029
G1 X125.468 Y127.286 E.00026
G1 X125.452 Y127.268 E.00004
G1 X125.452 Y127.136 E.00023
G1 X125.541 Y127.136 E.00015
G3 X125.503 Y126.986 I.219 J-.135 E.00027
G1 X125.452 Y126.986 E.00009
G1 X125.452 Y126.836 E.00026
G1 X125.479 Y126.836 E.00005
G1 X125.456 Y126.686 E.00026
G1 X125.384 Y126.686 E.00013
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X125.456 Y126.686 E-.01062
G1 X125.479 Y126.836 E-.02241
G1 X125.452 Y126.836 E-.0041
G1 X125.452 Y126.986 E-.02215
G1 X125.503 Y126.986 E-.00755
G1 X125.541 Y127.136 E-.02284
G1 X125.452 Y127.136 E-.01314
G1 X125.452 Y127.268 E-.0195
G1 X125.468 Y127.286 E-.00362
G1 X125.615 Y127.286 E-.02165
G1 X125.689 Y127.436 E-.02472
G1 X125.608 Y127.436 E-.01198
G1 X125.748 Y127.586 E-.03027
G1 X125.839 Y127.586 E-.01344
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-1.191 J-.249 P1  F28800
G1 X123.616 Y138.204 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X123.924 Y138.055 E.00888
G1 X124.164 Y137.835 E.00845
M73 P98 R0
G2 X123.815 Y136.212 I-.846 J-.668 E.04919
G1 X123.485 Y136.095 E.0091
G1 X123.141 Y136.081 E.00894
G1 X123.058 Y136.102 E.00223
G1 X122.805 Y136.166 E.00676
G1 X122.52 Y136.337 E.00862
G1 X122.3 Y136.576 E.00845
G2 X122.37 Y137.848 I.892 J.589 E.03543
G1 X122.625 Y138.071 E.00877
G1 X122.927 Y138.211 E.00864
G1 X123.273 Y138.258 E.00906
G1 X123.557 Y138.213 E.00746
G1 X123.867 Y138.436 F28800
G1 X123.81 Y138.544
G1 F12000
G2 X123.231 Y138.379 I-.548 J.821 E.01586
G2 X124.027 Y138.742 I.028 J.991 E.13819
G2 X123.858 Y138.579 I-.765 J.624 E.0061
G1 X123.83 Y138.253 F28800
G1 X123.768 Y138.313
G1 F12000
G1 X124.162 Y138.725 E.0148
G1 X124.311 Y139.021 E.00859
G1 X124.368 Y139.348 E.00861
G1 X124.328 Y139.676 E.00856
G1 X124.192 Y139.978 E.0086
G1 X123.975 Y140.225 E.00855
G1 X123.695 Y140.399 E.00856
G1 X123.378 Y140.483 E.00852
G1 X123.049 Y140.471 E.00854
G1 X122.742 Y140.362 E.00845
G1 X122.473 Y140.167 E.00862
G1 X122.277 Y139.905 E.00849
G1 X122.166 Y139.592 E.00862
G1 X122.149 Y139.263 E.00854
G1 X122.227 Y138.947 E.00846
G1 X122.402 Y138.66 E.00872
G1 X122.742 Y138.326 E.01236
G1 X122.288 Y137.934 E.01556
G1 X122.099 Y137.631 E.00928
G1 X122.011 Y137.296 E.00899
G1 X122.023 Y136.954 E.00888
G1 X122.137 Y136.625 E.00903
G1 X122.342 Y136.341 E.0091
G1 X122.635 Y136.119 E.00955
G1 X122.986 Y135.986 E.00974
G1 X123.377 Y135.965 E.01015
G1 X123.742 Y136.049 E.00973
G1 X124.073 Y136.242 E.00995
G1 X124.307 Y136.494 E.00892
G1 X124.466 Y136.815 E.0093
G1 X124.519 Y137.155 E.00893
G1 X124.473 Y137.494 E.00887
G1 X124.327 Y137.812 E.0091
G3 X123.82 Y138.283 I-1.45 J-1.053 E.01807
G1 X123.476 Y138.587 F28800
G1 X123.454 Y138.386
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X123.813 Y138.386 E.00062
G1 X123.062 Y138.386 F28800
G1 F3600
G1 X122.803 Y138.386 E.00045
G1 X122.869 Y138.322 E.00016
G1 X122.769 Y138.236 E.00023
G1 X122.977 Y138.236 E.00036
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.769 Y138.236 E-.06884
G1 X122.869 Y138.322 E-.04357
G1 X122.803 Y138.386 E-.03021
G1 X123.062 Y138.386 E-.08539
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-1.193 J-.24 P1  F28800
G1 X122.497 Y141.191 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X122.67 Y141.331 E.00579
G1 X119.065 Y145.783 E.14867
G1 X118.893 Y145.643 E.00575
G1 X122.459 Y141.238 E.1471
G1 X122.58 Y141.398 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.67 Y141.331 E-.02634
G1 X121.557 Y142.706 E-.20166
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.904 J-.815 P1  F28800
G1 X118.963 Y145.586 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X119.114 Y145.586 E.00026
G1 X119.235 Y145.436 E.00034
G1 X119.171 Y145.436 E.00011
G1 X119.292 Y145.286 E.00034
G1 X119.357 Y145.286 E.00011
G1 X119.478 Y145.136 E.00034
G1 X119.414 Y145.136 E.00011
G1 X119.535 Y144.986 E.00034
G1 X119.6 Y144.986 E.00011
G1 X119.721 Y144.836 E.00034
G1 X119.657 Y144.836 E.00011
G1 X119.778 Y144.686 E.00034
G1 X119.843 Y144.686 E.00011
G1 X119.964 Y144.536 E.00034
G1 X119.899 Y144.536 E.00011
G1 X120.021 Y144.386 E.00034
G1 X120.086 Y144.386 E.00011
G1 X120.207 Y144.236 E.00034
G1 X120.142 Y144.236 E.00011
G1 X120.264 Y144.086 E.00034
G1 X120.329 Y144.086 E.00011
G1 X120.45 Y143.936 E.00034
G1 X120.385 Y143.936 E.00011
G1 X120.507 Y143.786 E.00034
G1 X120.572 Y143.786 E.00011
G1 X120.693 Y143.636 E.00034
G1 X120.628 Y143.636 E.00011
G1 X120.749 Y143.486 E.00034
G1 X120.815 Y143.486 E.00011
G1 X120.936 Y143.336 E.00034
G1 X120.871 Y143.336 E.00011
G1 X120.992 Y143.186 E.00034
G1 X121.058 Y143.186 E.00011
G1 X121.179 Y143.036 E.00034
G1 X121.114 Y143.036 E.00011
G1 X121.235 Y142.886 E.00034
G1 X121.301 Y142.886 E.00011
G1 X121.422 Y142.736 E.00034
G1 X121.357 Y142.736 E.00011
G1 X121.478 Y142.586 E.00034
G1 X121.544 Y142.586 E.00011
G1 X121.665 Y142.436 E.00034
G1 X121.599 Y142.436 E.00011
G1 X121.721 Y142.286 E.00034
G1 X121.787 Y142.286 E.00011
G1 X121.908 Y142.136 E.00034
G1 X121.842 Y142.136 E.00011
G1 X121.964 Y141.986 E.00034
G1 X122.03 Y141.986 E.00011
G1 X122.151 Y141.836 E.00034
G1 X122.085 Y141.836 E.00012
G1 X122.207 Y141.686 E.00034
G1 X122.273 Y141.686 E.00012
G1 X122.394 Y141.536 E.00034
G1 X122.328 Y141.536 E.00012
G1 X122.449 Y141.386 E.00034
G1 X122.603 Y141.386 E.00027
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.449 Y141.386 E-.01746
G1 X122.328 Y141.536 E-.022
G1 X122.394 Y141.536 E-.00755
G1 X122.273 Y141.686 E-.02201
G1 X122.207 Y141.686 E-.00754
G1 X122.085 Y141.836 E-.022
G1 X122.151 Y141.836 E-.00754
G1 X122.03 Y141.986 E-.02201
G1 X121.964 Y141.986 E-.00753
G1 X121.842 Y142.136 E-.022
G1 X121.908 Y142.136 E-.00752
G1 X121.787 Y142.286 E-.02201
G1 X121.721 Y142.286 E-.00751
G1 X121.599 Y142.436 E-.022
G1 X121.665 Y142.436 E-.00751
G1 X121.644 Y142.462 E-.00382
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.162 J1.206 P1  F28800
G1 X130.946 Y141.21 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X131.13 Y141.333 E.00574
G1 X128.757 Y144.865 E.11042
G1 X128.573 Y144.741 E.00574
G1 X130.913 Y141.259 E.10887
G1 X131.047 Y141.406 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X131.13 Y141.333 E-.02612
G1 X130.142 Y142.803 E-.20188
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-1.005 J-.687 P1  F28800
G1 X128.855 Y144.686 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X128.714 Y144.686 E.00025
G1 X128.815 Y144.536 E.00031
G1 X128.875 Y144.536 E.0001
G1 X128.975 Y144.386 E.00031
G1 X128.915 Y144.386 E.0001
G1 X129.016 Y144.236 E.00031
G1 X129.076 Y144.236 E.0001
G1 X129.177 Y144.086 E.00031
G1 X129.117 Y144.086 E.0001
G1 X129.218 Y143.936 E.00031
G1 X129.278 Y143.936 E.0001
G1 X129.378 Y143.786 E.00031
G1 X129.319 Y143.786 E.0001
G1 X129.419 Y143.636 E.00031
G1 X129.479 Y143.636 E.0001
G1 X129.58 Y143.486 E.00031
G1 X129.52 Y143.486 E.0001
G1 X129.621 Y143.336 E.00031
G1 X129.681 Y143.336 E.0001
G1 X129.782 Y143.186 E.00031
G1 X129.722 Y143.186 E.0001
G1 X129.823 Y143.036 E.00031
G1 X129.882 Y143.036 E.0001
G1 X129.983 Y142.886 E.00031
G1 X129.923 Y142.886 E.0001
G1 X130.024 Y142.736 E.00031
G1 X130.084 Y142.736 E.0001
G1 X130.185 Y142.586 E.00031
G1 X130.125 Y142.586 E.0001
G1 X130.226 Y142.436 E.00031
G1 X130.285 Y142.436 E.0001
G1 X130.386 Y142.286 E.00031
G1 X130.326 Y142.286 E.0001
G1 X130.427 Y142.136 E.00031
G1 X130.487 Y142.136 E.0001
G1 X130.588 Y141.986 E.00031
G1 X130.528 Y141.986 E.0001
G1 X130.629 Y141.836 E.00031
G1 X130.689 Y141.836 E.0001
G1 X130.789 Y141.686 E.00031
G1 X130.73 Y141.686 E.0001
G1 X130.83 Y141.536 E.00031
G1 X130.89 Y141.536 E.0001
G1 X130.991 Y141.386 E.00031
G1 X130.85 Y141.386 E.00025
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X130.991 Y141.386 E-.01609
G1 X130.89 Y141.536 E-.0206
G1 X130.83 Y141.536 E-.00682
G1 X130.73 Y141.686 E-.0206
G1 X130.789 Y141.686 E-.00682
G1 X130.689 Y141.836 E-.0206
G1 X130.629 Y141.836 E-.00682
G1 X130.528 Y141.986 E-.0206
G1 X130.588 Y141.986 E-.00682
G1 X130.487 Y142.136 E-.0206
G1 X130.427 Y142.136 E-.00682
G1 X130.326 Y142.286 E-.0206
G1 X130.386 Y142.286 E-.00682
G1 X130.285 Y142.436 E-.0206
G1 X130.226 Y142.436 E-.00682
G1 X130.128 Y142.581 E-.01997
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I1.135 J.44 P1  F28800
G1 X131.931 Y137.926 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X132.014 Y138.025 E.00336
G1 X131.914 Y138.086 E.00303
G1 X131.854 Y138.014 E.00243
G1 X131.592 Y137.843 E.00812
G1 X131.335 Y137.769 E.00695
G1 X131.257 Y137.771 E.00203
G2 X130.571 Y137.995 I-.053 J.999 E.01915
G1 X130.352 Y138.253 E.00878
G1 X130.222 Y138.561 E.00868
G1 X130.17 Y139.018 E.01195
G1 X130.222 Y139.439 E.01101
G1 X130.36 Y139.759 E.00903
G1 X130.581 Y140.016 E.00879
G1 X130.846 Y140.184 E.00814
G1 X131.141 Y140.263 E.00793
G1 X131.516 Y140.251 E.00974
G1 X131.825 Y140.143 E.00851
G2 X132.19 Y139.841 I-.622 J-1.123 E.01236
G1 X132.384 Y139.507 E.01
G1 X132.505 Y139.034 E.01267
G1 X132.548 Y138.29 E.01935
G1 X132.488 Y137.422 E.02259
G1 X132.377 Y136.973 E.01199
G1 X132.171 Y136.562 E.01195
G1 X131.921 Y136.308 E.00923
G1 X131.634 Y136.154 E.00845
G1 X131.294 Y136.09 E.00899
G1 X130.911 Y136.125 E.00997
G2 X130.297 Y136.8 I.21 J.808 E.02506
G1 X130.168 Y136.784 E.00337
G3 X130.908 Y136.005 I.979 J.19 E.02945
G1 X131.306 Y135.972 E.01036
G1 X131.619 Y136.033 E.00825
G1 X131.675 Y136.043 E.00148
G1 X132.024 Y136.235 E.01033
G1 X132.278 Y136.51 E.00972
G1 X132.492 Y136.937 E.0124
G1 X132.61 Y137.423 E.01299
G1 X132.635 Y138.952 E.03969
G1 X132.491 Y139.555 E.01609
G1 X132.27 Y139.93 E.01129
G1 X131.995 Y140.179 E.00962
G1 X131.83 Y140.272 E.00493
G1 X131.495 Y140.374 E.00909
G1 X131.087 Y140.374 E.01057
G1 X130.759 Y140.273 E.00891
G1 X130.477 Y140.081 E.00886
G1 X130.234 Y139.775 E.01014
G1 X130.09 Y139.385 E.0108
G1 X130.053 Y138.876 E.01323
G1 X130.139 Y138.425 E.01191
G1 X130.318 Y138.096 E.00971
G1 X130.578 Y137.841 E.00948
G1 X130.865 Y137.696 E.00834
G1 X131.2 Y137.644 E.0088
G1 X131.509 Y137.686 E.00809
G1 X131.646 Y137.738 E.00379
G1 X131.881 Y137.893 E.0073
G1 X131.901 Y138.052 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X132.014 Y138.025 E-.02139
G1 X131.914 Y138.086 E-.01332
G1 X131.854 Y138.014 E-.01066
G1 X131.592 Y137.843 E-.03566
G1 X131.335 Y137.769 E-.03052
G1 X131.257 Y137.771 E-.00894
G1 X131.032 Y137.776 E-.02558
G1 X130.805 Y137.846 E-.02711
G1 X130.571 Y137.995 E-.03163
G1 X130.439 Y138.15 E-.0232
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.792 J.924 P1  F28800
G1 X137.821 Y131.821 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X137.821 Y118.899 E.3768
G1 X136.069 Y118.899 E.05109
G1 X136.069 Y118.821 E.00227
G1 X137.901 Y118.821 E.05342
G1 X137.901 Y131.899 E.38135
G1 X136.069 Y131.899 E.05342
G1 X136.069 Y131.821 E.00227
G1 X137.761 Y131.821 E.04934
G1 X138.221 Y131.815 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X137.77 Y129.821 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-1.166 J.35 P1  F28800
G1 X140.906 Y140.259 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.37852
G1 F12000
G2 X141.23 Y140.171 I.077 J-.356 E.00905
G1 X141.356 Y140.003 E.00547
G1 X141.521 Y139.561 E.01225
G1 X141.63 Y138.838 E.01896
G1 X141.64 Y137.756 E.02809
G1 X141.549 Y136.91 E.02207
G2 X141.234 Y136.194 I-1.662 J.304 E.02048
G2 X140.875 Y136.101 I-.266 J.287 E.01003
G2 X140.577 Y136.407 I.243 J.536 E.01135
G1 X140.463 Y136.72 E.00863
G1 X140.34 Y137.513 E.02084
G1 X140.325 Y138.614 E.02857
G1 X140.416 Y139.452 E.02189
G2 X140.733 Y140.168 I1.686 J-.318 E.02048
G2 X140.848 Y140.242 I.25 J-.264 E.00358
G1 X140.943 Y140.376 F28800
G1 X140.879 Y140.376
G1 F12000
G3 X140.594 Y140.192 I.105 J-.477 E.009
G1 X140.426 Y139.894 E.00888
G1 X140.302 Y139.487 E.01104
G1 X140.201 Y137.841 E.04281
G1 X140.338 Y136.719 E.02932
G1 X140.471 Y136.353 E.0101
G1 X140.618 Y136.133 E.00687
G3 X141.009 Y135.972 I.358 J.314 E.01136
G3 X141.369 Y136.162 I-.017 J.469 E.01092
G1 X141.54 Y136.466 E.00903
G1 X141.663 Y136.875 E.01109
G1 X141.765 Y138.527 E.04295
G1 X141.62 Y139.651 E.02941
G1 X141.474 Y140.036 E.01068
G3 X141.038 Y140.385 I-.576 J-.273 E.01501
G3 X140.939 Y140.385 I-.053 J-.486 E.00258
G1 X140.84 Y140.262 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.765 Y140.337 E-.02058
G1 X140.594 Y140.192 E-.02555
G1 X140.426 Y139.894 E-.039
G1 X140.302 Y139.487 E-.04848
G1 X140.251 Y138.661 E-.09437
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.636 J-1.038 P1  F28800
G1 X138.557 Y139.699 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X138.907 Y139.579 E.01079
G1 X138.907 Y136.069 E.10235
G1 X138.985 Y136.069 E.00227
G1 X138.985 Y140.121 E.11816
G1 X138.782 Y140.183 E.00618
G2 X138.157 Y139.358 I-5.291 J3.36 E.0302
G1 X137.982 Y139.222 E.00647
G1 X138.027 Y139.144 E.00261
G3 X138.521 Y139.651 I-1.761 J2.212 E.02069
G1 X138.726 Y140.028 F28800
G1 X138.987 Y140.036
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X138.761 Y140.036 E.00039
G1 X138.659 Y139.886 E.00032
G1 X138.92 Y139.886 E.00045
G1 X138.92 Y139.736 E.00026
G1 X138.457 Y139.736 E.0008
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X138.92 Y139.736 E-.08235
G1 X138.92 Y139.886 E-.02672
G1 X138.659 Y139.886 E-.04636
G1 X138.761 Y140.036 E-.03225
G1 X138.987 Y140.036 E-.04032
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.836 J.885 P1  F28800
G1 X140.335 Y141.309 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X140.146 Y144.643 E.08667
G1 X139.926 Y144.631 E.00572
G1 X140.113 Y141.297 E.08667
G1 X140.275 Y141.306 E.00421
G1 X140.304 Y141.708 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.198 Y143.304 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-1.215 J-.063 P1  F28800
G1 X140.134 Y144.536 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X140.017 Y144.536 E.0002
G1 X140.026 Y144.386 E.00026
G1 X140.075 Y144.386 E.00009
G1 X140.084 Y144.236 E.00026
G1 X140.034 Y144.236 E.00009
G1 X140.043 Y144.086 E.00026
G1 X140.092 Y144.086 E.00009
G1 X140.101 Y143.936 E.00026
G1 X140.051 Y143.936 E.00009
G1 X140.059 Y143.786 E.00026
G1 X140.109 Y143.786 E.00009
G1 X140.118 Y143.636 E.00026
G1 X140.068 Y143.636 E.00009
G1 X140.076 Y143.486 E.00026
G1 X140.126 Y143.486 E.00009
G1 X140.135 Y143.336 E.00026
G1 X140.085 Y143.336 E.00009
G1 X140.093 Y143.186 E.00026
G1 X140.143 Y143.186 E.00009
G1 X140.152 Y143.036 E.00026
G1 X140.101 Y143.036 E.00009
G1 X140.11 Y142.886 E.00026
G1 X140.16 Y142.886 E.00009
G1 X140.168 Y142.736 E.00026
G1 X140.118 Y142.736 E.00009
G1 X140.127 Y142.586 E.00026
G1 X140.177 Y142.586 E.00009
G1 X140.185 Y142.436 E.00026
G1 X140.135 Y142.436 E.00009
G1 X140.144 Y142.286 E.00026
G1 X140.194 Y142.286 E.00009
G1 X140.202 Y142.136 E.00026
G1 X140.152 Y142.136 E.00009
G1 X140.16 Y141.986 E.00026
G1 X140.211 Y141.986 E.00009
G1 X140.219 Y141.836 E.00026
G1 X140.169 Y141.836 E.00009
G1 X140.177 Y141.686 E.00026
G1 X140.228 Y141.686 E.00009
G1 X140.236 Y141.536 E.00026
G1 X140.118 Y141.536 E.00021
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X140.236 Y141.536 E-.0135
G1 X140.228 Y141.686 E-.01713
G1 X140.177 Y141.686 E-.00579
G1 X140.169 Y141.836 E-.01713
G1 X140.219 Y141.836 E-.00578
G1 X140.211 Y141.986 E-.01713
G1 X140.16 Y141.986 E-.00577
G1 X140.152 Y142.136 E-.01713
G1 X140.202 Y142.136 E-.00576
G1 X140.194 Y142.286 E-.01713
G1 X140.144 Y142.286 E-.00575
G1 X140.135 Y142.436 E-.01713
G1 X140.185 Y142.436 E-.00574
G1 X140.177 Y142.586 E-.01713
G1 X140.127 Y142.586 E-.00573
G1 X140.118 Y142.736 E-.01713
G1 X140.168 Y142.736 E-.00572
G1 X140.16 Y142.886 E-.01713
G1 X140.11 Y142.886 E-.00571
G1 X140.106 Y142.961 E-.00861
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.427 J1.14 P1  F28800
G1 X148.219 Y139.924 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X148.069 Y139.98 E.00416
G2 X147.483 Y139.397 I-9.741 J9.223 E.02145
G1 X147.196 Y139.222 E.00872
G1 X147.249 Y139.105 E.00334
G1 X147.296 Y139.13 E.0014
G3 X148.18 Y139.878 I-2.072 J3.343 E.03017
G1 X148.059 Y139.922 F28800
G1 X148.413 Y139.852
G1 F12000
G1 X148.292 Y139.897 E.00336
G1 X148.292 Y136.048 E.09987
G1 X148.413 Y136.048 E.00315
G1 X148.413 Y139.792 E.09714
G1 X148.289 Y139.816 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X148.292 Y139.897 E-.01832
G1 X148.292 Y138.057 E-.20968
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-1.05 J.615 P1  F28800
G1 X151.861 Y144.155 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
G1 X150.275 Y141.333 E.08401
G1 X150.468 Y141.225 E.00577
G1 X150.489 Y141.261 E.00107
G1 X152.053 Y144.047 E.08293
G1 X151.913 Y144.126 E.00417
G1 X151.673 Y143.802 F28800
G1 X151.759 Y143.936
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X151.893 Y143.936 E.00023
G1 X151.808 Y143.786 E.0003
G1 X151.752 Y143.786 E.0001
G1 X151.667 Y143.636 E.0003
G1 X151.724 Y143.636 E.0001
G1 X151.64 Y143.486 E.0003
G1 X151.583 Y143.486 E.0001
G1 X151.499 Y143.336 E.0003
G1 X151.556 Y143.336 E.0001
G1 X151.471 Y143.186 E.0003
G1 X151.414 Y143.186 E.0001
G1 X151.33 Y143.036 E.0003
G1 X151.387 Y143.036 E.0001
G1 X151.303 Y142.886 E.0003
G1 X151.246 Y142.886 E.0001
G1 X151.161 Y142.736 E.0003
G1 X151.219 Y142.736 E.0001
G1 X151.134 Y142.586 E.0003
G1 X151.077 Y142.586 E.0001
G1 X150.993 Y142.436 E.0003
G1 X151.05 Y142.436 E.0001
G1 X150.966 Y142.286 E.0003
G1 X150.908 Y142.286 E.0001
G1 X150.824 Y142.136 E.0003
G1 X150.882 Y142.136 E.0001
G1 X150.798 Y141.986 E.0003
G1 X150.74 Y141.986 E.0001
G1 X150.655 Y141.836 E.0003
G1 X150.713 Y141.836 E.0001
G1 X150.629 Y141.686 E.0003
G1 X150.571 Y141.686 E.0001
G1 X150.487 Y141.536 E.0003
G1 X150.545 Y141.536 E.0001
G1 X150.461 Y141.386 E.0003
G1 X150.325 Y141.386 E.00024
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X150.461 Y141.386 E-.01546
G1 X150.545 Y141.536 E-.01961
G1 X150.487 Y141.536 E-.00662
G1 X150.571 Y141.686 E-.01962
G1 X150.629 Y141.686 E-.00661
G1 X150.713 Y141.836 E-.01961
G1 X150.655 Y141.836 E-.0066
G1 X150.74 Y141.986 E-.01962
G1 X150.798 Y141.986 E-.00659
G1 X150.882 Y142.136 E-.01961
G1 X150.824 Y142.136 E-.00658
G1 X150.908 Y142.286 E-.01962
G1 X150.966 Y142.286 E-.00657
G1 X151.05 Y142.436 E-.01961
G1 X150.993 Y142.436 E-.00655
G1 X151.077 Y142.586 E-.01962
G1 X151.134 Y142.586 E-.00654
G1 X151.147 Y142.609 E-.00297
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I1.187 J-.268 P1  F28800
G1 X150.524 Y139.843 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G2 X150.067 Y139.397 I-8.807 J8.563 E.01658
G1 X149.78 Y139.223 E.0087
G1 X149.834 Y139.105 E.00337
G1 X149.882 Y139.13 E.00142
G3 X150.807 Y139.923 I-2.144 J3.437 E.03173
G1 X150.654 Y139.98 E.00423
G2 X150.565 Y139.887 I-8.937 J8.427 E.00333
G1 X150.557 Y139.445 F28800
G1 X150.878 Y139.896
G1 F12000
G1 X150.878 Y136.048 E.09987
G1 X150.999 Y136.048 E.00315
G1 X150.999 Y139.851 E.0987
G1 X150.934 Y139.876 E.00181
G1 X150.882 Y139.496 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X150.905 Y137.876 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I1.198 J.213 P1  F28800
G1 X151.859 Y132.499 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X152.209 Y132.379 E.01079
G1 X152.209 Y128.871 E.1023
G1 X152.291 Y128.871 E.00239
G1 X152.291 Y132.913 E.11787
G1 X152.082 Y132.977 E.00636
G2 X151.459 Y132.158 I-4.892 J3.079 E.03005
G1 X151.284 Y132.022 E.00647
G1 X151.329 Y131.944 E.00263
G3 X151.823 Y132.451 I-1.724 J2.176 E.02071
G1 X152.028 Y132.828 F28800
G1 X152.293 Y132.836
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X152.066 Y132.836 E.0004
G1 X151.965 Y132.686 E.00031
G1 X152.226 Y132.686 E.00045
G1 X152.226 Y132.536 E.00026
G1 X151.762 Y132.536 E.00081
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X152.226 Y132.536 E-.0824
G1 X152.226 Y132.686 E-.02665
G1 X151.965 Y132.686 E-.04638
G1 X152.066 Y132.836 E-.03213
G1 X152.293 Y132.836 E-.04043
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.243 J1.193 P1  F28800
G1 X156.153 Y132.051 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X156.291 Y131.879 E.00572
G1 X156.562 Y132.099 E.00905
G1 X161.032 Y135.719 E.14929
G1 X160.893 Y135.891 E.00575
G1 X156.199 Y132.089 E.15676
G1 X156.357 Y131.969 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X156.291 Y131.879 E-.02604
G1 X156.562 Y132.099 E-.03975
G1 X157.668 Y132.994 E-.16221
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.813 J.906 P1  F28800
G1 X160.669 Y135.686 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X160.856 Y135.686 E.00032
G1 X160.67 Y135.536 E.00041
G1 X160.591 Y135.536 E.00014
G1 X160.406 Y135.386 E.00041
G1 X160.485 Y135.386 E.00014
G1 X160.3 Y135.236 E.00041
G1 X160.221 Y135.236 E.00014
G1 X160.035 Y135.086 E.00041
G1 X160.115 Y135.086 E.00014
G1 X159.929 Y134.936 E.00041
G1 X159.85 Y134.936 E.00014
G1 X159.665 Y134.786 E.00041
G1 X159.744 Y134.786 E.00014
G1 X159.559 Y134.636 E.00041
G1 X159.48 Y134.636 E.00014
G1 X159.295 Y134.486 E.00041
G1 X159.374 Y134.486 E.00014
G1 X159.188 Y134.336 E.00041
G1 X159.11 Y134.336 E.00014
G1 X158.924 Y134.186 E.00041
G1 X159.003 Y134.186 E.00014
G1 X158.818 Y134.036 E.00041
G1 X158.739 Y134.036 E.00014
G1 X158.554 Y133.886 E.00041
G1 X158.633 Y133.886 E.00014
G1 X158.447 Y133.736 E.00041
G1 X158.369 Y133.736 E.00014
G1 X158.184 Y133.586 E.00041
G1 X158.262 Y133.586 E.00014
G1 X158.077 Y133.436 E.00041
G1 X157.999 Y133.436 E.00014
G1 X157.813 Y133.286 E.00041
G1 X157.892 Y133.286 E.00014
G1 X157.707 Y133.136 E.00041
G1 X157.628 Y133.136 E.00014
G1 X157.443 Y132.986 E.00041
G1 X157.521 Y132.986 E.00014
G1 X157.336 Y132.836 E.00041
G1 X157.258 Y132.836 E.00014
G1 X157.073 Y132.686 E.00041
G1 X157.151 Y132.686 E.00014
G1 X156.966 Y132.536 E.00041
G1 X156.888 Y132.536 E.00014
G1 X156.702 Y132.386 E.00041
G1 X156.78 Y132.386 E.00014
G1 X156.595 Y132.236 E.00041
G1 X156.517 Y132.236 E.00014
G1 X156.332 Y132.086 E.00041
G1 X156.517 Y132.086 E.00032
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X156.332 Y132.086 E-.02109
G1 X156.517 Y132.236 E-.02717
G1 X156.595 Y132.236 E-.00887
G1 X156.78 Y132.386 E-.02717
G1 X156.702 Y132.386 E-.00888
G1 X156.888 Y132.536 E-.02717
G1 X156.966 Y132.536 E-.00889
G1 X157.151 Y132.686 E-.02717
G1 X157.073 Y132.686 E-.0089
G1 X157.258 Y132.836 E-.02717
G1 X157.336 Y132.836 E-.0089
G1 X157.518 Y132.983 E-.02662
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.867 J-.854 P1  F28800
G1 X153.563 Y128.97 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X153.885 Y129.638 E.01926
G1 X154.595 Y130.622 E.03147
G1 X154.985 Y131.263 E.01948
G1 X155.131 Y131.67 E.01123
G1 X155.184 Y132.138 E.01222
G1 X155.131 Y132.501 E.00951
G1 X154.97 Y132.848 E.00995
G3 X153.816 Y133.039 I-.666 J-.446 E.03401
G1 X153.622 Y132.818 E.00764
G1 X153.477 Y132.493 E.00922
G1 X153.433 Y132.149 E.009
G1 X153.549 Y132.149 E.00299
G2 X153.856 Y132.918 I1.096 J.008 E.02203
G2 X154.878 Y132.771 I.45 J-.5 E.03057
G1 X155.011 Y132.49 E.00807
G2 X155.059 Y131.945 I-1.451 J-.403 E.01428
G1 X154.953 Y131.499 E.0119
G1 X154.872 Y131.303 E.00551
G1 X154.082 Y130.143 E.0364
G1 X153.593 Y129.317 E.02493
G3 X153.466 Y128.85 I1.784 J-.732 E.01258
G1 X155.071 Y128.85 E.04165
G1 X155.071 Y128.97 E.0031
G1 X153.623 Y128.97 E.0376
G1 X153.184 Y129.098 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X153.885 Y129.638 E-.08188
G1 X154.595 Y130.622 E-.13824
G1 X154.631 Y130.681 E-.00788
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I1.136 J-.436 P1  F28800
G1 X151.955 Y123.699 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X152.305 Y123.579 E.01079
G1 X152.305 Y120.071 E.1023
G1 X152.383 Y120.071 E.00227
G1 X152.383 Y124.124 E.11818
G1 X152.18 Y124.186 E.00618
G2 X151.555 Y123.357 I-5.179 J3.25 E.03033
G1 X151.382 Y123.222 E.00639
G1 X151.428 Y123.143 E.00265
G3 X151.919 Y123.651 I-1.828 J2.26 E.02065
G1 X152.123 Y124.029 F28800
G1 X152.385 Y123.986
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X152.124 Y123.986 E.00045
G2 X152.022 Y123.836 I-.931 J.522 E.00032
G1 X152.318 Y123.836 E.00051
G1 X152.318 Y123.686 E.00026
G1 X151.986 Y123.686 E.00058
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X152.318 Y123.686 E-.06208
G1 X152.318 Y123.836 E-.02804
G1 X152.022 Y123.836 E-.0552
G1 X152.124 Y123.986 E-.03389
G1 X152.385 Y123.986 E-.04879
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.672 J1.014 P1  F28800
G1 X154.756 Y122.415 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G3 X155.144 Y123.393 I-.978 J.955 E.02805
G1 X155.086 Y123.793 E.01048
G1 X154.948 Y124.081 E.00828
G3 X153.741 Y124.077 I-.602 J-.393 E.03717
G3 X153.535 Y123.473 I1.023 J-.686 E.01675
G1 X153.656 Y123.462 E.00315
G2 X153.997 Y124.18 I1.086 J-.076 E.02112
G2 X154.895 Y123.942 I.347 J-.505 E.02737
G1 X154.998 Y123.662 E.00773
G1 X155.023 Y123.257 E.01055
G1 X154.962 Y122.938 E.00842
G2 X154.342 Y122.405 I-.808 J.313 E.02209
G1 X154.336 Y122.334 E.00185
G2 X154.979 Y121.975 I.035 J-.691 E.02014
G1 X155.11 Y121.66 E.00886
G1 X155.159 Y121.189 E.01229
G2 X154.786 Y120.23 I-1.417 J-.001 E.02734
G2 X153.826 Y120.366 I-.423 J.468 E.0287
G2 X153.617 Y120.967 I1.243 J.768 E.01666
G1 X153.503 Y120.953 E.00298
G1 X153.588 Y120.574 E.01009
G1 X153.732 Y120.291 E.00823
G3 X154.28 Y119.953 I.643 J.428 E.01723
G3 X154.874 Y120.155 I.058 J.804 E.01671
G1 X155.087 Y120.428 E.00899
G1 X155.227 Y120.784 E.00993
G1 X155.278 Y121.292 E.01325
G1 X155.208 Y121.749 E.012
G1 X155.053 Y122.078 E.00943
G1 X154.795 Y122.37 E.0101
G1 X154.506 Y122.657 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X154.971 Y122.687 E-.04137
G1 X155.1 Y122.982 E-.03669
G1 X155.144 Y123.393 E-.04716
G1 X155.086 Y123.793 E-.04606
G1 X154.948 Y124.081 E-.03637
G1 X154.829 Y124.214 E-.02036
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I1.037 J.636 P1  F28800
G1 X156.27 Y121.865 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
G1 X156.808 Y121.895 E.01401
G1 X159.676 Y122.054 E.07454
G1 X159.663 Y122.276 E.00577
G1 X156.258 Y122.085 E.08851
G1 X156.266 Y121.925 E.00416
G1 X156.668 Y121.895 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X156.808 Y121.895 E-.0619
G1 X158.263 Y121.975 E-.1661
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.096 J1.213 P1  F28800
G1 X159.031 Y122.036 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X156.279 Y122.036 E.00479
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X158.279 Y122.036 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.798 J-.918 P1  F28800
G1 X149.953 Y114.798 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X150.305 Y114.678 E.01082
G1 X150.305 Y111.171 E.10227
G1 X150.387 Y111.171 E.00239
G1 X150.387 Y115.22 E.11805
G1 X150.18 Y115.283 E.0063
G2 X149.557 Y114.456 I-5.224 J3.291 E.03022
G1 X149.382 Y114.321 E.00644
G1 X149.427 Y114.243 E.00264
G3 X149.918 Y114.749 I-1.71 J2.147 E.02062
G1 X150.122 Y115.128 F28800
G1 X150.389 Y115.136
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X150.16 Y115.136 E.0004
G1 X150.059 Y114.986 E.00031
G1 X150.322 Y114.986 E.00046
G1 X150.322 Y114.836 E.00026
G1 X149.858 Y114.836 E.00081
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X150.322 Y114.836 E-.08223
G1 X150.322 Y114.986 E-.02659
G1 X150.059 Y114.986 E-.04652
G1 X150.16 Y115.136 E-.03203
G1 X150.389 Y115.136 E-.04063
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I1.124 J.467 P1  F28800
G1 X151.528 Y112.396 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X152.861 Y115.36 E.08435
G1 X152.75 Y115.411 E.00316
G1 X151.474 Y112.574 E.0807
G1 X151.474 Y112.274 E.00779
G1 X152.884 Y112.274 E.03659
G1 X152.884 Y111.15 E.02917
G1 X153.025 Y111.15 E.00367
G1 X153.025 Y112.274 E.02917
G1 X153.369 Y112.274 E.00893
G1 X153.369 Y112.396 E.00315
G1 X153.025 Y112.396 E.00893
G1 X153.025 Y113.972 E.0409
G1 X152.884 Y113.972 E.00367
G1 X152.884 Y112.396 E.0409
G1 X151.588 Y112.396 E.03363
G1 X151.128 Y112.394 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X152.377 Y114.234 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.811 J.907 P1  F28800
G1 X154.679 Y112.176 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
G1 X154.58 Y111.977 E.00575
G1 X159.265 Y109.663 E.1356
G1 X159.363 Y109.861 E.00575
G1 X154.732 Y112.149 E.13404
G1 X154.69 Y111.954 F28800
G1 X155.021 Y111.986
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X154.755 Y111.986 E.00046
G1 X155.059 Y111.836 E.00059
G1 X155.172 Y111.836 E.0002
G1 X155.476 Y111.686 E.00059
G1 X155.363 Y111.686 E.0002
G1 X155.666 Y111.536 E.00059
G1 X155.78 Y111.536 E.0002
G1 X156.083 Y111.386 E.00059
G1 X155.97 Y111.386 E.0002
G1 X156.274 Y111.236 E.00059
G1 X156.387 Y111.236 E.0002
G1 X156.69 Y111.086 E.00059
G1 X156.577 Y111.086 E.0002
G1 X156.881 Y110.936 E.00059
G1 X156.994 Y110.936 E.0002
G1 X157.298 Y110.786 E.00059
G1 X157.184 Y110.786 E.0002
G1 X157.488 Y110.636 E.00059
G1 X157.601 Y110.636 E.0002
G1 X157.905 Y110.486 E.00059
G1 X157.792 Y110.486 E.0002
G1 X158.095 Y110.336 E.00059
G1 X158.209 Y110.336 E.0002
G1 X158.512 Y110.186 E.00059
G1 X158.399 Y110.186 E.0002
G1 X158.703 Y110.036 E.00059
G1 X158.816 Y110.036 E.0002
G1 X159.119 Y109.886 E.00059
G1 X158.854 Y109.886 E.00046
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X159.119 Y109.886 E-.03029
G1 X158.816 Y110.036 E-.03861
G1 X158.703 Y110.036 E-.01292
G1 X158.399 Y110.186 E-.03861
G1 X158.512 Y110.186 E-.01292
G1 X158.209 Y110.336 E-.03861
G1 X158.095 Y110.336 E-.01292
G1 X157.792 Y110.486 E-.03861
G1 X157.831 Y110.486 E-.00454
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.005 J-1.217 P1  F28800
G1 X142.376 Y110.423 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X142.234 Y110.254 E.00572
G1 X150.694 Y103.155 E.28661
G1 X150.836 Y103.324 E.00572
G1 X142.422 Y110.384 E.28505
G1 X142.336 Y110.206 F28800
G1 X142.629 Y110.186
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X142.448 Y110.186 E.00032
G1 X142.627 Y110.036 E.00041
G1 X142.703 Y110.036 E.00013
G1 X142.882 Y109.886 E.00041
G1 X142.806 Y109.886 E.00013
G1 X142.985 Y109.736 E.00041
G1 X143.061 Y109.736 E.00013
G1 X143.239 Y109.586 E.00041
G1 X143.163 Y109.586 E.00013
G1 X143.342 Y109.436 E.00041
G1 X143.418 Y109.436 E.00013
G1 X143.597 Y109.286 E.00041
G1 X143.521 Y109.286 E.00013
G1 X143.7 Y109.136 E.00041
G1 X143.776 Y109.136 E.00013
G1 X143.955 Y108.986 E.00041
G1 X143.878 Y108.986 E.00013
G1 X144.057 Y108.836 E.00041
G1 X144.133 Y108.836 E.00013
G1 X144.312 Y108.686 E.00041
G1 X144.236 Y108.686 E.00013
G1 X144.415 Y108.536 E.00041
G1 X144.491 Y108.536 E.00013
G1 X144.67 Y108.386 E.00041
G1 X144.593 Y108.386 E.00013
G1 X144.772 Y108.236 E.00041
G1 X144.848 Y108.236 E.00013
G1 X145.027 Y108.086 E.00041
G1 X144.951 Y108.086 E.00013
G1 X145.13 Y107.936 E.00041
G1 X145.206 Y107.936 E.00013
G1 X145.385 Y107.786 E.00041
G1 X145.308 Y107.786 E.00013
G1 X145.487 Y107.636 E.00041
G1 X145.563 Y107.636 E.00013
G1 X145.742 Y107.486 E.00041
G1 X145.666 Y107.486 E.00013
G1 X145.845 Y107.336 E.00041
G1 X145.921 Y107.336 E.00013
G1 X146.1 Y107.186 E.00041
G1 X146.024 Y107.186 E.00013
G1 X146.202 Y107.036 E.00041
G1 X146.279 Y107.036 E.00013
G1 X146.457 Y106.886 E.00041
G1 X146.381 Y106.886 E.00013
G1 X146.56 Y106.736 E.00041
G1 X146.636 Y106.736 E.00013
G1 X146.815 Y106.586 E.00041
G1 X146.739 Y106.586 E.00013
G1 X146.917 Y106.436 E.00041
G1 X146.994 Y106.436 E.00013
G1 X147.172 Y106.286 E.00041
G1 X147.096 Y106.286 E.00013
G1 X147.275 Y106.136 E.00041
G1 X147.351 Y106.136 E.00013
G1 X147.53 Y105.986 E.00041
G1 X147.454 Y105.986 E.00013
G1 X147.632 Y105.836 E.00041
G1 X147.709 Y105.836 E.00013
G1 X147.887 Y105.686 E.00041
G1 X147.811 Y105.686 E.00013
G1 X147.99 Y105.536 E.00041
G1 X148.066 Y105.536 E.00013
G1 X148.245 Y105.386 E.00041
G1 X148.169 Y105.386 E.00013
G1 X148.348 Y105.236 E.00041
G1 X148.424 Y105.236 E.00013
G1 X148.602 Y105.086 E.00041
G1 X148.526 Y105.086 E.00013
G1 X148.705 Y104.936 E.00041
G1 X148.781 Y104.936 E.00013
G1 X148.96 Y104.786 E.00041
G1 X148.884 Y104.786 E.00013
G1 X149.063 Y104.636 E.00041
G1 X149.139 Y104.636 E.00013
G1 X149.318 Y104.486 E.00041
G1 X149.241 Y104.486 E.00013
G1 X149.42 Y104.336 E.00041
G1 X149.496 Y104.336 E.00013
G1 X149.675 Y104.186 E.00041
G1 X149.599 Y104.186 E.00013
G1 X149.778 Y104.036 E.00041
G1 X149.854 Y104.036 E.00013
G1 X150.033 Y103.886 E.00041
G1 X149.956 Y103.886 E.00013
G1 X150.135 Y103.736 E.00041
G1 X150.211 Y103.736 E.00013
G1 X150.39 Y103.586 E.00041
G1 X150.314 Y103.586 E.00013
G1 X150.493 Y103.436 E.00041
G1 X150.569 Y103.436 E.00013
G1 X150.715 Y103.314 E.00033
G1 X150.692 Y103.286 E.00006
G1 X150.566 Y103.286 E.00022
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X150.692 Y103.286 E-.01427
G1 X150.715 Y103.314 E-.00411
G1 X150.569 Y103.436 E-.02172
G1 X150.493 Y103.436 E-.00869
G1 X150.314 Y103.586 E-.0266
G1 X150.39 Y103.586 E-.00869
G1 X150.211 Y103.736 E-.0266
G1 X150.135 Y103.736 E-.00869
G1 X149.956 Y103.886 E-.0266
G1 X150.033 Y103.886 E-.00869
G1 X149.854 Y104.036 E-.0266
G1 X149.778 Y104.036 E-.00869
G1 X149.599 Y104.186 E-.0266
G1 X149.675 Y104.186 E-.00869
G1 X149.657 Y104.202 E-.00276
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.973 J-.731 P1  F28800
G1 X141.366 Y115.234 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X142.531 Y115.234 E.03025
G1 X142.531 Y115.356 E.00315
G1 X141.26 Y115.356 E.03301
G1 X141.022 Y113.473 E.04925
G1 X141.136 Y113.42 E.00327
G1 X141.358 Y115.175 E.0459
G1 X141.392 Y115.633 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X142.531 Y115.234 E-.1339
G1 X142.531 Y115.356 E-.01385
G1 X141.828 Y115.356 E-.08025
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I1.215 J.072 P1  F28800
G1 X141.922 Y113.764 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
G2 X142.214 Y113.636 I.021 J-.347 E.00858
G1 X142.333 Y113.48 E.0051
G1 X142.479 Y113.143 E.00953
G1 X142.549 Y112.565 E.0151
G1 X142.497 Y112.02 E.01421
G1 X142.348 Y111.592 E.01178
G2 X142.08 Y111.254 I-.748 J.317 E.01133
G2 X141.473 Y111.37 I-.235 J.418 E.01744
G1 X141.329 Y111.601 E.00705
G1 X141.219 Y112.023 E.01131
G1 X141.098 Y112.015 E.00313
G1 X141.238 Y111.518 E.01339
G1 X141.402 Y111.27 E.00772
G3 X142.014 Y111.094 I.444 J.394 E.01745
G3 X142.276 Y111.27 I-.177 J.547 E.00828
G3 X142.572 Y111.835 I-1.146 J.961 E.0167
G1 X142.67 Y112.531 E.01822
G1 X142.59 Y113.183 E.01704
G1 X142.428 Y113.553 E.01049
G3 X141.941 Y113.886 I-.57 J-.311 E.0159
G3 X141.701 Y113.812 I.005 J-.44 E.0066
G1 X141.204 Y113.389 E.01696
G1 X141.37 Y113.312 E.00477
G1 X141.717 Y113.68 E.01314
G2 X141.863 Y113.755 I.226 J-.264 E.00428
G1 X141.962 Y113.85 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X142.017 Y113.758 E-.01759
G1 X142.108 Y113.722 E-.01115
G1 X142.214 Y113.636 E-.01554
G1 X142.333 Y113.48 E-.02239
G1 X142.479 Y113.143 E-.04184
G1 X142.549 Y112.565 E-.06634
G1 X142.505 Y112.101 E-.05314
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.805 J-.913 P1  F28800
G1 X139.447 Y114.798 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
G1 X139.799 Y114.678 E.01082
G1 X139.799 Y111.171 E.10227
G1 X139.881 Y111.171 E.00239
G1 X139.881 Y115.233 E.11844
G1 X139.679 Y115.293 E.00614
G2 X139.052 Y114.457 I-5.266 J3.297 E.03051
G1 X138.88 Y114.322 E.00637
G1 X138.926 Y114.244 E.00264
G3 X139.412 Y114.749 I-1.71 J2.129 E.0205
G1 X139.61 Y115.131 F28800
G1 X139.883 Y115.136
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X139.652 Y115.136 E.0004
G1 X139.552 Y114.986 E.00031
G1 X139.816 Y114.986 E.00046
G1 X139.816 Y114.836 E.00026
G1 X139.351 Y114.836 E.00081
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X139.816 Y114.836 E-.08216
G1 X139.816 Y114.986 E-.0265
G1 X139.552 Y114.986 E-.04662
G1 X139.652 Y115.136 E-.03188
G1 X139.883 Y115.136 E-.04084
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I.05 J-1.216 P1  F28800
G1 X129.255 Y114.699 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X129.605 Y114.579 E.01079
G1 X129.605 Y111.069 E.10235
G1 X129.685 Y111.069 E.00233
G1 X129.685 Y115.124 E.11823
G1 X129.48 Y115.187 E.00623
G2 X128.855 Y114.357 I-5.18 J3.251 E.03034
G1 X128.682 Y114.222 E.00639
G1 X128.727 Y114.144 E.00261
G3 X129.219 Y114.651 I-1.77 J2.211 E.02064
G1 X129.424 Y115.028 F28800
G1 X129.687 Y114.986
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X129.424 Y114.986 E.00046
G2 X129.322 Y114.836 I-.93 J.522 E.00032
G1 X129.62 Y114.836 E.00052
G1 X129.62 Y114.686 E.00026
G1 X129.286 Y114.686 E.00058
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X129.62 Y114.686 E-.06214
G1 X129.62 Y114.836 E-.0279
G1 X129.322 Y114.836 E-.05531
G1 X129.424 Y114.986 E-.03373
G1 X129.687 Y114.986 E-.04892
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I-.164 J1.206 P1  F28800
G1 X131.763 Y115.269 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
; LAYER_HEIGHT: 0.2
G1 F12000
G2 X132.067 Y115.111 I-.018 J-.407 E.0092
G1 X132.187 Y114.903 E.00621
G1 X132.263 Y114.571 E.00883
G1 X132.384 Y114.581 E.00315
G1 X132.288 Y114.964 E.01025
G3 X131.915 Y115.365 I-.663 J-.244 E.01459
G3 X131.347 Y115.204 I-.158 J-.524 E.01618
G3 X131.05 Y114.633 I1.037 J-.903 E.01685
G1 X130.875 Y113.17 E.03824
G1 X130.993 Y111.811 E.03541
G1 X131.147 Y111.391 E.0116
G3 X131.492 Y111.023 I.873 J.473 E.01323
G3 X131.898 Y111.005 I.226 J.525 E.01079
G3 X132.193 Y111.266 I-.329 J.67 E.01033
G1 X132.356 Y111.619 E.01009
G1 X132.468 Y112.334 E.01878
G1 X132.394 Y113.017 E.01783
G1 X132.238 Y113.383 E.01032
G3 X131.57 Y113.68 I-.567 J-.374 E.02002
G1 X131.631 Y113.567 E.00334
G2 X132.139 Y113.321 I.073 J-.498 E.01555
G1 X132.282 Y112.977 E.00967
G1 X132.351 Y112.386 E.01546
G1 X132.291 Y111.843 E.01418
G2 X131.96 Y111.177 I-1.333 J.248 E.01956
G2 X131.43 Y111.209 I-.246 J.32 E.01503
G2 X131.24 Y111.47 I.974 J.907 E.00839
G1 X131.104 Y111.861 E.01073
G1 X131.009 Y112.557 E.01823
G1 X131.014 Y113.661 E.02867
G1 X131.136 Y114.499 E.02198
G1 X131.279 Y114.896 E.01093
G1 X131.43 Y115.12 E.00703
G2 X131.703 Y115.267 I.315 J-.258 E.00826
G1 X131.821 Y115.369 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X131.877 Y115.254 E-.01997
G1 X131.969 Y115.206 E-.01177
G1 X132.067 Y115.111 E-.01565
G1 X132.187 Y114.903 E-.02729
G1 X132.263 Y114.571 E-.0388
G1 X132.384 Y114.581 E-.01383
G1 X132.288 Y114.964 E-.04504
G1 X132.153 Y115.192 E-.03022
G1 X132.041 Y115.3 E-.01762
G1 X131.981 Y115.331 E-.00781
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.4 I1.198 J-.212 P1  F28800
G1 X131.08 Y110.244 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12000
G1 X132.774 Y103.8 E.17291
G1 X132.988 Y103.856 E.00574
G1 X131.294 Y110.3 E.17291
G1 X131.138 Y110.259 E.00418
G1 X131.186 Y109.858 F28800
G1 X131.114 Y110.186
; FEATURE: Ironing
; LINE_WIDTH: 0.402414
; LAYER_HEIGHT: 0.01125
G1 F3600
G1 X131.235 Y110.186 E.00021
G1 X131.275 Y110.036 E.00027
G1 X131.223 Y110.036 E.00009
G1 X131.263 Y109.886 E.00027
G1 X131.314 Y109.886 E.00009
G1 X131.353 Y109.736 E.00027
G1 X131.302 Y109.736 E.00009
G1 X131.342 Y109.586 E.00027
G1 X131.393 Y109.586 E.00009
G1 X131.432 Y109.436 E.00027
G1 X131.381 Y109.436 E.00009
G1 X131.42 Y109.286 E.00027
G1 X131.472 Y109.286 E.00009
G1 X131.511 Y109.136 E.00027
G1 X131.46 Y109.136 E.00009
G1 X131.499 Y108.986 E.00027
G1 X131.55 Y108.986 E.00009
G1 X131.59 Y108.836 E.00027
G1 X131.539 Y108.836 E.00009
G1 X131.578 Y108.686 E.00027
G1 X131.629 Y108.686 E.00009
G1 X131.669 Y108.536 E.00027
G1 X131.617 Y108.536 E.00009
G1 X131.657 Y108.386 E.00027
G1 X131.708 Y108.386 E.00009
G1 X131.748 Y108.236 E.00027
G1 X131.696 Y108.236 E.00009
G1 X131.736 Y108.086 E.00027
G1 X131.787 Y108.086 E.00009
G1 X131.826 Y107.936 E.00027
G1 X131.775 Y107.936 E.00009
G1 X131.815 Y107.786 E.00027
G1 X131.866 Y107.786 E.00009
G1 X131.905 Y107.636 E.00027
G1 X131.854 Y107.636 E.00009
G1 X131.893 Y107.486 E.00027
G1 X131.945 Y107.486 E.00009
G1 X131.984 Y107.336 E.00027
G1 X131.933 Y107.336 E.00009
G1 X131.972 Y107.186 E.00027
G1 X132.024 Y107.186 E.00009
G1 X132.063 Y107.036 E.00027
M73 P99 R0
G1 X132.012 Y107.036 E.00009
G1 X132.051 Y106.886 E.00027
G1 X132.102 Y106.886 E.00009
G1 X132.142 Y106.736 E.00027
G1 X132.091 Y106.736 E.00009
G1 X132.13 Y106.586 E.00027
G1 X132.181 Y106.586 E.00009
G1 X132.221 Y106.436 E.00027
G1 X132.169 Y106.436 E.00009
G1 X132.209 Y106.286 E.00027
G1 X132.26 Y106.286 E.00009
G1 X132.3 Y106.136 E.00027
G1 X132.248 Y106.136 E.00009
G1 X132.288 Y105.986 E.00027
G1 X132.339 Y105.986 E.00009
G1 X132.378 Y105.836 E.00027
G1 X132.327 Y105.836 E.00009
G1 X132.367 Y105.686 E.00027
G1 X132.418 Y105.686 E.00009
G1 X132.457 Y105.536 E.00027
G1 X132.406 Y105.536 E.00009
G1 X132.445 Y105.386 E.00027
G1 X132.497 Y105.386 E.00009
G1 X132.536 Y105.236 E.00027
G1 X132.485 Y105.236 E.00009
G1 X132.524 Y105.086 E.00027
G1 X132.576 Y105.086 E.00009
G1 X132.615 Y104.936 E.00027
G1 X132.564 Y104.936 E.00009
G1 X132.603 Y104.786 E.00027
G1 X132.654 Y104.786 E.00009
G1 X132.694 Y104.636 E.00027
G1 X132.643 Y104.636 E.00009
G1 X132.682 Y104.486 E.00027
G1 X132.733 Y104.486 E.00009
G1 X132.773 Y104.336 E.00027
G1 X132.721 Y104.336 E.00009
G1 X132.761 Y104.186 E.00027
G1 X132.812 Y104.186 E.00009
G1 X132.852 Y104.036 E.00027
G1 X132.731 Y104.036 E.00021
; close powerlost recovery
M1003 S0
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X132.852 Y104.036 E-.0138
G1 X132.812 Y104.186 E-.01768
G1 X132.761 Y104.186 E-.00585
G1 X132.721 Y104.336 E-.01768
G1 X132.773 Y104.336 E-.00585
G1 X132.733 Y104.486 E-.01768
G1 X132.682 Y104.486 E-.00585
G1 X132.643 Y104.636 E-.01768
G1 X132.694 Y104.636 E-.00585
G1 X132.654 Y104.786 E-.01768
G1 X132.603 Y104.786 E-.00585
G1 X132.564 Y104.936 E-.01768
G1 X132.615 Y104.936 E-.00585
G1 X132.576 Y105.086 E-.01768
G1 X132.524 Y105.086 E-.00585
G1 X132.485 Y105.236 E-.01768
G1 X132.536 Y105.236 E-.00585
G1 X132.497 Y105.386 E-.01768
G1 X132.445 Y105.386 E-.00585
G1 X132.44 Y105.407 E-.00245
; WIPE_END
G1 E-.012 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; filament end gcode 
;M106 P3 S0
;===== date: 202200913 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z2.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z102 F600
    G1 Z100

M400 P100
M17 R ; restore z current

G90
G1 X128 Y250 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power

M73 P100 R0
; EXECUTABLE_BLOCK_END

