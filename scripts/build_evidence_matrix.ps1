param(
    [string]$ManifestPath = (Join-Path $PSScriptRoot '..\referenced\papers_manifest.tsv'),
    [string]$OutputPath = (Join-Path $PSScriptRoot '../evidence_matrix.csv'),
    [string]$AuditPath = (Join-Path $PSScriptRoot '../referenced/fulltext_audits.tsv')
)

$ErrorActionPreference = 'Stop'
$records = Import-Csv -LiteralPath $ManifestPath -Delimiter "`t"
# Located full-text audits override coarse metadata rules, without changing the
# separate 30-paper precision schema. Keep the audited version and date explicit.
$audits = @{}
$auditFields = @('task_contact_topology','tactile_evidence','representation_level',
    'structural_prior','deployment_observability','system_evidence')
foreach ($audit in @(Import-Csv -LiteralPath $AuditPath -Delimiter "`t")) {
    if ($audits.ContainsKey($audit.slug)) { throw "Duplicate full-text audit: $($audit.slug)" }
    if ($audit.slug -notin $records.slug) { throw "Full-text audit absent from manifest: $($audit.slug)" }
    foreach ($field in @('slug','audit_date','fulltext_url','evidence_locator','coding_note') + $auditFields) {
        if ([string]::IsNullOrWhiteSpace($audit.$field)) { throw "Missing audit field $field for $($audit.slug)" }
    }
    $audits[$audit.slug] = $audit
}

$tactileDirect = @(
    'T-Rex','TAMEn','ViTacFormer','SaTA','TouchWGNN','RoboPack','FTP-1',
    'VTDexManip','Contact-Grounded-Policy','Semantic-Contact-Fields','Bi-Touch',
    'Handover-Control','Active-Contact-Handover','Multiple-Tactile-Events','Sparsh',
    'UniTouch','AnyTouch','T3','UniT','Sparsh-X','HTT','HandTouch-HTBench',
    'TactAlign','Tactile-Genesis','TouchWorld','RCT','T-Dex','TactileVAD',
    'Reactive-Diffusion-Policy','Touch-and-Go','Distributed-Tactile-GCN','TacGNN',
    'TactiGraph','TacGraph','Neural-Contact-Fields','ViTaSCOPE',
    'Tactile-Tool-Manipulation','TACTIC','Compliant-Tool-Dynamics',
    'Extrinsic-Contact-Mode-Control','Tactile-Dexterity-Primitives','TactiDex',
    'HiTac-WAM','VT-MUSE','ViTacPhys','Spatiotemporal-Slip-Transformer',
    'Durable-Tactile-Fingertip','SoftVTBench'
)

$graphMethods = @(
    'PhysGraph','TouchWGNN','RoboPack','Distributed-Tactile-GCN','TacGNN',
    'TactiGraph','TacGraph','NerveNet','Graphormer','AnyMorph','Interaction-Networks',
    'Graph-Network-Simulator','GNS-Rigid-Contact','MeshPriorDiT'
)

$anchoredOrField = @(
    'SaTA','Contact-Grounded-Policy','Semantic-Contact-Fields','Neural-Contact-Fields',
    'ViTaSCOPE','Contact-Anchored-Policies','Extrinsic-Contact-Mode-Control','TACTIC'
)

$bimanualObserved = @(
    'T-Rex','TAMEn','ViTacFormer','SaTA','VTDexManip','Bi-Touch','Handover-Control',
    'ContactHandover','Active-Contact-Handover','Multiple-Tactile-Events','TactiDex',
    'Robust-Bimanual-Modality-Masking','PartialBiGrasp','CLAP','Robot-Juggling',
    'TemporalFlow-VLA'
)

