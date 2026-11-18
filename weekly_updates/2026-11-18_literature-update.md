# 2026-11-18 DexT 文献补更与证据解释

## 检索窗口、纳入和版本控制

- 本轮覆盖 11 月 4 日 UTC 重叠日至 11 月 18 日实际检索时段（约 07:28–07:34 UTC，以来源返回为准；不声称 18 日全天）。11 月 4 日上午交付后的 Qin 等（15:45:40 UTC）确实漏出上轮截止；LumiTac 同日 04:24:45 UTC 早于上轮交付，属于重叠查漏，不能算截止后首发。另补入 10 月 29 日首发的 Kinematic--Tactile Retargeting。
- 纳入 22 条全文核读记录：20 篇上轮交付后首发、1 篇同日较早查漏、1 篇 10 月积压。共 193 条记录（192 学术、1 资源），104 条定位式全文归档审读；仿真和无触觉双臂研究仅按实际证据层级归类。精标 30 篇及 8 月 13 日精标日期不变。
- 已核对最新 main（`6804f9c99d0af044babda4755c0c48d47c3ae9a5`）与仍开放的草稿 PR #6，基于 #6 的 `c4e8dc04ce5fc9f7e5074bc3c07ec0994359edde` 叠加，不覆盖旧分支、不自动合并。
- 检索日期与正文证据冻结日期分别记录：检索 2026-11-18 UTC；完成全文审读和正文整合后，正文证据冻结 2026-11-18。没有刷新历史全文缓存、重跑外部论文实验或共享第三方全文。
- [来源时间、版本和 SHA-256](2026-11-18_sources.tsv)；[列表检索和观察名单](2026-11-18_search-audit.md)；[版本及官方议程核验](2026-11-18_revision-audit.md)。原始列表及准确版本来源字节用于核查，未上传仓库。
- 发表状态：MDF++ 在 CoRL [官方接收议程](https://2026.corl.org/program/accepted-papers)列为 #158 海报；Yang、Kim 分别在 [CoRL 灵巧操作研讨会](https://dex-manipulation.github.io/corl2026/#papers) 与 [Everything Beneath the Policy 研讨会](https://beneath-the-policy.github.io/)列出，不是主会录用。ForceLDM 现核实 [NeurIPS 2026 海报](https://neurips.cc/virtual/2026/poster/156065)，不是最终论文集证据。新条目中的 T-RO/ROBIO 作者声明仍未独立验证。

## 结论如何变化

- **匹配表示证据更强。** DexRemo 在固定任务、模型和测力下比较坐标；LingBot-Touch 固定示教比较学习 token 与原始触觉，并包含实机双手交接。WiTac 在保留策略腕部 RGB 的情况下，更改触觉编码器的腕部条件和预训练分支。三者都不能外推为独立跨界面载荷识别或新接触拓扑的完整策略迁移。
- **监督、控制和指标分开。** TaF-Foundation 支持局部六轴力标定与有标签适配，TacBridge 的逐帧翻译真值是仿真，DLO 是独立形状而非跨界面载荷真值。WiTac 的 19/20 是拔出阶段，8/20 才是 GR00T 完整拔插；LingBot 报分阶段任务分数。只用物体位姿的真实协调是相关对照，不算触觉策略验证。
- **核心联合缺口保留。** 在本轮有定位的证据中，部署可观测的跨界面载荷推断、匹配表示收益、明确留出的接触拓扑迁移尚未获得共同验证。不新增全库零计数，不预设图模型胜出。

## 纳入、证据位置与限制

### LingBot-Touch
- [Learning Heterogeneous Tactile Representation for General Dexterous Manipulation](https://arxiv.org/pdf/2611.12806v1) · 首发 2026-11-09 18:12:00 UTC · 审读版 2611.12806v1（2026-11-09 18:12:00 UTC）。
- 状态：preprint。位置：5.1–5.3; Table 2; Figure 11; Table 6; Appendix B。
- 证据边界：Using same task demonstrations and matched policy settings, LingBot-VLA scores 48.28 no touch, 56.50 raw touch and 73.09 frozen tactile tokens across 26 physical tasks; Appendix B allows staged/partial credit, so not binary success rates. Box handover raw vs tokens 59 vs 69 on Sharpa and 54 vs 74 on XHand1; XHand1 T-Rex 61 vs 61. XHand1 magnetic sensor held out of encoder pretraining; downstream policies and readouts trained and force probes separately trained on one hand. Per-active-hand encoding does not establish cross-interface load inference or topology-held-out policy transfer.

### WiTac
- [WiTac: Wrist-Informed Tactile Representations for Contact-Rich Manipulation](https://arxiv.org/html/2611.21057v2) · 首发 2026-11-16 13:08:09 UTC · 审读版 2611.21057v2（2026-11-17 08:21:01 UTC）。
- 状态：preprint。位置：3.1–3.4; 4.1–4.3 Tables 1–2; Appendices A.2, B.1–B.3。
- 证据边界：GR00T full USB extraction/reinsertion 8/20 vs 1/20 WiTac-NW and 2/20 base; 19/20 is extraction only. Native VLA wrist RGB is retained; NW removes encoder wrist cross-attention and masked visual recovery, so this is a bundled encoder/pretraining ablation, not a no-camera comparison. Four tasks excluded from encoder pretraining but 200 new demonstrations per task used downstream. USB completion does not measure contact warning lead time or slowdown impact.

### TaF-Foundation
- [TaF-Foundation: Wrench-Grounded Cross-Sensor Tactile Representations](https://arxiv.org/html/2611.20718v1) · 首发 2026-11-16 08:25:06 UTC · 审读版 2611.20718v1（2026-11-16 08:25:06 UTC）。
- 状态：preprint。位置：3; 4; 5.1–5.5, Table 5; Appendix A.4 and Table S2。
- 证据边界：Three sensor entries held out of source training, but adapters/heads trained with labeled adaptation; indenter splits disjoint. Magnetic-sensor board-cleaning updates input module/wrench head while freezing backbone before policy training. Four real tasks, 20 trials each: 46.25% vs strongest complete baseline AnyTouch2 23.75%; UniVTAC reports three tasks only. Local wrench grounding, not cross-interface load inference or zero-shot control.

### TacBridge
- [TacBridge: Learning Unified Tactile Representations through Cross-Sensor Correspondence](https://arxiv.org/html/2611.20939v1) · 首发 2026-11-16 11:51:42 UTC · 审读版 2611.20939v1（2026-11-16 11:51:42 UTC）。
- 状态：preprint。位置：III; IV-A–E; Tables I–III。
- 证据边界：Frame-level sensor translation benchmark uses 15,552 held-out simulated pairs; contact PSNR 28.83 dB vs AnyTouch 26.30 dB, residual FID 58.3 vs 63.5. Real TacQuad event pairs are matched by contact progress, not synchronized frame-level ground truth. Downstream perception uses separately fitted readouts on frozen features; not proof of physical policy transfer or cross-interface wrench inference.

### PCTac
- [PCTac: Mechanochromic Photonic-Crystal Tactile Sensor for Dexterous Manipulation](https://arxiv.org/html/2611.12383v1) · 首发 2026-11-09 13:20:49 UTC · 审读版 2611.12383v1（2026-11-09 13:20:49 UTC）。
- 状态：preprint。位置：II–III; IV-A–D Table II; V。
- 证据边界：Perturbed tube insertion 16/30 hue versus 13/30 for each Wedge/PCTac RGB comparator and 1/30 vision only; standard tube insertion 28/30 vs 21/30, 25/30, 9/30. All use wrist and scene views. Hue is load-sensitive optical evidence; policy comparison measures completion, not calibrated cross-interface load, contact impact, or early warning.

### TouchTwin
- [TouchTwin: Scaling Human Touch Data via Real-to-Sim-to-Real](https://arxiv.org/html/2611.17619v1) · 首发 2026-11-13 00:42:29 UTC · 审读版 2611.17619v1（2026-11-13 00:42:29 UTC）。
- 状态：preprint。位置：2–4 Tables 1–3; 5。
- 证据边界：A simulated mug policy trained on touch-grounded replays achieves 20/20 on replayed held-out recordings, grip-force ratio 0.99 relative to human-recorded touch, and 35/36 on separate simulated tests, vs pose-only 17/20, 0.31, 26/36. Held-out human contact prediction miss rate 13.1% vs 32.2% with vision-based replay training. Clips start in contact, so onset untested. No physical robot policy test; two-hand reconstructions slip 12–23 mm in-hand.

### MDF++
- [MDF++: Visuo-Tactile World Action Model with End-to-end Representation Learning](https://arxiv.org/html/2611.09293v1) · 首发 2026-11-06 10:47:23 UTC · 审读版 2611.09293v1（2026-11-06 10:47:23 UTC）。
- 状态：CoRL 2026 accepted; official programme verified 2026-11-18; proceedings not verified。位置：3–4; 5.4 Figure 3; Appendix Table 5 and Table 9。
- 证据边界：Same 20 initial poses per physical task. Final fixed-part release: bolt/nut 16/20 and 8/20 vs frozen-ViT MDF++ 6/20 and 3/20; UWM across architectures 10/20 and 5/20. Separate stage score from endpoint completion; Table 5 excludes force stream for real threading. Real one gripper, no cross-hand inference.

### DexRemo
- [DexRemo: A Force-Sensing Hand Platform and Task Suite for Contact-Rich Removal Manipulation](https://arxiv.org/html/2611.15981v1) · 首发 2026-11-11 20:33:31 UTC · 审读版 2611.15981v1（2026-11-11 20:33:31 UTC）。
- 状态：preprint; author-reported IEEE T-RO acceptance, not independently verified。位置：III-E; IV-A; V-C/D Fig. 8; V-F Table VII; VI-A。
- 证据边界：Six matched core removal tasks, three seeds and 30 trials/seed/condition/task: descriptive pooled success 24% vision+proprio only, 38% local force, 44% pose, 58% wrist force, 55% local force+pose, 83% wrist force+pose; W>R and P+W>R+P for all six. Common demos, ACT and test protocol; same measurement transformed, no additional force information. Three extension tasks are full model only, 10 rolls each, one seed; split is local held-out configurations, not cross-hand/interface inference or topology transfer. Seed-level intervals have only three seeds; no separate causal mechanism proof.

### TactileLab
- [TactileLab: Sim-to-Real Dexterous Robot Manipulation with Efficient Shear-Sensitive Tactile Simulation](https://arxiv.org/html/2611.07881v1) · 首发 2026-11-05 12:01:12 UTC · 审读版 2611.07881v1（2026-11-05 12:01:12 UTC）。
- 状态：preprint。位置：III-B; IV; VII-C Table II; VII-D1 Table III/Fig. 11; VII-D2 Table V; VIII-D。
- 证据边界：Dual-arm follower transfers from simulated rigid cube straight motion to real straight/circular paths and rigid cube/soft ball/foam objects; position/orientation mean errors range 0.91–6.43 mm and 0.019–0.057 rad (Table III). Leader is scripted; tactile flow is tangential motion, not bilateral load ground truth. Dual-arm modality ablation is simulated; separate physical single-hand LEAP rotation does report depth+flow 1.95±0.81 rotations vs depth 1.70±0.78, low-dimensional touch 1.61±0.90, proprioception 0.82±0.56. Unseen geometry/trajectory transfer is not declared cross-interface topology transfer.

### PhysicalTactileCues
- [Which Physical Tactile Cues Matter for Contact-Rich Imitation Learning? A Controlled Real-Robot Study](https://arxiv.org/pdf/2611.06673v1) · 首发 2026-11-04 15:45:40 UTC · 审读版 2611.06673v1（2026-11-04 15:45:40 UTC）。
- 状态：preprint; author-reported IEEE ROBIO 2026 acceptance, proceedings not verified。位置：III-A–C; IV-A–D Tables I–II; V。
- 证据边界：v1 submission 4 Nov 15:45:40 UTC after previous update; include same-day overlap. Table I across three real tasks full tactile 71/90, marker flow 67/90, vision-only 52/90; tube reorientation/insertion 23/30 vs vision 14/30. Demonstrations, cameras and policy backbone held fixed, but cue frontends differ and no direct force measurement. Table II 77/90 is separate cross-attention config, not Table I baseline. Task completion is not verified contact-impact or load-regulation improvement.

### TouchVsWristVision
- [Tactile Sensors Are an Effective Substitute for Wrist Cameras in Contact-Rich or Occluded Manipulation](https://arxiv.org/html/2611.10490v1) · 首发 2026-11-07 05:33:17 UTC · 审读版 2611.10490v1（2026-11-07 05:33:17 UTC）。
- 状态：CoRL 2026 Dexterous Manipulation workshop program lists paper; proceedings not verified。位置：§3; §4 Table 1; §4.1–4.2; §5; Appendices B–D。
- 证据边界：Without wrist RGB plus touch vs with wrist RGB without touch: retrieval 49/60 vs 30/60, plug insertion 28/60 vs 20/60, wiping 43/60 vs 28/60. Retrieval/wiping pass within-task Holm correction; insertion does not. Other cameras in both arms of comparison. Single platform/sensor/policy/seed; tests do not account for seed or checkpoint selection and no equivalence evidence. Official workshop listing: https://dex-manipulation.github.io/corl2026/#papers (OpenReview ID 9FDrtuUXoN).

### WhichTaxels
- [Which Taxels, Not How Many: Tactile Sensor Placement for Dexterous Policies](https://arxiv.org/html/2611.10647v1) · 首发 2026-11-07 10:37:42 UTC · 审读版 2611.10647v1（2026-11-07 10:37:42 UTC）。
- 状态：CoRL 2026 Everything Beneath the Policy workshop program lists paper; proceedings not verified。位置：§III; §IV.1–4 Tables 1–4; Appendix C Tables 10–12。
- 证据边界：Sim XHand1 rotation: 75 top-contact 59.5% vs uniform 35.5%, all 2,000 61.5%. Fixed random vs spatial grid CNN with identical 2,000 taxels 61.4% vs 61.3%; same taxel identities, not changing contact topology or proof explicit geometry never helps. Separate Sharpa/Allegro Grasp-and-Lift results are held fraction; 300 contact-cover 57.0% vs 42.6% uniform Sharpa and 72.2% vs 57.0% Allegro, while Sharpa top-contact 27.0% underperforms uniform. Same sim train/eval randomization, 1,024 episodes and three seeds; separate policy per condition, no real or zero-shot embodiment transfer. Workshop source https://beneath-the-policy.github.io/.

### SimDuoReal
- [SimDuoReal: Object-Centric Bimanual Policy for Emergent Dexterity](https://arxiv.org/html/2611.10410v1) · 首发 2026-11-07 02:44:58 UTC · 审读版 2611.10410v1（2026-11-07 02:44:58 UTC）。
- 状态：preprint。位置：III-A–D; IV-A/B Table I; IV-C Table II; V。
- 证据边界：One sim-trained policy and unseen objects without task-specific fine-tuning: barcode 15/20, peg 15/20, cleaning 16/20, cooking 15/20 (61/80, binary completion). Requires accurate meshes, tracked poses and external goals. Asymmetric critic uses privileged sim state; deployable policy lacks touch/wrench inputs. Barcode ablation 85.0% vs 60.4% is simulated and training configurations differ. Count only as bimanual coordination context, not positive tactile evidence.

### ForceHarness
- [ForceHarness: Turning Force into Action and Physics for Frozen Frontier Models](https://arxiv.org/html/2611.21099v1) · 首发 2026-11-16 13:44:23 UTC · 审读版 2611.21099v1（2026-11-16 13:44:23 UTC）。
- 状态：preprint。位置：§§3–4; §5.1 Table 3; Appendices E and J。
- 证据边界：Astra USB 8/10 vs same model no-force 0/10; all six physical tasks 54/60 vs 2/60; Sol ForceHarness 7/10 USB with no same-Sol no-force physical row. Changes both force primitives and reported readings, not an isolated sensor input effect; same safety limits, same instruction per paired condition, operator-labelled endpoint after reset. One Franka with no wrist F/T, relative estimates drift with pose. Remote model latency makes this quasi-static, not contact-onset warning or real-time impact control.

### BAT-WAM
- [BAT-WAM: Bridging Action and Touch in World-Action Models for Dexterous Hands](https://arxiv.org/html/2611.10967v1) · 首发 2026-11-07 21:09:55 UTC · 审读版 2611.10967v1（2026-11-07 21:09:55 UTC）。
- 状态：preprint。位置：§§3.2–3.3, 4.1–4.3, Tables 1–5。
- 证据边界：Seven physical L6 tabletop tasks average 79.3% vs 69.3% OpenWAM+HandTouch and 66.4% OpenWAM; five unseen object/scene variations 54.5% vs 42.0%/38.5%. In full-mask completion same Image-only 0.0163 vs 0.0221 RMSE; Image+Action 0.0145 (different inputs). Temporal prediction conditions on target-time RGB; not pre-contact anticipation under causal video history. No dual-hand load or topology split.

### RevoSim
- [RevoSim: Scalable Multimodal Tactile Simulation for Dexterous Manipulation](https://arxiv.org/html/2611.08939v1) · 首发 2026-11-06 03:31:43 UTC · 审读版 2611.08939v1（2026-11-06 03:31:43 UTC）。
- 状态：preprint。位置：§§II–III, Figs. 1–5。
- 证据边界：At 1,024 depth-only environments reports 9.2 vs TacMap 30.6 GiB; marker displacement without RGB supports 4,096 within 31.36 GiB; full observation setting reaches capacity at 1,024. Memory capacity, not throughput. Physical pressure comparisons qualitative with differing display scales; real policy transfer remains future work.

### KinematicTactileRetargeting
- [Kinematic-Tactile Aligned Dexterous Retargeting with Contact Wrench Space Alignment](https://arxiv.org/html/2610.39582v1) · 首发 2026-10-29 08:23:58 UTC · 审读版 2610.39582v1（2026-10-29 08:23:58 UTC）。
- 状态：preprint。位置：§§III–IV, Tables I–II。
- 证据边界：Backlog Oct 29 submission. Across three payloads 58/60 physically vs 48/60 DexPilot+preload and 0/60 ManipTrans (wrench metrics unavailable for failed latter); best in 11/18 continuous wrench metrics. Robot support computed from measured local fingertip normal force, not independently measured cross-interface target. One operator/workspace/task family; no online policy correction.

### TouchAnnotator
- [TouchAnnotator: Multi-Source Tactile Supervision with Privileged-View Distillation](https://arxiv.org/html/2611.09129v1) · 首发 2026-11-06 08:07:36 UTC · 审读版 2611.09129v1（2026-11-06 08:07:36 UTC）。
- 状态：preprint。位置：§§3–4, Tables 1–4, Appendices C–E。
- 证据边界：860 cached glove recordings from 21 tasks (not all retained data): temporal accuracy 63.29 to 68.67, volumetric IoU 9.10 to 14.12, but MAE worsens 0.0830 to 0.0875. All-view paired study is separate; unseen FPHA contact labels geometry-derived and input protocols differ across baseline classes. Outputs relative pressure, not calibrated force or executed policy.

### DLO-Tactile-Shape
- [Physics-Informed Tactile-based Shape Estimation of Deformable Linear Objects](https://arxiv.org/html/2611.22990v1) · 首发 2026-11-17 16:07:04 UTC · 审读版 2611.22990v1（2026-11-17 16:07:04 UTC）。
- 状态：preprint。位置：§§II–III, Tables I–II, Figs. 4–6。
- 证据边界：Four DIGITs plus pose, OptiTrack independent 14-marker shape ground truth mapped to 16 vertices. RMSE 30.52 mm vs 55.0 pose only and 37.0 without weighted loss; Chamfer 27.29 mm; reported 61.5 ms mean inference. New cable type performance weak zero-shot, improves with labeled fine-tuning. Shape estimation, not wrench recovery; one gripper is fixed.

### AsymEEF
- [AsymEEF: Bimanual Manipulation with Asymmetric End Effectors](https://arxiv.org/html/2611.20557v1) · 首发 2026-11-16 05:36:25 UTC · 审读版 2611.20557v1（2026-11-16 05:36:25 UTC）。
- 状态：preprint。位置：§§III–IV, Tables I–III。
- 证据边界：Same source demonstrations and matched initial states in within-setting replay; six real-task mean replay success 88.7% vs 20.8% LAD and 45.2% CEI. Replay-filtered generated trajectories and downstream policy training are distinct. Morphology transfer evidence is not tactile/sensor transfer or zero-shot topology generalization.

### LumiTac
- [LumiTac: Compact, High-Rate Six-Axis Optical Tactile Sensing for Human-Robot Interaction](https://arxiv.org/html/2611.05936v1) · 首发 2026-11-04 04:24:45 UTC · 审读版 2611.05936v1（2026-11-04 04:24:45 UTC）。
- 状态：preprint。位置：§§II–IV, Tables I–II and Fig. 5。
- 证据边界：Same-day 04:24 UTC submission (overlap; not identified in frozen matrix). Independent test recording reports force MAE 0.054–0.190 N and moment MAE 0.304–1.419 mN m. Mean online prediction update 303.57 Hz; median 0.722 ms host processing excludes acquisition, transmission and display. Local six-axis measurement, not cross-interface or closed-loop policy evidence.

### Hidden-Start-Handover
- [When Will You Hand It Over? A Hidden Start Delay Makes Self-Play Handover Robust to Unfamiliar Partners](https://arxiv.org/html/2611.18491v1) · 首发 2026-11-13 18:04:37 UTC · 审读版 2611.18491v1（2026-11-13 18:04:37 UTC）。
- 状态：preprint。位置：§§3, 5–7, Figs. 2–4, Tables 1–3。
- 证据边界：Same 200-scenario tables per cell; 1 s delay cut own-partner supported transfer to 6.0/33.5%, restored to 93.5/89.0% with hidden delay versus 28.0/33.5% matched-training control. Eleven held-out conditions averaged 78.8/62.7% vs 30.5/27.2% self-play; scripted settle-with-withdrawal remained below 5%. Physics-derived support and collision success criterion; not measured deployment wrench, cross-hand representation ablation or real interaction.

## 上轮存量与数据说明

- Tactus 更新 v3 作者拼写，RoboTryOn 更新 v3 并保留部分得分口径，DexHOT 更新 v2 并注明 Eq. (9) 候选域修改。WiTac v1/v2 可见提取正文未发现版本标记以外变动，按一篇计。Panasonic 的 T-Rex 发布说明对应已有文献，不重复纳入；TMA 虽为双手平台但该操作策略固定左臂，保留为边界观察，不作为双手触觉策略。
- [SharpaDex v1.0 原始发布文档](https://huggingface.co/datasets/Sharpa-Robotics/SharpaDex-v1.0#tactile-modality)仅用于核对字段，不新增研究单位：十指各 [Fx, Fy, Fz, Tx, Ty, Tz]，先左后右，力 N、力矩 N·m，局部 URDF elastomer 坐标而不是 fingertip IK 或 hand-base 坐标；原始/变形视频也是单独同步流。这个模式不自动提供独立跨接触界面真值。
