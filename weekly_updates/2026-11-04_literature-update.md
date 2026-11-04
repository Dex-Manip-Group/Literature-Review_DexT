# 2026-11-04 文献增量与证据解释

## 范围与版本保护

- 已核实 tomtomLab 身份、最新 main；PR #2–#5 均未合并。本轮从 #5 的 `fcedaeedc33ca23f9273e10987c3fc1e14ef2779` 新建分支，不覆盖已有分支、不自动合并。
- 检索日期：2026-11-04 UTC；正文冻结：2026-11-04，在全文筛查和正文整合后单独记录。精标日期仍为2026-08-13，30篇不变。
- 新增16篇，现171条（170学术、1资源）。TacO首发于5月21日，作为10月29日v2修订发现，不计本窗口新首发。其余新增首发在前次检索后。
- 当前82条归档审读；VT-MUSE为已有记录新增审读，不是新增论文或精标提升。
- 本轮是官方arXiv列表、关键词线索及80篇既有版本历史的定向检索，不声称穷尽数据库或全天。缓存历史可能滞后，77篇“未改变”只指返回历史，不是不存在新修订的证明。
- 论文保持预印本/作者声称层级；arXiv上的SII、NeurIPS或ICCSSE说法不自动等于已独立核验的正式发表。

## 对结论的影响

新增证据加强预训练适配、预测与即时反馈、空间世界模型和明确接触计划的对照。联合缺口保持：可部署跨界面载荷推断、匹配表示收益与明确接触拓扑迁移仍需在同一设计中验证；不新增全库零计数，不预设图模型必胜。

关键边界包括：PanoTac插值剪切场不等于逐taxel标定力；TF2-Steering与RoboTryOn部分指标是进度/部分得分；DexArena未验收条目不能当失败；仿真触觉RGB代理不是实体力传感器；TacO版本间FlexiTac基线不一致保留为未解决问题。

## 纳入与证据位置