$realEvidence = @(
    'T-Rex','TAMEn','ViTacFormer','SaTA','TouchWGNN','RoboPack','FTP-1',
    'Contact-Grounded-Policy','Semantic-Contact-Fields','Handover-Control',
    'ContactHandover','Active-Contact-Handover','Multiple-Tactile-Events','DexUMI',
    'Bidex','DexImit','Sparsh','UniTouch','AnyTouch','T3','UniT','Sparsh-X','HTT',
    'HandTouch-HTBench','TactAlign','TouchWorld','RCT','T-Dex','TactileVAD',
    'Reactive-Diffusion-Policy','Touch-and-Go','Distributed-Tactile-GCN','TacGNN',
    'TactiGraph','TacGraph','Neural-Contact-Fields','ViTaSCOPE',
    'Tactile-Tool-Manipulation','Contact-Anchored-Policies','TACTIC',
    'Compliant-Tool-Dynamics','Extrinsic-Contact-Mode-Control','GeoDEx',
    'Tactile-Dexterity-Primitives','TactiDex','HiTac-WAM','VT-MUSE','ViTacPhys',
    'Spatiotemporal-Slip-Transformer','Durable-Tactile-Fingertip',
    'One-Shot-Physical-Interactions','CoToGrasp','Robust-Bimanual-Modality-Masking',
    'PartialBiGrasp','CLAP','Robot-Juggling','Relaxation-Aware-Soft-Gripper'
)

function Get-EvidenceTier($r) {
    $s = $r.status.ToLowerInvariant()
    if ($s -match 'community') { return 'community_resource' }
    # Author-reported acceptance is not an independently verified venue record.
    if ($s -match 'author page|author-reported|author claim') { return 'preprint_or_author_claim' }
    if ($s -match 'accepted|program') { return 'accepted_or_program_listed' }
    if ($s -match 'preprint|under review|author page') { return 'preprint_or_author_claim' }
    return 'peer_reviewed'
}

function Get-TaskTopology($r) {
    if ($r.slug -eq 'Bimanual-Manipulation-Taxonomy') { return 'taxonomy_across_bimanual_topologies' }
    if ($r.slug -eq 'Open-X-Tactile') { return 'cross_dataset_resource' }
    if ($r.slug -eq 'SoftVTBench') { return 'single_gripper_deformable_object_manipulation' }
    if ($r.slug -eq 'HiTac-WAM') { return 'single_gripper_contact_rich_manipulation' }
    if ($r.slug -eq 'VT-MUSE') { return 'single_gripper_contact_rich_manipulation' }
    if ($r.slug -eq 'ViTacPhys') { return 'single_gripper_property_aware_grasping' }
    if ($r.slug -eq 'One-Shot-Physical-Interactions') { return 'contact_transition_structured_tool_or_environment_interaction' }
    if ($r.slug -eq 'CoToGrasp') { return 'single_hand_contact_topology_conditioned_grasping' }
    if ($r.slug -eq 'MeshPriorDiT') { return 'action_conditioned_deformable_cloth_dynamics' }
    if ($r.slug -eq 'Relaxation-Aware-Soft-Gripper') { return 'sustained_soft_gripper_contact_and_hold' }
    if ($r.slug -eq 'FLARE') { return 'failure_detection_retry_and_reset_for_contact_rich_manipulation' }
    if ($r.slug -eq 'PredVLA') { return 'generic_short_and_long_horizon_manipulation' }
    if ($r.category -eq '02_tactile_representation') { return 'task_agnostic_or_single_interface_pretraining' }
    if ($r.category -eq '04_tool_workpiece_control') { return 'hand_tool_environment_or_workpiece' }
    if ($r.category -eq '05_datasets_benchmarks') {
        if ($r.slug -in @('OakInk2','TACO','DexJoCo','DexVerse')) { return 'bimanual_multi_object_or_tool_benchmark' }
        return 'dexterous_tactile_benchmark'
    }
    if ($r.category -eq '01_bimanual_handover') {
        if ($r.title -match 'Handover|Load Transfer|Object Transfer') { return 'handover_and_load_transfer' }
        return 'bimanual_shared_object_or_role_asymmetric'
    }
    if ($r.slug -in @('PhysGraph','Semantic-Contact-Fields')) { return 'hand_tool_object_or_environment' }
    if ($r.slug -in @('T-Rex','ViTacFormer','VTDexManip','Bi-Touch')) { return 'bimanual_shared_object_or_handover' }
    if ($r.slug -eq 'TAMEn') { return 'bimanual_tool_workpiece' }
    if ($r.slug -eq 'RoboPack') { return 'tool_object_environment' }
    if ($r.category -eq '03_graph_physics_contact') { return 'single_hand_contact_or_generic_physics' }
    return 'mixed_contact_rich_manipulation'
}

