# 2026-10-28 文献增量、全文核读与解释记录

## 范围、日期与版本保护

- 已核实最新 main `6804f9c99d0af044babda4755c0c48d47c3ae9a5`；PR #2、#3、#4仍为未合并草稿。本轮从PR #4分支 `literature/2026-10-21` 的 `efc26142e84ebcc331c529015c4b06a1a232918f` 堆叠，不覆盖任何未审核工作。
- 检索日期：2026-10-28 UTC。主窗口为10月22日起至本次早间检索可访问来源；不声称覆盖全天或所有数据库。上一轮记录截止10月21日07:49 UTC，DONIC 16:36:02及CW-WAM 17:55:53晚于此时，作为**边界补录**，不算窗口内新首发。
- 新增19篇，17篇窗口内首发＋2篇边界补录；当前155条＝154学术＋1资源。65条当前归档全文审读＝64篇October新增＋FTP-1的当前归档复审；FTP精标卡不变。
- 正文证据冻结：2026-10-28，在精确版本全文核读与正文/引用/矩阵/结论整合后更新。精标日期：2026-08-13，30篇（19A/11B）字节级保持，未自动扩张。历史0/30不外推为154篇统计。
- 状态：49正式同行评议、16官方录用/节目单、89预印本/作者声称、1资源。19篇新增均为预印本；8项已有论文状态升级仅据官方列表，不冒称最终出版或本周才录用。

## 检索、来源与可审计性

官方cs.RO近期列表（434条公告）与arXiv字段检索交叉筛查；触觉/视觉触觉查询9条，touch/wrench/contact＋cs.RO查询46条。随后按全文核对方法、观测/监督信息、分组单位、物理真值、基线、指标分母与限制；完整查询和决策见[筛查JSON](2026-10-28_screening.json)。官方首发历史决定窗口，公告日期不替代首发日。

[来源清单](2026-10-28_source-manifest.json)保存19篇精确版本URL、首发时间、全文HTML字节数/哈希和证据位置；[选定PDF核验](2026-10-28_selected_pdf_checks.json)记录来源PDF哈希及已查看页面。第三方全文仅存本地研究目录，不提交或再分享。选择性第二读者核查不等于全综述双盲/双人筛查或独立复现实验。

## 结论改变与保持

1. **正面证据加强，笼统否定收窄。** VecTile提供外置参考局部剪切标定，FLoRe提供外置测力计的末端力跟踪，Keeping Contact提供匹配平均计划力的自适应双臂分力；OpenTac支持真实双臂剪切反馈持载。不能再把缺口写成“无独立力验证”或“无双臂力控制”。
2. **联合缺口保持。** 局部/末端标定、已知接触下力分配、几何接触图、离线全轨迹参考和闭环成功并非同一证据。仍未建立可部署机器人跨界面载荷推断、匹配表示收益与明确接触参与者/边变更迁移的联合证据；不是新增全库零计数。
3. **对照更强。** CW-WAM有匹配损失的时序力矩结构对照；FORCA隔离高频程序执行与慢速代理开发；RoboSTD/DONIC/PiHand需区分数据/未来参考/初态筛选；Which Hand Was Late的随机起始破坏姿态捷径，L2A强调探测方向可识别性。
4. **不制造汇总效果。** OpenTac插入率跨正文/图/官网不一致；CARD接触源/mesh描述及有效run分母不明。保留可定位的无争议实验，不取最大值、不混合分母、不推断算术造假。

## 纳入的19篇全文审读

