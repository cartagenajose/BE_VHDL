  --Example instantiation for system 'mon_sopc'
  mon_sopc_inst : mon_sopc
    port map(
      ledBabord_from_the_avalon_gestion_bp_0 => ledBabord_from_the_avalon_gestion_bp_0,
      ledSTBY_from_the_avalon_gestion_bp_0 => ledSTBY_from_the_avalon_gestion_bp_0,
      ledTribord_from_the_avalon_gestion_bp_0 => ledTribord_from_the_avalon_gestion_bp_0,
      out_bip_from_the_avalon_gestion_bp_0 => out_bip_from_the_avalon_gestion_bp_0,
      out_port_from_the_LED => out_port_from_the_LED,
      out_pwm_from_the_avalon_pwm_0 => out_pwm_from_the_avalon_pwm_0,
      BP_Babord_to_the_avalon_gestion_bp_0 => BP_Babord_to_the_avalon_gestion_bp_0,
      BP_STBY_to_the_avalon_gestion_bp_0 => BP_STBY_to_the_avalon_gestion_bp_0,
      BP_Tribord_to_the_avalon_gestion_bp_0 => BP_Tribord_to_the_avalon_gestion_bp_0,
      clk_0 => clk_0,
      in_freq_anemometre_to_the_avalon_anemo_0 => in_freq_anemometre_to_the_avalon_anemo_0,
      in_port_to_the_Button => in_port_to_the_Button,
      in_pwm_compas_to_the_avalon_compas_0 => in_pwm_compas_to_the_avalon_compas_0,
      reset_n => reset_n
    );