function Get-TactileEvidence($r) {
    if ($r.slug -eq 'PhysGraph') { return 'simulator_fingertip_resultant_forces' }
    if ($r.slug -eq 'FLARE') { return 'none_or_not_central' }
    if ($r.slug -in $tactileDirect) { return 'direct_tactile_or_interface_force_observation' }
    if ($r.tags -match 'force|contact') { return 'contact_or_force_signal_not_tactile_array' }
    return 'none_or_not_central'
}

function Get-RepresentationLevel($r) {
    if ($r.slug -eq 'HiTac-WAM') { return 'hierarchical_predictive_tactile_state' }
    if ($r.slug -eq 'VT-MUSE') { return 'sequential_visuotactile_embedding' }
    if ($r.slug -eq 'ViTacPhys') { return 'physical_property_latent' }
    if ($r.slug -eq 'SoftVTBench') { return 'dataset_or_benchmark_representation' }
    if ($r.slug -eq 'One-Shot-Physical-Interactions') { return 'contact_event_hybrid_state_machine' }
    if ($r.slug -eq 'CoToGrasp') { return 'contact_topology_conditioned_grasp_representation' }
    if ($r.slug -eq 'Relaxation-Aware-Soft-Gripper') { return 'temperature_coupled_viscoelastic_force_state' }
    if ($r.slug -eq 'FLARE') { return 'failure_monitor_and_recovery_state' }
    if ($r.slug -eq 'PredVLA') { return 'predictive_coding_visual_proprioceptive_latent' }
    if ($r.slug -eq 'CLAP') { return 'action_conditioned_cross_embodiment_video_world_model' }
    if ($r.slug -eq 'Robot-Juggling') { return 'online_local_dynamics_model_with_global_prior' }
    if ($r.slug -eq 'TemporalFlow-VLA') { return 'temporally_ordered_execution_history_queries' }
    if ($r.slug -in $graphMethods) { return 'explicit_graph_or_relational_model' }
    if ($r.slug -in $anchoredOrField) { return 'spatial_anchor_contact_field_or_mode' }
    if ($r.category -eq '02_tactile_representation') { return 'local_or_temporal_tactile_embedding' }
    if ($r.category -eq '01_bimanual_handover') { return 'policy_state_or_object_centric_coordination' }
    if ($r.category -eq '05_datasets_benchmarks') { return 'dataset_or_benchmark_representation' }
    if ($r.category -eq '04_tool_workpiece_control') { return 'contact_state_dynamics_or_controller' }
    return 'multimodal_policy_or_dynamics_latent'
}

function Get-StructuralPrior($r) {
    if ($r.slug -eq 'HiTac-WAM') { return 'directed_contact_deformation_slip_hierarchy' }
    if ($r.slug -eq 'VT-MUSE') { return 'temporal_cross_modal_alignment_and_masked_reconstruction' }
    if ($r.slug -eq 'ViTacPhys') { return 'mass_friction_stiffness_property_tokens' }
    if ($r.slug -eq 'One-Shot-Physical-Interactions') { return 'demonstrated_contact_transition_structure' }
    if ($r.slug -eq 'CoToGrasp') { return 'prespecified_grasp_contact_topology' }
    if ($r.slug -eq 'MeshPriorDiT') { return 'mesh_topology_prior_plus_diffusion_residual' }
    if ($r.slug -eq 'Relaxation-Aware-Soft-Gripper') { return 'temperature_coupled_viscoelastic_relaxation_model' }
    if ($r.slug -eq 'FLARE') { return 'retry_bridging_and_object_centric_reset_structure' }
    if ($r.slug -eq 'PredVLA') { return 'prediction_error_driven_recurrent_inference' }
    if ($r.slug -eq 'CLAP') { return 'cross_embodiment_action_and_language_alignment' }
    if ($r.slug -eq 'Robot-Juggling') { return 'safe_set_constrained_online_local_model' }
    if ($r.slug -eq 'TemporalFlow-VLA') { return 'training_only_robot_surface_temporal_flow' }
    if ($r.slug -in $graphMethods) { return 'graph_connectivity_or_relational_message_passing' }
    if ($r.slug -in $anchoredOrField) { return 'kinematic_spatial_or_contact_anchor' }
    if ($r.slug -in @('Object-Centric-Bimanual','DexMachina','ManipTrans','SimToolReal')) { return 'object_centric_or_reference_structure' }
    if ($r.category -eq '02_tactile_representation') { return 'sensor_tokenization_and_temporal_or_multimodal_alignment' }
    return 'implicit_in_policy_state_or_task_design'
}