| 工作 | 首发UTC | 类型 | 主要证据边界 |
|---|---|---|---|
| [DONIC](https://arxiv.org/abs/2610.29997) | 2026-10-21T16:36:02Z | 边界补录 | Oct21 late-day boundary, not Oct22-window release. Success is joint tracking-threshold metric, not generic task completion. No real tactile policy or held-out operation/topology test. |
| [CW-WAM](https://arxiv.org/abs/2610.30117) | 2026-10-21T17:55:53Z | 边界补录 | Oct21 boundary release, not strict Oct22-onward first release. Bootstrap holds trained checkpoints fixed; hardware uses demonstration-distribution scenes. Force-reference accuracy is not independent contact-load truth. |
| [Live-Thread](https://arxiv.org/abs/2610.30694) | 2026-10-22T04:05:43Z | 窗口内首发 | Graph orders thread geometry, not interhand load flow. Hard pickup 14/15 live versus 7/10 static; easy/medium 13/15 versus 18/20, with unmatched counts. Reconstruction error, occlusion robustness and detangling benchmarks remain future work; no force validation or topology holdout. |
| [PiHand](https://arxiv.org/abs/2610.31299) | 2026-10-22T13:59:19Z | 窗口内首发 | Handover51.9% is conditional on160 stable starts filtered from1442, not all candidate starts. New task policies train20h; prior reuse is not zero-shot policy transfer. |
| [GelSlim-5.0](https://arxiv.org/abs/2610.31334) | 2026-10-22T14:22:01Z | 窗口内首发 | Every tenth within-session sample is validation and checkpoint selection; computed geometric targets are not independently measured membrane shape. Fusion comparison differs in token/parameter budget; no cross-session/object/topology test. |
| [VecTile](https://arxiv.org/abs/2610.31472) | 2026-10-22T16:00:09Z | 窗口内首发 | Force RMSE uses held-out shear directions; plug holdout is unseen locations within training spatial range. Correction rates have conditional denominators. No bimanual/topology transfer or repeated-training-seed uncertainty. |
| [OpenTac](https://arxiv.org/abs/2610.31661) | 2026-10-22T17:59:06Z | 窗口内首发 | Force-fit accuracy is in-sample; transfer tests normal-contact shape, not force or policy transfer. Insertion rates conflict between paper figure/prose and live project; retain qualitative evidence and undisputed cup counts. |
| [FORCA](https://arxiv.org/abs/2610.31841) | 2026-10-22T19:24:48Z | 窗口内首发 | No demonstrations or task-specific model training, but up to20 real development rollouts and human-authorized execution. Removing force affects development, revision and execution together, not isolated online feedback. |
| [CoCarry](https://arxiv.org/abs/2610.32460) | 2026-10-23T10:24:02Z | 窗口内首发 | 100% retargeting success is valid trajectory generation, not physical control success. Contact metric can remain high despite penetration; CORE4D compares shared-success subset with adapted mappings. |
| [L2A](https://arxiv.org/abs/2610.33705) | 2026-10-24T14:41:14Z | 窗口内首发 | All experiments simulated, including the physical robot; VLM latency cached/simulated. Final70/100 vs62/100 is not significant and follows controller/scoring changes between held-out tests. |
| [PhysLadder](https://arxiv.org/abs/2610.34527) | 2026-10-25T19:41:02Z | 窗口内首发 | Three trials per task/environment; hierarchy depends on task version and embodiment. Simulation budgets and automatic assessment differ from unlimited real episodes and visual judgment. No tactile ablation, calibrated force validation, or topology-held-out transfer. |
| [DLO-3D-Force-Factor-Graphs](https://arxiv.org/abs/2610.35058) | 2026-10-26T09:04:58Z | 窗口内首发 | Synthetic truth and observations derive from the same mechanics model; no hardware, matched comparator or calibrated posterior uncertainty. Explicit single-contact assumptions remain. |
| [DEX-PHD](https://arxiv.org/abs/2610.35462) | 2026-10-26T13:57:01Z | 窗口内首发 | Ten demos/task, lowest-IK-error feasible episode chosen and replayed once. Contact signals are baseline-relative, not independently calibrated force. Drill replay evaluates in-air actuation, not full fastening. |
| [FLoRe](https://arxiv.org/abs/2610.35862) | 2026-10-26T17:59:11Z | 窗口内首发 | External gauge validates standalone force tracking, not all simultaneous task load paths. Same-network force-command withholding is an execution intervention; observation removal is retrained. Ten paired-condition rollouts per task, no topology-held-out or matched graph-versus-latent test. |
| [CARD](https://arxiv.org/abs/2610.36539) | 2026-10-27T02:51:20Z | 窗口内首发 | Offline future-containing targets; glove pressure distinct from inconsistently documented mocap pressure/proximity and mesh use. Physics task/run rates have unspecified valid-run denominators; no pooled effect. Identical-trajectory force-controller ablation does not isolate learned contact-graph superiority. |
| [RoboSTD](https://arxiv.org/abs/2610.36685) | 2026-10-27T05:56:15Z | 窗口内首发 | Zero-shot refers to not collecting task-specific bimanual demonstrations, not inference without training. LLM ablation bundles scheduling constraints and stage language; graph is semantic, not contact mechanics. |
| [ActiveAlign](https://arxiv.org/abs/2610.36859) | 2026-10-27T08:54:27Z | 窗口内首发 | Tactile map plus custom motion primitives compared with keypoint planning; not a representation-only ablation.60Hz control thread and2FPS pose tracking differ; no calibrated force or topology-transfer test. |
| [Keeping-Contact](https://arxiv.org/abs/2610.36961) | 2026-10-27T10:19:27Z | 窗口内首发 | Task-adaptive margins pass 5/5 per condition; measured margin violations remain nonzero. Fixed-margin comparator matched average planned force; no contact-mode transfer or independent pivot-load labels. |
| [Which-Hand-Was-Late](https://arxiv.org/abs/2610.37533) | 2026-10-27T16:53:18Z | 窗口内首发 | Canonical timing result reverses under randomized onsets; hidden force threshold remains unidentifiable. No real robot or topology-defined transfer. |

### DONIC — DONIC: Generalist Dexterous Bimanual Tracking Control from Human Demonstrations

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.29997v1)；证据：Secs. 3–6; main results/ablations; Appendices A–D, especially B.1, C.1–C.5 and D.1–D.6。

DONIC trains one reference-conditioned Wuji bimanual tracker using object-centered per-hand rewards and clip-centered advantages. Its BiHOI dataset adds 1,575 synchronized multi-view sequences; reported bilateral-contact proportions describe reconstructed contact-active frames, not measured tactile loading. The policy consumes object state, geometry and future hand/object references. Forty force-observation channels are zeroed; simulated net force plus proximity instead gates rewards, and cannot perfectly identify contact partners. On 53 unseen trajectories and 164 held-out-object clips, success is 86.79% and 57.32%, versus 9.43% and 11.59% for the stronger adapted baseline. Success combines generous hand/object trajectory-average thresholds, rather than independent semantic task completion. Baselines share the public pool and simulator but retain differing training/reward pipelines. Removing clip centering or the proximity contact-ownership condition reduces held-out-object success; adding BiHOI improves it to 59.76%. The contact ablation does not remove object-motion supervision. Reviewer inference: include as significant bimanual tracking/data evidence with useful controlled learning-signal ablations, not real tactile control or general goal-conditioned manipulation. Appendix D.6 explicitly excludes held-out operation-category claims. First submission is October21 at16:36:02UTC, so log it as a boundary/backlog discovery, not a new October22–28 release.


### CW-WAM — CW-WAM: A Structured Contact-Wrench World Action Model for Force-Sensitive Manipulation

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.30117v1)；证据：Secs. III-IV; V-A-G, Tables I-II and Figs. 4-7; VI limitations。

CW-WAM combines RGB, state, language and measured wrist-wrench history to predict paired motion/wrench chunks. Separate streams, pair-causal attention and ten-second wrench memory extend a shared world-action backbone; future targets are training supervision. Bias and calibrated tool-gravity compensation produce TCP-frame measurements, including payload load. Four tasks use 450 demonstrations. Matched-data, matched-schedule open-loop tests cover 373 windows from 22 test episodes: versus valid-normalized concatenation, the no-memory interaction module reduces contact-position error by 5.58 mm and dynamic force RMSE by 0.19 N, with paired episode-bootstrap confidence intervals. These intervals hold trained checkpoints fixed, not training seeds. Real tests remain within demonstration locations; peg/adapter insertion reaches 14/20 and 19/20, while the no-wrench baseline reaches 5/20 and 8/20. Added admittance improves successful-trial force-reference RMSE from 4.8 to 2.7 N for pegs without changing success. Model queries take 0.5–0.6 seconds; outer feedback is 20 Hz, not the 1-kHz joint tracker. This strengthens structured temporal-wrench and matched-loss baselines, but manually tuned task directions, shared-sensor force evaluation, selected successful subsets and no novel-object/task evaluation preclude cross-interface load identification or topology-transfer claims.


### Live-Thread — Live Thread Reconstruction for Autonomous Manipulation

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.30694v1)；证据：Secs. II-A-F, III, IV; Table I; Figs.1-2。

Live Thread Reconstruction couples stereo keypoint adjacency/order with a spline-state extended Kalman filter, then selects constrained grasp points for two-arm manipulation. Tool motion predicts deformation; shape priors and confidence-weighted observations stabilize the spline. Hand-designed holder/receiver phases close the receiving grasp before release during knot tightening. Hard needle pickup improves from 7/10 static-reconstruction trials to 14/15 live trials, while easy/medium pickup is 18/20 versus 13/15; these unequal samples do not establish a universal gain. Knot tightening reports 15/15 easy/medium and 13/15 hard trials without a static comparator. Quantitative reconstruction, occlusion and detangling studies are explicitly ongoing, and epipolar-parallel segments remain problematic. This provides a geometric-state and role-gated regrasp baseline relevant to contact-rich coordination, but its adjacency graph represents thread shape rather than force transmission. No tactile sensing, tension ground truth, matched graph ablation, independent training seeds or held-out contact-participant structure is established.


### PiHand — PiHand: Latent Hand-Object Interaction Priors for Physics-Based Policy Learning

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.31299v1)；证据：Secs. 3.1–3.3; 4.1–4.4; Appendices A–E, especially D.5 handover filtering and E.3–E.4。

PiHand distills physics-based hand-object tracking experts into a conditional latent prior, then trains task-specific residual policies within that space. Runtime generation discards future hand references but still uses simulator state, contact indicators, object geometry and future object trajectories. Binary body-contact signals are not measured tactile forces; intra-hand collisions are disabled partly because aggregate force readings cannot identify the contact partner. Held-out-object manipulation improves over action-space and hand-only-prior baselines, supporting interaction-aware priors within the common simulator and embodiment. For handover, reported success is 51.9% versus 11.9% and 5.0%. However, Appendix D.5 first screens 1,442 candidate starts with a policy-independent stability test, retains only 160, and evaluates one episode per retained start. The percentage is therefore conditional on stable initialization, not unconditional transfer reliability. Handover also receives a newly trained policy, explicit object-path and wrist-zone constraints, and twenty hours of task training; reusing a prior is not zero-shot policy deployment. Reviewer inference: include as dexterous handover and contact-aware latent evidence, while retaining denominator, reference-conditioning and simulator assumptions. Neither independent physical load measurement, real hardware validation nor a contact-topology-defined held-out test is demonstrated.


### GelSlim-5.0 — GelSlim 5.0: Unifying Vision and Touch with a Single Fingertip Camera

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.31334v1)；证据：Secs. III, IV-A-E, V-A-C, VI; Tables II-III; Fig. 5-6 training ablations。

GelSlim 5.0 alternates UV illumination to obtain vision and tactile images from one fixed camera under approximately stationary contact. VisTacFusion combines frozen visual/tactile encoders through an asymmetric bottleneck, preserving spatial tactile features for depth/normals and supplying object identity to pose queries. Twelve objects provide approximately 400 contacts each; every tenth within-session sample serves both validation and checkpoint selection. Pose and known object geometry generate depth targets, rather than independent membrane-shape measurements. Paired input achieves 0.0066 mm2 depth MSE and 0.652-degree angular error, improving over either modality in the same selected model. Geometry and pose nevertheless use separate task-selected checkpoints. A matched-encoder/head symmetric-fusion comparison favors asymmetric fusion for pose but symmetric fusion for depth/normals; token counts and trainable parameters differ. Real/synthetic mixing also changes training duration and update count, so its gains do not isolate synthetic coverage. This is relevant contact-state/representation evidence, not closed-loop manipulation, unseen-object or cross-session generalization, physical force measurement, or topology transfer. Spatial correspondence avoids inter-camera extrinsics, but deformation, refraction and sequential motion remain. Main-table uncertainty is not established by the separate two-seed hyperparameter sweep.


### VecTile — VecTile: A Low-Cost Flexible Tactile Array for 3-DoF Force Sensing

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.31472v1)；证据：Secs. III-B, IV-B-D, V-A-B, VI; Tables II-III; four-fold direction-rotation split and multi-nub validation。

VecTile converts normal and tangential loading into four pressure-quadrant readings beneath each silicone nub. A quadratic per-taxel decoder is fitted against ATI Mini40 force labels. Four-fold held-out shear-direction tests produce 0.39 N normal and 0.16 N shear RMSE over 1-5 N normal and up to 1.5 N shear; reported variability is across 16 taxels, not independent sensor builds. Flat-calibrated decoding is tested on convex/concave mounts, and manual calibration is separately evaluated on new contacts and summed multi-nub loads. A 20-trial shear-triggered scalpel reflex prevents puncture, unlike a matched normal threshold. For plug insertion, 84 demonstrations train Diffusion Policy with two RGB streams, proprioception and 16 PCA components from touch. At unseen socket locations within the training range, full three-axis touch succeeds in 22/25 trials versus 16/25 normal-only and 12/25 vision-only. The 18/21 successful-correction result is conditional on failed direct insertion. This supports calibrated local shear and compact policy features, not bimanual load-path inference or topology transfer. No repeated-training-seed uncertainty is reported; force saturation, hysteresis/drift and durability remain limitations. The 343-Hz sensor stream is distinct from 10-Hz policy execution.


### OpenTac — OpenTac: An Open Ecosystem for Customizable, Scalable, and Transferable 3D Tactile Sensing

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.31661v1)；证据：Secs. 3.1-3.5, 4.1-4.8; Eq. 2; Table 2; PDF pp. 9-11 Figs. 11-12 visually checked; official project Results page。

OpenTac combines mechanically encoded normal/shear readings with a sensor manifest that anchors taxels, bump groups and local frames. Calibrated normal fields are transferred by geometric overlap with known contact pose. Across four skins, 5,290 predictions yield median shape F1 0.750 versus 0.714/0.634 resizing baselines; this evaluates contact shape, not force accuracy or policy transfer. Three-axis reference-force fits are explicitly in-sample. Real policies use proprioception and touch without vision, and bimanual key insertion senses only the key-holding gripper. More decisive load-related evidence comes from matched-trajectory cup holding: shear feedback retains the cup for 40 seconds in 16/20 impulsive-load trials, versus 9/20 with wrist F/T or normal-pressure feedback. These results support useful spatial shear sensing, not independently validated cross-interface load identification or topology-defined transfer. Insertion numbers require caution: v1 PDF/HTML reports 70% versus 54% for plug insertion, whereas the official project reports 62% versus 36%; key-in-lock prose says 62%, its figure 61%, despite a 25-trial caption. Bumps also change contact mechanics. Adaptive 1,286-Hz acquisition samples only 16/1,024 taxels per update, not the full field.


### FORCA — FORCA: A Force-Aware Coding Agent for Contact-Rich Robot Manipulation

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.31841v1)；证据：Secs. III-A-C; IV-A-D, Tables I-V; V limitations。

FORCA uses a foundation-model coding agent to write complete force-responsive programs from RGB-D, robot state and wrist wrench. Human-assembled perception, grasping and motion skills initialize the system. A generated 100-Hz feedback loop executes without foundation-model queries; the agent analyzes video and force traces and revises code between rollouts. Development permits twenty real rollouts or four hours, with human execution authorization and resets. Frozen programs are then evaluated: drawer and door operation each succeed in 10/10 trials, versus 4/10 and 1/10 for the same agent without force access. Static-developed wiping transfers to a human-moved vase with 93% mean mark removal and 1.6% contact-loss time, versus 21% and 55.9%, over ten trials. Peeling reaches 81.1% mean peeled length, not binary success. Contact-loss and excess-force fractions use explicitly thresholded active-task time. The no-force comparison removes sensing during synthesis, revision and execution together, so it measures the whole force-enabled workflow. Reasoning costs four to ten minutes per iteration; one door-development history is not repeated-run reliability. The study strengthens executable force-feedback and human-held-workpiece baselines, but wrist wrench cannot localize finger loads, and neither contact-graph inference nor held-out topology transfer is demonstrated.


### CoCarry — CoCarry: Contact-Support-Structured Retargeting for Dual-Humanoid Cooperative Carrying

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.32460v1)；证据：Secs. III–V; Tables I–II; contact metrics and CORE4D shared-success subset。

CoCarry releases a retargeting formulation with 220 two-person motion-capture sequences spanning 21 schemes, five objects and four terrains. It separates an object-relative upper-body relational mesh from ground-relative lower-body support structure, and adds hand-object anchors plus collision constraints around a prescribed object trajectory. Contacts are derived from geometry and motion, not measured touch, force or friction. Across all 220 source sequences, reported contact preservation is 0.9995 and penetration duration improves substantially over baselines. Yet the anchor ablation retains contact preservation of 0.9994 while penetration worsens sharply: proximity-based contact scoring alone is insufficient evidence of physical consistency. “100% success” denotes valid retargeted trajectories, not task execution. CORE4D comparisons use 200 shared-success sequences with adapted robot models and semantic mappings, rather than zero-shot control transfer. Real dual-humanoid carrying is qualitative; dataset-wide closed-loop success, trial counts and load measurements are not established. Reviewer inference: the study strengthens explicit contact/support decomposition and cooperative-motion dataset coverage, including changing hand participation. It does not validate independent cross-interface load labels or deployment-observable topology transfer. Prescribed object paths, contact thresholds and lower penetration being imperfectly aligned with contact scores should remain explicit.


### L2A — Open-World Law-to-Action: Vision-Language Priors and Touch for Parts with Hidden Physics

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.33705v1)；证据：Secs. 2-7; 8.1-8.7 Tables 3-11; 10 limitations; Appendices A-B。

L 2 A converts vision-language declarations into floored priors over motion-law blocks, ranges and locks, then updates explicit Bayesian regressions from force and motion. Analytic results show that one-direction motion cannot separate constant load from Coulomb friction and that probing known motions cannot distinguish an unseen releaser from a jam; reversals and new views address different ambiguities. All experiments, including the mobile Panda, are MuJoCo simulations. Table 3 documents progressively removing privileged part identities, joints, coordinates and floor maps. Known-part and mixed-scene ablations support the within-agent mechanism: additional looks increase successes from 284/366 to 329/366. The final camera/depth/hand-based system completes 70/100 requests versus 62/100 for the partly simulator-assisted comparator, but this difference is not significant and follows a controller change and revised closing rule between two held-out tests. VLM answers are cached and latency simulated; part-motion declarations happen to be correct in that final test. Tasks share scenes, and some episode-level significance disappears at scene level. The work supports observability-aware physical inference and explicit assumption reporting, not hardware validation, arbitrary physics discovery, or superiority to matched learned policies. Its model-dependent safety guarantee excludes arbitrary model error; no robotic cross-interface load graph or strict contact-topology holdout is established.


### PhysLadder — How High Can GPT-6 Astra Climb in Contact-Rich Manipulation? PhysLadder: A Hierarchical, Matched Sim-Real Benchmark for Physical Interaction

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.34527v1)；证据：Secs. 3-6; Tables 1-2; Appendices A-C, especially C.2-C.3; PDF pp.29-31。

PhysLadder organizes 16 tasks by alignment, sustained force regulation, and force regulation with required contact reconfiguration. Its two-arm gripper platform supplies RGB, proprioception and execution feedback, but no depth or dedicated force measurements. Fixed interface guidance differs between real and simulated execution. With three trials per task/environment, observed real success declines from 12/15 at L1 through 10/21 at L2 to 0/12 at L3; simulated counts are 10/15, 10/21 and 0/12. These are descriptive results for one model, not population reliability or an absolute task-difficulty law. Simulation has a 150-call/five-hour cap; hardware has no preset episode budget. Real visual judgments and simulated tolerances also differ, explicitly affecting alignment and wiping. The study strengthens task-version specifications and the distinction between local contact progress and full completion. It neither identifies forces independently nor isolates sensing, reasoning and execution causes; reconfiguration tasks alone do not constitute a held-out contact-topology generalization test.


### DLO-3D-Force-Factor-Graphs — 3D-Force Estimation for Dual-arm Manipulation of Deformable Linear Objects via Factor Graphs

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.35058v1)；证据：Secs. II–IV; IV-A1–6; IV-B; Tables I–II; V–VI。

This factor-graph estimator jointly reconstructs a deformable rod and one external force from sparse positional observations. Twenty rod-state nodes encode poses and internal wrenches; mechanics, boundary-pose and measurement factors couple them to unknown force magnitude, direction and location. Known homogeneous Kirchhoff material properties, quasi-static equilibrium, fixed end poses and a narrow Gaussian contact model provide substantial structure. Evaluation uses nine synthetic noisy marker positions derived from the same mechanics model, not a real camera or force sensor. Two ten-step pull/push trajectories report force-component mean errors of 0.008–0.022 N and location errors of 2.2–2.4 cm. These are model-consistency results, not independent physical grounding. No matched non-graph baseline, repeated-noise uncertainty study, posterior calibration, changing contact count, or closed-loop hardware control is demonstrated; experimental validation is explicitly future work. Torsion increases bias, and the authors suggest additional wrench sensing for torsion-dominant tasks. Reviewer inference: include as a directly relevant explicit mechanics/factor-graph formulation for dual-arm contact estimation, but do not upgrade assumed marker access to deployed observability or probabilistic notation to validated uncertainty. Shape-error units are inconsistent between pull and push prose, so avoid recycling those values without correction.


### DEX-PHD — DEX-PHD: A Dexterous Portable Handheld Device for Multimodal Data Collection

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.35462v1)；证据：Secs. III-A-D; IV-A-E, Tables I-II; V limitations。

DEX-PHD integrates a six-actuated-DOF robotic hand with per-finger triggers, thirty FSR channels and wrist video. Hand commands, measured states and contact signals are logged at 100 Hz, video at 60 fps; LED events align streams to tens-of-milliseconds resolution, with rolling QR alignment for two-device recording. Wrist SLAM and embodiment-specific inverse kinematics/offsets transfer trajectories while retaining the same hands. This is portable robot-hand data collection, not learned tactile control. For each of three tasks, ten demonstrations were collected, the feasible episode with lowest inverse-kinematics tracking error selected, and that episode replayed once on a humanoid. The reported metrics therefore do not estimate success rates or repeated-execution variability. Insertion has 2.66-degree joint MAE but only 0.197 contact correlation, directly showing that kinematic replay agreement does not guarantee contact reproduction. Multi-object grasping and drill actuation have contact correlations 0.691 and 0.761. FSR values are baseline-subtracted and aggregated per finger, not independent absolute-force measurements. Physical drill analysis covers in-air grasp/trigger motion because full fastening was difficult to reproduce reliably. The study supplies a useful contact-aware replay diagnostic and portable recording interface, but does not establish closed-loop tactile benefit, cross-hand hardware transfer, reproducible task reliability or load-path/topology generalization.


### FLoRe — Learning Force-Reactive Humanoid Loco-Manipulation

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.35862v1)；证据：Secs. III-A-C, IV-A-F; Tables I-II; real-world force-tracking paragraph。

FLoRe combines robot-free bilateral wrist-wrench demonstrations, a causal force-history diffusion policy, and hybrid whole-body force/position control. Per-hand force commands and measured feedback drive a shared controller; an external digital gauge validates standalone hardware tracking, with about 1.1 N reported steady-state error along the x axis. On gantry pushing, bimanual box rotation and wiping, ten condition-matched trials/task yield 24/30 successes versus 8/30 for a position-only policy trained with the same architecture/data/schedule. Withholding commands from the same trained force policy yields 11/30; retraining without force observations yields 20/30. Thus execution of predicted force has stronger evidence than an isolated representation advantage. Simulator force statistics condition on paired non-falling clips; physical tests remain one platform and limited masses, poses and surfaces. This is positive evidence for independently checked force control and bimanual load coordination, not a learned inter-interface graph or identification of every simultaneous load path. No contact-topology holdout or matched structural-representation comparison is reported.


### CARD — CARD: Contact-Anchored Retargeting for Dexterous Manipulation

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.36539v1)；证据：Secs. 3.1-3.5, 4.1-4.5; Tables 1-3; Appendices A-I; PDF pp.7,13,20。

CARD transfers contact locations, directions and force targets through semantic human-to-robot link mappings. Video/GRAB forces are synthesized over entire clips; centered smoothing, synchronized onsets and pseudo-object construction use offline information. Measured glove pressure is a distinct source. Appendix A describes mocap pressure while Appendix H labels mocap proximity-based contact; Appendix D uses tracked meshes despite Appendix A saying evaluation-only. Source provenance and blanket object-free claims therefore need qualification. Geometric fidelity pools anchor-frames, not physical successes. Replaying identical trajectories with fingertip-force control yields 25/30 successes versus 4/30 position-only across three tasks. Four-embodiment retargeting uses explicit semantic maps; tactile-free hands need compliance or action scaling. The physics variant bundles changed initialization, objective and targets. Table 3 task rates and Appendix I run rates cannot be reconciled or pooled without the unspecified valid-run denominators after invalid-physics exclusion. This supports contact-preserving retargeting and local force feedback, not causal cross-interface load identification, matched learned-representation benefit, or topology OOD.


### RoboSTD — RoboSTD: Zero-Shot Single-to-Dual Transfer via Sagittal Mirroring for Bimanual Learning

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.36685v1)；证据：Secs. IV-A–C; V-A–D; VI; Figs. 4–6; Appendix A mirror-mapping derivation。

RoboSTD constructs pseudo-bimanual demonstrations from single-arm data using sagittal mirroring of images, robot states and actions. The joint mapping depends on calibrated URDF axes and symmetric mounting, not universal sign flips. GPT-4.1 supplies arm assignments, precedence/conflict constraints and stage-language annotations; these describe semantic coordination rather than physical contact edges. Policies are fine-tuned on the constructed data, so “zero-shot” concerns the absence of additional task-specific bimanual demonstrations, not untrained inference. On ten RoboTwin tasks, success is 66.5% versus 39.1% for single-arm data and 67.6% for a native-bimanual oracle. Five real ALOHA tasks include coordinated stacking and sandwich making; sandwich completion reaches 74%, but whole-task success is 50%, illustrating the importance of preserving metric definitions. Removing the LLM reduces performance, but simultaneously removes coordination constraints and stage-language annotation, preventing attribution to graph structure alone. No tactile or force observations, physical load labels, or contact-topology-defined holdout are present. Trial/seed uncertainty is not clearly reported. Reviewer inference: include as evidence that data-level role and temporal structure can support real bimanual policies; do not equate semantic scheduling, symmetry-dependent augmentation, or target fine-tuning with physical contact representation or zero-shot embodiment transfer.


### ActiveAlign — ActiveAlign: Aligning Egocentric Manipulation via Active Perception

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.36859v1)；证据：Secs. 2.1-2.3; 3.1-3.2 Tables1-2; Appendices A-B Tables3-4。

ActiveAlign combines active hand-eye calibration with tactile refinement of object alignment. Offline robot/scene reconstruction supplies differentiable Gaussian-splat models and simulation assets; online RGB-D segmentation and pose tracking align them. Multi-state hand waving stabilizes camera estimation, while slowly probing a local planar panel until fingertip force crosses a threshold constructs an action-indexed height map. Real G 1 experiments use an eighty-element RoboSkin index-finger array and tactile-map-conditioned motion primitives. Across three panels, success is 14/20,9/20 and 15/20, compared with 3/20,2/20 and 8/20 for keypoint planning. This supports the integrated active-touch alignment pipeline, not an isolated learned-representation effect, because the planner/primitives also differ. Calibration experiments on public robot datasets improve mask overlap and cross-trajectory consistency; those tests do not establish tactile transfer across sensors or embodiments. AppendixB reports three-run calibration averages, but no comparable repeated-training uncertainty for manipulation. The control thread runs at 60 Hz while FoundationPose runs at 2 FPS, and the method requires offline assets and a local planar sampling assumption. ArUco fixtures provide evaluation references rather than runtime alignment. The work supplies a useful action-grounded geometric-contact baseline and highlights accumulated perception/kinematic error, without identifying calibrated loads, interhand contact structure, or held-out contact-topology generalization.


### Keeping-Contact — Keeping Contact: Task-Adaptive Friction Margins for Bimanual Non-Prehensile Manipulation

- 状态：preprint; author-claimed RA-L acceptance；精确版本：[v1](https://arxiv.org/html/2610.36961v1)；证据：Secs. III-A–E; Eqs. 3–28; IV-A/B; V-A–E; Tables I–II。

Two Kinova arms tilt a shared box about an environmental pivot using contact-specific friction margins and a convex quasi-static force planner. Known geometry, friction, mass and contact modes supply the structural prior; ATI wrist sensors measure actual forces, rather than learned tactile features. The adaptive allocation accounts for moment sensitivity and changing support/braking roles. Each of eight conditions has five trials, all successful with adaptive margins. Crucially, the fixed-margin comparator is calibrated per condition to match average combined planned force, so improved robustness cannot be reduced simply to exerting more force. Under a negative center-of-mass mismatch, adaptive margins succeed in 5/5 versus 0/5 for fixed margins. Nevertheless, completion does not imply zero constraint violation: nominal measured violation is 6.9%, and model/controller discrepancies remain. Small samples and no confidence analysis limit reliability claims. Reviewer inference: this is a genuine real bilateral-force redistribution baseline and counterevidence against blanket claims that such physical control evidence is absent. It is not an inferred cross-interface tactile graph, independently measured pivot reaction, online mode discovery, or held-out topology-transfer experiment. ArXiv comments claim RA-L acceptance; without publisher corroboration, retain explicitly author-claimed status.


### Which-Hand-Was-Late — Which Hand Was Late? Diagnosis for Robot Failure Recovery in Bimanual Tool Use

- 状态：preprint；精确版本：[v1](https://arxiv.org/html/2610.37533v1)；证据：Secs. 3–7; Tables 1–2; Appendices A–B (randomized-onset robustness)。

Two simulated Panda arms jointly turn a spring-return lock with a key-tool and push a door. Mechanism traces label failures, while grouped-by-door probes compare wrist wrench, proprioception, commands and images. The hidden latch-force threshold is unavailable to sensing; contact and mechanism oracles must not be conflated with robot-like channels. Under the canonical schedule, bilateral joint positions diagnose coordination failures with pooled AUC 0.986, while tool wrist torque diagnoses cam-out at 0.972. However, Appendix B independently randomizes onset times: bilateral-pose probes fall to approximately chance, whereas explicit relative-onset features remain strong. This materially limits any generic bilateral-representation claim. In 386 blocked replay attempts, diagnosis-aware escalation repairs 297 within two attempts versus 211 for a single-label strategy, while making fewer hard pushes than an all-at-once repair. These are simulator interventions, not demonstrated physical safety or real-world recovery. Door-group bootstrap intervals support the canonical diagnostic comparison, but do not remove schedule dependence or hidden-threshold ambiguity. Reviewer inference: include as tool-use identifiability and uncertainty evidence, emphasizing that uncertain cause sets and explicit temporal relations can matter more than a single confident failure label. It does not establish learned tactile topology transfer.

## 既有修订与发表状态



### FTP-1 — arXiv2606.13102v4, submitted October27 07:32:30 UTC

[Exact full text](https://arxiv.org/html/2606.13102v4), sections2–4, AppendixB.1/Figure10/Table7 and F.1–3/Tables10–12. v4's substantive delta is an explicit Sharpa22-joint→32-slot canonical mapping, including zero-filled, loss-masked unused slots and native-command reconstruction. No new numerical experimental results relative to v3 were found.

**Earlier backlog:** v3 (October13) added matched pretraining comparisons and probes. With matched data/budget, fine-tuned π0.5 averaged57.0% vsFTP-1 66.7%; this is not an architecture-independent representation effect. The scaling comparison changes data and optimization steps jointly. Unseen-sensor results require target-task finetuning/new sensor encoder, not zero-shot transfer. Probes use three training seeds: T2 attentive slip F1 improves .725→.780/.786 (T3/trunk/tokenizer), but force linear-MAE does not improve: T1 .106/.107/.116N and FeelAnyForce .273/.314/.424N. These are probe seeds, not replicated robot policies.

**Conclusion:** strengthens a bounded, fine-tuned sensor-transfer/pretraining case; does not establish calibrated cross-interface load or contact-topology generalization. Add an **archive-level** audit row; preserve frozen precision coding.

The v4 abstract's future-release wording is stale relative to the observed [official project](https://ftp1-policy.github.io/): public [source repository](https://github.com/michaelyuancb/ftp1-policy), [checkpoint tree](https://huggingface.co/MJJJJ1064/ftp1_v0426_50kstep/tree/main), and [dataset archive collection](https://huggingface.co/datasets/MJJJJ1064/FTP-1-Dataset) are visible. This is artifact availability, not execution, full 26-source coverage, completeness, or reproduction. No weights/serialized objects were loaded.

### Temporal-Tactile-Handover — arXiv2609.05282v2, October27 08:19:31 UTC

[Exact full text](https://arxiv.org/html/2609.05282v2), III-A–E, IV-A/B TableI. v2 adds editorial changes, project link, ethics attribution and a summation-index correction; method, experiment protocol and result numbers are unchanged. The64-step (~.9s) force-history autoencoder has24latent dimensions; frozen tactile encoder and deployment use past/current sensory inputs. 16action chunks execute8steps before requerying. TableI uses100trials/policy over10participants:93% is correct release-**or-hold**, not transfer-only success. Timing success92%, median delay1.70s, peak force4.07N remain the same. Independent interface-load estimation or held-out topology was not added. Preserve the conclusion; update version pin/audit date and document no numerical change.

[Project](https://hsp-iit.github.io/temporal-tactile-bimanual-handover/) self-identifies as a Humanoids2026 paper. No official venue/publisher title confirmation was established; retain preprint/author-claimed status, not verified acceptance.

### Blind-Baoding — arXiv2610.23438v3, October26 01:56:15 UTC

[v3 full text](https://arxiv.org/html/2610.23438v3), III–VII, TableII, especially VI-C/VII. v2 (October23 16:32:36) rewrites taxel interpretation, corrects calibration terminology to hysteresis, and explicitly discusses FSR latency and missed fast sliding contacts. v3 only fixes a figure reference at the text level. Numerical method/results remain unchanged. TableII C3 achieves34.75±26.06rotations vs5.0±4.1 with touch disabled in the same checkpoint, over10hardware trials;112.5rotations is a separate showcase. A separately trained proprio-only controller changes slew scale (.65vs.53), so is not a clean tactile-only ablation. The same ball pair/fixed setting does not test unseen topology. Conclusion remains task-bounded usefulness of sparse binary touch; add latency/contact-detection limitation, not a new performance gain.

## Status upgrades — existing papers only

Primary source: [official CoRL2026 accepted papers](https://www.corl.org/program/accepted-papers). Its GoogleSites body embeds escaped HTML; normal web extraction omits the list. Retrieved raw HTML was decoded and exact titles/official OpenReview targets verified:

| Study | Official OpenReview target |
|---|---|
| FTP-1 | https://openreview.net/forum?id=xc8asDq7QI |
| HTT | https://openreview.net/forum?id=0DopZPPLvw |
| PACE | https://openreview.net/forum?id=AIInkHZlvB |
| DeTac | https://openreview.net/forum?id=yMD1ykviND |
| T-Rex | https://openreview.net/forum?id=KdaClHHEUt |
| PartialBiGrasp | https://openreview.net/forum?id=JhEwJ56SH3 |
| VISTA (Equivariant Visual-Tactile Diffusion Policy…, not the unrelated UMI VISTA) | https://openreview.net/forum?id=40CsfPl2cq |

[Official homepage](https://www.corl.org/) says the accepted list was posted October19: this is **backlog status verification**, not a newly dated acceptance event. OpenReview attempted forums returned challenge/error; no reviews/camera-ready differences or proceedings metadata were inferred.

PhantomTac: [official ACM CCS2026 accepted papers](https://www.sigsac.org/ccs/CCS2026/program/accepted-papers.html) has exact title and authors BinbinZhang/YifengZhang/XiaomengChen/DongyaoChen; [official schedule](https://www.sigsac.org/ccs/CCS2026/program/schedule.html) corroborates. DOI10.1145/3830454.3846657 landing page unavailable in web tool, so retain arXiv citation with accepted status rather than assert final published proceedings.



完整61历史（3篇修订、58篇所获历史未见后续版本）见[版本台账](2026-10-28_prior-version-checks.json)。仅选定3篇进行了版本间全文比较；FTP-1 v2→v3额外补审属于10月13日旧工作，不算本周新增。缓存、官方列表与出版核验边界见[状态台账](2026-10-28_publication-status-checks.json)。

## 观察、排除与限制

- 观察 [T-WLA](https://arxiv.org/abs/2610.28814)：First released before prior Oct21 surveillance; discovered now. Full text retrieved but not fully audited this pass. Slow-fast tactile editor relevant; no new-window or synthesis claim.
- 排除 [High-resolution tactile observation makes hidden racket-control mechanisms learnable](https://arxiv.org/abs/2610.35563)：Human badminton biomechanics and human learning feedback; no robotic manipulation or robot-representation transfer result established in scope screening. Full-text screening only, not complete58-page audit.
- 排除 [Externalizing Hand Grip Pressure Through Real-Time Visual Feedback](https://arxiv.org/abs/2610.36769)：Human sports pressure-display usability; no robotic manipulation result; abstract screening.
- 排除 [Perceived Acceptability of Sensory Augmentation](https://arxiv.org/abs/2610.34451)：Human sensory-display acceptability survey, outside manipulation/representation eligibility; abstract screening.
- 排除 [Functional-Specialisation-Bimanual](https://arxiv.org/abs/2610.33947)：Two planar musculoskeletal arms hold/track an empty target; explicitly not mechanically coupled. No shared manipulated object, contact/tactile representation or dexterous contact-rich result. May remain methodological role-specialisation background, not archive inclusion.
- 排除 [TEAR](https://arxiv.org/abs/2610.30819)：Authority routing between human and autonomy rather than a tactile/contact/physical representation contribution. Abstract and method scope screened; not a complete full-text evidence extraction.

并非所有观察/排除项都完整阅读全文，其筛查深度单独标明。未审核的新线索不进入正文结论。已发表经典工作、非arXiv来源、全部代码/数据可用性和完整历史PDF缓存未穷尽重查。

## 验证与交付

见[校验与PDF检查](2026-10-28_validation.md)。只提交自编综述PDF；不合并PR、不改许可证/权限、不扩张精标子集。原始PowerShell校验在该次提交的GitHub Actions执行，且跟踪到终态；本地Python等价检查与远端原始脚本执行明确区分。
