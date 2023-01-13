; HEADER_BLOCK_START
; BambuStudio 01.03.00.15
; total estimated time: 16m 14s
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; adaptive_layer_height = 1
; additional_cooling_fan_speed = 70
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_difference = 10
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
; close_fan_the_first_x_layers = 1
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_profile = "Bambu PLA Basic @BBL X1"
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; different_settings_to_system = adaptive_layer_height;brim_type;fan_max_speed;fan_min_speed;filament_deretraction_speed;filament_retract_when_changing_layer;filament_retraction_length;filament_retraction_minimum_travel;filament_retraction_speed;filament_wipe;filament_wipe_distance;filament_z_hop;slow_down_layer_time;textured_plate_temp;textured_plate_temp_initial_layer;
; draft_shield = disabled
; elefant_foot_compensation = 0
; enable_arc_fitting = 1
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_prime_tower = 0
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; extruder_clearance_height_to_lid = 140
; extruder_clearance_height_to_rod = 36
; extruder_clearance_radius = 32
; extruder_colour = #018001
; extruder_offset = 0x2
; fan_cooling_layer_time = 100
; fan_max_speed = 70
; fan_min_speed = 70
; filament_colour = #00AE42
; filament_cost = 24.99
; filament_density = 1.26
; filament_deretraction_speed = 30
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \n;M106 P3 S0\n"
; filament_flow_ratio = 0.98
; filament_ids = GFA00
; filament_is_support = 0
; filament_max_volumetric_speed = 21
; filament_minimal_purge_on_wipe_tower = 15
; filament_retract_when_changing_layer = 1
; filament_retraction_length = 0.8
; filament_retraction_minimum_travel = 1
; filament_retraction_speed = 30
; filament_settings_id = "Bambu PLA Basic @BBL X1"
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif}"
; filament_type = PLA
; filament_vendor = "Bambu Lab"
; filament_wipe = 1
; filament_wipe_distance = 2
; filament_z_hop = 0.4
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; host_type = octoprint
; hot_plate_temp = 55
; hot_plate_temp_initial_layer = 55
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_wall_overlap = 25%
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
; ironing_flow = 10%
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
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
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1\n
; machine_start_gcode = ;===== machine: P1P ========================\n;===== date: 202200929 =====================\n;===== reset machine status =================\nG91\nM17 Z0.4 ; lower the z-motor current\nG0 Z12 F300 ; lower the hotbed , to prevent the nozzle is below the hotbed\nG0 Z-6;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\n{if bbl_bed_temperature_gcode}\nM1002 set_heatbed_surface_temp:[bed_temperature_initial_layer_vector] ;config bed temps\nM140 A S[bed_temperature_initial_layer_single] ;set bed temp\nM190 A S[bed_temperature_initial_layer_single] ;wait for bed temp\n{else}\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n{endif}\n\n\n=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_tool]=="PLA"}\n    {if (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on \nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_tool]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_tool]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_tool]A\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_tool]=="PLA"}\n    {if (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY \n;===== fmech mode fast check============================\n\n\n;===== noozle load line ===============================\nM975 S1\nG90 \nM83\nT1000\nG1 X18.0 Y5.0 Z0.2 F18000;Move to start position\nM109 S{nozzle_temperature[initial_extruder]}\nG0 E3 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60} \nG0 Y15 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E1\nG0 Y5.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60} \nM400\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan \nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression
; machine_unload_filament_time = 16
; max_bridge_length = 10
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; nozzle_diameter = 0.4
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 118
; only_one_wall_top = 1
; ooze_prevention = 0
; outer_wall_acceleration = 10000
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
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
; reduce_fan_stop_start_freq = 1
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
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 2
; slow_down_min_speed = 20
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
; temperature_vitrification = 55
; template_custom_gcode = 
; textured_plate_temp = 65
; textured_plate_temp_initial_layer = 65
; thick_bridges = 0
; timelapse_type = 0
; top_shell_layers = 4
; top_shell_thickness = 0.8
; top_surface_acceleration = 2000
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
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
; wipe_tower_y = 240
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_hop = 0.4
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R16
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
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
M73 P26 R11
G1 Y245
M73 P27 R11
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
M73 P29 R11
G1 X76 F15000
M73 P30 R11
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
M73 P31 R11
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
    G29 A X83.7239 Y92.1248 I43.9995 J87.12
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
M73 P32 R11
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
G90
G21
M83 ; only support relative e
; filament start gcode
M106 P3 S255
M981 S1 P20000 ;open spaghetti detector
M106 S0
M106 P2 S0
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
M73 P32 R10
G1 E-.8 F1800

M204 S500
G1 X111.878 Y121.091 Z.4 F28800
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X99.569 Y121.091 E.45845
G1 X99.569 Y168.805 E1.77719
G2 X111.878 Y168.805 I6.154 J-.013 E.71913
G1 X111.878 Y121.151 E1.77496
G1 X111.421 Y121.548 F28800
; FEATURE: Outer wall
M73 P33 R10
G1 F3000
G1 X100.026 Y121.548 E.4244
G1 X100.026 Y168.8 E1.75998
G2 X111.421 Y168.8 I5.697 J-.008 E.66604
G1 X111.421 Y121.608 E1.75775
G1 X111.421 Y121.148 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.421 Y121.597 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I.773 J.94 P1  F28800
G1 X111.966 Y119.505 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
M73 P34 R10
G1 F3000
G1 X111.975 Y119.505 E.00035
G1 X112.127 Y115.879 E.13516
G3 X114.386 Y109.828 I17.255 J2.995 E.24194
G1 X118.174 Y103.578 E.27222
G1 X93.273 Y103.578 E.92746
G1 X97.061 Y109.828 E.27222
G3 X99.32 Y115.879 I-14.975 J9.038 E.24195
G1 X99.473 Y119.505 E.13516
G1 X111.906 Y119.505 E.46308
G1 X111.537 Y119.048 F28800
; FEATURE: Outer wall
G1 F3000
G1 X111.672 Y115.826 E.12008
G3 X113.992 Y109.596 I17.724 J3.054 E.24909
G1 X117.363 Y104.035 E.24218
G1 X94.085 Y104.035 E.86701
M73 P35 R10
G1 X97.455 Y109.596 E.24218
G3 X99.776 Y115.826 I-15.382 J9.277 E.24909
G1 X99.911 Y119.048 E.12008
G1 X111.477 Y119.048 E.43078
G1 X111.934 Y119.094 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.597 Y117.051 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I1.036 J.639 P1  F28800
G1 X126.802 Y92.402 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X115.734 Y110.663 E.79533
G2 X113.464 Y118.79 I13.523 J8.159 E.31816
G1 X113.464 Y168.79 E1.8623
G3 X97.984 Y168.79 I-7.74 J0 E.90571
G1 X97.984 Y118.79 E1.8623
M73 P36 R10
G2 X95.713 Y110.663 I-15.794 J.032 E.31816
G1 X84.648 Y92.402 E.79529
G1 X126.742 Y92.402 E1.56785
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X125.709 Y94.115 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I1.138 J.43 P1  F28800
G1 X127.056 Y90.551 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G3 X127.217 Y92.598 I-1.334 J1.135 E.0817
G1 X116.128 Y110.896 E.79693
G2 X113.921 Y118.795 I13.13 J7.926 E.30924
G1 X113.921 Y168.795 E1.86231
G3 X97.526 Y168.795 I-8.197 J-.005 E.95879
G1 X97.526 Y118.795 E1.86231
G2 X95.32 Y110.896 I-15.337 J.027 E.30924
G1 X84.19 Y92.528 E.79994
G3 X84.566 Y90.375 I1.534 J-.841 E.08792
G1 X126.882 Y90.375 E1.5761
G1 X126.897 Y90.388 E.00075
G3 X127.016 Y90.506 I-1.175 J1.299 E.00626
G1 X126.947 Y90.827 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X127.228 Y90.792 E-.0406
G1 X127.385 Y91.138 E-.04329
G1 X127.455 Y91.429 E-.03416
G1 X127.473 Y91.73 E-.03436
G1 X127.439 Y92.033 E-.03471
G1 X127.33 Y92.375 E-.04088
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I.961 J-.746 P1  F28800
G1 X125.883 Y90.512 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.505258
G1 F6300
G1 X127.128 Y91.756 E.06629
G3 X127.079 Y92.059 I-1.469 J-.079 E.01157
G1 X126.777 Y92.059 E.0114
G1 X125.435 Y90.718 E.07146
G1 X124.781 Y90.718 E.02463
G1 X126.123 Y92.059 E.07146
G1 X125.469 Y92.059 E.02463
G1 X124.128 Y90.718 E.07146
G1 X123.474 Y90.718 E.02463
M73 P37 R10
G1 X124.815 Y92.059 E.07146
G1 X124.161 Y92.059 E.02463
G1 X122.82 Y90.718 E.07146
G1 X122.166 Y90.718 E.02463
G1 X123.507 Y92.059 E.07146
G1 X122.853 Y92.059 E.02463
G1 X121.512 Y90.718 E.07146
G1 X120.858 Y90.718 E.02463
G1 X122.2 Y92.059 E.07146
G1 X121.546 Y92.059 E.02463
G1 X120.205 Y90.718 E.07146
G1 X119.551 Y90.718 E.02463
G1 X120.892 Y92.059 E.07146
G1 X120.238 Y92.059 E.02463
G1 X118.897 Y90.718 E.07146
G1 X118.243 Y90.718 E.02463
G1 X119.584 Y92.059 E.07146
G1 X118.93 Y92.059 E.02463
G1 X117.589 Y90.718 E.07146
G1 X116.935 Y90.718 E.02463
G1 X118.277 Y92.059 E.07146
G1 X117.623 Y92.059 E.02463
G1 X116.281 Y90.718 E.07146
G1 X115.628 Y90.718 E.02463
G1 X116.969 Y92.059 E.07146
G1 X116.315 Y92.059 E.02463
M73 P38 R10
G1 X114.974 Y90.718 E.07146
G1 X114.32 Y90.718 E.02463
G1 X115.661 Y92.059 E.07146
G1 X115.007 Y92.059 E.02463
G1 X113.666 Y90.718 E.07146
G1 X113.012 Y90.718 E.02463
G1 X114.353 Y92.059 E.07146
G1 X113.7 Y92.059 E.02463
G1 X112.358 Y90.718 E.07146
G1 X111.705 Y90.718 E.02463
G1 X113.046 Y92.059 E.07146
G1 X112.392 Y92.059 E.02463
G1 X111.051 Y90.718 E.07146
G1 X110.397 Y90.718 E.02463
G1 X111.738 Y92.059 E.07146
G1 X111.084 Y92.059 E.02463
G1 X109.743 Y90.718 E.07146
G1 X109.089 Y90.718 E.02463
G1 X110.43 Y92.059 E.07146
G1 X109.777 Y92.059 E.02463
G1 X108.435 Y90.718 E.07146
G1 X107.781 Y90.718 E.02463
G1 X109.123 Y92.059 E.07146
G1 X108.469 Y92.059 E.02463
G1 X107.128 Y90.718 E.07146
G1 X106.474 Y90.718 E.02463
G1 X107.815 Y92.059 E.07146
G1 X107.161 Y92.059 E.02463
G1 X105.82 Y90.718 E.07146
G1 X105.166 Y90.718 E.02463
G1 X106.507 Y92.059 E.07146
G1 X105.853 Y92.059 E.02463
G1 X104.512 Y90.718 E.07146
G1 X103.858 Y90.718 E.02463
G1 X105.2 Y92.059 E.07146
G1 X104.546 Y92.059 E.02463
G1 X103.205 Y90.718 E.07146
G1 X102.551 Y90.718 E.02463
G1 X103.892 Y92.059 E.07146
G1 X103.238 Y92.059 E.02463
G1 X101.897 Y90.718 E.07146
G1 X101.243 Y90.718 E.02463
G1 X102.584 Y92.059 E.07146
G1 X101.93 Y92.059 E.02463
G1 X100.589 Y90.718 E.07146
G1 X99.935 Y90.718 E.02463
G1 X101.277 Y92.059 E.07146
G1 X100.623 Y92.059 E.02463
G1 X99.282 Y90.718 E.07146
G1 X98.628 Y90.718 E.02463
G1 X99.969 Y92.059 E.07146
G1 X99.315 Y92.059 E.02463
G1 X97.974 Y90.718 E.07146
G1 X97.32 Y90.718 E.02463
G1 X98.661 Y92.059 E.07146
G1 X98.007 Y92.059 E.02463
G1 X96.666 Y90.718 E.07146
G1 X96.012 Y90.718 E.02463
G1 X97.354 Y92.059 E.07146
G1 X96.7 Y92.059 E.02463
G1 X95.358 Y90.718 E.07146
G1 X94.705 Y90.718 E.02463
G1 X96.046 Y92.059 E.07146
G1 X95.392 Y92.059 E.02463
G1 X94.051 Y90.718 E.07146
G1 X93.397 Y90.718 E.02463
G1 X94.738 Y92.059 E.07146
G1 X94.084 Y92.059 E.02463
G1 X92.743 Y90.718 E.07146
G1 X92.089 Y90.718 E.02463
M73 P38 R9
G1 X93.43 Y92.059 E.07146
G1 X92.777 Y92.059 E.02463
G1 X91.435 Y90.718 E.07146
G1 X90.782 Y90.718 E.02463
G1 X92.123 Y92.059 E.07146
G1 X91.469 Y92.059 E.02463
G1 X90.128 Y90.718 E.07146
G1 X89.474 Y90.718 E.02463
G1 X90.815 Y92.059 E.07146
G1 X90.161 Y92.059 E.02463
G1 X88.82 Y90.718 E.07146
G1 X88.166 Y90.718 E.02463
G1 X89.507 Y92.059 E.07146
G1 X88.854 Y92.059 E.02463
G1 X87.512 Y90.718 E.07146
G1 X86.858 Y90.718 E.02463
G1 X88.2 Y92.059 E.07146
G1 X87.546 Y92.059 E.02463
G1 X86.205 Y90.718 E.07146
G1 X85.551 Y90.718 E.02463
G1 X86.892 Y92.059 E.07146
G1 X86.238 Y92.059 E.02463
G1 X84.897 Y90.718 E.07146
G1 X84.703 Y90.718 E.00732
G2 X84.507 Y90.982 I1.133 J1.042 E.01241
G1 X85.584 Y92.059 E.05738
G1 X84.93 Y92.059 E.02463
G1 X84.162 Y91.29 E.04095
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X84.93 Y92.059 E-.12392
G1 X85.584 Y92.059 E-.07454
G1 X85.401 Y91.876 E-.02954
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I-.02 J1.217 P1  F28800
G1 X125.646 Y92.539 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.502715
G1 F6300
G1 X126.065 Y92.957 E.02215
G1 X125.819 Y93.362 E.01774
G1 X125.202 Y92.744 E.03271
G1 X124.552 Y92.744 E.02436
G1 X125.574 Y93.767 E.05416
G1 X125.328 Y94.171 E.01774
G1 X123.901 Y92.744 E.07561
G1 X123.251 Y92.744 E.02436
G1 X125.083 Y94.576 E.09707
G1 X124.838 Y94.981 E.01774
G1 X122.601 Y92.744 E.11852
G1 X121.951 Y92.744 E.02436
G1 X124.592 Y95.386 E.13997
G1 X124.347 Y95.791 E.01774
G1 X121.3 Y92.744 E.16143
G1 X120.65 Y92.744 E.02436
G1 X124.102 Y96.196 E.18288
G1 X123.856 Y96.601 E.01774
G1 X120 Y92.744 E.20433
G1 X119.35 Y92.744 E.02436
G1 X123.611 Y97.006 E.22578
G1 X123.365 Y97.41 E.01774
G1 X118.699 Y92.744 E.24724
G1 X118.049 Y92.744 E.02436
G1 X123.12 Y97.815 E.26869
G1 X122.875 Y98.22 E.01774
G1 X117.399 Y92.744 E.29014
G1 X116.749 Y92.744 E.02436
G1 X122.629 Y98.625 E.3116
G1 X122.384 Y99.03 E.01774
G1 X116.098 Y92.744 E.33305
G1 X115.448 Y92.744 E.02436
G1 X122.139 Y99.435 E.3545
G1 X121.893 Y99.84 E.01774
G1 X114.798 Y92.744 E.37596
G1 X114.148 Y92.744 E.02436
G1 X121.648 Y100.245 E.39741
G1 X121.402 Y100.649 E.01774
G1 X113.497 Y92.744 E.41886
G1 X112.847 Y92.744 E.02436
G1 X121.157 Y101.054 E.44031
G1 X120.912 Y101.459 E.01774
G1 X112.197 Y92.744 E.46177
G1 X111.547 Y92.744 E.02436
G1 X120.666 Y101.864 E.48322
G1 X120.421 Y102.269 E.01774
G1 X110.896 Y92.744 E.50467
G1 X110.246 Y92.744 E.02436
M73 P39 R9
G1 X120.176 Y102.674 E.52613
G1 X119.93 Y103.079 E.01774
G1 X109.596 Y92.744 E.54758
G1 X108.946 Y92.744 E.02436
G1 X119.685 Y103.483 E.56903
G1 X119.439 Y103.888 E.01774
G1 X108.295 Y92.744 E.59048
G1 X107.645 Y92.744 E.02436
G1 X118.136 Y103.235 E.55587
G1 X118.783 Y103.235 E.02423
G1 X118.539 Y103.638 E.01764
G1 X119.194 Y104.293 E.03473
G1 X118.949 Y104.698 E.01774
G1 X118.293 Y104.043 E.03473
G1 X118.048 Y104.448 E.01774
G1 X118.703 Y105.103 E.03473
G1 X118.458 Y105.508 E.01774
G1 X117.802 Y104.852 E.03473
G1 X117.557 Y105.257 E.01774
G1 X118.212 Y105.913 E.03473
G1 X117.967 Y106.318 E.01774
G1 X117.312 Y105.662 E.03473
G1 X117.066 Y106.067 E.01774
G1 X117.722 Y106.722 E.03473
G1 X117.476 Y107.127 E.01774
G1 X116.821 Y106.472 E.03473
G1 X116.576 Y106.877 E.01774
G1 X117.231 Y107.532 E.03473
G1 X116.986 Y107.937 E.01774
G1 X116.33 Y107.282 E.03473
G1 X116.085 Y107.687 E.01774
G1 X116.74 Y108.342 E.03473
G1 X116.495 Y108.747 E.01774
G1 X115.839 Y108.091 E.03473
G1 X115.594 Y108.496 E.01774
G1 X116.249 Y109.152 E.03473
G1 X116.004 Y109.557 E.01774
G1 X115.349 Y108.901 E.03473
G1 X115.103 Y109.306 E.01774
G1 X115.759 Y109.961 E.03473
G1 X115.513 Y110.366 E.01774
G1 X114.858 Y109.711 E.03473
G2 X114.615 Y110.118 I9.575 J6.003 E.01777
G1 X115.273 Y110.776 E.03489
G2 X115.039 Y111.193 I4.854 J2.994 E.0179
G1 X114.376 Y110.53 E.03513
G2 X114.15 Y110.954 I4.808 J2.843 E.01801
G1 X114.816 Y111.62 E.0353
G2 X114.607 Y112.061 I5.148 J2.717 E.01829
G1 X113.931 Y111.385 E.03582
G1 X113.722 Y111.827 E.01831
G1 X114.407 Y112.511 E.03626
G2 X114.217 Y112.972 I5.399 J2.492 E.01867
G1 X113.527 Y112.282 E.03656
G2 X113.342 Y112.746 I5.311 J2.394 E.01875
G1 X114.041 Y113.446 E.03706
G2 X113.879 Y113.934 I5.738 J2.175 E.01928
G1 X113.166 Y113.221 E.03779
G2 X113.005 Y113.711 I5.902 J2.199 E.01932
G1 X113.729 Y114.434 E.03833
G2 X113.592 Y114.947 I6.048 J1.889 E.01991
G1 X112.857 Y114.212 E.03895
G2 X112.72 Y114.726 I6.048 J1.888 E.01991
G1 X113.469 Y115.475 E.03969
G1 X113.365 Y116.021 E.02083
G1 X112.596 Y115.252 E.04071
G2 X112.491 Y115.798 I6.442 J1.523 E.02081
G1 X113.277 Y116.583 E.04164
G2 X113.208 Y117.164 I6.883 J1.12 E.02192
G1 X112.448 Y116.404 E.04025
G1 X112.422 Y117.028 E.0234
G1 X113.158 Y117.764 E.03899
G2 X113.129 Y118.386 I7.398 J.647 E.02334
G1 X112.396 Y117.653 E.03888
G1 X112.369 Y118.277 E.0234
G1 X113.121 Y119.028 E.03983
G1 X113.121 Y119.678 E.02436
G1 X112.343 Y118.901 E.04121
G1 X112.317 Y119.525 E.0234
G1 X113.121 Y120.329 E.0426
G1 X113.121 Y120.979 E.02436
G1 X111.99 Y119.847 E.05995
G1 X111.339 Y119.847 E.02436
G1 X113.121 Y121.629 E.09441
G1 X113.121 Y122.279 E.02436
G1 X112.221 Y121.379 E.0477
G1 X112.221 Y120.748 E.02366
G1 X111.589 Y120.748 E.02366
G1 X110.689 Y119.847 E.0477
G1 X110.039 Y119.847 E.02436
G1 X110.939 Y120.748 E.0477
G1 X110.289 Y120.748 E.02436
G1 X109.389 Y119.847 E.0477
G1 X108.738 Y119.847 E.02436
G1 X109.639 Y120.748 E.0477
G1 X108.988 Y120.748 E.02436
G1 X108.088 Y119.847 E.0477
G1 X107.438 Y119.847 E.02436
M73 P40 R9
G1 X108.338 Y120.748 E.0477
G1 X107.688 Y120.748 E.02436
G1 X106.788 Y119.847 E.0477
G1 X106.137 Y119.847 E.02436
G1 X107.038 Y120.748 E.0477
G1 X106.387 Y120.748 E.02436
G1 X105.487 Y119.847 E.0477
G1 X104.837 Y119.847 E.02436
G1 X105.737 Y120.748 E.0477
G1 X105.087 Y120.748 E.02436
G1 X104.187 Y119.847 E.0477
G1 X103.536 Y119.847 E.02436
G1 X104.437 Y120.748 E.0477
G1 X103.786 Y120.748 E.02436
G1 X102.886 Y119.847 E.0477
G1 X102.236 Y119.847 E.02436
G1 X103.136 Y120.748 E.0477
G1 X102.486 Y120.748 E.02436
G1 X101.586 Y119.847 E.0477
G1 X100.935 Y119.847 E.02436
G1 X101.836 Y120.748 E.0477
G1 X101.185 Y120.748 E.02436
G1 X100.079 Y119.642 E.0586
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X101.185 Y120.748 E-.1783
G1 X101.621 Y120.748 E-.0497
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I.892 J.828 P1  F28800
G1 X117.691 Y103.441 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X106.995 Y92.744 E.56677
G1 X106.345 Y92.744 E.02436
G1 X116.835 Y103.235 E.55587
G1 X116.185 Y103.235 E.02436
G1 X105.694 Y92.744 E.55587
G1 X105.044 Y92.744 E.02436
G1 X115.535 Y103.235 E.55587
G1 X114.885 Y103.235 E.02436
G1 X104.394 Y92.744 E.55587
G1 X103.744 Y92.744 E.02436
G1 X114.234 Y103.235 E.55587
G1 X113.584 Y103.235 E.02436
G1 X103.093 Y92.744 E.55587
G1 X102.443 Y92.744 E.02436
G1 X112.934 Y103.235 E.55587
G1 X112.284 Y103.235 E.02436
G1 X101.793 Y92.744 E.55587
G1 X101.143 Y92.744 E.02436
G1 X111.633 Y103.235 E.55587
G1 X110.983 Y103.235 E.02436
G1 X100.492 Y92.744 E.55587
G1 X99.842 Y92.744 E.02436
G1 X110.333 Y103.235 E.55587
G1 X109.683 Y103.235 E.02436
G1 X99.192 Y92.744 E.55587
G1 X98.542 Y92.744 E.02436
G1 X109.032 Y103.235 E.55587
G1 X108.382 Y103.235 E.02436
G1 X97.891 Y92.744 E.55587
G1 X97.241 Y92.744 E.02436
G1 X107.732 Y103.235 E.55587
G1 X107.082 Y103.235 E.02436
G1 X96.591 Y92.744 E.55587
G1 X95.941 Y92.744 E.02436
G1 X106.431 Y103.235 E.55587
G1 X105.781 Y103.235 E.02436
G1 X95.29 Y92.744 E.55587
G1 X94.64 Y92.744 E.02436
G1 X105.131 Y103.235 E.55587
G1 X104.481 Y103.235 E.02436
G1 X93.99 Y92.744 E.55587
G1 X93.34 Y92.744 E.02436
G1 X103.83 Y103.235 E.55587
G1 X103.18 Y103.235 E.02436
G1 X92.689 Y92.744 E.55587
G1 X92.039 Y92.744 E.02436
G1 X102.53 Y103.235 E.55587
G1 X101.88 Y103.235 E.02436
G1 X91.389 Y92.744 E.55587
G1 X90.739 Y92.744 E.02436
G1 X101.229 Y103.235 E.55587
G1 X100.579 Y103.235 E.02436
G1 X90.088 Y92.744 E.55587
G1 X89.438 Y92.744 E.02436
G1 X99.929 Y103.235 E.55587
G1 X99.279 Y103.235 E.02436
G1 X88.788 Y92.744 E.55587
G1 X88.138 Y92.744 E.02436
G1 X98.628 Y103.235 E.55587
G1 X97.978 Y103.235 E.02436
G1 X87.487 Y92.744 E.55587
G1 X86.837 Y92.744 E.02436
G1 X97.328 Y103.235 E.55587
G1 X96.678 Y103.235 E.02436
G1 X86.187 Y92.744 E.55587
G1 X85.537 Y92.744 E.02436
G1 X96.027 Y103.235 E.55587
G1 X95.377 Y103.235 E.02436
G1 X85.825 Y93.683 E.50617
G1 X86.824 Y95.333 E.07229
G1 X94.727 Y103.235 E.41873
G1 X94.077 Y103.235 E.02436
G1 X87.824 Y96.983 E.33129
G1 X88.824 Y98.633 E.07229
G1 X93.426 Y103.235 E.24386
G1 X92.776 Y103.235 E.02436
G1 X89.824 Y100.283 E.15642
G1 X90.824 Y101.933 E.07229
G1 X93.494 Y104.603 E.14146
M73 P41 R9
G1 X94.494 Y106.253 E.07232
G1 X91.824 Y103.583 E.14148
G1 X92.824 Y105.233 E.07229
G1 X95.494 Y107.904 E.14151
G1 X96.495 Y109.555 E.07232
G1 X93.824 Y106.884 E.14154
G1 X94.824 Y108.534 E.07229
G1 X97.358 Y111.068 E.13427
G3 X97.919 Y112.279 I-15.546 J7.938 E.05004
G1 X95.823 Y110.184 E.11103
G3 X96.654 Y111.665 I-17.041 J10.534 E.06366
G1 X98.318 Y113.328 E.08812
G3 X98.606 Y114.267 I-11.043 J3.904 E.03679
G1 X97.179 Y112.84 E.07561
G3 X97.542 Y113.853 I-18.309 J7.134 E.04034
G1 X98.823 Y115.134 E.0679
G3 X98.98 Y115.941 I-18.046 J3.921 E.0308
G1 X97.814 Y114.775 E.0618
G3 X98.006 Y115.617 I-24.652 J6.063 E.03237
G1 X99.008 Y116.62 E.05313
G1 X99.037 Y117.299 E.02545
G1 X98.144 Y116.406 E.04732
G3 X98.238 Y117.15 I-8.832 J1.499 E.02813
G1 X99.065 Y117.978 E.04382
G1 X99.094 Y118.656 E.02545
G1 X98.296 Y117.858 E.04229
G3 X98.321 Y118.534 I-8.04 J.64 E.02534
G1 X99.122 Y119.335 E.04246
G1 X99.144 Y119.847 E.01922
G1 X99.635 Y119.847 E.0184
G1 X100.535 Y120.748 E.0477
G1 X99.885 Y120.748 E.02436
G1 X98.326 Y119.189 E.08258
G1 X98.326 Y119.839 E.02436
G1 X99.235 Y120.748 E.04813
G1 X99.227 Y121.39 E.02406
G1 X98.326 Y120.49 E.0477
G1 X98.326 Y121.14 E.02436
G1 X99.227 Y122.04 E.0477
G1 X99.227 Y122.69 E.02436
G1 X98.326 Y121.79 E.0477
G1 X98.326 Y122.44 E.02436
G1 X99.227 Y123.341 E.0477
G1 X99.227 Y123.991 E.02436
G1 X98.326 Y123.091 E.0477
G1 X98.326 Y123.741 E.02436
G1 X99.227 Y124.641 E.0477
G1 X99.227 Y125.291 E.02436
G1 X98.326 Y124.391 E.0477
G1 X98.326 Y125.041 E.02436
G1 X99.227 Y125.942 E.0477
G1 X99.227 Y126.592 E.02436
G1 X98.326 Y125.692 E.0477
G1 X98.326 Y126.342 E.02436
G1 X99.227 Y127.242 E.0477
G1 X99.227 Y127.892 E.02436
G1 X98.326 Y126.992 E.0477
G1 X98.326 Y127.642 E.02436
G1 X99.227 Y128.543 E.0477
G1 X99.227 Y129.193 E.02436
G1 X98.326 Y128.293 E.0477
G1 X98.326 Y128.943 E.02436
G1 X99.227 Y129.843 E.0477
G1 X99.227 Y130.493 E.02436
G1 X98.326 Y129.593 E.0477
G1 X98.326 Y130.243 E.02436
G1 X99.227 Y131.144 E.0477
G1 X99.227 Y131.794 E.02436
M73 P42 R9
G1 X98.326 Y130.894 E.0477
G1 X98.326 Y131.544 E.02436
G1 X99.227 Y132.444 E.0477
G1 X99.227 Y133.094 E.02436
G1 X98.326 Y132.194 E.0477
G1 X98.326 Y132.844 E.02436
G1 X99.227 Y133.745 E.0477
G1 X99.227 Y134.395 E.02436
G1 X98.326 Y133.495 E.0477
G1 X98.326 Y134.145 E.02436
G1 X99.227 Y135.045 E.0477
G1 X99.227 Y135.695 E.02436
G1 X98.326 Y134.795 E.0477
G1 X98.326 Y135.445 E.02436
G1 X99.227 Y136.346 E.0477
G1 X99.227 Y136.996 E.02436
G1 X98.326 Y136.096 E.0477
G1 X98.326 Y136.746 E.02436
G1 X99.227 Y137.646 E.0477
G1 X99.227 Y138.296 E.02436
G1 X98.326 Y137.396 E.0477
G1 X98.326 Y138.046 E.02436
G1 X99.227 Y138.947 E.0477
G1 X99.227 Y139.597 E.02436
G1 X98.326 Y138.697 E.0477
G1 X98.326 Y139.347 E.02436
G1 X99.227 Y140.247 E.0477
G1 X99.227 Y140.897 E.02436
G1 X98.326 Y139.997 E.0477
G1 X98.326 Y140.647 E.02436
G1 X99.227 Y141.548 E.0477
G1 X99.227 Y142.198 E.02436
G1 X98.326 Y141.298 E.0477
G1 X98.326 Y141.948 E.02436
G1 X99.227 Y142.848 E.0477
G1 X99.227 Y143.498 E.02436
G1 X98.326 Y142.598 E.0477
G1 X98.326 Y143.248 E.02436
G1 X99.227 Y144.149 E.0477
G1 X99.227 Y144.799 E.02436
G1 X98.326 Y143.899 E.0477
G1 X98.326 Y144.549 E.02436
G1 X99.227 Y145.449 E.0477
G1 X99.227 Y146.099 E.02436
G1 X98.326 Y145.199 E.0477
G1 X98.326 Y145.849 E.02436
G1 X99.227 Y146.75 E.0477
G1 X99.227 Y147.4 E.02436
G1 X98.326 Y146.5 E.0477
G1 X98.326 Y147.15 E.02436
G1 X99.227 Y148.05 E.0477
G1 X99.227 Y148.7 E.02436
G1 X98.326 Y147.8 E.0477
G1 X98.326 Y148.45 E.02436
G1 X99.227 Y149.351 E.0477
G1 X99.227 Y150.001 E.02436
G1 X98.326 Y149.101 E.0477
G1 X98.326 Y149.751 E.02436
G1 X99.227 Y150.651 E.0477
G1 X99.227 Y151.301 E.02436
G1 X98.326 Y150.401 E.0477
G1 X98.326 Y151.051 E.02436
G1 X99.227 Y151.952 E.0477
G1 X99.227 Y152.602 E.02436
G1 X98.326 Y151.702 E.0477
G1 X98.326 Y152.352 E.02436
G1 X99.227 Y153.252 E.0477
G1 X99.227 Y153.902 E.02436
G1 X98.326 Y153.002 E.0477
G1 X98.326 Y153.652 E.02436
G1 X99.227 Y154.553 E.0477
G1 X99.227 Y155.203 E.02436
G1 X98.326 Y154.303 E.0477
G1 X98.326 Y154.953 E.02436
G1 X99.227 Y155.853 E.0477
G1 X99.227 Y156.503 E.02436
G1 X98.326 Y155.603 E.0477
G1 X98.326 Y156.253 E.02436
G1 X99.227 Y157.154 E.0477
G1 X99.227 Y157.804 E.02436
G1 X98.326 Y156.904 E.0477
G1 X98.326 Y157.554 E.02436
G1 X99.227 Y158.454 E.0477
G1 X99.227 Y159.104 E.02436
G1 X98.326 Y158.204 E.0477
G1 X98.326 Y158.854 E.02436
G1 X99.227 Y159.755 E.0477
G1 X99.227 Y160.405 E.02436
G1 X98.326 Y159.505 E.0477
G1 X98.326 Y160.155 E.02436
G1 X99.227 Y161.055 E.0477
G1 X99.227 Y161.705 E.02436
G1 X98.326 Y160.805 E.0477
G1 X98.326 Y161.455 E.02436
G1 X99.227 Y162.356 E.0477
G1 X99.227 Y163.006 E.02436
G1 X98.326 Y162.106 E.0477
G1 X98.326 Y162.756 E.02436
G1 X99.227 Y163.656 E.0477
G1 X99.227 Y164.306 E.02436
G1 X98.326 Y163.406 E.0477
G1 X98.326 Y164.056 E.02436
G1 X99.227 Y164.957 E.0477
G1 X99.227 Y165.607 E.02436
G1 X98.326 Y164.707 E.0477
G1 X98.326 Y165.357 E.02436
G1 X99.227 Y166.257 E.0477
G1 X99.227 Y166.907 E.02436
G1 X98.326 Y166.007 E.0477
G1 X98.326 Y166.657 E.02436
G1 X99.227 Y167.558 E.0477
G1 X99.227 Y168.208 E.02436
G1 X98.326 Y167.308 E.0477
G1 X98.326 Y167.958 E.02436
G1 X99.229 Y168.861 E.04786
G1 X99.275 Y169.557 E.02614
G1 X98.326 Y168.608 E.05029
G2 X98.348 Y169.28 I7.654 J.091 E.02519
G1 X99.42 Y170.352 E.0568
G2 X99.754 Y171.336 I4.66 J-1.032 E.03902
G1 X98.184 Y169.766 E.08318
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X99.598 Y171.18 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.6 I1.17 J.334 P1  F28800
G1 X113.327 Y123.135 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X112.221 Y122.029 E.0586
G1 X112.221 Y122.68 E.02436
G1 X113.121 Y123.58 E.0477
G1 X113.121 Y124.23 E.02436
G1 X112.221 Y123.33 E.0477
G1 X112.221 Y123.98 E.02436
G1 X113.121 Y124.88 E.0477
G1 X113.121 Y125.531 E.02436
G1 X112.221 Y124.63 E.0477
G1 X112.221 Y125.281 E.02436
G1 X113.121 Y126.181 E.0477
G1 X113.121 Y126.831 E.02436
G1 X112.221 Y125.931 E.0477
G1 X112.221 Y126.581 E.02436
G1 X113.121 Y127.481 E.0477
G1 X113.121 Y128.132 E.02436
G1 X112.221 Y127.231 E.0477
G1 X112.221 Y127.882 E.02436
G1 X113.121 Y128.782 E.0477
G1 X113.121 Y129.432 E.02436
G1 X112.221 Y128.532 E.0477
G1 X112.221 Y129.182 E.02436
G1 X113.121 Y130.082 E.0477
G1 X113.121 Y130.733 E.02436
G1 X112.221 Y129.832 E.0477
G1 X112.221 Y130.483 E.02436
G1 X113.121 Y131.383 E.0477
G1 X113.121 Y132.033 E.02436
G1 X112.221 Y131.133 E.0477
G1 X112.221 Y131.783 E.02436
G1 X113.121 Y132.683 E.0477
G1 X113.121 Y133.334 E.02436
G1 X112.221 Y132.433 E.0477
G1 X112.221 Y133.084 E.02436
G1 X113.121 Y133.984 E.0477
G1 X113.121 Y134.634 E.02436
G1 X112.221 Y133.734 E.0477
G1 X112.221 Y134.384 E.02436
G1 X113.121 Y135.284 E.0477
G1 X113.121 Y135.935 E.02436
G1 X112.221 Y135.034 E.0477
G1 X112.221 Y135.685 E.02436
G1 X113.121 Y136.585 E.0477
G1 X113.121 Y137.235 E.02436
G1 X112.221 Y136.335 E.0477
G1 X112.221 Y136.985 E.02436
G1 X113.121 Y137.885 E.0477
G1 X113.121 Y138.536 E.02436
M73 P43 R9
G1 X112.221 Y137.635 E.0477
G1 X112.221 Y138.286 E.02436
G1 X113.121 Y139.186 E.0477
G1 X113.121 Y139.836 E.02436
G1 X112.221 Y138.936 E.0477
G1 X112.221 Y139.586 E.02436
G1 X113.121 Y140.486 E.0477
G1 X113.121 Y141.137 E.02436
G1 X112.221 Y140.236 E.0477
G1 X112.221 Y140.887 E.02436
G1 X113.121 Y141.787 E.0477
G1 X113.121 Y142.437 E.02436
G1 X112.221 Y141.537 E.0477
G1 X112.221 Y142.187 E.02436
G1 X113.121 Y143.087 E.0477
G1 X113.121 Y143.738 E.02436
G1 X112.221 Y142.837 E.0477
G1 X112.221 Y143.488 E.02436
G1 X113.121 Y144.388 E.0477
G1 X113.121 Y145.038 E.02436
G1 X112.221 Y144.138 E.0477
G1 X112.221 Y144.788 E.02436
G1 X113.121 Y145.688 E.0477
G1 X113.121 Y146.339 E.02436
G1 X112.221 Y145.438 E.0477
G1 X112.221 Y146.089 E.02436
G1 X113.121 Y146.989 E.0477
G1 X113.121 Y147.639 E.02436
G1 X112.221 Y146.739 E.0477
G1 X112.221 Y147.389 E.02436
G1 X113.121 Y148.289 E.0477
G1 X113.121 Y148.94 E.02436
G1 X112.221 Y148.039 E.0477
G1 X112.221 Y148.69 E.02436
G1 X113.121 Y149.59 E.0477
G1 X113.121 Y150.24 E.02436
G1 X112.221 Y149.34 E.0477
G1 X112.221 Y149.99 E.02436
G1 X113.121 Y150.89 E.0477
G1 X113.121 Y151.541 E.02436
G1 X112.221 Y150.64 E.0477
G1 X112.221 Y151.291 E.02436
G1 X113.121 Y152.191 E.0477
G1 X113.121 Y152.841 E.02436
G1 X112.221 Y151.941 E.0477
G1 X112.221 Y152.591 E.02436
G1 X113.121 Y153.491 E.0477
G1 X113.121 Y154.142 E.02436
G1 X112.221 Y153.241 E.0477
G1 X112.221 Y153.892 E.02436
G1 X113.121 Y154.792 E.0477
G1 X113.121 Y155.442 E.02436
G1 X112.221 Y154.542 E.0477
G1 X112.221 Y155.192 E.02436
G1 X113.121 Y156.092 E.0477
G1 X113.121 Y156.743 E.02436
G1 X112.221 Y155.842 E.0477
G1 X112.221 Y156.493 E.02436
G1 X113.121 Y157.393 E.0477
G1 X113.121 Y158.043 E.02436
G1 X112.221 Y157.143 E.0477
G1 X112.221 Y157.793 E.02436
G1 X113.121 Y158.693 E.0477
G1 X113.121 Y159.344 E.02436
G1 X112.221 Y158.443 E.0477
G1 X112.221 Y159.094 E.02436
G1 X113.121 Y159.994 E.0477
G1 X113.121 Y160.644 E.02436
G1 X112.221 Y159.744 E.0477
G1 X112.221 Y160.394 E.02436
G1 X113.121 Y161.294 E.0477
G1 X113.121 Y161.945 E.02436
G1 X112.221 Y161.044 E.0477
G1 X112.221 Y161.695 E.02436
G1 X113.121 Y162.595 E.0477
G1 X113.121 Y163.245 E.02436
G1 X112.221 Y162.345 E.0477
G1 X112.221 Y162.995 E.02436
G1 X113.121 Y163.895 E.0477
G1 X113.121 Y164.546 E.02436
G1 X112.221 Y163.645 E.0477
G1 X112.221 Y164.296 E.02436
G1 X113.121 Y165.196 E.0477
G1 X113.121 Y165.846 E.02436
G1 X112.221 Y164.946 E.0477
G1 X112.221 Y165.596 E.02436
G1 X113.121 Y166.496 E.0477
G1 X113.121 Y167.147 E.02436
G1 X112.221 Y166.246 E.0477
G1 X112.221 Y166.897 E.02436
G1 X113.121 Y167.797 E.0477
G1 X113.121 Y168.447 E.02436
G1 X112.221 Y167.547 E.0477
G1 X112.221 Y168.197 E.02436
G1 X113.108 Y169.084 E.04701
G3 X113.06 Y169.687 I-3.458 J.029 E.02267
G1 X112.219 Y168.846 E.04456
G3 X112.184 Y169.461 I-3.545 J.104 E.0231
G1 X112.971 Y170.248 E.04173
G3 X112.85 Y170.777 I-4.098 J-.663 E.02034
G1 X112.1 Y170.027 E.03973
G3 X111.976 Y170.554 I-3.071 J-.444 E.02029
G1 X112.689 Y171.266 E.03777
G3 X112.508 Y171.735 I-2.769 J-.803 E.01886
G1 X111.819 Y171.046 E.03651
G1 X111.628 Y171.506 E.01865
G1 X112.301 Y172.179 E.03565
G3 X112.065 Y172.593 I-2.488 J-1.139 E.01789
G1 X111.408 Y171.936 E.03482
G3 X111.163 Y172.341 I-2.438 J-1.199 E.01776
G1 X111.81 Y172.989 E.03431
G3 X111.537 Y173.366 I-2.291 J-1.372 E.01747
G1 X110.894 Y172.723 E.03408
G3 X110.603 Y173.082 I-2.197 J-1.486 E.01734
G1 X111.241 Y173.719 E.0338
G3 X110.922 Y174.051 I-2.053 J-1.658 E.01725
G1 X110.289 Y173.418 E.03349
G1 X109.95 Y173.729 E.01724
G1 X110.586 Y174.365 E.03367
G1 X110.232 Y174.661 E.01729
G1 X109.586 Y174.016 E.0342
G3 X109.195 Y174.275 I-1.382 J-1.661 E.01761
G1 X109.851 Y174.93 E.03472
G1 X109.453 Y175.184 E.01765
G1 X108.791 Y174.521 E.03511
G3 X108.354 Y174.734 I-1.186 J-1.881 E.01826
G1 X109.03 Y175.41 E.03582
G1 X108.586 Y175.617 E.01833
G1 X107.888 Y174.918 E.03701
G3 X107.391 Y175.071 I-1.125 J-2.763 E.01951
G1 X108.112 Y175.793 E.03821
G3 X107.611 Y175.942 I-1.107 J-2.785 E.0196
G1 X106.858 Y175.189 E.03991
G3 X106.278 Y175.259 I-.61 J-2.613 E.02194
G1 X107.081 Y176.062 E.04254
G3 X106.515 Y176.146 I-.765 J-3.193 E.02147
G1 X105.661 Y175.292 E.04525
G3 X104.963 Y175.245 I-.077 J-4.011 E.02624
G1 X105.906 Y176.187 E.04994
G3 X105.246 Y176.178 I-.254 J-5.04 E.02476
G1 X104.17 Y175.102 E.05697
G3 X103.194 Y174.776 I1.689 J-6.679 E.03862
G1 X104.509 Y176.091 E.06971
G3 X103.664 Y175.896 I.996 J-6.24 E.03254
G1 X98.625 Y170.858 E.26698
G2 X99.003 Y171.886 I8.661 J-2.601 E.04108
G1 X102.623 Y175.505 E.19178
G3 X100.539 Y174.072 I3.212 J-6.901 E.09522
G1 X99.268 Y172.802 E.0673
M106 S178.5
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.35
; LAYER_HEIGHT: 0.15
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X100.539 Y174.072 E-.20477
G1 X100.686 Y174.212 E-.02323
; WIPE_END
G1 E-.012 F1800

; open powerlost recovery
M1003 S1
M204 S10000
G17
G3 Z.6 I1.191 J.249 P1  F28800
G1 X111.784 Y121.185 Z.6
G1 Z.35
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.664 Y121.185 E.30948
G1 X99.664 Y168.804 E1.21595
G2 X111.784 Y168.804 I6.06 J-.012 E.48551
G1 X111.784 Y121.245 E1.21441
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.26817
M73 P44 R9
G1 X100.066 Y168.8 E1.11899
G2 X111.381 Y168.8 I5.657 J-.008 E.42087
G1 X111.381 Y121.648 E1.11757
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.75 I.81 J.908 P1  F28800
G1 X111.876 Y119.41 Z.75
G1 Z.35
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X111.884 Y119.41 E.00021
G1 X112.033 Y115.868 E.09053
G3 X114.305 Y109.78 I17.387 J3.02 E.16687
G1 X118.007 Y103.672 E.18238
G1 X93.441 Y103.672 E.62728
G1 X97.143 Y109.78 E.18238
G3 X99.414 Y115.868 I-15.059 J9.087 E.16688
G1 X99.563 Y119.41 E.09053
G1 X111.816 Y119.41 E.31288
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.07557
G3 X113.958 Y109.575 I17.801 J3.072 E.1589
G1 X117.292 Y104.075 E.15243
G1 X94.156 Y104.075 E.54834
G1 X97.489 Y109.575 E.15243
G3 X99.816 Y115.822 I-15.418 J9.298 E.1589
G1 X99.949 Y119.008 E.07557
G1 X111.438 Y119.008 E.2723
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.75 I1.032 J.644 P1  F28800
G1 X126.531 Y93.028 Z.75
G1 Z.35
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X115.816 Y110.711 E.52796
G2 X113.558 Y118.791 I13.442 J8.111 E.21686
G1 X113.558 Y168.791 E1.27672
G3 X97.889 Y168.791 I-7.834 J-.001 E.62843
G1 X97.889 Y118.791 E1.27672
G2 X95.632 Y110.711 I-15.7 J.031 E.21686
G1 X84.917 Y93.028 E.52796
G1 X126.471 Y93.028 E1.06106
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X125.438 Y94.741 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.75 I1.042 J.629 P1  F28800
G1 X127.482 Y91.359 Z.75
G1 Z.35
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.494 Y91.426 E.00162
G3 X127.293 Y92.547 I-1.908 J.236 E.02741
G1 X116.162 Y110.916 E.50906
G2 X113.961 Y118.795 I13.095 J7.906 E.19629
G1 X113.961 Y168.795 E1.18506
G3 X97.486 Y168.795 I-8.237 J-.006 E.61308
G1 X97.486 Y118.795 E1.18506
G2 X95.285 Y110.916 I-15.297 J.026 E.19629
G1 X84.154 Y92.547 E.50906
G3 X83.964 Y91.359 I1.574 J-.861 E.02908
G1 X127.422 Y91.359 E1.03
G1 X127.455 Y91.422 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X127.494 Y91.426 E-.01128
G1 X127.513 Y91.734 E-.03519
G1 X127.478 Y92.041 E-.03519
G1 X127.418 Y92.262 E-.02616
G1 X127.293 Y92.547 E-.03545
G1 X126.908 Y93.182 E-.08472
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.75 I.707 J-.99 P1  F28800
G1 X126.371 Y92.799 Z.75
G1 Z.35
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X127.287 Y91.884 E.03068
G1 X127.05 Y91.572
G1 X125.823 Y92.799 E.04114
G1 X125.275 Y92.799
G1 X126.502 Y91.572 E.04114
G1 X125.953 Y91.572
G1 X124.726 Y92.799 E.04114
G1 X124.178 Y92.799
G1 X125.405 Y91.572 E.04114
G1 X124.857 Y91.572
G1 X123.629 Y92.799 E.04114
G1 X123.081 Y92.799
G1 X124.308 Y91.572 E.04114
G1 X123.76 Y91.572
G1 X122.532 Y92.799 E.04114
G1 X121.984 Y92.799
G1 X123.211 Y91.572 E.04114
G1 X122.663 Y91.572
G1 X121.435 Y92.799 E.04114
G1 X120.887 Y92.799
G1 X122.114 Y91.572 E.04114
G1 X121.566 Y91.572
M73 P44 R8
G1 X120.339 Y92.799 E.04114
G1 X119.79 Y92.799
G1 X121.017 Y91.572 E.04114
G1 X120.469 Y91.572
G1 X119.242 Y92.799 E.04114
G1 X118.693 Y92.799
G1 X119.921 Y91.572 E.04114
G1 X119.372 Y91.572
G1 X118.145 Y92.799 E.04114
G1 X117.596 Y92.799
G1 X118.824 Y91.572 E.04114
G1 X118.275 Y91.572
G1 X117.048 Y92.799 E.04114
G1 X116.499 Y92.799
G1 X117.727 Y91.572 E.04114
G1 X117.178 Y91.572
G1 X115.951 Y92.799 E.04114
G1 X115.403 Y92.799
G1 X116.63 Y91.572 E.04114
G1 X116.081 Y91.572
G1 X114.854 Y92.799 E.04114
G1 X114.306 Y92.799
G1 X115.533 Y91.572 E.04114
G1 X114.985 Y91.572
G1 X113.757 Y92.799 E.04114
G1 X113.209 Y92.799
G1 X114.436 Y91.572 E.04114
G1 X113.888 Y91.572
G1 X112.66 Y92.799 E.04114
G1 X112.112 Y92.799
G1 X113.339 Y91.572 E.04114
G1 X112.791 Y91.572
G1 X111.563 Y92.799 E.04114
G1 X111.015 Y92.799
G1 X112.242 Y91.572 E.04114
G1 X111.694 Y91.572
G1 X110.467 Y92.799 E.04114
G1 X109.918 Y92.799
G1 X111.145 Y91.572 E.04114
G1 X110.597 Y91.572
G1 X109.37 Y92.799 E.04114
G1 X108.821 Y92.799
G1 X110.049 Y91.572 E.04114
G1 X109.5 Y91.572
G1 X108.273 Y92.799 E.04114
G1 X107.724 Y92.799
G1 X108.952 Y91.572 E.04114
G1 X108.403 Y91.572
G1 X107.176 Y92.799 E.04114
G1 X106.627 Y92.799
G1 X107.855 Y91.572 E.04114
G1 X107.306 Y91.572
G1 X106.079 Y92.799 E.04114
G1 X105.531 Y92.799
G1 X106.758 Y91.572 E.04114
G1 X106.209 Y91.572
G1 X104.982 Y92.799 E.04114
G1 X104.434 Y92.799
G1 X105.661 Y91.572 E.04114
G1 X105.113 Y91.572
G1 X103.885 Y92.799 E.04114
G1 X103.337 Y92.799
G1 X104.564 Y91.572 E.04114
G1 X104.016 Y91.572
G1 X102.788 Y92.799 E.04114
G1 X102.24 Y92.799
G1 X103.467 Y91.572 E.04114
G1 X102.919 Y91.572
G1 X101.691 Y92.799 E.04114
G1 X101.143 Y92.799
G1 X102.37 Y91.572 E.04114
G1 X101.822 Y91.572
G1 X100.595 Y92.799 E.04114
G1 X100.046 Y92.799
G1 X101.273 Y91.572 E.04114
G1 X100.725 Y91.572
G1 X99.498 Y92.799 E.04114
G1 X98.949 Y92.799
G1 X100.176 Y91.572 E.04114
G1 X99.628 Y91.572
G1 X98.401 Y92.799 E.04114
G1 X97.852 Y92.799
G1 X99.08 Y91.572 E.04114
G1 X98.531 Y91.572
G1 X97.304 Y92.799 E.04114
G1 X96.755 Y92.799
G1 X97.983 Y91.572 E.04114
G1 X97.434 Y91.572
G1 X96.207 Y92.799 E.04114
G1 X95.659 Y92.799
G1 X96.886 Y91.572 E.04114
M73 P45 R8
G1 X96.337 Y91.572
G1 X95.11 Y92.799 E.04114
G1 X94.562 Y92.799
G1 X95.789 Y91.572 E.04114
G1 X95.24 Y91.572
G1 X94.013 Y92.799 E.04114
G1 X93.465 Y92.799
G1 X94.692 Y91.572 E.04114
G1 X94.144 Y91.572
G1 X92.916 Y92.799 E.04114
G1 X92.368 Y92.799
G1 X93.595 Y91.572 E.04114
G1 X93.047 Y91.572
G1 X91.819 Y92.799 E.04114
G1 X91.271 Y92.799
G1 X92.498 Y91.572 E.04114
G1 X91.95 Y91.572
G1 X90.723 Y92.799 E.04114
G1 X90.174 Y92.799
G1 X91.401 Y91.572 E.04114
G1 X90.853 Y91.572
G1 X89.626 Y92.799 E.04114
G1 X89.077 Y92.799
G1 X90.304 Y91.572 E.04114
G1 X89.756 Y91.572
G1 X88.529 Y92.799 E.04114
G1 X87.98 Y92.799
G1 X89.208 Y91.572 E.04114
G1 X88.659 Y91.572
G1 X87.432 Y92.799 E.04114
G1 X86.883 Y92.799
G1 X88.111 Y91.572 E.04114
G1 X87.562 Y91.572
G1 X86.335 Y92.799 E.04114
G1 X85.787 Y92.799
G1 X87.014 Y91.572 E.04114
G1 X86.465 Y91.572
G1 X85.238 Y92.799 E.04114
G1 X84.69 Y92.799
G1 X85.917 Y91.572 E.04114
G1 X85.368 Y91.572
G1 X84.4 Y92.541 E.03246
G1 X84.224 Y92.168
G1 X84.82 Y91.572 E.01998
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X84.224 Y92.168 E-.09611
G1 X84.4 Y92.541 E-.04695
G1 X84.927 Y92.014 E-.08494
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.75 I-.008 J1.217 P1  F28800
G1 X127.179 Y92.294 Z.75
G1 Z.35
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0823803
G1 F15000
G1 X127.081 Y92.431 E.00052
; LINE_WIDTH: 0.126788
G1 X126.929 Y92.625 E.00143
; LINE_WIDTH: 0.171881
G1 X126.777 Y92.819 E.0021
G1 X84.62 Y92.819 F28800
; LINE_WIDTH: 0.13568
G1 F15000
G2 X84.443 Y92.649 I-.395 J.234 E.00157
G1 X86.566 Y95.503 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422018
G1 F15000
G1 X86.936 Y95.132 E.01249
G1 X87.488 Y95.132 E.01313
G1 X86.901 Y95.719 E.01977
G1 X87.109 Y96.062 E.00956
G1 X88.039 Y95.132 E.03134
G1 X88.59 Y95.132 E.01313
G1 X87.317 Y96.405 E.04291
G1 X87.525 Y96.749 E.00956
G1 X89.141 Y95.132 E.05447
G1 X89.693 Y95.132 E.01313
G1 X87.733 Y97.092 E.06604
G1 X87.941 Y97.435 E.00956
G1 X90.244 Y95.132 E.0776
G1 X90.795 Y95.132 E.01313
G1 X88.149 Y97.779 E.08917
G1 X88.357 Y98.122 E.00956
G1 X91.347 Y95.132 E.10074
G1 X91.898 Y95.132 E.01313
G1 X88.565 Y98.465 E.1123
G1 X88.773 Y98.808 E.00956
G1 X92.449 Y95.132 E.12387
G1 X93.001 Y95.132 E.01313
G1 X88.981 Y99.152 E.13544
G1 X89.189 Y99.495 E.00956
G1 X93.552 Y95.132 E.147
G1 X94.103 Y95.132 E.01313
G1 X89.397 Y99.838 E.15857
G1 X89.605 Y100.182 E.00956
G1 X94.654 Y95.132 E.17014
G1 X95.206 Y95.132 E.01313
G1 X89.813 Y100.525 E.1817
G1 X90.021 Y100.868 E.00956
G1 X95.757 Y95.132 E.19327
G1 X96.308 Y95.132 E.01313
G1 X90.229 Y101.211 E.20483
G1 X90.437 Y101.555 E.00956
G1 X96.86 Y95.132 E.2164
G1 X97.411 Y95.132 E.01313
G1 X90.645 Y101.898 E.22797
G1 X90.853 Y102.241 E.00956
G1 X97.962 Y95.132 E.23953
G1 X98.514 Y95.132 E.01313
G1 X91.061 Y102.585 E.2511
G1 X91.269 Y102.928 E.00956
G1 X99.065 Y95.132 E.26267
G1 X99.616 Y95.132 E.01313
G1 X91.477 Y103.271 E.27423
G1 X91.685 Y103.614 E.00956
G1 X100.167 Y95.132 E.2858
G1 X100.719 Y95.132 E.01313
G1 X91.766 Y104.085 E.30165
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.18 Y102.671 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.75 I-1.179 J.302 P1  F28800
G1 X98.017 Y121.54 Z.75
G1 Z.35
G1 E.8 F1800
G1 F15000
G1 X99.844 Y119.713 E.06157
G1 X99.293 Y119.713 E.01313
G1 X98.191 Y120.814 E.03711
G1 X98.191 Y120.263 E.01313
G1 X99.252 Y119.202 E.03573
G1 X99.23 Y118.673 E.01262
G1 X98.191 Y119.711 E.03498
G1 X98.191 Y119.16 E.01313
G1 X99.207 Y118.144 E.03423
G1 X99.185 Y117.615 E.01262
G1 X98.188 Y118.612 E.03361
G2 X98.174 Y118.075 I-6.417 J-.107 E.01282
G1 X99.163 Y117.086 E.03332
G1 X99.141 Y116.557 E.01262
G1 X98.141 Y117.556 E.03367
G2 X98.092 Y117.054 I-6.013 J.333 E.01203
G1 X99.119 Y116.028 E.03458
G2 X99.046 Y115.549 I-1.658 J.007 E.01157
G1 X98.031 Y116.564 E.0342
G2 X97.958 Y116.086 I-5.737 J.632 E.01153
G1 X98.952 Y115.092 E.0335
G1 X98.847 Y114.645 E.01093
G1 X97.869 Y115.623 E.03295
G2 X97.769 Y115.172 I-5.432 J.966 E.01102
G1 X98.73 Y114.211 E.03237
G2 X98.607 Y113.783 I-5.166 J1.253 E.01062
G1 X97.661 Y114.729 E.03189
G1 X97.54 Y114.298 E.01066
G1 X98.472 Y113.367 E.03139
G2 X98.329 Y112.958 I-4.936 J1.5 E.01031
G1 X97.409 Y113.879 E.03101
G2 X97.27 Y113.466 I-4.989 J1.446 E.01037
G1 X98.179 Y112.556 E.03064
G2 X98.018 Y112.167 I-4.725 J1.729 E.01006
G1 X97.12 Y113.064 E.03024
G2 X96.962 Y112.672 I-4.758 J1.697 E.01009
G1 X97.852 Y111.781 E.03001
G1 X97.676 Y111.406 E.00987
G1 X96.797 Y112.285 E.02961
G1 X96.621 Y111.91 E.00987
G1 X97.494 Y111.037 E.02942
G1 X97.304 Y110.675 E.00973
G1 X96.438 Y111.541 E.0292
G1 X96.249 Y111.18 E.00973
G1 X97.106 Y110.322 E.02891
G1 X96.905 Y109.972 E.00961
G1 X96.048 Y110.828 E.02884
G2 X95.845 Y110.48 I-8.439 J4.695 E.0096
G1 X96.697 Y109.628 E.0287
G1 X96.489 Y109.285 E.00956
G1 X95.637 Y110.137 E.0287
G1 X95.429 Y109.794 E.00956
G1 X96.281 Y108.942 E.0287
G1 X96.073 Y108.598 E.00956
G1 X95.221 Y109.45 E.0287
G1 X95.013 Y109.107 E.00956
G1 X95.865 Y108.255 E.0287
G1 X95.657 Y107.912 E.00956
G1 X94.805 Y108.764 E.0287
G1 X94.597 Y108.421 E.00956
G1 X95.449 Y107.569 E.0287
G1 X95.241 Y107.225 E.00956
G1 X94.389 Y108.077 E.0287
G1 X94.181 Y107.734 E.00956
G1 X95.033 Y106.882 E.0287
G1 X94.825 Y106.539 E.00956
G1 X93.973 Y107.391 E.0287
G1 X93.765 Y107.047 E.00956
G1 X94.617 Y106.196 E.0287
G1 X94.409 Y105.852 E.00956
G1 X93.557 Y106.704 E.0287
G1 X93.349 Y106.361 E.00956
G1 X94.201 Y105.509 E.02869
G1 X93.993 Y105.166 E.00956
G1 X93.141 Y106.017 E.02869
G1 X92.933 Y105.674 E.00956
G1 X93.785 Y104.823 E.02869
G1 X93.577 Y104.479 E.00956
G1 X92.725 Y105.331 E.02869
G1 X92.517 Y104.988 E.00956
G1 X93.369 Y104.136 E.02869
G1 X93.161 Y103.793 E.00956
G1 X92.309 Y104.644 E.02869
G1 X92.101 Y104.301 E.00956
G1 X101.27 Y95.132 E.30893
G1 X101.821 Y95.132 E.01313
G1 X93.583 Y103.37 E.27757
G1 X94.135 Y103.37 E.01313
G1 X102.373 Y95.132 E.27757
G1 X102.924 Y95.132 E.01313
G1 X94.686 Y103.37 E.27757
G1 X95.237 Y103.37 E.01313
G1 X103.475 Y95.132 E.27757
G1 X104.027 Y95.132 E.01313
G1 X95.788 Y103.37 E.27757
G1 X96.34 Y103.37 E.01313
G1 X104.578 Y95.132 E.27757
G1 X105.129 Y95.132 E.01313
G1 X96.891 Y103.37 E.27757
G1 X97.442 Y103.37 E.01313
G1 X105.68 Y95.132 E.27757
G1 X106.232 Y95.132 E.01313
G1 X97.994 Y103.37 E.27757
G1 X98.545 Y103.37 E.01313
G1 X106.783 Y95.132 E.27757
G1 X107.334 Y95.132 E.01313
G1 X99.096 Y103.37 E.27757
G1 X99.648 Y103.37 E.01313
G1 X107.886 Y95.132 E.27757
G1 X108.437 Y95.132 E.01313
G1 X100.199 Y103.37 E.27757
G1 X100.75 Y103.37 E.01313
G1 X108.988 Y95.132 E.27757
G1 X109.54 Y95.132 E.01313
G1 X101.301 Y103.37 E.27757
G1 X101.853 Y103.37 E.01313
G1 X110.091 Y95.132 E.27757
G1 X110.642 Y95.132 E.01313
G1 X102.404 Y103.37 E.27757
G1 X102.955 Y103.37 E.01313
G1 X111.193 Y95.132 E.27757
G1 X111.745 Y95.132 E.01313
G1 X103.507 Y103.37 E.27757
G1 X104.058 Y103.37 E.01313
G1 X112.296 Y95.132 E.27757
G1 X112.847 Y95.132 E.01313
G1 X104.609 Y103.37 E.27757
G1 X105.161 Y103.37 E.01313
G1 X113.399 Y95.132 E.27757
G1 X113.95 Y95.132 E.01313
G1 X105.712 Y103.37 E.27757
G1 X106.263 Y103.37 E.01313
G1 X114.501 Y95.132 E.27757
G1 X115.053 Y95.132 E.01313
G1 X106.814 Y103.37 E.27757
G1 X107.366 Y103.37 E.01313
G1 X115.604 Y95.132 E.27757
G1 X116.155 Y95.132 E.01313
G1 X107.917 Y103.37 E.27757
G1 X108.468 Y103.37 E.01313
G1 X116.706 Y95.132 E.27757
G1 X117.258 Y95.132 E.01313
G1 X109.02 Y103.37 E.27757
G1 X109.571 Y103.37 E.01313
G1 X117.809 Y95.132 E.27757
G1 X118.36 Y95.132 E.01313
G1 X110.122 Y103.37 E.27757
G1 X110.674 Y103.37 E.01313
G1 X118.912 Y95.132 E.27757
G1 X119.463 Y95.132 E.01313
G1 X111.225 Y103.37 E.27757
G1 X111.776 Y103.37 E.01313
G1 X120.014 Y95.132 E.27757
G1 X120.566 Y95.132 E.01313
G1 X112.327 Y103.37 E.27757
G1 X112.879 Y103.37 E.01313
G1 X121.117 Y95.132 E.27757
G1 X121.668 Y95.132 E.01313
G1 X113.43 Y103.37 E.27757
G1 X113.981 Y103.37 E.01313
G1 X122.219 Y95.132 E.27757
G1 X122.771 Y95.132 E.01313
G1 X114.533 Y103.37 E.27757
G1 X115.084 Y103.37 E.01313
G1 X123.322 Y95.132 E.27757
G1 X123.873 Y95.132 E.01313
G1 X115.635 Y103.37 E.27757
G1 X116.187 Y103.37 E.01313
G1 X124.425 Y95.132 E.27757
G1 X124.902 Y95.132 E.01138
G1 X124.789 Y95.319 E.00521
G1 X116.738 Y103.37 E.27126
G1 X117.289 Y103.37 E.01313
G1 X123.941 Y96.718 E.22413
G1 X123.093 Y98.117 E.03897
G1 X117.84 Y103.37 E.17699
G1 X118.392 Y103.37 E.01313
G1 X122.246 Y99.516 E.12985
G1 X121.398 Y100.915 E.03897
G1 X117.928 Y104.386 E.11693
G1 X117.079 Y105.785 E.03899
G1 X120.55 Y102.314 E.11694
G1 X119.702 Y103.713 E.03897
G1 X116.231 Y107.185 E.11696
G1 X115.383 Y108.584 E.03899
G1 X118.855 Y105.112 E.11697
G1 X118.007 Y106.511 E.03897
G1 X114.538 Y109.98 E.11688
G2 X113.867 Y111.202 I21.509 J12.602 E.03322
G1 X117.159 Y107.91 E.11092
G1 X116.312 Y109.309 E.03897
G1 X113.411 Y112.21 E.09772
G2 X113.065 Y113.108 I9.89 J4.333 E.02294
G1 X115.474 Y110.698 E.08117
G2 X114.838 Y111.885 I14.508 J8.532 E.03208
G1 X112.796 Y113.927 E.06881
G2 X112.591 Y114.684 I8.912 J2.824 E.01868
M73 P46 R8
G1 X114.4 Y112.874 E.06096
G2 X114.083 Y113.744 I19.342 J7.565 E.02205
G1 X112.431 Y115.395 E.05566
G1 X112.334 Y115.903 E.01231
G1 X112.328 Y116.05 E.0035
G1 X113.84 Y114.537 E.05096
G2 X113.654 Y115.275 I8.7 J2.593 E.01814
G1 X112.304 Y116.625 E.04549
G1 X112.28 Y117.201 E.01372
G1 X113.512 Y115.968 E.04153
G2 X113.408 Y116.624 I7.763 J1.572 E.01582
G1 X112.255 Y117.776 E.03883
G1 X112.231 Y118.351 E.01372
G1 X113.334 Y117.248 E.03717
G2 X113.288 Y117.846 I7.114 J.858 E.0143
G1 X112.025 Y119.109 E.04255
G1 X111.596 Y119.538 F28800
G1 F15000
G1 X110.251 Y120.883 E.04531
G1 X109.7 Y120.883 E.01313
G1 X110.87 Y119.713 E.03943
G1 X110.319 Y119.713 E.01313
G1 X109.149 Y120.883 E.03943
G1 X108.597 Y120.883 E.01313
G1 X109.768 Y119.713 E.03943
G1 X109.216 Y119.713 E.01313
G1 X108.046 Y120.883 E.03943
G1 X107.495 Y120.883 E.01313
G1 X108.665 Y119.713 E.03943
G1 X108.114 Y119.713 E.01313
G1 X106.943 Y120.883 E.03943
G1 X106.392 Y120.883 E.01313
G1 X107.562 Y119.713 E.03943
G1 X107.011 Y119.713 E.01313
G1 X105.841 Y120.883 E.03943
G1 X105.29 Y120.883 E.01313
G1 X106.46 Y119.713 E.03943
G1 X105.908 Y119.713 E.01313
G1 X104.738 Y120.883 E.03943
G1 X104.187 Y120.883 E.01313
G1 X105.357 Y119.713 E.03943
G1 X104.806 Y119.713 E.01313
G1 X103.636 Y120.883 E.03943
G1 X103.084 Y120.883 E.01313
G1 X104.255 Y119.713 E.03943
G1 X103.703 Y119.713 E.01313
G1 X102.533 Y120.883 E.03943
G1 X101.982 Y120.883 E.01313
G1 X103.152 Y119.713 E.03943
G1 X102.601 Y119.713 E.01313
G1 X101.43 Y120.883 E.03943
G1 X100.879 Y120.883 E.01313
G1 X102.049 Y119.713 E.03943
G1 X101.498 Y119.713 E.01313
G1 X100.328 Y120.883 E.03943
G1 X99.777 Y120.883 E.01313
G1 X100.947 Y119.713 E.03943
G1 X100.395 Y119.713 E.01313
G1 X98.191 Y121.917 E.07426
G1 X98.191 Y122.468 E.01313
G1 X99.362 Y121.298 E.03943
G1 X99.362 Y121.849 E.01313
G1 X98.191 Y123.019 E.03943
G1 X98.191 Y123.571 E.01313
G1 X99.362 Y122.4 E.03943
G1 X99.362 Y122.952 E.01313
G1 X98.191 Y124.122 E.03943
G1 X98.191 Y124.673 E.01313
G1 X99.362 Y123.503 E.03943
G1 X99.362 Y124.054 E.01313
G1 X98.191 Y125.224 E.03943
G1 X98.191 Y125.776 E.01313
G1 X99.362 Y124.606 E.03943
G1 X99.362 Y125.157 E.01313
G1 X98.191 Y126.327 E.03943
G1 X98.191 Y126.878 E.01313
G1 X99.362 Y125.708 E.03943
G1 X99.362 Y126.259 E.01313
G1 X98.191 Y127.43 E.03943
G1 X98.191 Y127.981 E.01313
G1 X99.362 Y126.811 E.03943
G1 X99.362 Y127.362 E.01313
G1 X98.191 Y128.532 E.03943
G1 X98.191 Y129.084 E.01313
G1 X99.362 Y127.913 E.03943
G1 X99.362 Y128.465 E.01313
G1 X98.191 Y129.635 E.03943
G1 X98.191 Y130.186 E.01313
G1 X99.362 Y129.016 E.03943
G1 X99.362 Y129.567 E.01313
G1 X98.191 Y130.737 E.03943
G1 X98.191 Y131.289 E.01313
G1 X99.362 Y130.119 E.03943
G1 X99.362 Y130.67 E.01313
G1 X98.191 Y131.84 E.03943
G1 X98.191 Y132.391 E.01313
G1 X99.362 Y131.221 E.03943
G1 X99.362 Y131.772 E.01313
G1 X98.191 Y132.943 E.03943
G1 X98.191 Y133.494 E.01313
G1 X99.362 Y132.324 E.03943
G1 X99.362 Y132.875 E.01313
G1 X98.191 Y134.045 E.03943
G1 X98.191 Y134.597 E.01313
G1 X99.362 Y133.426 E.03943
G1 X99.362 Y133.978 E.01313
G1 X98.191 Y135.148 E.03943
G1 X98.191 Y135.699 E.01313
G1 X99.362 Y134.529 E.03943
G1 X99.362 Y135.08 E.01313
G1 X98.191 Y136.25 E.03943
G1 X98.191 Y136.802 E.01313
G1 X99.362 Y135.632 E.03943
G1 X99.362 Y136.183 E.01313
G1 X98.191 Y137.353 E.03943
G1 X98.191 Y137.904 E.01313
G1 X99.362 Y136.734 E.03943
G1 X99.362 Y137.285 E.01313
G1 X98.191 Y138.456 E.03943
G1 X98.191 Y139.007 E.01313
G1 X99.362 Y137.837 E.03943
G1 X99.362 Y138.388 E.01313
G1 X98.191 Y139.558 E.03943
G1 X98.191 Y140.11 E.01313
G1 X99.362 Y138.939 E.03943
G1 X99.362 Y139.491 E.01313
G1 X98.191 Y140.661 E.03943
G1 X98.191 Y141.212 E.01313
G1 X99.362 Y140.042 E.03943
G1 X99.362 Y140.593 E.01313
G1 X98.191 Y141.763 E.03943
G1 X98.191 Y142.315 E.01313
G1 X99.362 Y141.145 E.03943
G1 X99.362 Y141.696 E.01313
G1 X98.191 Y142.866 E.03943
G1 X98.191 Y143.417 E.01313
G1 X99.362 Y142.247 E.03943
G1 X99.362 Y142.798 E.01313
G1 X98.191 Y143.969 E.03943
G1 X98.191 Y144.52 E.01313
G1 X99.362 Y143.35 E.03943
G1 X99.362 Y143.901 E.01313
G1 X98.191 Y145.071 E.03943
G1 X98.191 Y145.623 E.01313
G1 X99.362 Y144.452 E.03943
G1 X99.362 Y145.004 E.01313
G1 X98.191 Y146.174 E.03943
G1 X98.191 Y146.725 E.01313
G1 X99.362 Y145.555 E.03943
G1 X99.362 Y146.106 E.01313
G1 X98.191 Y147.276 E.03943
G1 X98.191 Y147.828 E.01313
G1 X99.362 Y146.658 E.03943
G1 X99.362 Y147.209 E.01313
G1 X98.191 Y148.379 E.03943
G1 X98.191 Y148.93 E.01313
G1 X99.362 Y147.76 E.03943
G1 X99.362 Y148.311 E.01313
G1 X98.191 Y149.482 E.03943
G1 X98.191 Y150.033 E.01313
G1 X99.362 Y148.863 E.03943
G1 X99.362 Y149.414 E.01313
G1 X98.191 Y150.584 E.03943
G1 X98.191 Y151.136 E.01313
G1 X99.362 Y149.965 E.03943
G1 X99.362 Y150.517 E.01313
G1 X98.191 Y151.687 E.03943
G1 X98.191 Y152.238 E.01313
G1 X99.362 Y151.068 E.03943
G1 X99.362 Y151.619 E.01313
G1 X98.191 Y152.789 E.03943
G1 X98.191 Y153.341 E.01313
G1 X99.362 Y152.171 E.03943
G1 X99.362 Y152.722 E.01313
G1 X98.191 Y153.892 E.03943
G1 X98.191 Y154.443 E.01313
G1 X99.362 Y153.273 E.03943
G1 X99.362 Y153.824 E.01313
G1 X98.191 Y154.995 E.03943
G1 X98.191 Y155.546 E.01313
G1 X99.362 Y154.376 E.03943
G1 X99.362 Y154.927 E.01313
G1 X98.191 Y156.097 E.03943
G1 X98.191 Y156.649 E.01313
G1 X99.362 Y155.478 E.03943
G1 X99.362 Y156.03 E.01313
G1 X98.191 Y157.2 E.03943
G1 X98.191 Y157.751 E.01313
G1 X99.362 Y156.581 E.03943
G1 X99.362 Y157.132 E.01313
G1 X98.191 Y158.302 E.03943
G1 X98.191 Y158.854 E.01313
G1 X99.362 Y157.684 E.03943
G1 X99.362 Y158.235 E.01313
G1 X98.191 Y159.405 E.03943
G1 X98.191 Y159.956 E.01313
G1 X99.362 Y158.786 E.03943
G1 X99.362 Y159.337 E.01313
G1 X98.191 Y160.508 E.03943
G1 X98.191 Y161.059 E.01313
G1 X99.362 Y159.889 E.03943
G1 X99.362 Y160.44 E.01313
G1 X98.191 Y161.61 E.03943
G1 X98.191 Y162.162 E.01313
G1 X99.362 Y160.991 E.03943
G1 X99.362 Y161.543 E.01313
G1 X98.191 Y162.713 E.03943
G1 X98.191 Y163.264 E.01313
G1 X99.362 Y162.094 E.03943
G1 X99.362 Y162.645 E.01313
G1 X98.191 Y163.815 E.03943
G1 X98.191 Y164.367 E.01313
G1 X99.362 Y163.197 E.03943
G1 X99.362 Y163.748 E.01313
G1 X98.191 Y164.918 E.03943
G1 X98.191 Y165.469 E.01313
G1 X99.362 Y164.299 E.03943
G1 X99.362 Y164.85 E.01313
G1 X98.191 Y166.021 E.03943
G1 X98.191 Y166.572 E.01313
G1 X99.362 Y165.402 E.03943
G1 X99.362 Y165.953 E.01313
G1 X98.191 Y167.123 E.03943
G1 X98.191 Y167.675 E.01313
G1 X99.362 Y166.504 E.03943
G1 X99.362 Y167.056 E.01313
G1 X98.191 Y168.226 E.03943
G1 X98.191 Y168.777 E.01313
G1 X99.362 Y167.607 E.03943
G1 X99.362 Y168.158 E.01313
G1 X98.215 Y169.305 E.03864
G2 X98.261 Y169.81 I3.878 J-.098 E.0121
G1 X99.362 Y168.71 E.03709
G2 X99.389 Y169.233 I3.986 J.052 E.0125
G1 X98.344 Y170.278 E.0352
G1 X98.444 Y170.729 E.01101
G1 X99.435 Y169.739 E.03337
G2 X99.52 Y170.205 I2.708 J-.253 E.01131
G1 X98.575 Y171.15 E.03183
G2 X98.721 Y171.555 I2.389 J-.63 E.01028
G1 X99.637 Y170.64 E.03084
G2 X99.784 Y171.043 I1.915 J-.473 E.01026
G1 X98.883 Y171.945 E.03038
G2 X99.069 Y172.31 I2.179 J-.881 E.00978
G1 X99.939 Y171.44 E.02931
G2 X100.124 Y171.806 I1.765 J-.661 E.0098
G1 X99.265 Y172.665 E.02892
G1 X99.48 Y173.002 E.00951
G1 X100.326 Y172.155 E.02851
G2 X100.544 Y172.488 I1.629 J-.831 E.0095
G1 X99.707 Y173.326 E.02823
G2 X99.955 Y173.629 I2.435 J-1.744 E.00934
G1 X100.79 Y172.794 E.02813
G2 X101.036 Y173.099 I1.517 J-.971 E.00936
G1 X100.21 Y173.925 E.02783
G1 X100.486 Y174.2 E.00929
G1 X101.312 Y173.375 E.02781
G2 X101.601 Y173.637 I1.639 J-1.525 E.00931
G1 X100.772 Y174.466 E.02795
G1 X101.072 Y174.717 E.00932
G1 X101.906 Y173.883 E.02811
G1 X102.237 Y174.104 E.00947
G1 X101.391 Y174.95 E.0285
G2 X101.718 Y175.174 I1.444 J-1.758 E.00946
G1 X102.57 Y174.322 E.0287
G1 X102.932 Y174.511 E.00974
G1 X102.068 Y175.376 E.02914
G2 X102.43 Y175.564 I1.26 J-1.977 E.00975
G1 X103.314 Y174.68 E.0298
G2 X103.716 Y174.83 I1.056 J-2.219 E.01022
G1 X102.806 Y175.74 E.03066
G2 X103.208 Y175.889 I1.057 J-2.222 E.01022
G1 X104.14 Y174.957 E.03141
G1 X104.591 Y175.057 E.01101
G1 X103.62 Y176.028 E.03271
G2 X104.063 Y176.137 I1.05 J-3.321 E.01087
G1 X105.076 Y175.124 E.03413
G2 X105.596 Y175.155 I.437 J-2.958 E.01244
G1 X104.522 Y176.229 E.0362
G1 X105.009 Y176.293 E.01171
G1 X106.171 Y175.131 E.03915
G2 X106.789 Y175.064 I.004 J-2.856 E.01484
G1 X105.531 Y176.322 E.04239
G2 X106.085 Y176.319 I.261 J-3.168 E.01322
G1 X107.503 Y174.902 E.04777
G2 X108.387 Y174.57 I-1.909 J-6.419 E.0225
G1 X106.69 Y176.267 E.05718
G1 X107.357 Y176.15 E.01615
G1 X113.076 Y170.431 E.19268
G3 X112.856 Y171.203 I-4.52 J-.873 E.01914
G1 X108.129 Y175.93 E.15926
G2 X109.07 Y175.54 I-1.759 J-5.576 E.02431
G1 X112.466 Y172.144 E.11439
G3 X111.285 Y173.877 I-6.569 J-3.21 E.05013
G1 X109.887 Y175.274 E.04707
G1 X111.102 Y171.854 F28800
G1 F15000
G1 X113.185 Y169.771 E.07019
G2 X113.239 Y169.165 I-3.426 J-.612 E.0145
G1 X111.828 Y170.577 E.04757
G2 X111.995 Y169.858 I-8.624 J-2.392 E.0176
G1 X113.256 Y168.598 E.04247
G1 X113.256 Y168.046 E.01313
G1 X112.067 Y169.235 E.04005
G2 X112.086 Y168.665 I-6.473 J-.497 E.01359
G1 X113.256 Y167.495 E.03943
G1 X113.256 Y166.944 E.01313
G1 X112.086 Y168.114 E.03943
G1 X112.086 Y167.563 E.01313
G1 X113.256 Y166.392 E.03943
G1 X113.256 Y165.841 E.01313
G1 X112.086 Y167.011 E.03943
G1 X112.086 Y166.46 E.01313
G1 X113.256 Y165.29 E.03943
G1 X113.256 Y164.738 E.01313
G1 X112.086 Y165.909 E.03943
G1 X112.086 Y165.357 E.01313
G1 X113.256 Y164.187 E.03943
G1 X113.256 Y163.636 E.01313
G1 X112.086 Y164.806 E.03943
G1 X112.086 Y164.255 E.01313
G1 X113.256 Y163.085 E.03943
G1 X113.256 Y162.533 E.01313
G1 X112.086 Y163.703 E.03943
G1 X112.086 Y163.152 E.01313
G1 X113.256 Y161.982 E.03943
G1 X113.256 Y161.431 E.01313
G1 X112.086 Y162.601 E.03943
G1 X112.086 Y162.05 E.01313
G1 X113.256 Y160.879 E.03943
G1 X113.256 Y160.328 E.01313
G1 X112.086 Y161.498 E.03943
G1 X112.086 Y160.947 E.01313
G1 X113.256 Y159.777 E.03943
G1 X113.256 Y159.225 E.01313
G1 X112.086 Y160.396 E.03943
G1 X112.086 Y159.844 E.01313
G1 X113.256 Y158.674 E.03943
G1 X113.256 Y158.123 E.01313
G1 X112.086 Y159.293 E.03943
G1 X112.086 Y158.742 E.01313
G1 X113.256 Y157.572 E.03943
G1 X113.256 Y157.02 E.01313
G1 X112.086 Y158.19 E.03943
G1 X112.086 Y157.639 E.01313
G1 X113.256 Y156.469 E.03943
G1 X113.256 Y155.918 E.01313
G1 X112.086 Y157.088 E.03943
G1 X112.086 Y156.537 E.01313
G1 X113.256 Y155.366 E.03943
G1 X113.256 Y154.815 E.01313
G1 X112.086 Y155.985 E.03943
G1 X112.086 Y155.434 E.01313
G1 X113.256 Y154.264 E.03943
G1 X113.256 Y153.712 E.01313
G1 X112.086 Y154.883 E.03943
G1 X112.086 Y154.331 E.01313
G1 X113.256 Y153.161 E.03943
G1 X113.256 Y152.61 E.01313
G1 X112.086 Y153.78 E.03943
G1 X112.086 Y153.229 E.01313
G1 X113.256 Y152.059 E.03943
G1 X113.256 Y151.507 E.01313
G1 X112.086 Y152.677 E.03943
G1 X112.086 Y152.126 E.01313
G1 X113.256 Y150.956 E.03943
G1 X113.256 Y150.405 E.01313
G1 X112.086 Y151.575 E.03943
G1 X112.086 Y151.024 E.01313
G1 X113.256 Y149.853 E.03943
G1 X113.256 Y149.302 E.01313
G1 X112.086 Y150.472 E.03943
G1 X112.086 Y149.921 E.01313
G1 X113.256 Y148.751 E.03943
G1 X113.256 Y148.199 E.01313
G1 X112.086 Y149.37 E.03943
G1 X112.086 Y148.818 E.01313
G1 X113.256 Y147.648 E.03943
G1 X113.256 Y147.097 E.01313
G1 X112.086 Y148.267 E.03943
G1 X112.086 Y147.716 E.01313
G1 X113.256 Y146.546 E.03943
G1 X113.256 Y145.994 E.01313
G1 X112.086 Y147.164 E.03943
G1 X112.086 Y146.613 E.01313
G1 X113.256 Y145.443 E.03943
G1 X113.256 Y144.892 E.01313
G1 X112.086 Y146.062 E.03943
G1 X112.086 Y145.511 E.01313
G1 X113.256 Y144.34 E.03943
G1 X113.256 Y143.789 E.01313
G1 X112.086 Y144.959 E.03943
G1 X112.086 Y144.408 E.01313
G1 X113.256 Y143.238 E.03943
G1 X113.256 Y142.686 E.01313
G1 X112.086 Y143.857 E.03943
G1 X112.086 Y143.305 E.01313
G1 X113.256 Y142.135 E.03943
G1 X113.256 Y141.584 E.01313
G1 X112.086 Y142.754 E.03943
G1 X112.086 Y142.203 E.01313
G1 X113.256 Y141.033 E.03943
G1 X113.256 Y140.481 E.01313
G1 X112.086 Y141.651 E.03943
G1 X112.086 Y141.1 E.01313
G1 X113.256 Y139.93 E.03943
G1 X113.256 Y139.379 E.01313
G1 X112.086 Y140.549 E.03943
G1 X112.086 Y139.998 E.01313
G1 X113.256 Y138.827 E.03943
G1 X113.256 Y138.276 E.01313
G1 X112.086 Y139.446 E.03943
G1 X112.086 Y138.895 E.01313
G1 X113.256 Y137.725 E.03943
G1 X113.256 Y137.173 E.01313
G1 X112.086 Y138.344 E.03943
G1 X112.086 Y137.792 E.01313
G1 X113.256 Y136.622 E.03943
G1 X113.256 Y136.071 E.01313
G1 X112.086 Y137.241 E.03943
G1 X112.086 Y136.69 E.01313
G1 X113.256 Y135.52 E.03943
G1 X113.256 Y134.968 E.01313
G1 X112.086 Y136.138 E.03943
G1 X112.086 Y135.587 E.01313
G1 X113.256 Y134.417 E.03943
G1 X113.256 Y133.866 E.01313
G1 X112.086 Y135.036 E.03943
G1 X112.086 Y134.485 E.01313
G1 X113.256 Y133.314 E.03943
G1 X113.256 Y132.763 E.01313
G1 X112.086 Y133.933 E.03943
G1 X112.086 Y133.382 E.01313
G1 X113.256 Y132.212 E.03943
G1 X113.256 Y131.66 E.01313
G1 X112.086 Y132.831 E.03943
G1 X112.086 Y132.279 E.01313
G1 X113.256 Y131.109 E.03943
G1 X113.256 Y130.558 E.01313
G1 X112.086 Y131.728 E.03943
G1 X112.086 Y131.177 E.01313
G1 X113.256 Y130.007 E.03943
G1 X113.256 Y129.455 E.01313
G1 X112.086 Y130.625 E.03943
G1 X112.086 Y130.074 E.01313
G1 X113.256 Y128.904 E.03943
G1 X113.256 Y128.353 E.01313
G1 X112.086 Y129.523 E.03943
G1 X112.086 Y128.972 E.01313
G1 X113.256 Y127.801 E.03943
G1 X113.256 Y127.25 E.01313
G1 X112.086 Y128.42 E.03943
G1 X112.086 Y127.869 E.01313
G1 X113.256 Y126.699 E.03943
G1 X113.256 Y126.147 E.01313
G1 X112.086 Y127.318 E.03943
G1 X112.086 Y126.766 E.01313
G1 X113.256 Y125.596 E.03943
G1 X113.256 Y125.045 E.01313
G1 X112.086 Y126.215 E.03943
G1 X112.086 Y125.664 E.01313
G1 X113.256 Y124.494 E.03943
G1 X113.256 Y123.942 E.01313
G1 X112.086 Y125.112 E.03943
G1 X112.086 Y124.561 E.01313
G1 X113.256 Y123.391 E.03943
G1 X113.256 Y122.84 E.01313
G1 X112.086 Y124.01 E.03943
G1 X112.086 Y123.459 E.01313
G1 X113.256 Y122.288 E.03943
G1 X113.256 Y121.737 E.01313
G1 X112.086 Y122.907 E.03943
G1 X112.086 Y122.356 E.01313
G1 X113.256 Y121.186 E.03943
G1 X113.256 Y120.634 E.01313
G1 X112.086 Y121.805 E.03943
G1 X112.086 Y121.253 E.01313
G1 X113.256 Y120.083 E.03943
G1 X113.256 Y119.532 E.01313
G1 X111.905 Y120.883 E.04551
G1 X111.354 Y120.883 E.01313
G1 X113.256 Y118.981 E.06409
G3 X113.264 Y118.422 I13.346 J-.096 E.01332
G1 X110.628 Y121.057 E.0888
M73 P47 R8
G1 X125.606 Y94.114 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X124.801 Y94.919 E.02698
G1 X124.252 Y94.919
G1 X125.915 Y93.256 E.05573
G1 X125.366 Y93.256
G1 X123.704 Y94.919 E.05573
G1 X123.155 Y94.919
G1 X124.818 Y93.256 E.05573
G1 X124.27 Y93.256
G1 X122.607 Y94.919 E.05573
G1 X122.058 Y94.919
G1 X123.721 Y93.256 E.05573
G1 X123.173 Y93.256
G1 X121.51 Y94.919 E.05573
G1 X120.961 Y94.919
G1 X122.624 Y93.256 E.05573
G1 X122.076 Y93.256
G1 X120.413 Y94.919 E.05573
G1 X119.865 Y94.919
G1 X121.527 Y93.256 E.05573
G1 X120.979 Y93.256
G1 X119.316 Y94.919 E.05573
G1 X118.768 Y94.919
G1 X120.43 Y93.256 E.05573
G1 X119.882 Y93.256
G1 X118.219 Y94.919 E.05573
G1 X117.671 Y94.919
G1 X119.334 Y93.256 E.05573
G1 X118.785 Y93.256
G1 X117.122 Y94.919 E.05573
G1 X116.574 Y94.919
G1 X118.237 Y93.256 E.05573
G1 X117.688 Y93.256
G1 X116.025 Y94.919 E.05573
G1 X115.477 Y94.919
G1 X117.14 Y93.256 E.05573
G1 X116.591 Y93.256
G1 X114.929 Y94.919 E.05573
G1 X114.38 Y94.919
G1 X116.043 Y93.256 E.05573
G1 X115.494 Y93.256
G1 X113.832 Y94.919 E.05573
G1 X113.283 Y94.919
G1 X114.946 Y93.256 E.05573
G1 X114.398 Y93.256
G1 X112.735 Y94.919 E.05573
G1 X112.186 Y94.919
G1 X113.849 Y93.256 E.05573
G1 X113.301 Y93.256
G1 X111.638 Y94.919 E.05573
G1 X111.089 Y94.919
G1 X112.752 Y93.256 E.05573
G1 X112.204 Y93.256
G1 X110.541 Y94.919 E.05573
G1 X109.993 Y94.919
G1 X111.655 Y93.256 E.05573
G1 X111.107 Y93.256
G1 X109.444 Y94.919 E.05573
G1 X108.896 Y94.919
G1 X110.558 Y93.256 E.05573
G1 X110.01 Y93.256
G1 X108.347 Y94.919 E.05573
G1 X107.799 Y94.919
G1 X109.462 Y93.256 E.05573
G1 X108.913 Y93.256
G1 X107.25 Y94.919 E.05573
G1 X106.702 Y94.919
G1 X108.365 Y93.256 E.05573
G1 X107.816 Y93.256
G1 X106.153 Y94.919 E.05573
G1 X105.605 Y94.919
G1 X107.268 Y93.256 E.05573
G1 X106.719 Y93.256
G1 X105.057 Y94.919 E.05573
G1 X104.508 Y94.919
G1 X106.171 Y93.256 E.05573
G1 X105.622 Y93.256
G1 X103.96 Y94.919 E.05573
G1 X103.411 Y94.919
G1 X105.074 Y93.256 E.05573
G1 X104.526 Y93.256
G1 X102.863 Y94.919 E.05573
G1 X102.314 Y94.919
G1 X103.977 Y93.256 E.05573
G1 X103.429 Y93.256
G1 X101.766 Y94.919 E.05573
G1 X101.217 Y94.919
G1 X102.88 Y93.256 E.05573
G1 X102.332 Y93.256
G1 X100.669 Y94.919 E.05573
G1 X100.121 Y94.919
G1 X101.783 Y93.256 E.05573
G1 X101.235 Y93.256
G1 X99.572 Y94.919 E.05573
G1 X99.024 Y94.919
G1 X100.686 Y93.256 E.05573
G1 X100.138 Y93.256
G1 X98.475 Y94.919 E.05573
G1 X97.927 Y94.919
G1 X99.59 Y93.256 E.05573
G1 X99.041 Y93.256
G1 X97.378 Y94.919 E.05573
G1 X96.83 Y94.919
G1 X98.493 Y93.256 E.05573
G1 X97.944 Y93.256
G1 X96.281 Y94.919 E.05573
G1 X95.733 Y94.919
G1 X97.396 Y93.256 E.05573
G1 X96.847 Y93.256
G1 X95.185 Y94.919 E.05573
G1 X94.636 Y94.919
G1 X96.299 Y93.256 E.05573
G1 X95.75 Y93.256
G1 X94.088 Y94.919 E.05573
G1 X93.539 Y94.919
G1 X95.202 Y93.256 E.05573
G1 X94.654 Y93.256
G1 X92.991 Y94.919 E.05573
G1 X92.442 Y94.919
G1 X94.105 Y93.256 E.05573
G1 X93.557 Y93.256
G1 X91.894 Y94.919 E.05573
G1 X91.345 Y94.919
G1 X93.008 Y93.256 E.05573
G1 X92.46 Y93.256
G1 X90.797 Y94.919 E.05573
G1 X90.249 Y94.919
G1 X91.911 Y93.256 E.05573
G1 X91.363 Y93.256
G1 X89.7 Y94.919 E.05573
G1 X89.152 Y94.919
G1 X90.814 Y93.256 E.05573
G1 X90.266 Y93.256
G1 X88.603 Y94.919 E.05573
G1 X88.055 Y94.919
G1 X89.718 Y93.256 E.05573
G1 X89.169 Y93.256
G1 X87.506 Y94.919 E.05573
G1 X86.958 Y94.919
G1 X88.621 Y93.256 E.05573
G1 X88.072 Y93.256
G1 X86.409 Y94.919 E.05573
G1 X86.153 Y94.627
G1 X87.524 Y93.256 E.04595
G1 X86.975 Y93.256
G1 X85.946 Y94.285 E.03451
G1 X85.739 Y93.944
G1 X86.427 Y93.256 E.02306
G1 X85.878 Y93.256
G1 X85.532 Y93.602 E.01161
M204 S10000
G1 X125.979 Y93.495 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0787278
G1 F15000
G1 X125.834 Y93.68 E.00067
; LINE_WIDTH: 0.125884
G1 X125.688 Y93.866 E.00135
; LINE_WIDTH: 0.17304
G1 X125.543 Y94.051 E.00203
; CHANGE_LAYER
; Z_HEIGHT: 0.469763
; LAYER_HEIGHT: 0.119763
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X125.688 Y93.866 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z.75 I-1.085 J-.552 P1  F28800
G1 X111.79 Y121.178 Z.75
G1 Z.47
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.2512
G1 X99.657 Y168.804 E.98605
G2 X111.79 Y168.804 I6.067 J-.012 E.39408
G1 X111.79 Y121.238 E.98481
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21769
G1 X100.066 Y168.8 E.90837
G2 X111.381 Y168.8 I5.657 J-.008 E.34166
G1 X111.381 Y121.648 E.90722
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.87 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z.87
G1 Z.47
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07335
G3 X114.31 Y109.784 I17.324 J2.998 E.13525
G1 X118.018 Y103.666 E.14811
G1 X93.429 Y103.666 E.50909
G1 X97.137 Y109.784 E.14811
G3 X99.408 Y115.869 I-15.053 J9.084 E.13526
G1 X99.557 Y119.417 E.07352
G1 X111.839 Y119.417 E.25429
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06135
G3 X113.958 Y109.575 I17.744 J3.051 E.12899
G1 X117.292 Y104.075 E.12374
G1 X94.156 Y104.075 E.44513
G1 X97.489 Y109.575 E.12374
G3 X99.816 Y115.822 I-15.418 J9.298 E.12899
G1 X99.949 Y119.008 E.06135
G1 X111.438 Y119.008 E.22105
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.87 I1.032 J.645 P1  F28800
G1 X126.097 Y93.734 Z.87
G1 Z.47
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X116.625 Y109.363 E.37838
G2 X115.182 Y111.849 I26.634 J17.118 E.05953
G2 X113.552 Y118.791 I14.114 J6.978 E.14894
G1 X113.552 Y168.791 E1.0352
G3 X97.896 Y168.791 I-7.828 J-.001 E.50913
G1 X97.896 Y118.791 E1.0352
G2 X95.637 Y110.708 I-15.706 J.031 E.17591
G1 X85.35 Y93.734 E.41094
G1 X126.037 Y93.734 E.84239
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X125.005 Y95.447 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.87 I.978 J.725 P1  F28800
G1 X127.451 Y92.148 Z.87
G1 Z.47
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.441 Y92.191 E.00084
G3 X127.252 Y92.618 I-1.931 J-.598 E.009
G1 X116.162 Y110.916 E.41168
G2 X113.961 Y118.795 I13.095 J7.906 E.15934
G1 X113.961 Y168.795 E.96201
G3 X97.486 Y168.795 I-8.237 J-.006 E.49768
G1 X97.486 Y118.795 E.96201
G2 X95.285 Y110.916 I-15.297 J.026 E.15934
G1 X84.195 Y92.618 E.41168
G3 X83.996 Y92.148 I1.871 J-1.072 E.00984
G1 X127.391 Y92.148 E.83494
G1 X127.424 Y92.182 F28800
G1 X126.808 Y92.933
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X126.24 Y92.365 E.01544
G1 X125.683 Y92.365
G1 X126.597 Y93.28 E.02489
G1 X126.262 Y93.502
G1 X125.125 Y92.365 E.03093
G1 X124.567 Y92.365
G1 X125.704 Y93.502 E.03093
G1 X125.147 Y93.502
M73 P48 R8
G1 X124.01 Y92.365 E.03093
G1 X123.452 Y92.365
G1 X124.589 Y93.502 E.03093
G1 X124.031 Y93.502
G1 X122.895 Y92.365 E.03093
G1 X122.337 Y92.365
G1 X123.474 Y93.502 E.03093
G1 X122.916 Y93.502
G1 X121.779 Y92.365 E.03093
G1 X121.222 Y92.365
G1 X122.358 Y93.502 E.03093
G1 X121.801 Y93.502
G1 X120.664 Y92.365 E.03093
G1 X120.106 Y92.365
G1 X121.243 Y93.502 E.03093
G1 X120.686 Y93.502
G1 X119.549 Y92.365 E.03093
G1 X118.991 Y92.365
G1 X120.128 Y93.502 E.03093
G1 X119.57 Y93.502
G1 X118.434 Y92.365 E.03093
G1 X117.876 Y92.365
G1 X119.013 Y93.502 E.03093
G1 X118.455 Y93.502
G1 X117.318 Y92.365 E.03093
G1 X116.761 Y92.365
G1 X117.897 Y93.502 E.03093
G1 X117.34 Y93.502
G1 X116.203 Y92.365 E.03093
G1 X115.645 Y92.365
G1 X116.782 Y93.502 E.03093
G1 X116.225 Y93.502
G1 X115.088 Y92.365 E.03093
G1 X114.53 Y92.365
G1 X115.667 Y93.502 E.03093
G1 X115.109 Y93.502
G1 X113.973 Y92.365 E.03093
G1 X113.415 Y92.365
G1 X114.552 Y93.502 E.03093
G1 X113.994 Y93.502
G1 X112.857 Y92.365 E.03093
G1 X112.3 Y92.365
G1 X113.436 Y93.502 E.03093
G1 X112.879 Y93.502
G1 X111.742 Y92.365 E.03093
G1 X111.184 Y92.365
G1 X112.321 Y93.502 E.03093
G1 X111.764 Y93.502
G1 X110.627 Y92.365 E.03093
G1 X110.069 Y92.365
G1 X111.206 Y93.502 E.03093
G1 X110.648 Y93.502
G1 X109.512 Y92.365 E.03093
G1 X108.954 Y92.365
G1 X110.091 Y93.502 E.03093
G1 X109.533 Y93.502
G1 X108.396 Y92.365 E.03093
G1 X107.839 Y92.365
G1 X108.975 Y93.502 E.03093
G1 X108.418 Y93.502
G1 X107.281 Y92.365 E.03093
G1 X106.724 Y92.365
G1 X107.86 Y93.502 E.03093
G1 X107.303 Y93.502
G1 X106.166 Y92.365 E.03093
G1 X105.608 Y92.365
G1 X106.745 Y93.502 E.03093
G1 X106.187 Y93.502
G1 X105.051 Y92.365 E.03093
G1 X104.493 Y92.365
G1 X105.63 Y93.502 E.03093
G1 X105.072 Y93.502
G1 X103.935 Y92.365 E.03093
G1 X103.378 Y92.365
G1 X104.515 Y93.502 E.03093
G1 X103.957 Y93.502
G1 X102.82 Y92.365 E.03093
G1 X102.263 Y92.365
G1 X103.399 Y93.502 E.03093
G1 X102.842 Y93.502
G1 X101.705 Y92.365 E.03093
G1 X101.147 Y92.365
G1 X102.284 Y93.502 E.03093
G1 X101.726 Y93.502
G1 X100.59 Y92.365 E.03093
G1 X100.032 Y92.365
G1 X101.169 Y93.502 E.03093
G1 X100.611 Y93.502
G1 X99.474 Y92.365 E.03093
G1 X98.917 Y92.365
G1 X100.054 Y93.502 E.03093
G1 X99.496 Y93.502
G1 X98.359 Y92.365 E.03093
G1 X97.802 Y92.365
G1 X98.938 Y93.502 E.03093
G1 X98.381 Y93.502
G1 X97.244 Y92.365 E.03093
G1 X96.686 Y92.365
G1 X97.823 Y93.502 E.03093
G1 X97.265 Y93.502
G1 X96.129 Y92.365 E.03093
G1 X95.571 Y92.365
G1 X96.708 Y93.502 E.03093
G1 X96.15 Y93.502
G1 X95.013 Y92.365 E.03093
G1 X94.456 Y92.365
G1 X95.593 Y93.502 E.03093
G1 X95.035 Y93.502
G1 X93.898 Y92.365 E.03093
G1 X93.341 Y92.365
G1 X94.477 Y93.502 E.03093
G1 X93.92 Y93.502
G1 X92.783 Y92.365 E.03093
G1 X92.225 Y92.365
G1 X93.362 Y93.502 E.03093
G1 X92.804 Y93.502
G1 X91.668 Y92.365 E.03093
G1 X91.11 Y92.365
G1 X92.247 Y93.502 E.03093
G1 X91.689 Y93.502
G1 X90.552 Y92.365 E.03093
G1 X89.995 Y92.365
G1 X91.132 Y93.502 E.03093
G1 X90.574 Y93.502
G1 X89.437 Y92.365 E.03093
G1 X88.88 Y92.365
G1 X90.016 Y93.502 E.03093
G1 X89.459 Y93.502
G1 X88.322 Y92.365 E.03093
G1 X87.764 Y92.365
G1 X88.901 Y93.502 E.03093
G1 X88.343 Y93.502
G1 X87.207 Y92.365 E.03093
G1 X86.649 Y92.365
G1 X87.786 Y93.502 E.03093
G1 X87.228 Y93.502
G1 X86.092 Y92.365 E.03093
G1 X85.534 Y92.365
G1 X86.671 Y93.502 E.03093
G1 X86.113 Y93.502
G1 X84.976 Y92.365 E.03093
G1 X84.419 Y92.365
G1 X85.555 Y93.502 E.03093
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X84.419 Y92.365 E-.18326
G1 X84.811 Y92.365 E-.04474
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.87 I-1.076 J.569 P1  F28800
G1 X99.997 Y121.049 Z.87
G1 Z.47
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42173
G1 F15000
G1 X98.203 Y119.254 E.04904
G1 X98.203 Y119.815 E.01082
G1 X99.35 Y120.962 E.03136
G1 X99.35 Y121.522 E.01082
G1 X98.203 Y120.375 E.03136
G1 X98.203 Y120.935 E.01082
G1 X99.35 Y122.082 E.03136
G1 X99.35 Y122.642 E.01082
G1 X98.203 Y121.495 E.03136
G1 X98.203 Y122.055 E.01082
G1 X99.35 Y123.202 E.03136
G1 X99.35 Y123.762 E.01082
G1 X98.203 Y122.615 E.03136
G1 X98.203 Y123.175 E.01082
G1 X99.35 Y124.322 E.03136
G1 X99.35 Y124.882 E.01082
G1 X98.203 Y123.735 E.03136
G1 X98.203 Y124.295 E.01082
G1 X99.35 Y125.443 E.03136
G1 X99.35 Y126.003 E.01082
G1 X98.203 Y124.855 E.03136
G1 X98.203 Y125.415 E.01082
G1 X99.35 Y126.563 E.03136
G1 X99.35 Y127.123 E.01082
G1 X98.203 Y125.975 E.03136
G1 X98.203 Y126.535 E.01082
G1 X99.35 Y127.683 E.03136
G1 X99.35 Y128.243 E.01082
G1 X98.203 Y127.095 E.03136
G1 X98.203 Y127.655 E.01082
G1 X99.35 Y128.803 E.03136
G1 X99.35 Y129.363 E.01082
G1 X98.203 Y128.216 E.03136
G1 X98.203 Y128.776 E.01082
G1 X99.35 Y129.923 E.03136
G1 X99.35 Y130.483 E.01082
G1 X98.203 Y129.336 E.03136
G1 X98.203 Y129.896 E.01082
G1 X99.35 Y131.043 E.03136
G1 X99.35 Y131.603 E.01082
G1 X98.203 Y130.456 E.03136
G1 X98.203 Y131.016 E.01082
G1 X99.35 Y132.163 E.03136
G1 X99.35 Y132.723 E.01082
G1 X98.203 Y131.576 E.03136
G1 X98.203 Y132.136 E.01082
G1 X99.35 Y133.283 E.03136
G1 X99.35 Y133.844 E.01082
G1 X98.203 Y132.696 E.03136
G1 X98.203 Y133.256 E.01082
G1 X99.35 Y134.404 E.03136
G1 X99.35 Y134.964 E.01082
G1 X98.203 Y133.816 E.03136
G1 X98.203 Y134.376 E.01082
G1 X99.35 Y135.524 E.03136
G1 X99.35 Y136.084 E.01082
G1 X98.203 Y134.936 E.03136
G1 X98.203 Y135.496 E.01082
G1 X99.35 Y136.644 E.03136
G1 X99.35 Y137.204 E.01082
G1 X98.203 Y136.057 E.03136
G1 X98.203 Y136.617 E.01082
G1 X99.35 Y137.764 E.03136
G1 X99.35 Y138.324 E.01082
G1 X98.203 Y137.177 E.03136
G1 X98.203 Y137.737 E.01082
G1 X99.35 Y138.884 E.03136
G1 X99.35 Y139.444 E.01082
G1 X98.203 Y138.297 E.03136
G1 X98.203 Y138.857 E.01082
G1 X99.35 Y140.004 E.03136
G1 X99.35 Y140.564 E.01082
G1 X98.203 Y139.417 E.03136
G1 X98.203 Y139.977 E.01082
G1 X99.35 Y141.124 E.03136
G1 X99.35 Y141.685 E.01082
G1 X98.203 Y140.537 E.03136
G1 X98.203 Y141.097 E.01082
G1 X99.35 Y142.245 E.03136
G1 X99.35 Y142.805 E.01082
G1 X98.203 Y141.657 E.03136
G1 X98.203 Y142.217 E.01082
G1 X99.35 Y143.365 E.03136
G1 X99.35 Y143.925 E.01082
G1 X98.203 Y142.777 E.03136
G1 X98.203 Y143.337 E.01082
G1 X99.35 Y144.485 E.03136
G1 X99.35 Y145.045 E.01082
G1 X98.203 Y143.897 E.03136
G1 X98.203 Y144.458 E.01082
G1 X99.35 Y145.605 E.03136
G1 X99.35 Y146.165 E.01082
G1 X98.203 Y145.018 E.03136
G1 X98.203 Y145.578 E.01082
G1 X99.35 Y146.725 E.03136
G1 X99.35 Y147.285 E.01082
G1 X98.203 Y146.138 E.03136
G1 X98.203 Y146.698 E.01082
G1 X99.35 Y147.845 E.03136
G1 X99.35 Y148.405 E.01082
G1 X98.203 Y147.258 E.03136
G1 X98.203 Y147.818 E.01082
G1 X99.35 Y148.965 E.03136
G1 X99.35 Y149.526 E.01082
G1 X98.203 Y148.378 E.03136
G1 X98.203 Y148.938 E.01082
G1 X99.35 Y150.086 E.03136
G1 X99.35 Y150.646 E.01082
G1 X98.203 Y149.498 E.03136
G1 X98.203 Y150.058 E.01082
G1 X99.35 Y151.206 E.03136
G1 X99.35 Y151.766 E.01082
G1 X98.203 Y150.618 E.03136
G1 X98.203 Y151.178 E.01082
G1 X99.35 Y152.326 E.03136
G1 X99.35 Y152.886 E.01082
G1 X98.203 Y151.738 E.03136
G1 X98.203 Y152.299 E.01082
G1 X99.35 Y153.446 E.03136
G1 X99.35 Y154.006 E.01082
G1 X98.203 Y152.859 E.03136
G1 X98.203 Y153.419 E.01082
G1 X99.35 Y154.566 E.03136
G1 X99.35 Y155.126 E.01082
G1 X98.203 Y153.979 E.03136
G1 X98.203 Y154.539 E.01082
G1 X99.35 Y155.686 E.03136
M73 P49 R8
G1 X99.35 Y156.246 E.01082
G1 X98.203 Y155.099 E.03136
G1 X98.203 Y155.659 E.01082
G1 X99.35 Y156.806 E.03136
G1 X99.35 Y157.366 E.01082
G1 X98.203 Y156.219 E.03136
G1 X98.203 Y156.779 E.01082
G1 X99.35 Y157.927 E.03136
G1 X99.35 Y158.487 E.01082
G1 X98.203 Y157.339 E.03136
G1 X98.203 Y157.899 E.01082
G1 X99.35 Y159.047 E.03136
G1 X99.35 Y159.607 E.01082
G1 X98.203 Y158.459 E.03136
G1 X98.203 Y159.019 E.01082
G1 X99.35 Y160.167 E.03136
G1 X99.35 Y160.727 E.01082
G1 X98.203 Y159.579 E.03136
G1 X98.203 Y160.14 E.01082
G1 X99.35 Y161.287 E.03136
G1 X99.35 Y161.847 E.01082
G1 X98.203 Y160.7 E.03136
G1 X98.203 Y161.26 E.01082
G1 X99.35 Y162.407 E.03136
G1 X99.35 Y162.967 E.01082
G1 X98.203 Y161.82 E.03136
G1 X98.203 Y162.38 E.01082
G1 X99.35 Y163.527 E.03136
G1 X99.35 Y164.087 E.01082
G1 X98.203 Y162.94 E.03136
G1 X98.203 Y163.5 E.01082
G1 X99.35 Y164.647 E.03136
G1 X99.35 Y165.207 E.01082
G1 X98.203 Y164.06 E.03136
G1 X98.203 Y164.62 E.01082
G1 X99.35 Y165.768 E.03136
G1 X99.35 Y166.328 E.01082
G1 X98.203 Y165.18 E.03136
G1 X98.203 Y165.74 E.01082
G1 X99.35 Y166.888 E.03136
G1 X99.35 Y167.448 E.01082
G1 X98.203 Y166.3 E.03136
G1 X98.203 Y166.86 E.01082
G1 X99.35 Y168.008 E.03136
G1 X99.35 Y168.568 E.01082
G1 X98.203 Y167.42 E.03136
G1 X98.203 Y167.98 E.01082
G1 X99.372 Y169.15 E.03196
G2 X99.428 Y169.766 I2.851 J.051 E.01198
G1 X98.203 Y168.541 E.0335
G2 X98.21 Y169.108 I12.993 J.123 E.01096
G1 X99.583 Y170.481 E.03753
G1 X99.652 Y170.738 E.00514
G1 X99.891 Y171.349 E.01268
G1 X98.262 Y169.72 E.04451
G2 X98.383 Y170.402 I5.604 J-.645 E.01338
G1 X104.12 Y176.138 E.15677
G3 X103.349 Y175.927 I.831 J-4.558 E.01545
G1 X98.595 Y171.173 E.12994
G2 X98.984 Y172.122 I7.734 J-2.617 E.01984
G1 X102.399 Y175.538 E.09334
G3 X100.392 Y174.09 I3.357 J-6.772 E.04804
G1 X99.247 Y172.946 E.03129
G1 X102.793 Y174.251 F28800
G1 F15000
G1 X104.796 Y176.254 E.05473
G2 X105.413 Y176.311 I.894 J-6.268 E.01199
G1 X104.048 Y174.946 E.0373
G2 X104.755 Y175.093 I2.344 J-9.52 E.01395
G1 X105.973 Y176.311 E.03329
G2 X106.494 Y176.272 I.039 J-2.998 E.01012
G1 X105.379 Y175.157 E.03049
G2 X105.94 Y175.158 I.286 J-2.562 E.01087
G1 X106.987 Y176.204 E.0286
G2 X107.455 Y176.112 I-.292 J-2.721 E.00923
G1 X106.466 Y175.123 E.02703
G2 X106.95 Y175.048 I-.104 J-2.249 E.00949
G1 X107.896 Y175.994 E.02586
G2 X108.313 Y175.851 I-.61 J-2.454 E.00853
G1 X107.403 Y174.94 E.02488
G2 X107.83 Y174.808 I-.545 J-2.508 E.00866
G1 X108.715 Y175.693 E.02419
G1 X109.097 Y175.515 E.00814
G1 X108.235 Y174.653 E.02356
G1 X108.617 Y174.475 E.00814
G1 X109.464 Y175.322 E.02315
G2 X109.807 Y175.105 I-1.485 J-2.727 E.00785
G1 X108.976 Y174.273 E.02273
G2 X109.318 Y174.055 I-1.077 J-2.065 E.00785
G1 X110.141 Y174.878 E.02251
G1 X110.458 Y174.635 E.00772
G1 X109.644 Y173.821 E.02225
G1 X109.948 Y173.565 E.00768
G1 X110.762 Y174.379 E.02225
G2 X111.045 Y174.102 I-1.976 J-2.293 E.00766
G1 X110.239 Y173.296 E.02204
G2 X110.507 Y173.004 I-2.182 J-2.273 E.00767
G1 X111.32 Y173.817 E.02223
G1 X111.576 Y173.512 E.00768
G1 X110.759 Y172.696 E.02232
G2 X110.996 Y172.373 I-1.726 J-1.517 E.00775
G1 X111.817 Y173.194 E.02244
G1 X112.048 Y172.865 E.00777
G1 X111.214 Y172.031 E.02279
G2 X111.409 Y171.666 I-1.988 J-1.299 E.00801
G1 X112.255 Y172.512 E.02311
G2 X112.451 Y172.148 I-1.981 J-1.304 E.008
G1 X111.587 Y171.283 E.02363
G2 X111.744 Y170.88 I-2.224 J-1.1 E.00837
G1 X112.63 Y171.766 E.0242
G2 X112.786 Y171.362 I-2.229 J-1.094 E.00838
G1 X111.878 Y170.455 E.02481
G2 X111.98 Y169.997 I-2.563 J-.812 E.00908
G1 X112.927 Y170.943 E.02587
G1 X113.045 Y170.502 E.00884
G1 X112.053 Y169.509 E.02713
G2 X112.09 Y168.986 I-2.983 J-.472 E.01015
G1 X113.139 Y170.035 E.02868
G1 X113.204 Y169.54 E.00965
G1 X112.097 Y168.433 E.03025
G1 X112.097 Y167.873 E.01082
G1 X113.235 Y169.011 E.03109
G2 X113.245 Y168.461 I-6.326 J-.388 E.01064
G1 X112.097 Y167.313 E.03136
G1 X112.097 Y166.753 E.01082
G1 X113.245 Y167.901 E.03136
G1 X113.245 Y167.34 E.01082
G1 X112.097 Y166.193 E.03136
G1 X112.097 Y165.633 E.01082
G1 X113.245 Y166.78 E.03136
G1 X113.245 Y166.22 E.01082
G1 X112.097 Y165.073 E.03136
G1 X112.097 Y164.513 E.01082
G1 X113.245 Y165.66 E.03136
G1 X113.245 Y165.1 E.01082
G1 X112.097 Y163.953 E.03136
G1 X112.097 Y163.393 E.01082
G1 X113.245 Y164.54 E.03136
G1 X113.245 Y163.98 E.01082
G1 X112.097 Y162.833 E.03136
G1 X112.097 Y162.273 E.01082
G1 X113.245 Y163.42 E.03136
G1 X113.245 Y162.86 E.01082
G1 X112.097 Y161.712 E.03136
G1 X112.097 Y161.152 E.01082
G1 X113.245 Y162.3 E.03136
G1 X113.245 Y161.74 E.01082
G1 X112.097 Y160.592 E.03136
G1 X112.097 Y160.032 E.01082
G1 X113.245 Y161.18 E.03136
G1 X113.245 Y160.62 E.01082
G1 X112.097 Y159.472 E.03136
G1 X112.097 Y158.912 E.01082
G1 X113.245 Y160.06 E.03136
G1 X113.245 Y159.499 E.01082
G1 X112.097 Y158.352 E.03136
G1 X112.097 Y157.792 E.01082
G1 X113.245 Y158.939 E.03136
G1 X113.245 Y158.379 E.01082
G1 X112.097 Y157.232 E.03136
G1 X112.097 Y156.672 E.01082
G1 X113.245 Y157.819 E.03136
G1 X113.245 Y157.259 E.01082
G1 X112.097 Y156.112 E.03136
G1 X112.097 Y155.552 E.01082
G1 X113.245 Y156.699 E.03136
G1 X113.245 Y156.139 E.01082
G1 X112.097 Y154.992 E.03136
G1 X112.097 Y154.432 E.01082
G1 X113.245 Y155.579 E.03136
G1 X113.245 Y155.019 E.01082
G1 X112.097 Y153.871 E.03136
G1 X112.097 Y153.311 E.01082
G1 X113.245 Y154.459 E.03136
G1 X113.245 Y153.899 E.01082
G1 X112.097 Y152.751 E.03136
G1 X112.097 Y152.191 E.01082
G1 X113.245 Y153.339 E.03136
G1 X113.245 Y152.779 E.01082
G1 X112.097 Y151.631 E.03136
G1 X112.097 Y151.071 E.01082
G1 X113.245 Y152.219 E.03136
G1 X113.245 Y151.659 E.01082
G1 X112.097 Y150.511 E.03136
G1 X112.097 Y149.951 E.01082
G1 X113.245 Y151.098 E.03136
G1 X113.245 Y150.538 E.01082
G1 X112.097 Y149.391 E.03136
G1 X112.097 Y148.831 E.01082
G1 X113.245 Y149.978 E.03136
G1 X113.245 Y149.418 E.01082
G1 X112.097 Y148.271 E.03136
G1 X112.097 Y147.711 E.01082
G1 X113.245 Y148.858 E.03136
G1 X113.245 Y148.298 E.01082
G1 X112.097 Y147.151 E.03136
G1 X112.097 Y146.591 E.01082
G1 X113.245 Y147.738 E.03136
G1 X113.245 Y147.178 E.01082
G1 X112.097 Y146.031 E.03136
G1 X112.097 Y145.47 E.01082
G1 X113.245 Y146.618 E.03136
G1 X113.245 Y146.058 E.01082
G1 X112.097 Y144.91 E.03136
G1 X112.097 Y144.35 E.01082
G1 X113.245 Y145.498 E.03136
G1 X113.245 Y144.938 E.01082
G1 X112.097 Y143.79 E.03136
G1 X112.097 Y143.23 E.01082
G1 X113.245 Y144.378 E.03136
G1 X113.245 Y143.818 E.01082
G1 X112.097 Y142.67 E.03136
G1 X112.097 Y142.11 E.01082
G1 X113.245 Y143.257 E.03136
G1 X113.245 Y142.697 E.01082
G1 X112.097 Y141.55 E.03136
G1 X112.097 Y140.99 E.01082
G1 X113.245 Y142.137 E.03136
G1 X113.245 Y141.577 E.01082
G1 X112.097 Y140.43 E.03136
G1 X112.097 Y139.87 E.01082
G1 X113.245 Y141.017 E.03136
G1 X113.245 Y140.457 E.01082
G1 X112.097 Y139.31 E.03136
G1 X112.097 Y138.75 E.01082
G1 X113.245 Y139.897 E.03136
G1 X113.245 Y139.337 E.01082
G1 X112.097 Y138.19 E.03136
G1 X112.097 Y137.629 E.01082
G1 X113.245 Y138.777 E.03136
G1 X113.245 Y138.217 E.01082
G1 X112.097 Y137.069 E.03136
G1 X112.097 Y136.509 E.01082
G1 X113.245 Y137.657 E.03136
G1 X113.245 Y137.097 E.01082
G1 X112.097 Y135.949 E.03136
G1 X112.097 Y135.389 E.01082
G1 X113.245 Y136.537 E.03136
G1 X113.245 Y135.977 E.01082
G1 X112.097 Y134.829 E.03136
G1 X112.097 Y134.269 E.01082
G1 X113.245 Y135.417 E.03136
G1 X113.245 Y134.856 E.01082
G1 X112.097 Y133.709 E.03136
G1 X112.097 Y133.149 E.01082
G1 X113.245 Y134.296 E.03136
G1 X113.245 Y133.736 E.01082
G1 X112.097 Y132.589 E.03136
G1 X112.097 Y132.029 E.01082
G1 X113.245 Y133.176 E.03136
G1 X113.245 Y132.616 E.01082
G1 X112.097 Y131.469 E.03136
G1 X112.097 Y130.909 E.01082
G1 X113.245 Y132.056 E.03136
G1 X113.245 Y131.496 E.01082
G1 X112.097 Y130.349 E.03136
G1 X112.097 Y129.788 E.01082
G1 X113.245 Y130.936 E.03136
G1 X113.245 Y130.376 E.01082
G1 X112.097 Y129.228 E.03136
G1 X112.097 Y128.668 E.01082
G1 X113.245 Y129.816 E.03136
G1 X113.245 Y129.256 E.01082
G1 X112.097 Y128.108 E.03136
G1 X112.097 Y127.548 E.01082
G1 X113.245 Y128.696 E.03136
G1 X113.245 Y128.136 E.01082
G1 X112.097 Y126.988 E.03136
G1 X112.097 Y126.428 E.01082
G1 X113.245 Y127.576 E.03136
G1 X113.245 Y127.015 E.01082
G1 X112.097 Y125.868 E.03136
G1 X112.097 Y125.308 E.01082
G1 X113.245 Y126.455 E.03136
G1 X113.245 Y125.895 E.01082
G1 X112.097 Y124.748 E.03136
G1 X112.097 Y124.188 E.01082
G1 X113.245 Y125.335 E.03136
G1 X113.245 Y124.775 E.01082
G1 X112.097 Y123.628 E.03136
G1 X112.097 Y123.068 E.01082
G1 X113.245 Y124.215 E.03136
G1 X113.245 Y123.655 E.01082
G1 X112.097 Y122.508 E.03136
G1 X112.097 Y121.948 E.01082
G1 X113.422 Y123.272 E.03621
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.097 Y121.948 E-.2136
G1 X112.097 Y122.074 E-.0144
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.87 I1.125 J.464 P1  F28800
G1 X119.161 Y104.928 Z.87
G1 Z.47
G1 E.8 F1800
G1 F15000
G1 X118.196 Y103.964 E.02636
G1 X117.985 Y104.313 E.00788
G1 X118.821 Y105.148 E.02283
G1 X118.609 Y105.497 E.00788
G1 X117.774 Y104.661 E.02283
G1 X117.562 Y105.01 E.00788
G1 X118.398 Y105.845 E.02283
G1 X118.186 Y106.194 E.00788
G1 X117.351 Y105.359 E.02283
G1 X117.14 Y105.707 E.00788
G1 X117.975 Y106.543 E.02283
G1 X117.764 Y106.892 E.00788
G1 X116.928 Y106.056 E.02283
G1 X116.717 Y106.405 E.00788
G1 X117.552 Y107.24 E.02283
G1 X117.341 Y107.589 E.00788
G1 X116.506 Y106.754 E.02283
G1 X116.294 Y107.102 E.00788
G1 X117.13 Y107.938 E.02283
G1 X116.918 Y108.286 E.00788
G1 X116.083 Y107.451 E.02283
G1 X115.872 Y107.8 E.00788
G1 X116.707 Y108.635 E.02283
G1 X116.496 Y108.984 E.00788
G1 X115.66 Y108.148 E.02283
G1 X115.449 Y108.497 E.00788
G1 X116.284 Y109.333 E.02283
G1 X116.073 Y109.681 E.00788
G1 X115.238 Y108.846 E.02283
G1 X115.026 Y109.195 E.00788
G1 X115.862 Y110.03 E.02283
G1 X115.65 Y110.379 E.00788
G1 X114.815 Y109.543 E.02283
G1 X114.604 Y109.892 E.00788
G1 X115.442 Y110.731 E.02292
G1 X115.237 Y111.086 E.00792
G1 X114.398 Y110.246 E.02294
G2 X114.194 Y110.602 I4.142 J2.608 E.00793
G1 X115.043 Y111.452 E.02322
G2 X114.855 Y111.824 I4.333 J2.433 E.00805
G1 X114.001 Y110.97 E.02333
G2 X113.814 Y111.343 I4.345 J2.421 E.00806
G1 X114.676 Y112.204 E.02355
G2 X114.506 Y112.595 I4.569 J2.22 E.00823
G1 X113.635 Y111.723 E.02381
G2 X113.464 Y112.113 I4.562 J2.225 E.00822
G1 X114.342 Y112.991 E.02399
G1 X114.19 Y113.399 E.00842
G1 X113.298 Y112.507 E.02437
G1 X113.146 Y112.916 E.00842
G1 X114.047 Y113.816 E.02461
G2 X113.911 Y114.241 I4.992 J1.831 E.00861
G1 X113 Y113.329 E.02492
G1 X112.862 Y113.751 E.00859
G1 X113.789 Y114.678 E.02533
G2 X113.677 Y115.126 I5.282 J1.56 E.00893
G1 X112.736 Y114.185 E.02571
G2 X112.616 Y114.626 I5.187 J1.646 E.00882
G1 X113.574 Y115.583 E.02617
G1 X113.484 Y116.054 E.00925
G1 X112.51 Y115.079 E.02662
G2 X112.414 Y115.544 I5.482 J1.375 E.00916
G1 X113.409 Y116.538 E.02719
G2 X113.345 Y117.035 I5.886 J1.004 E.00968
G1 X112.34 Y116.03 E.02748
G1 X112.317 Y116.567 E.0104
G1 X113.295 Y117.545 E.02672
G1 X113.262 Y118.072 E.0102
G1 X112.295 Y117.105 E.02643
G1 X112.272 Y117.642 E.0104
G1 X113.248 Y118.618 E.02667
G2 X113.245 Y119.174 I13.28 J.363 E.01076
G1 X112.25 Y118.18 E.02719
G1 X112.227 Y118.717 E.0104
G1 X113.245 Y119.735 E.0278
G1 X113.245 Y120.295 E.01082
G1 X112.205 Y119.255 E.02842
G1 X112.185 Y119.724 E.00908
G1 X112.114 Y119.724 E.00138
G1 X113.245 Y120.855 E.0309
G1 X113.245 Y121.415 E.01082
G1 X111.554 Y119.724 E.04621
G1 X110.994 Y119.724 E.01082
G1 X113.245 Y121.975 E.06152
G1 X113.245 Y122.535 E.01082
G1 X112.097 Y121.387 E.03136
G1 X112.097 Y120.871 E.00997
G1 X111.581 Y120.871 E.00997
G1 X110.434 Y119.724 E.03136
G1 X109.874 Y119.724 E.01082
G1 X111.021 Y120.871 E.03136
G1 X110.461 Y120.871 E.01082
G1 X109.313 Y119.724 E.03136
G1 X108.753 Y119.724 E.01082
G1 X109.901 Y120.871 E.03136
G1 X109.341 Y120.871 E.01082
G1 X108.193 Y119.724 E.03136
G1 X107.633 Y119.724 E.01082
G1 X108.781 Y120.871 E.03136
G1 X108.221 Y120.871 E.01082
G1 X107.073 Y119.724 E.03136
G1 X106.513 Y119.724 E.01082
G1 X107.661 Y120.871 E.03136
G1 X107.101 Y120.871 E.01082
G1 X105.953 Y119.724 E.03136
G1 X105.393 Y119.724 E.01082
G1 X106.54 Y120.871 E.03136
G1 X105.98 Y120.871 E.01082
G1 X104.833 Y119.724 E.03136
G1 X104.273 Y119.724 E.01082
G1 X105.42 Y120.871 E.03136
G1 X104.86 Y120.871 E.01082
G1 X103.713 Y119.724 E.03136
G1 X103.153 Y119.724 E.01082
G1 X104.3 Y120.871 E.03136
G1 X103.74 Y120.871 E.01082
G1 X102.593 Y119.724 E.03136
G1 X102.033 Y119.724 E.01082
G1 X103.18 Y120.871 E.03136
G1 X102.62 Y120.871 E.01082
G1 X101.473 Y119.724 E.03136
G1 X100.912 Y119.724 E.01082
G1 X102.06 Y120.871 E.03136
G1 X101.5 Y120.871 E.01082
G1 X100.352 Y119.724 E.03136
G1 X99.792 Y119.724 E.01082
G1 X100.94 Y120.871 E.03136
G1 X100.38 Y120.871 E.01082
G1 X98.201 Y118.692 E.05955
G2 X98.188 Y118.12 I-6.844 J-.138 E.01107
G1 X99.239 Y119.171 E.02872
G1 X99.215 Y118.586 E.01131
G1 X98.151 Y117.522 E.02908
G2 X98.088 Y116.899 I-7.461 J.441 E.01211
G1 X99.19 Y118.002 E.03013
G1 X99.166 Y117.417 E.01131
G1 X97.995 Y116.247 E.03198
G2 X97.869 Y115.56 I-8.248 J1.164 E.01349
G1 X99.141 Y116.832 E.03476
G1 X99.116 Y116.248 E.01131
G1 X97.701 Y114.833 E.03867
G2 X97.475 Y114.046 I-9.488 J2.305 E.01582
G1 X99.048 Y115.619 E.04298
G2 X98.897 Y114.908 I-8.541 J1.437 E.01404
G1 X97.18 Y113.191 E.04694
G2 X96.788 Y112.239 I-17.485 J6.639 E.01989
G1 X98.702 Y114.153 E.05231
G2 X98.452 Y113.343 I-9.779 J2.574 E.01639
G1 X96.231 Y111.122 E.0607
G2 X95.411 Y109.742 I-44.142 J25.299 E.03103
G1 X98.129 Y112.46 E.07428
G2 X97.689 Y111.459 I-12.143 J4.748 E.02113
G1 X94.549 Y108.32 E.08579
G1 X93.688 Y106.899 E.03213
G1 X97.069 Y110.28 E.09241
G2 X96.232 Y108.883 I-33.74 J19.267 E.03148
G1 X92.826 Y105.477 E.09308
G1 X91.964 Y104.055 E.03213
G1 X95.37 Y107.461 E.09308
G1 X94.509 Y106.039 E.03213
G1 X91.103 Y102.633 E.09308
G1 X90.241 Y101.212 E.03213
G1 X93.647 Y104.618 E.09308
G1 X92.884 Y103.359 E.02845
G1 X92.948 Y103.359 E.00124
G1 X89.38 Y99.79 E.09753
G1 X88.518 Y98.368 E.03213
G1 X93.508 Y103.359 E.13639
G1 X94.068 Y103.359 E.01082
G1 X87.656 Y96.947 E.17524
G1 X86.982 Y95.834 E.02514
G1 X87.104 Y95.834 E.00235
G1 X94.629 Y103.359 E.20564
G1 X95.189 Y103.359 E.01082
G1 X87.664 Y95.834 E.20564
G1 X88.224 Y95.834 E.01082
G1 X95.749 Y103.359 E.20564
G1 X96.309 Y103.359 E.01082
G1 X88.784 Y95.834 E.20564
G1 X89.344 Y95.834 E.01082
G1 X96.869 Y103.359 E.20564
G1 X97.429 Y103.359 E.01082
G1 X89.904 Y95.834 E.20564
G1 X90.464 Y95.834 E.01082
G1 X97.989 Y103.359 E.20564
G1 X98.549 Y103.359 E.01082
G1 X91.024 Y95.834 E.20564
G1 X91.584 Y95.834 E.01082
G1 X99.109 Y103.359 E.20564
G1 X99.669 Y103.359 E.01082
G1 X92.144 Y95.834 E.20564
G1 X92.704 Y95.834 E.01082
G1 X100.229 Y103.359 E.20564
G1 X100.789 Y103.359 E.01082
G1 X93.265 Y95.834 E.20564
G1 X93.825 Y95.834 E.01082
G1 X101.349 Y103.359 E.20564
G1 X101.909 Y103.359 E.01082
G1 X94.385 Y95.834 E.20564
G1 X94.945 Y95.834 E.01082
G1 X102.47 Y103.359 E.20564
G1 X103.03 Y103.359 E.01082
G1 X95.505 Y95.834 E.20564
G1 X96.065 Y95.834 E.01082
G1 X103.59 Y103.359 E.20564
G1 X104.15 Y103.359 E.01082
G1 X96.625 Y95.834 E.20564
G1 X97.185 Y95.834 E.01082
G1 X104.71 Y103.359 E.20564
G1 X105.27 Y103.359 E.01082
G1 X97.745 Y95.834 E.20564
G1 X98.305 Y95.834 E.01082
G1 X105.83 Y103.359 E.20564
G1 X106.39 Y103.359 E.01082
G1 X98.865 Y95.834 E.20564
G1 X99.425 Y95.834 E.01082
G1 X106.95 Y103.359 E.20564
G1 X107.51 Y103.359 E.01082
G1 X99.985 Y95.834 E.20564
G1 X100.545 Y95.834 E.01082
G1 X108.07 Y103.359 E.20564
G1 X108.63 Y103.359 E.01082
G1 X101.106 Y95.834 E.20564
G1 X101.666 Y95.834 E.01082
G1 X109.19 Y103.359 E.20565
M73 P50 R8
G1 X109.75 Y103.359 E.01082
G1 X102.226 Y95.834 E.20565
G1 X102.786 Y95.834 E.01082
G1 X110.31 Y103.359 E.20565
G1 X110.871 Y103.359 E.01082
G1 X103.346 Y95.834 E.20565
G1 X103.906 Y95.834 E.01082
G1 X111.431 Y103.359 E.20565
G1 X111.991 Y103.359 E.01082
G1 X104.466 Y95.834 E.20565
G1 X105.026 Y95.834 E.01082
G1 X112.551 Y103.359 E.20565
G1 X113.111 Y103.359 E.01082
G1 X105.586 Y95.834 E.20565
G1 X106.146 Y95.834 E.01082
G1 X113.671 Y103.359 E.20565
G1 X114.231 Y103.359 E.01082
G1 X106.706 Y95.834 E.20565
G1 X107.266 Y95.834 E.01082
G1 X114.791 Y103.359 E.20565
G1 X115.351 Y103.359 E.01082
G1 X107.826 Y95.834 E.20565
G1 X108.386 Y95.834 E.01082
G1 X115.911 Y103.359 E.20565
G1 X116.471 Y103.359 E.01082
G1 X108.947 Y95.834 E.20565
G1 X109.507 Y95.834 E.01082
G1 X117.031 Y103.359 E.20565
G1 X117.591 Y103.359 E.01082
G1 X110.067 Y95.834 E.20565
G1 X110.627 Y95.834 E.01082
G1 X119.243 Y104.45 E.23548
G1 X119.455 Y104.102 E.00788
G1 X111.187 Y95.834 E.22595
G1 X111.747 Y95.834 E.01082
G1 X119.666 Y103.753 E.21642
G1 X119.877 Y103.404 E.00788
G1 X112.307 Y95.834 E.20689
G1 X112.867 Y95.834 E.01082
G1 X120.089 Y103.056 E.19736
G1 X120.3 Y102.707 E.00788
G1 X113.427 Y95.834 E.18783
G1 X113.987 Y95.834 E.01082
G1 X120.511 Y102.358 E.1783
G1 X120.723 Y102.009 E.00788
G1 X114.547 Y95.834 E.16877
G1 X115.107 Y95.834 E.01082
G1 X120.934 Y101.661 E.15924
G1 X121.145 Y101.312 E.00788
G1 X115.667 Y95.834 E.14971
G1 X116.227 Y95.834 E.01082
G1 X121.357 Y100.963 E.14018
G1 X121.568 Y100.615 E.00788
G1 X116.787 Y95.834 E.13065
G1 X117.348 Y95.834 E.01082
G1 X121.779 Y100.266 E.12112
G1 X121.991 Y99.917 E.00788
G1 X117.908 Y95.834 E.11159
G1 X118.468 Y95.834 E.01082
G1 X122.202 Y99.568 E.10206
G1 X122.413 Y99.22 E.00788
G1 X119.028 Y95.834 E.09253
G1 X119.588 Y95.834 E.01082
G1 X122.625 Y98.871 E.083
G1 X122.836 Y98.522 E.00788
G1 X120.148 Y95.834 E.07347
G1 X120.708 Y95.834 E.01082
G1 X123.047 Y98.173 E.06394
G1 X123.259 Y97.825 E.00788
G1 X121.268 Y95.834 E.05441
G1 X121.828 Y95.834 E.01082
G1 X123.47 Y97.476 E.04488
G1 X123.682 Y97.127 E.00788
G1 X122.388 Y95.834 E.03535
G1 X122.948 Y95.834 E.01082
G1 X123.893 Y96.779 E.02582
G1 X124.104 Y96.43 E.00788
G1 X123.508 Y95.834 E.01629
G1 X124.068 Y95.834 E.01082
G1 X124.445 Y96.21 E.01029
G1 X125.053 Y93.965 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X125.447 Y94.36 E.01072
G1 X125.236 Y94.707
G1 X124.495 Y93.965 E.02017
G1 X123.937 Y93.965
G1 X125.026 Y95.054 E.02962
G1 X124.815 Y95.401
G1 X123.38 Y93.965 E.03907
G1 X122.822 Y93.965
G1 X124.474 Y95.617 E.04494
G1 X123.916 Y95.617
G1 X122.265 Y93.965 E.04494
G1 X121.707 Y93.965
G1 X123.359 Y95.617 E.04494
G1 X122.801 Y95.617
G1 X121.149 Y93.965 E.04494
G1 X120.592 Y93.965
G1 X122.243 Y95.617 E.04494
G1 X121.686 Y95.617
G1 X120.034 Y93.965 E.04494
G1 X119.476 Y93.965
G1 X121.128 Y95.617 E.04494
G1 X120.57 Y95.617
G1 X118.919 Y93.965 E.04494
G1 X118.361 Y93.965
G1 X120.013 Y95.617 E.04494
G1 X119.455 Y95.617
G1 X117.804 Y93.965 E.04494
G1 X117.246 Y93.965
G1 X118.898 Y95.617 E.04494
G1 X118.34 Y95.617
G1 X116.688 Y93.965 E.04494
G1 X116.131 Y93.965
G1 X117.782 Y95.617 E.04494
G1 X117.225 Y95.617
G1 X115.573 Y93.965 E.04494
G1 X115.015 Y93.965
G1 X116.667 Y95.617 E.04494
G1 X116.109 Y95.617
G1 X114.458 Y93.965 E.04494
G1 X113.9 Y93.965
G1 X115.552 Y95.617 E.04494
G1 X114.994 Y95.617
G1 X113.343 Y93.965 E.04494
G1 X112.785 Y93.965
G1 X114.437 Y95.617 E.04494
G1 X113.879 Y95.617
G1 X112.227 Y93.965 E.04494
G1 X111.67 Y93.965
G1 X113.321 Y95.617 E.04494
G1 X112.764 Y95.617
G1 X111.112 Y93.965 E.04494
G1 X110.554 Y93.965
G1 X112.206 Y95.617 E.04494
G1 X111.649 Y95.617
G1 X109.997 Y93.965 E.04494
G1 X109.439 Y93.965
G1 X111.091 Y95.617 E.04494
G1 X110.533 Y95.617
G1 X108.882 Y93.965 E.04494
G1 X108.324 Y93.965
G1 X109.976 Y95.617 E.04494
G1 X109.418 Y95.617
G1 X107.766 Y93.965 E.04494
G1 X107.209 Y93.965
G1 X108.86 Y95.617 E.04494
G1 X108.303 Y95.617
G1 X106.651 Y93.965 E.04494
G1 X106.093 Y93.965
G1 X107.745 Y95.617 E.04494
G1 X107.188 Y95.617
G1 X105.536 Y93.965 E.04494
G1 X104.978 Y93.965
G1 X106.63 Y95.617 E.04494
G1 X106.072 Y95.617
G1 X104.421 Y93.965 E.04494
G1 X103.863 Y93.965
G1 X105.515 Y95.617 E.04494
G1 X104.957 Y95.617
G1 X103.305 Y93.965 E.04494
G1 X102.748 Y93.965
G1 X104.399 Y95.617 E.04494
G1 X103.842 Y95.617
G1 X102.19 Y93.965 E.04494
G1 X101.633 Y93.965
G1 X103.284 Y95.617 E.04494
G1 X102.727 Y95.617
G1 X101.075 Y93.965 E.04494
G1 X100.517 Y93.965
G1 X102.169 Y95.617 E.04494
G1 X101.611 Y95.617
G1 X99.96 Y93.965 E.04494
G1 X99.402 Y93.965
G1 X101.054 Y95.617 E.04494
G1 X100.496 Y95.617
G1 X98.844 Y93.965 E.04494
G1 X98.287 Y93.965
G1 X99.938 Y95.617 E.04494
G1 X99.381 Y95.617
G1 X97.729 Y93.965 E.04494
G1 X97.172 Y93.965
G1 X98.823 Y95.617 E.04494
G1 X98.266 Y95.617
G1 X96.614 Y93.965 E.04494
G1 X96.056 Y93.965
G1 X97.708 Y95.617 E.04494
G1 X97.15 Y95.617
G1 X95.499 Y93.965 E.04494
G1 X94.941 Y93.965
G1 X96.593 Y95.617 E.04494
G1 X96.035 Y95.617
G1 X94.383 Y93.965 E.04494
G1 X93.826 Y93.965
G1 X95.477 Y95.617 E.04494
G1 X94.92 Y95.617
G1 X93.268 Y93.965 E.04494
G1 X92.711 Y93.965
G1 X94.362 Y95.617 E.04494
G1 X93.805 Y95.617
G1 X92.153 Y93.965 E.04494
G1 X91.595 Y93.965
M73 P50 R7
G1 X93.247 Y95.617 E.04494
G1 X92.689 Y95.617
G1 X91.038 Y93.965 E.04494
G1 X90.48 Y93.965
G1 X92.132 Y95.617 E.04494
G1 X91.574 Y95.617
G1 X89.922 Y93.965 E.04494
G1 X89.365 Y93.965
G1 X91.017 Y95.617 E.04494
G1 X90.459 Y95.617
G1 X88.807 Y93.965 E.04494
G1 X88.25 Y93.965
G1 X89.901 Y95.617 E.04494
G1 X89.344 Y95.617
G1 X87.692 Y93.965 E.04494
G1 X87.134 Y93.965
G1 X88.786 Y95.617 E.04494
G1 X88.228 Y95.617
G1 X86.577 Y93.965 E.04494
G1 X86.019 Y93.965
G1 X87.671 Y95.617 E.04494
G1 X87.113 Y95.617
G1 X86.224 Y94.728 E.02421
M204 S10000
G1 X85.822 Y93.946 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.103823
G1 F15000
G1 X85.862 Y94.122 E.00069
; LINE_WIDTH: 0.0747718
G1 X86.004 Y94.303 E.00055
; LINE_WIDTH: 0.122135
G1 X86.146 Y94.483 E.00108
; LINE_WIDTH: 0.169497
G1 X86.287 Y94.664 E.00161
; CHANGE_LAYER
; Z_HEIGHT: 0.588818
; LAYER_HEIGHT: 0.119055
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X86.146 Y94.483 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z.87 I-.878 J.843 P1  F28800
G1 X111.79 Y121.178 Z.87
G1 Z.589
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24981
G1 X99.657 Y168.804 E.98057
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97934
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90335
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.9022
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.989 I.808 J.91 P1  F28800
M73 P51 R7
G1 X111.891 Y119.409 Z.989
G1 Z.589
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07294
G3 X114.31 Y109.784 I17.417 J3.033 E.13449
G1 X118.018 Y103.666 E.14729
G1 X93.429 Y103.666 E.50627
G1 X97.137 Y109.784 E.1473
G3 X99.408 Y115.869 I-14.944 J9.043 E.13451
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25288
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.847 J3.09 E.12827
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44267
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.328 J9.264 E.12829
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.989 I1.032 J.645 P1  F28800
G1 X125.675 Y94.43 Z.989
G1 Z.589
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X115.81 Y110.708 E.39187
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02944
G3 X97.896 Y168.79 I-7.828 J-.002 E.50626
G1 X97.896 Y118.791 E1.02941
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X85.773 Y94.43 E.39187
G1 X125.615 Y94.43 E.82031
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X124.583 Y96.144 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.989 I.965 J.741 P1  F28800
G1 X127.113 Y92.847 Z.989
G1 Z.589
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.162 Y110.916 E.40427
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.95668
G3 X97.486 Y168.795 I-8.237 J-.007 E.49489
G1 X97.486 Y118.795 E.95667
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X84.334 Y92.847 E.40427
G1 X127.053 Y92.847 E.81738
G1 X126.851 Y93.149 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X126.021 Y94.56 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.989 I.968 J-.738 P1  F28800
G1 X125.745 Y94.198 Z.989
G1 Z.589
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X126.495 Y93.449 E.02027
G1 X126.322 Y93.064
G1 X125.187 Y94.198 E.0307
G1 X124.63 Y94.198
G1 X125.764 Y93.064 E.0307
G1 X125.206 Y93.064
G1 X124.072 Y94.198 E.0307
G1 X123.514 Y94.198
G1 X124.649 Y93.064 E.0307
G1 X124.091 Y93.064
G1 X122.956 Y94.198 E.0307
G1 X122.398 Y94.198
G1 X123.533 Y93.064 E.0307
G1 X122.975 Y93.064
G1 X121.84 Y94.198 E.0307
G1 X121.283 Y94.198
G1 X122.417 Y93.064 E.0307
G1 X121.859 Y93.064
G1 X120.725 Y94.198 E.0307
G1 X120.167 Y94.198
G1 X121.302 Y93.064 E.0307
G1 X120.744 Y93.064
G1 X119.609 Y94.198 E.0307
G1 X119.051 Y94.198
G1 X120.186 Y93.064 E.0307
G1 X119.628 Y93.064
G1 X118.493 Y94.198 E.0307
G1 X117.936 Y94.198
G1 X119.07 Y93.064 E.0307
G1 X118.512 Y93.064
G1 X117.378 Y94.198 E.0307
G1 X116.82 Y94.198
G1 X117.955 Y93.064 E.0307
G1 X117.397 Y93.064
G1 X116.262 Y94.198 E.0307
G1 X115.704 Y94.198
G1 X116.839 Y93.064 E.0307
G1 X116.281 Y93.064
G1 X115.146 Y94.198 E.0307
G1 X114.589 Y94.198
G1 X115.723 Y93.064 E.0307
G1 X115.165 Y93.064
G1 X114.031 Y94.198 E.0307
G1 X113.473 Y94.198
G1 X114.608 Y93.064 E.0307
G1 X114.05 Y93.064
G1 X112.915 Y94.198 E.0307
G1 X112.357 Y94.198
G1 X113.492 Y93.064 E.0307
G1 X112.934 Y93.064
G1 X111.799 Y94.198 E.0307
G1 X111.242 Y94.198
G1 X112.376 Y93.064 E.0307
G1 X111.818 Y93.064
G1 X110.684 Y94.198 E.0307
G1 X110.126 Y94.198
G1 X111.261 Y93.064 E.0307
G1 X110.703 Y93.064
G1 X109.568 Y94.198 E.0307
G1 X109.01 Y94.198
G1 X110.145 Y93.064 E.0307
G1 X109.587 Y93.064
G1 X108.452 Y94.198 E.0307
G1 X107.895 Y94.198
G1 X109.029 Y93.064 E.0307
G1 X108.471 Y93.064
G1 X107.337 Y94.198 E.0307
G1 X106.779 Y94.198
G1 X107.914 Y93.064 E.0307
G1 X107.356 Y93.064
G1 X106.221 Y94.198 E.0307
G1 X105.663 Y94.198
G1 X106.798 Y93.064 E.0307
G1 X106.24 Y93.064
G1 X105.105 Y94.198 E.0307
G1 X104.547 Y94.198
G1 X105.682 Y93.064 E.0307
G1 X105.124 Y93.064
G1 X103.99 Y94.198 E.0307
G1 X103.432 Y94.198
G1 X104.566 Y93.064 E.0307
G1 X104.009 Y93.064
G1 X102.874 Y94.198 E.0307
G1 X102.316 Y94.198
G1 X103.451 Y93.064 E.0307
G1 X102.893 Y93.064
G1 X101.758 Y94.198 E.0307
G1 X101.2 Y94.198
G1 X102.335 Y93.064 E.0307
G1 X101.777 Y93.064
G1 X100.643 Y94.198 E.0307
G1 X100.085 Y94.198
G1 X101.219 Y93.064 E.0307
G1 X100.662 Y93.064
G1 X99.527 Y94.198 E.0307
G1 X98.969 Y94.198
G1 X100.104 Y93.064 E.0307
G1 X99.546 Y93.064
G1 X98.411 Y94.198 E.0307
G1 X97.853 Y94.198
G1 X98.988 Y93.064 E.0307
G1 X98.43 Y93.064
G1 X97.296 Y94.198 E.0307
G1 X96.738 Y94.198
G1 X97.872 Y93.064 E.0307
G1 X97.315 Y93.064
G1 X96.18 Y94.198 E.0307
G1 X95.622 Y94.198
G1 X96.757 Y93.064 E.0307
G1 X96.199 Y93.064
G1 X95.064 Y94.198 E.0307
G1 X94.506 Y94.198
G1 X95.641 Y93.064 E.0307
G1 X95.083 Y93.064
G1 X93.949 Y94.198 E.0307
G1 X93.391 Y94.198
G1 X94.525 Y93.064 E.0307
G1 X93.968 Y93.064
G1 X92.833 Y94.198 E.0307
G1 X92.275 Y94.198
G1 X93.41 Y93.064 E.0307
G1 X92.852 Y93.064
G1 X91.717 Y94.198 E.0307
G1 X91.159 Y94.198
G1 X92.294 Y93.064 E.0307
G1 X91.736 Y93.064
G1 X90.602 Y94.198 E.0307
G1 X90.044 Y94.198
G1 X91.178 Y93.064 E.0307
G1 X90.621 Y93.064
G1 X89.486 Y94.198 E.0307
G1 X88.928 Y94.198
G1 X90.063 Y93.064 E.0307
G1 X89.505 Y93.064
G1 X88.37 Y94.198 E.0307
G1 X87.812 Y94.198
G1 X88.947 Y93.064 E.0307
G1 X88.389 Y93.064
G1 X87.255 Y94.198 E.0307
G1 X86.697 Y94.198
G1 X87.831 Y93.064 E.0307
G1 X87.274 Y93.064
G1 X86.139 Y94.198 E.0307
G1 X85.581 Y94.198
G1 X86.716 Y93.064 E.0307
G1 X86.158 Y93.064
G1 X85.262 Y93.96 E.02424
G1 X85.052 Y93.612
G1 X85.6 Y93.064 E.01484
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X85.052 Y93.612 E-.08842
G1 X85.262 Y93.96 E-.0463
M73 P52 R7
G1 X85.841 Y93.381 E-.09328
; WIPE_END
G1 E-.012 F1800
G17
G3 Z.989 I-1.052 J-.612 P1  F28800
G1 X85.444 Y94.062 Z.989
G1 Z.589
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.140689
G1 F15000
G1 X85.431 Y94.155 E.00052
; LINE_WIDTH: 0.15218
G1 X85.405 Y94.139 E.00019
; LINE_WIDTH: 0.0998263
G3 X85.311 Y94.038 I.083 J-.171 E.00051
G1 X94.603 Y106.207 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X93.777 Y107.033 E.02405
G3 X96.62 Y111.866 I-47.654 J31.283 E.11549
G1 X97.465 Y111.02 E.02461
G2 X95.811 Y108.201 I-34.181 J18.154 E.06731
G1 X92.444 Y104.834 E.09803
G1 X90.88 Y102.253 E.06214
G1 X91.878 Y101.256 E.02905
G1 X96.542 Y101.256 E.09602
G1 X98.638 Y103.352 E.06105
G1 X97.457 Y103.352 E.02432
G1 X99.554 Y101.256 E.06105
G1 X104.218 Y101.256 E.09602
G1 X106.314 Y103.352 E.06105
G1 X105.133 Y103.352 E.02432
G1 X107.23 Y101.256 E.06105
G1 X111.894 Y101.256 E.09602
G1 X113.99 Y103.352 E.06105
G1 X112.809 Y103.352 E.02432
G1 X114.906 Y101.256 E.06105
G1 X119.569 Y101.256 E.09602
G1 X120.567 Y102.253 E.02905
G1 X119.003 Y104.834 E.06214
G1 X115.636 Y108.201 E.09803
G2 X113.982 Y111.02 I32.523 J20.971 E.06731
G1 X114.828 Y111.866 E.02461
G3 X117.671 Y107.033 I50.499 J26.451 E.11549
G1 X116.845 Y106.207 E.02405
G1 X121.302 Y100.855 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X123.923 Y96.531 E.09674
G1 X87.524 Y96.531 E.69644
G1 X90.145 Y100.855 E.09674
G1 X121.242 Y100.855 E.59501
G1 X121.08 Y100.46 F28800
G1 F15000
G1 X123.223 Y96.925 E.07909
G1 X88.225 Y96.925 E.66964
G1 X90.367 Y100.46 E.07909
G1 X121.02 Y100.46 E.58651
G1 X120.858 Y100.066 F28800
G1 F15000
G1 X122.522 Y97.32 E.06144
G1 X88.925 Y97.32 E.64285
G1 X90.589 Y100.066 E.06144
G1 X120.798 Y100.066 E.57801
G1 X120.636 Y99.671 F28800
G1 F15000
G1 X121.822 Y97.714 E.04379
G1 X89.625 Y97.714 E.61605
G1 X90.811 Y99.671 E.04379
G1 X120.576 Y99.671 E.5695
G1 X120.414 Y99.277 F28800
G1 F15000
G1 X121.122 Y98.109 E.02614
G1 X90.325 Y98.109 E.58925
G1 X91.034 Y99.277 E.02614
G1 X120.354 Y99.277 E.561
G1 X120.194 Y98.886 F28800
; LINE_WIDTH: 0.412531
G1 F15000
G1 X120.428 Y98.499 E.00849
G1 X91.019 Y98.499 E.55205
G1 X91.254 Y98.886 E.00849
G1 X120.134 Y98.886 E.54212
G1 X123.63 Y96.314 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X125.235 Y94.709 E.04342
G1 X124.724 Y94.662
G1 X123.072 Y96.314 E.04469
G1 X122.514 Y96.314
G1 X124.166 Y94.662 E.04469
G1 X123.608 Y94.662
G1 X121.956 Y96.314 E.04469
G1 X121.399 Y96.314
G1 X123.05 Y94.662 E.04469
G1 X122.492 Y94.662
G1 X120.841 Y96.314 E.04469
G1 X120.283 Y96.314
G1 X121.934 Y94.662 E.04469
G1 X121.377 Y94.662
G1 X119.725 Y96.314 E.04469
G1 X119.167 Y96.314
G1 X120.819 Y94.662 E.04469
G1 X120.261 Y94.662
G1 X118.609 Y96.314 E.04469
G1 X118.052 Y96.314
G1 X119.703 Y94.662 E.04469
G1 X119.145 Y94.662
G1 X117.494 Y96.314 E.04469
G1 X116.936 Y96.314
G1 X118.587 Y94.662 E.04469
G1 X118.03 Y94.662
G1 X116.378 Y96.314 E.04469
G1 X115.82 Y96.314
G1 X117.472 Y94.662 E.04469
G1 X116.914 Y94.662
G1 X115.262 Y96.314 E.04469
G1 X114.705 Y96.314
G1 X116.356 Y94.662 E.04469
G1 X115.798 Y94.662
G1 X114.147 Y96.314 E.04469
G1 X113.589 Y96.314
G1 X115.24 Y94.662 E.04469
G1 X114.682 Y94.662
G1 X113.031 Y96.314 E.04469
G1 X112.473 Y96.314
G1 X114.125 Y94.662 E.04469
G1 X113.567 Y94.662
G1 X111.915 Y96.314 E.04469
G1 X111.358 Y96.314
G1 X113.009 Y94.662 E.04469
G1 X112.451 Y94.662
G1 X110.8 Y96.314 E.04469
G1 X110.242 Y96.314
G1 X111.893 Y94.662 E.04469
G1 X111.335 Y94.662
G1 X109.684 Y96.314 E.04469
G1 X109.126 Y96.314
G1 X110.778 Y94.662 E.04469
G1 X110.22 Y94.662
G1 X108.568 Y96.314 E.04469
G1 X108.011 Y96.314
G1 X109.662 Y94.662 E.04469
G1 X109.104 Y94.662
G1 X107.453 Y96.314 E.04469
G1 X106.895 Y96.314
G1 X108.546 Y94.662 E.04469
G1 X107.988 Y94.662
G1 X106.337 Y96.314 E.04469
G1 X105.779 Y96.314
G1 X107.431 Y94.662 E.04469
G1 X106.873 Y94.662
G1 X105.221 Y96.314 E.04469
G1 X104.664 Y96.314
G1 X106.315 Y94.662 E.04469
G1 X105.757 Y94.662
G1 X104.106 Y96.314 E.04469
G1 X103.548 Y96.314
G1 X105.199 Y94.662 E.04469
G1 X104.641 Y94.662
G1 X102.99 Y96.314 E.04469
G1 X102.432 Y96.314
G1 X104.084 Y94.662 E.04469
G1 X103.526 Y94.662
G1 X101.874 Y96.314 E.04469
G1 X101.316 Y96.314
G1 X102.968 Y94.662 E.04469
G1 X102.41 Y94.662
G1 X100.759 Y96.314 E.04469
G1 X100.201 Y96.314
G1 X101.852 Y94.662 E.04469
G1 X101.294 Y94.662
G1 X99.643 Y96.314 E.04469
G1 X99.085 Y96.314
G1 X100.737 Y94.662 E.04469
G1 X100.179 Y94.662
G1 X98.527 Y96.314 E.04469
G1 X97.969 Y96.314
G1 X99.621 Y94.662 E.04469
G1 X99.063 Y94.662
G1 X97.412 Y96.314 E.04469
G1 X96.854 Y96.314
G1 X98.505 Y94.662 E.04469
G1 X97.947 Y94.662
G1 X96.296 Y96.314 E.04469
G1 X95.738 Y96.314
G1 X97.39 Y94.662 E.04469
G1 X96.832 Y94.662
G1 X95.18 Y96.314 E.04469
G1 X94.622 Y96.314
G1 X96.274 Y94.662 E.04469
G1 X95.716 Y94.662
G1 X94.065 Y96.314 E.04469
G1 X93.507 Y96.314
G1 X95.158 Y94.662 E.04469
G1 X94.6 Y94.662
G1 X92.949 Y96.314 E.04469
G1 X92.391 Y96.314
G1 X94.043 Y94.662 E.04469
G1 X93.485 Y94.662
G1 X91.833 Y96.314 E.04469
G1 X91.275 Y96.314
G1 X92.927 Y94.662 E.04469
G1 X92.369 Y94.662
G1 X90.718 Y96.314 E.04469
G1 X90.16 Y96.314
G1 X91.811 Y94.662 E.04469
G1 X91.253 Y94.662
G1 X89.602 Y96.314 E.04469
G1 X89.044 Y96.314
G1 X90.696 Y94.662 E.04469
G1 X90.138 Y94.662
G1 X88.486 Y96.314 E.04469
G1 X87.928 Y96.314
G1 X89.58 Y94.662 E.04469
G1 X89.022 Y94.662
G1 X87.371 Y96.314 E.04469
G1 X87.045 Y96.082
G1 X88.464 Y94.662 E.03841
G1 X87.906 Y94.662
G1 X86.834 Y95.735 E.02901
G1 X86.624 Y95.387
G1 X87.348 Y94.662 E.01961
G1 X86.791 Y94.662
G1 X86.413 Y95.04 E.01022
M204 S10000
G1 X99.142 Y117.019 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.186 Y117.975 E.02785
G3 X98.198 Y118.264 I-3.434 J.294 E.00595
G1 X99.238 Y119.304 E.03028
G1 X99.256 Y119.73 E.00879
G1 X99.665 Y119.73 E.00841
G1 X100.799 Y120.865 E.03303
G1 X102.972 Y120.865 E.04475
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 X110.648 Y120.865 E.04475
G1 X111.783 Y119.73 E.03303
G1 X112.191 Y119.73 E.00841
G1 X112.209 Y119.304 E.00879
G1 X113.249 Y118.264 E.03028
G3 X113.262 Y117.975 I3.446 J.005 E.00595
G1 X112.305 Y117.019 E.02785
G1 X112.104 Y124.494 F28800
G1 F16200
G1 X113.238 Y125.628 E.03303
G1 X113.238 Y125.951 E.00665
G1 X112.104 Y127.085 E.03303
M73 P53 R7
G1 X112.104 Y132.17 E.10468
G1 X113.238 Y133.304 E.03303
G1 X113.238 Y133.627 E.00665
G1 X112.104 Y134.761 E.03303
G1 X112.104 Y139.846 E.10468
G1 X113.238 Y140.98 E.03303
G1 X113.238 Y141.303 E.00665
G1 X112.104 Y142.437 E.03303
G1 X112.104 Y147.522 E.10468
G1 X113.238 Y148.656 E.03303
G1 X113.238 Y148.979 E.00665
G1 X112.104 Y150.113 E.03303
G1 X112.104 Y155.198 E.10468
G1 X113.238 Y156.332 E.03303
G1 X113.238 Y156.655 E.00665
G1 X112.104 Y157.789 E.03303
G1 X112.104 Y162.873 E.10468
G1 X113.238 Y164.008 E.03303
G1 X113.238 Y164.331 E.00665
G1 X112.104 Y165.465 E.03303
G1 X112.104 Y168.811 E.06889
G3 X111.908 Y170.354 I-6.965 J-.101 E.03208
G1 X112.816 Y171.261 E.02643
G3 X109.289 Y175.41 I-7.394 J-2.712 E.11448
G1 X108.442 Y174.564 E.02466
G3 X103.002 Y174.567 I-2.724 J-5.795 E.11568
G1 X102.16 Y175.409 E.0245
G3 X98.63 Y171.263 I3.701 J-6.728 E.1146
G1 X99.541 Y170.352 E.02652
G3 X99.344 Y168.815 I6.555 J-1.623 E.03198
G1 X99.344 Y165.465 E.06896
G1 X98.209 Y164.331 E.03303
G1 X98.209 Y164.008 E.00665
G1 X99.344 Y162.873 E.03303
G1 X99.344 Y157.789 E.10468
G1 X98.209 Y156.655 E.03303
G1 X98.209 Y156.332 E.00665
G1 X99.344 Y155.198 E.03303
G1 X99.344 Y150.113 E.10468
G1 X98.209 Y148.979 E.03303
G1 X98.209 Y148.656 E.00665
G1 X99.344 Y147.522 E.03303
G1 X99.344 Y142.437 E.10468
G1 X98.209 Y141.303 E.03303
G1 X98.209 Y140.98 E.00665
G1 X99.344 Y139.846 E.03303
G1 X99.344 Y134.761 E.10468
G1 X98.209 Y133.627 E.03303
G1 X98.209 Y133.304 E.00665
G1 X99.344 Y132.17 E.03303
G1 X99.344 Y127.085 E.10468
G1 X98.209 Y125.951 E.03303
G1 X98.209 Y125.628 E.00665
G1 X99.344 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 0.707875
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.209 Y125.628 E-.18287
G1 X98.209 Y125.951 E-.03684
G1 X98.261 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z.989 I.409 J1.146 P1  F28800
G1 X111.79 Y121.178 Z.989
G1 Z.708
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.108 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z1.108
G1 Z.708
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.441 J3.042 E.13449
G1 X118.018 Y103.666 E.1473
G1 X93.429 Y103.666 E.50628
G1 X97.137 Y109.784 E.1473
G3 X99.408 Y115.869 I-14.968 J9.052 E.13451
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X112.336 Y113.055 I17.268 J2.919 E.05469
G1 X112.336 Y113.055 E0
G3 X113.958 Y109.575 I16.752 J5.693 E.0736
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.351 J9.273 E.12829
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.108 I1.032 J.646 P1  F28800
G1 X125.253 Y95.127 Z1.108
G1 Z.708
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X124.946 Y95.633 E.01219
G1 X115.81 Y110.708 E.36292
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X86.195 Y95.127 E.37511
G1 X125.193 Y95.127 E.80294
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X124.946 Y95.633 E-.06422
G1 X124.201 Y96.862 E-.16378
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.108 I.973 J.73 P1  F28800
G1 X126.691 Y93.544 Z1.108
G1 Z.708
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X125.296 Y95.846 E.05151
G1 X116.162 Y110.916 E.33719
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X84.756 Y93.544 E.38869
G1 X126.631 Y93.544 E.80124
G1 X126.428 Y93.845 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X125.628 Y95.274 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.108 I1.145 J.411 P1  F28800
G1 X125.975 Y94.307 Z1.108
G1 Z.708
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X125.428 Y93.76 E.01479
G1 X124.87 Y93.76
G1 X125.764 Y94.654 E.02419
G1 X125.447 Y94.895
G1 X124.312 Y93.76 E.0307
G1 X123.755 Y93.76
G1 X124.889 Y94.895 E.0307
G1 X124.331 Y94.895
G1 X123.197 Y93.76 E.0307
G1 X122.639 Y93.76
G1 X123.774 Y94.895 E.0307
G1 X123.216 Y94.895
G1 X122.081 Y93.76 E.0307
G1 X121.523 Y93.76
G1 X122.658 Y94.895 E.0307
G1 X122.1 Y94.895
G1 X120.965 Y93.76 E.0307
G1 X120.408 Y93.76
G1 X121.542 Y94.895 E.0307
G1 X120.984 Y94.895
G1 X119.85 Y93.76 E.0307
G1 X119.292 Y93.76
G1 X120.427 Y94.895 E.0307
G1 X119.869 Y94.895
G1 X118.734 Y93.76 E.0307
G1 X118.176 Y93.76
G1 X119.311 Y94.895 E.0307
G1 X118.753 Y94.895
G1 X117.618 Y93.76 E.0307
G1 X117.061 Y93.76
G1 X118.195 Y94.895 E.0307
G1 X117.637 Y94.895
G1 X116.503 Y93.76 E.0307
G1 X115.945 Y93.76
G1 X117.08 Y94.895 E.0307
G1 X116.522 Y94.895
G1 X115.387 Y93.76 E.0307
G1 X114.829 Y93.76
G1 X115.964 Y94.895 E.0307
G1 X115.406 Y94.895
G1 X114.271 Y93.76 E.0307
G1 X113.714 Y93.76
G1 X114.848 Y94.895 E.0307
G1 X114.29 Y94.895
G1 X113.156 Y93.76 E.0307
G1 X112.598 Y93.76
G1 X113.733 Y94.895 E.0307
G1 X113.175 Y94.895
G1 X112.04 Y93.76 E.0307
G1 X111.482 Y93.76
G1 X112.617 Y94.895 E.0307
G1 X112.059 Y94.895
G1 X110.924 Y93.76 E.0307
G1 X110.367 Y93.76
G1 X111.501 Y94.895 E.0307
G1 X110.943 Y94.895
G1 X109.809 Y93.76 E.0307
G1 X109.251 Y93.76
G1 X110.386 Y94.895 E.0307
G1 X109.828 Y94.895
G1 X108.693 Y93.76 E.0307
G1 X108.135 Y93.76
G1 X109.27 Y94.895 E.0307
G1 X108.712 Y94.895
G1 X107.577 Y93.76 E.0307
G1 X107.02 Y93.76
G1 X108.154 Y94.895 E.0307
G1 X107.596 Y94.895
G1 X106.462 Y93.76 E.0307
G1 X105.904 Y93.76
G1 X107.039 Y94.895 E.0307
G1 X106.481 Y94.895
G1 X105.346 Y93.76 E.0307
G1 X104.788 Y93.76
G1 X105.923 Y94.895 E.0307
G1 X105.365 Y94.895
G1 X104.23 Y93.76 E.0307
G1 X103.673 Y93.76
G1 X104.807 Y94.895 E.0307
G1 X104.249 Y94.895
G1 X103.115 Y93.76 E.0307
G1 X102.557 Y93.76
G1 X103.692 Y94.895 E.0307
G1 X103.134 Y94.895
G1 X101.999 Y93.76 E.0307
G1 X101.441 Y93.76
G1 X102.576 Y94.895 E.0307
G1 X102.018 Y94.895
G1 X100.883 Y93.76 E.0307
G1 X100.326 Y93.76
G1 X101.46 Y94.895 E.0307
G1 X100.902 Y94.895
G1 X99.768 Y93.76 E.0307
G1 X99.21 Y93.76
G1 X100.345 Y94.895 E.0307
G1 X99.787 Y94.895
G1 X98.652 Y93.76 E.0307
G1 X98.094 Y93.76
M73 P54 R7
G1 X99.229 Y94.895 E.0307
G1 X98.671 Y94.895
G1 X97.536 Y93.76 E.0307
G1 X96.978 Y93.76
G1 X98.113 Y94.895 E.0307
G1 X97.555 Y94.895
G1 X96.421 Y93.76 E.0307
G1 X95.863 Y93.76
G1 X96.997 Y94.895 E.0307
G1 X96.44 Y94.895
G1 X95.305 Y93.76 E.0307
G1 X94.747 Y93.76
G1 X95.882 Y94.895 E.0307
G1 X95.324 Y94.895
G1 X94.189 Y93.76 E.0307
G1 X93.631 Y93.76
G1 X94.766 Y94.895 E.0307
G1 X94.208 Y94.895
G1 X93.074 Y93.76 E.0307
G1 X92.516 Y93.76
G1 X93.65 Y94.895 E.0307
G1 X93.093 Y94.895
G1 X91.958 Y93.76 E.0307
G1 X91.4 Y93.76
G1 X92.535 Y94.895 E.0307
G1 X91.977 Y94.895
G1 X90.842 Y93.76 E.0307
G1 X90.284 Y93.76
G1 X91.419 Y94.895 E.0307
G1 X90.861 Y94.895
G1 X89.727 Y93.76 E.0307
G1 X89.169 Y93.76
G1 X90.303 Y94.895 E.0307
G1 X89.746 Y94.895
G1 X88.611 Y93.76 E.0307
G1 X88.053 Y93.76
G1 X89.188 Y94.895 E.0307
G1 X88.63 Y94.895
G1 X87.495 Y93.76 E.0307
G1 X86.937 Y93.76
G1 X88.072 Y94.895 E.0307
G1 X87.514 Y94.895
G1 X86.38 Y93.76 E.0307
G1 X85.822 Y93.76
G1 X86.956 Y94.895 E.0307
G1 X86.399 Y94.895
G1 X85.264 Y93.76 E.0307
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X86.399 Y94.895 E-.18293
G1 X86.794 Y94.895 E-.04507
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.108 I-.029 J-1.217 P1  F28800
G1 X85.963 Y94.915 Z1.108
G1 Z.708
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.241428
G1 F15000
G1 X85.83 Y94.745 E.00226
; LINE_WIDTH: 0.199292
G1 X85.697 Y94.575 E.00182
; LINE_WIDTH: 0.157157
G1 X85.564 Y94.405 E.00138
; LINE_WIDTH: 0.115021
G1 X85.431 Y94.236 E.00094
G1 X94.603 Y106.207 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X93.777 Y107.033 E.02405
G3 X96.62 Y111.866 I-47.655 J31.283 E.1155
G1 X97.465 Y111.02 E.02461
G2 X95.811 Y108.201 I-34.182 J18.155 E.06731
G1 X92.444 Y104.834 E.09804
G1 X90.88 Y102.253 E.06214
G1 X91.181 Y101.952 E.00877
G1 X97.238 Y101.952 E.12471
G1 X98.638 Y103.352 E.04076
G1 X97.457 Y103.352 E.02432
G1 X98.857 Y101.952 E.04076
G1 X104.914 Y101.952 E.12471
G1 X106.314 Y103.352 E.04076
G1 X105.133 Y103.352 E.02432
G1 X106.533 Y101.952 E.04076
G1 X112.59 Y101.952 E.12471
G1 X113.99 Y103.352 E.04076
G1 X112.809 Y103.352 E.02432
G1 X114.209 Y101.952 E.04076
G1 X120.266 Y101.952 E.12471
G1 X120.567 Y102.253 E.00877
G1 X119.003 Y104.834 E.06214
G1 X115.636 Y108.201 E.09804
G2 X113.982 Y111.02 I32.522 J20.97 E.06731
G1 X114.828 Y111.866 E.02461
G3 X117.671 Y107.033 I50.499 J26.451 E.1155
G1 X116.845 Y106.207 E.02405
G1 X120.88 Y101.551 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X123.501 Y97.227 E.09674
G1 X87.946 Y97.227 E.6803
G1 X90.567 Y101.551 E.09674
G1 X120.82 Y101.551 E.57887
G1 X120.658 Y101.157 F28800
G1 F15000
G1 X122.801 Y97.622 E.07909
G1 X88.647 Y97.622 E.6535
G1 X90.789 Y101.157 E.07909
G1 X120.598 Y101.157 E.57036
G1 X120.436 Y100.763 F28800
G1 F15000
G1 X122.1 Y98.016 E.06144
G1 X89.347 Y98.016 E.6267
G1 X91.011 Y100.763 E.06144
G1 X120.376 Y100.763 E.56186
G1 X120.214 Y100.368 F28800
G1 F15000
G1 X121.4 Y98.411 E.04379
G1 X90.047 Y98.411 E.5999
G1 X91.234 Y100.368 E.04379
G1 X120.154 Y100.368 E.55336
G1 X119.992 Y99.974 F28800
G1 F15000
G1 X120.7 Y98.805 E.02614
G1 X90.748 Y98.805 E.5731
G1 X91.456 Y99.974 E.02614
G1 X119.932 Y99.974 E.54486
G1 X119.771 Y99.583 F28800
; LINE_WIDTH: 0.412532
G1 F15000
G1 X120.006 Y99.196 E.00849
G1 X91.441 Y99.196 E.53621
G1 X91.676 Y99.583 E.00849
G1 X119.711 Y99.583 E.52628
G1 X124.613 Y95.735 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X124.238 Y95.359 E.01016
G1 X123.68 Y95.359
G1 X124.403 Y96.082 E.01956
G1 X124.192 Y96.429
G1 X123.122 Y95.359 E.02896
G1 X122.564 Y95.359
G1 X123.982 Y96.777 E.03836
G1 X123.658 Y97.01
G1 X122.006 Y95.359 E.04469
G1 X121.448 Y95.359
G1 X123.1 Y97.01 E.04469
G1 X122.542 Y97.01
G1 X120.891 Y95.359 E.04469
G1 X120.333 Y95.359
G1 X121.984 Y97.01 E.04469
G1 X121.426 Y97.01
G1 X119.775 Y95.359 E.04469
G1 X119.217 Y95.359
G1 X120.868 Y97.01 E.04469
G1 X120.311 Y97.01
G1 X118.659 Y95.359 E.04469
G1 X118.101 Y95.359
G1 X119.753 Y97.01 E.04469
G1 X119.195 Y97.01
G1 X117.544 Y95.359 E.04469
G1 X116.986 Y95.359
G1 X118.637 Y97.01 E.04469
G1 X118.079 Y97.01
G1 X116.428 Y95.359 E.04469
G1 X115.87 Y95.359
G1 X117.521 Y97.01 E.04469
G1 X116.964 Y97.01
G1 X115.312 Y95.359 E.04469
G1 X114.754 Y95.359
G1 X116.406 Y97.01 E.04469
G1 X115.848 Y97.01
G1 X114.196 Y95.359 E.04469
G1 X113.639 Y95.359
G1 X115.29 Y97.01 E.04469
G1 X114.732 Y97.01
G1 X113.081 Y95.359 E.04469
G1 X112.523 Y95.359
G1 X114.174 Y97.01 E.04469
G1 X113.617 Y97.01
G1 X111.965 Y95.359 E.04469
G1 X111.407 Y95.359
G1 X113.059 Y97.01 E.04469
G1 X112.501 Y97.01
G1 X110.849 Y95.359 E.04469
G1 X110.292 Y95.359
G1 X111.943 Y97.01 E.04469
G1 X111.385 Y97.01
G1 X109.734 Y95.359 E.04469
G1 X109.176 Y95.359
G1 X110.827 Y97.01 E.04469
G1 X110.27 Y97.01
G1 X108.618 Y95.359 E.04469
G1 X108.06 Y95.359
G1 X109.712 Y97.01 E.04469
G1 X109.154 Y97.01
G1 X107.502 Y95.359 E.04469
G1 X106.945 Y95.359
G1 X108.596 Y97.01 E.04469
G1 X108.038 Y97.01
G1 X106.387 Y95.359 E.04469
G1 X105.829 Y95.359
G1 X107.48 Y97.01 E.04469
G1 X106.923 Y97.01
G1 X105.271 Y95.359 E.04469
G1 X104.713 Y95.359
G1 X106.365 Y97.01 E.04469
G1 X105.807 Y97.01
G1 X104.155 Y95.359 E.04469
G1 X103.598 Y95.359
G1 X105.249 Y97.01 E.04469
G1 X104.691 Y97.01
G1 X103.04 Y95.359 E.04469
G1 X102.482 Y95.359
G1 X104.133 Y97.01 E.04469
G1 X103.576 Y97.01
G1 X101.924 Y95.359 E.04469
G1 X101.366 Y95.359
G1 X103.018 Y97.01 E.04469
G1 X102.46 Y97.01
G1 X100.808 Y95.359 E.04469
G1 X100.251 Y95.359
G1 X101.902 Y97.01 E.04469
G1 X101.344 Y97.01
G1 X99.693 Y95.359 E.04469
G1 X99.135 Y95.359
G1 X100.786 Y97.01 E.04469
G1 X100.228 Y97.01
G1 X98.577 Y95.359 E.04469
G1 X98.019 Y95.359
G1 X99.671 Y97.01 E.04469
G1 X99.113 Y97.01
G1 X97.461 Y95.359 E.04469
G1 X96.904 Y95.359
G1 X98.555 Y97.01 E.04469
G1 X97.997 Y97.01
G1 X96.346 Y95.359 E.04469
G1 X95.788 Y95.359
G1 X97.439 Y97.01 E.04469
G1 X96.881 Y97.01
G1 X95.23 Y95.359 E.04469
G1 X94.672 Y95.359
G1 X96.324 Y97.01 E.04469
G1 X95.766 Y97.01
G1 X94.114 Y95.359 E.04469
G1 X93.557 Y95.359
G1 X95.208 Y97.01 E.04469
G1 X94.65 Y97.01
G1 X92.999 Y95.359 E.04469
G1 X92.441 Y95.359
G1 X94.092 Y97.01 E.04469
G1 X93.534 Y97.01
G1 X91.883 Y95.359 E.04469
G1 X91.325 Y95.359
G1 X92.977 Y97.01 E.04469
G1 X92.419 Y97.01
G1 X90.767 Y95.359 E.04469
G1 X90.21 Y95.359
M73 P55 R7
G1 X91.861 Y97.01 E.04469
G1 X91.303 Y97.01
G1 X89.652 Y95.359 E.04469
G1 X89.094 Y95.359
G1 X90.745 Y97.01 E.04469
G1 X90.187 Y97.01
G1 X88.536 Y95.359 E.04469
G1 X87.978 Y95.359
G1 X89.63 Y97.01 E.04469
G1 X89.072 Y97.01
G1 X87.42 Y95.359 E.04469
G1 X86.862 Y95.359
G1 X88.514 Y97.01 E.04469
G1 X87.956 Y97.01
G1 X87.071 Y96.125 E.02395
M204 S10000
G1 X87.642 Y97.03 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0930816
G1 F15000
G1 X87.549 Y96.912 E.00049
G1 X124.564 Y95.339 F28800
; LINE_WIDTH: 0.120695
G1 F15000
G1 X124.758 Y95.533 E.00127
G1 X86.666 Y95.339 F28800
; LINE_WIDTH: 0.101507
G1 F15000
G1 X86.706 Y95.515 E.00067
; LINE_WIDTH: 0.0732626
G1 X86.849 Y95.698 E.00054
; LINE_WIDTH: 0.121103
G1 X86.992 Y95.88 E.00107
; LINE_WIDTH: 0.168943
G1 X87.135 Y96.062 E.00161
G1 X99.142 Y117.019 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.186 Y117.975 E.02785
G3 X98.198 Y118.264 I-3.434 J.294 E.00595
G1 X99.238 Y119.304 E.03028
G1 X99.256 Y119.73 E.00879
G1 X99.665 Y119.73 E.00841
G1 X100.799 Y120.865 E.03303
G1 X102.972 Y120.865 E.04475
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 X110.648 Y120.865 E.04475
G1 X111.783 Y119.73 E.03303
G1 X112.191 Y119.73 E.00841
G1 X112.209 Y119.304 E.00879
G1 X113.249 Y118.264 E.03028
G3 X113.262 Y117.975 I3.446 J.005 E.00595
G1 X112.305 Y117.019 E.02785
G1 X112.104 Y124.494 F28800
G1 F16200
G1 X113.238 Y125.628 E.03303
G1 X113.238 Y125.951 E.00665
G1 X112.104 Y127.085 E.03303
G1 X112.104 Y132.17 E.10468
G1 X113.238 Y133.304 E.03303
G1 X113.238 Y133.627 E.00665
G1 X112.104 Y134.761 E.03303
G1 X112.104 Y139.846 E.10468
G1 X113.238 Y140.98 E.03303
G1 X113.238 Y141.303 E.00665
G1 X112.104 Y142.437 E.03303
G1 X112.104 Y147.522 E.10468
G1 X113.238 Y148.656 E.03303
G1 X113.238 Y148.979 E.00665
G1 X112.104 Y150.113 E.03303
G1 X112.104 Y155.198 E.10468
G1 X113.238 Y156.332 E.03303
G1 X113.238 Y156.655 E.00665
G1 X112.104 Y157.789 E.03303
G1 X112.104 Y162.873 E.10468
G1 X113.238 Y164.008 E.03303
G1 X113.238 Y164.331 E.00665
G1 X112.104 Y165.465 E.03303
G1 X112.104 Y168.811 E.06889
G3 X111.908 Y170.354 I-6.965 J-.101 E.03208
G1 X112.817 Y171.263 E.02648
G3 X109.285 Y175.407 I-7.114 J-2.487 E.1147
G1 X108.442 Y174.564 E.02455
G3 X103.002 Y174.567 I-2.724 J-5.795 E.11568
G1 X102.16 Y175.409 E.0245
G3 X98.631 Y171.262 I3.692 J-6.717 E.11462
G1 X99.541 Y170.352 E.02649
G3 X99.344 Y168.815 I6.555 J-1.623 E.03198
G1 X99.344 Y165.465 E.06896
G1 X98.209 Y164.331 E.03303
G1 X98.209 Y164.008 E.00665
G1 X99.344 Y162.873 E.03303
G1 X99.344 Y157.789 E.10468
G1 X98.209 Y156.655 E.03303
G1 X98.209 Y156.332 E.00665
G1 X99.344 Y155.198 E.03303
G1 X99.344 Y150.113 E.10468
G1 X98.209 Y148.979 E.03303
G1 X98.209 Y148.656 E.00665
G1 X99.344 Y147.522 E.03303
G1 X99.344 Y142.437 E.10468
G1 X98.209 Y141.303 E.03303
G1 X98.209 Y140.98 E.00665
G1 X99.344 Y139.846 E.03303
G1 X99.344 Y134.761 E.10468
G1 X98.209 Y133.627 E.03303
G1 X98.209 Y133.304 E.00665
G1 X99.344 Y132.17 E.03303
G1 X99.344 Y127.085 E.10468
G1 X98.209 Y125.951 E.03303
G1 X98.209 Y125.628 E.00665
G1 X99.344 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 0.826932
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.209 Y125.628 E-.18287
G1 X98.209 Y125.951 E-.03684
G1 X98.261 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z1.108 I.409 J1.146 P1  F28800
G1 X111.79 Y121.178 Z1.108
G1 Z.827
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.227 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z1.227
G1 Z.827
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.464 J3.051 E.13449
G1 X118.018 Y103.666 E.1473
G1 X93.429 Y103.666 E.50628
G1 X97.137 Y109.784 E.1473
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.893 J3.107 E.12827
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.227 I1.031 J.646 P1  F28800
G1 X124.83 Y95.824 Z1.227
G1 Z.827
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X115.81 Y110.708 E.35834
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X86.617 Y95.824 E.35834
G1 X124.77 Y95.824 E.78555
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X123.739 Y97.537 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.227 I.965 J.741 P1  F28800
G1 X126.269 Y94.24 Z1.227
G1 Z.827
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.162 Y110.916 E.37311
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X85.178 Y94.24 E.37311
G1 X126.209 Y94.24 E.78508
G1 X126.004 Y94.54 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X125.177 Y95.953 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.227 I.979 J-.723 P1  F28800
G1 X124.91 Y95.592 Z1.227
G1 Z.827
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X125.636 Y94.865 E.01966
G1 X125.487 Y94.457
G1 X124.352 Y95.592 E.0307
G1 X123.794 Y95.592
G1 X124.929 Y94.457 E.0307
G1 X124.371 Y94.457
G1 X123.236 Y95.592 E.0307
G1 X122.678 Y95.592
G1 X123.813 Y94.457 E.0307
G1 X123.255 Y94.457
G1 X122.121 Y95.592 E.0307
G1 X121.563 Y95.592
G1 X122.697 Y94.457 E.0307
G1 X122.14 Y94.457
G1 X121.005 Y95.592 E.0307
G1 X120.447 Y95.592
G1 X121.582 Y94.457 E.0307
G1 X121.024 Y94.457
G1 X119.889 Y95.592 E.0307
G1 X119.331 Y95.592
G1 X120.466 Y94.457 E.0307
G1 X119.908 Y94.457
G1 X118.774 Y95.592 E.0307
G1 X118.216 Y95.592
G1 X119.35 Y94.457 E.0307
G1 X118.793 Y94.457
G1 X117.658 Y95.592 E.0307
G1 X117.1 Y95.592
G1 X118.235 Y94.457 E.0307
G1 X117.677 Y94.457
G1 X116.542 Y95.592 E.0307
G1 X115.984 Y95.592
G1 X117.119 Y94.457 E.0307
G1 X116.561 Y94.457
G1 X115.427 Y95.592 E.0307
G1 X114.869 Y95.592
G1 X116.003 Y94.457 E.0307
G1 X115.446 Y94.457
G1 X114.311 Y95.592 E.0307
G1 X113.753 Y95.592
G1 X114.888 Y94.457 E.0307
G1 X114.33 Y94.457
M73 P56 R7
G1 X113.195 Y95.592 E.0307
G1 X112.637 Y95.592
G1 X113.772 Y94.457 E.0307
G1 X113.214 Y94.457
G1 X112.08 Y95.592 E.0307
G1 X111.522 Y95.592
G1 X112.656 Y94.457 E.0307
G1 X112.099 Y94.457
G1 X110.964 Y95.592 E.0307
G1 X110.406 Y95.592
G1 X111.541 Y94.457 E.0307
G1 X110.983 Y94.457
G1 X109.848 Y95.592 E.0307
G1 X109.29 Y95.592
G1 X110.425 Y94.457 E.0307
G1 X109.867 Y94.457
G1 X108.733 Y95.592 E.0307
G1 X108.175 Y95.592
G1 X109.309 Y94.457 E.0307
G1 X108.752 Y94.457
G1 X107.617 Y95.592 E.0307
G1 X107.059 Y95.592
G1 X108.194 Y94.457 E.0307
G1 X107.636 Y94.457
G1 X106.501 Y95.592 E.0307
G1 X105.943 Y95.592
G1 X107.078 Y94.457 E.0307
G1 X106.52 Y94.457
G1 X105.385 Y95.592 E.0307
G1 X104.828 Y95.592
G1 X105.962 Y94.457 E.0307
G1 X105.404 Y94.457
G1 X104.27 Y95.592 E.0307
G1 X103.712 Y95.592
G1 X104.847 Y94.457 E.0307
G1 X104.289 Y94.457
G1 X103.154 Y95.592 E.0307
G1 X102.596 Y95.592
G1 X103.731 Y94.457 E.0307
G1 X103.173 Y94.457
G1 X102.038 Y95.592 E.0307
G1 X101.481 Y95.592
G1 X102.615 Y94.457 E.0307
G1 X102.057 Y94.457
G1 X100.923 Y95.592 E.0307
G1 X100.365 Y95.592
G1 X101.5 Y94.457 E.0307
G1 X100.942 Y94.457
G1 X99.807 Y95.592 E.0307
G1 X99.249 Y95.592
G1 X100.384 Y94.457 E.0307
G1 X99.826 Y94.457
G1 X98.691 Y95.592 E.0307
G1 X98.134 Y95.592
G1 X99.268 Y94.457 E.0307
G1 X98.71 Y94.457
G1 X97.576 Y95.592 E.0307
G1 X97.018 Y95.592
G1 X98.153 Y94.457 E.0307
G1 X97.595 Y94.457
G1 X96.46 Y95.592 E.0307
G1 X95.902 Y95.592
G1 X97.037 Y94.457 E.0307
G1 X96.479 Y94.457
G1 X95.344 Y95.592 E.0307
G1 X94.787 Y95.592
G1 X95.921 Y94.457 E.0307
G1 X95.363 Y94.457
G1 X94.229 Y95.592 E.0307
G1 X93.671 Y95.592
G1 X94.806 Y94.457 E.0307
G1 X94.248 Y94.457
G1 X93.113 Y95.592 E.0307
G1 X92.555 Y95.592
G1 X93.69 Y94.457 E.0307
G1 X93.132 Y94.457
G1 X91.997 Y95.592 E.0307
G1 X91.44 Y95.592
G1 X92.574 Y94.457 E.0307
G1 X92.016 Y94.457
G1 X90.882 Y95.592 E.0307
G1 X90.324 Y95.592
G1 X91.459 Y94.457 E.0307
G1 X90.901 Y94.457
G1 X89.766 Y95.592 E.0307
G1 X89.208 Y95.592
G1 X90.343 Y94.457 E.0307
G1 X89.785 Y94.457
G1 X88.65 Y95.592 E.0307
G1 X88.093 Y95.592
G1 X89.227 Y94.457 E.0307
G1 X88.669 Y94.457
G1 X87.535 Y95.592 E.0307
G1 X86.977 Y95.592
G1 X88.112 Y94.457 E.0307
G1 X87.554 Y94.457
G1 X86.419 Y95.592 E.0307
G1 X86.104 Y95.349
G1 X86.996 Y94.457 E.02413
G1 X86.438 Y94.457
G1 X85.894 Y95.002 E.01473
M204 S10000
G1 X92.444 Y104.834 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X95.811 Y108.201 E.09804
G3 X97.465 Y111.02 I-32.528 J20.974 E.06731
G1 X96.62 Y111.866 E.02461
G2 X93.777 Y107.033 I-50.498 J26.45 E.1155
G1 X94.603 Y106.207 E.02405
G1 X92.873 Y103.352 E.06873
G1 X97.457 Y103.352 E.0944
G1 X98.16 Y102.649 E.02048
G1 X97.935 Y102.649 E.00464
G1 X98.638 Y103.352 E.02048
G1 X105.133 Y103.352 E.13373
G1 X105.836 Y102.649 E.02048
G1 X105.611 Y102.649 E.00464
G1 X106.314 Y103.352 E.02048
G1 X112.809 Y103.352 E.13373
G1 X113.512 Y102.649 E.02048
G1 X113.287 Y102.649 E.00464
G1 X113.99 Y103.352 E.02048
G1 X118.575 Y103.352 E.0944
G1 X116.845 Y106.207 E.06873
G1 X117.671 Y107.033 E.02405
G2 X114.828 Y111.866 I47.656 J31.284 E.1155
G1 X113.982 Y111.02 E.02461
G3 X115.636 Y108.201 I34.177 J18.152 E.06731
G1 X119.003 Y104.834 E.09804
G1 X120.458 Y102.248 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X123.079 Y97.924 E.09675
G1 X88.369 Y97.924 E.66414
G1 X90.989 Y102.248 E.09675
G1 X120.398 Y102.248 E.56271
G1 X120.236 Y101.854 F28800
G1 F15000
G1 X122.378 Y98.319 E.07909
G1 X89.069 Y98.319 E.63734
G1 X91.212 Y101.854 E.07909
G1 X120.176 Y101.854 E.5542
G1 X120.014 Y101.459 F28800
G1 F15000
G1 X121.678 Y98.713 E.06144
G1 X89.769 Y98.713 E.61054
G1 X91.434 Y101.459 E.06144
G1 X119.954 Y101.459 E.5457
G1 X119.791 Y101.065 F28800
G1 F15000
G1 X120.978 Y99.107 E.04379
G1 X90.47 Y99.107 E.58374
G1 X91.656 Y101.065 E.04379
G1 X119.731 Y101.065 E.5372
G1 X119.569 Y100.67 F28800
G1 F15000
G1 X120.277 Y99.502 E.02614
G1 X91.17 Y99.502 E.55695
G1 X91.878 Y100.67 E.02614
G1 X119.509 Y100.67 E.5287
G1 X119.349 Y100.28 F28800
; LINE_WIDTH: 0.412541
G1 F15000
G1 X119.584 Y99.893 E.00849
G1 X91.864 Y99.893 E.52037
G1 X92.098 Y100.28 E.00849
G1 X119.289 Y100.28 E.51044
G1 X122.794 Y97.707 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X124.376 Y96.125 E.04281
G1 X123.888 Y96.056
G1 X122.237 Y97.707 E.04469
G1 X121.679 Y97.707
G1 X123.33 Y96.056 E.04469
G1 X122.772 Y96.056
G1 X121.121 Y97.707 E.04469
G1 X120.563 Y97.707
G1 X122.215 Y96.056 E.04469
G1 X121.657 Y96.056
G1 X120.005 Y97.707 E.04469
G1 X119.447 Y97.707
G1 X121.099 Y96.056 E.04469
G1 X120.541 Y96.056
G1 X118.89 Y97.707 E.04469
G1 X118.332 Y97.707
G1 X119.983 Y96.056 E.04469
G1 X119.425 Y96.056
G1 X117.774 Y97.707 E.04469
G1 X117.216 Y97.707
G1 X118.868 Y96.056 E.04469
G1 X118.31 Y96.056
G1 X116.658 Y97.707 E.04469
G1 X116.1 Y97.707
G1 X117.752 Y96.056 E.04469
G1 X117.194 Y96.056
G1 X115.543 Y97.707 E.04469
G1 X114.985 Y97.707
G1 X116.636 Y96.056 E.04469
G1 X116.078 Y96.056
G1 X114.427 Y97.707 E.04469
G1 X113.869 Y97.707
G1 X115.52 Y96.056 E.04469
G1 X114.963 Y96.056
G1 X113.311 Y97.707 E.04469
G1 X112.753 Y97.707
G1 X114.405 Y96.056 E.04469
G1 X113.847 Y96.056
G1 X112.196 Y97.707 E.04469
G1 X111.638 Y97.707
G1 X113.289 Y96.056 E.04469
G1 X112.731 Y96.056
G1 X111.08 Y97.707 E.04469
G1 X110.522 Y97.707
G1 X112.173 Y96.056 E.04469
G1 X111.616 Y96.056
G1 X109.964 Y97.707 E.04469
G1 X109.406 Y97.707
G1 X111.058 Y96.056 E.04469
G1 X110.5 Y96.056
G1 X108.849 Y97.707 E.04469
G1 X108.291 Y97.707
G1 X109.942 Y96.056 E.04469
G1 X109.384 Y96.056
G1 X107.733 Y97.707 E.04469
G1 X107.175 Y97.707
G1 X108.826 Y96.056 E.04469
G1 X108.269 Y96.056
G1 X106.617 Y97.707 E.04469
G1 X106.059 Y97.707
G1 X107.711 Y96.056 E.04469
G1 X107.153 Y96.056
G1 X105.502 Y97.707 E.04469
G1 X104.944 Y97.707
G1 X106.595 Y96.056 E.04469
G1 X106.037 Y96.056
G1 X104.386 Y97.707 E.04469
G1 X103.828 Y97.707
M73 P56 R6
G1 X105.479 Y96.056 E.04469
G1 X104.922 Y96.056
G1 X103.27 Y97.707 E.04469
G1 X102.712 Y97.707
G1 X104.364 Y96.056 E.04469
G1 X103.806 Y96.056
G1 X102.154 Y97.707 E.04469
G1 X101.597 Y97.707
G1 X103.248 Y96.056 E.04469
G1 X102.69 Y96.056
G1 X101.039 Y97.707 E.04469
G1 X100.481 Y97.707
G1 X102.132 Y96.056 E.04469
G1 X101.575 Y96.056
G1 X99.923 Y97.707 E.04469
G1 X99.365 Y97.707
G1 X101.017 Y96.056 E.04469
M73 P57 R6
G1 X100.459 Y96.056
G1 X98.807 Y97.707 E.04469
G1 X98.25 Y97.707
G1 X99.901 Y96.056 E.04469
G1 X99.343 Y96.056
G1 X97.692 Y97.707 E.04469
G1 X97.134 Y97.707
G1 X98.785 Y96.056 E.04469
G1 X98.228 Y96.056
G1 X96.576 Y97.707 E.04469
G1 X96.018 Y97.707
G1 X97.67 Y96.056 E.04469
G1 X97.112 Y96.056
G1 X95.46 Y97.707 E.04469
G1 X94.903 Y97.707
G1 X96.554 Y96.056 E.04469
G1 X95.996 Y96.056
G1 X94.345 Y97.707 E.04469
G1 X93.787 Y97.707
G1 X95.438 Y96.056 E.04469
G1 X94.881 Y96.056
G1 X93.229 Y97.707 E.04469
G1 X92.671 Y97.707
G1 X94.323 Y96.056 E.04469
G1 X93.765 Y96.056
G1 X92.113 Y97.707 E.04469
G1 X91.556 Y97.707
G1 X93.207 Y96.056 E.04469
G1 X92.649 Y96.056
G1 X90.998 Y97.707 E.04469
G1 X90.44 Y97.707
G1 X92.091 Y96.056 E.04469
G1 X91.534 Y96.056
G1 X89.882 Y97.707 E.04469
G1 X89.324 Y97.707
G1 X90.976 Y96.056 E.04469
G1 X90.418 Y96.056
G1 X88.766 Y97.707 E.04469
G1 X88.209 Y97.707
G1 X89.86 Y96.056 E.04469
G1 X89.302 Y96.056
G1 X87.887 Y97.471 E.0383
G1 X87.676 Y97.124
G1 X88.744 Y96.056 E.0289
G1 X88.186 Y96.056
G1 X87.466 Y96.777 E.01951
G1 X87.255 Y96.429
G1 X87.629 Y96.056 E.01011
M204 S10000
G1 X88.071 Y97.569 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.148733
G1 F15000
G1 X88.069 Y97.661 E.00055
G1 X88.053 Y97.666 E.0001
; LINE_WIDTH: 0.147962
G1 X88.028 Y97.65 E.00018
; LINE_WIDTH: 0.0991251
G3 X87.935 Y97.549 I.089 J-.174 E.0005
G1 X99.142 Y117.019 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.186 Y117.975 E.02785
G3 X98.198 Y118.264 I-3.434 J.294 E.00595
G1 X99.238 Y119.304 E.03028
G1 X99.256 Y119.73 E.00879
G1 X99.665 Y119.73 E.00841
G1 X100.799 Y120.865 E.03303
G1 X102.972 Y120.865 E.04475
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 X110.648 Y120.865 E.04475
G1 X111.783 Y119.73 E.03303
G1 X112.191 Y119.73 E.00841
G1 X112.209 Y119.304 E.00879
G1 X113.249 Y118.264 E.03028
G3 X113.262 Y117.975 I3.446 J.005 E.00595
G1 X112.305 Y117.019 E.02785
G1 X112.104 Y124.494 F28800
G1 F16200
G1 X113.238 Y125.628 E.03303
G1 X113.238 Y125.951 E.00665
G1 X112.104 Y127.085 E.03303
G1 X112.104 Y132.17 E.10468
G1 X113.238 Y133.304 E.03303
G1 X113.238 Y133.627 E.00665
G1 X112.104 Y134.761 E.03303
G1 X112.104 Y139.846 E.10468
G1 X113.238 Y140.98 E.03303
G1 X113.238 Y141.303 E.00665
G1 X112.104 Y142.437 E.03303
G1 X112.104 Y147.522 E.10468
G1 X113.238 Y148.656 E.03303
G1 X113.238 Y148.979 E.00665
G1 X112.104 Y150.113 E.03303
G1 X112.104 Y155.198 E.10468
G1 X113.238 Y156.332 E.03303
G1 X113.238 Y156.655 E.00665
G1 X112.104 Y157.789 E.03303
G1 X112.104 Y162.873 E.10468
G1 X113.238 Y164.008 E.03303
G1 X113.238 Y164.331 E.00665
G1 X112.104 Y165.465 E.03303
G1 X112.104 Y168.811 E.06889
G3 X111.908 Y170.354 I-6.965 J-.101 E.03208
G1 X112.816 Y171.261 E.02643
G3 X109.287 Y175.409 I-7.374 J-2.699 E.11449
G1 X108.442 Y174.564 E.0246
G3 X103.002 Y174.567 I-2.724 J-5.795 E.11568
G1 X102.16 Y175.409 E.0245
G3 X98.63 Y171.263 I3.701 J-6.728 E.1146
G1 X99.541 Y170.352 E.02652
G3 X99.344 Y168.815 I6.556 J-1.623 E.03199
G1 X99.344 Y165.465 E.06896
G1 X98.209 Y164.331 E.03303
G1 X98.209 Y164.008 E.00665
G1 X99.344 Y162.873 E.03303
G1 X99.344 Y157.789 E.10468
G1 X98.209 Y156.655 E.03303
G1 X98.209 Y156.332 E.00665
G1 X99.344 Y155.198 E.03303
G1 X99.344 Y150.113 E.10468
G1 X98.209 Y148.979 E.03303
G1 X98.209 Y148.656 E.00665
G1 X99.344 Y147.522 E.03303
G1 X99.344 Y142.437 E.10468
G1 X98.209 Y141.303 E.03303
G1 X98.209 Y140.98 E.00665
G1 X99.344 Y139.846 E.03303
G1 X99.344 Y134.761 E.10468
G1 X98.209 Y133.627 E.03303
G1 X98.209 Y133.304 E.00665
G1 X99.344 Y132.17 E.03303
G1 X99.344 Y127.085 E.10468
G1 X98.209 Y125.951 E.03303
G1 X98.209 Y125.628 E.00665
G1 X99.344 Y124.494 E.03303
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.209 Y125.628 E-.18287
G1 X98.209 Y125.951 E-.03684
G1 X98.261 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.227 I-1.167 J.346 P1  F28800
G1 X111.696 Y171.353 Z1.227
G1 Z.827
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.490384
G1 F15000
G1 X111.581 Y171.589 E.00592
; CHANGE_LAYER
; Z_HEIGHT: 0.945989
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.696 Y171.353 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z1.227 I1.217 J.002 P1  F28800
G1 X111.79 Y121.178 Z1.227
G1 Z.946
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.346 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z1.346
G1 Z.946
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.487 J3.059 E.13449
G1 X118.018 Y103.666 E.1473
G1 X93.429 Y103.666 E.50628
G1 X97.137 Y109.784 E.1473
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.916 J3.115 E.12827
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.346 I1.031 J.647 P1  F28800
G1 X124.408 Y96.52 Z1.346
G1 Z.946
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X124.226 Y96.82 E.00722
G1 X115.81 Y110.708 E.33434
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X87.039 Y96.52 E.34156
G1 X124.348 Y96.52 E.76816
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X124.226 Y96.82 E-.0369
G1 X123.357 Y98.254 E-.1911
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.346 I.973 J.73 P1  F28800
G1 X125.847 Y94.937 Z1.346
G1 Z.946
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X124.576 Y97.033 E.04689
G1 X116.162 Y110.916 E.31063
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X85.601 Y94.937 E.35752
G1 X125.787 Y94.937 E.76892
G1 X125.581 Y95.236 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X124.787 Y96.669 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.346 I1.147 J.408 P1  F28800
G1 X125.133 Y95.696 Z1.346
G1 Z.946
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X124.59 Y95.154 E.01468
G1 X124.032 Y95.154
G1 X124.922 Y96.044 E.02408
G1 X124.609 Y96.288
G1 X123.474 Y95.154 E.0307
G1 X122.917 Y95.154
G1 X124.051 Y96.288 E.0307
G1 X123.493 Y96.288
G1 X122.359 Y95.154 E.0307
G1 X121.801 Y95.154
G1 X122.936 Y96.288 E.0307
G1 X122.378 Y96.288
G1 X121.243 Y95.154 E.0307
G1 X120.685 Y95.154
G1 X121.82 Y96.288 E.0307
G1 X121.262 Y96.288
G1 X120.127 Y95.154 E.0307
G1 X119.57 Y95.154
G1 X120.704 Y96.288 E.0307
G1 X120.146 Y96.288
G1 X119.012 Y95.154 E.0307
M73 P58 R6
G1 X118.454 Y95.154
G1 X119.589 Y96.288 E.0307
G1 X119.031 Y96.288
G1 X117.896 Y95.154 E.0307
G1 X117.338 Y95.154
G1 X118.473 Y96.288 E.0307
G1 X117.915 Y96.288
G1 X116.78 Y95.154 E.0307
G1 X116.223 Y95.154
G1 X117.357 Y96.288 E.0307
G1 X116.799 Y96.288
G1 X115.665 Y95.154 E.0307
G1 X115.107 Y95.154
G1 X116.242 Y96.288 E.0307
G1 X115.684 Y96.288
G1 X114.549 Y95.154 E.0307
G1 X113.991 Y95.154
G1 X115.126 Y96.288 E.0307
G1 X114.568 Y96.288
G1 X113.433 Y95.154 E.0307
G1 X112.876 Y95.154
G1 X114.01 Y96.288 E.0307
G1 X113.452 Y96.288
G1 X112.318 Y95.154 E.0307
G1 X111.76 Y95.154
G1 X112.895 Y96.288 E.0307
G1 X112.337 Y96.288
G1 X111.202 Y95.154 E.0307
G1 X110.644 Y95.154
G1 X111.779 Y96.288 E.0307
G1 X111.221 Y96.288
G1 X110.086 Y95.154 E.0307
G1 X109.529 Y95.154
G1 X110.663 Y96.288 E.0307
G1 X110.105 Y96.288
G1 X108.971 Y95.154 E.0307
G1 X108.413 Y95.154
G1 X109.548 Y96.288 E.0307
G1 X108.99 Y96.288
G1 X107.855 Y95.154 E.0307
G1 X107.297 Y95.154
G1 X108.432 Y96.288 E.0307
G1 X107.874 Y96.288
G1 X106.739 Y95.154 E.0307
G1 X106.182 Y95.154
G1 X107.316 Y96.288 E.0307
G1 X106.758 Y96.288
G1 X105.624 Y95.154 E.0307
G1 X105.066 Y95.154
G1 X106.201 Y96.288 E.0307
G1 X105.643 Y96.288
G1 X104.508 Y95.154 E.0307
G1 X103.95 Y95.154
G1 X105.085 Y96.288 E.0307
G1 X104.527 Y96.288
G1 X103.392 Y95.154 E.0307
G1 X102.835 Y95.154
G1 X103.969 Y96.288 E.0307
G1 X103.411 Y96.288
G1 X102.277 Y95.154 E.0307
G1 X101.719 Y95.154
G1 X102.854 Y96.288 E.0307
G1 X102.296 Y96.288
G1 X101.161 Y95.154 E.0307
G1 X100.603 Y95.154
G1 X101.738 Y96.288 E.0307
G1 X101.18 Y96.288
G1 X100.045 Y95.154 E.0307
G1 X99.488 Y95.154
G1 X100.622 Y96.288 E.0307
G1 X100.064 Y96.288
G1 X98.93 Y95.154 E.0307
G1 X98.372 Y95.154
G1 X99.507 Y96.288 E.0307
G1 X98.949 Y96.288
G1 X97.814 Y95.154 E.0307
G1 X97.256 Y95.154
G1 X98.391 Y96.288 E.0307
G1 X97.833 Y96.288
G1 X96.698 Y95.154 E.0307
G1 X96.14 Y95.154
G1 X97.275 Y96.288 E.0307
G1 X96.717 Y96.288
G1 X95.583 Y95.154 E.0307
G1 X95.025 Y95.154
G1 X96.159 Y96.288 E.0307
G1 X95.602 Y96.288
G1 X94.467 Y95.154 E.0307
G1 X93.909 Y95.154
G1 X95.044 Y96.288 E.0307
G1 X94.486 Y96.288
G1 X93.351 Y95.154 E.0307
G1 X92.793 Y95.154
G1 X93.928 Y96.288 E.0307
G1 X93.37 Y96.288
G1 X92.236 Y95.154 E.0307
G1 X91.678 Y95.154
G1 X92.812 Y96.288 E.0307
G1 X92.255 Y96.288
G1 X91.12 Y95.154 E.0307
G1 X90.562 Y95.154
G1 X91.697 Y96.288 E.0307
G1 X91.139 Y96.288
G1 X90.004 Y95.154 E.0307
G1 X89.446 Y95.154
G1 X90.581 Y96.288 E.0307
G1 X90.023 Y96.288
G1 X88.889 Y95.154 E.0307
G1 X88.331 Y95.154
G1 X89.465 Y96.288 E.0307
G1 X88.908 Y96.288
G1 X87.773 Y95.154 E.0307
G1 X87.215 Y95.154
G1 X88.35 Y96.288 E.0307
G1 X87.792 Y96.288
G1 X86.657 Y95.154 E.0307
G1 X86.099 Y95.154
G1 X87.234 Y96.288 E.0307
M204 S10000
G1 X86.804 Y96.308 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.235418
G1 F15000
G1 X86.675 Y96.144 E.00212
; LINE_WIDTH: 0.194784
G1 X86.546 Y95.98 E.00171
; LINE_WIDTH: 0.154151
G1 X86.418 Y95.816 E.0013
; LINE_WIDTH: 0.113518
G1 X86.289 Y95.652 E.00089
G1 X91.412 Y102.945 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X120.036 Y102.945 E.5477
G1 X122.656 Y98.621 E.09674
G1 X88.791 Y98.621 E.64798
G1 X91.38 Y102.893 E.0956
G1 X91.634 Y102.55 F28800
G1 F15000
G1 X119.814 Y102.55 E.5392
G1 X121.956 Y99.015 E.07909
G1 X89.491 Y99.015 E.62118
G1 X91.603 Y102.499 E.07795
G1 X91.856 Y102.156 F28800
G1 F15000
G1 X119.591 Y102.156 E.53069
G1 X121.256 Y99.41 E.06144
G1 X90.192 Y99.41 E.59439
G1 X91.825 Y102.105 E.0603
G1 X119.369 Y101.761 F28800
G1 F15000
G1 X120.555 Y99.804 E.04379
G1 X90.892 Y99.804 E.56759
G1 X92.078 Y101.761 E.04379
G1 X119.309 Y101.761 E.52104
G1 X92.3 Y101.367 F28800
G1 F15000
G1 X119.147 Y101.367 E.51369
G1 X119.855 Y100.199 E.02614
G1 X91.592 Y100.199 E.54079
G1 X92.269 Y101.316 E.02499
G1 X118.927 Y100.976 F28800
; LINE_WIDTH: 0.412532
G1 F15000
G1 X119.162 Y100.589 E.00849
G1 X92.286 Y100.589 E.50451
G1 X92.52 Y100.976 E.00849
G1 X118.867 Y100.976 E.49457
G1 X119.003 Y104.834 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X115.636 Y108.201 E.09804
G2 X113.982 Y111.02 I32.52 J20.969 E.06731
G1 X114.828 Y111.866 E.02461
G3 X117.671 Y107.033 I50.499 J26.451 E.1155
G1 X116.845 Y106.207 E.02405
G1 X118.575 Y103.352 E.06873
G1 X92.873 Y103.352 E.52919
G1 X94.603 Y106.207 E.06873
G1 X93.777 Y107.033 E.02405
G3 X96.62 Y111.866 I-47.654 J31.283 E.1155
G1 X97.465 Y111.02 E.02461
G2 X95.811 Y108.201 I-34.181 J18.154 E.06731
G1 X92.444 Y104.834 E.09804
G1 X99.142 Y117.019 F28800
G1 F16200
G1 X98.186 Y117.975 E.02785
G3 X98.198 Y118.264 I-3.434 J.294 E.00595
G1 X99.238 Y119.304 E.03028
G1 X99.256 Y119.73 E.00879
G1 X99.665 Y119.73 E.00841
G1 X100.799 Y120.865 E.03303
G1 X102.972 Y120.865 E.04475
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 X110.648 Y120.865 E.04475
G1 X111.783 Y119.73 E.03303
G1 X112.191 Y119.73 E.00841
G1 X112.209 Y119.304 E.00879
G1 X113.249 Y118.264 E.03028
G3 X113.262 Y117.975 I3.446 J.005 E.00595
G1 X112.305 Y117.019 E.02785
G1 X112.104 Y124.494 F28800
G1 F16200
G1 X113.238 Y125.628 E.03303
G1 X113.238 Y125.951 E.00665
G1 X112.104 Y127.085 E.03303
G1 X112.104 Y132.17 E.10468
G1 X113.238 Y133.304 E.03303
G1 X113.238 Y133.627 E.00665
G1 X112.104 Y134.761 E.03303
G1 X112.104 Y139.846 E.10468
G1 X113.238 Y140.98 E.03303
G1 X113.238 Y141.303 E.00665
G1 X112.104 Y142.437 E.03303
G1 X112.104 Y147.522 E.10468
G1 X113.238 Y148.656 E.03303
G1 X113.238 Y148.979 E.00665
G1 X112.104 Y150.113 E.03303
G1 X112.104 Y155.198 E.10468
G1 X113.238 Y156.332 E.03303
G1 X113.238 Y156.655 E.00665
G1 X112.104 Y157.789 E.03303
G1 X112.104 Y162.873 E.10468
G1 X113.238 Y164.008 E.03303
G1 X113.238 Y164.331 E.00665
G1 X112.104 Y165.465 E.03303
G1 X112.104 Y168.811 E.06889
G3 X111.908 Y170.354 I-6.965 J-.101 E.03208
G1 X112.817 Y171.263 E.02648
G3 X109.289 Y175.41 I-7.146 J-2.506 E.11468
G1 X108.442 Y174.564 E.02466
G3 X103.002 Y174.567 I-2.724 J-5.795 E.11568
G1 X102.16 Y175.409 E.0245
G3 X98.631 Y171.262 I3.844 J-6.848 E.11449
M73 P59 R6
G1 X99.541 Y170.352 E.02649
G3 X99.344 Y168.815 I6.556 J-1.623 E.03199
G1 X99.344 Y165.465 E.06896
G1 X98.209 Y164.331 E.03303
G1 X98.209 Y164.008 E.00665
G1 X99.344 Y162.873 E.03303
G1 X99.344 Y157.789 E.10468
G1 X98.209 Y156.655 E.03303
G1 X98.209 Y156.332 E.00665
G1 X99.344 Y155.198 E.03303
G1 X99.344 Y150.113 E.10468
G1 X98.209 Y148.979 E.03303
G1 X98.209 Y148.656 E.00665
G1 X99.344 Y147.522 E.03303
G1 X99.344 Y142.437 E.10468
G1 X98.209 Y141.303 E.03303
G1 X98.209 Y140.98 E.00665
G1 X99.344 Y139.846 E.03303
G1 X99.344 Y134.761 E.10468
G1 X98.209 Y133.627 E.03303
G1 X98.209 Y133.304 E.00665
G1 X99.344 Y132.17 E.03303
G1 X99.344 Y127.085 E.10468
G1 X98.209 Y125.951 E.03303
G1 X98.209 Y125.628 E.00665
G1 X99.344 Y124.494 E.03303
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.209 Y125.628 E-.18287
G1 X98.209 Y125.951 E-.03684
G1 X98.261 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.346 I.923 J.793 P1  F28800
G1 X123.4 Y96.752 Z1.346
G1 Z.946
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X123.771 Y97.124 E.01005
G1 X123.561 Y97.471
G1 X122.842 Y96.752 E.01945
G1 X122.284 Y96.752
G1 X123.35 Y97.819 E.02885
G1 X123.14 Y98.166
G1 X121.726 Y96.752 E.03825
G1 X121.168 Y96.752
G1 X122.82 Y98.404 E.04469
G1 X122.262 Y98.404
G1 X120.61 Y96.752 E.04469
G1 X120.053 Y96.752
G1 X121.704 Y98.404 E.04469
G1 X121.146 Y98.404
G1 X119.495 Y96.752 E.04469
G1 X118.937 Y96.752
G1 X120.588 Y98.404 E.04469
G1 X120.03 Y98.404
G1 X118.379 Y96.752 E.04469
G1 X117.821 Y96.752
G1 X119.473 Y98.404 E.04469
G1 X118.915 Y98.404
G1 X117.263 Y96.752 E.04469
G1 X116.706 Y96.752
G1 X118.357 Y98.404 E.04469
G1 X117.799 Y98.404
G1 X116.148 Y96.752 E.04469
G1 X115.59 Y96.752
G1 X117.241 Y98.404 E.04469
G1 X116.683 Y98.404
G1 X115.032 Y96.752 E.04469
G1 X114.474 Y96.752
G1 X116.126 Y98.404 E.04469
G1 X115.568 Y98.404
G1 X113.916 Y96.752 E.04469
G1 X113.358 Y96.752
G1 X115.01 Y98.404 E.04469
G1 X114.452 Y98.404
G1 X112.801 Y96.752 E.04469
G1 X112.243 Y96.752
G1 X113.894 Y98.404 E.04469
G1 X113.336 Y98.404
G1 X111.685 Y96.752 E.04469
G1 X111.127 Y96.752
G1 X112.779 Y98.404 E.04469
G1 X112.221 Y98.404
G1 X110.569 Y96.752 E.04469
G1 X110.011 Y96.752
G1 X111.663 Y98.404 E.04469
G1 X111.105 Y98.404
G1 X109.454 Y96.752 E.04469
G1 X108.896 Y96.752
G1 X110.547 Y98.404 E.04469
G1 X109.989 Y98.404
G1 X108.338 Y96.752 E.04469
G1 X107.78 Y96.752
G1 X109.432 Y98.404 E.04469
G1 X108.874 Y98.404
G1 X107.222 Y96.752 E.04469
G1 X106.664 Y96.752
G1 X108.316 Y98.404 E.04469
G1 X107.758 Y98.404
G1 X106.107 Y96.752 E.04469
G1 X105.549 Y96.752
G1 X107.2 Y98.404 E.04469
G1 X106.642 Y98.404
G1 X104.991 Y96.752 E.04469
G1 X104.433 Y96.752
G1 X106.085 Y98.404 E.04469
G1 X105.527 Y98.404
G1 X103.875 Y96.752 E.04469
G1 X103.317 Y96.752
G1 X104.969 Y98.404 E.04469
G1 X104.411 Y98.404
G1 X102.76 Y96.752 E.04469
G1 X102.202 Y96.752
G1 X103.853 Y98.404 E.04469
G1 X103.295 Y98.404
G1 X101.644 Y96.752 E.04469
G1 X101.086 Y96.752
G1 X102.738 Y98.404 E.04469
G1 X102.18 Y98.404
G1 X100.528 Y96.752 E.04469
G1 X99.97 Y96.752
G1 X101.622 Y98.404 E.04469
G1 X101.064 Y98.404
G1 X99.413 Y96.752 E.04469
G1 X98.855 Y96.752
G1 X100.506 Y98.404 E.04469
G1 X99.948 Y98.404
G1 X98.297 Y96.752 E.04469
G1 X97.739 Y96.752
G1 X99.39 Y98.404 E.04469
G1 X98.833 Y98.404
G1 X97.181 Y96.752 E.04469
G1 X96.623 Y96.752
G1 X98.275 Y98.404 E.04469
G1 X97.717 Y98.404
G1 X96.066 Y96.752 E.04469
G1 X95.508 Y96.752
G1 X97.159 Y98.404 E.04469
G1 X96.601 Y98.404
G1 X94.95 Y96.752 E.04469
G1 X94.392 Y96.752
G1 X96.043 Y98.404 E.04469
G1 X95.486 Y98.404
G1 X93.834 Y96.752 E.04469
G1 X93.276 Y96.752
G1 X94.928 Y98.404 E.04469
G1 X94.37 Y98.404
G1 X92.719 Y96.752 E.04469
G1 X92.161 Y96.752
G1 X93.812 Y98.404 E.04469
G1 X93.254 Y98.404
G1 X91.603 Y96.752 E.04469
G1 X91.045 Y96.752
G1 X92.696 Y98.404 E.04469
G1 X92.139 Y98.404
G1 X90.487 Y96.752 E.04469
G1 X89.929 Y96.752
G1 X91.581 Y98.404 E.04469
G1 X91.023 Y98.404
G1 X89.372 Y96.752 E.04469
G1 X88.814 Y96.752
G1 X90.465 Y98.404 E.04469
G1 X89.907 Y98.404
G1 X88.256 Y96.752 E.04469
G1 X87.698 Y96.752
G1 X89.349 Y98.404 E.04469
G1 X88.792 Y98.404
G1 X87.929 Y97.542 E.02333
M204 S10000
G1 X87.993 Y97.478 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.216783
G1 F15000
G1 X87.845 Y97.289 E.00223
; LINE_WIDTH: 0.168817
G1 X87.697 Y97.1 E.00167
; LINE_WIDTH: 0.120851
G1 X87.549 Y96.912 E.00111
; CHANGE_LAYER
; Z_HEIGHT: 1.06505
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X87.697 Y97.1 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z1.346 I-.86 J.861 P1  F28800
G1 X111.79 Y121.178 Z1.346
G1 Z1.065
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.465 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z1.465
G1 Z1.065
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.51 J3.068 E.13449
G1 X118.018 Y103.666 E.1473
G1 X93.429 Y103.666 E.50628
G1 X97.137 Y109.784 E.1473
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X112.315 Y113.117 I17.169 J2.9 E.05344
G1 X112.315 Y113.117 E0
G3 X113.958 Y109.575 I16.739 J5.612 E.07486
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.465 I1.031 J.647 P1  F28800
G1 X123.986 Y97.217 Z1.465
G1 Z1.065
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X123.867 Y97.414 E.00473
G1 X115.81 Y110.708 E.32006
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J.005 E.50652
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X87.461 Y97.217 E.32479
G1 X123.926 Y97.217 E.75078
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X123.867 Y97.414 E-.02341
G1 X122.937 Y98.949 E-.20459
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.465 I.973 J.73 P1  F28800
G1 X125.424 Y95.634 Z1.465
G1 Z1.065
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X124.217 Y97.626 E.04458
G1 X116.162 Y110.916 E.29735
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J0 E.49516
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X86.023 Y95.634 E.34193
G1 X125.364 Y95.634 E.75276
G1 X125.158 Y95.932 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X124.366 Y97.367 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.465 I.498 J-1.11 P1  F28800
G1 X123.516 Y96.985 Z1.465
G1 Z1.065
M73 P60 R6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X124.651 Y95.85 E.0307
G1 X124.093 Y95.85
G1 X122.959 Y96.985 E.0307
G1 X122.401 Y96.985
G1 X123.535 Y95.85 E.0307
G1 X122.978 Y95.85
G1 X121.843 Y96.985 E.0307
G1 X121.285 Y96.985
G1 X122.42 Y95.85 E.0307
G1 X121.862 Y95.85
G1 X120.727 Y96.985 E.0307
G1 X120.169 Y96.985
G1 X121.304 Y95.85 E.0307
G1 X120.746 Y95.85
G1 X119.612 Y96.985 E.0307
G1 X119.054 Y96.985
G1 X120.188 Y95.85 E.0307
G1 X119.631 Y95.85
G1 X118.496 Y96.985 E.0307
G1 X117.938 Y96.985
G1 X119.073 Y95.85 E.0307
G1 X118.515 Y95.85
G1 X117.38 Y96.985 E.0307
G1 X116.822 Y96.985
G1 X117.957 Y95.85 E.0307
G1 X117.399 Y95.85
G1 X116.265 Y96.985 E.0307
G1 X115.707 Y96.985
G1 X116.841 Y95.85 E.0307
G1 X116.284 Y95.85
G1 X115.149 Y96.985 E.0307
G1 X114.591 Y96.985
G1 X115.726 Y95.85 E.0307
G1 X115.168 Y95.85
G1 X114.033 Y96.985 E.0307
G1 X113.475 Y96.985
G1 X114.61 Y95.85 E.0307
G1 X114.052 Y95.85
G1 X112.918 Y96.985 E.0307
G1 X112.36 Y96.985
G1 X113.494 Y95.85 E.0307
G1 X112.937 Y95.85
G1 X111.802 Y96.985 E.0307
G1 X111.244 Y96.985
G1 X112.379 Y95.85 E.0307
G1 X111.821 Y95.85
G1 X110.686 Y96.985 E.0307
G1 X110.128 Y96.985
G1 X111.263 Y95.85 E.0307
G1 X110.705 Y95.85
G1 X109.571 Y96.985 E.0307
G1 X109.013 Y96.985
G1 X110.147 Y95.85 E.0307
G1 X109.59 Y95.85
G1 X108.455 Y96.985 E.0307
G1 X107.897 Y96.985
G1 X109.032 Y95.85 E.0307
G1 X108.474 Y95.85
G1 X107.339 Y96.985 E.0307
G1 X106.781 Y96.985
G1 X107.916 Y95.85 E.0307
G1 X107.358 Y95.85
G1 X106.223 Y96.985 E.0307
G1 X105.666 Y96.985
G1 X106.8 Y95.85 E.0307
G1 X106.242 Y95.85
G1 X105.108 Y96.985 E.0307
G1 X104.55 Y96.985
G1 X105.685 Y95.85 E.0307
G1 X105.127 Y95.85
G1 X103.992 Y96.985 E.0307
G1 X103.434 Y96.985
G1 X104.569 Y95.85 E.0307
G1 X104.011 Y95.85
G1 X102.876 Y96.985 E.0307
G1 X102.319 Y96.985
G1 X103.453 Y95.85 E.0307
G1 X102.895 Y95.85
G1 X101.761 Y96.985 E.0307
G1 X101.203 Y96.985
G1 X102.338 Y95.85 E.0307
G1 X101.78 Y95.85
G1 X100.645 Y96.985 E.0307
G1 X100.087 Y96.985
G1 X101.222 Y95.85 E.0307
G1 X100.664 Y95.85
G1 X99.529 Y96.985 E.0307
G1 X98.972 Y96.985
G1 X100.106 Y95.85 E.0307
G1 X99.548 Y95.85
G1 X98.414 Y96.985 E.0307
G1 X97.856 Y96.985
G1 X98.991 Y95.85 E.0307
G1 X98.433 Y95.85
G1 X97.298 Y96.985 E.0307
G1 X96.74 Y96.985
G1 X97.875 Y95.85 E.0307
G1 X97.317 Y95.85
G1 X96.182 Y96.985 E.0307
G1 X95.625 Y96.985
G1 X96.759 Y95.85 E.0307
G1 X96.201 Y95.85
G1 X95.067 Y96.985 E.0307
G1 X94.509 Y96.985
G1 X95.644 Y95.85 E.0307
G1 X95.086 Y95.85
G1 X93.951 Y96.985 E.0307
G1 X93.393 Y96.985
G1 X94.528 Y95.85 E.0307
G1 X93.97 Y95.85
G1 X92.835 Y96.985 E.0307
G1 X92.278 Y96.985
G1 X93.412 Y95.85 E.0307
G1 X92.854 Y95.85
G1 X91.72 Y96.985 E.0307
G1 X91.162 Y96.985
G1 X92.297 Y95.85 E.0307
G1 X91.739 Y95.85
G1 X90.604 Y96.985 E.0307
G1 X90.046 Y96.985
G1 X91.181 Y95.85 E.0307
G1 X90.623 Y95.85
G1 X89.488 Y96.985 E.0307
G1 X88.931 Y96.985
G1 X90.065 Y95.85 E.0307
G1 X89.507 Y95.85
G1 X88.373 Y96.985 E.0307
G1 X87.815 Y96.985
G1 X88.95 Y95.85 E.0307
G1 X88.392 Y95.85
G1 X87.257 Y96.985 E.0307
G1 X86.946 Y96.738
G1 X87.834 Y95.85 E.02402
G1 X87.276 Y95.85
G1 X86.736 Y96.391 E.01462
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X87.276 Y95.85 E-.08712
G1 X87.834 Y95.85 E-.06359
G1 X87.355 Y96.33 E-.07728
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.465 I.016 J1.217 P1  F28800
G1 X124.67 Y95.831 Z1.465
G1 Z1.065
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.21205
G1 F15000
G1 X124.884 Y95.938 E.00216
; LINE_WIDTH: 0.23972
G1 X124.866 Y95.993 E.0006
; LINE_WIDTH: 0.213849
G1 X124.848 Y96.047 E.00053
; LINE_WIDTH: 0.187976
G1 X124.698 Y96.239 E.00192
; LINE_WIDTH: 0.234352
G1 X124.548 Y96.43 E.00247
; LINE_WIDTH: 0.280727
G1 X124.397 Y96.622 E.00301
; LINE_WIDTH: 0.327103
G1 X124.247 Y96.813 E.00356
; LINE_WIDTH: 0.373478
G1 X124.097 Y97.005 E.00411
G1 X121.959 Y99.1 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X123.518 Y97.541 E.04219
G1 X123.053 Y97.449
G1 X121.401 Y99.1 E.04469
G1 X120.843 Y99.1
G1 X122.495 Y97.449 E.04469
G1 X121.937 Y97.449
G1 X120.285 Y99.1 E.04469
G1 X119.728 Y99.1
G1 X121.379 Y97.449 E.04469
G1 X120.821 Y97.449
G1 X119.17 Y99.1 E.04469
G1 X118.612 Y99.1
G1 X120.263 Y97.449 E.04469
G1 X119.706 Y97.449
G1 X118.054 Y99.1 E.04469
G1 X117.496 Y99.1
G1 X119.148 Y97.449 E.04469
G1 X118.59 Y97.449
G1 X116.938 Y99.1 E.04469
G1 X116.381 Y99.1
G1 X118.032 Y97.449 E.04469
G1 X117.474 Y97.449
G1 X115.823 Y99.1 E.04469
G1 X115.265 Y99.1
G1 X116.916 Y97.449 E.04469
G1 X116.358 Y97.449
G1 X114.707 Y99.1 E.04469
G1 X114.149 Y99.1
G1 X115.801 Y97.449 E.04469
G1 X115.243 Y97.449
G1 X113.591 Y99.1 E.04469
G1 X113.034 Y99.1
G1 X114.685 Y97.449 E.04469
G1 X114.127 Y97.449
G1 X112.476 Y99.1 E.04469
G1 X111.918 Y99.1
G1 X113.569 Y97.449 E.04469
G1 X113.011 Y97.449
G1 X111.36 Y99.1 E.04469
G1 X110.802 Y99.1
G1 X112.454 Y97.449 E.04469
G1 X111.896 Y97.449
G1 X110.244 Y99.1 E.04469
G1 X109.687 Y99.1
G1 X111.338 Y97.449 E.04469
G1 X110.78 Y97.449
G1 X109.129 Y99.1 E.04469
G1 X108.571 Y99.1
G1 X110.222 Y97.449 E.04469
G1 X109.664 Y97.449
G1 X108.013 Y99.1 E.04469
G1 X107.455 Y99.1
G1 X109.107 Y97.449 E.04469
G1 X108.549 Y97.449
G1 X106.897 Y99.1 E.04469
G1 X106.34 Y99.1
G1 X107.991 Y97.449 E.04469
G1 X107.433 Y97.449
G1 X105.782 Y99.1 E.04469
G1 X105.224 Y99.1
G1 X106.875 Y97.449 E.04469
G1 X106.317 Y97.449
G1 X104.666 Y99.1 E.04469
G1 X104.108 Y99.1
G1 X105.76 Y97.449 E.04469
G1 X105.202 Y97.449
G1 X103.55 Y99.1 E.04469
G1 X102.992 Y99.1
G1 X104.644 Y97.449 E.04469
G1 X104.086 Y97.449
G1 X102.435 Y99.1 E.04469
G1 X101.877 Y99.1
G1 X103.528 Y97.449 E.04469
G1 X102.97 Y97.449
G1 X101.319 Y99.1 E.04469
G1 X100.761 Y99.1
G1 X102.413 Y97.449 E.04469
G1 X101.855 Y97.449
G1 X100.203 Y99.1 E.04469
G1 X99.645 Y99.1
G1 X101.297 Y97.449 E.04469
G1 X100.739 Y97.449
G1 X99.088 Y99.1 E.04469
G1 X98.53 Y99.1
G1 X100.181 Y97.449 E.04469
G1 X99.623 Y97.449
G1 X97.972 Y99.1 E.04469
G1 X97.414 Y99.1
G1 X99.066 Y97.449 E.04469
M73 P61 R6
G1 X98.508 Y97.449
G1 X96.856 Y99.1 E.04469
G1 X96.298 Y99.1
G1 X97.95 Y97.449 E.04469
G1 X97.392 Y97.449
G1 X95.741 Y99.1 E.04469
G1 X95.183 Y99.1
G1 X96.834 Y97.449 E.04469
G1 X96.276 Y97.449
G1 X94.625 Y99.1 E.04469
G1 X94.067 Y99.1
G1 X95.719 Y97.449 E.04469
G1 X95.161 Y97.449
G1 X93.509 Y99.1 E.04469
G1 X92.951 Y99.1
G1 X94.603 Y97.449 E.04469
G1 X94.045 Y97.449
G1 X92.394 Y99.1 E.04469
G1 X91.836 Y99.1
G1 X93.487 Y97.449 E.04469
G1 X92.929 Y97.449
G1 X91.278 Y99.1 E.04469
G1 X90.72 Y99.1
G1 X92.372 Y97.449 E.04469
G1 X91.814 Y97.449
G1 X90.162 Y99.1 E.04469
G1 X89.604 Y99.1
G1 X91.256 Y97.449 E.04469
G1 X90.698 Y97.449
G1 X89.047 Y99.1 E.04469
G1 X88.729 Y98.861
G1 X90.14 Y97.449 E.03819
G1 X89.582 Y97.449
G1 X88.518 Y98.513 E.0288
G1 X88.308 Y98.166
G1 X89.024 Y97.449 E.0194
G1 X88.467 Y97.449
G1 X88.097 Y97.819 E.01
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X88.467 Y97.449 E-.05957
G1 X89.024 Y97.449 E-.06359
G1 X88.374 Y98.099 E-.10484
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.465 I-1.124 J.467 P1  F28800
G1 X99.344 Y124.494 Z1.465
G1 Z1.065
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.751 J-.085 E.03198
G1 X98.631 Y171.262 E.02649
G2 X102.16 Y175.409 I7.223 J-2.572 E.11461
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.289 Y175.41 E.02466
G2 X112.817 Y171.263 I-3.618 J-6.653 E.11468
G1 X111.908 Y170.354 E.02648
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.238 Y125.628 E-.18287
G1 X113.238 Y125.951 E-.03684
G1 X113.187 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.465 I1.184 J.28 P1  F28800
G1 X117.671 Y107.033 Z1.465
G1 Z1.065
G1 E.8 F1800
G1 F16200
G1 X116.845 Y106.207 E.02405
G1 X118.189 Y103.989 E.05338
G1 X118.279 Y104.042 E.00216
G1 X119.483 Y104.042 E.02479
G1 X119.003 Y104.834 E.01907
G1 X115.636 Y108.201 E.09804
G2 X113.982 Y111.02 I32.522 J20.97 E.06731
G1 X114.828 Y111.866 E.02461
G1 X112.305 Y117.019 F28800
G1 F16200
G1 X113.262 Y117.975 E.02785
G2 X113.249 Y118.264 I3.433 J.294 E.00595
G1 X112.209 Y119.304 E.03028
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.198 Y118.264 E.03028
G2 X98.186 Y117.975 I-3.447 J.005 E.00595
G1 X99.142 Y117.019 E.02785
G1 X96.62 Y111.866 F28800
G1 F16200
G1 X97.465 Y111.02 E.02461
G2 X95.811 Y108.201 I-34.181 J18.154 E.06731
G1 X92.444 Y104.834 E.09804
G1 X91.964 Y104.042 E.01907
G1 X93.168 Y104.042 E.02479
G1 X93.259 Y103.989 E.00216
G1 X94.603 Y106.207 E.05338
G1 X93.777 Y107.033 E.02405
G1 X92.936 Y103.641 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X92.883 Y103.556 E.00192
G1 X92.895 Y103.334 E.00425
G1 X93.052 Y103.256 E.00335
G1 X118.395 Y103.256 E.48492
G1 X118.552 Y103.334 E.00335
G1 X118.564 Y103.556 E.00425
G1 X118.512 Y103.641 E.00192
G1 X119.614 Y103.641 E.02108
G1 X122.234 Y99.317 E.09674
G1 X89.213 Y99.317 E.63183
G1 X91.834 Y103.641 E.09674
G1 X92.876 Y103.641 E.01993
G1 X92.573 Y103.247 F28800
G1 F15000
G1 X92.582 Y103.095 E.00292
G1 X92.965 Y102.868 E.00852
G1 X93.052 Y102.862 E.00168
G1 X118.395 Y102.862 E.48492
G1 X118.483 Y102.868 E.00168
G1 X118.866 Y103.095 E.00852
G1 X118.874 Y103.247 E.00292
G1 X119.391 Y103.247 E.0099
G1 X121.534 Y99.712 E.07909
G1 X89.913 Y99.712 E.60503
G1 X92.056 Y103.247 E.07909
G1 X92.513 Y103.247 E.00875
G1 X92.277 Y102.85 F28800
G1 F15000
G1 X92.907 Y102.478 E.014
G1 X93.052 Y102.467 E.00279
G1 X118.395 Y102.467 E.48492
G1 X118.541 Y102.478 E.00279
G1 X119.171 Y102.85 E.014
G1 X120.834 Y100.106 E.06139
G1 X90.614 Y100.106 E.57823
G1 X92.246 Y102.799 E.06024
G1 X92.427 Y102.337 F28800
G1 F15000
G1 X92.848 Y102.088 E.00937
G1 X93.052 Y102.073 E.00391
G1 X118.395 Y102.073 E.48492
G1 X118.599 Y102.088 E.00391
G1 X119.02 Y102.337 E.00937
G1 X120.133 Y100.501 E.04108
G1 X91.314 Y100.501 E.55143
G1 X92.396 Y102.286 E.03993
G1 X93.052 Y101.678 F28800
G1 F15000
G1 X118.395 Y101.678 E.48492
G1 X118.657 Y101.698 E.00503
G1 X118.87 Y101.824 E.00474
G1 X119.433 Y100.895 E.02077
G1 X92.014 Y100.895 E.52463
G1 X92.577 Y101.824 E.02077
G1 X92.79 Y101.698 E.00474
G1 X92.992 Y101.683 E.00388
G1 X92.731 Y101.299 F28800
; LINE_WIDTH: 0.414474
G1 F15000
G1 X118.657 Y101.296 E.48912
; CHANGE_LAYER
; Z_HEIGHT: 1.1841
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X116.657 Y101.297 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z1.465 I-1.182 J-.289 P1  F28800
G1 X111.79 Y121.178 Z1.465
G1 Z1.184
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.584 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z1.584
G1 Z1.184
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.532 J3.076 E.13448
G1 X118.018 Y103.666 E.1473
G1 X93.429 Y103.666 E.50628
G1 X97.137 Y109.784 E.1473
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.961 J3.132 E.12826
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.584 I1.03 J.648 P1  F28800
G1 X123.564 Y97.914 Z1.584
G1 Z1.184
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X115.81 Y110.708 E.30802
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X87.884 Y97.914 E.30802
G1 X123.504 Y97.914 E.73339
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.473 Y99.628 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.584 I.966 J.741 P1  F28800
M73 P62 R6
G1 X125.002 Y96.33 Z1.584
G1 Z1.184
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X123.857 Y98.219 E.04227
G1 X116.162 Y110.916 E.28407
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X86.445 Y96.33 E.32634
G1 X124.942 Y96.33 E.7366
G1 X124.734 Y96.627 F28800
G1 X124.291 Y97.086
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X123.752 Y96.547 E.01457
G1 X123.194 Y96.547
G1 X124.08 Y97.433 E.02397
G1 X123.771 Y97.682
G1 X122.636 Y96.547 E.0307
G1 X122.079 Y96.547
G1 X123.213 Y97.682 E.0307
G1 X122.655 Y97.682
G1 X121.521 Y96.547 E.0307
G1 X120.963 Y96.547
G1 X122.098 Y97.682 E.0307
G1 X121.54 Y97.682
G1 X120.405 Y96.547 E.0307
G1 X119.847 Y96.547
G1 X120.982 Y97.682 E.0307
G1 X120.424 Y97.682
G1 X119.289 Y96.547 E.0307
G1 X118.732 Y96.547
G1 X119.866 Y97.682 E.0307
G1 X119.308 Y97.682
G1 X118.174 Y96.547 E.0307
G1 X117.616 Y96.547
G1 X118.751 Y97.682 E.0307
G1 X118.193 Y97.682
G1 X117.058 Y96.547 E.0307
G1 X116.5 Y96.547
G1 X117.635 Y97.682 E.0307
G1 X117.077 Y97.682
G1 X115.942 Y96.547 E.0307
G1 X115.385 Y96.547
G1 X116.519 Y97.682 E.0307
G1 X115.961 Y97.682
G1 X114.827 Y96.547 E.0307
G1 X114.269 Y96.547
G1 X115.404 Y97.682 E.0307
G1 X114.846 Y97.682
G1 X113.711 Y96.547 E.0307
G1 X113.153 Y96.547
G1 X114.288 Y97.682 E.0307
G1 X113.73 Y97.682
G1 X112.595 Y96.547 E.0307
G1 X112.038 Y96.547
G1 X113.172 Y97.682 E.0307
G1 X112.614 Y97.682
G1 X111.48 Y96.547 E.0307
G1 X110.922 Y96.547
G1 X112.057 Y97.682 E.0307
G1 X111.499 Y97.682
G1 X110.364 Y96.547 E.0307
G1 X109.806 Y96.547
G1 X110.941 Y97.682 E.0307
G1 X110.383 Y97.682
G1 X109.248 Y96.547 E.0307
G1 X108.691 Y96.547
G1 X109.825 Y97.682 E.0307
G1 X109.267 Y97.682
G1 X108.133 Y96.547 E.0307
G1 X107.575 Y96.547
G1 X108.71 Y97.682 E.0307
G1 X108.152 Y97.682
G1 X107.017 Y96.547 E.0307
G1 X106.459 Y96.547
G1 X107.594 Y97.682 E.0307
G1 X107.036 Y97.682
G1 X105.901 Y96.547 E.0307
G1 X105.344 Y96.547
G1 X106.478 Y97.682 E.0307
G1 X105.92 Y97.682
G1 X104.786 Y96.547 E.0307
G1 X104.228 Y96.547
G1 X105.363 Y97.682 E.0307
G1 X104.805 Y97.682
G1 X103.67 Y96.547 E.0307
G1 X103.112 Y96.547
G1 X104.247 Y97.682 E.0307
G1 X103.689 Y97.682
G1 X102.554 Y96.547 E.0307
G1 X101.997 Y96.547
G1 X103.131 Y97.682 E.0307
G1 X102.573 Y97.682
G1 X101.439 Y96.547 E.0307
G1 X100.881 Y96.547
G1 X102.016 Y97.682 E.0307
G1 X101.458 Y97.682
G1 X100.323 Y96.547 E.0307
G1 X99.765 Y96.547
G1 X100.9 Y97.682 E.0307
G1 X100.342 Y97.682
G1 X99.207 Y96.547 E.0307
G1 X98.65 Y96.547
G1 X99.784 Y97.682 E.0307
G1 X99.226 Y97.682
G1 X98.092 Y96.547 E.0307
G1 X97.534 Y96.547
G1 X98.669 Y97.682 E.0307
G1 X98.111 Y97.682
G1 X96.976 Y96.547 E.0307
G1 X96.418 Y96.547
G1 X97.553 Y97.682 E.0307
G1 X96.995 Y97.682
G1 X95.86 Y96.547 E.0307
G1 X95.303 Y96.547
G1 X96.437 Y97.682 E.0307
G1 X95.879 Y97.682
G1 X94.745 Y96.547 E.0307
G1 X94.187 Y96.547
G1 X95.321 Y97.682 E.0307
G1 X94.764 Y97.682
G1 X93.629 Y96.547 E.0307
G1 X93.071 Y96.547
G1 X94.206 Y97.682 E.0307
G1 X93.648 Y97.682
G1 X92.513 Y96.547 E.0307
G1 X91.955 Y96.547
G1 X93.09 Y97.682 E.0307
G1 X92.532 Y97.682
G1 X91.398 Y96.547 E.0307
G1 X90.84 Y96.547
G1 X91.974 Y97.682 E.0307
G1 X91.417 Y97.682
G1 X90.282 Y96.547 E.0307
G1 X89.724 Y96.547
G1 X90.859 Y97.682 E.0307
G1 X90.301 Y97.682
G1 X89.166 Y96.547 E.0307
G1 X88.608 Y96.547
G1 X89.743 Y97.682 E.0307
G1 X89.185 Y97.682
G1 X88.051 Y96.547 E.0307
G1 X87.493 Y96.547
G1 X88.627 Y97.682 E.0307
G1 X88.07 Y97.682
G1 X86.935 Y96.547 E.0307
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X88.07 Y97.682 E-.18293
G1 X88.465 Y97.682 E-.04507
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.584 I-.029 J-1.217 P1  F28800
G1 X87.644 Y97.702 Z1.584
G1 Z1.184
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.229412
G1 F15000
G1 X87.52 Y97.543 E.00199
; LINE_WIDTH: 0.190281
G1 X87.396 Y97.385 E.00161
; LINE_WIDTH: 0.151149
G1 X87.271 Y97.226 E.00123
; LINE_WIDTH: 0.112017
G1 X87.147 Y97.068 E.00084
G1 X93.358 Y104.338 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X92.883 Y103.556 E.01751
G1 X92.893 Y103.337 E.00418
G1 X93.052 Y103.256 E.00343
G1 X118.395 Y103.256 E.48492
G1 X118.555 Y103.337 E.00343
G1 X118.564 Y103.556 E.00418
G1 X118.09 Y104.338 E.01751
G1 X119.191 Y104.338 E.02108
G1 X121.812 Y100.014 E.09674
G1 X89.635 Y100.014 E.61567
G1 X92.256 Y104.338 E.09674
G1 X93.298 Y104.338 E.01993
G1 X92.481 Y103.8 F28800
; LINE_WIDTH: 0.573298
G1 F15000
G1 X92.504 Y103.626 E.00465
; LINE_WIDTH: 0.534973
G1 X92.527 Y103.453 E.00433
; LINE_WIDTH: 0.496649
G1 X92.55 Y103.279 E.004
; LINE_WIDTH: 0.420252
G1 X92.574 Y103.105 E.00335
G1 X92.95 Y102.871 E.00849
G1 X93.052 Y102.862 E.00196
G1 X118.395 Y102.862 E.48523
G1 X118.549 Y102.882 E.00298
G1 X118.874 Y103.105 E.00754
; LINE_WIDTH: 0.42
G1 X118.897 Y103.279 E.00335
; LINE_WIDTH: 0.458321
G1 X118.92 Y103.453 E.00368
; LINE_WIDTH: 0.496643
G1 X118.944 Y103.626 E.004
; LINE_WIDTH: 0.534964
G1 X118.967 Y103.8 E.00433
; LINE_WIDTH: 0.573286
G1 X119.098 Y103.62 E.00593
; LINE_WIDTH: 0.534964
G1 X119.23 Y103.44 E.00551
; LINE_WIDTH: 0.496643
G1 X119.361 Y103.259 E.0051
; LINE_WIDTH: 0.420229
G1 X119.493 Y103.079 E.00427
G1 X121.112 Y100.409 E.05979
G1 X90.336 Y100.409 E.58921
G1 X91.954 Y103.079 E.05979
; LINE_WIDTH: 0.42
G1 X92.077 Y103.247 E.00398
; LINE_WIDTH: 0.458324
G1 X92.2 Y103.415 E.00437
; LINE_WIDTH: 0.496649
G1 X92.322 Y103.583 E.00475
; LINE_WIDTH: 0.534973
G1 X92.445 Y103.751 E.00514
G1 X92.28 Y102.856 F28800
; LINE_WIDTH: 0.42
G1 F15000
G1 X92.795 Y102.501 E.01196
G1 X93.052 Y102.467 E.00496
G1 X118.395 Y102.467 E.48492
G1 X118.652 Y102.501 E.00496
G1 X119.167 Y102.856 E.01196
G1 X120.411 Y100.803 E.04593
G1 X91.036 Y100.803 E.56207
G1 X92.249 Y102.805 E.04478
G1 X93.052 Y102.073 F28800
G1 F15000
G1 X118.395 Y102.073 E.48492
G1 X118.755 Y102.12 E.00694
G1 X119.035 Y102.313 E.0065
G1 X119.711 Y101.197 E.02496
G1 X91.736 Y101.197 E.53527
G1 X92.412 Y102.313 E.02496
G1 X92.692 Y102.12 E.0065
G1 X92.993 Y102.081 E.0058
G1 X92.57 Y101.667 F28800
; LINE_WIDTH: 0.570318
G1 F15000
G1 X92.811 Y101.651 E.00638
; LINE_WIDTH: 0.506706
G1 X93.052 Y101.635 E.00564
G1 X118.395 Y101.635 E.59151
; LINE_WIDTH: 0.506404
G1 X118.606 Y101.649 E.00494
; LINE_WIDTH: 0.538358
G1 X118.817 Y101.663 E.00526
G1 X122.929 Y98.513 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X122.562 Y98.146 E.00995
G1 X122.004 Y98.146
G1 X122.719 Y98.861 E.01934
G1 X122.508 Y99.208
G1 X121.446 Y98.146 E.02874
G1 X120.888 Y98.146
G1 X122.298 Y99.555 E.03814
G1 X121.982 Y99.797
G1 X120.33 Y98.146 E.04469
G1 X119.772 Y98.146
G1 X121.424 Y99.797 E.04469
G1 X120.866 Y99.797
G1 X119.215 Y98.146 E.04469
G1 X118.657 Y98.146
G1 X120.308 Y99.797 E.04469
G1 X119.75 Y99.797
G1 X118.099 Y98.146 E.04469
G1 X117.541 Y98.146
G1 X119.192 Y99.797 E.04469
G1 X118.635 Y99.797
G1 X116.983 Y98.146 E.04469
G1 X116.425 Y98.146
G1 X118.077 Y99.797 E.04469
G1 X117.519 Y99.797
G1 X115.868 Y98.146 E.04469
G1 X115.31 Y98.146
G1 X116.961 Y99.797 E.04469
G1 X116.403 Y99.797
M73 P63 R6
G1 X114.752 Y98.146 E.04469
G1 X114.194 Y98.146
G1 X115.845 Y99.797 E.04469
G1 X115.288 Y99.797
G1 X113.636 Y98.146 E.04469
G1 X113.078 Y98.146
G1 X114.73 Y99.797 E.04469
G1 X114.172 Y99.797
G1 X112.52 Y98.146 E.04469
G1 X111.963 Y98.146
G1 X113.614 Y99.797 E.04469
G1 X113.056 Y99.797
G1 X111.405 Y98.146 E.04469
G1 X110.847 Y98.146
G1 X112.498 Y99.797 E.04469
G1 X111.941 Y99.797
G1 X110.289 Y98.146 E.04469
G1 X109.731 Y98.146
G1 X111.383 Y99.797 E.04469
G1 X110.825 Y99.797
G1 X109.173 Y98.146 E.04469
G1 X108.616 Y98.146
G1 X110.267 Y99.797 E.04469
G1 X109.709 Y99.797
G1 X108.058 Y98.146 E.04469
G1 X107.5 Y98.146
G1 X109.151 Y99.797 E.04469
G1 X108.594 Y99.797
M73 P63 R5
G1 X106.942 Y98.146 E.04469
G1 X106.384 Y98.146
G1 X108.036 Y99.797 E.04469
G1 X107.478 Y99.797
G1 X105.826 Y98.146 E.04469
G1 X105.269 Y98.146
G1 X106.92 Y99.797 E.04469
G1 X106.362 Y99.797
G1 X104.711 Y98.146 E.04469
G1 X104.153 Y98.146
G1 X105.804 Y99.797 E.04469
G1 X105.247 Y99.797
G1 X103.595 Y98.146 E.04469
G1 X103.037 Y98.146
G1 X104.689 Y99.797 E.04469
G1 X104.131 Y99.797
G1 X102.479 Y98.146 E.04469
G1 X101.922 Y98.146
G1 X103.573 Y99.797 E.04469
G1 X103.015 Y99.797
G1 X101.364 Y98.146 E.04469
G1 X100.806 Y98.146
G1 X102.457 Y99.797 E.04469
G1 X101.9 Y99.797
G1 X100.248 Y98.146 E.04469
G1 X99.69 Y98.146
G1 X101.342 Y99.797 E.04469
G1 X100.784 Y99.797
G1 X99.132 Y98.146 E.04469
G1 X98.575 Y98.146
G1 X100.226 Y99.797 E.04469
G1 X99.668 Y99.797
G1 X98.017 Y98.146 E.04469
G1 X97.459 Y98.146
G1 X99.11 Y99.797 E.04469
G1 X98.552 Y99.797
G1 X96.901 Y98.146 E.04469
G1 X96.343 Y98.146
G1 X97.995 Y99.797 E.04469
G1 X97.437 Y99.797
G1 X95.785 Y98.146 E.04469
G1 X95.228 Y98.146
G1 X96.879 Y99.797 E.04469
G1 X96.321 Y99.797
G1 X94.67 Y98.146 E.04469
G1 X94.112 Y98.146
G1 X95.763 Y99.797 E.04469
G1 X95.205 Y99.797
G1 X93.554 Y98.146 E.04469
G1 X92.996 Y98.146
G1 X94.648 Y99.797 E.04469
G1 X94.09 Y99.797
G1 X92.438 Y98.146 E.04469
G1 X91.881 Y98.146
G1 X93.532 Y99.797 E.04469
G1 X92.974 Y99.797
G1 X91.323 Y98.146 E.04469
G1 X90.765 Y98.146
G1 X92.416 Y99.797 E.04469
G1 X91.858 Y99.797
G1 X90.207 Y98.146 E.04469
G1 X89.649 Y98.146
G1 X91.301 Y99.797 E.04469
G1 X90.743 Y99.797
G1 X89.091 Y98.146 E.04469
G1 X88.534 Y98.146
G1 X90.185 Y99.797 E.04469
G1 X89.627 Y99.797
G1 X88.787 Y98.958 E.02272
M204 S10000
G1 X88.851 Y98.894 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.216783
G1 F15000
G1 X88.703 Y98.705 E.00223
; LINE_WIDTH: 0.168817
G1 X88.555 Y98.516 E.00167
; LINE_WIDTH: 0.120851
G1 X88.407 Y98.328 E.00111
G1 X93.777 Y107.033 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X94.603 Y106.207 E.02405
G1 X93.705 Y104.725 E.03566
G1 X92.387 Y104.739 E.02714
G1 X95.811 Y108.201 E.10027
G3 X97.465 Y111.02 I-32.528 J20.974 E.06731
G1 X96.62 Y111.866 E.02461
G1 X99.142 Y117.019 F28800
G1 F16200
G1 X98.186 Y117.975 E.02785
G3 X98.198 Y118.264 I-3.434 J.294 E.00595
G1 X99.238 Y119.304 E.03028
G1 X99.256 Y119.73 E.00879
G1 X99.665 Y119.73 E.00841
G1 X100.799 Y120.865 E.03303
G1 X102.972 Y120.865 E.04475
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 X110.648 Y120.865 E.04475
G1 X111.783 Y119.73 E.03303
G1 X112.191 Y119.73 E.00841
G1 X112.209 Y119.304 E.00879
G1 X113.249 Y118.264 E.03028
G3 X113.262 Y117.975 I3.446 J.005 E.00595
G1 X112.305 Y117.019 E.02785
G1 X114.828 Y111.866 F28800
G1 F16200
G1 X113.982 Y111.02 E.02461
G3 X115.636 Y108.201 I34.177 J18.152 E.06731
G1 X119.061 Y104.739 E.10027
G1 X117.743 Y104.725 E.02714
G1 X116.845 Y106.207 E.03566
G1 X117.671 Y107.033 E.02405
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X116.845 Y106.207 E-.13314
G1 X117.276 Y105.495 E-.09486
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.584 I-1.174 J-.32 P1  F28800
G1 X112.104 Y124.494 Z1.584
G1 Z1.184
G1 E.8 F1800
G1 F16200
G1 X113.238 Y125.628 E.03303
G1 X113.238 Y125.951 E.00665
G1 X112.104 Y127.085 E.03303
G1 X112.104 Y132.17 E.10468
G1 X113.238 Y133.304 E.03303
G1 X113.238 Y133.627 E.00665
G1 X112.104 Y134.761 E.03303
G1 X112.104 Y139.846 E.10468
G1 X113.238 Y140.98 E.03303
G1 X113.238 Y141.303 E.00665
G1 X112.104 Y142.437 E.03303
G1 X112.104 Y147.522 E.10468
G1 X113.238 Y148.656 E.03303
G1 X113.238 Y148.979 E.00665
G1 X112.104 Y150.113 E.03303
G1 X112.104 Y155.198 E.10468
G1 X113.238 Y156.332 E.03303
G1 X113.238 Y156.655 E.00665
G1 X112.104 Y157.789 E.03303
G1 X112.104 Y162.873 E.10468
G1 X113.238 Y164.008 E.03303
G1 X113.238 Y164.331 E.00665
G1 X112.104 Y165.465 E.03303
G1 X112.104 Y168.811 E.06889
G3 X111.908 Y170.354 I-6.965 J-.101 E.03208
G1 X112.816 Y171.261 E.02643
G3 X109.289 Y175.41 I-7.394 J-2.712 E.11448
G1 X108.442 Y174.564 E.02466
G3 X103.002 Y174.567 I-2.724 J-5.795 E.11568
G1 X102.16 Y175.409 E.0245
G3 X98.63 Y171.263 I3.701 J-6.728 E.1146
G1 X99.541 Y170.352 E.02652
G3 X99.344 Y168.815 I6.554 J-1.622 E.03198
G1 X99.344 Y165.465 E.06896
G1 X98.209 Y164.331 E.03303
G1 X98.209 Y164.008 E.00665
G1 X99.344 Y162.873 E.03303
G1 X99.344 Y157.789 E.10468
G1 X98.209 Y156.655 E.03303
G1 X98.209 Y156.332 E.00665
G1 X99.344 Y155.198 E.03303
G1 X99.344 Y150.113 E.10468
G1 X98.209 Y148.979 E.03303
G1 X98.209 Y148.656 E.00665
G1 X99.344 Y147.522 E.03303
G1 X99.344 Y142.437 E.10468
G1 X98.209 Y141.303 E.03303
G1 X98.209 Y140.98 E.00665
G1 X99.344 Y139.846 E.03303
G1 X99.344 Y134.761 E.10468
G1 X98.209 Y133.627 E.03303
G1 X98.209 Y133.304 E.00665
G1 X99.344 Y132.17 E.03303
G1 X99.344 Y127.085 E.10468
G1 X98.209 Y125.951 E.03303
G1 X98.209 Y125.628 E.00665
G1 X99.344 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 1.30316
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.209 Y125.628 E-.18287
G1 X98.209 Y125.951 E-.03684
G1 X98.261 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z1.584 I.409 J1.146 P1  F28800
G1 X111.79 Y121.178 Z1.584
G1 Z1.303
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.703 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z1.703
G1 Z1.303
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.554 J3.084 E.13448
G1 X118.018 Y103.666 E.1473
G1 X93.429 Y103.666 E.50628
G1 X97.137 Y109.784 E.1473
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.983 J3.14 E.12826
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.703 I1.03 J.648 P1  F28800
G1 X123.141 Y98.61 Z1.703
G1 Z1.303
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X115.81 Y110.708 E.29125
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X88.306 Y98.61 E.29125
G1 X123.081 Y98.61 E.716
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.051 Y100.325 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.703 I.966 J.741 P1  F28800
G1 X124.58 Y97.027 Z1.703
M73 P64 R5
G1 Z1.303
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X123.497 Y98.813 E.03996
G1 X116.162 Y110.916 E.2708
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X107.239 Y176.893 I-8.26 J-.018 E.2183
G1 X107.239 Y176.893 E0
G3 X97.486 Y168.795 I-1.506 J-8.109 E.27664
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X86.867 Y97.027 E.31076
G1 X124.52 Y97.027 E.72045
G1 X124.31 Y97.322 F28800
G1 X123.816 Y97.244
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X122.681 Y98.379 E.0307
G1 X122.123 Y98.379
G1 X123.258 Y97.244 E.0307
G1 X122.7 Y97.244
G1 X121.565 Y98.379 E.0307
G1 X121.007 Y98.379
G1 X122.142 Y97.244 E.0307
G1 X121.584 Y97.244
G1 X120.45 Y98.379 E.0307
G1 X119.892 Y98.379
G1 X121.026 Y97.244 E.0307
G1 X120.469 Y97.244
G1 X119.334 Y98.379 E.0307
G1 X118.776 Y98.379
G1 X119.911 Y97.244 E.0307
G1 X119.353 Y97.244
G1 X118.218 Y98.379 E.0307
G1 X117.66 Y98.379
G1 X118.795 Y97.244 E.0307
G1 X118.237 Y97.244
G1 X117.103 Y98.379 E.0307
G1 X116.545 Y98.379
G1 X117.679 Y97.244 E.0307
G1 X117.122 Y97.244
G1 X115.987 Y98.379 E.0307
G1 X115.429 Y98.379
G1 X116.564 Y97.244 E.0307
G1 X116.006 Y97.244
G1 X114.871 Y98.379 E.0307
G1 X114.313 Y98.379
G1 X115.448 Y97.244 E.0307
G1 X114.89 Y97.244
G1 X113.756 Y98.379 E.0307
G1 X113.198 Y98.379
G1 X114.332 Y97.244 E.0307
G1 X113.775 Y97.244
G1 X112.64 Y98.379 E.0307
G1 X112.082 Y98.379
G1 X113.217 Y97.244 E.0307
G1 X112.659 Y97.244
G1 X111.524 Y98.379 E.0307
G1 X110.966 Y98.379
G1 X112.101 Y97.244 E.0307
G1 X111.543 Y97.244
G1 X110.409 Y98.379 E.0307
G1 X109.851 Y98.379
G1 X110.985 Y97.244 E.0307
G1 X110.428 Y97.244
G1 X109.293 Y98.379 E.0307
G1 X108.735 Y98.379
G1 X109.87 Y97.244 E.0307
G1 X109.312 Y97.244
G1 X108.177 Y98.379 E.0307
G1 X107.619 Y98.379
G1 X108.754 Y97.244 E.0307
G1 X108.196 Y97.244
G1 X107.061 Y98.379 E.0307
G1 X106.504 Y98.379
G1 X107.638 Y97.244 E.0307
G1 X107.08 Y97.244
G1 X105.946 Y98.379 E.0307
G1 X105.388 Y98.379
G1 X106.523 Y97.244 E.0307
G1 X105.965 Y97.244
G1 X104.83 Y98.379 E.0307
G1 X104.272 Y98.379
G1 X105.407 Y97.244 E.0307
G1 X104.849 Y97.244
G1 X103.714 Y98.379 E.0307
G1 X103.157 Y98.379
G1 X104.291 Y97.244 E.0307
G1 X103.733 Y97.244
G1 X102.599 Y98.379 E.0307
G1 X102.041 Y98.379
G1 X103.176 Y97.244 E.0307
G1 X102.618 Y97.244
G1 X101.483 Y98.379 E.0307
G1 X100.925 Y98.379
G1 X102.06 Y97.244 E.0307
G1 X101.502 Y97.244
G1 X100.367 Y98.379 E.0307
G1 X99.81 Y98.379
G1 X100.944 Y97.244 E.0307
G1 X100.386 Y97.244
G1 X99.252 Y98.379 E.0307
G1 X98.694 Y98.379
G1 X99.829 Y97.244 E.0307
G1 X99.271 Y97.244
G1 X98.136 Y98.379 E.0307
G1 X97.578 Y98.379
G1 X98.713 Y97.244 E.0307
G1 X98.155 Y97.244
G1 X97.02 Y98.379 E.0307
G1 X96.463 Y98.379
G1 X97.597 Y97.244 E.0307
G1 X97.039 Y97.244
G1 X95.905 Y98.379 E.0307
G1 X95.347 Y98.379
G1 X96.482 Y97.244 E.0307
G1 X95.924 Y97.244
G1 X94.789 Y98.379 E.0307
G1 X94.231 Y98.379
G1 X95.366 Y97.244 E.0307
G1 X94.808 Y97.244
G1 X93.673 Y98.379 E.0307
G1 X93.116 Y98.379
G1 X94.25 Y97.244 E.0307
G1 X93.692 Y97.244
G1 X92.558 Y98.379 E.0307
G1 X92 Y98.379
G1 X93.135 Y97.244 E.0307
G1 X92.577 Y97.244
G1 X91.442 Y98.379 E.0307
G1 X90.884 Y98.379
G1 X92.019 Y97.244 E.0307
G1 X91.461 Y97.244
G1 X90.326 Y98.379 E.0307
G1 X89.769 Y98.379
G1 X90.903 Y97.244 E.0307
G1 X90.345 Y97.244
G1 X89.211 Y98.379 E.0307
G1 X88.653 Y98.379
G1 X89.788 Y97.244 E.0307
G1 X89.23 Y97.244
G1 X88.095 Y98.379 E.0307
G1 X87.788 Y98.128
G1 X88.672 Y97.244 E.02391
G1 X88.114 Y97.244
G1 X87.578 Y97.78 E.01451
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X88.114 Y97.244 E-.08648
G1 X88.672 Y97.244 E-.06359
G1 X88.188 Y97.727 E-.07793
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.703 I.017 J1.217 P1  F28800
G1 X123.83 Y97.224 Z1.703
G1 Z1.303
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.21205
G1 F15000
G1 X124.044 Y97.329 E.00216
; LINE_WIDTH: 0.234637
G1 X124.027 Y97.383 E.00058
; LINE_WIDTH: 0.207429
G1 X124.01 Y97.438 E.00051
; LINE_WIDTH: 0.180217
G1 X123.859 Y97.63 E.00183
; LINE_WIDTH: 0.226943
G1 X123.708 Y97.822 E.00238
; LINE_WIDTH: 0.273669
G1 X123.558 Y98.014 E.00294
; LINE_WIDTH: 0.320395
G1 X123.407 Y98.206 E.00349
; LINE_WIDTH: 0.36712
G1 X123.257 Y98.398 E.00404
G1 X117.671 Y107.033 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X116.845 Y106.207 E.02405
G1 X117.32 Y105.422 E.01889
G1 X118.402 Y105.436 E.02227
G1 X115.636 Y108.201 E.08053
G2 X113.982 Y111.02 I32.52 J20.969 E.06731
G1 X114.828 Y111.866 E.02461
G1 X112.305 Y117.019 F28800
G1 F16200
G1 X113.262 Y117.975 E.02785
G2 X113.249 Y118.264 I3.433 J.294 E.00595
G1 X112.209 Y119.304 E.03028
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.198 Y118.264 E.03028
G2 X98.186 Y117.975 I-3.447 J.005 E.00595
G1 X99.142 Y117.019 E.02785
G1 X96.62 Y111.866 F28800
G1 F16200
G1 X97.465 Y111.02 E.02461
G2 X95.811 Y108.201 I-34.181 J18.154 E.06731
G1 X93.046 Y105.436 E.08053
G1 X94.127 Y105.422 E.02227
G1 X94.603 Y106.207 E.01889
G1 X93.777 Y107.033 E.02405
G1 X93.78 Y105.035 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X92.883 Y103.556 E.0331
G1 X92.878 Y103.36 E.00373
G1 X93.018 Y103.259 E.00331
G1 X118.395 Y103.256 E.48557
G3 X118.569 Y103.36 I0 J.197 E.00408
G1 X118.564 Y103.556 E.00373
G1 X117.667 Y105.035 E.0331
G1 X118.769 Y105.035 E.02108
G1 X121.39 Y100.711 E.09674
G1 X90.058 Y100.711 E.59951
G1 X92.678 Y105.035 E.09674
G1 X93.72 Y105.035 E.01993
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X92.678 Y105.035 E-.11876
G1 X92.182 Y104.215 E-.10924
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.703 I-.016 J1.217 P1  F28800
G1 X118.504 Y104.564 Z1.703
G1 Z1.303
G1 E.8 F1800
; LINE_WIDTH: 0.573288
G1 F15000
G1 X118.936 Y103.851 E.02214
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X118.504 Y104.564 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.703 I0 J-1.217 P1  F28800
G1 X92.944 Y104.564 Z1.703
G1 Z1.303
G1 E.8 F1800
; LINE_WIDTH: 0.5733
G1 F15000
G1 X92.512 Y103.851 E.02214
G1 X92.481 Y103.8 F28800
G1 F15000
G1 X92.493 Y103.643 E.00417
; LINE_WIDTH: 0.534975
G1 X92.505 Y103.487 E.00387
; LINE_WIDTH: 0.49665
G1 X92.518 Y103.331 E.00358
; LINE_WIDTH: 0.420224
G1 X92.53 Y103.175 E.003
G1 X92.813 Y102.912 E.0074
G1 X93.052 Y102.862 E.00467
G1 X118.395 Y102.862 E.48519
G1 X118.634 Y102.912 E.00467
G1 X118.917 Y103.175 E.0074
; LINE_WIDTH: 0.42
G1 X118.93 Y103.331 E.003
; LINE_WIDTH: 0.458321
G1 X118.942 Y103.487 E.00329
; LINE_WIDTH: 0.496643
G1 X118.954 Y103.643 E.00358
; LINE_WIDTH: 0.534964
G1 X118.967 Y103.8 E.00387
; LINE_WIDTH: 0.573286
G1 X119.082 Y103.647 E.00508
; LINE_WIDTH: 0.534964
G1 X119.197 Y103.494 E.00473
; LINE_WIDTH: 0.496643
G1 X119.312 Y103.341 E.00437
; LINE_WIDTH: 0.420209
G1 X119.427 Y103.189 E.00366
G1 X120.689 Y101.105 E.04664
G1 X90.758 Y101.105 E.57302
G1 X92.021 Y103.189 E.04664
; LINE_WIDTH: 0.42
G1 X92.127 Y103.329 E.00337
; LINE_WIDTH: 0.458325
G1 X92.233 Y103.47 E.0037
; LINE_WIDTH: 0.49665
G1 X92.339 Y103.611 E.00403
; LINE_WIDTH: 0.534975
G1 X92.444 Y103.752 E.00436
G1 X92.297 Y102.883 F28800
; LINE_WIDTH: 0.42
G1 F15000
G1 X92.654 Y102.551 E.00934
G1 X93.052 Y102.467 E.00778
M73 P65 R5
G1 X118.395 Y102.467 E.48492
G1 X118.793 Y102.551 E.00778
G1 X119.151 Y102.883 E.00934
G1 X119.989 Y101.5 E.03095
G1 X91.458 Y101.5 E.54591
G1 X92.265 Y102.832 E.0298
G1 X118.395 Y101.983 F28800
; LINE_WIDTH: 0.598632
G1 F15000
G1 X93.052 Y101.983 E.70452
G1 X92.866 Y102.003 E.00521
; LINE_WIDTH: 0.642111
G1 X92.679 Y102.023 E.00561
; LINE_WIDTH: 0.685591
G1 X92.493 Y102.042 E.00601
G1 X119.058 Y102.316 F28800
; LINE_WIDTH: 0.377309
G1 F15000
G1 X119.327 Y101.873 E.00884
G1 X119.014 Y101.873 E.00533
G1 X118.891 Y101.895 E.00215
; LINE_WIDTH: 0.421573
G1 X118.767 Y101.917 E.00242
; LINE_WIDTH: 0.465838
G1 X118.643 Y101.939 E.00269
; LINE_WIDTH: 0.510103
G1 X118.519 Y101.961 E.00296
; LINE_WIDTH: 0.554367
G1 X118.395 Y101.983 E.00323
; LINE_WIDTH: 0.598632
G1 X118.505 Y102.029 E.0033
; LINE_WIDTH: 0.554367
G1 X118.615 Y102.074 E.00304
; LINE_WIDTH: 0.510103
G1 X118.724 Y102.119 E.00279
; LINE_WIDTH: 0.465838
G1 X118.834 Y102.164 E.00253
; LINE_WIDTH: 0.401734
G3 X119.014 Y102.275 I-.058 J.297 E.00394
G1 X121.123 Y100.494 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X122.66 Y98.957 E.04158
G1 X122.217 Y98.842
G1 X120.566 Y100.494 E.04469
G1 X120.008 Y100.494
G1 X121.659 Y98.842 E.04469
G1 X121.101 Y98.842
G1 X119.45 Y100.494 E.04469
G1 X118.892 Y100.494
G1 X120.544 Y98.842 E.04469
G1 X119.986 Y98.842
G1 X118.334 Y100.494 E.04469
G1 X117.776 Y100.494
G1 X119.428 Y98.842 E.04469
G1 X118.87 Y98.842
G1 X117.219 Y100.494 E.04469
G1 X116.661 Y100.494
G1 X118.312 Y98.842 E.04469
G1 X117.754 Y98.842
G1 X116.103 Y100.494 E.04469
G1 X115.545 Y100.494
G1 X117.196 Y98.842 E.04469
G1 X116.639 Y98.842
G1 X114.987 Y100.494 E.04469
G1 X114.429 Y100.494
G1 X116.081 Y98.842 E.04469
G1 X115.523 Y98.842
G1 X113.872 Y100.494 E.04469
G1 X113.314 Y100.494
G1 X114.965 Y98.842 E.04469
G1 X114.407 Y98.842
G1 X112.756 Y100.494 E.04469
G1 X112.198 Y100.494
G1 X113.849 Y98.842 E.04469
G1 X113.292 Y98.842
G1 X111.64 Y100.494 E.04469
G1 X111.082 Y100.494
G1 X112.734 Y98.842 E.04469
G1 X112.176 Y98.842
G1 X110.525 Y100.494 E.04469
G1 X109.967 Y100.494
G1 X111.618 Y98.842 E.04469
G1 X111.06 Y98.842
G1 X109.409 Y100.494 E.04469
G1 X108.851 Y100.494
G1 X110.502 Y98.842 E.04469
G1 X109.945 Y98.842
G1 X108.293 Y100.494 E.04469
G1 X107.735 Y100.494
G1 X109.387 Y98.842 E.04469
G1 X108.829 Y98.842
G1 X107.178 Y100.494 E.04469
G1 X106.62 Y100.494
G1 X108.271 Y98.842 E.04469
G1 X107.713 Y98.842
G1 X106.062 Y100.494 E.04469
G1 X105.504 Y100.494
G1 X107.155 Y98.842 E.04469
G1 X106.598 Y98.842
G1 X104.946 Y100.494 E.04469
G1 X104.388 Y100.494
G1 X106.04 Y98.842 E.04469
G1 X105.482 Y98.842
G1 X103.83 Y100.494 E.04469
G1 X103.273 Y100.494
G1 X104.924 Y98.842 E.04469
G1 X104.366 Y98.842
G1 X102.715 Y100.494 E.04469
G1 X102.157 Y100.494
G1 X103.808 Y98.842 E.04469
G1 X103.251 Y98.842
G1 X101.599 Y100.494 E.04469
G1 X101.041 Y100.494
G1 X102.693 Y98.842 E.04469
G1 X102.135 Y98.842
G1 X100.483 Y100.494 E.04469
G1 X99.926 Y100.494
G1 X101.577 Y98.842 E.04469
G1 X101.019 Y98.842
G1 X99.368 Y100.494 E.04469
G1 X98.81 Y100.494
G1 X100.461 Y98.842 E.04469
G1 X99.904 Y98.842
G1 X98.252 Y100.494 E.04469
G1 X97.694 Y100.494
G1 X99.346 Y98.842 E.04469
G1 X98.788 Y98.842
G1 X97.136 Y100.494 E.04469
G1 X96.579 Y100.494
G1 X98.23 Y98.842 E.04469
G1 X97.672 Y98.842
G1 X96.021 Y100.494 E.04469
G1 X95.463 Y100.494
G1 X97.114 Y98.842 E.04469
G1 X96.557 Y98.842
G1 X94.905 Y100.494 E.04469
G1 X94.347 Y100.494
G1 X95.999 Y98.842 E.04469
G1 X95.441 Y98.842
G1 X93.789 Y100.494 E.04469
G1 X93.232 Y100.494
G1 X94.883 Y98.842 E.04469
G1 X94.325 Y98.842
G1 X92.674 Y100.494 E.04469
G1 X92.116 Y100.494
G1 X93.767 Y98.842 E.04469
G1 X93.21 Y98.842
G1 X91.558 Y100.494 E.04469
G1 X91 Y100.494
G1 X92.652 Y98.842 E.04469
G1 X92.094 Y98.842
G1 X90.442 Y100.494 E.04469
G1 X89.885 Y100.494
G1 X91.536 Y98.842 E.04469
G1 X90.978 Y98.842
G1 X89.571 Y100.25 E.03809
G1 X89.36 Y99.903
G1 X90.42 Y98.842 E.02869
G1 X89.862 Y98.842
G1 X89.15 Y99.555 E.01929
G1 X88.939 Y99.208
G1 X89.305 Y98.842 E.00989
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X88.939 Y99.208 E-.05892
G1 X89.15 Y99.555 E-.0463
G1 X89.862 Y98.842 E-.11492
G1 X89.931 Y98.842 E-.00787
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.703 I-1.142 J.419 P1  F28800
G1 X99.344 Y124.494 Z1.703
G1 Z1.303
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.751 J-.085 E.03198
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.231 J-2.583 E.1146
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.289 Y175.41 E.02466
G2 X112.816 Y171.261 I-3.867 J-6.861 E.11448
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 1.42222
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.238 Y125.628 E-.18287
G1 X113.238 Y125.951 E-.03684
G1 X113.187 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z1.703 I1.169 J-.338 P1  F28800
G1 X111.79 Y121.178 Z1.703
G1 Z1.422
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.822 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z1.822
G1 Z1.422
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.324 J2.998 E.1345
G1 X118.018 Y103.666 E.1473
G1 X93.429 Y103.666 E.50628
G1 X97.137 Y109.784 E.1473
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.744 J3.051 E.12828
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.822 I1.03 J.649 P1  F28800
G1 X122.719 Y99.307 Z1.822
G1 Z1.422
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X115.81 Y110.708 E.27447
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J.005 E.50652
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X88.728 Y99.307 E.27447
G1 X122.659 Y99.307 E.69862
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X121.629 Y101.022 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.822 I.966 J.74 P1  F28800
G1 X124.158 Y97.724 Z1.822
M73 P66 R5
G1 Z1.422
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X123.138 Y99.406 E.03765
G1 X116.162 Y110.916 E.25752
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X102.997 Y176.569 I-8.238 J-.001 E.30074
G1 X102.997 Y176.569 E0
G3 X97.486 Y168.795 I2.757 J-7.795 E.19431
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X87.29 Y97.724 E.29517
G1 X124.098 Y97.724 E.70429
G1 X123.887 Y98.018 F28800
G1 X123.449 Y98.475
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X122.914 Y97.941 E.01446
G1 X122.356 Y97.941
G1 X123.238 Y98.822 E.02386
G1 X122.933 Y99.075
G1 X121.798 Y97.941 E.0307
G1 X121.241 Y97.941
G1 X122.375 Y99.075 E.0307
G1 X121.817 Y99.075
G1 X120.683 Y97.941 E.0307
G1 X120.125 Y97.941
G1 X121.26 Y99.075 E.0307
G1 X120.702 Y99.075
G1 X119.567 Y97.941 E.0307
G1 X119.009 Y97.941
G1 X120.144 Y99.075 E.0307
G1 X119.586 Y99.075
G1 X118.451 Y97.941 E.0307
G1 X117.894 Y97.941
G1 X119.028 Y99.075 E.0307
G1 X118.47 Y99.075
G1 X117.336 Y97.941 E.0307
G1 X116.778 Y97.941
G1 X117.913 Y99.075 E.0307
G1 X117.355 Y99.075
G1 X116.22 Y97.941 E.0307
G1 X115.662 Y97.941
G1 X116.797 Y99.075 E.0307
G1 X116.239 Y99.075
G1 X115.104 Y97.941 E.0307
G1 X114.547 Y97.941
G1 X115.681 Y99.075 E.0307
G1 X115.123 Y99.075
G1 X113.989 Y97.941 E.0307
G1 X113.431 Y97.941
G1 X114.566 Y99.075 E.0307
G1 X114.008 Y99.075
G1 X112.873 Y97.941 E.0307
G1 X112.315 Y97.941
G1 X113.45 Y99.075 E.0307
G1 X112.892 Y99.075
G1 X111.757 Y97.941 E.0307
G1 X111.2 Y97.941
G1 X112.334 Y99.075 E.0307
G1 X111.776 Y99.075
G1 X110.642 Y97.941 E.0307
G1 X110.084 Y97.941
G1 X111.219 Y99.075 E.0307
G1 X110.661 Y99.075
G1 X109.526 Y97.941 E.0307
G1 X108.968 Y97.941
G1 X110.103 Y99.075 E.0307
G1 X109.545 Y99.075
G1 X108.41 Y97.941 E.0307
G1 X107.853 Y97.941
G1 X108.987 Y99.075 E.0307
G1 X108.429 Y99.075
G1 X107.295 Y97.941 E.0307
G1 X106.737 Y97.941
G1 X107.872 Y99.075 E.0307
G1 X107.314 Y99.075
G1 X106.179 Y97.941 E.0307
G1 X105.621 Y97.941
G1 X106.756 Y99.075 E.0307
G1 X106.198 Y99.075
G1 X105.063 Y97.941 E.0307
G1 X104.506 Y97.941
G1 X105.64 Y99.075 E.0307
G1 X105.082 Y99.075
G1 X103.948 Y97.941 E.0307
G1 X103.39 Y97.941
G1 X104.525 Y99.075 E.0307
G1 X103.967 Y99.075
G1 X102.832 Y97.941 E.0307
G1 X102.274 Y97.941
G1 X103.409 Y99.075 E.0307
G1 X102.851 Y99.075
G1 X101.716 Y97.941 E.0307
G1 X101.159 Y97.941
G1 X102.293 Y99.075 E.0307
G1 X101.735 Y99.075
G1 X100.601 Y97.941 E.0307
G1 X100.043 Y97.941
G1 X101.178 Y99.075 E.0307
G1 X100.62 Y99.075
G1 X99.485 Y97.941 E.0307
G1 X98.927 Y97.941
G1 X100.062 Y99.075 E.0307
G1 X99.504 Y99.075
G1 X98.369 Y97.941 E.0307
G1 X97.812 Y97.941
G1 X98.946 Y99.075 E.0307
G1 X98.388 Y99.075
G1 X97.254 Y97.941 E.0307
G1 X96.696 Y97.941
G1 X97.831 Y99.075 E.0307
G1 X97.273 Y99.075
G1 X96.138 Y97.941 E.0307
G1 X95.58 Y97.941
G1 X96.715 Y99.075 E.0307
G1 X96.157 Y99.075
G1 X95.022 Y97.941 E.0307
G1 X94.465 Y97.941
G1 X95.599 Y99.075 E.0307
G1 X95.041 Y99.075
G1 X93.907 Y97.941 E.0307
G1 X93.349 Y97.941
G1 X94.483 Y99.075 E.0307
G1 X93.926 Y99.075
G1 X92.791 Y97.941 E.0307
G1 X92.233 Y97.941
G1 X93.368 Y99.075 E.0307
G1 X92.81 Y99.075
G1 X91.675 Y97.941 E.0307
G1 X91.117 Y97.941
G1 X92.252 Y99.075 E.0307
G1 X91.694 Y99.075
G1 X90.56 Y97.941 E.0307
G1 X90.002 Y97.941
G1 X91.136 Y99.075 E.0307
G1 X90.579 Y99.075
G1 X89.444 Y97.941 E.0307
G1 X88.886 Y97.941
G1 X90.021 Y99.075 E.0307
G1 X89.463 Y99.075
G1 X88.328 Y97.941 E.0307
G1 X87.77 Y97.941
G1 X88.905 Y99.075 E.0307
M204 S10000
G1 X88.485 Y99.095 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.223406
G1 F15000
G1 X88.365 Y98.942 E.00186
; LINE_WIDTH: 0.185775
G1 X88.245 Y98.789 E.00151
; LINE_WIDTH: 0.148145
G1 X88.125 Y98.637 E.00115
; LINE_WIDTH: 0.110515
G1 X88.005 Y98.484 E.0008
G1 X94.202 Y105.731 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X92.883 Y103.556 E.04868
G1 X92.865 Y103.391 E.00316
G3 X93.052 Y103.256 I.187 J.062 E.00472
G1 X118.395 Y103.256 E.48492
G3 X118.582 Y103.391 I0 J.197 E.00472
G1 X118.564 Y103.556 E.00316
G1 X117.245 Y105.731 E.04868
G1 X118.347 Y105.731 E.02108
G1 X120.967 Y101.407 E.09674
G1 X90.48 Y101.407 E.58335
G1 X93.1 Y105.731 E.09674
G1 X94.142 Y105.731 E.01993
G1 X93.366 Y105.26 F28800
; LINE_WIDTH: 0.5733
G1 F15000
G1 X92.512 Y103.851 E.04379
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.366 Y105.26 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.822 I0 J1.217 P1  F28800
G1 X118.082 Y105.26 Z1.822
G1 Z1.422
G1 E.8 F1800
; LINE_WIDTH: 0.57329
G1 F15000
G1 X118.936 Y103.851 E.04379
G1 X92.481 Y103.8 F28800
; LINE_WIDTH: 0.5733
G1 F15000
G1 X92.483 Y103.667 E.00354
; LINE_WIDTH: 0.534975
G1 X92.486 Y103.533 E.00329
; LINE_WIDTH: 0.49665
G1 X92.488 Y103.4 E.00304
; LINE_WIDTH: 0.420189
G1 X92.491 Y103.267 E.00255
G1 X92.706 Y102.973 E.00698
G1 X93.052 Y102.862 E.00696
G1 X118.395 Y102.862 E.48515
G1 X118.741 Y102.973 E.00696
G1 X118.957 Y103.267 E.00698
; LINE_WIDTH: 0.42
G1 X118.959 Y103.4 E.00255
; LINE_WIDTH: 0.458321
G1 X118.962 Y103.533 E.0028
; LINE_WIDTH: 0.496643
G1 X118.964 Y103.667 E.00304
; LINE_WIDTH: 0.534964
G1 X118.967 Y103.8 E.00329
; LINE_WIDTH: 0.573286
G1 X119.063 Y103.678 E.00413
; LINE_WIDTH: 0.534964
G1 X119.159 Y103.556 E.00384
; LINE_WIDTH: 0.496643
G1 X119.256 Y103.434 E.00355
; LINE_WIDTH: 0.420182
G1 X119.352 Y103.312 E.00298
G1 X120.267 Y101.802 E.03379
G1 X91.18 Y101.802 E.55681
G1 X92.095 Y103.312 E.03379
; LINE_WIDTH: 0.42
G1 X92.182 Y103.422 E.00269
; LINE_WIDTH: 0.458325
G1 X92.269 Y103.532 E.00295
; LINE_WIDTH: 0.49665
G1 X92.356 Y103.642 E.00321
; LINE_WIDTH: 0.534975
G1 X92.443 Y103.753 E.00347
G1 X92.304 Y102.843 F28800
; LINE_WIDTH: 0.475006
G1 F15000
G1 X92.46 Y102.631 E.00572
G1 X92.602 Y102.59 E.00323
; LINE_WIDTH: 0.438905
G1 X92.744 Y102.549 E.00297
; LINE_WIDTH: 0.358516
G3 X93.052 Y102.498 I.269 J.668 E.00508
G1 X118.395 Y102.498 E.40933
; LINE_WIDTH: 0.358204
G1 X118.593 Y102.542 E.00327
; LINE_WIDTH: 0.397137
G1 X118.79 Y102.587 E.00365
; LINE_WIDTH: 0.468371
G1 X118.988 Y102.631 E.00435
G1 X119.143 Y102.843 E.00564
G1 X119.518 Y102.224 E.01554
; LINE_WIDTH: 0.475002
G1 X119.144 Y102.204 E.00817
; LINE_WIDTH: 0.436069
G1 X118.769 Y102.185 E.00746
; LINE_WIDTH: 0.358771
G1 X118.395 Y102.165 E.00606
G1 X93.052 Y102.165 E.40965
; LINE_WIDTH: 0.358204
G1 X92.811 Y102.185 E.00391
; LINE_WIDTH: 0.397138
G1 X92.57 Y102.204 E.00436
; LINE_WIDTH: 0.467781
G3 X91.929 Y102.224 I-.441 J-3.958 E.01376
G1 X92.273 Y102.791 E.01423
G1 X93.777 Y107.033 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X94.603 Y106.207 E.02405
G1 X94.549 Y106.119 E.00212
G1 X93.742 Y106.132 E.01662
G1 X95.811 Y108.201 E.06024
G3 X97.465 Y111.02 I-32.527 J20.973 E.06731
G1 X96.62 Y111.866 E.02461
G1 X99.142 Y117.019 F28800
G1 F16200
G1 X98.186 Y117.975 E.02785
G3 X98.198 Y118.264 I-3.434 J.294 E.00595
G1 X99.238 Y119.304 E.03028
G1 X99.256 Y119.73 E.00879
G1 X99.665 Y119.73 E.00841
G1 X100.799 Y120.865 E.03303
G1 X102.972 Y120.865 E.04475
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 X110.648 Y120.865 E.04475
G1 X111.783 Y119.73 E.03303
G1 X112.191 Y119.73 E.00841
G1 X112.209 Y119.304 E.00879
G1 X113.249 Y118.264 E.03028
G3 X113.262 Y117.975 I3.446 J.005 E.00595
G1 X112.305 Y117.019 E.02785
G1 X114.828 Y111.866 F28800
G1 F16200
G1 X113.982 Y111.02 E.02461
G3 X115.636 Y108.201 I34.177 J18.152 E.06731
G1 X117.705 Y106.132 E.06024
G1 X116.898 Y106.119 E.01662
G1 X116.845 Y106.207 E.00212
G1 X117.671 Y107.033 E.02405
G1 X121.724 Y99.539 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X122.087 Y99.903 E.00984
G1 X121.877 Y100.25
G1 X121.166 Y99.539 E.01924
G1 X120.608 Y99.539
G1 X121.666 Y100.597 E.02863
G1 X121.456 Y100.945
G1 X120.05 Y99.539 E.03803
G1 X119.492 Y99.539
G1 X121.144 Y101.19 E.04469
G1 X120.586 Y101.19
G1 X118.934 Y99.539 E.04469
M73 P67 R5
G1 X118.377 Y99.539
G1 X120.028 Y101.19 E.04469
G1 X119.47 Y101.19
G1 X117.819 Y99.539 E.04469
G1 X117.261 Y99.539
G1 X118.912 Y101.19 E.04469
G1 X118.354 Y101.19
G1 X116.703 Y99.539 E.04469
G1 X116.145 Y99.539
G1 X117.797 Y101.19 E.04469
G1 X117.239 Y101.19
G1 X115.587 Y99.539 E.04469
G1 X115.03 Y99.539
G1 X116.681 Y101.19 E.04469
G1 X116.123 Y101.19
G1 X114.472 Y99.539 E.04469
G1 X113.914 Y99.539
G1 X115.565 Y101.19 E.04469
G1 X115.007 Y101.19
G1 X113.356 Y99.539 E.04469
G1 X112.798 Y99.539
G1 X114.45 Y101.19 E.04469
G1 X113.892 Y101.19
G1 X112.24 Y99.539 E.04469
G1 X111.682 Y99.539
G1 X113.334 Y101.19 E.04469
G1 X112.776 Y101.19
G1 X111.125 Y99.539 E.04469
G1 X110.567 Y99.539
G1 X112.218 Y101.19 E.04469
G1 X111.66 Y101.19
G1 X110.009 Y99.539 E.04469
G1 X109.451 Y99.539
G1 X111.103 Y101.19 E.04469
G1 X110.545 Y101.19
G1 X108.893 Y99.539 E.04469
G1 X108.335 Y99.539
G1 X109.987 Y101.19 E.04469
G1 X109.429 Y101.19
G1 X107.778 Y99.539 E.04469
G1 X107.22 Y99.539
G1 X108.871 Y101.19 E.04469
G1 X108.313 Y101.19
G1 X106.662 Y99.539 E.04469
G1 X106.104 Y99.539
G1 X107.756 Y101.19 E.04469
G1 X107.198 Y101.19
G1 X105.546 Y99.539 E.04469
G1 X104.988 Y99.539
G1 X106.64 Y101.19 E.04469
G1 X106.082 Y101.19
G1 X104.431 Y99.539 E.04469
G1 X103.873 Y99.539
G1 X105.524 Y101.19 E.04469
G1 X104.966 Y101.19
G1 X103.315 Y99.539 E.04469
G1 X102.757 Y99.539
G1 X104.409 Y101.19 E.04469
G1 X103.851 Y101.19
G1 X102.199 Y99.539 E.04469
G1 X101.641 Y99.539
G1 X103.293 Y101.19 E.04469
G1 X102.735 Y101.19
G1 X101.084 Y99.539 E.04469
G1 X100.526 Y99.539
G1 X102.177 Y101.19 E.04469
G1 X101.619 Y101.19
G1 X99.968 Y99.539 E.04469
G1 X99.41 Y99.539
G1 X101.062 Y101.19 E.04469
G1 X100.504 Y101.19
G1 X98.852 Y99.539 E.04469
G1 X98.294 Y99.539
G1 X99.946 Y101.19 E.04469
G1 X99.388 Y101.19
G1 X97.737 Y99.539 E.04469
G1 X97.179 Y99.539
G1 X98.83 Y101.19 E.04469
G1 X98.272 Y101.19
G1 X96.621 Y99.539 E.04469
G1 X96.063 Y99.539
G1 X97.714 Y101.19 E.04469
G1 X97.157 Y101.19
G1 X95.505 Y99.539 E.04469
G1 X94.947 Y99.539
G1 X96.599 Y101.19 E.04469
G1 X96.041 Y101.19
G1 X94.39 Y99.539 E.04469
G1 X93.832 Y99.539
G1 X95.483 Y101.19 E.04469
G1 X94.925 Y101.19
G1 X93.274 Y99.539 E.04469
G1 X92.716 Y99.539
G1 X94.367 Y101.19 E.04469
G1 X93.81 Y101.19
G1 X92.158 Y99.539 E.04469
G1 X91.6 Y99.539
G1 X93.252 Y101.19 E.04469
G1 X92.694 Y101.19
G1 X91.043 Y99.539 E.04469
G1 X90.485 Y99.539
G1 X92.136 Y101.19 E.04469
G1 X91.578 Y101.19
G1 X89.927 Y99.539 E.04469
G1 X89.369 Y99.539
G1 X91.02 Y101.19 E.04469
G1 X90.463 Y101.19
G1 X89.646 Y100.374 E.02211
M204 S10000
G1 X89.709 Y100.31 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.216784
G1 F15000
G1 X89.561 Y100.121 E.00223
; LINE_WIDTH: 0.168817
G1 X89.413 Y99.932 E.00167
; LINE_WIDTH: 0.120851
G1 X89.265 Y99.744 E.00111
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X89.413 Y99.932 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.822 I-1.128 J.456 P1  F28800
G1 X99.344 Y124.494 Z1.822
G1 Z1.422
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.751 J-.085 E.03198
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.231 J-2.583 E.1146
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.287 Y175.409 E.0246
G2 X112.816 Y171.261 I-3.845 J-6.847 E.11449
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 1.54127
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.238 Y125.628 E-.18287
G1 X113.238 Y125.951 E-.03684
G1 X113.187 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z1.822 I1.169 J-.338 P1  F28800
G1 X111.79 Y121.178 Z1.822
G1 Z1.541
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.941 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z1.941
G1 Z1.541
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.324 J2.998 E.1345
G1 X118.018 Y103.666 E.1473
G1 X93.429 Y103.666 E.50628
G1 X97.137 Y109.784 E.1473
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.744 J3.051 E.12828
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.941 I1.029 J.65 P1  F28800
G1 X122.297 Y100.004 Z1.941
G1 Z1.541
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X115.81 Y110.708 E.2577
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X89.15 Y100.004 E.2577
G1 X122.237 Y100.004 E.68123
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X121.207 Y101.718 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.941 I.966 J.74 P1  F28800
G1 X123.735 Y98.42 Z1.941
G1 Z1.541
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X122.778 Y100 E.03534
G1 X116.162 Y110.916 E.24424
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X87.712 Y98.42 E.27958
G1 X123.675 Y98.42 E.68813
G1 X123.463 Y98.713 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X122.778 Y100 E-.2071
G1 X122.683 Y100.157 E-.0209
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.941 I.508 J-1.106 P1  F28800
G1 X121.845 Y99.772 Z1.941
G1 Z1.541
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X122.98 Y98.637 E.0307
G1 X122.422 Y98.637
G1 X121.288 Y99.772 E.0307
M73 P68 R5
G1 X120.73 Y99.772
G1 X121.864 Y98.637 E.0307
G1 X121.307 Y98.637
G1 X120.172 Y99.772 E.0307
G1 X119.614 Y99.772
G1 X120.749 Y98.637 E.0307
G1 X120.191 Y98.637
G1 X119.056 Y99.772 E.0307
G1 X118.498 Y99.772
G1 X119.633 Y98.637 E.0307
G1 X119.075 Y98.637
G1 X117.941 Y99.772 E.0307
G1 X117.383 Y99.772
G1 X118.517 Y98.637 E.0307
G1 X117.96 Y98.637
G1 X116.825 Y99.772 E.0307
G1 X116.267 Y99.772
G1 X117.402 Y98.637 E.0307
G1 X116.844 Y98.637
G1 X115.709 Y99.772 E.0307
G1 X115.151 Y99.772
G1 X116.286 Y98.637 E.0307
G1 X115.728 Y98.637
G1 X114.594 Y99.772 E.0307
G1 X114.036 Y99.772
G1 X115.17 Y98.637 E.0307
G1 X114.613 Y98.637
G1 X113.478 Y99.772 E.0307
G1 X112.92 Y99.772
G1 X114.055 Y98.637 E.0307
G1 X113.497 Y98.637
G1 X112.362 Y99.772 E.0307
G1 X111.804 Y99.772
G1 X112.939 Y98.637 E.0307
G1 X112.381 Y98.637
G1 X111.247 Y99.772 E.0307
G1 X110.689 Y99.772
G1 X111.823 Y98.637 E.0307
G1 X111.266 Y98.637
G1 X110.131 Y99.772 E.0307
G1 X109.573 Y99.772
G1 X110.708 Y98.637 E.0307
G1 X110.15 Y98.637
G1 X109.015 Y99.772 E.0307
G1 X108.457 Y99.772
G1 X109.592 Y98.637 E.0307
G1 X109.034 Y98.637
G1 X107.899 Y99.772 E.0307
G1 X107.342 Y99.772
G1 X108.476 Y98.637 E.0307
G1 X107.918 Y98.637
G1 X106.784 Y99.772 E.0307
G1 X106.226 Y99.772
G1 X107.361 Y98.637 E.0307
G1 X106.803 Y98.637
G1 X105.668 Y99.772 E.0307
G1 X105.11 Y99.772
G1 X106.245 Y98.637 E.0307
G1 X105.687 Y98.637
G1 X104.552 Y99.772 E.0307
G1 X103.995 Y99.772
G1 X105.129 Y98.637 E.0307
G1 X104.571 Y98.637
G1 X103.437 Y99.772 E.0307
G1 X102.879 Y99.772
G1 X104.014 Y98.637 E.0307
G1 X103.456 Y98.637
G1 X102.321 Y99.772 E.0307
G1 X101.763 Y99.772
G1 X102.898 Y98.637 E.0307
G1 X102.34 Y98.637
G1 X101.205 Y99.772 E.0307
G1 X100.648 Y99.772
G1 X101.782 Y98.637 E.0307
G1 X101.224 Y98.637
G1 X100.09 Y99.772 E.0307
G1 X99.532 Y99.772
G1 X100.667 Y98.637 E.0307
G1 X100.109 Y98.637
G1 X98.974 Y99.772 E.0307
G1 X98.416 Y99.772
G1 X99.551 Y98.637 E.0307
G1 X98.993 Y98.637
G1 X97.858 Y99.772 E.0307
G1 X97.301 Y99.772
G1 X98.435 Y98.637 E.0307
G1 X97.877 Y98.637
G1 X96.743 Y99.772 E.0307
G1 X96.185 Y99.772
G1 X97.32 Y98.637 E.0307
G1 X96.762 Y98.637
G1 X95.627 Y99.772 E.0307
G1 X95.069 Y99.772
G1 X96.204 Y98.637 E.0307
G1 X95.646 Y98.637
G1 X94.511 Y99.772 E.0307
G1 X93.954 Y99.772
G1 X95.088 Y98.637 E.0307
G1 X94.53 Y98.637
G1 X93.396 Y99.772 E.0307
G1 X92.838 Y99.772
G1 X93.973 Y98.637 E.0307
G1 X93.415 Y98.637
G1 X92.28 Y99.772 E.0307
G1 X91.722 Y99.772
G1 X92.857 Y98.637 E.0307
G1 X92.299 Y98.637
G1 X91.164 Y99.772 E.0307
G1 X90.607 Y99.772
G1 X91.741 Y98.637 E.0307
G1 X91.183 Y98.637
G1 X90.049 Y99.772 E.0307
G1 X89.491 Y99.772
G1 X90.626 Y98.637 E.0307
G1 X90.068 Y98.637
G1 X88.933 Y99.772 E.0307
G1 X88.63 Y99.517
G1 X89.51 Y98.637 E.0238
G1 X88.952 Y98.637
G1 X88.42 Y99.17 E.01441
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X88.952 Y98.637 E-.08583
G1 X89.51 Y98.637 E-.06359
G1 X89.022 Y99.125 E-.07858
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.941 I.018 J1.217 P1  F28800
G1 X122.988 Y98.617 Z1.941
G1 Z1.541
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.21205
G1 F15000
G1 X123.204 Y98.72 E.00216
; LINE_WIDTH: 0.229681
G1 X123.188 Y98.774 E.00056
; LINE_WIDTH: 0.20107
G1 X123.171 Y98.829 E.00048
; LINE_WIDTH: 0.172459
G1 X123.02 Y99.021 E.00174
; LINE_WIDTH: 0.219535
G1 X122.869 Y99.214 E.0023
; LINE_WIDTH: 0.266611
G1 X122.718 Y99.406 E.00286
; LINE_WIDTH: 0.313687
G1 X122.567 Y99.599 E.00342
; LINE_WIDTH: 0.360763
G1 X122.416 Y99.792 E.00398
G1 X120.288 Y101.887 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X121.802 Y100.373 E.04097
G1 X121.382 Y100.236
G1 X119.73 Y101.887 E.04469
G1 X119.172 Y101.887
G1 X120.824 Y100.236 E.04469
G1 X120.266 Y100.236
G1 X118.614 Y101.887 E.04469
G1 X118.057 Y101.887
G1 X119.708 Y100.236 E.04469
G1 X119.15 Y100.236
G1 X117.499 Y101.887 E.04469
G1 X116.941 Y101.887
G1 X118.592 Y100.236 E.04469
G1 X118.034 Y100.236
G1 X116.383 Y101.887 E.04469
G1 X115.825 Y101.887
G1 X117.477 Y100.236 E.04469
G1 X116.919 Y100.236
G1 X115.267 Y101.887 E.04469
G1 X114.71 Y101.887
G1 X116.361 Y100.236 E.04469
G1 X115.803 Y100.236
G1 X114.152 Y101.887 E.04469
G1 X113.594 Y101.887
G1 X115.245 Y100.236 E.04469
G1 X114.687 Y100.236
G1 X113.036 Y101.887 E.04469
G1 X112.478 Y101.887
G1 X114.13 Y100.236 E.04469
G1 X113.572 Y100.236
G1 X111.92 Y101.887 E.04469
G1 X111.363 Y101.887
G1 X113.014 Y100.236 E.04469
G1 X112.456 Y100.236
G1 X110.805 Y101.887 E.04469
G1 X110.247 Y101.887
G1 X111.898 Y100.236 E.04469
G1 X111.34 Y100.236
G1 X109.689 Y101.887 E.04469
G1 X109.131 Y101.887
G1 X110.783 Y100.236 E.04469
G1 X110.225 Y100.236
G1 X108.573 Y101.887 E.04469
G1 X108.016 Y101.887
G1 X109.667 Y100.236 E.04469
G1 X109.109 Y100.236
G1 X107.458 Y101.887 E.04469
G1 X106.9 Y101.887
G1 X108.551 Y100.236 E.04469
G1 X107.993 Y100.236
G1 X106.342 Y101.887 E.04469
G1 X105.784 Y101.887
G1 X107.436 Y100.236 E.04469
G1 X106.878 Y100.236
G1 X105.226 Y101.887 E.04469
G1 X104.668 Y101.887
G1 X106.32 Y100.236 E.04469
G1 X105.762 Y100.236
G1 X104.111 Y101.887 E.04469
G1 X103.553 Y101.887
G1 X105.204 Y100.236 E.04469
G1 X104.646 Y100.236
G1 X102.995 Y101.887 E.04469
G1 X102.437 Y101.887
G1 X104.089 Y100.236 E.04469
G1 X103.531 Y100.236
G1 X101.879 Y101.887 E.04469
G1 X101.321 Y101.887
G1 X102.973 Y100.236 E.04469
G1 X102.415 Y100.236
G1 X100.764 Y101.887 E.04469
G1 X100.206 Y101.887
G1 X101.857 Y100.236 E.04469
G1 X101.299 Y100.236
G1 X99.648 Y101.887 E.04469
G1 X99.09 Y101.887
G1 X100.742 Y100.236 E.04469
G1 X100.184 Y100.236
G1 X98.532 Y101.887 E.04469
G1 X97.974 Y101.887
G1 X99.626 Y100.236 E.04469
G1 X99.068 Y100.236
G1 X97.417 Y101.887 E.04469
G1 X96.859 Y101.887
G1 X98.51 Y100.236 E.04469
G1 X97.952 Y100.236
G1 X96.301 Y101.887 E.04469
G1 X95.743 Y101.887
G1 X97.395 Y100.236 E.04469
G1 X96.837 Y100.236
G1 X95.185 Y101.887 E.04469
G1 X94.627 Y101.887
G1 X96.279 Y100.236 E.04469
G1 X95.721 Y100.236
G1 X94.07 Y101.887 E.04469
G1 X93.512 Y101.887
G1 X95.163 Y100.236 E.04469
G1 X94.605 Y100.236
G1 X92.954 Y101.887 E.04469
G1 X92.396 Y101.887
G1 X94.048 Y100.236 E.04469
G1 X93.49 Y100.236
G1 X91.838 Y101.887 E.04469
G1 X91.28 Y101.887
G1 X92.932 Y100.236 E.04469
G1 X92.374 Y100.236
G1 X90.723 Y101.887 E.04469
G1 X90.413 Y101.639
M73 P69 R5
G1 X91.816 Y100.236 E.03798
G1 X91.258 Y100.236
G1 X90.202 Y101.292 E.02858
G1 X89.992 Y100.945
G1 X90.7 Y100.236 E.01918
G1 X90.143 Y100.236
G1 X89.781 Y100.597 E.00978
M204 S10000
G1 X93.777 Y107.033 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X93.98 Y106.829 E.00593
G1 X94.439 Y106.829 E.00944
G1 X95.811 Y108.201 E.03996
G3 X97.465 Y111.02 I-32.529 J20.974 E.06731
G1 X96.62 Y111.866 E.02461
G1 X99.142 Y117.019 F28800
G1 F16200
G1 X98.186 Y117.975 E.02785
G3 X98.198 Y118.264 I-3.434 J.294 E.00595
G1 X99.238 Y119.304 E.03028
G1 X99.256 Y119.73 E.00879
G1 X99.665 Y119.73 E.00841
G1 X100.799 Y120.865 E.03303
G1 X102.972 Y120.865 E.04475
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 X110.648 Y120.865 E.04475
G1 X111.783 Y119.73 E.03303
G1 X112.191 Y119.73 E.00841
G1 X112.209 Y119.304 E.00879
G1 X113.249 Y118.264 E.03028
G3 X113.262 Y117.975 I3.446 J.005 E.00595
G1 X112.305 Y117.019 E.02785
G1 X114.828 Y111.866 F28800
G1 F16200
G1 X113.982 Y111.02 E.02461
G3 X115.636 Y108.201 I34.176 J18.151 E.06731
G1 X117.008 Y106.829 E.03996
G1 X117.467 Y106.829 E.00944
G1 X117.671 Y107.033 E.00593
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X117.467 Y106.829 E-.03284
G1 X117.008 Y106.829 E-.05228
G1 X116.122 Y107.715 E-.14288
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.941 I-1.183 J-.283 P1  F28800
G1 X112.104 Y124.494 Z1.941
G1 Z1.541
G1 E.8 F1800
G1 F16200
G1 X113.238 Y125.628 E.03303
G1 X113.238 Y125.951 E.00665
G1 X112.104 Y127.085 E.03303
G1 X112.104 Y132.17 E.10468
G1 X113.238 Y133.304 E.03303
G1 X113.238 Y133.627 E.00665
G1 X112.104 Y134.761 E.03303
G1 X112.104 Y139.846 E.10468
G1 X113.238 Y140.98 E.03303
M73 P69 R4
G1 X113.238 Y141.303 E.00665
G1 X112.104 Y142.437 E.03303
G1 X112.104 Y147.522 E.10468
G1 X113.238 Y148.656 E.03303
G1 X113.238 Y148.979 E.00665
G1 X112.104 Y150.113 E.03303
G1 X112.104 Y155.198 E.10468
G1 X113.238 Y156.332 E.03303
G1 X113.238 Y156.655 E.00665
G1 X112.104 Y157.789 E.03303
G1 X112.104 Y162.873 E.10468
G1 X113.238 Y164.008 E.03303
G1 X113.238 Y164.331 E.00665
G1 X112.104 Y165.465 E.03303
G1 X112.104 Y168.811 E.06889
G3 X111.908 Y170.354 I-6.965 J-.101 E.03208
G1 X112.816 Y171.261 E.02643
G3 X109.289 Y175.41 I-7.394 J-2.712 E.11448
G1 X108.442 Y174.564 E.02466
G3 X103.002 Y174.567 I-2.724 J-5.795 E.11568
G1 X102.16 Y175.409 E.0245
G3 X98.63 Y171.263 I3.701 J-6.728 E.1146
G1 X99.541 Y170.352 E.02652
G3 X99.344 Y168.815 I6.553 J-1.622 E.03198
G1 X99.344 Y165.465 E.06896
G1 X98.209 Y164.331 E.03303
G1 X98.209 Y164.008 E.00665
G1 X99.344 Y162.873 E.03303
G1 X99.344 Y157.789 E.10468
G1 X98.209 Y156.655 E.03303
G1 X98.209 Y156.332 E.00665
G1 X99.344 Y155.198 E.03303
G1 X99.344 Y150.113 E.10468
G1 X98.209 Y148.979 E.03303
G1 X98.209 Y148.656 E.00665
G1 X99.344 Y147.522 E.03303
G1 X99.344 Y142.437 E.10468
G1 X98.209 Y141.303 E.03303
G1 X98.209 Y140.98 E.00665
G1 X99.344 Y139.846 E.03303
G1 X99.344 Y134.761 E.10468
G1 X98.209 Y133.627 E.03303
G1 X98.209 Y133.304 E.00665
G1 X99.344 Y132.17 E.03303
G1 X99.344 Y127.085 E.10468
G1 X98.209 Y125.951 E.03303
G1 X98.209 Y125.628 E.00665
G1 X99.344 Y124.494 E.03303
G1 X94.624 Y106.428 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X92.883 Y103.556 E.06427
G1 X92.894 Y103.336 E.00421
G1 X93.052 Y103.256 E.0034
G1 X118.395 Y103.256 E.48492
G1 X118.554 Y103.336 E.0034
G1 X118.579 Y103.525 E.00365
G1 X118.564 Y103.556 E.00065
G1 X116.823 Y106.428 E.06427
G1 X117.925 Y106.428 E.02108
G1 X120.545 Y102.104 E.09674
G1 X90.902 Y102.104 E.56719
G1 X93.523 Y106.428 E.09674
G1 X94.564 Y106.428 E.01993
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.523 Y106.428 E-.11876
G1 X93.026 Y105.609 E-.10924
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.941 I-.017 J1.217 P1  F28800
G1 X117.659 Y105.957 Z1.941
G1 Z1.541
G1 E.8 F1800
; LINE_WIDTH: 0.573292
G1 F15000
G1 X118.994 Y103.75 E.06852
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X117.959 Y105.462 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z1.941 I-.025 J-1.217 P1  F28800
G1 X93.788 Y105.957 Z1.941
G1 Z1.541
G1 E.8 F1800
; LINE_WIDTH: 0.5733
G1 F15000
G1 X92.512 Y103.851 E.06543
G1 X92.481 Y103.8 F28800
; LINE_WIDTH: 0.573298
G1 F15000
G1 X92.505 Y103.625 E.00468
; LINE_WIDTH: 0.534973
G1 X92.529 Y103.45 E.00436
; LINE_WIDTH: 0.496649
G1 X92.553 Y103.276 E.00403
; LINE_WIDTH: 0.431017
G1 X92.577 Y103.101 E.00347
G1 X92.951 Y102.875 E.00859
; LINE_WIDTH: 0.40434
G1 X118.395 Y102.87 E.46753
G1 X118.871 Y103.101 E.00972
; LINE_WIDTH: 0.42
G1 X118.909 Y103.25 E.00294
; LINE_WIDTH: 0.460854
G1 X118.947 Y103.399 E.00325
; LINE_WIDTH: 0.501709
G1 X118.985 Y103.548 E.00355
; LINE_WIDTH: 0.542563
G1 X119.023 Y103.698 E.00386
; LINE_WIDTH: 0.583418
G1 X119.141 Y103.541 E.00531
; LINE_WIDTH: 0.542563
G1 X119.26 Y103.385 E.00492
; LINE_WIDTH: 0.501709
G1 X119.379 Y103.229 E.00453
; LINE_WIDTH: 0.425215
G1 X119.497 Y103.072 E.00381
G1 X119.845 Y102.499 E.013
G1 X119.174 Y102.499 E.013
; LINE_WIDTH: 0.405494
G1 X93.052 Y102.491 E.48144
G3 X91.602 Y102.499 I-1.114 J-71.999 E.02672
G1 X91.95 Y103.072 E.01236
; LINE_WIDTH: 0.42
G1 X92.074 Y103.242 E.00402
; LINE_WIDTH: 0.458324
G1 X92.198 Y103.412 E.00441
; LINE_WIDTH: 0.496649
G1 X92.321 Y103.581 E.0048
; LINE_WIDTH: 0.534973
G1 X92.445 Y103.751 E.00519
G1 X119.197 Y102.837 F28800
; LINE_WIDTH: 0.386646
G1 F15000
G1 X119.129 Y102.876 E.00137
G1 X119.184 Y102.908 E.00111
G1 X92.296 Y102.837 F28800
; LINE_WIDTH: 0.386654
G1 F15000
G1 X92.228 Y102.876 E.00137
G1 X92.283 Y102.908 E.00111
; CHANGE_LAYER
; Z_HEIGHT: 1.66033
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X92.228 Y102.876 E-.10203
G1 X92.296 Y102.837 E-.12597
; WIPE_END
G1 E-.012 F1800

G17
G3 Z1.941 I-.834 J.886 P1  F28800
G1 X111.79 Y121.178 Z1.941
G1 Z1.66
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X100.055 Y170.956 I6.107 J-.018 E.0453
G1 X100.055 Y170.956 E0
G2 X111.79 Y168.804 I5.669 J-2.159 E.34677
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.06 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z2.06
G1 Z1.66
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.619 J3.108 E.13448
G1 X118.018 Y103.666 E.1473
G1 X93.429 Y103.666 E.50628
G1 X97.137 Y109.784 E.1473
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I18.047 J3.164 E.12826
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.06 I1.029 J.65 P1  F28800
G1 X121.875 Y100.7 Z2.06
G1 Z1.66
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X115.81 Y110.708 E.24093
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X89.573 Y100.7 E.24093
G1 X121.815 Y100.7 E.66384
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X120.786 Y102.415 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.06 I.966 J.74 P1  F28800
G1 X123.313 Y99.117 Z2.06
G1 Z1.66
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X122.418 Y100.593 E.03303
G1 X116.162 Y110.916 E.23096
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J0 E.49516
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X88.134 Y99.117 E.26399
G1 X123.253 Y99.117 E.67197
G1 X123.039 Y99.408 F28800
G1 X122.607 Y99.864
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X122.076 Y99.334 E.01435
G1 X121.518 Y99.334
G1 X122.396 Y100.212 E.02375
G1 X122.095 Y100.469
G1 X120.96 Y99.334 E.0307
G1 X120.403 Y99.334
G1 X121.537 Y100.469 E.0307
G1 X120.979 Y100.469
G1 X119.845 Y99.334 E.0307
G1 X119.287 Y99.334
G1 X120.422 Y100.469 E.0307
G1 X119.864 Y100.469
G1 X118.729 Y99.334 E.0307
G1 X118.171 Y99.334
G1 X119.306 Y100.469 E.0307
G1 X118.748 Y100.469
G1 X117.613 Y99.334 E.0307
G1 X117.056 Y99.334
G1 X118.19 Y100.469 E.0307
G1 X117.632 Y100.469
G1 X116.498 Y99.334 E.0307
G1 X115.94 Y99.334
G1 X117.075 Y100.469 E.0307
G1 X116.517 Y100.469
G1 X115.382 Y99.334 E.0307
G1 X114.824 Y99.334
G1 X115.959 Y100.469 E.0307
G1 X115.401 Y100.469
M73 P70 R4
G1 X114.266 Y99.334 E.0307
G1 X113.709 Y99.334
G1 X114.843 Y100.469 E.0307
G1 X114.285 Y100.469
G1 X113.151 Y99.334 E.0307
G1 X112.593 Y99.334
G1 X113.728 Y100.469 E.0307
G1 X113.17 Y100.469
G1 X112.035 Y99.334 E.0307
G1 X111.477 Y99.334
G1 X112.612 Y100.469 E.0307
G1 X112.054 Y100.469
G1 X110.919 Y99.334 E.0307
G1 X110.362 Y99.334
G1 X111.496 Y100.469 E.0307
G1 X110.938 Y100.469
G1 X109.804 Y99.334 E.0307
G1 X109.246 Y99.334
G1 X110.381 Y100.469 E.0307
G1 X109.823 Y100.469
G1 X108.688 Y99.334 E.0307
G1 X108.13 Y99.334
G1 X109.265 Y100.469 E.0307
G1 X108.707 Y100.469
G1 X107.572 Y99.334 E.0307
G1 X107.015 Y99.334
G1 X108.149 Y100.469 E.0307
G1 X107.591 Y100.469
G1 X106.457 Y99.334 E.0307
G1 X105.899 Y99.334
G1 X107.034 Y100.469 E.0307
G1 X106.476 Y100.469
G1 X105.341 Y99.334 E.0307
G1 X104.783 Y99.334
G1 X105.918 Y100.469 E.0307
G1 X105.36 Y100.469
G1 X104.225 Y99.334 E.0307
G1 X103.668 Y99.334
G1 X104.802 Y100.469 E.0307
G1 X104.244 Y100.469
G1 X103.11 Y99.334 E.0307
G1 X102.552 Y99.334
G1 X103.687 Y100.469 E.0307
G1 X103.129 Y100.469
G1 X101.994 Y99.334 E.0307
G1 X101.436 Y99.334
G1 X102.571 Y100.469 E.0307
G1 X102.013 Y100.469
G1 X100.878 Y99.334 E.0307
G1 X100.321 Y99.334
G1 X101.455 Y100.469 E.0307
G1 X100.897 Y100.469
G1 X99.763 Y99.334 E.0307
G1 X99.205 Y99.334
G1 X100.34 Y100.469 E.0307
G1 X99.782 Y100.469
G1 X98.647 Y99.334 E.0307
G1 X98.089 Y99.334
G1 X99.224 Y100.469 E.0307
G1 X98.666 Y100.469
G1 X97.531 Y99.334 E.0307
G1 X96.974 Y99.334
G1 X98.108 Y100.469 E.0307
G1 X97.55 Y100.469
G1 X96.416 Y99.334 E.0307
G1 X95.858 Y99.334
G1 X96.993 Y100.469 E.0307
G1 X96.435 Y100.469
G1 X95.3 Y99.334 E.0307
G1 X94.742 Y99.334
G1 X95.877 Y100.469 E.0307
G1 X95.319 Y100.469
G1 X94.184 Y99.334 E.0307
G1 X93.627 Y99.334
G1 X94.761 Y100.469 E.0307
G1 X94.203 Y100.469
G1 X93.069 Y99.334 E.0307
G1 X92.511 Y99.334
G1 X93.645 Y100.469 E.0307
G1 X93.088 Y100.469
G1 X91.953 Y99.334 E.0307
G1 X91.395 Y99.334
G1 X92.53 Y100.469 E.0307
G1 X91.972 Y100.469
G1 X90.837 Y99.334 E.0307
G1 X90.279 Y99.334
G1 X91.414 Y100.469 E.0307
G1 X90.856 Y100.469
G1 X89.722 Y99.334 E.0307
G1 X89.164 Y99.334
G1 X90.298 Y100.469 E.0307
G1 X89.741 Y100.469
G1 X88.606 Y99.334 E.0307
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X89.741 Y100.469 E-.18293
G1 X90.136 Y100.469 E-.04507
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.06 I-.03 J-1.217 P1  F28800
G1 X89.325 Y100.488 Z2.06
G1 Z1.66
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.2174
G1 F15000
G1 X89.171 Y100.292 E.00232
; LINE_WIDTH: 0.169229
G1 X89.017 Y100.096 E.00174
; LINE_WIDTH: 0.121057
G1 X88.864 Y99.9 E.00115
G1 X95.047 Y107.125 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.440824
G1 F15000
G1 X92.883 Y103.556 E.08407
G1 X92.857 Y103.427 E.00264
G1 X93.052 Y103.241 E.00544
G1 X118.395 Y103.241 E.51052
G1 X118.591 Y103.427 E.00544
G3 X118.564 Y103.556 I-.196 J.026 E.00269
G1 X116.401 Y107.125 E.08407
G1 X117.502 Y107.125 E.02219
G1 X120.123 Y102.801 E.10185
G2 X118.395 Y102.816 I-.492 J42.286 E.03481
G1 X93.052 Y102.816 E.51052
G2 X91.324 Y102.801 I-1.236 J42.271 E.03481
G1 X93.945 Y107.125 E.10185
G1 X94.987 Y107.125 E.02098
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.945 Y107.125 E-.11876
G1 X93.448 Y106.305 E-.10924
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.06 I-.018 J1.217 P1  F28800
G1 X117.237 Y106.654 Z2.06
G1 Z1.66
G1 E.8 F1800
; LINE_WIDTH: 0.573294
G1 F15000
G1 X118.967 Y103.8 E.08867
; LINE_WIDTH: 0.57329
G1 X119.005 Y103.702 E.00277
; LINE_WIDTH: 0.614659
G1 X119.042 Y103.605 E.00298
; LINE_WIDTH: 0.656029
G1 X119.08 Y103.508 E.00319
; LINE_WIDTH: 0.697398
G1 X119.118 Y103.411 E.0034
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X119.08 Y103.508 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.06 I-.153 J-1.207 P1  F28800
G1 X94.21 Y106.654 Z2.06
G1 Z1.66
G1 E.8 F1800
; LINE_WIDTH: 0.5733
G1 F15000
G1 X92.512 Y103.851 E.08708
G1 X92.481 Y103.8 F28800
; LINE_WIDTH: 0.573298
G1 F15000
G1 X92.482 Y103.694 E.0028
; LINE_WIDTH: 0.525514
G1 X92.482 Y103.589 E.00256
; LINE_WIDTH: 0.477731
G1 X92.483 Y103.483 E.00231
; LINE_WIDTH: 0.385792
G1 X92.484 Y103.378 E.00184
G1 X92.678 Y103.176 E.00488
G1 X91.991 Y103.176 E.012
G1 X92.155 Y103.447 E.00553
; LINE_WIDTH: 0.382164
G1 X92.226 Y103.524 E.00182
; LINE_WIDTH: 0.429947
G1 X92.297 Y103.601 E.00206
; LINE_WIDTH: 0.477731
G1 X92.369 Y103.678 E.0023
; LINE_WIDTH: 0.525514
G1 X92.44 Y103.756 E.00255
G1 X95.136 Y107.526 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X95.811 Y108.201 E.01967
G3 X97.465 Y111.02 I-32.529 J20.974 E.06731
G1 X96.62 Y111.866 E.02461
G1 X99.142 Y117.019 F28800
G1 F16200
G1 X98.186 Y117.975 E.02785
G3 X98.198 Y118.264 I-3.434 J.294 E.00595
G1 X99.238 Y119.304 E.03028
G1 X99.256 Y119.73 E.00879
G1 X99.665 Y119.73 E.00841
G1 X100.799 Y120.865 E.03303
G1 X102.972 Y120.865 E.04475
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 X110.648 Y120.865 E.04475
G1 X111.783 Y119.73 E.03303
G1 X112.191 Y119.73 E.00841
G1 X112.209 Y119.304 E.00879
G1 X113.249 Y118.264 E.03028
G3 X113.262 Y117.975 I3.446 J.005 E.00595
G1 X112.305 Y117.019 E.02785
G1 X114.828 Y111.866 F28800
G1 F16200
G1 X113.982 Y111.02 E.02461
G3 X115.636 Y108.201 I34.177 J18.152 E.06731
G1 X116.312 Y107.526 E.01967
G1 X121.245 Y101.292 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X120.886 Y100.932 E.00973
G1 X120.328 Y100.932
G1 X121.035 Y101.639 E.01913
G1 X120.824 Y101.987
G1 X119.77 Y100.932 E.02853
G1 X119.212 Y100.932
G1 X120.614 Y102.334 E.03792
G1 X120.306 Y102.584
G1 X118.654 Y100.932 E.04469
G1 X118.096 Y100.932
G1 X119.748 Y102.584 E.04469
G1 X119.19 Y102.584
G1 X117.539 Y100.932 E.04469
G1 X116.981 Y100.932
G1 X118.632 Y102.584 E.04469
G1 X118.074 Y102.584
G1 X116.423 Y100.932 E.04469
G1 X115.865 Y100.932
G1 X117.516 Y102.584 E.04469
G1 X116.959 Y102.584
G1 X115.307 Y100.932 E.04469
G1 X114.749 Y100.932
G1 X116.401 Y102.584 E.04469
G1 X115.843 Y102.584
G1 X114.192 Y100.932 E.04469
G1 X113.634 Y100.932
G1 X115.285 Y102.584 E.04469
G1 X114.727 Y102.584
G1 X113.076 Y100.932 E.04469
G1 X112.518 Y100.932
G1 X114.169 Y102.584 E.04469
G1 X113.612 Y102.584
G1 X111.96 Y100.932 E.04469
G1 X111.402 Y100.932
G1 X113.054 Y102.584 E.04469
G1 X112.496 Y102.584
G1 X110.844 Y100.932 E.04469
G1 X110.287 Y100.932
G1 X111.938 Y102.584 E.04469
G1 X111.38 Y102.584
G1 X109.729 Y100.932 E.04469
G1 X109.171 Y100.932
G1 X110.822 Y102.584 E.04469
G1 X110.265 Y102.584
G1 X108.613 Y100.932 E.04469
G1 X108.055 Y100.932
G1 X109.707 Y102.584 E.04469
G1 X109.149 Y102.584
G1 X107.497 Y100.932 E.04469
G1 X106.94 Y100.932
G1 X108.591 Y102.584 E.04469
G1 X108.033 Y102.584
G1 X106.382 Y100.932 E.04469
G1 X105.824 Y100.932
G1 X107.475 Y102.584 E.04469
G1 X106.918 Y102.584
G1 X105.266 Y100.932 E.04469
G1 X104.708 Y100.932
G1 X106.36 Y102.584 E.04469
G1 X105.802 Y102.584
G1 X104.15 Y100.932 E.04469
G1 X103.593 Y100.932
G1 X105.244 Y102.584 E.04469
G1 X104.686 Y102.584
G1 X103.035 Y100.932 E.04469
G1 X102.477 Y100.932
G1 X104.128 Y102.584 E.04469
G1 X103.571 Y102.584
G1 X101.919 Y100.932 E.04469
G1 X101.361 Y100.932
G1 X103.013 Y102.584 E.04469
G1 X102.455 Y102.584
G1 X100.803 Y100.932 E.04469
G1 X100.246 Y100.932
G1 X101.897 Y102.584 E.04469
G1 X101.339 Y102.584
G1 X99.688 Y100.932 E.04469
G1 X99.13 Y100.932
G1 X100.781 Y102.584 E.04469
G1 X100.224 Y102.584
G1 X98.572 Y100.932 E.04469
G1 X98.014 Y100.932
G1 X99.666 Y102.584 E.04469
G1 X99.108 Y102.584
G1 X97.456 Y100.932 E.04469
G1 X96.899 Y100.932
G1 X98.55 Y102.584 E.04469
G1 X97.992 Y102.584
G1 X96.341 Y100.932 E.04469
G1 X95.783 Y100.932
G1 X97.434 Y102.584 E.04469
G1 X96.876 Y102.584
G1 X95.225 Y100.932 E.04469
G1 X94.667 Y100.932
G1 X96.319 Y102.584 E.04469
G1 X95.761 Y102.584
M73 P71 R4
G1 X94.109 Y100.932 E.04469
G1 X93.552 Y100.932
G1 X95.203 Y102.584 E.04469
G1 X94.645 Y102.584
G1 X92.994 Y100.932 E.04469
G1 X92.436 Y100.932
G1 X94.087 Y102.584 E.04469
G1 X93.529 Y102.584
G1 X91.878 Y100.932 E.04469
G1 X91.32 Y100.932
G1 X92.972 Y102.584 E.04469
G1 X92.414 Y102.584
G1 X90.762 Y100.932 E.04469
G1 X90.205 Y100.932
G1 X91.856 Y102.584 E.04469
G1 X91.298 Y102.584
G1 X90.504 Y101.79 E.02149
M204 S10000
G1 X90.568 Y101.726 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.216783
G1 F15000
G1 X90.42 Y101.537 E.00223
; LINE_WIDTH: 0.168817
G1 X90.271 Y101.348 E.00167
; LINE_WIDTH: 0.120851
G1 X90.123 Y101.16 E.00111
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X90.271 Y101.348 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.06 I-1.133 J.444 P1  F28800
G1 X99.344 Y124.494 Z2.06
G1 Z1.66
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03199
G1 X98.632 Y171.261 E.02647
G2 X102.16 Y175.409 I7.218 J-2.566 E.11462
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.287 Y175.409 E.0246
G2 X112.816 Y171.261 I-3.845 J-6.847 E.11449
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 1.77939
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.238 Y125.628 E-.18287
G1 X113.238 Y125.951 E-.03684
G1 X113.187 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z2.06 I1.169 J-.338 P1  F28800
G1 X111.79 Y121.178 Z2.06
G1 Z1.779
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.179 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z2.179
G1 Z1.779
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.64 J3.116 E.13448
G1 X118.018 Y103.666 E.1473
G1 X93.429 Y103.666 E.50628
G1 X97.137 Y109.784 E.1473
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I18.068 J3.172 E.12825
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.179 I1.028 J.651 P1  F28800
G1 X121.453 Y101.397 Z2.179
G1 Z1.779
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X115.81 Y110.708 E.22415
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J.003 E.50643
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X89.995 Y101.397 E.22415
G1 X121.393 Y101.397 E.64646
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X120.364 Y103.112 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.179 I.966 J.74 P1  F28800
G1 X122.891 Y99.814 Z2.179
G1 Z1.779
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X122.059 Y101.187 E.03072
G1 X116.162 Y110.916 E.21769
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.002 E.49507
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X88.556 Y99.814 E.24841
G1 X122.831 Y99.814 E.65581
G1 X122.616 Y100.104 F28800
G1 X122.145 Y100.031
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X121.01 Y101.165 E.0307
G1 X120.452 Y101.165
G1 X121.587 Y100.031 E.0307
G1 X121.029 Y100.031
G1 X119.894 Y101.165 E.0307
G1 X119.336 Y101.165
G1 X120.471 Y100.031 E.0307
G1 X119.913 Y100.031
G1 X118.779 Y101.165 E.0307
G1 X118.221 Y101.165
G1 X119.355 Y100.031 E.0307
G1 X118.798 Y100.031
G1 X117.663 Y101.165 E.0307
G1 X117.105 Y101.165
G1 X118.24 Y100.031 E.0307
G1 X117.682 Y100.031
G1 X116.547 Y101.165 E.0307
G1 X115.989 Y101.165
G1 X117.124 Y100.031 E.0307
G1 X116.566 Y100.031
G1 X115.432 Y101.165 E.0307
G1 X114.874 Y101.165
G1 X116.008 Y100.031 E.0307
G1 X115.451 Y100.031
G1 X114.316 Y101.165 E.0307
G1 X113.758 Y101.165
G1 X114.893 Y100.031 E.0307
G1 X114.335 Y100.031
G1 X113.2 Y101.165 E.0307
G1 X112.642 Y101.165
G1 X113.777 Y100.031 E.0307
G1 X113.219 Y100.031
G1 X112.085 Y101.165 E.0307
G1 X111.527 Y101.165
G1 X112.661 Y100.031 E.0307
G1 X112.104 Y100.031
G1 X110.969 Y101.165 E.0307
G1 X110.411 Y101.165
G1 X111.546 Y100.031 E.0307
G1 X110.988 Y100.031
G1 X109.853 Y101.165 E.0307
G1 X109.295 Y101.165
G1 X110.43 Y100.031 E.0307
G1 X109.872 Y100.031
G1 X108.737 Y101.165 E.0307
G1 X108.18 Y101.165
G1 X109.314 Y100.031 E.0307
G1 X108.756 Y100.031
G1 X107.622 Y101.165 E.0307
G1 X107.064 Y101.165
G1 X108.199 Y100.031 E.0307
G1 X107.641 Y100.031
G1 X106.506 Y101.165 E.0307
G1 X105.948 Y101.165
G1 X107.083 Y100.031 E.0307
G1 X106.525 Y100.031
G1 X105.39 Y101.165 E.0307
G1 X104.833 Y101.165
G1 X105.967 Y100.031 E.0307
G1 X105.409 Y100.031
G1 X104.275 Y101.165 E.0307
G1 X103.717 Y101.165
G1 X104.852 Y100.031 E.0307
G1 X104.294 Y100.031
M73 P72 R4
G1 X103.159 Y101.165 E.0307
G1 X102.601 Y101.165
G1 X103.736 Y100.031 E.0307
G1 X103.178 Y100.031
G1 X102.043 Y101.165 E.0307
G1 X101.486 Y101.165
G1 X102.62 Y100.031 E.0307
G1 X102.062 Y100.031
G1 X100.928 Y101.165 E.0307
G1 X100.37 Y101.165
G1 X101.505 Y100.031 E.0307
G1 X100.947 Y100.031
G1 X99.812 Y101.165 E.0307
G1 X99.254 Y101.165
G1 X100.389 Y100.031 E.0307
G1 X99.831 Y100.031
G1 X98.696 Y101.165 E.0307
G1 X98.139 Y101.165
G1 X99.273 Y100.031 E.0307
G1 X98.715 Y100.031
G1 X97.581 Y101.165 E.0307
G1 X97.023 Y101.165
G1 X98.158 Y100.031 E.0307
G1 X97.6 Y100.031
G1 X96.465 Y101.165 E.0307
G1 X95.907 Y101.165
G1 X97.042 Y100.031 E.0307
G1 X96.484 Y100.031
G1 X95.349 Y101.165 E.0307
G1 X94.792 Y101.165
G1 X95.926 Y100.031 E.0307
G1 X95.368 Y100.031
G1 X94.234 Y101.165 E.0307
G1 X93.676 Y101.165
G1 X94.811 Y100.031 E.0307
G1 X94.253 Y100.031
G1 X93.118 Y101.165 E.0307
G1 X92.56 Y101.165
G1 X93.695 Y100.031 E.0307
G1 X93.137 Y100.031
G1 X92.002 Y101.165 E.0307
G1 X91.445 Y101.165
G1 X92.579 Y100.031 E.0307
G1 X92.021 Y100.031
G1 X90.887 Y101.165 E.0307
G1 X90.329 Y101.165
G1 X91.464 Y100.031 E.0307
G1 X90.906 Y100.031
G1 X89.771 Y101.165 E.0307
G1 X89.472 Y100.906
G1 X90.348 Y100.031 E.0237
G1 X89.79 Y100.031
G1 X89.262 Y100.559 E.0143
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X89.79 Y100.031 E-.08518
G1 X90.348 Y100.031 E-.06359
G1 X89.856 Y100.522 E-.07923
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.179 I.019 J1.217 P1  F28800
G1 X122.146 Y100.011 Z2.179
G1 Z1.779
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.212052
G1 F15000
G1 X122.364 Y100.11 E.00216
; LINE_WIDTH: 0.224861
G1 X122.349 Y100.165 E.00055
; LINE_WIDTH: 0.194781
G1 X122.333 Y100.219 E.00046
; LINE_WIDTH: 0.1647
G1 X122.213 Y100.373 E.00132
; LINE_WIDTH: 0.211572
G1 X122.092 Y100.527 E.00176
; LINE_WIDTH: 0.258445
G1 X121.972 Y100.68 E.00221
; LINE_WIDTH: 0.305317
G1 X121.851 Y100.834 E.00265
; LINE_WIDTH: 0.378533
G1 X121.576 Y101.185 E.00764
G1 X119.452 Y103.281 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X120.944 Y101.789 E.04035
G1 X120.546 Y101.629
G1 X118.895 Y103.281 E.04469
G1 X118.337 Y103.281
G1 X119.988 Y101.629 E.04469
G1 X119.43 Y101.629
G1 X117.779 Y103.281 E.04469
G1 X117.221 Y103.281
G1 X118.872 Y101.629 E.04469
G1 X118.315 Y101.629
G1 X116.663 Y103.281 E.04469
G1 X116.105 Y103.281
G1 X117.757 Y101.629 E.04469
G1 X117.199 Y101.629
G1 X115.548 Y103.281 E.04469
G1 X114.99 Y103.281
G1 X116.641 Y101.629 E.04469
G1 X116.083 Y101.629
G1 X114.432 Y103.281 E.04469
G1 X113.874 Y103.281
G1 X115.525 Y101.629 E.04469
G1 X114.968 Y101.629
G1 X113.316 Y103.281 E.04469
G1 X112.758 Y103.281
G1 X114.41 Y101.629 E.04469
G1 X113.852 Y101.629
G1 X112.201 Y103.281 E.04469
G1 X111.643 Y103.281
G1 X113.294 Y101.629 E.04469
G1 X112.736 Y101.629
G1 X111.085 Y103.281 E.04469
G1 X110.527 Y103.281
G1 X112.178 Y101.629 E.04469
G1 X111.621 Y101.629
G1 X109.969 Y103.281 E.04469
G1 X109.411 Y103.281
G1 X111.063 Y101.629 E.04469
G1 X110.505 Y101.629
G1 X108.854 Y103.281 E.04469
G1 X108.296 Y103.281
G1 X109.947 Y101.629 E.04469
G1 X109.389 Y101.629
G1 X107.738 Y103.281 E.04469
G1 X107.18 Y103.281
G1 X108.831 Y101.629 E.04469
G1 X108.274 Y101.629
G1 X106.622 Y103.281 E.04469
G1 X106.064 Y103.281
G1 X107.716 Y101.629 E.04469
G1 X107.158 Y101.629
G1 X105.506 Y103.281 E.04469
G1 X104.949 Y103.281
G1 X106.6 Y101.629 E.04469
G1 X106.042 Y101.629
G1 X104.391 Y103.281 E.04469
G1 X103.833 Y103.281
G1 X105.484 Y101.629 E.04469
G1 X104.927 Y101.629
G1 X103.275 Y103.281 E.04469
G1 X102.717 Y103.281
G1 X104.369 Y101.629 E.04469
G1 X103.811 Y101.629
G1 X102.159 Y103.281 E.04469
G1 X101.602 Y103.281
G1 X103.253 Y101.629 E.04469
G1 X102.695 Y101.629
G1 X101.044 Y103.281 E.04469
G1 X100.486 Y103.281
G1 X102.137 Y101.629 E.04469
G1 X101.58 Y101.629
G1 X99.928 Y103.281 E.04469
G1 X99.37 Y103.281
G1 X101.022 Y101.629 E.04469
G1 X100.464 Y101.629
G1 X98.812 Y103.281 E.04469
G1 X98.255 Y103.281
G1 X99.906 Y101.629 E.04469
G1 X99.348 Y101.629
G1 X97.697 Y103.281 E.04469
G1 X97.139 Y103.281
G1 X98.79 Y101.629 E.04469
G1 X98.233 Y101.629
G1 X96.581 Y103.281 E.04469
G1 X96.023 Y103.281
G1 X97.675 Y101.629 E.04469
G1 X97.117 Y101.629
G1 X95.465 Y103.281 E.04469
G1 X94.908 Y103.281
G1 X96.559 Y101.629 E.04469
G1 X96.001 Y101.629
G1 X94.35 Y103.281 E.04469
G1 X93.792 Y103.281
G1 X95.443 Y101.629 E.04469
G1 X94.886 Y101.629
G1 X93.234 Y103.281 E.04469
G1 X92.676 Y103.281
G1 X94.328 Y101.629 E.04469
G1 X93.77 Y101.629
G1 X92.118 Y103.281 E.04469
G1 X91.561 Y103.281
G1 X93.212 Y101.629 E.04469
G1 X92.654 Y101.629
G1 X91.255 Y103.029 E.03787
G1 X91.044 Y102.681
G1 X92.096 Y101.629 E.02847
G1 X91.538 Y101.629
G1 X90.834 Y102.334 E.01907
G1 X90.623 Y101.987
G1 X90.981 Y101.629 E.00967
M204 S10000
G1 X93.242 Y103.377 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36555
G1 F15000
G1 X93.099 Y103.377 E.00237
G1 X95.469 Y107.822 F28800
; LINE_WIDTH: 0.42
G1 F15000
G1 X92.986 Y103.724 E.09167
G1 X92.895 Y103.548 E.00379
; LINE_WIDTH: 0.386894
G1 X93.039 Y103.377 E.00391
G1 X92.78 Y103.483 E.0049
; LINE_WIDTH: 0.419076
G1 X91.747 Y103.497 E.01974
G1 X94.367 Y107.822 E.09652
G1 X95.409 Y107.822 E.01989
G1 X92.583 Y103.969 F28800
; LINE_WIDTH: 0.5733
G1 F15000
G1 X94.601 Y107.299 E.10348
G1 X96.62 Y111.866 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X97.465 Y111.02 E.02461
G3 X99.096 Y115.905 I-16.339 J8.169 E.10638
G1 X99.142 Y117.019 E.02295
G1 X98.186 Y117.975 E.02785
G3 X98.198 Y118.264 I-3.434 J.294 E.00595
G1 X99.238 Y119.304 E.03028
G1 X99.256 Y119.73 E.00879
G1 X99.665 Y119.73 E.00841
G1 X100.799 Y120.865 E.03303
G1 X102.972 Y120.865 E.04475
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 X110.648 Y120.865 E.04475
G1 X111.783 Y119.73 E.03303
G1 X112.191 Y119.73 E.00841
G1 X112.209 Y119.304 E.00879
G1 X113.249 Y118.264 E.03028
G3 X113.262 Y117.975 I3.446 J.005 E.00595
G1 X112.305 Y117.019 E.02785
G3 X113.303 Y112.513 I11.816 J.254 E.09564
G3 X113.982 Y111.02 I17.516 J7.071 E.03377
G1 X114.828 Y111.866 E.02461
G1 X118.205 Y103.377 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36555
G1 F15000
G1 X118.335 Y103.377 E.00215
G1 X115.978 Y107.822 F28800
; LINE_WIDTH: 0.42
G1 F15000
G1 X117.08 Y107.822 E.02108
G1 X119.701 Y103.497 E.09675
G3 X118.667 Y103.486 I-.418 J-9.259 E.01979
; LINE_WIDTH: 0.392999
G1 X118.395 Y103.377 E.00522
G1 X118.554 Y103.55 E.00419
; LINE_WIDTH: 0.4198
G1 X116.01 Y107.77 E.09425
G1 X116.815 Y107.35 F28800
; LINE_WIDTH: 0.573298
G1 F15000
G1 X118.833 Y104.02 E.10348
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X117.797 Y105.73 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.179 I-1.165 J-.353 P1  F28800
G1 X112.104 Y124.494 Z2.179
G1 Z1.779
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.238 Y125.628 E.03303
G1 X113.238 Y125.951 E.00665
G1 X112.104 Y127.085 E.03303
G1 X112.104 Y132.17 E.10468
G1 X113.238 Y133.304 E.03303
G1 X113.238 Y133.627 E.00665
G1 X112.104 Y134.761 E.03303
G1 X112.104 Y139.846 E.10468
G1 X113.238 Y140.98 E.03303
G1 X113.238 Y141.303 E.00665
G1 X112.104 Y142.437 E.03303
G1 X112.104 Y147.522 E.10468
G1 X113.238 Y148.656 E.03303
G1 X113.238 Y148.979 E.00665
G1 X112.104 Y150.113 E.03303
G1 X112.104 Y155.198 E.10468
G1 X113.238 Y156.332 E.03303
G1 X113.238 Y156.655 E.00665
G1 X112.104 Y157.789 E.03303
G1 X112.104 Y162.873 E.10468
G1 X113.238 Y164.008 E.03303
G1 X113.238 Y164.331 E.00665
G1 X112.104 Y165.465 E.03303
G1 X112.104 Y168.811 E.06889
G3 X111.908 Y170.354 I-6.965 J-.101 E.03208
G1 X112.816 Y171.261 E.02643
G3 X109.287 Y175.409 I-7.374 J-2.699 E.11449
G1 X108.442 Y174.564 E.0246
G3 X103.002 Y174.567 I-2.724 J-5.795 E.11568
G1 X102.16 Y175.409 E.0245
G3 X98.63 Y171.263 I3.599 J-6.641 E.11469
G1 X99.541 Y170.352 E.02652
G3 X99.344 Y168.815 I6.556 J-1.623 E.03199
G1 X99.344 Y165.465 E.06896
G1 X98.209 Y164.331 E.03303
G1 X98.209 Y164.008 E.00665
G1 X99.344 Y162.873 E.03303
G1 X99.344 Y157.789 E.10468
G1 X98.209 Y156.655 E.03303
G1 X98.209 Y156.332 E.00665
G1 X99.344 Y155.198 E.03303
G1 X99.344 Y150.113 E.10468
G1 X98.209 Y148.979 E.03303
G1 X98.209 Y148.656 E.00665
M73 P73 R4
G1 X99.344 Y147.522 E.03303
G1 X99.344 Y142.437 E.10468
G1 X98.209 Y141.303 E.03303
G1 X98.209 Y140.98 E.00665
G1 X99.344 Y139.846 E.03303
G1 X99.344 Y134.761 E.10468
G1 X98.209 Y133.627 E.03303
G1 X98.209 Y133.304 E.00665
G1 X99.344 Y132.17 E.03303
G1 X99.344 Y127.085 E.10468
G1 X98.209 Y125.951 E.03303
G1 X98.209 Y125.628 E.00665
G1 X99.344 Y124.494 E.03303
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.209 Y125.628 E-.18287
G1 X98.209 Y125.951 E-.03684
G1 X98.261 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.179 I-1.183 J.286 P1  F28800
G1 X109.807 Y173.84 Z2.179
G1 Z1.779
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.472896
G1 F15000
G1 X110.028 Y173.66 E.00618
; CHANGE_LAYER
; Z_HEIGHT: 1.89845
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.807 Y173.84 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z2.179 I1.216 J.046 P1  F28800
G1 X111.79 Y121.178 Z2.179
G1 Z1.898
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.008 E.39208
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.004 E.33993
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.298 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z2.298
G1 Z1.898
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.324 J2.998 E.1345
G1 X118.018 Y103.666 E.1473
G1 X93.429 Y103.666 E.50628
G1 X97.137 Y109.784 E.1473
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.744 J3.051 E.12828
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.298 I1.027 J.652 P1  F28800
G1 X121.03 Y102.094 Z2.298
G1 Z1.898
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X115.81 Y110.708 E.20738
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J.005 E.50652
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X90.417 Y102.094 E.20738
G1 X120.97 Y102.094 E.62907
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X119.942 Y103.809 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.298 I.966 J.74 P1  F28800
G1 X122.469 Y100.51 Z2.298
G1 Z1.898
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X121.699 Y101.78 E.02841
G1 X116.162 Y110.916 E.20441
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J0 E.49516
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X88.979 Y100.51 E.23282
G1 X122.409 Y100.51 E.63966
G1 X122.192 Y100.799 F28800
G1 X121.765 Y101.254
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X121.238 Y100.727 E.01424
G1 X120.68 Y100.727
G1 X121.554 Y101.601 E.02364
G1 X121.257 Y101.862
G1 X120.122 Y100.727 E.0307
G1 X119.565 Y100.727
G1 X120.699 Y101.862 E.0307
G1 X120.141 Y101.862
G1 X119.007 Y100.727 E.0307
G1 X118.449 Y100.727
G1 X119.584 Y101.862 E.0307
G1 X119.026 Y101.862
G1 X117.891 Y100.727 E.0307
G1 X117.333 Y100.727
G1 X118.468 Y101.862 E.0307
G1 X117.91 Y101.862
G1 X116.775 Y100.727 E.0307
G1 X116.218 Y100.727
G1 X117.352 Y101.862 E.0307
G1 X116.794 Y101.862
G1 X115.66 Y100.727 E.0307
G1 X115.102 Y100.727
G1 X116.237 Y101.862 E.0307
G1 X115.679 Y101.862
G1 X114.544 Y100.727 E.0307
G1 X113.986 Y100.727
G1 X115.121 Y101.862 E.0307
G1 X114.563 Y101.862
G1 X113.428 Y100.727 E.0307
G1 X112.871 Y100.727
G1 X114.005 Y101.862 E.0307
G1 X113.447 Y101.862
G1 X112.313 Y100.727 E.0307
G1 X111.755 Y100.727
G1 X112.89 Y101.862 E.0307
G1 X112.332 Y101.862
G1 X111.197 Y100.727 E.0307
G1 X110.639 Y100.727
G1 X111.774 Y101.862 E.0307
G1 X111.216 Y101.862
G1 X110.081 Y100.727 E.0307
G1 X109.524 Y100.727
G1 X110.658 Y101.862 E.0307
G1 X110.1 Y101.862
G1 X108.966 Y100.727 E.0307
G1 X108.408 Y100.727
G1 X109.543 Y101.862 E.0307
G1 X108.985 Y101.862
G1 X107.85 Y100.727 E.0307
G1 X107.292 Y100.727
G1 X108.427 Y101.862 E.0307
G1 X107.869 Y101.862
G1 X106.734 Y100.727 E.0307
G1 X106.177 Y100.727
G1 X107.311 Y101.862 E.0307
G1 X106.753 Y101.862
G1 X105.619 Y100.727 E.0307
G1 X105.061 Y100.727
G1 X106.196 Y101.862 E.0307
G1 X105.638 Y101.862
G1 X104.503 Y100.727 E.0307
G1 X103.945 Y100.727
G1 X105.08 Y101.862 E.0307
G1 X104.522 Y101.862
G1 X103.387 Y100.727 E.0307
G1 X102.83 Y100.727
G1 X103.964 Y101.862 E.0307
G1 X103.406 Y101.862
G1 X102.272 Y100.727 E.0307
G1 X101.714 Y100.727
G1 X102.849 Y101.862 E.0307
G1 X102.291 Y101.862
G1 X101.156 Y100.727 E.0307
G1 X100.598 Y100.727
G1 X101.733 Y101.862 E.0307
G1 X101.175 Y101.862
G1 X100.04 Y100.727 E.0307
G1 X99.483 Y100.727
G1 X100.617 Y101.862 E.0307
G1 X100.059 Y101.862
G1 X98.925 Y100.727 E.0307
G1 X98.367 Y100.727
G1 X99.502 Y101.862 E.0307
G1 X98.944 Y101.862
G1 X97.809 Y100.727 E.0307
G1 X97.251 Y100.727
G1 X98.386 Y101.862 E.0307
G1 X97.828 Y101.862
G1 X96.693 Y100.727 E.0307
G1 X96.136 Y100.727
G1 X97.27 Y101.862 E.0307
G1 X96.712 Y101.862
G1 X95.578 Y100.727 E.0307
G1 X95.02 Y100.727
G1 X96.155 Y101.862 E.0307
G1 X95.597 Y101.862
G1 X94.462 Y100.727 E.0307
G1 X93.904 Y100.727
G1 X95.039 Y101.862 E.0307
G1 X94.481 Y101.862
G1 X93.346 Y100.727 E.0307
G1 X92.789 Y100.727
G1 X93.923 Y101.862 E.0307
G1 X93.365 Y101.862
G1 X92.231 Y100.727 E.0307
G1 X91.673 Y100.727
G1 X92.807 Y101.862 E.0307
G1 X92.25 Y101.862
G1 X91.115 Y100.727 E.0307
G1 X90.557 Y100.727
G1 X91.692 Y101.862 E.0307
G1 X91.134 Y101.862
G1 X89.999 Y100.727 E.0307
G1 X89.441 Y100.727
G1 X90.576 Y101.862 E.0307
M204 S10000
G1 X90.165 Y101.882 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.21139
G1 F15000
G1 X90.018 Y101.693 E.00216
; LINE_WIDTH: 0.165221
G1 X89.87 Y101.504 E.00162
; LINE_WIDTH: 0.119053
G1 X89.722 Y101.316 E.00109
G1 X95.891 Y108.518 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X93.27 Y104.194 E.09675
G1 X92.169 Y104.194 E.02108
G1 X94.789 Y108.518 E.09675
G1 X95.831 Y108.518 E.01993
G1 X93.005 Y104.665 F28800
; LINE_WIDTH: 0.573298
G1 F15000
G1 X95.024 Y107.996 E.10348
G1 X96.62 Y111.866 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X97.465 Y111.02 E.02461
G3 X99.096 Y115.905 I-16.339 J8.169 E.10638
G1 X99.142 Y117.019 E.02295
G1 X98.186 Y117.975 E.02785
M73 P74 R4
G3 X98.198 Y118.264 I-3.434 J.294 E.00595
G1 X99.238 Y119.304 E.03028
G1 X99.256 Y119.73 E.00879
G1 X99.665 Y119.73 E.00841
G1 X100.799 Y120.865 E.03303
G1 X102.972 Y120.865 E.04475
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 X110.648 Y120.865 E.04475
G1 X111.783 Y119.73 E.03303
G1 X112.191 Y119.73 E.00841
G1 X112.209 Y119.304 E.00879
G1 X113.249 Y118.264 E.03028
G3 X113.262 Y117.975 I3.446 J.005 E.00595
G1 X112.305 Y117.019 E.02785
G3 X113.303 Y112.513 I11.816 J.254 E.09564
G3 X113.982 Y111.02 I17.516 J7.071 E.03377
G1 X114.828 Y111.866 E.02461
G1 X115.556 Y108.518 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X116.658 Y108.518 E.02108
G1 X119.279 Y104.194 E.09675
G1 X118.177 Y104.194 E.02108
G1 X115.587 Y108.467 E.0956
G1 X116.393 Y108.047 F28800
; LINE_WIDTH: 0.573298
G1 F15000
G1 X118.411 Y104.717 E.10348
G1 X120.048 Y102.326 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X120.403 Y102.681 E.00962
G1 X120.193 Y103.029
G1 X119.49 Y102.326 E.01902
G1 X118.932 Y102.326
G1 X119.982 Y103.376 E.02842
G1 X119.772 Y103.723
G1 X118.374 Y102.326 E.03782
G1 X117.816 Y102.326
G1 X119.468 Y103.977 E.04469
G1 X118.91 Y103.977
G1 X118.406 Y103.473 E.01363
G1 X118.366 Y103.434
G1 X117.258 Y102.326 E.02998
G1 X116.701 Y102.326
G1 X117.808 Y103.434 E.02998
G1 X117.251 Y103.434
G1 X116.143 Y102.326 E.02998
G1 X115.585 Y102.326
G1 X116.693 Y103.434 E.02998
G1 X116.135 Y103.434
G1 X115.027 Y102.326 E.02998
G1 X114.469 Y102.326
G1 X115.577 Y103.434 E.02998
G1 X115.019 Y103.434
G1 X113.911 Y102.326 E.02998
G1 X113.354 Y102.326
G1 X114.461 Y103.434 E.02998
G1 X113.904 Y103.434
G1 X112.796 Y102.326 E.02998
G1 X112.238 Y102.326
G1 X113.346 Y103.434 E.02998
G1 X112.788 Y103.434
G1 X111.68 Y102.326 E.02998
G1 X111.122 Y102.326
G1 X112.23 Y103.434 E.02998
G1 X111.672 Y103.434
G1 X110.564 Y102.326 E.02998
G1 X110.006 Y102.326
G1 X111.114 Y103.434 E.02998
G1 X110.556 Y103.434
G1 X109.449 Y102.326 E.02998
G1 X108.891 Y102.326
G1 X109.999 Y103.434 E.02998
G1 X109.441 Y103.434
G1 X108.333 Y102.326 E.02998
G1 X107.775 Y102.326
G1 X108.883 Y103.434 E.02998
G1 X108.325 Y103.434
G1 X107.217 Y102.326 E.02998
G1 X106.659 Y102.326
G1 X107.767 Y103.434 E.02998
G1 X107.209 Y103.434
G1 X106.102 Y102.326 E.02998
G1 X105.544 Y102.326
G1 X106.652 Y103.434 E.02998
G1 X106.094 Y103.434
G1 X104.986 Y102.326 E.02998
G1 X104.428 Y102.326
G1 X105.536 Y103.434 E.02998
G1 X104.978 Y103.434
G1 X103.87 Y102.326 E.02998
G1 X103.312 Y102.326
G1 X104.42 Y103.434 E.02998
G1 X103.862 Y103.434
G1 X102.755 Y102.326 E.02998
G1 X102.197 Y102.326
G1 X103.305 Y103.434 E.02998
G1 X102.747 Y103.434
G1 X101.639 Y102.326 E.02998
G1 X101.081 Y102.326
G1 X102.189 Y103.434 E.02998
G1 X101.631 Y103.434
G1 X100.523 Y102.326 E.02998
G1 X99.965 Y102.326
G1 X101.073 Y103.434 E.02998
G1 X100.515 Y103.434
G1 X99.408 Y102.326 E.02998
G1 X98.85 Y102.326
G1 X99.958 Y103.434 E.02998
G1 X99.4 Y103.434
G1 X98.292 Y102.326 E.02998
G1 X97.734 Y102.326
G1 X98.842 Y103.434 E.02998
G1 X98.284 Y103.434
G1 X97.176 Y102.326 E.02998
G1 X96.618 Y102.326
G1 X97.726 Y103.434 E.02998
G1 X97.168 Y103.434
G1 X96.061 Y102.326 E.02998
G1 X95.503 Y102.326
G1 X96.611 Y103.434 E.02998
G1 X96.053 Y103.434
G1 X94.945 Y102.326 E.02998
G1 X94.387 Y102.326
G1 X95.495 Y103.434 E.02998
G1 X94.937 Y103.434
G1 X93.829 Y102.326 E.02998
G1 X93.271 Y102.326
G1 X94.379 Y103.434 E.02998
G1 X93.821 Y103.434
G1 X92.714 Y102.326 E.02998
G1 X92.156 Y102.326
G1 X93.264 Y103.434 E.02998
G1 X93.249 Y103.977
G1 X91.598 Y102.326 E.04469
G1 X91.04 Y102.326
G1 X92.691 Y103.977 E.04469
G1 X92.134 Y103.977
G1 X91.362 Y103.206 E.02088
M204 S10000
G1 X91.426 Y103.142 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.216783
G1 F15000
G1 X91.278 Y102.953 E.00223
; LINE_WIDTH: 0.168817
G1 X91.13 Y102.765 E.00167
; LINE_WIDTH: 0.120851
G1 X90.982 Y102.576 E.00111
G1 X93.529 Y103.453 F28800
; LINE_WIDTH: 0.0877809
G1 F15000
G1 X93.366 Y103.331 E.00061
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.529 Y103.453 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.298 I-1.173 J.324 P1  F28800
G1 X99.344 Y124.494 Z2.298
G1 Z1.898
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03199
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.13 J-2.496 E.11469
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.287 Y175.409 E.0246
G2 X112.816 Y171.261 I-3.845 J-6.847 E.11449
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 2.0175
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.238 Y125.628 E-.18287
G1 X113.238 Y125.951 E-.03684
G1 X113.187 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z2.298 I1.169 J-.338 P1  F28800
G1 X111.79 Y121.178 Z2.298
G1 Z2.018
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.418 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z2.418
G1 Z2.018
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.324 J2.998 E.1345
G1 X118.018 Y103.666 E.1473
G1 X93.429 Y103.666 E.50628
G1 X97.137 Y109.784 E.1473
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.744 J3.051 E.12828
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.418 I1.027 J.653 P1  F28800
G1 X120.608 Y102.79 Z2.418
G1 Z2.018
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X115.81 Y110.708 E.19061
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J.005 E.50652
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X90.839 Y102.79 E.19061
G1 X120.548 Y102.79 E.61168
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X119.521 Y104.507 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.418 I.966 J.74 P1  F28800
G1 X122.047 Y101.207 Z2.418
G1 Z2.018
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X121.339 Y102.374 E.0261
G1 X116.162 Y110.916 E.19113
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J0 E.49516
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X89.401 Y101.207 E.21723
G1 X121.987 Y101.207 E.6235
G1 X121.768 Y101.494 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X121.339 Y102.374 E-.15209
G1 X120.994 Y102.943 E-.07591
; WIPE_END
G1 E-.012 F1800
G17
M73 P75 R4
G3 Z2.418 I.517 J-1.102 P1  F28800
G1 X120.174 Y102.559 Z2.418
G1 Z2.018
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X121.309 Y101.424 E.0307
G1 X120.751 Y101.424
G1 X119.617 Y102.559 E.0307
G1 X119.059 Y102.559
G1 X120.193 Y101.424 E.0307
G1 X119.636 Y101.424
G1 X118.501 Y102.559 E.0307
G1 X117.943 Y102.559
G1 X119.078 Y101.424 E.0307
G1 X118.52 Y101.424
G1 X117.385 Y102.559 E.0307
G1 X116.827 Y102.559
G1 X117.962 Y101.424 E.0307
G1 X117.404 Y101.424
G1 X116.27 Y102.559 E.0307
G1 X115.712 Y102.559
G1 X116.846 Y101.424 E.0307
G1 X116.289 Y101.424
G1 X115.154 Y102.559 E.0307
G1 X114.596 Y102.559
G1 X115.731 Y101.424 E.0307
G1 X115.173 Y101.424
G1 X114.038 Y102.559 E.0307
G1 X113.48 Y102.559
G1 X114.615 Y101.424 E.0307
G1 X114.057 Y101.424
G1 X112.923 Y102.559 E.0307
G1 X112.365 Y102.559
G1 X113.499 Y101.424 E.0307
G1 X112.941 Y101.424
G1 X111.807 Y102.559 E.0307
G1 X111.249 Y102.559
G1 X112.384 Y101.424 E.0307
G1 X111.826 Y101.424
G1 X110.691 Y102.559 E.0307
G1 X110.133 Y102.559
G1 X111.268 Y101.424 E.0307
G1 X110.71 Y101.424
G1 X109.575 Y102.559 E.0307
G1 X109.018 Y102.559
G1 X110.152 Y101.424 E.0307
G1 X109.594 Y101.424
G1 X108.46 Y102.559 E.0307
G1 X107.902 Y102.559
G1 X109.037 Y101.424 E.0307
G1 X108.479 Y101.424
G1 X107.344 Y102.559 E.0307
G1 X106.786 Y102.559
G1 X107.921 Y101.424 E.0307
G1 X107.363 Y101.424
G1 X106.228 Y102.559 E.0307
G1 X105.671 Y102.559
G1 X106.805 Y101.424 E.0307
G1 X106.247 Y101.424
G1 X105.113 Y102.559 E.0307
G1 X104.555 Y102.559
G1 X105.69 Y101.424 E.0307
G1 X105.132 Y101.424
G1 X103.997 Y102.559 E.0307
G1 X103.439 Y102.559
G1 X104.574 Y101.424 E.0307
G1 X104.016 Y101.424
G1 X102.881 Y102.559 E.0307
G1 X102.324 Y102.559
G1 X103.458 Y101.424 E.0307
G1 X102.9 Y101.424
G1 X101.766 Y102.559 E.0307
G1 X101.208 Y102.559
G1 X102.343 Y101.424 E.0307
G1 X101.785 Y101.424
G1 X100.65 Y102.559 E.0307
G1 X100.092 Y102.559
G1 X101.227 Y101.424 E.0307
G1 X100.669 Y101.424
G1 X99.534 Y102.559 E.0307
G1 X98.977 Y102.559
G1 X100.111 Y101.424 E.0307
G1 X99.553 Y101.424
G1 X98.419 Y102.559 E.0307
G1 X97.861 Y102.559
G1 X98.996 Y101.424 E.0307
G1 X98.438 Y101.424
M73 P75 R3
G1 X97.303 Y102.559 E.0307
G1 X96.745 Y102.559
G1 X97.88 Y101.424 E.0307
G1 X97.322 Y101.424
G1 X96.187 Y102.559 E.0307
G1 X95.63 Y102.559
G1 X96.764 Y101.424 E.0307
G1 X96.206 Y101.424
G1 X95.072 Y102.559 E.0307
G1 X94.514 Y102.559
G1 X95.649 Y101.424 E.0307
G1 X95.091 Y101.424
G1 X93.956 Y102.559 E.0307
G1 X93.398 Y102.559
G1 X94.533 Y101.424 E.0307
G1 X93.975 Y101.424
G1 X92.84 Y102.559 E.0307
G1 X92.283 Y102.559
G1 X93.417 Y101.424 E.0307
G1 X92.859 Y101.424
G1 X91.725 Y102.559 E.0307
G1 X91.167 Y102.559
G1 X92.302 Y101.424 E.0307
G1 X91.744 Y101.424
G1 X90.609 Y102.559 E.0307
G1 X90.314 Y102.296
G1 X91.186 Y101.424 E.02359
G1 X90.628 Y101.424
G1 X90.104 Y101.948 E.01419
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X90.628 Y101.424 E-.08453
G1 X91.186 Y101.424 E-.06359
G1 X90.69 Y101.919 E-.07987
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.418 I.02 J1.217 P1  F28800
G1 X121.304 Y101.404 Z2.418
G1 Z2.018
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.21205
G1 F15000
G1 X121.524 Y101.501 E.00217
; LINE_WIDTH: 0.22019
G1 X121.509 Y101.556 E.00053
; LINE_WIDTH: 0.188566
G1 X121.495 Y101.61 E.00044
; LINE_WIDTH: 0.156943
G1 X121.381 Y101.755 E.00118
; LINE_WIDTH: 0.201282
G1 X121.267 Y101.901 E.00158
; LINE_WIDTH: 0.245622
G1 X121.153 Y102.046 E.00197
; LINE_WIDTH: 0.289962
G1 X121.039 Y102.191 E.00237
; LINE_WIDTH: 0.334301
G1 X120.887 Y102.385 E.00368
; LINE_WIDTH: 0.365065
G1 X120.735 Y102.578 E.00405
G1 X120.085 Y103.205 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.617 Y104.674 E.03974
G1 X118.059 Y104.674
G1 X119.71 Y103.022 E.04469
G1 X119.153 Y103.022
G1 X118.764 Y103.411 E.01052
M204 S10000
G1 X120.209 Y103.04 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0995613
G1 F15000
G1 X119.728 Y103.04 E.00173
G1 X118.493 Y103.678 F28800
; LINE_WIDTH: 0.372691
G1 F15000
G1 X118.336 Y103.879 E.00429
; LINE_WIDTH: 0.324859
G1 X118.179 Y104.079 E.00369
; LINE_WIDTH: 0.277026
G1 X118.022 Y104.279 E.0031
; LINE_WIDTH: 0.222597
G1 X117.865 Y104.479 E.00243
G1 X117.83 Y104.589 E.0011
G1 X118.044 Y104.694 E.00228
G1 X118.532 Y103.228 F28800
; LINE_WIDTH: 0.476162
G1 F15000
G1 X92.916 Y103.228 E.55993
G1 X92.956 Y104.674 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.462 Y104.168 E.01369
G1 X93.252 Y103.821
G1 X92.399 Y104.674 E.02309
G1 X92.097 Y104.418
G1 X92.817 Y103.698 E.01948
G1 X92.684 Y103.273
G1 X91.886 Y104.071 E.02158
G1 X91.676 Y103.723
G1 X92.376 Y103.022 E.01896
G1 X91.819 Y103.022
G1 X91.465 Y103.376 E.00956
M204 S10000
G1 X96.313 Y109.215 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X93.693 Y104.891 E.09675
G1 X92.591 Y104.891 E.02108
G1 X95.212 Y109.215 E.09675
G1 X96.253 Y109.215 E.01993
G1 X93.427 Y105.362 F28800
; LINE_WIDTH: 0.573298
G1 F15000
G1 X95.446 Y108.692 E.10348
G1 X96.62 Y111.866 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X97.465 Y111.02 E.02461
G3 X99.096 Y115.905 I-16.339 J8.169 E.10638
G1 X99.142 Y117.019 E.02295
G1 X98.186 Y117.975 E.02785
G3 X98.198 Y118.264 I-3.434 J.294 E.00595
G1 X99.238 Y119.304 E.03028
G1 X99.256 Y119.73 E.00879
G1 X99.665 Y119.73 E.00841
G1 X100.799 Y120.865 E.03303
G1 X102.972 Y120.865 E.04475
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 X110.648 Y120.865 E.04475
G1 X111.783 Y119.73 E.03303
G1 X112.191 Y119.73 E.00841
G1 X112.209 Y119.304 E.00879
G1 X113.249 Y118.264 E.03028
G3 X113.262 Y117.975 I3.446 J.005 E.00595
G1 X112.305 Y117.019 E.02785
G3 X113.303 Y112.513 I11.816 J.254 E.09564
G3 X113.982 Y111.02 I17.516 J7.071 E.03377
G1 X114.828 Y111.866 E.02461
G1 X115.134 Y109.215 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X116.236 Y109.215 E.02108
G1 X118.856 Y104.891 E.09675
G1 X117.755 Y104.891 E.02108
G1 X115.165 Y109.164 E.0956
G1 X115.97 Y108.744 F28800
; LINE_WIDTH: 0.5733
G1 F15000
G1 X117.989 Y105.413 E.10348
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X116.952 Y107.124 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.418 I-1.172 J-.327 P1  F28800
G1 X112.104 Y124.494 Z2.418
G1 Z2.018
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.238 Y125.628 E.03303
G1 X113.238 Y125.951 E.00665
G1 X112.104 Y127.085 E.03303
G1 X112.104 Y132.17 E.10468
G1 X113.238 Y133.304 E.03303
G1 X113.238 Y133.627 E.00665
G1 X112.104 Y134.761 E.03303
G1 X112.104 Y139.846 E.10468
G1 X113.238 Y140.98 E.03303
G1 X113.238 Y141.303 E.00665
G1 X112.104 Y142.437 E.03303
G1 X112.104 Y147.522 E.10468
G1 X113.238 Y148.656 E.03303
G1 X113.238 Y148.979 E.00665
G1 X112.104 Y150.113 E.03303
G1 X112.104 Y155.198 E.10468
G1 X113.238 Y156.332 E.03303
G1 X113.238 Y156.655 E.00665
G1 X112.104 Y157.789 E.03303
G1 X112.104 Y162.873 E.10468
G1 X113.238 Y164.008 E.03303
G1 X113.238 Y164.331 E.00665
G1 X112.104 Y165.465 E.03303
G1 X112.104 Y168.811 E.06889
G3 X111.908 Y170.354 I-6.965 J-.101 E.03208
G1 X112.816 Y171.261 E.02643
G3 X109.287 Y175.409 I-7.374 J-2.699 E.11449
G1 X108.442 Y174.564 E.0246
G3 X103.002 Y174.567 I-2.724 J-5.794 E.11568
G1 X102.16 Y175.409 E.0245
G3 X98.63 Y171.263 I3.599 J-6.641 E.11469
G1 X99.541 Y170.352 E.02652
G3 X99.344 Y168.815 I6.556 J-1.623 E.03199
G1 X99.344 Y165.465 E.06896
G1 X98.209 Y164.331 E.03303
G1 X98.209 Y164.008 E.00665
G1 X99.344 Y162.873 E.03303
G1 X99.344 Y157.789 E.10468
G1 X98.209 Y156.655 E.03303
G1 X98.209 Y156.332 E.00665
G1 X99.344 Y155.198 E.03303
G1 X99.344 Y150.113 E.10468
G1 X98.209 Y148.979 E.03303
G1 X98.209 Y148.656 E.00665
G1 X99.344 Y147.522 E.03303
G1 X99.344 Y142.437 E.10468
G1 X98.209 Y141.303 E.03303
G1 X98.209 Y140.98 E.00665
G1 X99.344 Y139.846 E.03303
G1 X99.344 Y134.761 E.10468
G1 X98.209 Y133.627 E.03303
G1 X98.209 Y133.304 E.00665
G1 X99.344 Y132.17 E.03303
G1 X99.344 Y127.085 E.10468
G1 X98.209 Y125.951 E.03303
G1 X98.209 Y125.628 E.00665
G1 X99.344 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 2.13656
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.209 Y125.628 E-.18287
G1 X98.209 Y125.951 E-.03684
G1 X98.261 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z2.418 I.409 J1.146 P1  F28800
G1 X111.79 Y121.178 Z2.418
G1 Z2.137
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.008 E.39208
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P76 R3
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.004 E.33993
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.537 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z2.537
G1 Z2.137
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.324 J2.998 E.1345
G1 X118.127 Y103.487 E.15159
G1 X120.186 Y103.487 E.0424
G1 X115.81 Y110.708 E.17384
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J.005 E.50652
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X91.262 Y103.487 E.17384
G1 X93.321 Y103.487 E.0424
G1 X97.137 Y109.784 E.15159
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.744 J3.051 E.12828
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.537 I1.013 J.675 P1  F28800
G1 X121.624 Y101.904 Z2.537
G1 Z2.137
G1 E.8 F1800
G1 F12000
G1 X120.98 Y102.967 E.02379
G1 X116.162 Y110.916 E.17785
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J0 E.49516
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X89.823 Y101.904 E.20165
G1 X121.564 Y101.904 E.60734
G1 X121.344 Y102.189 F28800
G1 X120.923 Y102.643
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X120.4 Y102.121 E.01414
G1 X119.842 Y102.121
G1 X120.712 Y102.99 E.02353
G1 X120.419 Y103.255
G1 X119.284 Y102.121 E.0307
G1 X118.727 Y102.121
G1 X119.861 Y103.255 E.0307
G1 X119.303 Y103.255
G1 X118.169 Y102.121 E.0307
G1 X117.611 Y102.121
G1 X118.746 Y103.255 E.0307
G1 X118.188 Y103.255
G1 X117.053 Y102.121 E.0307
G1 X116.495 Y102.121
G1 X117.63 Y103.255 E.0307
G1 X117.072 Y103.255
G1 X115.937 Y102.121 E.0307
G1 X115.38 Y102.121
G1 X116.514 Y103.255 E.0307
G1 X115.956 Y103.255
G1 X114.822 Y102.121 E.0307
G1 X114.264 Y102.121
G1 X115.399 Y103.255 E.0307
G1 X114.841 Y103.255
G1 X113.706 Y102.121 E.0307
G1 X113.148 Y102.121
G1 X114.283 Y103.255 E.0307
G1 X113.725 Y103.255
G1 X112.59 Y102.121 E.0307
G1 X112.033 Y102.121
G1 X113.167 Y103.255 E.0307
G1 X112.609 Y103.255
G1 X111.475 Y102.121 E.0307
G1 X110.917 Y102.121
G1 X112.052 Y103.255 E.0307
G1 X111.494 Y103.255
G1 X110.359 Y102.121 E.0307
G1 X109.801 Y102.121
G1 X110.936 Y103.255 E.0307
G1 X110.378 Y103.255
G1 X109.243 Y102.121 E.0307
G1 X108.686 Y102.121
G1 X109.82 Y103.255 E.0307
G1 X109.262 Y103.255
G1 X108.128 Y102.121 E.0307
G1 X107.57 Y102.121
G1 X108.705 Y103.255 E.0307
G1 X108.147 Y103.255
G1 X107.012 Y102.121 E.0307
G1 X106.454 Y102.121
G1 X107.589 Y103.255 E.0307
G1 X107.031 Y103.255
G1 X105.896 Y102.121 E.0307
G1 X105.339 Y102.121
G1 X106.473 Y103.255 E.0307
G1 X105.915 Y103.255
G1 X104.781 Y102.121 E.0307
G1 X104.223 Y102.121
G1 X105.358 Y103.255 E.0307
G1 X104.8 Y103.255
G1 X103.665 Y102.121 E.0307
G1 X103.107 Y102.121
G1 X104.242 Y103.255 E.0307
G1 X103.684 Y103.255
G1 X102.549 Y102.121 E.0307
G1 X101.992 Y102.121
G1 X103.126 Y103.255 E.0307
G1 X102.568 Y103.255
G1 X101.434 Y102.121 E.0307
G1 X100.876 Y102.121
G1 X102.011 Y103.255 E.0307
G1 X101.453 Y103.255
G1 X100.318 Y102.121 E.0307
G1 X99.76 Y102.121
G1 X100.895 Y103.255 E.0307
G1 X100.337 Y103.255
G1 X99.202 Y102.121 E.0307
G1 X98.645 Y102.121
G1 X99.779 Y103.255 E.0307
G1 X99.221 Y103.255
G1 X98.087 Y102.121 E.0307
G1 X97.529 Y102.121
G1 X98.664 Y103.255 E.0307
G1 X98.106 Y103.255
G1 X96.971 Y102.121 E.0307
G1 X96.413 Y102.121
G1 X97.548 Y103.255 E.0307
G1 X96.99 Y103.255
G1 X95.855 Y102.121 E.0307
G1 X95.298 Y102.121
G1 X96.432 Y103.255 E.0307
G1 X95.874 Y103.255
G1 X94.74 Y102.121 E.0307
G1 X94.182 Y102.121
G1 X95.317 Y103.255 E.0307
G1 X94.759 Y103.255
G1 X93.624 Y102.121 E.0307
G1 X93.066 Y102.121
G1 X94.201 Y103.255 E.0307
G1 X93.643 Y103.255
G1 X92.508 Y102.121 E.0307
G1 X91.951 Y102.121
G1 X93.085 Y103.255 E.0307
G1 X92.527 Y103.255
G1 X91.393 Y102.121 E.0307
G1 X90.835 Y102.121
G1 X91.969 Y103.255 E.0307
G1 X91.412 Y103.255
G1 X90.277 Y102.121 E.0307
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X91.412 Y103.255 E-.18293
G1 X91.807 Y103.255 E-.04507
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.537 I-.03 J-1.217 P1  F28800
G1 X91.006 Y103.275 Z2.537
G1 Z2.137
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.205384
G1 F15000
G1 X90.864 Y103.094 E.00201
; LINE_WIDTH: 0.161218
G1 X90.722 Y102.913 E.00151
; LINE_WIDTH: 0.117051
G1 X90.58 Y102.732 E.00102
G1 X93.614 Y103.576 F28800
; LINE_WIDTH: 0.613388
G1 F15000
G1 X117.833 Y103.576 E.6906
G1 X119.561 Y104.071 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.21 Y103.719 E.00951
G1 X118.652 Y103.719
G1 X119.351 Y104.418 E.01891
G1 X119.14 Y104.765
G1 X118.196 Y103.821 E.02556
G1 X117.985 Y104.168
G1 X118.93 Y105.113 E.02556
G1 X118.63 Y105.371
G1 X117.775 Y104.515 E.02314
G1 X117.564 Y104.863
G1 X118.072 Y105.371 E.01374
M204 S10000
G1 X114.715 Y109.912 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X115.814 Y109.912 E.02102
G1 X118.434 Y105.587 E.09675
G1 X117.332 Y105.587 E.02108
G1 X114.746 Y109.86 E.09557
G1 X115.549 Y109.441 F28800
; LINE_WIDTH: 0.571182
G1 F15000
G1 X117.567 Y106.11 E.1031
G1 X114.828 Y111.866 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.982 Y111.02 E.02461
G2 X113.303 Y112.513 I16.837 J8.563 E.03377
G2 X112.305 Y117.019 I10.818 J4.76 E.09564
G1 X113.262 Y117.975 E.02785
G2 X113.249 Y118.264 I3.433 J.294 E.00595
G1 X112.209 Y119.304 E.03028
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.198 Y118.264 E.03028
G2 X98.186 Y117.975 I-3.447 J.005 E.00595
G1 X99.142 Y117.019 E.02785
G1 X99.096 Y115.905 E.02295
G2 X97.465 Y111.02 I-17.969 J3.284 E.10638
G1 X96.62 Y111.866 E.02461
G1 X96.733 Y109.912 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X94.115 Y105.587 E.09672
G1 X93.013 Y105.587 E.02108
G1 X95.634 Y109.912 E.09675
G1 X96.673 Y109.912 E.01988
G1 X93.849 Y106.058 F28800
; LINE_WIDTH: 0.573116
G1 F15000
G1 X95.868 Y109.39 E.10346
G1 X94.085 Y105.371 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X92.433 Y103.719 E.04469
G1 X91.876 Y103.719
G1 X93.527 Y105.371 E.04469
G1 X92.969 Y105.371
G1 X92.22 Y104.622 E.02026
M204 S10000
M73 P77 R3
G1 X93.877 Y104.854 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.072885
G1 F15000
G1 X93.726 Y104.662 E.00056
; LINE_WIDTH: 0.121941
G1 X93.575 Y104.469 E.00114
; LINE_WIDTH: 0.170996
G1 X93.424 Y104.277 E.00173
; LINE_WIDTH: 0.220052
G1 X93.273 Y104.084 E.00231
; LINE_WIDTH: 0.269107
G1 X93.122 Y103.892 E.00289
; LINE_WIDTH: 0.318162
G1 X92.971 Y103.699 E.00347
G1 X92.284 Y104.558 F28800
; LINE_WIDTH: 0.216785
G1 F15000
G1 X92.136 Y104.369 E.00223
; LINE_WIDTH: 0.168818
G1 X91.988 Y104.181 E.00167
; LINE_WIDTH: 0.120852
G1 X91.84 Y103.992 E.00111
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X91.988 Y104.181 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.537 I-1.144 J.414 P1  F28800
G1 X99.344 Y124.494 Z2.537
G1 Z2.137
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03199
G1 X98.632 Y171.261 E.02647
G2 X102.162 Y175.407 I7.352 J-2.685 E.11451
G1 X103.002 Y174.567 E.02445
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.285 Y175.407 E.02455
G2 X112.817 Y171.263 I-3.582 J-6.631 E.1147
G1 X111.908 Y170.354 E.02648
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 2.25562
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.238 Y125.628 E-.18287
G1 X113.238 Y125.951 E-.03684
G1 X113.187 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z2.537 I1.169 J-.338 P1  F28800
G1 X111.79 Y121.178 Z2.537
G1 Z2.256
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.008 E.39208
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.004 E.33993
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.656 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z2.656
G1 Z2.256
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.324 J2.998 E.1345
G1 X117.704 Y104.184 E.13482
G1 X119.764 Y104.184 E.0424
G1 X115.81 Y110.708 E.15706
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J.005 E.50652
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X91.684 Y104.184 E.15706
G1 X93.743 Y104.184 E.0424
G1 X97.137 Y109.784 E.13482
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.744 J3.051 E.12828
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.656 I1.011 J.677 P1  F28800
G1 X121.202 Y102.6 Z2.656
G1 Z2.256
G1 E.8 F1800
G1 F12000
G1 X120.62 Y103.561 E.02148
G1 X116.162 Y110.916 E.16457
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J0 E.49516
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X90.245 Y102.6 E.18606
G1 X121.142 Y102.6 E.59118
G1 X120.92 Y102.884 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X120.62 Y103.561 E-.12459
G1 X120.15 Y104.336 E-.10341
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.656 I.521 J-1.1 P1  F28800
G1 X119.339 Y103.952 Z2.656
G1 Z2.256
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X120.474 Y102.817 E.0307
G1 X119.916 Y102.817
G1 X118.781 Y103.952 E.0307
G1 X118.223 Y103.952
G1 X119.358 Y102.817 E.0307
G1 X118.8 Y102.817
G1 X117.665 Y103.952 E.0307
G1 X117.201 Y103.858
G1 X118.242 Y102.817 E.02816
G1 X117.684 Y102.817
G1 X116.644 Y103.858 E.02816
G1 X116.086 Y103.858
G1 X117.127 Y102.817 E.02816
G1 X116.569 Y102.817
G1 X115.528 Y103.858 E.02816
G1 X114.97 Y103.858
G1 X116.011 Y102.817 E.02816
G1 X115.453 Y102.817
G1 X114.412 Y103.858 E.02816
G1 X113.854 Y103.858
G1 X114.895 Y102.817 E.02816
G1 X114.337 Y102.817
G1 X113.296 Y103.858 E.02816
G1 X112.739 Y103.858
G1 X113.779 Y102.817 E.02816
G1 X113.222 Y102.817
G1 X112.181 Y103.858 E.02816
G1 X111.623 Y103.858
G1 X112.664 Y102.817 E.02816
G1 X112.106 Y102.817
G1 X111.065 Y103.858 E.02816
G1 X110.507 Y103.858
G1 X111.548 Y102.817 E.02816
G1 X110.99 Y102.817
G1 X109.949 Y103.858 E.02816
G1 X109.392 Y103.858
G1 X110.432 Y102.817 E.02816
G1 X109.875 Y102.817
G1 X108.834 Y103.858 E.02816
G1 X108.276 Y103.858
G1 X109.317 Y102.817 E.02816
G1 X108.759 Y102.817
G1 X107.718 Y103.858 E.02816
G1 X107.16 Y103.858
G1 X108.201 Y102.817 E.02816
G1 X107.643 Y102.817
G1 X106.602 Y103.858 E.02816
G1 X106.045 Y103.858
G1 X107.085 Y102.817 E.02816
G1 X106.528 Y102.817
G1 X105.487 Y103.858 E.02816
G1 X104.929 Y103.858
G1 X105.97 Y102.817 E.02816
G1 X105.412 Y102.817
G1 X104.371 Y103.858 E.02816
G1 X103.813 Y103.858
G1 X104.854 Y102.817 E.02816
G1 X104.296 Y102.817
G1 X103.255 Y103.858 E.02816
G1 X102.698 Y103.858
G1 X103.738 Y102.817 E.02816
G1 X103.181 Y102.817
G1 X102.14 Y103.858 E.02816
G1 X101.582 Y103.858
G1 X102.623 Y102.817 E.02816
G1 X102.065 Y102.817
G1 X101.024 Y103.858 E.02816
G1 X100.466 Y103.858
G1 X101.507 Y102.817 E.02816
G1 X100.949 Y102.817
G1 X99.908 Y103.858 E.02816
G1 X99.351 Y103.858
G1 X100.391 Y102.817 E.02816
G1 X99.834 Y102.817
G1 X98.793 Y103.858 E.02816
G1 X98.235 Y103.858
G1 X99.276 Y102.817 E.02816
G1 X98.718 Y102.817
G1 X97.677 Y103.858 E.02816
G1 X97.119 Y103.858
G1 X98.16 Y102.817 E.02816
G1 X97.602 Y102.817
G1 X96.561 Y103.858 E.02816
G1 X96.004 Y103.858
G1 X97.044 Y102.817 E.02816
G1 X96.487 Y102.817
G1 X95.446 Y103.858 E.02816
G1 X94.888 Y103.858
G1 X95.929 Y102.817 E.02816
G1 X95.371 Y102.817
G1 X94.33 Y103.858 E.02816
G1 X93.772 Y103.858
G1 X94.813 Y102.817 E.02816
G1 X94.255 Y102.817
G1 X93.121 Y103.952 E.0307
G1 X92.563 Y103.952
G1 X93.697 Y102.817 E.0307
G1 X93.14 Y102.817
G1 X92.005 Y103.952 E.0307
G1 X91.447 Y103.952
G1 X92.582 Y102.817 E.0307
G1 X92.024 Y102.817
G1 X91.156 Y103.685 E.02348
G1 X90.946 Y103.338
G1 X91.466 Y102.817 E.01408
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X90.946 Y103.338 E-.08388
G1 X91.156 Y103.685 E-.0463
G1 X91.763 Y103.078 E-.09781
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.656 I.012 J1.217 P1  F28800
G1 X120.461 Y102.798 Z2.656
G1 Z2.256
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.212052
G1 F15000
G1 X120.683 Y102.893 E.00219
; LINE_WIDTH: 0.215683
G1 X120.67 Y102.946 E.00051
; LINE_WIDTH: 0.182433
M73 P78 R3
G1 X120.657 Y103 E.00042
; LINE_WIDTH: 0.149181
G1 X120.554 Y103.132 E.001
; LINE_WIDTH: 0.189301
G1 X120.45 Y103.264 E.00133
; LINE_WIDTH: 0.22942
G1 X120.347 Y103.395 E.00165
; LINE_WIDTH: 0.269538
G1 X120.196 Y103.587 E.00289
; LINE_WIDTH: 0.309632
G1 X120.046 Y103.779 E.00337
; LINE_WIDTH: 0.349727
G1 X119.895 Y103.972 E.00384
G1 X91.379 Y103.972 F28800
; LINE_WIDTH: 0.125564
G1 F15000
G2 X91.196 Y103.788 I-.47 J.287 E.00127
G1 X93.794 Y106.067 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X94.304 Y105.557 E.0138
G1 X94.094 Y105.21
G1 X93.237 Y106.067 E.02319
G1 X92.939 Y105.807
G1 X93.883 Y104.863 E.02556
G1 X93.673 Y104.515
G1 X92.728 Y105.46 E.02556
G1 X92.518 Y105.113
G1 X93.214 Y104.416 E.01885
G1 X92.657 Y104.416
G1 X92.307 Y104.765 E.00945
M204 S10000
G1 X97.14 Y110.608 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X96.784 Y109.992 E.01361
G1 X94.537 Y106.284 E.08296
G1 X93.435 Y106.284 E.02109
G1 X96.05 Y110.608 E.09669
G1 X97.08 Y110.608 E.01971
G1 X94.272 Y106.756 F28800
; LINE_WIDTH: 0.574372
G1 F15000
G1 X96.286 Y110.083 E.10356
G1 X96.62 Y111.866 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X97.465 Y111.02 E.02461
G3 X99.096 Y115.905 I-16.339 J8.169 E.10638
G1 X99.142 Y117.019 E.02295
G1 X98.186 Y117.975 E.02785
G3 X98.198 Y118.264 I-3.434 J.294 E.00595
G1 X99.238 Y119.304 E.03028
G1 X99.256 Y119.73 E.00879
G1 X99.665 Y119.73 E.00841
G1 X100.799 Y120.865 E.03303
G1 X102.972 Y120.865 E.04475
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 X110.648 Y120.865 E.04475
G1 X111.783 Y119.73 E.03303
G1 X112.191 Y119.73 E.00841
G1 X112.209 Y119.304 E.00879
G1 X113.249 Y118.264 E.03028
G3 X113.262 Y117.975 I3.446 J.005 E.00595
G1 X112.305 Y117.019 E.02785
G3 X113.303 Y112.513 I11.816 J.254 E.09564
G3 X113.982 Y111.02 I17.516 J7.071 E.03377
G1 X114.828 Y111.866 E.02461
G1 X114.315 Y110.608 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X115.397 Y110.608 E.02071
G1 X118.012 Y106.284 E.09669
G1 X116.91 Y106.284 E.02109
G1 X114.663 Y109.991 E.08295
G1 X114.344 Y110.556 E.01241
G1 X115.13 Y110.135 F28800
; LINE_WIDTH: 0.577946
G1 F15000
G1 X117.145 Y106.807 E.10424
G1 X117.781 Y106.067 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.227 Y104.621 E.03912
G1 X118.875 Y104.416
G1 X117.224 Y106.067 E.04469
G1 X117.093 Y105.64
G1 X118.317 Y104.416 E.03312
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X117.093 Y105.64 E-.19733
G1 X117.172 Y105.897 E-.03067
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.656 I-1.174 J-.32 P1  F28800
G1 X112.104 Y124.494 Z2.656
G1 Z2.256
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.238 Y125.628 E.03303
G1 X113.238 Y125.951 E.00665
G1 X112.104 Y127.085 E.03303
G1 X112.104 Y132.17 E.10468
G1 X113.238 Y133.304 E.03303
G1 X113.238 Y133.627 E.00665
G1 X112.104 Y134.761 E.03303
G1 X112.104 Y139.846 E.10468
G1 X113.238 Y140.98 E.03303
G1 X113.238 Y141.303 E.00665
G1 X112.104 Y142.437 E.03303
G1 X112.104 Y147.522 E.10468
G1 X113.238 Y148.656 E.03303
G1 X113.238 Y148.979 E.00665
G1 X112.104 Y150.113 E.03303
G1 X112.104 Y155.198 E.10468
G1 X113.238 Y156.332 E.03303
G1 X113.238 Y156.655 E.00665
G1 X112.104 Y157.789 E.03303
G1 X112.104 Y162.873 E.10468
G1 X113.238 Y164.008 E.03303
G1 X113.238 Y164.331 E.00665
G1 X112.104 Y165.465 E.03303
G1 X112.104 Y168.811 E.06889
G3 X111.908 Y170.354 I-6.965 J-.101 E.03208
G1 X112.817 Y171.263 E.02648
G3 X109.285 Y175.407 I-7.114 J-2.487 E.1147
G1 X108.442 Y174.564 E.02455
G3 X103.002 Y174.567 I-2.724 J-5.795 E.11568
G1 X102.162 Y175.407 E.02445
G3 X98.632 Y171.261 I3.821 J-6.83 E.11451
G1 X99.541 Y170.352 E.02647
G3 X99.344 Y168.815 I6.556 J-1.623 E.03199
G1 X99.344 Y165.465 E.06896
G1 X98.209 Y164.331 E.03303
G1 X98.209 Y164.008 E.00665
G1 X99.344 Y162.873 E.03303
G1 X99.344 Y157.789 E.10468
G1 X98.209 Y156.655 E.03303
G1 X98.209 Y156.332 E.00665
G1 X99.344 Y155.198 E.03303
G1 X99.344 Y150.113 E.10468
G1 X98.209 Y148.979 E.03303
G1 X98.209 Y148.656 E.00665
G1 X99.344 Y147.522 E.03303
G1 X99.344 Y142.437 E.10468
G1 X98.209 Y141.303 E.03303
G1 X98.209 Y140.98 E.00665
G1 X99.344 Y139.846 E.03303
G1 X99.344 Y134.761 E.10468
G1 X98.209 Y133.627 E.03303
G1 X98.209 Y133.304 E.00665
G1 X99.344 Y132.17 E.03303
G1 X99.344 Y127.085 E.10468
G1 X98.209 Y125.951 E.03303
G1 X98.209 Y125.628 E.00665
G1 X99.344 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 2.37467
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.209 Y125.628 E-.18287
G1 X98.209 Y125.951 E-.03684
G1 X98.261 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z2.656 I.409 J1.146 P1  F28800
G1 X111.79 Y121.178 Z2.656
G1 Z2.375
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.775 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z2.775
G1 Z2.375
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.324 J2.998 E.1345
G1 X117.282 Y104.881 E.11805
G1 X119.341 Y104.881 E.0424
G1 X115.81 Y110.708 E.14029
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J.005 E.50652
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X92.106 Y104.881 E.14029
G1 X94.165 Y104.881 E.0424
G1 X97.137 Y109.784 E.11805
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.744 J3.051 E.12828
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.775 I1.01 J.679 P1  F28800
G1 X120.78 Y103.297 Z2.775
G1 Z2.375
G1 E.8 F1800
G1 F12000
G1 X120.26 Y104.154 E.01917
G1 X116.162 Y110.916 E.1513
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.921 Y171.432 I-8.236 J.001 E.44379
G1 X97.921 Y171.432 E0
G3 X97.486 Y168.795 I8.346 J-2.73 E.05133
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X90.667 Y103.297 E.17047
G1 X120.72 Y103.297 E.57503
G1 X120.496 Y103.578 F28800
G1 X120.081 Y104.032
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X119.562 Y103.514 E.01403
G1 X119.004 Y103.514
G1 X119.87 Y104.38 E.02343
G1 X119.581 Y104.649
G1 X118.446 Y103.514 E.0307
G1 X117.889 Y103.514
G1 X119.023 Y104.649 E.0307
G1 X118.465 Y104.649
G1 X117.676 Y103.859 E.02136
G1 X117.466 Y104.206
G1 X117.908 Y104.649 E.01196
M204 S10000
G1 X118.719 Y105.46 F28800
M204 S2000
G1 F12000
G1 X118.372 Y105.112 E.0094
G1 X117.814 Y105.112
G1 X118.509 Y105.807 E.0188
G1 X118.298 Y106.155
G1 X117.354 Y105.21 E.02556
G1 X117.143 Y105.557
G1 X118.087 Y106.502 E.02556
G1 X117.792 Y106.764
G1 X116.933 Y105.905 E.02325
G1 X116.722 Y106.252
G1 X117.234 Y106.764 E.01385
M204 S10000
G1 X113.953 Y111.305 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X115.005 Y111.305 E.02013
G3 X115.471 Y110.476 I13.409 J7.006 E.0182
G1 X117.59 Y106.981 E.07821
G1 X116.488 Y106.981 E.02108
G1 X114.663 Y109.992 E.06738
G2 X113.98 Y111.251 I11.325 J6.96 E.02742
G1 X114.72 Y110.834 F28800
; LINE_WIDTH: 0.573187
G1 F15000
G3 X115.068 Y110.232 I35.256 J19.99 E.01847
G1 X116.722 Y107.503 E.08477
G1 X114.828 Y111.866 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X114.668 Y111.706 E.00466
G1 X113.65 Y111.706 E.02095
G2 X113.303 Y112.513 I9.446 J4.537 E.01809
G2 X112.305 Y117.019 I10.818 J4.76 E.09564
G1 X113.262 Y117.975 E.02785
G2 X113.249 Y118.264 I3.433 J.294 E.00595
G1 X112.209 Y119.304 E.03028
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.198 Y118.264 E.03028
G2 X98.186 Y117.975 I-3.447 J.005 E.00595
G1 X99.142 Y117.019 E.02785
G1 X99.096 Y115.905 E.02295
G2 X97.797 Y111.706 I-17.036 J2.967 E.09075
G1 X96.78 Y111.706 E.02095
G1 X96.62 Y111.866 E.00466
G1 X97.502 Y111.305 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G2 X96.782 Y109.988 I-21.355 J10.827 E.02873
G1 X94.959 Y106.981 E.06728
G1 X93.858 Y106.981 E.02108
G1 X95.989 Y110.497 E.07868
G1 X96.439 Y111.305 E.01769
M73 P79 R3
G1 X97.442 Y111.305 E.01919
G1 X94.694 Y107.452 F28800
; LINE_WIDTH: 0.573298
G1 F15000
G1 X96.379 Y110.232 E.08638
G1 X96.689 Y110.777 E.01666
G1 X94.92 Y106.764 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.269 Y105.112 E.04469
G1 X92.711 Y105.112
G1 X94.362 Y106.764 E.04469
G1 X93.805 Y106.764
G1 X93.079 Y106.038 E.01965
M204 S10000
G1 X94.735 Y106.27 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.072885
G1 F15000
G1 X94.603 Y106.102 E.00049
; LINE_WIDTH: 0.11579
G1 X94.471 Y105.934 E.00094
; LINE_WIDTH: 0.158696
G1 X94.339 Y105.765 E.00138
; LINE_WIDTH: 0.201601
G1 X94.207 Y105.597 E.00183
; LINE_WIDTH: 0.244507
G1 X94.075 Y105.429 E.00227
; LINE_WIDTH: 0.287412
G1 X93.943 Y105.261 E.00272
; LINE_WIDTH: 0.330318
G1 X93.811 Y105.093 E.00316
G1 X93.142 Y105.974 F28800
; LINE_WIDTH: 0.216784
G1 F15000
G1 X92.994 Y105.785 E.00223
; LINE_WIDTH: 0.168818
G1 X92.846 Y105.597 E.00167
; LINE_WIDTH: 0.120851
G1 X92.698 Y105.408 E.00111
G1 X93.921 Y104.649 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X92.786 Y103.514 E.0307
G1 X92.228 Y103.514
G1 X93.363 Y104.649 E.0307
G1 X92.805 Y104.649
G1 X91.67 Y103.514 E.0307
G1 X91.113 Y103.514
G1 X92.247 Y104.649 E.0307
M204 S10000
G1 X94.111 Y104.668 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.20878
G1 F15000
G1 X94.123 Y104.572 E.00086
; LINE_WIDTH: 0.202581
G1 X94.111 Y104.521 E.00045
; LINE_WIDTH: 0.169667
G1 X94.099 Y104.47 E.00037
; LINE_WIDTH: 0.136752
G1 X93.946 Y104.275 E.00134
; LINE_WIDTH: 0.185441
G1 X93.793 Y104.08 E.00192
; LINE_WIDTH: 0.23413
G1 X93.64 Y103.884 E.00251
; LINE_WIDTH: 0.282819
G1 X93.487 Y103.689 E.00309
; LINE_WIDTH: 0.331508
G1 X93.334 Y103.494 E.00368
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.487 Y103.689 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.775 I-.623 J-1.045 P1  F28800
G1 X91.846 Y104.668 Z2.775
G1 Z2.375
G1 E.8 F1800
; LINE_WIDTH: 0.199378
G1 F15000
G1 X91.71 Y104.495 E.00186
; LINE_WIDTH: 0.157213
G1 X91.574 Y104.321 E.00141
; LINE_WIDTH: 0.115049
G1 X91.438 Y104.148 E.00096
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X91.574 Y104.321 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.775 I-1.136 J.437 P1  F28800
G1 X99.344 Y124.494 Z2.775
G1 Z2.375
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03199
G1 X98.63 Y171.264 E.02654
G2 X102.16 Y175.409 I7.235 J-2.587 E.1146
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.285 Y175.407 E.02455
G2 X112.817 Y171.263 I-3.582 J-6.631 E.1147
G1 X111.908 Y170.354 E.02648
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 2.49373
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.238 Y125.628 E-.18287
G1 X113.238 Y125.951 E-.03684
G1 X113.187 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z2.775 I1.169 J-.338 P1  F28800
G1 X111.79 Y121.178 Z2.775
G1 Z2.494
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.894 I1.046 J.621 P1  F28800
G1 X118.919 Y105.577 Z2.894
G1 Z2.494
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X115.81 Y110.708 E.12352
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X92.528 Y105.577 E.12352
G1 X94.029 Y105.577 E.0309
G1 X94.056 Y105.622 E.00108
G1 X94.615 Y105.622 E.01149
G1 X97.137 Y109.784 E.1002
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.891 Y119.417 E.25395
G1 X112.04 Y115.869 E.07312
G3 X114.31 Y109.784 I17.324 J2.998 E.1345
G1 X116.833 Y105.622 E.1002
G1 X117.391 Y105.622 E.01149
G1 X117.418 Y105.577 E.00108
G1 X118.859 Y105.577 E.02967
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X117.837 Y107.296 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.894 I-1.07 J-.579 P1  F28800
G1 X111.498 Y119.008 Z2.894
G1 Z2.494
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.744 J3.051 E.12828
G1 X117.292 Y104.075 E.12306
G1 X94.156 Y104.075 E.44268
G1 X97.489 Y109.575 E.12306
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.894 I1.008 J.681 P1  F28800
G1 X120.358 Y103.994 Z2.894
G1 Z2.494
G1 E.8 F1800
G1 F12000
G1 X119.901 Y104.747 E.01687
G1 X116.162 Y110.916 E.13802
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X91.09 Y103.994 E.15488
G1 X120.298 Y103.994 E.55887
G1 X120.072 Y104.273 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X119.901 Y104.747 E-.09711
G1 X119.306 Y105.729 E-.13089
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.894 I.525 J-1.098 P1  F28800
G1 X118.503 Y105.345 Z2.894
G1 Z2.494
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X119.638 Y104.211 E.0307
G1 X119.08 Y104.211
G1 X117.946 Y105.345 E.0307
G1 X117.388 Y105.345
G1 X118.522 Y104.211 E.0307
G1 X117.965 Y104.211
G1 X116.785 Y105.39 E.03191
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X117.965 Y104.211 E-.19014
G1 X118.297 Y104.211 E-.03786
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.894 I.016 J1.217 P1  F28800
G1 X119.831 Y104.191 Z2.894
G1 Z2.494
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.211348
G1 F15000
G1 X119.843 Y104.285 E.00085
; LINE_WIDTH: 0.210019
G1 X119.831 Y104.338 E.00049
; LINE_WIDTH: 0.147289
G1 X119.818 Y104.391 E.00032
G1 X119.656 Y104.599 E.00156
; LINE_WIDTH: 0.204777
G1 X119.505 Y104.79 E.00212
; LINE_WIDTH: 0.249536
G1 X119.355 Y104.982 E.00265
; LINE_WIDTH: 0.294295
G1 X119.205 Y105.173 E.00317
; LINE_WIDTH: 0.339055
G1 X119.055 Y105.365 E.0037
G1 X116.946 Y107.461 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.369 Y106.037 E.03851
G1 X118.039 Y105.809
G1 X116.388 Y107.461 E.04469
G1 X116.235 Y107.056
G1 X117.437 Y105.854 E.03252
M204 S10000
G1 X117.054 Y105.834 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.176949
G1 F15000
G1 X116.94 Y105.979 E.00136
; LINE_WIDTH: 0.142261
G1 X116.827 Y106.125 E.00104
; LINE_WIDTH: 0.107573
G1 X116.713 Y106.27 E.00073
G1 X113.629 Y112.002 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X114.658 Y112.002 E.01967
G3 X115.471 Y110.476 I17.548 J8.38 E.03309
G1 X117.167 Y107.678 E.06262
G1 X116.066 Y107.678 E.02108
G2 X114.301 Y110.618 I69.191 J43.516 E.06562
G2 X113.654 Y111.947 I11.637 J6.488 E.0283
G1 X114.359 Y111.531 F28800
; LINE_WIDTH: 0.572787
G1 F15000
G3 X115.068 Y110.232 I20.033 J10.087 E.0393
G1 X116.3 Y108.2 E.06308
G1 X112.305 Y117.019 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.262 Y117.975 E.02785
G2 X113.249 Y118.264 I3.433 J.294 E.00595
G1 X112.209 Y119.304 E.03028
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.198 Y118.264 E.03028
G2 X98.186 Y117.975 I-3.447 J.005 E.00595
G1 X99.142 Y117.019 E.02785
G1 X97.825 Y112.002 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G2 X96.782 Y109.988 I-15.653 J6.831 E.04342
G1 X95.382 Y107.678 E.05169
G1 X94.28 Y107.678 E.02108
G1 X95.989 Y110.497 E.06309
G3 X96.786 Y112.002 I-18.672 J10.863 E.03259
G1 X97.765 Y112.002 E.01872
G1 X95.116 Y108.149 F28800
; LINE_WIDTH: 0.573214
G1 F15000
G3 X96.726 Y110.832 I-64.695 J40.633 E.08315
G3 X97.054 Y111.472 I-14.252 J7.714 E.01909
G1 X94.632 Y107.461 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X95.146 Y106.947 E.0139
G1 X94.936 Y106.599
G1 X94.075 Y107.461 E.0233
G1 X93.781 Y107.196
G1 X94.725 Y106.252 E.02556
G1 X94.515 Y105.905
G1 X93.57 Y106.849 E.02556
G1 X93.36 Y106.502
G1 X94.008 Y105.854 E.01753
G1 X93.495 Y105.809
G1 X93.149 Y106.154 E.00935
M204 S10000
G1 X93.959 Y105.345 F28800
M204 S2000
G1 F12000
G1 X94.403 Y104.901 E.01202
G1 X94.192 Y104.554
G1 X93.401 Y105.345 E.02142
G1 X92.843 Y105.345
G1 X93.978 Y104.211 E.0307
G1 X93.42 Y104.211
G1 X92.285 Y105.345 E.0307
G1 X91.998 Y105.074
G1 X92.862 Y104.211 E.02337
G1 X92.304 Y104.211
G1 X91.788 Y104.727 E.01397
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X92.304 Y104.211 E-.08324
G1 X92.862 Y104.211 E-.06359
G1 X92.358 Y104.714 E-.08117
; WIPE_END
G1 E-.012 F1800
G17
G3 Z2.894 I-1.148 J.405 P1  F28800
G1 X99.344 Y124.494 Z2.894
G1 Z2.494
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
M73 P80 R3
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03199
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.13 J-2.496 E.11469
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.287 Y175.409 E.0246
G2 X112.816 Y171.261 I-3.845 J-6.847 E.11449
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 2.61279
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.238 Y125.628 E-.18287
G1 X113.238 Y125.951 E-.03684
G1 X113.187 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z2.894 I1.169 J-.338 P1  F28800
G1 X111.79 Y121.178 Z2.894
G1 Z2.613
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.013 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z3.013
G1 Z2.613
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.324 J2.998 E.1345
G1 X116.438 Y106.274 E.0845
G1 X118.497 Y106.274 E.0424
G1 X115.81 Y110.708 E.10674
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J.005 E.50652
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X92.95 Y106.274 E.10674
G1 X95.01 Y106.274 E.0424
G1 X97.137 Y109.784 E.0845
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.744 J3.051 E.12828
G1 X116.919 Y104.69 E.10929
G1 X119.935 Y104.69 E.05772
G1 X119.541 Y105.341 E.01456
G1 X116.162 Y110.916 E.12474
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.927 Y171.448 I-8.236 J.001 E.44345
G1 X97.927 Y171.448 E0
G3 X97.486 Y168.795 I8.333 J-2.746 E.05166
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X91.512 Y104.69 E.1393
G1 X94.529 Y104.69 E.05772
G1 X97.489 Y109.575 E.10929
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.013 I-.013 J1.217 P1  F28800
G1 X112.305 Y117.019 Z3.013
G1 Z2.613
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.262 Y117.975 E.02785
G2 X113.249 Y118.264 I3.433 J.294 E.00595
G1 X112.209 Y119.304 E.03028
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.198 Y118.264 E.03028
G2 X98.186 Y117.975 I-3.447 J.005 E.00595
G1 X99.142 Y117.019 E.02785
G1 X98.111 Y112.698 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G2 X96.782 Y109.988 I-16.716 J6.514 E.05782
G1 X95.804 Y108.374 E.03611
G1 X94.702 Y108.374 E.02108
G3 X96.319 Y111.068 I-63.634 J40.017 E.06011
G3 X97.096 Y112.698 I-15.216 J8.261 E.03458
G1 X98.051 Y112.698 E.01826
G1 X95.538 Y108.845 F28800
; LINE_WIDTH: 0.573036
G1 F15000
G3 X97.047 Y111.445 I-28.405 J18.223 E.07985
G3 X97.386 Y112.172 I-9.102 J4.677 E.02131
G1 X94.104 Y106.506 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X95.756 Y108.157 E.04469
G1 X95.198 Y108.157
G1 X93.547 Y106.506 E.04469
M204 S10000
G1 X94.618 Y108.177 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.41973
G1 F15000
G1 X94.466 Y107.984 E.0047
; LINE_WIDTH: 0.370181
G1 X94.314 Y107.79 E.00411
; LINE_WIDTH: 0.320631
G1 X94.163 Y107.597 E.00352
; LINE_WIDTH: 0.271082
G1 X94.011 Y107.404 E.00293
; LINE_WIDTH: 0.221533
G1 X93.86 Y107.21 E.00234
; LINE_WIDTH: 0.171984
G1 X93.708 Y107.017 E.00174
; LINE_WIDTH: 0.122434
G1 X93.556 Y106.824 E.00115
G1 X95.593 Y107.686 F28800
; LINE_WIDTH: 0.072885
G1 F15000
G1 X95.459 Y107.515 E.0005
; LINE_WIDTH: 0.116649
G1 X95.324 Y107.343 E.00096
; LINE_WIDTH: 0.160412
G1 X95.19 Y107.172 E.00143
; LINE_WIDTH: 0.204176
G1 X95.055 Y107 E.00189
; LINE_WIDTH: 0.247939
G1 X94.921 Y106.829 E.00235
; LINE_WIDTH: 0.291703
G1 X94.786 Y106.658 E.00281
; LINE_WIDTH: 0.335467
G1 X94.652 Y106.486 E.00328
G1 X94.756 Y106.042 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.622 Y104.907 E.0307
G1 X93.064 Y104.907
G1 X94.198 Y106.042 E.0307
G1 X93.641 Y106.042
G1 X92.506 Y104.907 E.0307
G1 X91.948 Y104.907
G1 X93.083 Y106.042 E.0307
M204 S10000
G1 X94.739 Y106.062 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.212051
G1 F15000
G1 X94.963 Y105.968 E.0022
; LINE_WIDTH: 0.213052
G1 X94.95 Y105.914 E.0005
; LINE_WIDTH: 0.178782
G1 X94.938 Y105.86 E.00041
; LINE_WIDTH: 0.144511
G1 X94.785 Y105.666 E.00143
; LINE_WIDTH: 0.192849
G1 X94.632 Y105.471 E.00201
; LINE_WIDTH: 0.241188
G1 X94.48 Y105.277 E.00259
; LINE_WIDTH: 0.289527
G1 X94.327 Y105.082 E.00317
; LINE_WIDTH: 0.337865
G1 X94.175 Y104.888 E.00375
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X94.327 Y105.082 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.013 I-.624 J-1.045 P1  F28800
G1 X92.687 Y106.062 Z3.013
G1 Z2.613
G1 E.8 F1800
; LINE_WIDTH: 0.19337
G1 F15000
G1 X92.557 Y105.896 E.00172
; LINE_WIDTH: 0.153208
G1 X92.427 Y105.73 E.00131
; LINE_WIDTH: 0.113047
G1 X92.296 Y105.564 E.00089
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X92.427 Y105.73 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.013 I-1.142 J.421 P1  F28800
G1 X99.344 Y124.494 Z3.013
G1 Z2.613
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03199
G1 X98.629 Y171.264 E.02655
G2 X102.16 Y175.409 I7.236 J-2.589 E.1146
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.287 Y175.409 E.0246
G2 X112.816 Y171.261 I-3.845 J-6.847 E.11449
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.77 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
G1 X113.343 Y112.698 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X114.351 Y112.698 E.01928
G3 X115.471 Y110.476 I14.916 J6.127 E.04766
G1 X116.745 Y108.374 E.04703
G1 X115.643 Y108.374 E.02108
G2 X113.972 Y111.248 I33.54 J21.434 E.06364
G2 X113.366 Y112.643 I12.007 J6.045 E.0291
G1 X114.039 Y112.229 F28800
; LINE_WIDTH: 0.572356
G1 F15000
G3 X115.068 Y110.232 I14.321 J6.119 E.05963
G1 X115.878 Y108.897 E.04142
G1 X117.877 Y106.849 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.534 Y106.506 E.00929
G1 X116.976 Y106.506
G1 X117.666 Y107.197 E.01869
G1 X117.456 Y107.544
G1 X116.512 Y106.599 E.02556
G1 X116.301 Y106.947
G1 X117.245 Y107.891 E.02556
G1 X116.954 Y108.157
G1 X116.091 Y107.294 E.02336
G1 X115.88 Y107.641
G1 X116.396 Y108.157 E.01396
M204 S10000
G1 X119.239 Y105.422 F28800
M204 S2000
G1 F12000
G1 X118.724 Y104.907 E.01392
G1 X118.166 Y104.907
G1 X119.028 Y105.769 E.02332
G1 X118.743 Y106.042
G1 X117.608 Y104.907 E.0307
G1 X117.051 Y104.907
G1 X118.185 Y106.042 E.0307
G1 X117.627 Y106.042
G1 X116.834 Y105.248 E.02147
G1 X116.624 Y105.596
G1 X117.07 Y106.042 E.01207
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.73185
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X116.624 Y105.596 E-.07193
G1 X116.834 Y105.248 E-.0463
G1 X117.515 Y105.929 E-.10977
; WIPE_END
G1 E-.012 F1800

G17
G3 Z3.013 I-1.139 J-.428 P1  F28800
G1 X111.79 Y121.178 Z3.013
G1 Z2.732
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.008 E.39208
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.004 E.33993
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
M73 P81 R3
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.132 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z3.132
G1 Z2.732
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.35 J3.008 E.1345
G1 X116.015 Y106.971 E.06773
G1 X118.075 Y106.971 E.0424
G1 X115.81 Y110.708 E.08997
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X93.373 Y106.971 E.08997
G1 X95.432 Y106.971 E.0424
G1 X97.137 Y109.784 E.06773
G3 X99.408 Y115.869 I-15.053 J9.083 E.1345
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.781 J3.065 E.12828
G1 X116.496 Y105.387 E.09371
G1 X119.513 Y105.387 E.05772
G1 X119.181 Y105.934 E.01225
G1 X116.162 Y110.916 E.11146
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X91.934 Y105.387 E.12371
G1 X94.951 Y105.387 E.05772
G1 X97.489 Y109.575 E.09371
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.132 I-.013 J1.217 P1  F28800
G1 X112.305 Y117.019 Z3.132
G1 Z2.732
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.262 Y117.975 E.02785
G2 X113.249 Y118.264 I3.433 J.294 E.00595
G1 X112.209 Y119.304 E.03028
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.198 Y118.264 E.03028
G2 X98.186 Y117.975 I-3.447 J.005 E.00595
G1 X99.142 Y117.019 E.02785
G1 X98.361 Y113.395 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G2 X96.364 Y109.298 I-17.678 J6.084 E.08743
G1 X96.226 Y109.071 E.00508
G1 X95.124 Y109.071 E.02108
G3 X96.63 Y111.663 I-27.753 J17.855 E.05738
G3 X97.365 Y113.395 I-15.737 J7.702 E.03602
G1 X98.301 Y113.395 E.01791
G1 X95.961 Y109.542 F28800
; LINE_WIDTH: 0.572896
G1 F15000
G3 X97.671 Y112.868 I-15.596 J10.124 E.09947
G1 X95.47 Y108.854 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X95.988 Y108.336 E.01401
G1 X95.778 Y107.989
G1 X94.913 Y108.854 E.02341
G1 X94.623 Y108.586
G1 X95.567 Y107.641 E.02556
G1 X95.357 Y107.294
G1 X94.412 Y108.238 E.02556
G1 X94.202 Y107.891
G1 X94.89 Y107.202 E.01864
G1 X94.333 Y107.202
G1 X93.991 Y107.544 E.00924
M204 S10000
G1 X94.797 Y106.739 F28800
M204 S2000
G1 F12000
G1 X95.245 Y106.29 E.01213
G1 X95.034 Y105.943
G1 X94.239 Y106.739 E.02153
G1 X93.681 Y106.739
G1 X94.816 Y105.604 E.0307
G1 X94.258 Y105.604
G1 X93.123 Y106.739 E.0307
G1 X92.84 Y106.464
G1 X93.7 Y105.604 E.02326
G1 X93.142 Y105.604
G1 X92.63 Y106.116 E.01386
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.142 Y105.604 E-.08259
G1 X93.7 Y105.604 E-.06359
G1 X93.192 Y106.111 E-.08182
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.132 I-1.154 J.386 P1  F28800
G1 X99.344 Y124.494 Z3.132
G1 Z2.732
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03199
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.13 J-2.496 E.11469
M73 P81 R2
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.289 Y175.41 E.02466
G2 X112.816 Y171.261 I-3.867 J-6.861 E.11448
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
G1 X113.098 Y113.395 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X114.082 Y113.395 E.01883
G3 X115.889 Y109.786 I16.798 J6.156 E.07739
G1 X116.323 Y109.071 E.016
G1 X115.221 Y109.071 E.02108
G2 X113.668 Y111.892 I21.694 J13.778 E.06166
G2 X113.118 Y113.338 I11.109 J5.057 E.02963
G1 X113.757 Y112.927 F28800
; LINE_WIDTH: 0.571425
G1 F15000
G3 X115.456 Y109.593 I17.027 J6.577 E.09924
G1 X116.11 Y108.854 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.511 Y107.453 E.03789
G1 X117.204 Y107.202
G1 X115.553 Y108.854 E.04469
G1 X115.377 Y108.472
G1 X116.646 Y107.202 E.03435
M204 S10000
G1 X116.249 Y107.183 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.19479
G1 F15000
G1 X116.117 Y107.35 E.00175
; LINE_WIDTH: 0.154155
G1 X115.986 Y107.518 E.00133
; LINE_WIDTH: 0.11352
G1 X115.854 Y107.686 E.00091
G1 X117.668 Y106.739 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.803 Y105.604 E.0307
G1 X118.245 Y105.604
G1 X117.11 Y106.739 E.0307
G1 X116.552 Y106.739
G1 X117.687 Y105.604 E.0307
G1 X117.129 Y105.604
G1 X115.994 Y106.739 E.0307
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X117.129 Y105.604 E-.18293
G1 X117.524 Y105.604 E-.04507
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.132 I.016 J1.217 P1  F28800
G1 X118.991 Y105.584 Z3.132
G1 Z2.732
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.207081
G1 F15000
G1 X119.003 Y105.683 E.00087
; LINE_WIDTH: 0.197668
G1 X118.992 Y105.732 E.00042
; LINE_WIDTH: 0.165667
G1 X118.98 Y105.782 E.00035
; LINE_WIDTH: 0.133666
G1 X118.827 Y105.977 E.0013
; LINE_WIDTH: 0.182494
G1 X118.674 Y106.172 E.00189
; LINE_WIDTH: 0.231323
G1 X118.521 Y106.368 E.00248
; LINE_WIDTH: 0.280152
G1 X118.367 Y106.563 E.00307
; LINE_WIDTH: 0.32898
G1 X118.214 Y106.758 E.00365
; CHANGE_LAYER
; Z_HEIGHT: 2.8509
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X118.367 Y106.563 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z3.132 I-1.11 J-.499 P1  F28800
G1 X111.79 Y121.178 Z3.132
G1 Z2.851
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.008 E.39208
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.004 E.33993
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.251 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z3.251
G1 Z2.851
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.324 J2.998 E.1345
G1 X115.593 Y107.667 E.05096
G1 X117.652 Y107.667 E.0424
G1 X115.81 Y110.708 E.0732
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X93.795 Y107.667 E.0732
G1 X95.854 Y107.667 E.0424
G3 X97.505 Y110.42 I-64.837 J40.742 E.0661
G3 X99.408 Y115.869 I-15.216 J8.371 E.11938
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.744 J3.051 E.12828
G1 X116.074 Y106.084 E.07812
G1 X119.091 Y106.084 E.05772
G1 X118.822 Y106.528 E.00994
G1 X116.162 Y110.916 E.09818
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X92.356 Y106.084 E.10812
G1 X95.373 Y106.084 E.05772
G1 X97.489 Y109.575 E.07812
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.251 I-.013 J1.217 P1  F28800
M73 P82 R2
G1 X112.305 Y117.019 Z3.251
G1 Z2.851
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.262 Y117.975 E.02785
G2 X113.249 Y118.264 I3.433 J.294 E.00595
G1 X112.209 Y119.304 E.03028
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.198 Y118.264 E.03028
G2 X98.186 Y117.975 I-3.447 J.005 E.00595
G1 X99.142 Y117.019 E.02785
G1 X98.579 Y114.092 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G2 X96.646 Y109.768 I-16.632 J4.838 E.0909
G1 X95.536 Y109.768 E.02124
G1 X96.317 Y111.065 E.02897
G3 X97.595 Y114.092 I-14.334 J7.837 E.06297
G1 X98.519 Y114.092 E.01767
G1 X96.375 Y110.242 F28800
; LINE_WIDTH: 0.573825
G1 F15000
G3 X97.92 Y113.563 I-13.266 J8.192 E.09766
G1 X96.591 Y109.551 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X94.94 Y107.899 E.04469
G1 X94.382 Y107.899
G1 X96.034 Y109.551 E.04469
M204 S10000
G1 X96.451 Y109.102 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.072885
G1 F15000
G1 X96.314 Y108.927 E.00051
; LINE_WIDTH: 0.117506
G1 X96.177 Y108.753 E.00099
; LINE_WIDTH: 0.162128
G1 X96.04 Y108.578 E.00147
; LINE_WIDTH: 0.206749
G1 X95.903 Y108.403 E.00195
; LINE_WIDTH: 0.251371
G1 X95.766 Y108.229 E.00243
; LINE_WIDTH: 0.295992
G1 X95.629 Y108.054 E.00291
; LINE_WIDTH: 0.340614
G1 X95.492 Y107.879 E.00339
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X95.629 Y108.054 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.251 I1.012 J-.676 P1  F28800
G1 X94.457 Y106.301 Z3.251
G1 Z2.851
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X95.592 Y107.435 E.0307
G1 X95.034 Y107.435
G1 X93.899 Y106.301 E.0307
G1 X93.341 Y106.301
G1 X94.476 Y107.435 E.0307
G1 X93.918 Y107.435
G1 X92.784 Y106.301 E.0307
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.918 Y107.435 E-.18293
G1 X94.314 Y107.435 E-.04507
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.251 I-.019 J1.217 P1  F28800
G1 X95.582 Y107.455 Z3.251
G1 Z2.851
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.212051
G1 F15000
G1 X95.803 Y107.359 E.00218
; LINE_WIDTH: 0.217456
G1 X95.79 Y107.305 E.00052
; LINE_WIDTH: 0.184863
G1 X95.776 Y107.251 E.00043
; LINE_WIDTH: 0.152272
G1 X95.624 Y107.057 E.00152
; LINE_WIDTH: 0.20026
G1 X95.472 Y106.863 E.00209
; LINE_WIDTH: 0.248248
G1 X95.319 Y106.669 E.00266
; LINE_WIDTH: 0.296235
G1 X95.167 Y106.475 E.00324
; LINE_WIDTH: 0.344223
G1 X95.015 Y106.281 E.00381
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X95.167 Y106.475 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.251 I-.624 J-1.045 P1  F28800
G1 X93.527 Y107.455 Z3.251
G1 Z2.851
G1 E.8 F1800
; LINE_WIDTH: 0.187363
G1 F15000
G1 X93.403 Y107.297 E.00158
; LINE_WIDTH: 0.149203
G1 X93.279 Y107.138 E.00121
; LINE_WIDTH: 0.111044
G1 X93.155 Y106.98 E.00083
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.279 Y107.138 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.251 I-1.149 J.401 P1  F28800
G1 X99.344 Y124.494 Z3.251
G1 Z2.851
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03199
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.231 J-2.583 E.1146
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.797 E.11568
G1 X109.289 Y175.41 E.02466
G2 X112.816 Y171.261 I-3.867 J-6.861 E.11448
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
G1 X112.875 Y114.092 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X113.852 Y114.092 E.0187
G3 X115.901 Y109.768 I16.397 J5.121 E.09185
G1 X114.799 Y109.768 E.02108
G2 X112.893 Y114.034 I14.234 J8.919 E.08971
G1 X115.065 Y110.239 F28800
; LINE_WIDTH: 0.572721
G1 F15000
G2 X113.528 Y113.565 I13.935 J8.454 E.09747
G1 X117.035 Y108.239 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.696 Y107.899 E.00918
G1 X116.138 Y107.899
G1 X116.824 Y108.586 E.01858
G1 X116.614 Y108.933
G1 X115.67 Y107.989 E.02556
G1 X115.459 Y108.336
G1 X116.403 Y109.281 E.02556
G1 X116.116 Y109.551
G1 X115.248 Y108.683 E.02346
G1 X115.038 Y109.031
G1 X115.558 Y109.551 E.01407
M204 S10000
G1 X118.397 Y106.811 F28800
M204 S2000
G1 F12000
G1 X117.886 Y106.301 E.01381
G1 X117.328 Y106.301
G1 X118.186 Y107.158 E.02321
G1 X117.905 Y107.435
G1 X116.77 Y106.301 E.0307
G1 X116.213 Y106.301
G1 X117.347 Y107.435 E.0307
G1 X116.789 Y107.435
G1 X115.992 Y106.638 E.02158
G1 X115.781 Y106.985
G1 X116.232 Y107.435 E.01218
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.96996
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X115.781 Y106.985 E-.07258
G1 X115.992 Y106.638 E-.0463
G1 X116.669 Y107.315 E-.10912
; WIPE_END
G1 E-.012 F1800

G17
G3 Z3.251 I-1.148 J-.404 P1  F28800
G1 X111.79 Y121.178 Z3.251
G1 Z2.97
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.008 E.39208
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.004 E.33993
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.37 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z3.37
G1 Z2.97
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.324 J2.998 E.1345
G1 X115.171 Y108.364 E.03418
G1 X117.23 Y108.364 E.0424
G1 X115.81 Y110.708 E.05643
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J.005 E.50652
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X94.217 Y108.364 E.05643
G1 X96.276 Y108.364 E.0424
G3 X97.843 Y111.066 I-29.195 J18.725 E.06433
G3 X99.408 Y115.869 I-15.886 J7.833 E.10436
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.744 J3.051 E.12828
G1 X115.652 Y106.78 E.06253
G1 X118.669 Y106.78 E.05772
G1 X118.462 Y107.121 E.00763
G1 X116.162 Y110.916 E.08491
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J0 E.49516
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X92.779 Y106.78 E.09253
G1 X95.795 Y106.78 E.05772
G1 X97.489 Y109.575 E.06253
G3 X99.816 Y115.822 I-15.418 J9.298 E.12828
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.37 I-.013 J1.217 P1  F28800
G1 X112.305 Y117.019 Z3.37
G1 Z2.97
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.262 Y117.975 E.02785
G2 X113.249 Y118.264 I3.433 J.294 E.00595
G1 X112.209 Y119.304 E.03028
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.198 Y118.264 E.03028
G2 X98.186 Y117.975 I-3.447 J.005 E.00595
G1 X99.142 Y117.019 E.02785
G1 X98.752 Y114.788 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G2 X97.053 Y110.464 I-15.929 J3.761 E.08919
G1 X95.956 Y110.464 E.02099
G3 X97.791 Y114.788 I-13.313 J8.2 E.09022
G1 X98.692 Y114.788 E.01723
G1 X98.152 Y114.316 F28800
; LINE_WIDTH: 0.573195
G1 F15000
G2 X96.802 Y110.984 I-15.648 J4.396 E.0957
G1 X96.308 Y110.247 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X96.83 Y109.725 E.01412
G1 X96.62 Y109.378
G1 X95.751 Y110.247 E.02352
G1 X95.459 Y109.981
G1 X96.409 Y109.031 E.02572
M73 P83 R2
G1 X96.199 Y108.683
G1 X95.25 Y109.633 E.02568
G1 X95.04 Y109.284
G1 X95.728 Y108.596 E.01862
G1 X95.171 Y108.596
G1 X94.831 Y108.936 E.00919
M204 S10000
G1 X95.635 Y108.132 F28800
M204 S2000
G1 F12000
G1 X96.087 Y107.68 E.01224
G1 X95.876 Y107.332
G1 X95.077 Y108.132 E.02164
G1 X94.519 Y108.132
G1 X95.654 Y106.997 E.0307
G1 X95.096 Y106.997
G1 X93.961 Y108.132 E.0307
G1 X93.682 Y107.853
G1 X94.538 Y106.997 E.02315
G1 X93.98 Y106.997
G1 X93.472 Y107.506 E.01375
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X93.98 Y106.997 E-.08194
G1 X94.538 Y106.997 E-.06359
G1 X94.026 Y107.509 E-.08247
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.37 I-1.161 J.364 P1  F28800
G1 X99.344 Y124.494 Z3.37
G1 Z2.97
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03199
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.231 J-2.583 E.1146
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.797 E.11568
G1 X109.289 Y175.41 E.02466
G2 X112.816 Y171.261 I-3.867 J-6.861 E.11448
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
G1 X112.696 Y114.788 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X113.656 Y114.788 E.01838
G3 X115.484 Y110.464 I15.11 J3.838 E.09017
G1 X114.39 Y110.464 E.02093
G2 X112.707 Y114.729 I14.442 J8.166 E.08802
G1 X113.296 Y114.316 F28800
; LINE_WIDTH: 0.573196
G1 F15000
G3 X114.639 Y110.988 I15.943 J4.499 E.09553
G1 X115.275 Y110.247 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.653 Y108.87 E.03728
G1 X116.368 Y108.596
G1 X114.717 Y110.247 E.04469
G1 X114.519 Y109.888
G1 X115.811 Y108.596 E.03496
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.519 Y109.888 E-.20831
G1 X114.602 Y110.039 E-.01969
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.37 I.816 J.903 P1  F28800
G1 X117.967 Y106.997 Z3.37
G1 Z2.97
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X116.832 Y108.132 E.0307
G1 X116.275 Y108.132
G1 X117.409 Y106.997 E.0307
G1 X116.851 Y106.997
G1 X115.717 Y108.132 E.0307
G1 X115.159 Y108.132
G1 X116.293 Y106.997 E.0307
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X115.159 Y108.132 E-.18293
G1 X115.554 Y108.132 E-.04507
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.37 I.494 J1.112 P1  F28800
G1 X118.151 Y106.978 Z3.37
G1 Z2.97
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.202812
G1 F15000
G1 X118.163 Y107.08 E.00089
; LINE_WIDTH: 0.185317
G1 X118.152 Y107.126 E.00037
; LINE_WIDTH: 0.155613
G1 X118.142 Y107.172 E.0003
; LINE_WIDTH: 0.125908
G1 X117.988 Y107.368 E.00121
; LINE_WIDTH: 0.175087
G1 X117.835 Y107.564 E.00181
; LINE_WIDTH: 0.224266
G1 X117.681 Y107.76 E.0024
; LINE_WIDTH: 0.273445
G1 X117.527 Y107.956 E.00299
; LINE_WIDTH: 0.322624
G1 X117.374 Y108.152 E.00359
; CHANGE_LAYER
; Z_HEIGHT: 3.08902
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X117.527 Y107.956 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z3.37 I-1.116 J-.484 P1  F28800
G1 X111.79 Y121.178 Z3.37
G1 Z3.089
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.008 E.39208
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.004 E.33993
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.489 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z3.489
G1 Z3.089
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.31 Y109.784 I17.324 J2.998 E.1345
G1 X114.749 Y109.061 E.01741
G1 X116.808 Y109.061 E.0424
G1 X115.81 Y110.708 E.03965
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X95.638 Y110.708 I-15.706 J.031 E.17493
G1 X94.639 Y109.061 E.03965
G1 X96.699 Y109.061 E.0424
G3 X99.111 Y114.475 I-15.788 J10.278 E.12256
G3 X99.408 Y115.869 I-16.455 J4.233 E.02934
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.958 Y109.575 I17.744 J3.051 E.12828
G1 X115.23 Y107.477 E.04694
G1 X118.247 Y107.477 E.05772
G1 X118.102 Y107.715 E.00532
G1 X116.162 Y110.916 E.07163
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X93.201 Y107.477 E.07695
G1 X96.218 Y107.477 E.05772
G3 X97.864 Y110.223 I-64.673 J40.63 E.06126
G3 X99.816 Y115.822 I-15.583 J8.572 E.11399
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.489 I-.013 J1.217 P1  F28800
G1 X112.305 Y117.019 Z3.489
G1 Z3.089
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.262 Y117.975 E.02785
G2 X113.249 Y118.264 I3.433 J.294 E.00595
G1 X112.209 Y119.304 E.03028
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.198 Y118.264 E.03028
G2 X98.186 Y117.975 I-3.447 J.005 E.00595
G1 X99.142 Y117.019 E.02785
G1 X98.911 Y115.485 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G2 X97.426 Y111.161 I-15.907 J3.046 E.08777
G1 X96.367 Y111.161 E.02025
G3 X97.954 Y115.485 I-14.086 J7.62 E.08843
G1 X98.851 Y115.485 E.01717
G1 X97.132 Y111.629 F28800
; LINE_WIDTH: 0.571894
G1 F15000
G3 X98.318 Y114.954 I-14 J6.867 E.09376
G1 X95.775 Y109.293 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.427 Y110.944 E.04469
G1 X96.869 Y110.944
G1 X95.218 Y109.293 E.04469
M204 S10000
G1 X96.291 Y110.964 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.412834
G1 F15000
G1 X96.122 Y110.743 E.00522
; LINE_WIDTH: 0.37176
G1 X95.951 Y110.52 E.00472
; LINE_WIDTH: 0.33081
G1 X95.838 Y110.376 E.00271
; LINE_WIDTH: 0.287822
G1 X95.725 Y110.232 E.00233
; LINE_WIDTH: 0.244835
G1 X95.612 Y110.088 E.00195
; LINE_WIDTH: 0.201847
G1 X95.499 Y109.944 E.00157
; LINE_WIDTH: 0.15886
G1 X95.386 Y109.8 E.00118
; LINE_WIDTH: 0.115872
G1 X95.273 Y109.656 E.0008
G1 X96.427 Y108.829 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X95.293 Y107.694 E.0307
G1 X94.735 Y107.694
G1 X95.869 Y108.829 E.0307
G1 X95.312 Y108.829
G1 X94.177 Y107.694 E.0307
G1 X93.619 Y107.694
G1 X94.754 Y108.829 E.0307
M204 S10000
G1 X96.425 Y108.848 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.212051
G1 F15000
G1 X96.644 Y108.75 E.00217
; LINE_WIDTH: 0.222031
G1 X96.629 Y108.696 E.00054
; LINE_WIDTH: 0.19103
G1 X96.614 Y108.642 E.00045
; LINE_WIDTH: 0.160027
G1 X96.462 Y108.448 E.0016
; LINE_WIDTH: 0.207665
G1 X96.311 Y108.255 E.00217
; LINE_WIDTH: 0.255303
G1 X96.159 Y108.061 E.00274
; LINE_WIDTH: 0.302941
G1 X96.007 Y107.868 E.00331
; LINE_WIDTH: 0.350578
G1 X95.855 Y107.674 E.00388
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X96.007 Y107.868 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.489 I-.625 J-1.044 P1  F28800
G1 X94.368 Y108.848 Z3.489
G1 Z3.089
G1 E.8 F1800
; LINE_WIDTH: 0.181357
G1 F15000
G1 X94.249 Y108.698 E.00145
; LINE_WIDTH: 0.145199
G1 X94.131 Y108.547 E.00111
; LINE_WIDTH: 0.109042
G1 X94.013 Y108.396 E.00078
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X94.131 Y108.547 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.489 I-1.157 J.378 P1  F28800
G1 X99.344 Y124.494 Z3.489
G1 Z3.089
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
M73 P84 R2
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03199
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.231 J-2.583 E.1146
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.287 Y175.409 E.0246
G2 X112.816 Y171.261 I-3.845 J-6.847 E.11449
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
G1 X112.537 Y115.485 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X113.488 Y115.485 E.01821
G3 X115.087 Y111.161 I15.399 J3.236 E.08853
G1 X114.017 Y111.161 E.02047
G2 X112.546 Y115.426 I15.073 J7.586 E.08658
G1 X113.114 Y115.014 F28800
; LINE_WIDTH: 0.572666
G1 F15000
G3 X114.286 Y111.686 I16.122 J3.806 E.09382
G1 X116.193 Y109.628 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.858 Y109.293 E.00908
G1 X115.3 Y109.293
G1 X115.982 Y109.975 E.01847
G1 X115.772 Y110.323
G1 X114.829 Y109.38 E.02551
G1 X114.622 Y109.73
G1 X115.563 Y110.671 E.02547
G1 X115.278 Y110.944
G1 X114.414 Y110.08 E.02337
G1 X114.206 Y110.43
G1 X114.72 Y110.944 E.0139
M204 S10000
G1 X117.555 Y108.2 F28800
M204 S2000
G1 F12000
G1 X117.048 Y107.694 E.0137
G1 X116.49 Y107.694
G1 X117.344 Y108.548 E.0231
G1 X117.067 Y108.829
G1 X115.933 Y107.694 E.0307
G1 X115.375 Y107.694
G1 X116.509 Y108.829 E.0307
G1 X115.951 Y108.829
G1 X115.15 Y108.027 E.02169
G1 X114.939 Y108.374
G1 X115.394 Y108.829 E.01229
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.20807
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.939 Y108.374 E-.07322
G1 X115.15 Y108.027 E-.0463
G1 X115.823 Y108.7 E-.10848
; WIPE_END
G1 E-.012 F1800

G17
G3 Z3.489 I-1.158 J-.374 P1  F28800
G1 X111.79 Y121.178 Z3.489
G1 Z3.208
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.008 E.39208
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.004 E.33993
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.608 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z3.608
G1 Z3.208
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X114.326 Y109.757 I17.216 J2.956 E.13515
G1 X116.386 Y109.757 E.04241
G1 X115.81 Y110.708 E.02288
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J.005 E.50652
G1 X97.896 Y118.791 E1.02946
G2 X97.174 Y114.112 I-15.53 J.001 E.09786
G1 X97.174 Y114.112 E0
G2 X95.638 Y110.708 I-14.776 J4.619 E.07709
G1 X95.062 Y109.757 E.02288
G1 X97.122 Y109.757 E.04241
G3 X99.408 Y115.869 I-15.054 J9.114 E.13513
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X111.816 Y114.9 I11.078 J1.738 E.018
G1 X111.816 Y114.9 E0
G3 X113.958 Y109.575 I17.302 J3.866 E.1103
G1 X114.807 Y108.174 E.03136
G1 X117.824 Y108.174 E.05772
G1 X117.743 Y108.308 E.00301
G1 X116.162 Y110.916 E.05835
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J0 E.49516
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.384 J.051 E.15844
G1 X93.623 Y108.174 E.06136
G1 X96.64 Y108.174 E.05772
G3 X98.209 Y110.884 I-29.309 J18.782 E.05995
G3 X99.816 Y115.822 I-16.278 J8.025 E.0997
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.608 I-.013 J1.217 P1  F28800
G1 X112.305 Y117.019 Z3.608
G1 Z3.208
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.262 Y117.975 E.02785
G2 X113.249 Y118.264 I3.433 J.294 E.00595
G1 X112.209 Y119.304 E.03028
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.198 Y118.264 E.03028
G2 X98.186 Y117.975 I-3.447 J.005 E.00595
G1 X99.142 Y117.019 E.02785
G1 X99.011 Y116.182 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X99.001 Y115.934 E.00475
G2 X97.758 Y111.858 I-16.26 J2.73 E.08177
G1 X96.719 Y111.858 E.01988
G3 X98.084 Y116.182 I-14.015 J6.802 E.08707
G1 X98.951 Y116.182 E.01659
G1 X97.449 Y112.327 F28800
; LINE_WIDTH: 0.57149
G1 F15000
G3 X98.468 Y115.65 I-14.958 J6.406 E.09224
G1 X97.146 Y111.641 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.629 Y111.158 E.01306
G1 X97.437 Y110.792
G1 X96.589 Y111.641 E.02297
G1 X96.285 Y111.386
G1 X97.242 Y110.429 E.0259
G1 X97.038 Y110.076
G1 X96.087 Y111.026 E.02572
G1 X95.879 Y110.677
G1 X96.566 Y109.989 E.0186
G1 X96.009 Y109.989
G1 X95.671 Y110.327 E.00914
M204 S10000
G1 X96.473 Y109.525 F28800
M204 S2000
G1 F12000
G1 X96.929 Y109.069 E.01235
G1 X96.718 Y108.722
G1 X95.915 Y109.525 E.02175
G1 X95.357 Y109.525
G1 X96.492 Y108.391 E.0307
G1 X95.934 Y108.391
G1 X94.799 Y109.525 E.0307
G1 X94.524 Y109.242
G1 X95.376 Y108.391 E.02304
G1 X94.818 Y108.391
G1 X94.314 Y108.895 E.01364
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X94.818 Y108.391 E-.08129
G1 X95.376 Y108.391 E-.06359
G1 X94.86 Y108.906 E-.08311
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.608 I-1.17 J.336 P1  F28800
G1 X99.344 Y124.494 Z3.608
G1 Z3.208
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03199
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.231 J-2.583 E.1146
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.797 E.11568
G1 X109.289 Y175.41 E.02466
G2 X112.816 Y171.261 I-3.867 J-6.861 E.11448
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
G1 X112.436 Y116.182 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X113.358 Y116.182 E.01763
G3 X114.728 Y111.858 I15.518 J2.539 E.0871
G1 X113.685 Y111.858 E.01997
G2 X112.451 Y115.899 I15.427 J6.92 E.08107
G1 X112.439 Y116.122 E.00426
G1 X112.966 Y115.711 F28800
; LINE_WIDTH: 0.572669
G1 F15000
G3 X113.973 Y112.384 I16.246 J3.1 E.09243
G1 X114.439 Y111.641 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.794 Y110.286 E.03667
G1 X115.533 Y109.989
G1 X113.882 Y111.641 E.04469
G1 X113.832 Y111.132
G1 X114.975 Y109.989 E.03093
M204 S10000
G1 X115.349 Y111.037 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.102662
G1 F15000
G1 X115.265 Y111.149 E.00052
; LINE_WIDTH: 0.103124
G1 X115.14 Y111.319 E.0008
; LINE_WIDTH: 0.152922
G1 X115.015 Y111.49 E.00131
; LINE_WIDTH: 0.202721
G1 X114.889 Y111.66 E.00182
G1 X115.997 Y109.525 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.131 Y108.391 E.0307
G1 X116.574 Y108.391
G1 X115.439 Y109.525 E.0307
G1 X114.881 Y109.525
G1 X116.016 Y108.391 E.0307
G1 X115.458 Y108.391
G1 X114.323 Y109.525 E.0307
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X115.458 Y108.391 E-.18293
G1 X115.853 Y108.391 E-.04507
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.608 I.016 J1.217 P1  F28800
G1 X117.31 Y108.371 Z3.608
G1 Z3.208
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.198544
G1 F15000
G1 X117.323 Y108.478 E.00091
; LINE_WIDTH: 0.172966
G1 X117.313 Y108.52 E.00031
; LINE_WIDTH: 0.145558
G1 X117.304 Y108.563 E.00025
; LINE_WIDTH: 0.118149
G1 X117.15 Y108.759 E.00112
; LINE_WIDTH: 0.167678
G1 X116.996 Y108.956 E.00172
; LINE_WIDTH: 0.217208
G1 X116.841 Y109.152 E.00232
; LINE_WIDTH: 0.266737
G1 X116.687 Y109.349 E.00292
; LINE_WIDTH: 0.316266
G1 X116.533 Y109.545 E.00352
; CHANGE_LAYER
; Z_HEIGHT: 3.32713
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X116.687 Y109.349 E-.228
; WIPE_END
M73 P85 R2
G1 E-.012 F1800

G17
G3 Z3.608 I-1.124 J-.465 P1  F28800
G1 X111.79 Y121.178 Z3.608
G1 Z3.327
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.008 E.39208
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.004 E.33993
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.727 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z3.727
G1 Z3.327
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X113.925 Y110.454 I17.353 J3.006 E.11859
G1 X115.964 Y110.454 E.04197
G1 X115.81 Y110.708 E.00611
G2 X113.551 Y118.791 I13.448 J8.114 E.17493
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X95.484 Y110.454 I-15.706 J.027 E.18105
G1 X97.522 Y110.454 E.04197
G3 X99.408 Y115.869 I-15.196 J8.327 E.1186
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X111.812 Y114.92 I10.837 J1.692 E.0176
G1 X111.812 Y114.92 E0
G3 X113.958 Y109.575 I17.311 J3.848 E.1107
G1 X114.385 Y108.87 E.01577
G1 X117.402 Y108.87 E.05772
G1 X116.162 Y110.916 E.04577
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X94.045 Y108.87 E.04577
G1 X97.062 Y108.87 E.05772
G3 X99.508 Y114.374 I-15.645 J10.247 E.11573
G3 X99.816 Y115.822 I-17.101 J4.394 E.02834
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.727 I-.313 J1.176 P1  F28800
G1 X112.565 Y117.279 Z3.727
G1 Z3.327
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.262 Y117.975 E.02028
G2 X113.249 Y118.264 I3.434 J.294 E.00595
G1 X112.209 Y119.304 E.03028
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.198 Y118.264 E.03028
G2 X98.186 Y117.975 I-3.447 J.005 E.00595
G1 X98.882 Y117.279 E.02028
G1 X99.04 Y116.878 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X99.001 Y115.951 E.01776
G2 X98.052 Y112.554 I-16.572 J2.8 E.0676
G1 X97.036 Y112.554 E.01945
G3 X98.183 Y116.878 I-14.667 J6.206 E.08588
G1 X98.98 Y116.878 E.01525
G1 X97.728 Y113.024 F28800
; LINE_WIDTH: 0.571863
G1 F15000
G3 X98.531 Y115.97 I-14.847 J5.628 E.08106
G1 X98.568 Y116.371 E.01067
G1 X98.083 Y112.158 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X96.611 Y110.686 E.03984
G1 X96.053 Y110.686
G1 X97.705 Y112.337 E.04469
G1 X97.147 Y112.337
G1 X96.383 Y111.574 E.02067
M204 S10000
G1 X97.851 Y111.605 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.234503
G1 F15000
G1 X97.621 Y111.292 E.00394
; LINE_WIDTH: 0.280451
G1 X97.391 Y110.979 E.0048
; LINE_WIDTH: 0.326398
G1 X97.161 Y110.666 E.00567
G1 X98.174 Y112.322 F28800
; LINE_WIDTH: 0.0950539
G1 F15000
G1 X97.72 Y112.322 E.00153
G1 X96.447 Y111.509 F28800
; LINE_WIDTH: 0.210123
G1 F15000
G1 X96.359 Y111.389 E.00134
; LINE_WIDTH: 0.17435
G1 X96.27 Y111.268 E.00108
; LINE_WIDTH: 0.121201
G2 X96.097 Y111.035 I-9.779 J7.093 E.00135
G1 X97.263 Y110.222 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X96.128 Y109.087 E.0307
G1 X95.57 Y109.087
G1 X96.705 Y110.222 E.0307
G1 X96.147 Y110.222
G1 X95.012 Y109.087 E.0307
G1 X94.455 Y109.087
G1 X95.589 Y110.222 E.0307
M204 S10000
G1 X97.258 Y110.242 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.212051
G1 F15000
G1 X97.478 Y110.144 E.00217
; LINE_WIDTH: 0.220521
G1 X97.464 Y110.09 E.00053
; LINE_WIDTH: 0.190161
G1 X97.45 Y110.035 E.00045
; LINE_WIDTH: 0.159801
G1 X97.334 Y109.885 E.00123
; LINE_WIDTH: 0.20912
G1 X97.219 Y109.735 E.00168
; LINE_WIDTH: 0.258439
G1 X97.045 Y109.512 E.00319
; LINE_WIDTH: 0.307034
G1 X96.87 Y109.29 E.00386
; LINE_WIDTH: 0.355629
G1 X96.696 Y109.068 E.00453
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X96.87 Y109.29 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.727 I-.605 J-1.056 P1  F28800
G1 X95.208 Y110.242 Z3.727
G1 Z3.327
G1 E.8 F1800
; LINE_WIDTH: 0.17535
G1 F15000
G1 X95.096 Y110.099 E.00132
; LINE_WIDTH: 0.141195
G1 X94.983 Y109.955 E.00102
; LINE_WIDTH: 0.10704
G1 X94.871 Y109.812 E.00072
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X94.983 Y109.955 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.727 I-1.166 J.35 P1  F28800
G1 X99.344 Y124.494 Z3.727
G1 Z3.327
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03199
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.231 J-2.583 E.1146
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.287 Y175.409 E.0246
G2 X112.816 Y171.261 I-3.845 J-6.847 E.11449
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
G1 X112.407 Y116.878 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X113.259 Y116.878 E.0163
G3 X114.411 Y112.554 I15.674 J1.863 E.08591
G1 X113.395 Y112.554 E.01945
G2 X112.447 Y115.916 I15.941 J6.308 E.06695
G1 X112.41 Y116.818 E.01728
G1 X112.871 Y116.433 F28800
; LINE_WIDTH: 0.520714
G1 F15000
G1 X112.95 Y115.906 E.01281
; LINE_WIDTH: 0.567963
G3 X113.372 Y114.039 I12.321 J1.805 E.05041
G3 X113.698 Y113.08 I10.939 J3.183 E.02667
G1 X115.359 Y111.025 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.02 Y110.686 E.00917
G1 X114.462 Y110.686
G1 X115.162 Y111.386 E.01896
G1 X114.971 Y111.753
G1 X114.01 Y110.792 E.026
G1 X113.818 Y111.158
G1 X114.792 Y112.132 E.02635
G1 X114.44 Y112.337
G1 X113.639 Y111.537 E.02165
G1 X113.464 Y111.92
G1 X113.882 Y112.337 E.0113
M204 S10000
G1 X116.712 Y109.59 F28800
M204 S2000
G1 F12000
G1 X116.21 Y109.087 E.01359
G1 X115.652 Y109.087
G1 X116.502 Y109.937 E.02299
G1 X116.229 Y110.222
G1 X115.095 Y109.087 E.0307
G1 X114.537 Y109.087
G1 X115.671 Y110.222 E.0307
G1 X115.113 Y110.222
G1 X114.308 Y109.416 E.0218
G1 X114.099 Y109.765
G1 X114.556 Y110.222 E.01236
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.44619
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.099 Y109.765 E-.07365
G1 X114.308 Y109.416 E-.04635
G1 X114.978 Y110.086 E-.108
; WIPE_END
G1 E-.012 F1800

G17
G3 Z3.727 I-1.17 J-.336 P1  F28800
G1 X111.79 Y121.178 Z3.727
G1 Z3.446
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.008 E.39208
G1 X111.79 Y121.238 E.97936
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.004 E.33993
G1 X111.381 Y121.648 E.90222
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.846 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z3.846
G1 Z3.446
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X113.565 Y111.151 I17.379 J3.013 E.10244
G1 X115.547 Y111.151 E.04082
G1 X115.182 Y111.849 E.01622
G2 X113.551 Y118.791 I14.114 J6.978 E.14811
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X95.9 Y111.151 I-15.761 J.036 E.16434
G1 X97.882 Y111.151 E.04082
G3 X99.408 Y115.869 I-15.854 J7.731 E.10244
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.965 Y109.567 I17.684 J3.035 E.12849
G1 X116.98 Y109.567 E.05768
G1 X116.162 Y110.916 E.03019
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X94.467 Y109.567 E.03019
G1 X97.482 Y109.567 E.05768
G3 X99.816 Y115.822 I-15.351 J9.29 E.12849
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.846 I-.69 J1.002 P1  F28800
G1 X112.378 Y117.575 Z3.846
G1 Z3.446
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X113.191 Y117.575 E.01555
M73 P86 R2
G3 X114.136 Y113.251 I15.714 J1.17 E.08497
G1 X113.137 Y113.251 E.01912
G2 X112.447 Y115.916 I15.326 J5.384 E.05274
G1 X112.38 Y117.515 E.03062
G1 X112.811 Y117.159 F28800
; LINE_WIDTH: 0.46233
G1 F15000
G1 X112.859 Y116.609 E.0117
; LINE_WIDTH: 0.511208
G1 X112.906 Y116.059 E.01301
; LINE_WIDTH: 0.568986
G3 X113.457 Y113.778 I14.035 J2.183 E.06194
G1 X115.065 Y111.573 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.604 Y113.034 E.03953
G1 X113.046 Y113.034
G1 X114.697 Y111.383 E.04469
G1 X114.14 Y111.383
G1 X113.364 Y112.158 E.02098
M204 S10000
G1 X113.429 Y112.223 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.201212
G1 F15000
G1 X113.307 Y112.404 E.00186
; LINE_WIDTH: 0.156265
G1 X113.186 Y112.586 E.00139
G1 X114.773 Y112.168 F28800
; LINE_WIDTH: 0.132889
G1 F15000
G1 X114.66 Y112.334 E.00104
; LINE_WIDTH: 0.133725
G1 X114.599 Y112.424 E.00057
; LINE_WIDTH: 0.175499
G1 X114.538 Y112.514 E.00079
; LINE_WIDTH: 0.217272
G1 X114.478 Y112.604 E.00101
; LINE_WIDTH: 0.259046
G1 X114.417 Y112.694 E.00123
; LINE_WIDTH: 0.30082
G1 X114.357 Y112.784 E.00145
; LINE_WIDTH: 0.354648
G1 X114.296 Y112.874 E.00173
G1 X114.321 Y112.911 E.0007
; LINE_WIDTH: 0.311024
G1 X114.417 Y113.054 E.00239
G1 X115.175 Y111.404 F28800
; LINE_WIDTH: 0.108703
G1 F15000
G1 X114.719 Y111.404 E.00184
G1 X115.161 Y110.919 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.296 Y109.784 E.0307
G1 X115.738 Y109.784
G1 X114.603 Y110.919 E.0307
G1 X114.046 Y110.919
G1 X115.18 Y109.784 E.0307
G1 X114.622 Y109.784
G1 X113.488 Y110.919 E.0307
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.622 Y109.784 E-.18293
G1 X115.018 Y109.784 E-.04507
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.846 I.017 J1.217 P1  F28800
G1 X116.47 Y109.764 Z3.846
G1 Z3.446
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.194275
G1 F15000
G1 X116.483 Y109.876 E.00092
; LINE_WIDTH: 0.160612
G1 X116.474 Y109.915 E.00026
; LINE_WIDTH: 0.1355
G1 X116.465 Y109.953 E.00021
; LINE_WIDTH: 0.11039
G1 X116.343 Y110.109 E.00081
; LINE_WIDTH: 0.15789
G1 X116.221 Y110.265 E.00127
; LINE_WIDTH: 0.20539
G1 X116.099 Y110.421 E.00173
; LINE_WIDTH: 0.25289
G1 X115.977 Y110.576 E.00218
; LINE_WIDTH: 0.301194
G1 X115.853 Y110.735 E.00269
; LINE_WIDTH: 0.348742
G1 X115.696 Y110.938 E.00402
G1 X113.249 Y118.264 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X112.209 Y119.304 E.03028
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.198 Y118.264 E.03028
G1 X99.069 Y117.575 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X99.001 Y115.951 E.03111
G2 X98.311 Y113.251 I-15.283 J2.471 E.05339
G1 X97.312 Y113.251 E.01912
G3 X98.252 Y117.575 I-14.932 J5.51 E.08494
G1 X99.009 Y117.575 E.0145
G1 X97.971 Y113.721 F28800
; LINE_WIDTH: 0.57184
G1 F15000
G3 X98.531 Y115.97 I-16.196 J5.224 E.06148
; LINE_WIDTH: 0.57259
G1 X98.567 Y116.346 E.01
; LINE_WIDTH: 0.531557
G1 X98.604 Y116.721 E.00925
; LINE_WIDTH: 0.490524
G1 X98.629 Y117.097 E.0085
G1 X98.305 Y112.713 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.984 Y113.034 E.00869
G1 X97.427 Y113.034
G1 X98.148 Y112.312 E.01953
G1 X97.983 Y111.92
G1 X96.993 Y112.91 E.02679
G1 X96.828 Y112.517
G1 X97.808 Y111.537 E.02652
G1 X97.404 Y111.383
G1 X96.655 Y112.132 E.02028
G1 X96.476 Y111.753
G1 X96.847 Y111.383 E.01002
M204 S10000
G1 X97.311 Y110.919 F28800
M204 S2000
G1 F12000
G1 X97.752 Y110.477 E.01194
G1 X97.552 Y110.119
G1 X96.753 Y110.919 E.02163
G1 X96.195 Y110.919
G1 X97.33 Y109.784 E.0307
G1 X96.772 Y109.784
G1 X95.637 Y110.919 E.0307
G1 X95.366 Y110.632
G1 X96.214 Y109.784 E.02293
G1 X95.656 Y109.784
G1 X95.156 Y110.284 E.01354
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X95.656 Y109.784 E-.08064
G1 X96.214 Y109.784 E-.06359
G1 X95.694 Y110.304 E-.08376
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.846 I-1.179 J.303 P1  F28800
G1 X99.344 Y124.494 Z3.846
G1 Z3.446
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03199
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.231 J-2.583 E.1146
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.289 Y175.41 E.02466
G2 X112.816 Y171.261 I-3.867 J-6.861 E.11448
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 3.56525
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.238 Y125.628 E-.18287
G1 X113.238 Y125.951 E-.03684
G1 X113.187 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z3.846 I1.169 J-.338 P1  F28800
G1 X111.79 Y121.178 Z3.846
G1 Z3.565
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97935
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90221
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.965 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z3.965
G1 Z3.565
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07295
G3 X113.243 Y111.847 I16.957 J2.883 E.08665
G1 X115.183 Y111.847 E.03994
G1 X114.903 Y112.441 E.01351
G2 X113.551 Y118.791 I14.266 J6.356 E.13466
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J.005 E.50652
G1 X97.896 Y118.791 E1.02946
G2 X96.264 Y111.847 I-15.745 J.036 E.14815
G1 X98.204 Y111.847 E.03994
G3 X99.408 Y115.869 I-15.753 J6.905 E.08665
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.562 Y110.264 I17.504 J2.966 E.1131
G1 X116.558 Y110.264 E.05731
G1 X116.162 Y110.916 E.0146
G2 X113.961 Y118.795 I13.095 J7.906 E.15846
G1 X113.961 Y168.795 E.9567
G3 X103.147 Y176.62 I-8.246 J-.012 E.29758
G1 X103.147 Y176.62 E0
G3 X97.486 Y168.795 I2.581 J-7.827 E.19742
G1 X97.486 Y118.795 E.9567
G2 X95.285 Y110.916 I-15.297 J.026 E.15846
G1 X94.89 Y110.264 E.0146
G1 X97.885 Y110.264 E.05731
G3 X99.816 Y115.822 I-15.573 J8.524 E.1131
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.965 I-1.031 J.646 P1  F28800
G1 X112.349 Y118.272 Z3.965
G1 Z3.565
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X113.153 Y118.272 E.01539
G3 X113.903 Y113.948 I15.716 J.5 E.08425
G1 X112.912 Y113.948 E.01896
G2 X112.447 Y115.916 I16.9 J5.028 E.03872
G1 X112.351 Y118.212 E.04396
G1 X112.769 Y117.869 F28800
; LINE_WIDTH: 0.436434
G1 F15000
G1 X112.805 Y117.308 E.01121
; LINE_WIDTH: 0.462372
G1 X112.842 Y116.747 E.01191
; LINE_WIDTH: 0.48831
G1 X112.874 Y116.403 E.00775
; LINE_WIDTH: 0.557964
G3 X113.187 Y114.706 I11.249 J1.194 E.04462
; LINE_WIDTH: 0.572694
G1 X113.252 Y114.478 E.00629
G1 X114.182 Y112.079 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.62 Y112.517 E.01185
G1 X114.454 Y112.91
G1 X113.624 Y112.079 E.02248
G1 X113.299 Y112.312
G1 X114.301 Y113.315 E.02712
G1 X114.155 Y113.726
G1 X113.142 Y112.713 E.02742
G1 X112.991 Y113.12
G1 X113.602 Y113.731 E.01653
M204 S10000
G1 X115.874 Y110.982 F28800
M204 S2000
G1 F12000
G1 X115.372 Y110.481 E.01357
G1 X114.814 Y110.481
G1 X115.669 Y111.336 E.02314
G1 X115.391 Y111.615
G1 X114.257 Y110.481 E.0307
G1 X113.699 Y110.481
G1 X114.833 Y111.615 E.0307
G1 X114.275 Y111.615
G1 X113.504 Y110.844 E.02088
G1 X113.32 Y111.218
G1 X113.718 Y111.615 E.01075
M204 S10000
M73 P87 R2
G1 X112.841 Y118.672 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X112.209 Y119.304 E.01839
G1 X112.191 Y119.73 E.00879
G1 X111.783 Y119.73 E.00841
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.256 Y119.73 E.00841
G1 X99.238 Y119.304 E.00879
G1 X98.606 Y118.672 E.01839
G1 X99.099 Y118.272 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X99.001 Y115.951 E.04445
G2 X98.535 Y113.948 I-16.397 J2.76 E.03938
G1 X97.551 Y113.948 E.01883
G3 X98.289 Y118.272 I-15.196 J4.82 E.0842
G1 X99.039 Y118.272 E.01434
G1 X98.18 Y114.418 F28800
; LINE_WIDTH: 0.571768
G1 F15000
G3 X98.531 Y115.97 I-14.167 J4.017 E.0422
; LINE_WIDTH: 0.57259
G1 X98.567 Y116.346 E.01
; LINE_WIDTH: 0.531557
G1 X98.604 Y116.721 E.00925
; LINE_WIDTH: 0.474471
G3 X98.673 Y117.806 I-19.805 J1.809 E.02369
G1 X98.439 Y113.072 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.446 Y112.079 E.02685
G1 X96.889 Y112.079
G1 X98.54 Y113.731 E.04469
G1 X97.982 Y113.731
G1 X96.871 Y112.619 E.03008
M204 S10000
G1 X96.735 Y112.059 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.18061
G1 F15000
G1 X96.724 Y112.121 E.00047
; LINE_WIDTH: 0.153929
G1 X96.713 Y112.183 E.00039
; LINE_WIDTH: 0.107508
G2 X96.788 Y112.334 I.36 J-.084 E.00068
; LINE_WIDTH: 0.133627
G1 X96.862 Y112.444 E.0007
; LINE_WIDTH: 0.167423
G1 X96.936 Y112.554 E.00091
G1 X98.262 Y112.586 F28800
; LINE_WIDTH: 0.111404
G1 F15000
G1 X98.144 Y112.411 E.00088
; LINE_WIDTH: 0.160206
G1 X98.026 Y112.235 E.00138
; LINE_WIDTH: 0.209008
G1 X97.908 Y112.059 E.00188
G1 X97.471 Y113.75 F28800
; LINE_WIDTH: 0.275418
G1 F15000
G1 X97.08 Y113.127 E.00892
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.471 Y113.75 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.965 I1.203 J-.187 P1  F28800
G1 X96.964 Y110.481 Z3.965
G1 Z3.565
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.098 Y111.615 E.0307
G1 X97.54 Y111.615
G1 X96.406 Y110.481 E.0307
G1 X95.848 Y110.481
G1 X96.983 Y111.615 E.0307
G1 X96.425 Y111.615
G1 X95.29 Y110.481 E.0307
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X96.425 Y111.615 E-.18293
G1 X96.82 Y111.615 E-.04507
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.965 I-.03 J-1.217 P1  F28800
G1 X96.026 Y111.635 Z3.965
G1 Z3.565
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192239
G1 F15000
G1 X95.921 Y111.493 E.00143
; LINE_WIDTH: 0.154012
G1 X95.815 Y111.348 E.00111
; LINE_WIDTH: 0.116057
G1 X95.7 Y111.198 E.00083
G1 X98.242 Y111.437 F28800
; LINE_WIDTH: 0.242657
G1 F15000
G1 X98.003 Y111.112 E.00425
; LINE_WIDTH: 0.290092
G1 X97.764 Y110.786 E.00518
; LINE_WIDTH: 0.337527
G1 X97.525 Y110.461 E.00611
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.764 Y110.786 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z3.965 I-1.209 J.139 P1  F28800
G1 X99.344 Y124.494 Z3.965
G1 Z3.565
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I5.955 J.017 E.03201
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.231 J-2.583 E.1146
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.289 Y175.41 E.02466
G2 X112.816 Y171.261 I-3.867 J-6.861 E.11448
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 3.6843
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.238 Y125.628 E-.18287
G1 X113.238 Y125.951 E-.03684
G1 X113.187 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z3.965 I1.169 J-.338 P1  F28800
G1 X111.79 Y121.178 Z3.965
G1 Z3.684
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97935
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90221
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.084 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z4.084
G1 Z3.684
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07294
G3 X112.957 Y112.544 I17.566 J3.059 E.07113
G1 X114.86 Y112.544 E.03917
G1 X114.649 Y113.044 E.01118
G2 X113.551 Y118.791 I14.71 J5.789 E.12116
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X96.587 Y112.544 I-15.583 J.003 E.13235
G1 X98.49 Y112.544 E.03917
G3 X99.408 Y115.869 I-16.647 J6.383 E.07113
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X113.204 Y110.96 I17.741 J3.052 E.09809
G1 X116.137 Y110.96 E.05612
G1 X115.844 Y111.466 E.01118
G2 X113.961 Y118.795 I13.326 J7.331 E.14633
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X95.311 Y110.96 I-15.284 J.025 E.15749
G1 X98.245 Y110.96 E.05615
G3 X99.816 Y115.822 I-16.248 J7.932 E.09808
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 X111.783 Y119.73
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X110.648 Y120.865 E.03303
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.665 Y119.73 E.03303
G1 X99.128 Y118.968 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X99.001 Y115.951 E.05779
G2 X98.727 Y114.644 I-12.587 J1.961 E.02555
G1 X97.755 Y114.644 E.01859
G3 X98.303 Y118.968 I-15.642 J4.177 E.08365
G1 X99.068 Y118.968 E.01464
G1 X98.356 Y115.114 F28800
; LINE_WIDTH: 0.571414
G1 F15000
G1 X98.531 Y115.97 E.02314
; LINE_WIDTH: 0.57259
G1 X98.567 Y116.346 E.01
; LINE_WIDTH: 0.531557
G1 X98.604 Y116.721 E.00925
; LINE_WIDTH: 0.490524
G1 X98.654 Y117.409 E.01557
; LINE_WIDTH: 0.441069
G3 X98.702 Y118.502 I-22.385 J1.528 E.02205
G1 X98.265 Y114.427 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.727 Y113.965 E.01252
G1 X98.595 Y113.539
G1 X97.707 Y114.427 E.02403
G1 X97.429 Y114.147
G1 X98.457 Y113.12 E.02781
G1 X98.242 Y112.776
G1 X97.292 Y113.726 E.02571
G1 X97.146 Y113.315
G1 X97.685 Y112.776 E.01458
M204 S10000
G1 X98.149 Y112.312 F28800
M204 S2000
G1 F12000
G1 X98.472 Y111.988 E.00876
G1 X98.305 Y111.597
G1 X97.591 Y112.312 E.01934
G1 X97.033 Y112.312
G1 X98.127 Y111.218 E.0296
G1 X97.61 Y111.177
G1 X96.475 Y112.312 E.0307
G1 X96.157 Y112.072
M73 P87 R1
G1 X97.052 Y111.177 E.0242
G1 X96.494 Y111.177
G1 X95.971 Y111.701 E.01417
M204 S10000
G1 X99.344 Y124.494 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03198
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.231 J-2.583 E.1146
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.289 Y175.41 E.02466
G2 X112.816 Y171.261 I-3.867 J-6.861 E.11448
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
G1 X112.32 Y118.965 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X113.145 Y118.961 E.01579
G3 X113.699 Y114.644 I15.748 J-.172 E.08354
G1 X112.72 Y114.644 E.01872
G2 X112.447 Y115.916 I13.58 J3.579 E.0249
G1 X112.322 Y118.905 E.05724
G1 X112.744 Y118.556 F28800
; LINE_WIDTH: 0.444621
G1 F15000
G3 X112.842 Y116.747 I29.848 J.71 E.03685
; LINE_WIDTH: 0.48831
G1 X112.874 Y116.403 E.00775
; LINE_WIDTH: 0.54813
G3 X113.029 Y115.379 I6.107 J.402 E.02629
; LINE_WIDTH: 0.572708
G1 X113.079 Y115.175 E.00558
G1 X114.22 Y113.533 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.326 Y114.427 E.02419
G1 X112.768 Y114.427
G1 X114.42 Y112.776 E.04469
G1 X113.862 Y112.776
G1 X112.738 Y113.9 E.03041
M204 S10000
G1 X114.07 Y113.984 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.176797
G1 F15000
M73 P88 R1
G1 X113.793 Y114.447 E.00396
G1 X114.884 Y112.312 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.457 Y111.739 E.01552
G1 X115.46 Y111.177
G1 X114.326 Y112.312 E.0307
G1 X113.768 Y112.312
G1 X114.903 Y111.177 E.0307
G1 X114.345 Y111.177
G1 X113.21 Y112.312 E.0307
G1 X112.974 Y111.99
G1 X113.787 Y111.177 E.02199
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.80336
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.974 Y111.99 E-.13101
G1 X113.21 Y112.312 E-.0455
G1 X113.53 Y111.993 E-.05149
; WIPE_END
G1 E-.012 F1800

G17
G3 Z4.084 I-1.196 J-.226 P1  F28800
G1 X111.79 Y121.178 Z4.084
G1 Z3.803
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97935
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90221
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.203 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z4.203
G1 Z3.803
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07294
G3 X112.706 Y113.241 I16.807 J2.86 E.05589
G1 X114.576 Y113.241 E.03852
G1 X114.421 Y113.658 E.00917
G2 X113.551 Y118.791 I14.748 J5.139 E.1077
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X96.871 Y113.241 I-15.728 J.034 E.11685
G1 X98.742 Y113.241 E.03852
G3 X99.408 Y115.869 I-15.983 J5.449 E.05589
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X112.88 Y111.657 I17.863 J3.084 E.08339
G1 X115.745 Y111.657 E.05481
G1 X115.549 Y112.031 E.00808
G2 X113.961 Y118.795 I13.745 J6.795 E.13411
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X95.703 Y111.657 I-15.177 J0 E.1422
G1 X98.567 Y111.657 E.05481
G3 X99.816 Y115.822 I-16.134 J7.105 E.0834
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 X111.717 Y119.796
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X110.648 Y120.865 E.03111
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X99.731 Y119.796 E.03111
G1 X99.18 Y119.665 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X99.12 Y118.772 E.01713
G1 X99 Y115.917 E.05468
G1 X98.887 Y115.341 E.01123
G1 X97.926 Y115.341 E.01839
G3 X98.305 Y119.665 I-17.536 J3.716 E.08326
G1 X99.12 Y119.665 E.01558
G1 X98.5 Y115.811 F28800
; LINE_WIDTH: 0.571598
G1 F15000
G1 X98.552 Y116.266 E.01212
; LINE_WIDTH: 0.531061
G1 X98.604 Y116.721 E.01122
; LINE_WIDTH: 0.490524
G1 X98.654 Y117.409 E.01557
; LINE_WIDTH: 0.440615
G3 X98.721 Y119.188 I-44.646 J2.564 E.03585
G1 X98.917 Y114.666 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X97.724 Y113.473 E.03228
G1 X97.212 Y113.518
G1 X98.818 Y115.124 E.04346
G1 X98.26 Y115.124
G1 X97.49 Y114.354 E.02083
M204 S10000
G1 X98.995 Y115.144 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0884952
G1 F15000
G1 X98.978 Y114.964 E.00055
G1 X98.849 Y114.733 E.00081
G1 X97.817 Y115.144 F28800
; LINE_WIDTH: 0.105657
G1 F15000
G1 X97.606 Y114.772 E.00166
G1 X97.557 Y114.287 F28800
; LINE_WIDTH: 0.180363
G1 F15000
G2 X97.372 Y113.978 I-10.624 J6.149 E.0027
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.557 Y114.287 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.203 I1.211 J.121 P1  F28800
G1 X97.799 Y111.874 Z4.203
G1 Z3.803
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.83 Y112.904 E.02788
G1 X98.376 Y113.009
G1 X97.241 Y111.874 E.0307
G1 X96.683 Y111.874
G1 X97.818 Y113.009 E.0307
G1 X97.26 Y113.009
G1 X96.126 Y111.874 E.0307
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.26 Y113.009 E-.18293
G1 X97.656 Y113.009 E-.04507
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.203 I-.027 J-1.217 P1  F28800
G1 X96.752 Y113.028 Z4.203
G1 Z3.803
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.311499
G1 F15000
G1 X96.664 Y112.898 E.00218
; LINE_WIDTH: 0.267534
G1 X96.576 Y112.767 E.00185
; LINE_WIDTH: 0.223568
G1 X96.489 Y112.637 E.00151
; LINE_WIDTH: 0.154665
G2 X96.284 Y112.336 I-14.632 J9.74 E.00228
G1 X98.652 Y112.419 F28800
; LINE_WIDTH: 0.106259
G1 F15000
G1 X98.557 Y112.278 E.00067
; LINE_WIDTH: 0.147526
G1 X98.462 Y112.137 E.00101
; LINE_WIDTH: 0.188793
G1 X98.367 Y111.995 E.00135
; LINE_WIDTH: 0.23006
G1 X98.272 Y111.854 E.00169
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.367 Y111.995 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.203 I-1.213 J.095 P1  F28800
G1 X99.344 Y124.494 Z4.203
G1 Z3.803
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03198
G1 X98.63 Y171.263 E.02652
G2 X102.16 Y175.409 I7.231 J-2.583 E.1146
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.798 E.11568
G1 X109.287 Y175.409 E.0246
G2 X112.816 Y171.261 I-3.845 J-6.847 E.11449
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
G1 X112.268 Y119.665 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X113.142 Y119.665 E.01673
G3 X113.528 Y115.341 I17.586 J-.61 E.08328
G1 X112.56 Y115.341 E.01852
G1 X112.447 Y115.917 E.01123
G1 X112.292 Y119.614 E.0708
G1 X112.725 Y119.248 F28800
; LINE_WIDTH: 0.452386
G1 F15000
G3 X112.791 Y117.434 I36.427 J.424 E.03759
; LINE_WIDTH: 0.445554
G1 X112.842 Y116.747 E.01404
; LINE_WIDTH: 0.48831
G1 X112.874 Y116.403 E.00775
; LINE_WIDTH: 0.524198
G1 X112.906 Y116.059 E.00835
; LINE_WIDTH: 0.560086
G1 X112.938 Y115.872 E.00492
G1 X113.344 Y113.473 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.018 Y114.147 E.01826
G1 X113.894 Y114.581
G1 X112.852 Y113.539 E.02818
G1 X112.72 Y113.965
G1 X113.778 Y115.023 E.02863
G1 X113.321 Y115.124
G1 X112.598 Y114.401 E.01957
M204 S10000
G1 X114.268 Y113.453 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.226173
G1 F15000
G1 X113.879 Y113.729 E.00464
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.268 Y113.453 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.203 I1.2 J.202 P1  F28800
G1 X114.534 Y111.874 Z4.203
G1 Z3.803
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X115.111 Y112.451 E.01562
G1 X114.944 Y112.841
G1 X113.976 Y111.874 E.02618
G1 X113.419 Y111.874
G1 X114.553 Y113.009 E.0307
G1 X113.995 Y113.009
G1 X112.975 Y111.989 E.0276
G1 X112.812 Y112.383
G1 X113.437 Y113.009 E.01693
M204 S10000
G1 X114.925 Y112.887 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0814004
G1 F15000
G1 X114.858 Y112.986 E.00032
G1 X114.824 Y113.001 E.0001
G1 X114.561 Y113.001 E.00071
; CHANGE_LAYER
; Z_HEIGHT: 3.92242
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.824 Y113.001 E-.14268
G1 X114.858 Y112.986 E-.0203
G1 X114.925 Y112.887 E-.06502
; WIPE_END
G1 E-.012 F1800

G17
G3 Z4.203 I-1.138 J-.43 P1  F28800
G1 X111.79 Y121.178 Z4.203
G1 Z3.922
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97935
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90221
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.322 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z4.322
G1 Z3.922
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07294
G3 X112.487 Y113.937 I18.459 J3.255 E.04084
G1 X114.33 Y113.937 E.03796
G2 X113.551 Y118.791 I14.741 J4.855 E.10164
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J.005 E.50652
G1 X97.896 Y118.791 E1.02946
G2 X97.117 Y113.937 I-15.52 J.001 E.10164
G1 X98.961 Y113.937 E.03796
G3 X99.408 Y115.869 I-18.012 J5.186 E.04084
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X112.592 Y112.354 I17.72 J3.04 E.06897
G1 X115.397 Y112.354 E.05367
G1 X115.277 Y112.608 E.00537
G2 X113.961 Y118.795 I13.893 J6.19 E.12194
G1 X113.961 Y168.795 E.9567
G3 X103.172 Y176.628 I-8.247 J-.012 E.29708
G1 X103.172 Y176.628 E0
G3 X97.486 Y168.795 I2.557 J-7.835 E.19793
G1 X97.486 Y118.795 E.9567
G2 X96.05 Y112.354 I-15.274 J.024 E.12729
G1 X98.855 Y112.354 E.05367
G3 X99.816 Y115.822 I-17.014 J6.579 E.06897
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.322 I-1.131 J-.449 P1  F28800
G1 X110.251 Y120.311 Z4.322
M73 P89 R1
G1 Z3.922
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.490316
G1 F15000
G1 X110.365 Y120.326 E.0026
G1 X112.094 Y120.326 E.03898
G1 X112.39 Y120.344 E.00668
; LINE_WIDTH: 0.421072
G2 X113.142 Y120.362 I.524 J-6.319 E.01444
G3 X113.198 Y117.46 I32.055 J-.835 E.05571
G3 X113.39 Y116.038 I15.119 J1.314 E.02754
G1 X112.442 Y116.038 E.01817
G1 X112.291 Y119.638 E.06913
G1 X112.273 Y119.713 E.00148
; LINE_WIDTH: 0.42
G1 X112.184 Y119.787 E.00223
; LINE_WIDTH: 0.488931
G1 X112.094 Y119.862 E.00261
G1 X109.821 Y119.862 E.05111
G1 X110.21 Y120.267 E.01263
G1 X112.686 Y119.906 F28800
; LINE_WIDTH: 0.542954
G1 F15000
G1 X112.71 Y119.347 E.01403
; LINE_WIDTH: 0.494378
G1 X112.735 Y118.789 E.01271
; LINE_WIDTH: 0.43862
G3 X112.791 Y117.434 I32.769 J.694 E.02717
; LINE_WIDTH: 0.445554
G1 X112.842 Y116.747 E.01404
; LINE_WIDTH: 0.48831
G1 X112.862 Y116.541 E.00464
G1 X113.757 Y115.112 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.048 Y115.821 E.01918
G1 X112.491 Y115.821
G1 X113.969 Y114.343 E.04
G1 X113.584 Y114.169
G1 X112.368 Y115.385 E.03291
G1 X112.53 Y114.665
G1 X113.026 Y114.169 E.01343
M204 S10000
G1 X112.351 Y115.369 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0897013
G1 F15000
G1 X112.314 Y115.84 E.00147
G1 X113.843 Y114.771 F28800
; LINE_WIDTH: 0.103662
G1 F15000
G1 X113.687 Y115.042 E.00118
G1 X114.048 Y113.705 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.967 Y112.787 E.02486
G1 X114.625 Y112.571
G1 X113.49 Y113.705 E.0307
G1 X112.932 Y113.705
G1 X114.067 Y112.571 E.0307
G1 X113.509 Y112.571
G1 X112.375 Y113.705 E.0307
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.509 Y112.571 E-.18293
G1 X113.905 Y112.571 E-.04507
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.322 I-1.136 J-.437 P1  F28800
G1 X110.751 Y120.762 Z4.322
G1 Z3.922
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X110.648 Y120.865 E.00298
G1 X108.475 Y120.865 E.04475
G1 X107.341 Y119.73 E.03303
G1 X104.107 Y119.73 E.06658
G1 X102.972 Y120.865 E.03303
G1 X100.799 Y120.865 E.04475
G1 X100.697 Y120.762 E.00298
G1 X101.159 Y120.326 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.490317
G1 F15000
G1 X101.627 Y119.862 E.01486
G1 X99.353 Y119.862 E.05126
; LINE_WIDTH: 0.490316
G1 X99.256 Y119.763 E.00313
; LINE_WIDTH: 0.420539
G1 X99.159 Y119.663 E.00266
G3 X99.005 Y116.038 I947.429 J-42.016 E.06953
G1 X98.065 Y116.038 E.01802
G3 X98.305 Y119.655 I-18.265 J3.033 E.06958
G1 X98.305 Y120.362 E.01353
; LINE_WIDTH: 0.42
G1 X98.829 Y120.344 E.01003
; LINE_WIDTH: 0.482198
G3 X101.099 Y120.326 I1.397 J33.812 E.05029
G1 X98.581 Y116.48 F28800
; LINE_WIDTH: 0.51583
G1 F15000
G1 X98.618 Y116.944 E.01108
; LINE_WIDTH: 0.449853
G3 X98.712 Y118.776 I-31.49 J2.548 E.03776
; LINE_WIDTH: 0.445396
G1 X98.731 Y119.655 E.01791
; LINE_WIDTH: 0.482134
G1 X98.742 Y119.751 E.00213
; LINE_WIDTH: 0.51254
G1 X98.754 Y119.846 E.00227
G1 X98.545 Y115.821 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.063 Y115.302 E.01404
G1 X98.96 Y114.848
G1 X97.987 Y115.821 E.02633
G1 X97.775 Y115.474
G1 X98.849 Y114.401 E.02906
G1 X98.523 Y114.169
G1 X97.669 Y115.023 E.02309
G1 X97.55 Y114.584
G1 X97.965 Y114.169 E.01122
M204 S10000
G1 X98.429 Y113.705 F28800
M204 S2000
G1 F12000
G1 X98.932 Y113.202 E.01361
G1 X98.786 Y112.79
G1 X97.871 Y113.705 E.02478
G1 X97.313 Y113.705
G1 X98.448 Y112.571 E.0307
G1 X97.89 Y112.571
G1 X96.816 Y113.645 E.02906
G1 X96.665 Y113.238
G1 X97.332 Y112.571 E.01806
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X96.665 Y113.238 E-.10761
G1 X96.816 Y113.645 E-.04945
G1 X97.256 Y113.205 E-.07094
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.322 I.351 J1.165 P1  F28800
G1 X98.778 Y112.746 Z4.322
G1 Z3.922
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.135489
G1 F15000
G1 X98.68 Y112.606 E.00091
G2 X98.521 Y112.644 I-.028 J.235 E.00089
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.606 Y112.609 E-.06205
G1 X98.68 Y112.606 E-.05027
G1 X98.778 Y112.746 E-.11568
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.322 I-1.216 J.059 P1  F28800
G1 X99.344 Y124.494 Z4.322
G1 Z3.922
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X98.209 Y125.628 E.03303
G1 X98.209 Y125.951 E.00665
G1 X99.344 Y127.085 E.03303
G1 X99.344 Y132.17 E.10468
G1 X98.209 Y133.304 E.03303
G1 X98.209 Y133.627 E.00665
G1 X99.344 Y134.761 E.03303
G1 X99.344 Y139.846 E.10468
G1 X98.209 Y140.98 E.03303
G1 X98.209 Y141.303 E.00665
G1 X99.344 Y142.437 E.03303
G1 X99.344 Y147.522 E.10468
G1 X98.209 Y148.656 E.03303
G1 X98.209 Y148.979 E.00665
G1 X99.344 Y150.113 E.03303
G1 X99.344 Y155.198 E.10468
G1 X98.209 Y156.332 E.03303
G1 X98.209 Y156.655 E.00665
G1 X99.344 Y157.789 E.03303
G1 X99.344 Y162.873 E.10468
G1 X98.209 Y164.008 E.03303
G1 X98.209 Y164.331 E.00665
G1 X99.344 Y165.465 E.03303
G1 X99.344 Y168.815 E.06896
G2 X99.541 Y170.352 I6.753 J-.085 E.03198
G1 X98.632 Y171.261 E.02647
G2 X102.16 Y175.409 I7.217 J-2.565 E.11462
G1 X103.002 Y174.567 E.0245
G2 X108.442 Y174.564 I2.716 J-5.797 E.11568
G1 X109.289 Y175.41 E.02466
G2 X112.816 Y171.261 I-3.709 J-6.726 E.11461
G1 X111.908 Y170.354 E.02643
G2 X112.104 Y168.811 I-6.769 J-1.643 E.03208
G1 X112.104 Y165.465 E.06889
G1 X113.238 Y164.331 E.03303
G1 X113.238 Y164.008 E.00665
G1 X112.104 Y162.873 E.03303
G1 X112.104 Y157.789 E.10468
G1 X113.238 Y156.655 E.03303
G1 X113.238 Y156.332 E.00665
G1 X112.104 Y155.198 E.03303
G1 X112.104 Y150.113 E.10468
G1 X113.238 Y148.979 E.03303
G1 X113.238 Y148.656 E.00665
G1 X112.104 Y147.522 E.03303
G1 X112.104 Y142.437 E.10468
G1 X113.238 Y141.303 E.03303
G1 X113.238 Y140.98 E.00665
G1 X112.104 Y139.846 E.03303
G1 X112.104 Y134.761 E.10468
G1 X113.238 Y133.627 E.03303
G1 X113.238 Y133.304 E.00665
G1 X112.104 Y132.17 E.03303
G1 X112.104 Y127.085 E.10468
G1 X113.238 Y125.951 E.03303
G1 X113.238 Y125.628 E.00665
G1 X112.104 Y124.494 E.03303
; CHANGE_LAYER
; Z_HEIGHT: 4.04147
; LAYER_HEIGHT: 0.119056
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.238 Y125.628 E-.18287
G1 X113.238 Y125.951 E-.03684
G1 X113.187 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800

G17
G3 Z4.322 I1.169 J-.338 P1  F28800
G1 X111.79 Y121.178 Z4.322
G1 Z4.041
G1 E.8 F1800
; FEATURE: Inner wall
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97935
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90221
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.441 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z4.441
G1 Z4.041
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07294
G3 X112.299 Y114.634 I14.846 J2.476 E.02599
G1 X114.12 Y114.634 E.03749
G1 X114.043 Y114.911 E.00592
G2 X113.551 Y118.791 I15.124 J3.886 E.08074
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X97.327 Y114.634 I-15.788 J.042 E.08665
G1 X99.148 Y114.634 E.03749
G3 X99.408 Y115.869 I-14.586 J3.711 E.02599
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X112.338 Y113.05 I17.148 J2.896 E.05479
G1 X115.091 Y113.05 E.05267
G2 X113.961 Y118.795 I14.036 J5.745 E.11274
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X96.356 Y113.05 I-15.166 J0 E.11274
G1 X99.11 Y113.05 E.0527
G1 X99.307 Y113.655 E.01217
G3 X99.816 Y115.822 I-19.147 J5.638 E.04261
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.441 I-1.118 J-.48 P1  F28800
G1 X109.947 Y120.769 Z4.441
G1 Z4.041
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X112.003 Y120.769 E.03932
G1 X112.158 Y120.844 E.0033
G1 X112.2 Y121.055 E.00412
G1 X113.142 Y121.055 E.01803
G3 X113.156 Y118.13 I70.043 J-1.133 E.05597
G3 X113.283 Y116.734 I15.36 J.695 E.02683
G1 X112.413 Y116.734 E.01664
G1 X112.291 Y119.638 E.0556
G1 X112.197 Y119.798 E.00356
G1 X112.003 Y119.827 E.00375
G1 X109.044 Y119.827 E.05661
G1 X109.906 Y120.725 E.02383
G1 X112.712 Y119.738 F28800
; LINE_WIDTH: 0.49103
G1 F15000
G1 X112.735 Y118.789 E.02143
; LINE_WIDTH: 0.4396
G3 X112.809 Y117.212 I33.096 J.765 E.03172
G1 X110.148 Y120.298 F28800
; LINE_WIDTH: 0.573302
G1 F15000
G1 X112.047 Y120.299 E.05045
G1 X112.499 Y120.645 F28800
; LINE_WIDTH: 0.463182
G1 F15000
G1 X112.732 Y120.645 E.00495
G1 X112.712 Y119.738 E.01928
G1 X112.409 Y120.148 E.01083
; LINE_WIDTH: 0.450735
G1 X112.346 Y120.194 E.00161
; LINE_WIDTH: 0.483358
G1 X112.284 Y120.24 E.00173
; LINE_WIDTH: 0.515981
G1 X112.195 Y120.271 E.00223
; LINE_WIDTH: 0.57063
G1 X112.107 Y120.302 E.00247
G1 X112.274 Y120.387 E.00495
; LINE_WIDTH: 0.515981
G1 X112.367 Y120.493 E.00337
; LINE_WIDTH: 0.483358
G1 X112.46 Y120.6 E.00314
G1 X112.104 Y124.494 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.238 Y125.628 E.03303
G1 X113.238 Y125.951 E.00665
G1 X112.104 Y127.085 E.03303
M73 P90 R1
G1 X112.104 Y132.17 E.10468
G1 X113.238 Y133.304 E.03303
G1 X113.238 Y133.627 E.00665
G1 X112.104 Y134.761 E.03303
G1 X112.104 Y139.846 E.10468
G1 X113.238 Y140.98 E.03303
G1 X113.238 Y141.303 E.00665
G1 X112.104 Y142.437 E.03303
G1 X112.104 Y147.522 E.10468
G1 X113.238 Y148.656 E.03303
G1 X113.238 Y148.979 E.00665
G1 X112.104 Y150.113 E.03303
G1 X112.104 Y155.198 E.10468
G1 X113.238 Y156.332 E.03303
G1 X113.238 Y156.655 E.00665
G1 X112.104 Y157.789 E.03303
G1 X112.104 Y162.873 E.10468
G1 X113.238 Y164.008 E.03303
G1 X113.238 Y164.331 E.00665
G1 X112.104 Y165.465 E.03303
G1 X112.104 Y168.811 E.06889
G3 X111.908 Y170.354 I-6.965 J-.101 E.03208
G1 X112.816 Y171.261 E.02643
G3 X109.289 Y175.41 I-7.394 J-2.712 E.11448
G1 X108.442 Y174.564 E.02466
G3 X103.002 Y174.567 I-2.724 J-5.795 E.11568
G1 X102.16 Y175.409 E.0245
G3 X98.63 Y171.263 I3.701 J-6.728 E.1146
G1 X99.541 Y170.352 E.02652
G3 X99.344 Y168.815 I6.556 J-1.623 E.03198
G1 X99.344 Y165.465 E.06896
G1 X98.209 Y164.331 E.03303
G1 X98.209 Y164.008 E.00665
G1 X99.344 Y162.873 E.03303
G1 X99.344 Y157.789 E.10468
G1 X98.209 Y156.655 E.03303
G1 X98.209 Y156.332 E.00665
G1 X99.344 Y155.198 E.03303
G1 X99.344 Y150.113 E.10468
G1 X98.209 Y148.979 E.03303
G1 X98.209 Y148.656 E.00665
G1 X99.344 Y147.522 E.03303
G1 X99.344 Y142.437 E.10468
G1 X98.209 Y141.303 E.03303
G1 X98.209 Y140.98 E.00665
G1 X99.344 Y139.846 E.03303
G1 X99.344 Y134.761 E.10468
G1 X98.209 Y133.627 E.03303
G1 X98.209 Y133.304 E.00665
G1 X99.344 Y132.17 E.03303
G1 X99.344 Y127.085 E.10468
G1 X98.209 Y125.951 E.03303
G1 X98.209 Y125.628 E.00665
G1 X99.344 Y124.494 E.03303
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.209 Y125.628 E-.18287
G1 X98.209 Y125.951 E-.03684
G1 X98.261 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.441 I1.035 J.64 P1  F28800
G1 X101.5 Y120.769 Z4.441
G1 Z4.041
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X102.403 Y119.827 E.02498
G1 X99.353 Y119.827 E.05837
G1 X99.251 Y119.798 E.00203
G1 X99.156 Y119.638 E.00356
G1 X99.034 Y116.734 E.0556
G1 X98.171 Y116.734 E.01651
G3 X98.305 Y119.655 I-22.278 J2.487 E.05599
G1 X98.305 Y121.055 E.02678
G1 X99.248 Y121.055 E.01803
G1 X99.29 Y120.844 E.00412
G1 X99.445 Y120.769 E.0033
G1 X101.44 Y120.769 E.03817
G1 X99.34 Y120.302 F28800
; LINE_WIDTH: 0.573756
G1 F15000
G1 X101.239 Y120.298 E.05049
G1 X98.635 Y117.15 F28800
; LINE_WIDTH: 0.449851
G1 F15000
G3 X98.712 Y118.776 I-30.533 J2.261 E.03351
; LINE_WIDTH: 0.446308
G2 X98.732 Y119.678 I13.699 J.151 E.01841
G1 X98.948 Y120.645 F28800
; LINE_WIDTH: 0.450733
G1 F15000
G1 X99.061 Y120.516 E.00354
; LINE_WIDTH: 0.483356
G1 X99.174 Y120.387 E.00381
; LINE_WIDTH: 0.51598
G1 X99.257 Y120.344 E.00223
; LINE_WIDTH: 0.57063
G1 X99.34 Y120.302 E.00247
G1 X99.164 Y120.24 E.00495
; LINE_WIDTH: 0.51598
G1 X99.101 Y120.194 E.00185
; LINE_WIDTH: 0.466557
G1 X99.038 Y120.148 E.00167
G1 X98.735 Y119.738 E.01091
G2 X98.715 Y120.645 I13.337 J.75 E.01943
G1 X98.888 Y120.645 E.00371
G1 X102.972 Y120.865 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X107.341 Y119.73 E-.18287
G1 X106.945 Y119.73 E-.04513
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.441 I.757 J.953 P1  F28800
G1 X113.063 Y114.866 Z4.441
G1 Z4.041
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.672 Y115.475 E.01647
G1 X113.582 Y115.942
G1 X112.506 Y114.866 E.02912
G1 X112.384 Y115.302
G1 X113.502 Y116.42 E.03026
G1 X113.041 Y116.517
G1 X112.295 Y115.771 E.02021
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.041 Y116.517 E-.12039
G1 X113.502 Y116.42 E-.05368
G1 X113.167 Y116.086 E-.05393
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.441 I1.136 J.438 P1  F28800
G1 X114.254 Y113.267 Z4.441
G1 Z4.041
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X114.631 Y113.645 E.01021
G1 X114.492 Y114.063
G1 X113.696 Y113.267 E.02153
G1 X113.138 Y113.267
G1 X114.273 Y114.402 E.0307
G1 X113.715 Y114.402
G1 X112.581 Y113.267 E.0307
G1 X112.379 Y113.624
G1 X113.157 Y114.402 E.02106
G1 X112.599 Y114.402
G1 X112.254 Y114.056 E.00936
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.599 Y114.402 E-.05575
G1 X113.157 Y114.402 E-.06359
G1 X112.483 Y113.728 E-.10866
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.441 I-.001 J-1.217 P1  F28800
G1 X99.105 Y113.737 Z4.441
G1 Z4.041
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X98.635 Y113.267 E.01272
G1 X98.077 Y113.267
G1 X99.211 Y114.402 E.0307
G1 X98.654 Y114.402
G1 X97.519 Y113.267 E.0307
G1 X96.961 Y113.267
G1 X98.096 Y114.402 E.0307
G1 X97.538 Y114.402
G1 X96.837 Y113.701 E.01897
M204 S10000
G1 X96.791 Y113.248 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.198781
G1 F15000
G1 X96.768 Y113.353 E.0009
; LINE_WIDTH: 0.178211
G1 X96.822 Y113.716 E.00272
G1 X98.56 Y114.866 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.079 Y115.386 E.01406
G1 X99.183 Y116.047
G1 X98.002 Y114.866 E.03196
G1 X97.683 Y115.105
G1 X99.095 Y116.517 E.03821
G1 X98.538 Y116.517
G1 X97.843 Y115.823 E.0188
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.16053
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.538 Y116.517 E-.11201
G1 X99.095 Y116.517 E-.06359
G1 X98.77 Y116.192 E-.0524
; WIPE_END
G1 E-.012 F1800

G17
G3 Z4.441 I-.435 J1.136 P1  F28800
G1 X111.79 Y121.178 Z4.441
G1 Z4.161
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97935
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90221
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.561 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z4.561
G1 Z4.161
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.04 Y115.869 E.07294
G1 X112.142 Y115.331 E.01128
G1 X113.944 Y115.331 E.0371
G2 X113.551 Y118.791 I15.046 J3.46 E.07186
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X97.503 Y115.331 I-15.439 J-.001 E.07186
G1 X99.305 Y115.331 E.0371
G1 X99.408 Y115.869 E.01128
G1 X99.557 Y119.417 E.07312
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X112.117 Y113.747 I18.593 J3.253 E.04079
G1 X114.825 Y113.747 E.05181
G1 X114.808 Y113.793 E.00093
G2 X113.961 Y118.795 I14.363 J5.005 E.09754
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X96.622 Y113.747 I-15.408 J.039 E.09846
G1 X99.33 Y113.747 E.05182
G3 X99.816 Y115.822 I-18.108 J5.327 E.04079
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.561 I-1.039 J-.634 P1  F28800
G1 X109.265 Y120.769 Z4.561
G1 Z4.161
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X112.003 Y120.769 E.05238
G1 X112.127 Y120.813 E.00253
G1 X112.2 Y120.966 E.00324
G1 X112.2 Y121.737 E.01475
G1 X113.142 Y121.737 E.01803
G1 X113.142 Y118.789 E.05641
G3 X113.207 Y117.431 I15.405 J.06 E.02602
G1 X112.384 Y117.431 E.01575
G1 X112.291 Y119.638 E.04226
G1 X112.197 Y119.798 E.00356
G1 X112.003 Y119.827 E.00375
G1 X108.362 Y119.827 E.06967
G1 X109.224 Y120.725 E.02383
G1 X112.712 Y119.738 F28800
; LINE_WIDTH: 0.49103
G1 F15000
G1 X112.735 Y118.789 E.02143
; LINE_WIDTH: 0.442214
G3 X112.768 Y117.895 I17.773 J.223 E.01808
G1 X109.466 Y120.298 F28800
; LINE_WIDTH: 0.5733
G1 F15000
G1 X112.047 Y120.299 E.06857
G1 X112.671 Y121.266 F28800
; LINE_WIDTH: 0.5733
G1 F15000
G1 X112.671 Y121.026 E.00637
G1 X112.671 Y120.966 F28800
G1 F15000
G1 X112.691 Y120.754 E.00566
; LINE_WIDTH: 0.532445
G1 X112.712 Y120.542 E.00524
; LINE_WIDTH: 0.472971
G1 X112.732 Y120.33 E.00462
G1 X112.712 Y119.738 E.01286
G1 X112.409 Y120.148 E.01107
; LINE_WIDTH: 0.450735
G1 X112.346 Y120.194 E.00161
; LINE_WIDTH: 0.483358
G1 X112.284 Y120.24 E.00173
; LINE_WIDTH: 0.515981
G1 X112.195 Y120.271 E.00223
; LINE_WIDTH: 0.57063
G1 X112.107 Y120.302 E.00247
G1 X112.274 Y120.387 E.00495
; LINE_WIDTH: 0.515981
G1 X112.33 Y120.441 E.00185
; LINE_WIDTH: 0.483358
G1 X112.385 Y120.495 E.00173
; LINE_WIDTH: 0.450735
G1 X112.47 Y120.635 E.00337
; LINE_WIDTH: 0.49159
G1 X112.555 Y120.775 E.0037
; LINE_WIDTH: 0.532445
G1 X112.64 Y120.915 E.00402
G1 X112.104 Y124.494 F28800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X113.238 Y125.628 E.03303
G1 X113.238 Y125.951 E.00665
G1 X112.104 Y127.085 E.03303
G1 X112.104 Y132.17 E.10468
G1 X113.238 Y133.304 E.03303
G1 X113.238 Y133.627 E.00665
G1 X112.104 Y134.761 E.03303
G1 X112.104 Y139.846 E.10468
G1 X113.238 Y140.98 E.03303
G1 X113.238 Y141.303 E.00665
G1 X112.104 Y142.437 E.03303
G1 X112.104 Y147.522 E.10468
G1 X113.238 Y148.656 E.03303
G1 X113.238 Y148.979 E.00665
G1 X112.104 Y150.113 E.03303
G1 X112.104 Y155.198 E.10468
G1 X113.238 Y156.332 E.03303
G1 X113.238 Y156.655 E.00665
G1 X112.104 Y157.789 E.03303
G1 X112.104 Y162.873 E.10468
G1 X113.238 Y164.008 E.03303
G1 X113.238 Y164.331 E.00665
G1 X112.104 Y165.465 E.03303
G1 X112.104 Y168.811 E.06889
G3 X111.908 Y170.354 I-6.965 J-.101 E.03208
G1 X112.816 Y171.261 E.02643
G3 X109.287 Y175.409 I-7.368 J-2.695 E.1145
G1 X108.442 Y174.564 E.0246
G3 X103.002 Y174.567 I-2.724 J-5.794 E.11568
G1 X102.16 Y175.409 E.0245
G3 X98.632 Y171.261 I3.688 J-6.713 E.11462
G1 X99.541 Y170.352 E.02647
G3 X99.344 Y168.815 I6.556 J-1.623 E.03199
G1 X99.344 Y165.465 E.06896
G1 X98.209 Y164.331 E.03303
G1 X98.209 Y164.008 E.00665
G1 X99.344 Y162.873 E.03303
G1 X99.344 Y157.789 E.10468
G1 X98.209 Y156.655 E.03303
G1 X98.209 Y156.332 E.00665
G1 X99.344 Y155.198 E.03303
G1 X99.344 Y150.113 E.10468
G1 X98.209 Y148.979 E.03303
G1 X98.209 Y148.656 E.00665
G1 X99.344 Y147.522 E.03303
G1 X99.344 Y142.437 E.10468
G1 X98.209 Y141.303 E.03303
G1 X98.209 Y140.98 E.00665
G1 X99.344 Y139.846 E.03303
G1 X99.344 Y134.761 E.10468
G1 X98.209 Y133.627 E.03303
G1 X98.209 Y133.304 E.00665
G1 X99.344 Y132.17 E.03303
G1 X99.344 Y127.085 E.10468
G1 X98.209 Y125.951 E.03303
G1 X98.209 Y125.628 E.00665
G1 X99.344 Y124.494 E.03303
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.209 Y125.628 E-.18287
G1 X98.209 Y125.951 E-.03684
G1 X98.261 Y126.003 E-.00829
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.561 I.974 J.73 P1  F28800
G1 X102.182 Y120.769 Z4.561
G1 Z4.161
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X103.086 Y119.827 E.02498
G1 X99.353 Y119.827 E.07142
G1 X99.251 Y119.798 E.00203
G1 X99.156 Y119.638 E.00356
G1 X99.063 Y117.431 E.04226
G1 X98.247 Y117.431 E.01563
G3 X98.305 Y119.655 I-24.943 J1.771 E.04259
G1 X98.305 Y121.737 E.03983
G1 X99.248 Y121.737 E.01803
G1 X99.248 Y120.966 E.01475
M73 P91 R1
G1 X99.361 Y120.787 E.00405
G1 X99.445 Y120.769 E.00164
G1 X102.122 Y120.769 E.05123
G1 X99.34 Y120.302 F28800
; LINE_WIDTH: 0.573636
G1 F15000
G1 X101.921 Y120.298 E.06862
G1 X98.677 Y117.834 F28800
; LINE_WIDTH: 0.441133
G1 F15000
G3 X98.731 Y119.655 I-55.082 J2.542 E.03674
; LINE_WIDTH: 0.482134
G1 X98.732 Y119.678 E.0005
G1 X98.776 Y121.266 F28800
; LINE_WIDTH: 0.573302
G1 F15000
G1 X98.776 Y121.026 E.00637
G1 X98.776 Y120.966 F28800
G1 F15000
G1 X98.872 Y120.809 E.00488
; LINE_WIDTH: 0.532445
G1 X98.967 Y120.652 E.00451
; LINE_WIDTH: 0.472838
G3 X99.174 Y120.387 I.609 J.262 E.00738
; LINE_WIDTH: 0.51598
G1 X99.257 Y120.344 E.00223
; LINE_WIDTH: 0.57063
G1 X99.34 Y120.302 E.00247
G1 X99.164 Y120.24 E.00495
; LINE_WIDTH: 0.51598
G1 X99.101 Y120.194 E.00185
; LINE_WIDTH: 0.473107
G1 X99.038 Y120.148 E.00169
G1 X98.735 Y119.738 E.01107
G1 X98.715 Y120.33 E.01287
; LINE_WIDTH: 0.450733
G1 X98.734 Y120.522 E.00398
; LINE_WIDTH: 0.491589
G1 X98.752 Y120.714 E.00436
; LINE_WIDTH: 0.532445
G1 X98.771 Y120.906 E.00475
G1 X98.825 Y117.214 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.216 Y116.823 E.01057
G1 X99.193 Y116.288
G1 X98.267 Y117.214 E.02506
G1 X98.013 Y116.91
G1 X99.153 Y115.77 E.03083
G1 X98.803 Y115.563
G1 X97.945 Y116.42 E.0232
G1 X97.864 Y115.944
G1 X98.245 Y115.563 E.01032
M204 S10000
G1 X99.313 Y114.494 F28800
M204 S2000
G1 F12000
G1 X98.709 Y115.099 E.01635
G1 X98.151 Y115.099
G1 X99.193 Y114.057 E.02818
G1 X98.728 Y113.964
G1 X97.593 Y115.099 E.0307
G1 X97.209 Y114.925
G1 X98.17 Y113.964 E.02601
G1 X97.612 Y113.964
G1 X97.087 Y114.489 E.01421
M204 S10000
G1 X99.309 Y114.466 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0728848
G1 F15000
G1 X99.221 Y114.308 E.00042
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X99.309 Y114.466 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.561 I-1.056 J.605 P1  F28800
G1 X102.972 Y120.865 Z4.561
G1 Z4.161
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X104.107 Y119.73 E.03303
G1 X107.341 Y119.73 E.06658
G1 X108.475 Y120.865 E.03303
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X107.341 Y119.73 E-.18287
G1 X106.945 Y119.73 E-.04513
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.561 I.539 J1.091 P1  F28800
G1 X113.491 Y116.494 Z4.561
G1 Z4.161
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X112.771 Y117.214 E.01949
G1 X112.215 Y117.211
G1 X113.609 Y115.818 E.03771
G1 X113.307 Y115.563
G1 X112.24 Y116.629 E.02886
G1 X112.264 Y116.047
G1 X112.749 Y115.563 E.01311
M204 S10000
G1 X114.353 Y114.516 F28800
M204 S2000
G1 F12000
G1 X113.77 Y115.099 E.01576
G1 X113.213 Y115.099
G1 X114.347 Y113.964 E.0307
G1 X113.789 Y113.964
G1 X112.655 Y115.099 E.0307
G1 X112.097 Y115.099
G1 X113.232 Y113.964 E.0307
G1 X112.674 Y113.964
G1 X112.132 Y114.506 E.01467
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.674 Y113.964 E-.08742
G1 X113.232 Y113.964 E-.06359
G1 X112.754 Y114.442 E-.07699
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.561 I.205 J1.2 P1  F28800
G1 X114.463 Y114.15 Z4.561
G1 Z4.161
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.155371
G1 F15000
G1 X114.285 Y114.448 E.00219
; CHANGE_LAYER
; Z_HEIGHT: 4.27959
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.463 Y114.15 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z4.561 I-1.137 J-.433 P1  F28800
G1 X111.79 Y121.178 Z4.561
G1 Z4.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97935
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90221
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.68 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z4.68
G1 Z4.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.033 Y116.027 E.06968
G1 X113.802 Y116.027 E.03641
G2 X113.551 Y118.791 I15.862 J2.829 E.05721
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X97.646 Y116.027 I-16.111 J.065 E.05721
G1 X99.414 Y116.027 E.03641
G1 X99.557 Y119.417 E.06985
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G3 X111.923 Y114.444 I16.566 J2.785 E.02696
G1 X114.062 Y114.444 E.04092
G1 X114.598 Y114.444 E.01027
G2 X113.961 Y118.795 I14.845 J4.397 E.08444
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X96.849 Y114.444 I-15.484 J.045 E.08444
G1 X99.524 Y114.444 E.05118
G3 X99.816 Y115.822 I-16.273 J4.163 E.02696
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 X112.003 Y119.827
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X99.353 Y119.827 E.24204
G1 X99.251 Y119.798 E.00203
G1 X99.156 Y119.638 E.00356
G1 X99.093 Y118.128 E.02892
G1 X98.294 Y118.13 E.01528
G3 X98.305 Y119.655 I-44.552 J1.092 E.02919
G1 X98.305 Y168.786 E.94007
G1 X98.364 Y169.7 E.01751
G2 X99.454 Y172.759 I7.651 J-1.002 E.06261
G1 X100.027 Y173.546 E.01864
G2 X101.939 Y175.159 I5.415 J-4.481 E.04811
G2 X105.707 Y176.202 I3.726 J-6.137 E.07576
G2 X107.642 Y175.963 I.067 J-7.426 E.0374
G1 X108.564 Y175.65 E.01865
G2 X111.607 Y173.315 I-2.839 J-6.85 E.07423
G1 X112.148 Y172.507 E.0186
G2 X112.888 Y170.718 I-7.273 J-4.06 E.03713
G1 X113.078 Y169.768 E.01853
G1 X113.142 Y168.782 E.01891
G1 X113.142 Y118.789 E.95657
G1 X113.162 Y118.128 E.01266
G1 X112.355 Y118.128 E.01545
G1 X112.291 Y119.638 E.02892
G1 X112.197 Y119.798 E.00356
G1 X112.062 Y119.818 E.00261
G1 X99.248 Y120.966 F28800
G1 F15000
G1 X99.361 Y120.787 E.00405
G1 X99.445 Y120.769 E.00164
G1 X112.003 Y120.769 E.24028
G1 X112.127 Y120.813 E.00253
G1 X112.2 Y120.966 E.00324
G1 X112.2 Y168.809 E.91543
G3 X109.444 Y174.099 I-6.525 J-.037 E.11854
G1 X108.728 Y174.535 E.01604
G3 X105.739 Y175.274 I-3.056 J-5.95 E.05944
G3 X99.248 Y168.781 I.011 J-6.503 E.19503
G1 X99.248 Y121.026 E.91375
G1 X112.712 Y119.738 F28800
; LINE_WIDTH: 0.483299
G1 F15000
G3 X112.742 Y118.593 I47.572 J.659 E.02542
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.712 Y119.738 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.68 I-.051 J-1.216 P1  F28800
G1 X99.34 Y120.302 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.57337
G1 F15000
G1 X112.047 Y120.299 E.33766
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X110.047 Y120.3 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.68 I.187 J-1.202 P1  F28800
G1 X98.705 Y118.532 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.44027
G1 F15000
G1 X98.731 Y119.655 E.0226
; LINE_WIDTH: 0.482134
G1 X98.732 Y119.678 E.0005
G1 X112.671 Y120.966 F28800
; LINE_WIDTH: 0.572278
G1 F15000
G1 X112.671 Y168.767 E1.26771
G3 X109.728 Y174.47 I-6.992 J.003 E.17683
G1 X108.971 Y174.937 E.02358
G3 X100.411 Y173.265 I-3.239 J-6.167 E.24994
G3 X99.442 Y171.756 I6.25 J-5.08 E.04766
G1 X99.114 Y170.93 E.02358
G3 X98.776 Y168.781 I7.634 J-2.299 E.05786
G1 X98.776 Y121.026 E1.2665
G1 X112.671 Y120.966 F28800
; LINE_WIDTH: 0.5733
G1 F15000
G1 X112.691 Y120.754 E.00566
; LINE_WIDTH: 0.532445
G1 X112.712 Y120.542 E.00524
; LINE_WIDTH: 0.472971
G1 X112.732 Y120.33 E.00462
G1 X112.712 Y119.738 E.01286
G1 X112.409 Y120.148 E.01107
; LINE_WIDTH: 0.450735
G1 X112.346 Y120.194 E.00161
; LINE_WIDTH: 0.483358
G1 X112.284 Y120.24 E.00173
; LINE_WIDTH: 0.515981
G1 X112.195 Y120.271 E.00223
; LINE_WIDTH: 0.57063
G1 X112.107 Y120.302 E.00247
G1 X112.274 Y120.387 E.00495
; LINE_WIDTH: 0.515981
G1 X112.33 Y120.441 E.00185
; LINE_WIDTH: 0.483358
G1 X112.385 Y120.495 E.00173
; LINE_WIDTH: 0.450735
G1 X112.47 Y120.635 E.00337
; LINE_WIDTH: 0.49159
G1 X112.555 Y120.775 E.0037
; LINE_WIDTH: 0.532445
G1 X112.64 Y120.915 E.00402
G1 X98.776 Y120.966 F28800
; LINE_WIDTH: 0.573302
G1 F15000
G1 X98.872 Y120.809 E.00488
; LINE_WIDTH: 0.532445
G1 X98.967 Y120.652 E.00451
; LINE_WIDTH: 0.472838
G3 X99.174 Y120.387 I.609 J.262 E.00738
; LINE_WIDTH: 0.51598
G1 X99.257 Y120.344 E.00223
; LINE_WIDTH: 0.57063
G1 X99.34 Y120.302 E.00247
G1 X99.164 Y120.24 E.00495
; LINE_WIDTH: 0.51598
G1 X99.101 Y120.194 E.00185
; LINE_WIDTH: 0.473107
G1 X99.038 Y120.148 E.00169
G1 X98.735 Y119.738 E.01107
G1 X98.715 Y120.33 E.01287
; LINE_WIDTH: 0.450733
G1 X98.734 Y120.522 E.00398
; LINE_WIDTH: 0.491589
G1 X98.752 Y120.714 E.00436
; LINE_WIDTH: 0.532445
G1 X98.771 Y120.906 E.00475
G1 X98.837 Y116.259 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.207 Y116.629 E.01002
G1 X99.232 Y117.212
G1 X98.279 Y116.259 E.02577
G1 X97.953 Y116.491
G1 X99.256 Y117.794 E.03527
G1 X98.815 Y117.911
G1 X98.037 Y117.132 E.02106
M204 S10000
G1 X99.482 Y115.23 F28800
M204 S2000
G1 F12000
G1 X98.912 Y114.661 E.01541
G1 X98.354 Y114.661
G1 X99.489 Y115.795 E.0307
G1 X98.931 Y115.795
G1 X97.797 Y114.661 E.0307
G1 X97.239 Y114.661
G1 X98.373 Y115.795 E.0307
G1 X97.816 Y115.795
G1 X97.292 Y115.271 E.01418
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.816 Y115.795 E-.08448
G1 X98.373 Y115.795 E-.06359
G1 X97.878 Y115.3 E-.07993
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.68 I.05 J1.216 P1  F28800
G1 X113.416 Y114.661 Z4.68
G1 Z4.28
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X114.131 Y115.376 E.01935
G1 X113.993 Y115.795
G1 X112.858 Y114.661 E.0307
G1 X112.3 Y114.661
G1 X113.435 Y115.795 E.0307
G1 X112.877 Y115.795
G1 X112.028 Y114.946 E.02297
G1 X111.932 Y115.408
G1 X112.319 Y115.795 E.01049
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.932 Y115.408 E-.0625
G1 X112.028 Y114.946 E-.05372
G1 X112.722 Y115.64 E-.11178
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.68 I.73 J.974 P1  F28800
G1 X114.054 Y114.641 Z4.68
G1 Z4.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.26285
G1 F15000
G1 X114.197 Y115.163 E.00623
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X114.054 Y114.641 E-.228
; WIPE_END
G1 E-.012 F1800
G17
M73 P92 R1
G3 Z4.68 I0 J-1.217 P1  F28800
G1 X112.181 Y114.641 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.16106
G1 F15000
G2 X112.054 Y114.921 I.898 J.575 E.00202
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.181 Y114.641 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.68 I-1.065 J.588 P1  F28800
G1 X113.434 Y116.91 Z4.68
G1 Z4.28
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X112.783 Y116.259 E.01761
G1 X112.254 Y116.288
G1 X113.381 Y117.415 E.03049
G1 X113.319 Y117.911
G1 X112.232 Y116.823 E.02942
G1 X112.209 Y117.359
G1 X112.761 Y117.911 E.01493
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.39864
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.209 Y117.359 E-.08897
G1 X112.232 Y116.823 E-.06109
G1 X112.715 Y117.307 E-.07795
; WIPE_END
G1 E-.012 F1800

G17
G3 Z4.68 I-1.184 J-.283 P1  F28800
G1 X111.79 Y121.178 Z4.68
G1 Z4.399
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97935
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90221
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.799 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z4.799
G1 Z4.399
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X112.004 Y116.724 E.05533
G1 X113.687 Y116.724 E.03465
G2 X113.551 Y118.791 I17.966 J2.213 E.04268
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X97.761 Y116.724 I-18.095 J.146 E.04268
G1 X99.444 Y116.724 E.03465
G1 X99.505 Y118.177 E.02995
G1 X99.557 Y119.417 E.02554
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.632 Y115.822 E.06101
G1 X111.762 Y115.14 E.01327
G1 X114.116 Y115.14 E.04505
G1 X114.409 Y115.14 E.00561
G2 X113.961 Y118.795 I14.662 J3.654 E.07064
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X97.038 Y115.14 I-15.11 J-.001 E.07064
G1 X99.686 Y115.14 E.05066
G1 X99.816 Y115.822 E.01327
G1 X99.949 Y119.008 E.06101
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 X112.003 Y119.827
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X99.353 Y119.827 E.24204
G1 X99.25 Y119.798 E.00204
G1 X99.156 Y119.638 E.00356
G1 X99.122 Y118.824 E.01558
G1 X98.302 Y118.824 E.01569
G1 X98.305 Y168.786 E.95597
G1 X98.364 Y169.7 E.01752
G2 X98.861 Y171.61 I8.239 J-1.125 E.03786
G1 X99.272 Y172.45 E.01789
G2 X100.665 Y174.22 I7.705 J-4.634 E.04321
G2 X102.274 Y175.363 I5.587 J-6.157 E.03786
G1 X103.132 Y175.744 E.01795
G2 X105.04 Y176.169 I2.544 J-6.927 E.03751
G1 X105.697 Y176.208 E.0126
G1 X106.626 Y176.158 E.01779
G2 X110.509 Y174.463 I-.969 J-7.517 E.08216
G1 X111.193 Y173.809 E.01811
G2 X113.078 Y169.768 I-5.609 J-5.077 E.08661
G1 X113.142 Y168.782 E.0189
G1 X113.146 Y118.817 E.95604
G1 X112.326 Y118.821 E.01569
G1 X112.291 Y119.638 E.01563
G1 X112.197 Y119.798 E.00356
G1 X112.062 Y119.818 E.00261
G1 X99.248 Y120.966 F28800
G1 F15000
G1 X99.361 Y120.787 E.00405
G1 X99.445 Y120.769 E.00164
G1 X112.003 Y120.769 E.24028
G1 X112.127 Y120.813 E.00253
G1 X112.2 Y120.966 E.00324
G1 X112.2 Y168.809 E.91543
G3 X108.963 Y174.399 I-6.474 J-.017 E.12939
G1 X108.21 Y174.778 E.01613
G3 X100.593 Y172.741 I-2.476 J-6 E.16213
G1 X100.119 Y172.043 E.01614
G1 X99.843 Y171.509 E.0115
G1 X99.552 Y170.759 E.01539
G3 X99.263 Y169.059 I6.267 J-1.937 E.03308
G1 X99.248 Y168.781 E.00533
G1 X99.248 Y121.026 E.91375
G1 X112.714 Y119.738 F28800
; LINE_WIDTH: 0.494552
G1 F15000
G1 X112.725 Y119.298 E.01002
G1 X99.34 Y120.302 F28800
; LINE_WIDTH: 0.57337
G1 F15000
G1 X112.047 Y120.299 E.33766
G1 X98.721 Y119.243 F28800
; LINE_WIDTH: 0.46818
G1 F15000
G1 X98.732 Y119.678 E.00935
G1 X112.673 Y120.966 F28800
; LINE_WIDTH: 0.574188
G1 F15000
G1 X112.671 Y168.767 E1.27214
G3 X109.2 Y174.809 I-6.999 J-.003 E.1941
G1 X108.408 Y175.203 E.02354
G3 X105.426 Y175.735 I-2.72 J-6.624 E.08124
G1 X104.546 Y175.642 E.02354
G3 X101.531 Y174.335 I1.315 J-7.162 E.08823
G3 X100.218 Y173.029 I4.944 J-6.283 E.0494
G1 X99.723 Y172.295 E.02355
G3 X98.776 Y168.781 I6.309 J-3.584 E.0979
G1 X98.775 Y121.026 E1.27093
G1 X112.673 Y120.966 F28800
; LINE_WIDTH: 0.576702
G1 F15000
G1 X112.693 Y120.754 E.00569
; LINE_WIDTH: 0.535134
G1 X112.714 Y120.542 E.00526
; LINE_WIDTH: 0.475224
G1 X112.735 Y120.33 E.00465
G1 X112.714 Y119.738 E.01292
G1 X112.411 Y120.148 E.01112
; LINE_WIDTH: 0.451999
G1 X112.348 Y120.194 E.00162
; LINE_WIDTH: 0.484129
G1 X112.285 Y120.24 E.00174
; LINE_WIDTH: 0.51626
G1 X112.196 Y120.271 E.00224
; LINE_WIDTH: 0.570676
G1 X112.107 Y120.302 E.00249
G1 X112.275 Y120.387 E.00497
; LINE_WIDTH: 0.51626
G1 X112.331 Y120.441 E.00186
; LINE_WIDTH: 0.484129
G1 X112.387 Y120.495 E.00174
; LINE_WIDTH: 0.451999
G1 X112.472 Y120.635 E.00338
; LINE_WIDTH: 0.493566
G1 X112.557 Y120.775 E.00371
; LINE_WIDTH: 0.535134
G1 X112.641 Y120.915 E.00404
G1 X98.775 Y120.966 F28800
; LINE_WIDTH: 0.576534
G1 F15000
G1 X98.87 Y120.809 E.00491
; LINE_WIDTH: 0.535
G1 X98.965 Y120.652 E.00454
; LINE_WIDTH: 0.474374
G3 X99.173 Y120.387 I.607 J.261 E.00742
; LINE_WIDTH: 0.516245
G1 X99.257 Y120.344 E.00224
; LINE_WIDTH: 0.570674
G1 X99.34 Y120.302 E.00249
G1 X99.163 Y120.24 E.00497
; LINE_WIDTH: 0.516245
G1 X99.1 Y120.194 E.00186
; LINE_WIDTH: 0.47536
G1 X99.037 Y120.148 E.0017
G1 X98.734 Y119.738 E.01113
G1 X98.712 Y120.33 E.01293
; LINE_WIDTH: 0.451934
G1 X98.731 Y120.522 E.00399
; LINE_WIDTH: 0.493467
G1 X98.75 Y120.714 E.00438
; LINE_WIDTH: 0.535
G1 X98.769 Y120.906 E.00477
G1 X99.26 Y117.894 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.547 Y118.607 E.0193
G1 X98.121 Y118.475
G1 X99.238 Y117.359 E.03022
G1 X99.083 Y116.956
G1 X98.102 Y117.937 E.02655
G1 X98.066 Y117.415
G1 X98.525 Y116.956 E.01241
M204 S10000
G1 X98.178 Y118.014 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101429
G1 F15000
G1 X98.098 Y118.22 E.00081
G1 X99.601 Y115.88 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.989 Y116.492 E.01655
G1 X98.431 Y116.492
G1 X99.516 Y115.408 E.02934
G1 X99.008 Y115.357
G1 X97.873 Y116.492 E.0307
G1 X97.5 Y116.308
G1 X98.45 Y115.357 E.02572
G1 X97.892 Y115.357
G1 X97.413 Y115.836 E.01296
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.892 Y115.357 E-.07723
G1 X98.45 Y115.357 E-.06359
G1 X97.909 Y115.898 E-.08718
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.799 I-.144 J1.208 P1  F28800
G1 X113.358 Y117.743 Z4.799
G1 Z4.399
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X112.497 Y118.603 E.02329
G1 X112.167 Y118.376
G1 X113.411 Y117.132 E.03366
G1 X113.029 Y116.956
G1 X112.191 Y117.794 E.02267
M204 S10000
G1 X113.358 Y118.022 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112656
G1 F15000
G1 X113.095 Y118.62 E.00276
G1 X114.007 Y115.978 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.493 Y116.492 E.01392
G1 X112.935 Y116.492
G1 X114.07 Y115.357 E.0307
G1 X113.512 Y115.357
G1 X112.377 Y116.492 E.0307
G1 X111.821 Y116.49
G1 X112.954 Y115.357 E.03066
G1 X112.396 Y115.357
G1 X111.845 Y115.908 E.0149
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.5177
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.396 Y115.357 E-.08879
G1 X112.954 Y115.357 E-.06359
G1 X112.485 Y115.826 E-.07561
; WIPE_END
G1 E-.012 F1800

G17
G3 Z4.799 I-1.207 J-.157 P1  F28800
G1 X111.79 Y121.178 Z4.799
G1 Z4.518
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97935
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90221
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.918 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z4.918
G1 Z4.518
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X111.975 Y117.421 E.04097
G1 X113.611 Y117.421 E.03368
G1 X113.565 Y118.143 E.01491
G1 X113.551 Y118.791 E.01334
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.001 E.50629
G1 X97.896 Y118.791 E1.02946
G2 X97.837 Y117.421 I-16.363 J.019 E.02825
G1 X99.473 Y117.421 E.03368
G1 X99.557 Y119.417 E.04114
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.631 Y115.837 E.06072
G1 X114.256 Y115.837 E.05023
G2 X113.961 Y118.795 I15.131 J3.004 E.05697
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49494
G1 X97.486 Y118.795 E.9567
G2 X97.191 Y115.837 I-15.426 J.045 E.05697
G1 X99.816 Y115.837 E.05023
G1 X99.949 Y119.008 E.06072
G1 X111.438 Y119.008 E.21983
G1 X111.895 Y119.054 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.56 Y117.011 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.918 I-.777 J.937 P1  F28800
G1 X113.326 Y118.476 Z4.918
G1 Z4.518
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X112.503 Y117.653 E.02227
G1 X112.187 Y117.894
M73 P93 R1
G1 X113.32 Y119.027 E.03065
G1 X113.039 Y119.304
G1 X112.164 Y118.43 E.02366
M204 S10000
G1 X113.121 Y117.633 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101548
G1 F15000
G1 X113.349 Y118.22 E.00232
G1 X113.876 Y116.794 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.136 Y116.054 E.02002
G1 X112.578 Y116.054
G1 X113.713 Y117.189 E.0307
G1 X113.155 Y117.189
G1 X112.02 Y116.054 E.0307
G1 X111.824 Y116.416
G1 X112.597 Y117.189 E.02092
M204 S10000
G1 X113.876 Y116.817 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0889749
G1 F15000
G1 X113.791 Y116.988 E.00059
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X113.876 Y116.817 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z4.918 I.028 J-1.217 P1  F28800
G1 X99.626 Y116.491 Z4.918
G1 Z4.518
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.19 Y116.054 E.01181
G1 X98.632 Y116.054
G1 X99.651 Y117.073 E.02757
G1 X99.209 Y117.189
G1 X98.074 Y116.054 E.0307
G1 X97.516 Y116.054
G1 X98.651 Y117.189 E.0307
G1 X98.093 Y117.189
G1 X97.549 Y116.645 E.01471
M204 S10000
G1 X99.281 Y118.376 F28800
M204 S2000
G1 F12000
G1 X98.557 Y117.653 E.01958
G1 X98.09 Y117.743
G1 X99.305 Y118.958 E.03289
G1 X99.093 Y119.304
G1 X98.118 Y118.329 E.02637
G1 X98.128 Y118.897
G1 X98.535 Y119.304 E.01102
M204 S10000
G1 X98.192 Y118.255 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.113983
G1 F15000
G1 X98.09 Y118.022 E.00109
G1 X99.248 Y120.966 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X99.361 Y120.787 E.00405
G1 X99.445 Y120.769 E.00164
G1 X112.003 Y120.769 E.24028
G1 X112.127 Y120.813 E.00253
G1 X112.2 Y120.966 E.00324
G1 X112.2 Y168.809 E.91543
G3 X108.952 Y174.399 I-6.449 J-.008 E.12958
G1 X108.21 Y174.778 E.01593
G3 X105.446 Y175.262 I-2.497 J-6.121 E.0541
G3 X101.793 Y173.945 I.289 J-6.526 E.07545
G3 X100.592 Y172.729 I3.999 J-5.155 E.0328
G1 X100.119 Y172.043 E.01593
G3 X99.263 Y169.052 I5.946 J-3.321 E.06006
G1 X99.248 Y168.781 E.00519
G1 X99.248 Y121.026 E.91375
G1 X112.003 Y119.827 F28800
G1 F15000
G1 X99.353 Y119.827 E.24204
G1 X99.251 Y119.798 E.00203
G1 X99.156 Y119.638 E.00356
G1 X99.151 Y119.521 E.00223
G1 X98.305 Y119.521 E.01618
G1 X98.305 Y168.786 E.94264
G2 X98.648 Y171.001 I9.017 J-.261 E.04298
G1 X98.975 Y171.871 E.01779
G2 X99.639 Y173.014 I5.516 J-2.438 E.02533
G1 X100.211 Y173.757 E.01795
G2 X102.86 Y175.639 I5.693 J-5.207 E.06264
G1 X103.747 Y175.943 E.01795
G2 X105.04 Y176.169 I1.659 J-5.691 E.02516
G1 X105.697 Y176.208 E.0126
G1 X106.626 Y176.158 E.01779
G2 X109.109 Y175.381 I-.845 J-7.061 E.05007
G1 X109.922 Y174.91 E.01798
G2 X111.382 Y173.583 I-5.484 J-7.502 E.03781
G2 X112.87 Y170.732 I-5.804 J-4.844 E.06202
G2 X113.142 Y168.782 I-7.188 J-1.995 E.03778
G1 X113.142 Y119.521 E.94256
G1 X112.296 Y119.521 E.01618
G1 X112.259 Y119.738 E.00421
G3 X112.062 Y119.823 I-.163 J-.105 E.00435
G1 X98.776 Y120.966 F28800
; LINE_WIDTH: 0.572335
G1 F15000
G1 X98.776 Y168.781 E1.26823
G2 X99.094 Y170.86 I8.045 J-.164 E.05594
G1 X99.41 Y171.691 E.02358
G2 X100.571 Y173.455 I7.083 J-3.4 E.05618
G2 X103.06 Y175.21 I5.352 J-4.947 E.08137
G1 X103.898 Y175.499 E.02352
G2 X105.697 Y175.741 I1.968 J-7.817 E.04825
G1 X106.585 Y175.689 E.02358
G2 X108.904 Y174.965 I-.824 J-6.718 E.06481
G1 X109.67 Y174.513 E.02357
G2 X112.671 Y168.772 I-4.011 J-5.752 E.17862
G1 X112.671 Y121.026 E1.26638
G1 X112.107 Y120.302 F28800
; LINE_WIDTH: 0.57337
G1 F15000
G1 X99.4 Y120.299 E.33766
G1 X98.776 Y120.966 F28800
; LINE_WIDTH: 0.573302
G1 F15000
G1 X98.872 Y120.809 E.00488
; LINE_WIDTH: 0.532445
G1 X98.967 Y120.652 E.00451
; LINE_WIDTH: 0.472838
G3 X99.174 Y120.387 I.609 J.262 E.00738
; LINE_WIDTH: 0.51598
G1 X99.257 Y120.344 E.00223
; LINE_WIDTH: 0.57063
G1 X99.34 Y120.302 E.00247
G1 X99.164 Y120.24 E.00495
; LINE_WIDTH: 0.51598
G1 X99.005 Y120.102 E.00502
; LINE_WIDTH: 0.470409
G2 X98.786 Y119.931 I-.486 J.396 E.00603
G1 X98.715 Y119.931 E.00154
; LINE_WIDTH: 0.450733
G1 X98.734 Y120.256 E.00672
; LINE_WIDTH: 0.491589
G1 X98.754 Y120.581 E.00736
; LINE_WIDTH: 0.532445
G1 X98.773 Y120.906 E.00801
G1 X112.671 Y120.966 F28800
; LINE_WIDTH: 0.5733
G1 F15000
G1 X112.691 Y120.754 E.00566
; LINE_WIDTH: 0.532445
G1 X112.712 Y120.542 E.00524
; LINE_WIDTH: 0.459185
G2 X112.732 Y119.931 I-3.161 J-.412 E.01288
G1 X112.612 Y119.931 E.00253
G1 X112.409 Y120.148 E.00625
; LINE_WIDTH: 0.450735
G1 X112.346 Y120.194 E.00161
; LINE_WIDTH: 0.483358
G1 X112.284 Y120.24 E.00173
; LINE_WIDTH: 0.515981
G1 X112.195 Y120.271 E.00223
; LINE_WIDTH: 0.57063
G1 X112.107 Y120.302 E.00247
G1 X112.274 Y120.387 E.00495
; LINE_WIDTH: 0.515981
G1 X112.33 Y120.441 E.00185
; LINE_WIDTH: 0.483358
G1 X112.385 Y120.495 E.00173
; LINE_WIDTH: 0.450735
G1 X112.47 Y120.635 E.00337
; LINE_WIDTH: 0.49159
G1 X112.555 Y120.775 E.0037
; LINE_WIDTH: 0.532445
G1 X112.64 Y120.915 E.00402
; CHANGE_LAYER
; Z_HEIGHT: 4.63676
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.555 Y120.775 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z4.918 I-.568 J-1.076 P1  F28800
G1 X111.79 Y121.178 Z4.918
G1 Z4.637
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97935
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90221
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.037 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z5.037
G1 Z4.637
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X111.945 Y118.117 E.02661
G1 X113.566 Y118.117 E.03336
G1 X113.551 Y118.791 E.01388
G1 X113.551 Y168.791 E1.02946
G3 X97.896 Y168.791 I-7.828 J-.002 E.50625
G1 X97.896 Y118.791 E1.02946
G1 X97.882 Y118.117 E.01388
G1 X99.502 Y118.117 E.03336
G1 X99.557 Y119.417 E.02678
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.602 Y116.534 E.04738
G1 X114.134 Y116.534 E.04844
G1 X114.081 Y116.89 E.00689
G2 X113.961 Y118.795 I16.98 J2.026 E.03655
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.007 E.4949
G1 X97.486 Y118.795 E.9567
G2 X97.314 Y116.534 I-14.795 J-.008 E.04344
G1 X99.845 Y116.534 E.04844
G1 X99.949 Y119.008 E.04738
G1 X111.438 Y119.008 E.21983
G1 X111.896 Y119.047 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.57 Y117.012 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.037 I-1.129 J.454 P1  F28800
G1 X112.773 Y120.001 Z5.037
G1 Z4.637
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X113.32 Y119.454 E.01478
G1 X113.32 Y118.897
G1 X112.215 Y120.001 E.02987
G1 X112.118 Y119.541
G1 X113.309 Y118.349 E.03224
G1 X112.751 Y118.349
G1 X112.142 Y118.958 E.01648
M204 S10000
G1 X111.976 Y119.825 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.41664
G1 F15000
G1 X110.209 Y119.825 E.03353
G1 X113.822 Y117.279 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.215 Y117.885 E.01642
G1 X112.657 Y117.885
G1 X113.792 Y116.751 E.0307
G1 X113.234 Y116.751
G1 X112.099 Y117.885 E.0307
G1 X111.772 Y117.655
G1 X112.676 Y116.751 E.02447
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.772 Y117.655 E-.14578
G1 X112.099 Y117.885 E-.04564
G1 X112.326 Y117.658 E-.03658
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.037 I-.274 J-1.186 P1  F28800
G1 X101.092 Y120.255 Z5.037
G1 Z4.637
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.498415
G1 F15000
G1 X99.445 Y120.257 E.03778
; LINE_WIDTH: 0.498326
G1 X99.123 Y120.237 E.0074
; LINE_WIDTH: 0.420104
M73 P93 R0
G2 X98.305 Y120.218 I-.57 J6.713 E.01566
G1 X98.305 Y168.786 E.92956
G1 X98.364 Y169.702 E.01756
G2 X98.979 Y171.877 I7.791 J-1.031 E.0434
G2 X99.639 Y173.014 I5.432 J-2.391 E.02521
G1 X100.212 Y173.758 E.01798
G2 X101.94 Y175.174 I6.364 J-6.004 E.04287
G2 X105.048 Y176.178 I3.828 J-6.538 E.06302
G1 X105.696 Y176.207 E.0124
G1 X106.626 Y176.158 E.01782
G2 X110.214 Y174.694 I-.929 J-7.405 E.07503
G2 X111.778 Y173.072 I-5.407 J-6.779 E.04324
G2 X113.098 Y169.461 I-6.002 J-4.241 E.07444
G1 X113.142 Y168.782 E.01303
G1 X113.142 Y120.218 E.92948
; LINE_WIDTH: 0.42
G1 X112.572 Y120.237 E.01091
; LINE_WIDTH: 0.488065
G3 X110.397 Y120.257 I-1.373 J-31.638 E.04882
; LINE_WIDTH: 0.498326
G1 X110.167 Y120.042 E.00722
; LINE_WIDTH: 0.421409
G1 X109.938 Y119.827 E.00604
M73 P94 R0
G1 X101.51 Y119.827 E.16184
; LINE_WIDTH: 0.42
G1 X101.322 Y120.019 E.00515
; LINE_WIDTH: 0.460954
G1 X101.134 Y120.212 E.00569
G1 X101.711 Y120.769 F28800
; LINE_WIDTH: 0.42
G1 F15000
G1 X109.994 Y120.769 E.15848
G1 X110.195 Y120.749 E.00388
; LINE_WIDTH: 0.493938
G1 X110.397 Y120.73 E.0046
G1 X112.003 Y120.73 E.03648
; LINE_WIDTH: 0.498326
G1 X112.094 Y120.812 E.00282
; LINE_WIDTH: 0.420041
G1 X112.186 Y120.894 E.00236
G1 X112.2 Y120.966 E.00141
G1 X112.2 Y168.809 E.91553
G3 X108.963 Y174.399 I-6.483 J-.022 E.12939
G1 X108.21 Y174.778 E.01614
G3 X104.885 Y175.214 I-2.481 J-6.028 E.06491
G1 X104.056 Y175.055 E.01615
G3 X102.012 Y174.091 I1.598 J-6.035 E.0435
G1 X101.355 Y173.578 E.01594
G3 X100.119 Y172.043 I5.348 J-5.569 E.03781
G3 X99.47 Y170.48 I6.357 J-3.559 E.03247
G1 X99.304 Y169.656 E.01608
G3 X99.248 Y168.781 I38.14 J-2.922 E.01677
G1 X99.248 Y120.966 E.91499
G1 X99.261 Y120.894 E.00141
; LINE_WIDTH: 0.42
G1 X99.332 Y120.813 E.00207
; LINE_WIDTH: 0.49611
G1 X99.404 Y120.731 E.00247
G1 X101.051 Y120.73 E.03759
; LINE_WIDTH: 0.498326
G1 X101.351 Y120.747 E.00689
; LINE_WIDTH: 0.459163
G1 X101.651 Y120.765 E.00632
G1 X101.711 Y120.298 F28800
; LINE_WIDTH: 0.5733
G1 F15000
G1 X109.677 Y120.298 E.21166
G1 X112.647 Y120.713 F28800
; LINE_WIDTH: 0.573554
G1 F15000
G1 X112.671 Y120.966 E.00676
G1 X112.671 Y168.767 E1.27067
; LINE_WIDTH: 0.572733
G3 X109.2 Y174.809 I-6.989 J.003 E.19362
G1 X108.408 Y175.203 E.02347
G3 X103.954 Y175.514 I-2.697 J-6.577 E.12055
G3 X101.747 Y174.486 I1.718 J-6.577 E.06498
G1 X101.053 Y173.938 E.02347
G3 X99.723 Y172.295 I5.348 J-5.688 E.05626
G3 X99.024 Y170.62 I7.035 J-3.922 E.04828
G1 X98.843 Y169.748 E.02366
G3 X98.776 Y168.781 I10.586 J-1.219 E.02572
G1 X98.776 Y120.966 E1.26915
; LINE_WIDTH: 0.573302
G1 X98.795 Y120.772 E.00516
G1 X98.827 Y120.001 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.328 Y119.5 E.01354
G1 X99.305 Y118.965
G1 X98.27 Y120.001 E.02803
G1 X98.128 Y119.585
G1 X99.283 Y118.429 E.03126
G1 X98.805 Y118.349
G1 X98.128 Y119.027 E.01833
M204 S10000
G1 X101.238 Y119.825 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.41664
G1 F15000
G1 X99.282 Y119.825 E.0371
G1 X99.668 Y117.486 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.269 Y117.885 E.0108
G1 X98.711 Y117.885
G1 X99.646 Y116.951 E.02528
G1 X99.288 Y116.751
G1 X98.154 Y117.885 E.0307
G1 X97.669 Y117.812
G1 X98.73 Y116.751 E.02873
G1 X98.173 Y116.751
G1 X97.627 Y117.296 E.01476
M204 S10000
G1 X97.705 Y117.374 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0818313
G1 F15000
G1 X97.635 Y117.567 E.00056
; CHANGE_LAYER
; Z_HEIGHT: 4.75581
; LAYER_HEIGHT: 0.119057
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.705 Y117.374 E-.228
; WIPE_END
G1 E-.012 F1800

G17
G3 Z5.037 I-.317 J1.175 P1  F28800
G1 X111.79 Y121.178 Z5.037
G1 Z4.756
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24982
G1 X99.657 Y168.804 E.98059
G2 X111.79 Y168.804 I6.067 J-.012 E.3919
G1 X111.79 Y121.238 E.97935
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21649
G1 X100.066 Y168.8 E.90336
G2 X111.381 Y168.8 I5.657 J-.008 E.33977
G1 X111.381 Y121.648 E.90221
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.156 I.808 J.91 P1  F28800
G1 X111.891 Y119.409 Z5.156
G1 Z4.756
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X111.916 Y118.811 E.01232
G1 X113.551 Y118.811 E.03367
G1 X113.551 Y168.791 E1.02905
G3 X97.896 Y168.791 I-7.828 J-.002 E.50626
G1 X97.896 Y118.811 E1.02905
G1 X99.531 Y118.811 E.03367
G1 X99.557 Y119.417 E.01249
G1 X111.839 Y119.417 E.25289
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.573 Y117.23 E.03404
G1 X114.045 Y117.23 E.04731
G2 X113.961 Y118.795 I16.224 J1.658 E.03
G1 X113.961 Y168.795 E.9567
G3 X97.486 Y168.795 I-8.237 J-.006 E.49491
G1 X97.486 Y118.795 E.9567
G2 X97.402 Y117.23 I-16.306 J.093 E.03
G1 X99.875 Y117.23 E.04731
G1 X99.949 Y119.008 E.03404
G1 X111.438 Y119.008 E.21983
G1 X111.897 Y119.039 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.573 Y117.23 E-.20318
G1 X111.79 Y117.23 E-.02482
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.156 I-1.217 J.022 P1  F28800
G1 X111.857 Y120.84 Z5.156
G1 Z4.756
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36555
G1 F15000
G1 X111.943 Y120.84 E.00141
G1 X99.59 Y120.84 F28800
G1 F15000
G1 X99.483 Y120.841 E.00177
G1 X99.248 Y121.382 F28800
; LINE_WIDTH: 0.42
G1 F15000
G1 X99.272 Y120.966 E.00798
; LINE_WIDTH: 0.373805
G1 X99.423 Y120.841 E.00331
G1 X98.776 Y120.911 E.01098
; LINE_WIDTH: 0.42
G1 X98.305 Y120.911 E.00901
G1 X98.305 Y168.786 E.91604
G1 X98.364 Y169.7 E.01751
G2 X102.256 Y175.353 I7.404 J-.931 E.13647
G1 X103.13 Y175.743 E.0183
G2 X113.142 Y168.772 I2.588 J-6.958 E.27397
G1 X113.142 Y120.911 E.91576
G1 X112.255 Y120.89 E.01699
; LINE_WIDTH: 0.386354
G1 X112.003 Y120.84 E.0045
G1 X112.179 Y120.966 E.00379
; LINE_WIDTH: 0.419942
G1 X112.2 Y121.382 E.00798
G1 X112.2 Y168.809 E.90733
G3 X99.755 Y171.281 I-6.471 J-.014 E.33984
G3 X99.248 Y168.781 I6.018 J-2.522 E.04912
G1 X99.248 Y121.442 E.90565
G1 X98.776 Y121.382 F28800
; LINE_WIDTH: 0.573541
G1 F15000
G1 X98.776 Y168.781 E1.25996
G1 X98.832 Y169.659 E.02338
G2 X102.494 Y174.941 I6.941 J-.901 E.17752
G1 X103.32 Y175.314 E.02407
G2 X112.671 Y168.772 I2.392 J-6.536 E.35566
G1 X112.671 Y121.442 E1.25811
G1 X113.32 Y119.585 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X112.778 Y119.043 E.01466
G1 X112.22 Y119.043
G1 X113.32 Y120.143 E.02976
G1 X113.313 Y120.694
G1 X112.119 Y119.5 E.03231
G1 X111.71 Y119.649
G1 X112.756 Y120.694 E.02828
G1 X112.198 Y120.694
G1 X111.152 Y119.649 E.02828
G1 X110.595 Y119.649
G1 X111.64 Y120.694 E.02828
G1 X111.082 Y120.694
G1 X110.037 Y119.649 E.02828
M204 S10000
G1 X109.957 Y119.629 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.212051
G1 F15000
G1 X109.9 Y119.672 E.00065
; LINE_WIDTH: 0.250665
G1 X109.842 Y119.715 E.00078
; LINE_WIDTH: 0.289279
G1 X109.785 Y119.757 E.00092
; LINE_WIDTH: 0.330144
G1 X109.727 Y119.8 E.00106
G1 X109.791 Y119.895 E.00169
G1 X110.593 Y120.714 E.01694
G1 X110.368 Y120.84 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36555
G1 F15000
G1 X110.394 Y120.84 E.00044
G1 X100.993 Y120.84 F28800
G1 F15000
G1 X101.042 Y120.84 E.0008
G1 X109.043 Y120.769 F28800
; LINE_WIDTH: 0.42
G1 F15000
G1 X110.26 Y120.817 E.02332
; LINE_WIDTH: 0.373028
G1 X110.368 Y120.84 E.00185
G1 X110.26 Y120.817 E.00185
; LINE_WIDTH: 0.415128
G3 X109.243 Y119.827 I11.967 J-13.302 E.02683
G1 X102.204 Y119.827 E.13303
G3 X101.182 Y120.813 I-11.469 J-10.859 E.02684
; LINE_WIDTH: 0.371496
G1 X101.102 Y120.839 E.00143
G1 X101.187 Y120.824 E.00146
; LINE_WIDTH: 0.413366
G1 X102.405 Y120.769 E.02293
G1 X108.983 Y120.769 E.12374
G1 X102.405 Y120.298 F28800
; LINE_WIDTH: 0.573302
G1 F15000
G1 X108.983 Y120.298 E.17477
G1 X113.779 Y117.813 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.414 Y117.447 E.00988
G1 X112.856 Y117.447
G1 X113.753 Y118.345 E.02429
G1 X113.429 Y118.579
G1 X112.298 Y117.447 E.03062
G1 X111.779 Y117.486
G1 X112.872 Y118.579 E.02956
G1 X112.314 Y118.579
G1 X111.757 Y118.022 E.01508
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.314 Y118.579 E-.08982
G1 X112.872 Y118.579 E-.06359
G1 X112.409 Y118.116 E-.07459
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.156 I-.164 J-1.206 P1  F28800
G1 X101.111 Y119.649 Z5.156
G1 Z4.756
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X101.603 Y120.14 E.01329
G1 X101.329 Y120.425
G1 X100.554 Y119.649 E.021
G1 X99.996 Y119.649
G1 X101.041 Y120.694 E.02828
G1 X100.483 Y120.694
G1 X99.438 Y119.649 E.02828
G1 X99.33 Y119.541
G1 X98.832 Y119.043 E.01347
G1 X98.274 Y119.043
G1 X99.925 Y120.694 E.04469
G1 X99.368 Y120.694
G1 X98.128 Y119.455 E.03355
G1 X98.128 Y120.012
G1 X98.81 Y120.694 E.01845
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.128 Y120.012 E-.10993
G1 X98.128 Y119.455 E-.06359
G1 X98.466 Y119.793 E-.05448
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.156 I1.196 J.226 P1  F28800
G1 X98.91 Y117.447 Z5.156
G1 Z4.756
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X99.7 Y118.237 E.02138
G1 X99.484 Y118.579
G1 X98.352 Y117.447 E.03062
G1 X97.794 Y117.447
G1 X98.926 Y118.579 E.03062
G1 X98.368 Y118.579
G1 X97.673 Y117.884 E.0188
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.87383
; LAYER_HEIGHT: 0.118016
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X98.368 Y118.579 E-.11201
G1 X98.926 Y118.579 E-.06359
G1 X98.601 Y118.254 E-.0524
; WIPE_END
G1 E-.012 F1800

G17
G3 Z5.156 I-.263 J1.188 P1  F28800
G1 X111.791 Y121.178 Z5.156
G1 Z4.874
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X99.657 Y121.178 E.24777
G1 X99.657 Y168.804 E.97254
G2 X111.791 Y168.804 I6.067 J-.012 E.3887
G1 X111.791 Y121.238 E.97131
M73 P95 R0
G1 X111.381 Y121.588 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X100.066 Y121.588 E.21472
G1 X100.066 Y168.8 E.89597
G2 X111.381 Y168.8 I5.657 J-.008 E.33699
G1 X111.381 Y121.648 E.89484
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.274 I.779 J.935 P1  F28800
G1 X111.953 Y119.493 Z5.274
G1 Z4.874
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
G1 X113.551 Y119.493 E.03263
G1 X113.551 Y168.791 E1.00667
G3 X97.896 Y168.791 I-7.828 J-.001 E.5021
G1 X97.896 Y119.493 E1.00667
G1 X101.518 Y119.493 E.07396
G1 X101.515 Y119.417 E.00154
G1 X109.932 Y119.417 E.17189
G1 X109.929 Y119.493 E.00154
G1 X111.893 Y119.493 E.04011
G1 X111.498 Y119.008 F28800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X111.544 Y117.924 E.02058
G1 X113.989 Y117.924 E.04641
G1 X113.974 Y118.16 E.00449
G1 X113.961 Y118.795 E.01206
G1 X113.961 Y168.795 E.94888
G3 X97.486 Y168.795 I-8.237 J-.006 E.49087
G1 X97.486 Y118.795 E.94888
G2 X97.458 Y117.924 I-10.4 J-.1 E.01655
G1 X99.904 Y117.924 E.04641
G1 X99.949 Y119.008 E.02058
G1 X111.438 Y119.008 E.21803
G1 X111.897 Y119.031 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.544 Y117.924 E-.12411
G1 X112.455 Y117.924 E-.10389
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.274 I-1.141 J.424 P1  F28800
G1 X112.952 Y119.261 Z5.274
G1 Z4.874
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X113.751 Y118.461 E.02145
G1 X113.513 Y118.141
G1 X112.394 Y119.261 E.03004
G1 X111.835 Y119.261
G1 X112.955 Y118.141 E.03004
G1 X112.397 Y118.141
G1 X111.724 Y118.814 E.01807
M204 S10000
G1 X113.764 Y118.727 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0792484
G1 F15000
G1 X113.532 Y119.28 E.00156
G1 X112.511 Y121.376 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.319 Y120.567 E.02169
G1 X113.319 Y120.009
G1 X112.023 Y121.306 E.0348
G1 X111.824 Y120.946
G1 X113.046 Y119.725 E.03277
G1 X112.488 Y119.725
G1 X111.266 Y120.946 E.03277
G1 X110.708 Y120.946
G1 X111.929 Y119.725 E.03277
G1 X111.371 Y119.725
G1 X110.15 Y120.946 E.03277
G1 X109.767 Y120.771
G1 X110.813 Y119.725 E.02807
G1 X110.255 Y119.725
G1 X109.494 Y120.486 E.02042
G1 X109.221 Y120.201
G1 X109.697 Y119.725 E.01277
M204 S10000
G1 X109.464 Y120.768 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X108.562 Y119.827 E.02475
G1 X102.886 Y119.827 E.10772
G1 X101.983 Y120.768 E.02475
G1 X109.404 Y120.768 E.14084
G1 X103.086 Y120.298 F28800
; LINE_WIDTH: 0.571963
G1 F15000
G1 X108.301 Y120.298 E.13706
G1 X102.516 Y119.649 F28800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X101.22 Y120.946 E.0348
G1 X100.661 Y120.946
G1 X101.958 Y119.649 E.0348
G1 X101.324 Y119.725
G1 X100.103 Y120.946 E.03277
G1 X99.545 Y120.946
G1 X100.766 Y119.725 E.03277
G1 X100.208 Y119.725
G1 X98.557 Y121.376 E.04431
G1 X98.128 Y121.247
G1 X99.65 Y119.725 E.04084
G1 X99.092 Y119.725
G1 X98.128 Y120.688 E.02586
G1 X98.128 Y120.13
G1 X98.534 Y119.725 E.01088
M204 S10000
G1 X99.537 Y120.938 F28800
; FEATURE: Gap infill
; LINE_WIDTH: 0.125099
G1 F15000
G1 X99.406 Y120.906 E.00065
; LINE_WIDTH: 0.166877
G1 X99.048 Y121.395 E.00412
G1 X99.247 Y121.593 F28800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F15000
G1 X98.306 Y121.593 E.01786
G1 X98.306 Y168.786 E.89562
G1 X98.364 Y169.699 E.01736
G2 X102.275 Y175.363 I7.405 J-.931 E.13575
G1 X103.132 Y175.743 E.0178
G2 X106.342 Y176.188 I2.637 J-7.227 E.06197
G1 X107.27 Y176.048 E.0178
G2 X110.214 Y174.693 I-1.62 J-7.393 E.06198
G1 X110.919 Y174.088 E.01764
G2 X112.115 Y172.533 I-5.242 J-5.268 E.03734
G2 X112.87 Y170.732 I-6.354 J-3.724 E.03716
G2 X113.142 Y168.782 I-7.188 J-1.995 E.03747
G1 X113.142 Y121.593 E.89553
G1 X112.2 Y121.593 E.01786
G1 X112.2 Y168.809 E.89605
G3 X109.44 Y174.095 I-6.499 J-.03 E.11758
G1 X108.722 Y174.539 E.01601
G3 X105.739 Y175.274 I-3.051 J-5.957 E.05883
G3 X101.793 Y173.945 I.022 J-6.587 E.0804
G3 X99.247 Y168.781 I3.983 J-5.173 E.11315
G1 X99.247 Y121.653 E.89438
G1 X98.776 Y122.063 F28800
; LINE_WIDTH: 0.57168
G1 F15000
G1 X98.776 Y168.781 E1.22732
G1 X98.832 Y169.658 E.02309
G2 X102.511 Y174.953 I6.954 J-.906 E.17601
G1 X103.321 Y175.314 E.02329
G2 X106.321 Y175.713 I2.414 J-6.677 E.08013
G1 X107.199 Y175.585 E.02329
G2 X109.929 Y174.322 I-1.571 J-6.984 E.07963
G1 X110.602 Y173.741 E.02336
G2 X112.671 Y168.772 I-4.966 J-4.983 E.14511
G1 X112.671 Y122.123 E1.22549
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X112.671 Y124.123 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.274 I.481 J-1.118 P1  F28800
G1 X99.713 Y118.546 Z5.274
G1 Z4.874
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.998 Y119.261 E.01918
G1 X98.44 Y119.261
G1 X99.559 Y118.141 E.03004
G1 X99.001 Y118.141
G1 X97.882 Y119.261 E.03004
G1 X97.704 Y118.88
G1 X98.443 Y118.141 E.01984
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.98872
; LAYER_HEIGHT: 0.114895
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X97.704 Y118.88 E-.1192
G1 X97.882 Y119.261 E-.04785
G1 X98.26 Y118.882 E-.06095
; WIPE_END
G1 E-.012 F1800

G17
G3 Z5.274 I-.246 J1.192 P1  F28800
G1 X111.381 Y121.588 Z5.274
G1 Z4.989
G1 E.8 F1800
; FEATURE: Outer wall
G1 F12000
G1 X100.066 Y121.588 E.2094
G1 X100.066 Y168.8 E.87376
G2 X111.381 Y168.8 I5.657 J-.008 E.32864
G1 X111.381 Y121.648 E.87265
G1 X111.381 Y121.188 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.381 Y121.637 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.389 I.948 J.763 P1  F28800
G1 X111.498 Y119.008 Z5.389
G1 Z4.989
G1 E.8 F1800
G1 F12000
G1 X111.515 Y118.605 E.00745
G1 X113.144 Y118.605 E.03015
G1 X113.965 Y118.605 E.01519
G1 X113.961 Y168.795 E.92886
G3 X97.486 Y168.795 I-8.237 J-.006 E.47872
G1 X97.482 Y118.605 E.92886
G1 X99.932 Y118.605 E.04534
G1 X99.949 Y119.008 E.00745
G1 X111.438 Y119.008 E.21263
G1 X111.898 Y119.023 F28800
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X111.515 Y118.605 E-.04667
G1 X113.106 Y118.605 E-.18133
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.389 I-1.173 J.323 P1  F28800
G1 X113.165 Y118.823 Z5.389
G1 Z4.989
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X113.747 Y119.405 E.01523
G1 X113.747 Y119.964
G1 X112.606 Y118.823 E.02986
G1 X112.047 Y118.823
G1 X113.747 Y120.523 E.04449
G1 X113.747 Y121.082
G1 X111.714 Y119.049 E.05321
G1 X111.331 Y119.225
G1 X113.747 Y121.641 E.06323
G1 X113.747 Y122.2
G1 X110.772 Y119.225 E.07787
G1 X110.213 Y119.225
G1 X113.747 Y122.759 E.0925
G1 X113.747 Y123.318
G1 X109.654 Y119.225 E.10713
G1 X109.095 Y119.225
G1 X111.24 Y121.37 E.05614
G1 X110.681 Y121.37
G1 X108.536 Y119.225 E.05614
G1 X107.977 Y119.225
G1 X110.122 Y121.37 E.05614
G1 X109.563 Y121.37
G1 X107.418 Y119.225 E.05614
G1 X106.858 Y119.225
G1 X109.004 Y121.37 E.05614
G1 X108.444 Y121.37
G1 X106.299 Y119.225 E.05614
G1 X105.74 Y119.225
G1 X107.885 Y121.37 E.05614
G1 X107.326 Y121.37
G1 X105.181 Y119.225 E.05614
G1 X104.622 Y119.225
G1 X106.767 Y121.37 E.05614
G1 X106.208 Y121.37
G1 X104.063 Y119.225 E.05614
G1 X103.504 Y119.225
M73 P96 R0
G1 X105.649 Y121.37 E.05614
G1 X105.09 Y121.37
G1 X102.945 Y119.225 E.05614
G1 X102.386 Y119.225
G1 X104.531 Y121.37 E.05614
G1 X103.972 Y121.37
G1 X101.827 Y119.225 E.05614
G1 X101.267 Y119.225
G1 X103.413 Y121.37 E.05614
G1 X102.853 Y121.37
G1 X100.708 Y119.225 E.05614
G1 X100.149 Y119.225
G1 X102.294 Y121.37 E.05614
G1 X101.735 Y121.37
G1 X99.188 Y118.823 E.06667
G1 X98.629 Y118.823
G1 X101.176 Y121.37 E.06667
G1 X100.617 Y121.37
G1 X98.07 Y118.823 E.06667
G1 X97.7 Y119.012
G1 X100.058 Y121.37 E.06172
G1 X99.849 Y121.72
G1 X97.7 Y119.571 E.05625
G1 X97.7 Y120.13
G1 X99.849 Y122.279 E.05624
G1 X99.849 Y122.839
G1 X97.7 Y120.69 E.05624
G1 X97.7 Y121.249
G1 X99.849 Y123.398 E.05624
G1 X99.849 Y123.957
G1 X97.7 Y121.808 E.05624
G1 X97.7 Y122.367
G1 X99.849 Y124.516 E.05624
G1 X99.849 Y125.075
G1 X97.7 Y122.926 E.05624
G1 X97.7 Y123.485
G1 X99.849 Y125.634 E.05624
G1 X99.849 Y126.193
G1 X97.7 Y124.044 E.05624
G1 X97.7 Y124.604
G1 X99.849 Y126.752 E.05624
G1 X99.849 Y127.311
G1 X97.7 Y125.163 E.05623
G1 X97.7 Y125.722
G1 X99.849 Y127.87 E.05623
G1 X99.849 Y128.43
G1 X97.701 Y126.281 E.05623
G1 X97.701 Y126.84
G1 X99.849 Y128.989 E.05623
G1 X99.849 Y129.548
G1 X97.701 Y127.399 E.05623
G1 X97.701 Y127.958
G1 X99.849 Y130.107 E.05623
G1 X99.849 Y130.666
G1 X97.701 Y128.518 E.05623
G1 X97.701 Y129.077
G1 X99.849 Y131.225 E.05623
G1 X99.849 Y131.784
G1 X97.701 Y129.636 E.05623
G1 X97.701 Y130.195
G1 X99.849 Y132.343 E.05622
G1 X99.849 Y132.902
G1 X97.701 Y130.754 E.05622
G1 X97.701 Y131.313
G1 X99.849 Y133.461 E.05622
G1 X99.849 Y134.021
G1 X97.701 Y131.872 E.05622
G1 X97.701 Y132.432
G1 X99.849 Y134.58 E.05622
G1 X99.849 Y135.139
G1 X97.701 Y132.991 E.05622
G1 X97.701 Y133.55
G1 X99.849 Y135.698 E.05622
G1 X99.849 Y136.257
G1 X97.701 Y134.109 E.05622
G1 X97.701 Y134.668
G1 X99.849 Y136.816 E.05621
G1 X99.849 Y137.375
G1 X97.701 Y135.227 E.05621
G1 X97.701 Y135.786
G1 X99.849 Y137.934 E.05621
G1 X99.849 Y138.493
G1 X97.701 Y136.346 E.05621
G1 X97.701 Y136.905
G1 X99.849 Y139.052 E.05621
G1 X99.849 Y139.612
G1 X97.701 Y137.464 E.05621
G1 X97.701 Y138.023
G1 X99.849 Y140.171 E.05621
G1 X99.849 Y140.73
G1 X97.701 Y138.582 E.05621
G1 X97.702 Y139.141
G1 X99.849 Y141.289 E.05621
G1 X99.849 Y141.848
G1 X97.702 Y139.7 E.0562
G1 X97.702 Y140.26
G1 X99.849 Y142.407 E.0562
G1 X99.849 Y142.966
G1 X97.702 Y140.819 E.0562
G1 X97.702 Y141.378
G1 X99.849 Y143.525 E.0562
G1 X99.849 Y144.084
G1 X97.702 Y141.937 E.0562
G1 X97.702 Y142.496
G1 X99.849 Y144.643 E.0562
G1 X99.849 Y145.203
G1 X97.702 Y143.055 E.0562
G1 X97.702 Y143.615
G1 X99.849 Y145.762 E.0562
G1 X99.849 Y146.321
G1 X97.702 Y144.174 E.05619
G1 X97.702 Y144.733
G1 X99.849 Y146.88 E.05619
G1 X99.849 Y147.439
G1 X97.702 Y145.292 E.05619
G1 X97.702 Y145.851
G1 X99.849 Y147.998 E.05619
G1 X99.849 Y148.557
G1 X97.702 Y146.41 E.05619
G1 X97.702 Y146.969
G1 X99.849 Y149.116 E.05619
G1 X99.849 Y149.675
G1 X97.702 Y147.529 E.05619
G1 X97.702 Y148.088
G1 X99.849 Y150.234 E.05619
G1 X99.849 Y150.794
G1 X97.702 Y148.647 E.05619
G1 X97.702 Y149.206
G1 X99.849 Y151.353 E.05618
G1 X99.849 Y151.912
G1 X97.702 Y149.765 E.05618
G1 X97.702 Y150.324
G1 X99.849 Y152.471 E.05618
G1 X99.849 Y153.03
G1 X97.702 Y150.883 E.05618
G1 X97.702 Y151.443
G1 X99.849 Y153.589 E.05618
G1 X99.849 Y154.148
G1 X97.703 Y152.002 E.05618
G1 X97.703 Y152.561
G1 X99.849 Y154.707 E.05618
G1 X99.849 Y155.266
G1 X97.703 Y153.12 E.05618
G1 X97.703 Y153.679
G1 X99.849 Y155.825 E.05618
G1 X99.849 Y156.385
G1 X97.703 Y154.238 E.05617
G1 X97.703 Y154.797
G1 X99.849 Y156.944 E.05617
G1 X99.849 Y157.503
G1 X97.703 Y155.357 E.05617
G1 X97.703 Y155.916
G1 X99.849 Y158.062 E.05617
G1 X99.849 Y158.621
G1 X97.703 Y156.475 E.05617
G1 X97.703 Y157.034
G1 X99.849 Y159.18 E.05617
G1 X99.849 Y159.739
G1 X97.703 Y157.593 E.05617
G1 X97.703 Y158.152
G1 X99.849 Y160.298 E.05617
G1 X99.849 Y160.857
G1 X97.703 Y158.711 E.05616
G1 X97.703 Y159.271
G1 X99.849 Y161.416 E.05616
G1 X99.849 Y161.976
G1 X97.703 Y159.83 E.05616
G1 X97.703 Y160.389
G1 X99.849 Y162.535 E.05616
G1 X99.849 Y163.094
G1 X97.703 Y160.948 E.05616
G1 X97.703 Y161.507
G1 X99.849 Y163.653 E.05616
G1 X99.849 Y164.212
G1 X97.703 Y162.066 E.05616
G1 X97.703 Y162.625
G1 X99.849 Y164.771 E.05616
G1 X99.849 Y165.33
G1 X97.703 Y163.185 E.05616
G1 X97.703 Y163.744
G1 X99.849 Y165.889 E.05615
G1 X99.849 Y166.448
G1 X97.704 Y164.303 E.05615
G1 X97.704 Y164.862
G1 X99.849 Y167.007 E.05615
G1 X99.849 Y167.567
G1 X97.704 Y165.421 E.05615
G1 X97.704 Y165.98
G1 X99.849 Y168.126 E.05615
G1 X99.849 Y168.685
G1 X97.704 Y166.539 E.05615
G1 X97.704 Y167.099
G1 X99.88 Y169.275 E.05695
G1 X99.961 Y169.915
G1 X97.704 Y167.658 E.05907
G1 X97.704 Y168.217
G1 X100.164 Y170.677 E.0644
G1 X100.606 Y171.678
G1 X97.704 Y168.776 E.07597
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X99.118 Y170.19 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.389 I1.16 J.367 P1  F28800
G1 X113.747 Y123.877 Z5.389
G1 Z4.989
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X111.598 Y121.729 E.05624
G1 X111.598 Y122.288
M73 P97 R0
G1 X113.747 Y124.436 E.05624
G1 X113.747 Y124.995
G1 X111.598 Y122.847 E.05623
G1 X111.598 Y123.406
G1 X113.747 Y125.554 E.05623
G1 X113.747 Y126.114
G1 X111.598 Y123.965 E.05623
G1 X111.598 Y124.524
G1 X113.747 Y126.673 E.05623
G1 X113.747 Y127.232
G1 X111.598 Y125.083 E.05623
G1 X111.598 Y125.642
G1 X113.747 Y127.791 E.05623
G1 X113.747 Y128.35
G1 X111.598 Y126.201 E.05623
G1 X111.598 Y126.761
G1 X113.747 Y128.909 E.05623
G1 X113.747 Y129.468
G1 X111.598 Y127.32 E.05623
G1 X111.598 Y127.879
G1 X113.747 Y130.027 E.05622
G1 X113.746 Y130.586
G1 X111.598 Y128.438 E.05622
G1 X111.598 Y128.997
G1 X113.746 Y131.145 E.05622
G1 X113.746 Y131.704
G1 X111.598 Y129.556 E.05622
G1 X111.598 Y130.115
G1 X113.746 Y132.263 E.05622
G1 X113.746 Y132.822
G1 X111.598 Y130.674 E.05622
G1 X111.598 Y131.233
G1 X113.746 Y133.381 E.05622
G1 X113.746 Y133.94
G1 X111.598 Y131.792 E.05622
G1 X111.598 Y132.352
G1 X113.746 Y134.499 E.05622
G1 X113.746 Y135.058
G1 X111.598 Y132.911 E.05621
G1 X111.598 Y133.47
G1 X113.746 Y135.617 E.05621
G1 X113.746 Y136.177
G1 X111.598 Y134.029 E.05621
G1 X111.598 Y134.588
G1 X113.746 Y136.736 E.05621
G1 X113.746 Y137.295
G1 X111.598 Y135.147 E.05621
G1 X111.598 Y135.706
G1 X113.746 Y137.854 E.05621
G1 X113.746 Y138.413
G1 X111.598 Y136.265 E.05621
G1 X111.598 Y136.824
G1 X113.746 Y138.972 E.05621
G1 X113.746 Y139.531
G1 X111.598 Y137.383 E.0562
G1 X111.598 Y137.942
G1 X113.746 Y140.09 E.0562
G1 X113.746 Y140.649
G1 X111.598 Y138.502 E.0562
G1 X111.598 Y139.061
G1 X113.746 Y141.208 E.0562
G1 X113.746 Y141.767
G1 X111.598 Y139.62 E.0562
G1 X111.598 Y140.179
G1 X113.746 Y142.326 E.0562
G1 X113.746 Y142.885
G1 X111.598 Y140.738 E.0562
G1 X111.598 Y141.297
G1 X113.745 Y143.444 E.0562
G1 X113.745 Y144.003
G1 X111.598 Y141.856 E.0562
G1 X111.598 Y142.415
G1 X113.745 Y144.562 E.05619
G1 X113.745 Y145.121
G1 X111.598 Y142.974 E.05619
G1 X111.598 Y143.533
G1 X113.745 Y145.68 E.05619
G1 X113.745 Y146.24
G1 X111.598 Y144.093 E.05619
G1 X111.598 Y144.652
G1 X113.745 Y146.799 E.05619
G1 X113.745 Y147.358
G1 X111.598 Y145.211 E.05619
G1 X111.598 Y145.77
G1 X113.745 Y147.917 E.05619
G1 X113.745 Y148.476
G1 X111.598 Y146.329 E.05619
G1 X111.598 Y146.888
G1 X113.745 Y149.035 E.05618
G1 X113.745 Y149.594
G1 X111.598 Y147.447 E.05618
G1 X111.598 Y148.006
G1 X113.745 Y150.153 E.05618
G1 X113.745 Y150.712
G1 X111.598 Y148.565 E.05618
G1 X111.598 Y149.124
G1 X113.745 Y151.271 E.05618
G1 X113.745 Y151.83
G1 X111.598 Y149.684 E.05618
G1 X111.598 Y150.243
G1 X113.745 Y152.389 E.05618
G1 X113.745 Y152.948
G1 X111.598 Y150.802 E.05618
G1 X111.598 Y151.361
G1 X113.745 Y153.507 E.05618
G1 X113.745 Y154.066
G1 X111.598 Y151.92 E.05617
G1 X111.598 Y152.479
G1 X113.745 Y154.625 E.05617
G1 X113.745 Y155.184
G1 X111.598 Y153.038 E.05617
G1 X111.598 Y153.597
G1 X113.745 Y155.743 E.05617
G1 X113.744 Y156.302
G1 X111.598 Y154.156 E.05617
G1 X111.598 Y154.715
G1 X113.744 Y156.862 E.05617
G1 X113.744 Y157.421
G1 X111.598 Y155.275 E.05617
G1 X111.598 Y155.834
G1 X113.744 Y157.98 E.05617
G1 X113.744 Y158.539
G1 X111.598 Y156.393 E.05617
G1 X111.598 Y156.952
G1 X113.744 Y159.098 E.05616
G1 X113.744 Y159.657
G1 X111.598 Y157.511 E.05616
G1 X111.598 Y158.07
G1 X113.744 Y160.216 E.05616
G1 X113.744 Y160.775
G1 X111.598 Y158.629 E.05616
G1 X111.598 Y159.188
G1 X113.744 Y161.334 E.05616
G1 X113.744 Y161.893
G1 X111.598 Y159.747 E.05616
G1 X111.598 Y160.306
G1 X113.744 Y162.452 E.05616
G1 X113.744 Y163.011
G1 X111.598 Y160.866 E.05616
G1 X111.598 Y161.425
G1 X113.744 Y163.57 E.05615
G1 X113.744 Y164.129
G1 X111.598 Y161.984 E.05615
G1 X111.598 Y162.543
G1 X113.744 Y164.688 E.05615
G1 X113.744 Y165.247
G1 X111.598 Y163.102 E.05615
G1 X111.598 Y163.661
G1 X113.744 Y165.806 E.05615
G1 X113.744 Y166.365
G1 X111.598 Y164.22 E.05615
G1 X111.598 Y164.779
G1 X113.744 Y166.925 E.05615
G1 X113.744 Y167.484
G1 X111.598 Y165.338 E.05615
G1 X111.598 Y165.897
G1 X113.744 Y168.043 E.05615
G1 X113.743 Y168.602
G1 X111.598 Y166.457 E.05614
G1 X111.598 Y167.016
G1 X113.735 Y169.153 E.05593
G1 X113.69 Y169.667
G1 X111.598 Y167.575 E.05475
G1 X111.598 Y168.134
G1 X113.62 Y170.155 E.05291
G1 X113.529 Y170.624
G1 X111.598 Y168.693 E.05053
G1 X111.58 Y169.233
G1 X113.411 Y171.065 E.04793
G1 X113.277 Y171.49
G1 X111.52 Y169.733 E.04597
G1 X111.425 Y170.197
G1 X113.116 Y171.888 E.04425
G1 X112.945 Y172.276
G1 X111.3 Y170.631 E.04307
G1 X111.148 Y171.039
G1 X112.754 Y172.644 E.04202
G1 X112.552 Y173.001
G1 X110.974 Y171.423 E.04129
G1 X110.779 Y171.787
G1 X112.327 Y173.335 E.04053
G1 X112.097 Y173.664
G1 X110.561 Y172.128 E.0402
G1 X110.321 Y172.448
G1 X111.843 Y173.969 E.03983
G1 X111.583 Y174.269
G1 X110.064 Y172.749 E.03977
G1 X109.789 Y173.033
G1 X111.304 Y174.548 E.03965
G1 X111.014 Y174.818
G1 X109.497 Y173.301 E.0397
G1 X109.18 Y173.543
G1 X110.71 Y175.073 E.04003
G1 X110.389 Y175.311
G1 X108.841 Y173.763 E.04052
G1 X108.493 Y173.974
G1 X110.061 Y175.542 E.04102
G1 X109.708 Y175.748
G1 X108.117 Y174.158 E.04164
G1 X107.718 Y174.318
G1 X109.348 Y175.948 E.04266
G1 X108.967 Y176.125
G1 X107.295 Y174.453 E.04377
G1 X106.843 Y174.56
G1 X108.574 Y176.292 E.04532
G1 X108.155 Y176.432
G1 X106.355 Y174.631 E.04712
G1 X105.83 Y174.666
G1 X107.725 Y176.56 E.04959
M73 P98 R0
G1 X107.267 Y176.662
G1 X105.257 Y174.652 E.05259
G1 X104.608 Y174.562
G1 X106.785 Y176.739 E.05697
G1 X106.283 Y176.796
G1 X103.847 Y174.36 E.06375
G1 X102.842 Y173.914
G1 X105.737 Y176.81 E.07577
G1 X105.16 Y176.791
G1 X97.731 Y169.362 E.19444
G1 X97.798 Y169.988
G1 X104.533 Y176.723 E.17627
G1 X103.837 Y176.587
G1 X97.935 Y170.684 E.15449
G1 X98.175 Y171.484
G1 X103.038 Y176.346 E.12726
G1 X102.063 Y175.931
G1 X98.59 Y172.458 E.0909
M204 S10000
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X100.004 Y173.872 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.389 I.942 J.771 P1  F28800
G1 X101.151 Y172.471 Z5.389
G1 Z4.989
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0725799
G1 F15000
G1 X100.892 Y172.181 E.00087
; LINE_WIDTH: 0.112245
G1 X100.775 Y172.036 E.00077
; LINE_WIDTH: 0.146038
G1 X100.658 Y171.89 E.00106
; LINE_WIDTH: 0.179831
G1 X100.541 Y171.744 E.00136
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X100.658 Y171.89 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.389 I-.495 J1.112 P1  F28800
G1 X109.516 Y175.836 Z5.389
G1 Z4.989
G1 E.8 F1800
; LINE_WIDTH: 0.0908985
G1 F15000
G3 X109.4 Y175.924 I-1.061 J-1.288 E.00045
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X109.516 Y175.836 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.389 I-.447 J-1.132 P1  F28800
G1 X107.913 Y176.469 Z5.389
G1 Z4.989
G1 E.8 F1800
; LINE_WIDTH: 0.0870596
G1 F15000
G1 X107.752 Y176.557 E.00054
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X107.913 Y176.469 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.389 I.178 J-1.204 P1  F28800
G1 X101.316 Y175.494 Z5.389
G1 Z4.989
G1 E.8 F1800
; LINE_WIDTH: 0.0720979
G1 F15000
G1 X101.14 Y175.349 E.00051
; LINE_WIDTH: 0.11219
G1 X100.877 Y175.118 E.00143
; LINE_WIDTH: 0.157947
G1 X100.614 Y174.887 E.00218
; LINE_WIDTH: 0.218819
G3 X99.634 Y173.908 I10.733 J-11.713 E.0126
; LINE_WIDTH: 0.203698
G1 X99.404 Y173.646 E.00292
; LINE_WIDTH: 0.158116
G1 X99.174 Y173.384 E.00218
; LINE_WIDTH: 0.112535
G1 X99.043 Y173.22 E.00086
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X99.174 Y173.384 E-.228
; WIPE_END
G1 E-.012 F1800
G17
G3 Z5.389 I-.199 J1.201 P1  F28800
G1 X102.776 Y173.981 Z5.389
G1 Z4.989
G1 E.8 F1800
; LINE_WIDTH: 0.214153
G1 F15000
G1 X102.567 Y173.809 E.00241
; LINE_WIDTH: 0.167255
G1 X102.357 Y173.637 E.00181
; LINE_WIDTH: 0.114634
G3 X102.119 Y173.44 I3.474 J-4.446 E.0013
; close powerlost recovery
M1003 S0
G1 E-.56 F1800
; WIPE_START
G1 F23040
G1 X102.357 Y173.637 E-.228
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
G1 Z5.48872 F900 ; lower z a little
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

    G1 Z104.989 F600
    G1 Z102.989

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