### PanoTac
- [PanoTac: A Dense Three-Axis Tactile Sensor for Robust Touch-Centric Manipulation](https://arxiv.org/html/2611.03520v1)
- 状态：preprint；位置：III-C equations 3–4; III-D; V-A Table III; Appendix B。
- 证据边界：Shear maps interpolate ten magnetometers; not independently measured force vectors at every taxel. Digital response units are not calibrated newtons. 60 total trials per policy; pooled full-task 91.7% versus vision 45.0%, normal-only 73.3%, sparse three-axis 78.3%. No multifinger or bimanual transfer. Sensor 60Hz versus policy 6Hz; <$50 excludes readout boards.

### TacMind
- [TacMind: Benchmarking and Modeling Tactile Interaction States for Robotic Manipulation](https://arxiv.org/html/2611.00455v1)
- 状态：preprint；位置：3; 4.1–4.4; 5 Tables 2–3; Appendices D/E。
- 证据边界：128 total tasks but comparative main evaluation uses 28. Generalist 32.3% InD/20.7% OOD; single-task ACT+tactile 39.8%/16.4%, so not best overall InD. Real average 77.5% versus N0-VTLA 60.0%, pi0.5 19.2%; 20 trials/subtask, best of three checkpoints. Appendix D latency is synthetic randomly initialized action expert only, excluding other modules; not end-to-end deployed latency.

### AcrossDEX
- [AcrossDEX 1.0: From Human Motion Pretraining to Bimanual Dexterous Manipulation across Hand Embodiments](https://arxiv.org/html/2610.40210v1)
- 状态：preprint；位置：II-E/F; III-A/C; IV-A/B。
- 证据边界：Direct regression opening-return 40.6%; Inspire reorientation 100%; Allegro 93.3%. Same box asset and local perturbations; simulation pauses during inference. Best model/run selected over evaluation batch. Not real-robot transfer, unseen-object generalization or tactile gain evidence.

### TacO-Sensor-Benchmark
- [TacO: Benchmarking Tactile Sensors for Object Manipulation](https://arxiv.org/html/2605.21976v2)
- 状态：preprint；位置：IV-A; V Tables III–IV; VI Tables V–VII; VII; compared v1 sections 4–7。
- 证据边界：v2 adds shear-only/normal-only Table V, tip/loading repeatability Table VII, rollout counts and 20Hz latest-sample detail. Table III now separates mass conditions; FlexiTac vision-only mean is 0.70 versus v1 pooled 0.75 (unexplained discrepancy). Insertion/reorientation and alternate-encoder tables unchanged. Material/friction and encoder confounds remain; not isolated resolution comparison; ACT-only. Evaluation 20 pick-place trials, 10 insertion/reorientation. Exact v1/v2 tables and relevant sections compared, not exhaustive source diff.

### Tactus
- [Tactus: Tactile & Pose Sensing Glove for Natural Dexterity Data Collection](https://arxiv.org/html/2610.39076v2)
- 状态：preprint；位置：IV-A Table I; V-A/B/C Tables II–IV; VI-B; VII。
- 证据边界：Minimum detectable force 0.59 N; learned fingertip regression error 0.20 N differs from full-glove online calibration RMSE 1.46–1.82 N. Best 11.0 mm wrist-aligned fingertip error is offline; real-time AVI-HT 12.8 mm. Dexterity/pose studies N=5, force N=3. Slip F1=1.00 only one controlled train/test split. Not a demonstrated robot-control or released large-dataset result.

### TFM4IL
- [Evaluating Tactile Foundation Models for End-to-End Imitation Learning in Contact-Rich Manipulation](https://arxiv.org/html/2611.00957v1)
- 状态：preprint; author-reported SII 2027 acceptance; not independently venue-verified；位置：III-A–E; IV-A; IV-B Table I; IV-C/D Figures 4–5。
- 证据边界：Cross-TFM real average: SparshDINOv2 67.4%, tactile ResNet 54.2%, camera ResNet 39.6%; 3 seeds x12 trials/task. Separate adaptation study: fine-tune 81.7% versus frozen 65.3%, 15 seeds x12. Mid-training 54.8% versus 51.2%, mixed task effects. Objects differ between subsections: do not compare those averages across studies. Fine-tuning conclusions only tested for SparshDINOv2, not every TFM. No multi-task or bimanual demonstration.

### TF2-Steering
- [$TF^2$-Steering: Action Refinement with Tactile Forecasts and Feedback via Velocity-Field Steering](https://arxiv.org/html/2611.01483v1)
- 状态：preprint；位置：3–4 Tables 1–3; Appendix A.2。
- 证据边界：Sim 68.3% versus57.7%, 50 trials/task; real71.5% versus62.4% is milestone progress, not completion, 20 trials/task. T-Rex uses fixed four-action tactile refinement while TF2 permits task-dependent frequency. Ablation variants separately post-trained and single-modality variants bypass sigmoid weighting; attention-mask/stop-gradient jointly removed. Forecasting alone is weaker than immediate feedback. Some sim baselines copied; no full-completion table, uncertainty intervals or topology transfer established.

### DexArena
- [DexArena: A Unified Benchmark for Long-Horizon Dexterous Manipulation](https://arxiv.org/html/2611.02629v2)
- 状态：preprint；位置：3–4; 6; Appendix A.9 Table16。
- 证据边界：Four end-effectors supported but released data uses Sharpa; 29/30 stages single-arm. Oracle stage switching, unequal episode/compute budgets and one training seed limit rankings. OOD holds out visual scenes, not task objects or physics. Completed ACT macro 1.2%. Pi0.5 only four task zeros verified; six entries pending final acceptance and displayed ten-task average unvalidated; pending zeros are not measured failures.

### Visuotactile-DP-Aux
- [Visuo-tactile Diffusion Policy for Robotic Manipulation with Auxiliary Tactile Dynamics Prediction](https://arxiv.org/pdf/2611.02677v1)
- 状态：preprint; author-reported ICCSSE 2026 presentation; proceedings not verified；位置：III-A/E; IV TableII; V。
- 证据边界：59.0±2.6% versus vision-only 42.7±1.5%, direct vision+touch 33.7±0.6%. Proxy images not calibrated force or actual tactile sensor readings. Exploratory paired t interval [12.5,20.1] pp; three-seed sign-test p=.25. Scripted privileged teacher corrections, successful mixed episodes retained. No physical robot transfer evidence. Evaluated geometries all covered in training; GRU resets per four-frame window. Reported variability is across-seed SD, not CI.

### ForceLDM
- [ForceLDM: A Force-aware Latent Dynamics Model for Contact-Rich Manipulation](https://arxiv.org/html/2611.03294v1)
- 状态：preprint; author-reported NeurIPS 2026; not independently venue-verified；位置：3–4 Tables1–4; Appendix G。
- 证据边界：Main macro87.1% versus72.2%, 20-30 trials/task; OOD68.9% versus48.9%, 15 trials/condition, six shifts on three tasks, no CI/multiseed spread. Success requires completion under2min and force<25N. Student retains force history; executes32-action chunks. Second Piper-X/GR00T test uses200 new demos, not zero-shot transfer. AppendixE.2 changes both action/prediction horizons; H32 Box/Gear scores100/90 differ from main95/83.3 without explanation. Not distributed fingertip or cross-interface load inference.

### ToFTouch
- [Exploring Proximity and Tactile Sensing for Robotic Manipulation](https://arxiv.org/html/2611.03489v1)
- 状态：preprint；位置：III–V TablesI/II。
- 证据边界：10 trials/condition, pregrasp 3.533→3.271s (7.4%). Extraction ToF successes 9,8,10,10,9 out of 10 across −2…+2cm, not perfect success. Dense insertion kinesthetically taught characterization, not autonomous policy. Authors note limited trials, overheating, calibration/depth discrepancies. Fulltext title adds ToFTouch prefix; fulltext author uses Taşkin Padır. Quantified gains use ToF feedback, not isolated tactile benefit; contact signals are raw rather than calibrated force. ToF unreliable below 1-2 cm.

### ReContact
- [ReContact: Reconstruct and Retarget Human Contacts from Video for Contact-Rich Humanoid Manipulation](https://arxiv.org/html/2611.02968v1)
- 状态：preprint；位置：III-A–F; IV-A/B Table II; IV-D Table III; IV-E; V。
- 证据边界：T2 two-palm bottom hold 83.5±5.2% over three seeds versus best adapted baseline 0.16%; distinguish contact-defined success from completion. T2 uses passive rubber hands, not dexterous fingers. T5 family 97.8% within workspace but 19.5% exterior band. Hardware seven manipulation/two locomotion demonstrations, no aggregate trial success reported. Regrasp uses nominal object poses latched at initialization; others markers/head RGB. Training contact forces are simulator rewards/critic inputs, not deployed tactile observations. Reviewed plan and per-family training remain required.

### 3D-World-Simulator
- [Hybrid Particle-Voxel Dynamics for Multimodal 3D World Simulation](https://arxiv.org/pdf/2611.04492v1)
- 状态：preprint；位置：3.1–3.5; 4 Tables 1–2/Figures 6–8; Appendices B–D Tables 3–5。
- 证据边界：Six-task 200-step mean tactile L1 0.081 vs best listed baseline 0.128. Policy evidence spans three tasks, tactile policy input only Part Assembly; Cloth Folding/T-Pushing vision only. Deform360 configuration disables tactile supervision despite tactile dataset origin. Held-out objects improve geometry but not image metrics. Supports unseen-object planning demos on four objects; not multifinger tactile control or physically guaranteed simulator. 50Hz claim lacks component timing breakdown in inspected text; bounded cropped workspace.

### DexHOT
- [DexHOT: Learning Hand-Object Configuration Transfer for Dexterous Manipulation](https://arxiv.org/html/2611.05119v1)
- 状态：preprint；位置：III-A–C; IV-A–D; V Tables I–IV; VI (complete main text; no appendix in exact HTML)。
- 证据边界：Keypoints are not assumed contact locations. Seen/unseen simulation Any2Any averages 80.5/69.4%; unseen objects still require own offline feasible pools for endpoints/planning. Hardware 61.5% over 200 transfers counts initialization failures; success requires <=20mm configuration error for ten steps. Demonstration-guided 27/30 successes use fixed layouts, one demo/task, demonstration wrist trajectory and separate arm controller. SimToolReal comparison differs arm-control interface and requires target hand arrangement absent from its goal. Greedy transitions have no dynamic-feasibility guarantee; visual tracking loss and unrecovered slip persist.

### RoboTryOn
- [RoboTryOn: Synthesizing Dexterous Robot Demonstrations from Human Videos via Virtual Try-On](https://arxiv.org/html/2611.05163v1)
- 状态：preprint；位置：3.2–3.5; 4 Tables 1–3; Appendices A–F, especially B.2.8/C.1/F.2 (complete main and appendices)。
- 证据边界：Mean OOD reported score rises 2.1% to 60.0% with teleop plus synthesis; bimanual 45.9% is partial-credit (0.5 per successful hand), not strict episode success. Synthesis-only OOD is 48.5/40.3% for OpenArm/RB-Y1. No target-task robot demos, but generators/IDM require embodiment teleop corpus (3.79h OpenArm,2.53h RB-Y1,2.50h GR-1). Fixed calibrated camera and immobile base/neck; pseudo-labels lack force precision. RB-Y1 Air Fryer remains 0%. Collection-cost claim excludes synthesis compute; 15-second sample takes 695 seconds on H100. Supports synthetic bimanual transfer, not measured contact control.

### ReflexArc
- [ReflexArc: Bottom-Up Integration of Instantaneous Tactile Reflexes into Whole-Body Humanoid Control](https://arxiv.org/html/2611.04424v1)
- 状态：preprint；位置：III-A-B Eqs.1-2; IV-A-C Eqs.3-5; V-A Fig.6; V-B-C Table I; VI limitation。
- 证据边界：Adjacent whole-body control comparator, not dexterous hand/tool transfer. Independent stationary-box calibrated tactile patch measures impact force; 240Hz marker camera verifies response timing. Identical reflex with +20ms delay isolates latency: peak21.64 to14.25N, impulse0.2632 to0.1225Ns; Fig6 shading integrates F>2N. No replication count or variability stated for this force comparison; TableI evaluation domain and trial count not explicitly specified, so do not label its survival rates as hardware reliability. Patch/body registration and fixed support set are structural priors, not learned contact graph or topology-held-out transfer. Multi-site tactile triggers do not establish cross-interface load inference. Uncovered body regions remain unprotected.

## 既有论文修订

- VT-MUSE v4：本窗口改摘要并移除v3附录，主要正文/结果不变。另将10月6日v3旧积压单独审查：增加FTP-1参考对照、修正三任务均值、澄清部署及限制；不冒称本周新变化。
- TouchScale v3：数据供应与同意流程归属措辞变化，科学结果未变。
- PhysLadder v2/v3：改名LLM4Robot-Bench、更新项目/代码地址，标题Matched改Paired；结果和三次试验限制未变。保留旧slug/key避免重复。

## 观察与排除

- [MagPillar](https://arxiv.org/abs/2611.01609v2)：exclude_study_synthesis。Full-text surface-material classification/qualitative scans; closed-loop manipulation remains future work. Protocol excludes pure material classification without relevant manipulation-state results.
- [GoalDex](https://arxiv.org/abs/2611.02171v1)：context_watch。Visual single-hand image-goal policy; no tactile or explicit contact-structure result established by this focused screen.
- [Catch-It-All](https://arxiv.org/abs/2610.39044)：exclude_focused_scope_abstract_only。Visual interception lead without direct tactile/contact-representation or bimanual-transfer contribution established at abstract triage; not a full-text quality exclusion.

## 可复核材料

[筛查](2026-11-04_screening.json)、[既有版本检查](2026-11-04_prior-version-checks.json)、[来源哈希](2026-11-04_source-manifest.json)、[验证](2026-11-04_validation.md)。仅提交来源URL、元数据与审读记录，第三方全文不共享；完整历史PDF缓存未重新核验。