function Get-Deployability($r) {
    if ($r.slug -eq 'PhysGraph') { return 'privileged_simulator_state_and_future_reference' }
    if ($r.slug -in @('Bi-DexHands','Dynamic-Handover','Learning-Dexterous-Handover','DexJoCo','DexVerse')) { return 'simulation_or_privileged_training_focus' }
    if ($r.slug -eq 'Open-X-Tactile') { return 'resource_not_a_deployed_model' }
    if ($r.slug -eq 'MeshPriorDiT') { return 'mesh_state_and_material_adjacency_require_observation_audit' }
    if ($r.slug -eq 'Relaxation-Aware-Soft-Gripper') { return 'deployable_onboard_vision_and_thermal_observations' }
    if ($r.slug -eq 'PredVLA') { return 'deployable_vision_and_proprioception_without_touch' }
    if ($r.slug -eq 'FLARE') { return 'deployable_visual_language_monitor_without_touch' }
    if ($r.slug -in $bimanualObserved) { return 'deployable_observations_with_bimanual_relevance' }
    if ($r.slug -in $tactileDirect) { return 'deployable_tactile_or_force_observations' }
    return 'mixed_or_not_applicable'
}

function Get-SystemEvidence($r) {
    if ($r.slug -eq 'Open-X-Tactile') { return 'resource_index' }
    if ($r.slug -in @('Tactile-Genesis','Graph-Network-Simulator','GNS-Rigid-Contact','Interaction-Networks','ContactNets','PredVLA','TemporalFlow-VLA')) { return 'simulation_or_synthetic' }
    if ($r.slug -in $realEvidence) { return 'real_robot_or_real_sensor_evidence' }
    if ($r.category -eq '05_datasets_benchmarks') { return 'dataset_or_benchmark' }
    if ($r.category -eq '01_bimanual_handover') { return 'simulation_real_or_demonstration_depending_on_study' }
    return 'algorithmic_or_mixed_evidence'
}

$i = 0
$matrix = foreach ($r in $records) {
    $i++
    $entry = [pscustomobject]@{
        record_id = ('R{0:d3}' -f $i)
        year = [int]$r.year
        title = $r.title
        slug = $r.slug
        publication_status_raw = $r.status
        evidence_tier = Get-EvidenceTier $r
        archive_category = $r.category
        task_contact_topology = Get-TaskTopology $r
        tactile_evidence = Get-TactileEvidence $r
        representation_level = Get-RepresentationLevel $r
        structural_prior = Get-StructuralPrior $r
        deployment_observability = Get-Deployability $r
        system_evidence = Get-SystemEvidence $r
        source_url = $r.source_url
        pdf_url = $r.pdf_url
        tags = $r.tags
        included_in_study_synthesis = if ($r.slug -eq 'Open-X-Tactile') { 'no_resource_only' } else { 'yes' }
        coding_note = 'Rule-assisted coding from archived paper metadata; manually review before inferential use.'
    }
    if ($audits.ContainsKey($r.slug)) {
        $audit = $audits[$r.slug]
        foreach ($field in $auditFields) { $entry.$field = $audit.$field }
        $entry.coding_note = "Full-text archive audit $($audit.audit_date); $($audit.fulltext_url); $($audit.evidence_locator). $($audit.coding_note) Not a precision-subset record."
    }
    $entry
}

$matrix | Export-Csv -LiteralPath $OutputPath -NoTypeInformation -Encoding utf8

$byTier = $matrix | Group-Object evidence_tier | Sort-Object Name
$byCategory = $matrix | Group-Object archive_category | Sort-Object Name
Write-Host "Wrote $($matrix.Count) records to $OutputPath"
Write-Host 'Evidence tiers:'
$byTier | ForEach-Object { Write-Host ("  {0}: {1}" -f $_.Name, $_.Count) }
Write-Host 'Archive categories:'
$byCategory | ForEach-Object { Write-Host ("  {0}: {1}" -f $_.Name, $_.Count) }
