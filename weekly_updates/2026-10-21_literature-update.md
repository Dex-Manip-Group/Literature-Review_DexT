# 2026-10-21 文献增量、全文核读与解释记录

## 范围、版本与三个日期

- 检索：2026-10-21 UTC，本次定向来源检查。主新增窗口为2026-10-15起至检索时可访问来源，不宣称覆盖全天或穷尽数据库。10月14日后半天的发现单列为边界/待处理；ILA同日v2单独复核，不冒充窗口内新论文。
- 最新 main：6804f9c99d0af044babda4755c0c48d47c3ae9a5。未合并草稿 PR #2（e73c2e7）及 #3（f92b00b）均保留。本轮基于 #3 的 literature/2026-10-14 叠加独立草稿，不覆盖、合并或视作前两轮已获审核。检查时两PR均无评论。
- 本轮新增15篇，清单136条：135学术工作、1资源；45条具有定位全文归档级审读。另复核ForeTac/ILA，不重复计数。
- 正文证据冻结：2026-10-21，仅在新增全文核读、正文、引用、矩阵及结论整合完成后更新。
- 精标：2026-08-13，30篇（19A/11B）不变；历史0/30仅描述这个目的性子集，不外推至135篇或全领域。
- 本轮所有新增项仍为预印本/作者声明层级，不凭自述接收升级。未运行研究代码、复现实验或访问受限全文，未刷新86份历史缓存。

## 结论改变与保持

1. 核心联合缺口保持：部署可观测的机器人跨界面载荷推断、匹配预算的表示收益和明确接触参与者/边变更下迁移，仍未被这些证据联合证明。不是声称双臂触觉控制、工具协作或结构迁移不存在。
2. 正面基线更强：Blind Baoding的同权重触觉置零、ContactPolicy局部触觉策略及PhysCanvas双臂触觉世界模型，要求把运行时触觉依赖、控制频率与预测世界模型的真实控制收益分开。
3. 拓扑术语进一步明确：DexGraspFlow确有未见删指形态测试，不能忽视；它对应运动学连接变化，不等同于观测推断的跨手接触图划分。30篇历史结论不因此改写。
4. 数据/推断边界更具体：Ego2Contact真实部署仍用实测手套触觉；ACTS完整轨迹编码与外部跟踪不等于因果自主规划；Spark-0触觉预训练收益不直接等于运行时触觉增益。加载、接触和旋转指标需保留物理标签来源与单位。
5. ForeTac v2是方法描述实质修订而非新结果：二元good/bad原型替代四类目标；原表和headline指标未变，seed 42不再声明。ILA v2删除过早会议页眉，科学文本无新增，维持预印本。

## 纳入：版本、定位及解释

### GPT-as-Tactile-Policy: GPT-6-Astra Understands Touch and Outperform Vision--Tactile--Language--Action Models

- 元数据：[官方记录](https://arxiv.org/abs/2610.28457)；[核读全文](https://arxiv.org/html/2610.28457v1)。
- 首发UTC：2026-10-20T16:15:02Z；核读v1，版本日期2026-10-20T16:15:02Z；状态：preprint。
- 定位：Secs. 3-4; Tables 1-3; main methods and experiments; no separate appendix found。

A frozen GPT-6 Astra controller uses scene/wrist images, proprioception, bilateral tactile images, pooled indentation-depth descriptors, marker displacements, and interaction history. Offline task skills and tactile references are distilled from 40 demonstrations plus ten validation episodes per task; this is not a demonstration-free policy. Generic inverse kinematics executes bounded action segments. Across five UniVTAC tasks and 500 simulator episodes, mean success is 93.8%, above N0-TWAM's 84.6% but below N0-VTLA's 96.2%, contrary to an unqualified reading of the title. A paired InsertHole comparison reports 99% with touch versus 31% without, using identical initial configurations, controller, and action budget. However, the intervention removes both online tactile information and tactile reference material and changes the modality-matched skill description. Depth and marker descriptors are deformation proxies, not independently validated force measurements. The evidence supports a powerful reference-conditioned simulated controller and a task-specific benefit of the tactile-information bundle, not a universal model ranking, isolated online-touch effect, physical force understanding, real-time hardware control, cross-sensor robustness, or held-out contact-topology generalization.

### HuTact: Learning Tactile-Aware Hand Representations from Human Hand-Object Interaction Data

- 元数据：[官方记录](https://arxiv.org/abs/2610.27995)；[核读全文](https://arxiv.org/html/2610.27995v1)。
- 首发UTC：2026-10-20T10:31:45Z；核读v1，版本日期2026-10-20T10:31:45Z；状态：preprint。
- 定位：Secs. III-V; Tables I-IV; Fig. 4; methods, evaluation and limitations。

HuTact pretrains hand representations on 2.57 million human interaction frames using wrist-local fingertip coordinates and mesh-distance pseudo-contact, not measured human touch. Separate coordinate and tactile tokenizers, hand/finger positional structure, and spatial-then-temporal Transformers transfer to Revo2 sensor channels through tokenizer reinitialization and downstream adaptation; optional robot-play midtraining adds 44 minutes. Episode-level splits precede temporal-window construction. Grasp Macro-F1 improves from 88.23 to 93.29; leave-one-object-out grasp performance improves from 74.92 to 80.27, with substantial object-level variability. With only 25% of grasp labels, the adapted model reaches 88.26, comparable to full-label scratch training. Two real manipulation tasks use 40 trials each: ACT and Diffusion Policy both average 50% success with the pretrained representation, versus respective no-touch baselines of 33.8% and 22.5%. Scratch tactile encoders score 32.5% and 38.8%. These results support transferable initialization and data efficiency. They do not isolate all architectural versus data-source effects, demonstrate zero-shot sensor transfer, or establish contact-topology generalization; the Sparsh-Skin comparison fine-tunes a differently structured source model on the same target platform.

### Tactile-ETA: Embodied Task Agents Can Perform Fine Manipulation through Tactile In-Context Learning

- 元数据：[官方记录](https://arxiv.org/abs/2610.27613)；[核读全文](https://arxiv.org/html/2610.27613v1)。
- 首发UTC：2026-10-20T04:27:15Z；核读v1，版本日期2026-10-20T04:27:15Z；状态：preprint。
- 定位：Secs. 3-5, Tables 1-3; Appendices A, B, D, E, F; selected qualitative cases in C。

Tactile-ETA supplies a frozen embodied model with action-aligned demonstrations containing before/after vision, proprioceptive motion, and synchronized tactile strips. A change-based selector retains endpoints and salient adjacent frames without force or slip labels. In the main simulator comparison, current visual, tactile, and execution feedback are held constant; only demonstration tactile information changes. Across four tasks with 100 matched initializations each, mean success rises from 15.75% to 24%. On LiftBottle, selected tactile frames reach 36%, versus 27% for endpoints or no demonstration touch and 2% for all frames, indicating that temporal presentation matters. More demonstrations are not monotonically better: one, two and four shots average 22.5%, 24% and 19%. Two physical tasks achieve three successes in five trials each with a human multimodal demonstration versus zero without; that real comparison does not isolate touch. Control commands execute at 60 Hz, but inference occurs between bounded motion segments and simulation pauses during reasoning. Evidence therefore supports contextual tactile information and compression, not continuous low-latency control, robust real-world reliability, sensor invariance, or topology OOD.

### TacTalent: GPT-6 Astra Is a Native Visuo-Tactile Policy for Contact-Rich Manipulation

- 元数据：[官方记录](https://arxiv.org/abs/2610.26846)；[核读全文](https://arxiv.org/html/2610.26846v1)。
- 首发UTC：2026-10-19T17:59:17Z；核读v1，版本日期2026-10-19T17:59:17Z；状态：preprint。
- 定位：Secs. 3-8; Tables 1-5; Appendices A-B protocol details。

TacTalent wraps frozen GPT-6 Astra with scene vision, bilateral tactile images, proprioception, bounded history, and one to three successful demonstrations. End-effector and gripper commands execute through a fixed controller. Nineteen simulator tasks span UniVTAC and OpenViTac; matched vision-only and vision-plus-touch conditions use 210 scene seeds per modality, normally ten trials per task. Reported suite means with touch are 93.8% and 81.8%, versus 76.3% and 80.6% without touch. Six tasks improve, nine tie, and four deteriorate, so the result is not a uniform tactile advantage. Comparisons with published learned-policy baselines do not use identical evaluation subsets. Moreover, GraspChip uses a relaxed success rule that accepts supported intact placement without the original release/withdraw requirement. Demonstration selection, benchmark-specific criteria and small per-task samples matter when interpreting the high success rates. The paper reports approximately fourteen-second median vision-tactile API latency; sixty-hertz command execution is not a model feedback rate. No physical experiments, held-out sensor/embodiment tests, topology-defined splits, repeated-model-seed confidence analysis, or controlled tactile-texture masking experiment establish broader deployment claims.

### ContactPolicy: Touch Where It Matters: Learning Local Tactile Policies for Fine-Grained Gripper Control

- 元数据：[官方记录](https://arxiv.org/abs/2610.24485)；[核读全文](https://arxiv.org/html/2610.24485v1)。
- 首发UTC：2026-10-17T06:10:30Z；核读v1，版本日期2026-10-17T06:10:30Z；状态：preprint。
- 定位：Secs. III-IV; Eqs. 1-8; Tables I-III; main methods and experiments。

ContactPolicy separates visual arm motion from local tactile gripper control. Each arm independently encodes bilateral fingertip image differences, sensor-reported three-axis forces, arm position/velocity and gripper state; it predicts a gripper increment and apply/hold modulation. A visual intention selector switches stages, while future tactile-latent and force prediction are training-only auxiliaries. Six physical tasks, five bimanual, use fifty demonstrations and twenty-five evaluation trials per task. Overall success is 124/150, or 82.7%, versus 57.3% for multimodal fusion and 42.7% for vision-only control. However, local gripper updates run at 60 Hz while baseline policies run at 30 Hz, so the system comparison bundles control frequency, routing, context and auxiliary supervision. Across three tasks, arm-state conditioning raises successes from 43 to 63 out of 75 and reduces premature failures from 22 to five, supporting contextual gating. The evidence demonstrates useful real local tactile feedback in coordinated tasks, not an explicit interhand contact graph, isolated representation superiority, calibrated force invariance, held-out topology generalization, or robust cross-embodiment transfer. Evaluation remains within the demonstrated task/platform setting.

### ACTS: ACTS: Learning Visuo-Tactile World Models from Human Physical Interaction

- 元数据：[官方记录](https://arxiv.org/abs/2610.24285)；[核读全文](https://arxiv.org/html/2610.24285v1)。
- 首发UTC：2026-10-16T22:33:18Z；核读v1，版本日期2026-10-16T22:33:18Z；状态：preprint。
- 定位：Secs. 3-7; Tables 1-3; Appendices A-I, especially force calibration, action conditioning, splits and metrics。

ACTS trains object-specific multiview world models on 4.91 hours of bimanual human interaction and evaluates transfer on fifteen robot episodes without robot training. GelSight images, wrist/scene views, OptiTrack poses and tactile-derived normal-force estimates supply five synchronized streams and force-augmented actions. Critically, predictions receive the entire recorded future action window, including future measured sensor motion and estimated force. This supports offline trajectory-conditioned prediction, not deployment-observable forecasting from current sensing and prospective commands alone. An eight-frame history predicts eight future frames, about 0.53 seconds. Human scene PSNR improves over a scratch baseline, but comparisons also differ in pretraining and, for ContactWorld, context length and stream decomposition. Metrics use VAE-reconstructed targets; static gel appearance can dominate them. On robot tactile streams, copying the latest frame wins PSNR on five of six streams, while ACTS improves LPIPS on five. A separate calibration study reports 0.318 N force-estimation MAE, not manipulation-force or shear ground truth. The evidence does not establish contact-timing accuracy, causal physical understanding, closed-loop planning success, sensor transfer, or topology OOD.

### Ego2Contact: Ego2Contact: Predicting Touch from Egocentric Human Video for Contact-Rich Robot Manipulation

- 元数据：[官方记录](https://arxiv.org/abs/2610.22932)；[核读全文](https://arxiv.org/html/2610.22932v1)。
- 首发UTC：2026-10-16T04:51:17Z；核读v1，版本日期2026-10-16T04:51:17Z；状态：preprint。
- 定位：Secs. III-IV; Tables I-IV; real-world policy protocol and Fig. 6。

Ego2Contact predicts bilateral pressure/contact grids from egocentric video using global visual features, hand-local features and conditional flow generation. Anatomical regions and hand-aligned grids provide explicit structure, but not a relational contact graph. Human unseen-object contact IoU reaches 0.4812 versus TouchAnything's 0.4720, while volumetric IoU is slightly lower. Transfer requires target-domain adaptation: robot contact IoU rises from 0.008 zero-shot to 0.476 after substantial paired simulator training. Online predicted touch improves three simulated policy tasks modestly but remains far behind measured/simulator touch on precision tasks: pen-cap success is 0%, 1% and 95% with no, predicted and ground-truth touch. The real pipeline adapts with approximately 123,000 paired frames and uses predicted tactile features for offline policy post-training. During actual real deployment, however, the policy receives measured tactile-glove observations, not the video predictor. Reported real results are qualitative rather than a quantitative success-rate comparison. Consequently, the study supports adapted contact-field estimation and limited simulated sensor substitution, not zero-shot cross-sensor invariance, sensorless real manipulation, full force observability, or held-out topology generalization.

### Spark-0: Spark-0: Scaling Spatially Aligned Tactile Pretraining for Robot Dexterous Manipulation

- 元数据：[官方记录](https://arxiv.org/abs/2610.22342)；[核读全文](https://arxiv.org/pdf/2610.22342v1)。
- 首发UTC：2026-10-15T17:56:17Z；核读v1，版本日期2026-10-15T17:56:17Z；状态：preprint。
- 定位：Secs. 3-6; Tables 1-4; Appendices A-G and Tables 5-11; PDF p.9 Tables 2-3 visually verified。

Spark-0 pretrains a vision-language-action system with 1,000 hours of human tactile recordings and spatial alignment losses. Training-only depth geometry and projected hand-contact maps supervise visual latents; online tactile force histories and spatial pressure tokens enter the action expert rather than the language backbone. A matched-RGB, matched-compute ablation compares visual-only pretraining with retaining tactile information. On the vision-only Ego Humanoid evaluation, after target fine-tuning, success improves from 52.45% to 71.72%; this is adapted embodiment transfer, not zero-shot deployment. On five real tactile-enabled tasks, success rises from 44% to 52%, based on ten trials per task. Both variants use touch during downstream training and deployment, so the contrast isolates pretraining information rather than online tactile sensing. Simulation success barely changes, from 36.57% to 36.86%. Every method fails full completion of the real Insert Test Tubes task despite nonzero partial scores. The same glove family on human and target robot, one reported training seed, and limited real trials leave sensor invariance, uncertainty, physical force accuracy and held-out contact-topology generalization unresolved.

### GRASP-Bimanual: GRASP: Global-Local Representation Alignment and Spatial-Physical Grounding for Bimanual Robotic Manipulation

- 元数据：[官方记录](https://arxiv.org/abs/2610.23123)；[核读全文](https://arxiv.org/html/2610.23123v1)。
- 首发UTC：2026-10-16T08:29:19Z；核读v1，版本日期2026-10-16T08:29:19Z；状态：preprint。
- 定位：III-A/B; IV-A/B; IV-C Table I; IV-D Fig. 4; V。

GRASP injects forward-kinematic TCP and inter-arm relative-pose losses plus future DINOv3 feature and Grounding-DINO region supervision during training. Runtime retains learned queries, current multi-view RGB, instruction and robot state, not future frames or teachers (III). The five pi0.5 variants share demonstrations, initialization and training-step budgets. RoboTwin evaluation uses 50 tasks, 50 demonstrations/task and 100 episodes/condition (IV-A/B). Clean/randomized success is 64.13/36.15% for baseline, 79.22/52.84% for full GRASP, and 68.30/65.15% for query-only; the full method therefore loses randomization robustness relative to query-only. TCP mean error falls from 5.3 to 4.6 mm (Table I). Hardware covers four tasks with about 150 demonstrations/task, five training seeds and 30 trials/checkpoint; success requires intervention-free completion and error bars describe across-seed SD. Juice-making improves from 56.7% to 83.3% (IV-D). Reviewer inference: useful bimanual/tool-use prior comparison, but grippers, no tactile observations, detector-dependent supervision, and one hardware platform limit claims about dexterous contact structure or force/load transfer. No strict contact-topology OOD evidence is established.

### CQDC-Warp: CQDC-Warp: GPU-Accelerated Differentiable Quasi-Dynamic Simulation for Contact-Rich Manipulation

- 元数据：[官方记录](https://arxiv.org/abs/2610.21349)；[核读全文](https://arxiv.org/html/2610.21349v1)。
- 首发UTC：2026-10-15T06:30:20Z；核读v1，版本日期2026-10-15T06:30:20Z；状态：preprint。
- 定位：IV; V-A/B; VI-A Table II; VI-B; VI-C/D Table III; VII。

CQDC-Warp combines compliant contact, implicit dynamics derivatives and sampled geometry derivatives for local MPC. Inputs include scene/robot models, current configuration, goals, suitable initialization and robot links intended to contact objects; dynamics choose realized geometry/friction, not an externally prescribed mode schedule (IV-V). On 17 Allegro objects with 1,024 trials/object, success is 79.8% versus CFree 73.7% and IMPACT 65.2%; trajectory times are 0.794, 21.422 and 39.844 seconds. These timings compare 1,024 GPU worlds against single-core sequential baselines (VI-A, Table II). Removing geometry derivatives reduces success by 2.44 points; horizon ablation also matters (VI-D). Bimanual Shadow bottle opening and shared-object lifting succeed in 1,024/1,024 and 1,007/1,024 trials. Hardware only replays a scanned-bottle/table trajectory on Sharpa at fivefold slower duration, without closed-loop tactile validation (VI-B). Reviewer inference: include as contact-mechanics/planning evidence, not learned tactile representation or deployed bimanual transfer. Initialization/contact-intent assumptions, task-family tuning, and unevaluated downstream data-learning benefits constrain interpretation. No seeds/confidence intervals or held-out contact-topology protocol are established.

### DexGraspFlow: DexGraspFlow: Topology-Aware SE(3) Flow Matching for Cross-Embodiment Dexterous Grasp Generation

- 元数据：[官方记录](https://arxiv.org/abs/2610.26962)；[核读全文](https://arxiv.org/html/2610.26962v1)。
- 首发UTC：2026-10-18T13:09:00Z；核读v1，版本日期2026-10-18T13:09:00Z；状态：preprint。
- 定位：3.1-3.4; 4.1-4.6 Tables 1-7; 5.2。

Dual-stream flow matching models link-link and link-object relations, with URDF shortest-path biases and geometric features; Pyroki IK recovers joints (3). Training uses 14,011 grasps on 48 objects across Barrett, Allegro and Shadow; ten objects are held out. Success means object displacement within 2 cm after six directional perturbations. With 3,000 trials, mean success is 95.33% versus TRO-Grasp 94.60%; same-GPU single-sample latency including IK is 0.132 versus 0.257 seconds (4.1-4.2). Geometry-only/topology-only/no-bias success is 89.70/92.73/86.63% (Table 4). Seven unseen finger-removal variants produce 88.74% versus DRO 53.11% and TRO 20.47% over 7,000 trials/method. This genuinely changes kinematic links, but is not a learned contact-participant/edge holdout (4.3). Real execution uses separately trained Linker-Hand demonstrations, RGB-D/FoundationPose, IK and added closure offsets: 91/100 lifts, not zero-shot novel-embodiment transfer (4.6). Seeds/uncertainty are not reported. Reviewer inference: valuable structural/morphology evidence; tactile sensing, bimanual coordination, contact-topology transfer and general novel-hand transfer remain unproven. Feasibility is delegated to IK rather than enforced during flow.

### PhysCanvas: Physical Canvas: A Vision Tactile World Model For Robot Policy Evaluation And Learning

- 元数据：[官方记录](https://arxiv.org/abs/2610.28613)；[核读全文](https://arxiv.org/html/2610.28613v1)。
- 首发UTC：2026-10-20T17:54:03Z；核读v1，版本日期2026-10-20T17:54:03Z；状态：preprint。
- 定位：3; 4.1-4.5 Tables 2-4; Appendices A-H; B Table 5; E Table 6。

PhysCanvas jointly renders three RGB views, optical tactile images, marker displacements and task state through a shared Wan video model; FK/camera-projected command images condition dynamics. Training-only future targets and frozen scene/modality/state reward models provide supervision, including human-labeled real completion states (3; E). Four bimanual tasks cover handover/table reorientation/insertion, cap unscrewing, block separation and restricted cube turning. Data contain 3,805 training and 320 held-out rollouts (B). ACT/FM/pi0.5 receive current RGB, robot state and tactile displacement; imagined evaluation starts from real observations, then uses generated futures (D/F). EVAC/Open-Sora/WoVR comparisons assess visual metrics; staged ablations assess tactile MAE, timing and event F1. State supervision raises mean task-wise policy-outcome correlation 0.602→0.885; pi0.5 real success rises 59.1→70.8% after imagined RL. Evaluation uses three batches of 20 scenes/task-policy; policy results report three-run population SD (4). Event F1 falls 0.4550→0.4455 when modality consistency is added. Reviewer inference: valuable outcome-aligned bimanual tactile simulation, not load-path identification, calibrated force dynamics, or topology OOD. Qualitative action intervention and mismatched-modality negatives do not establish causal mechanics.

### PhantomTac: PhantomTac: Hijacking Robotic Tactile Systems with Deploy-and-forget Tags

- 元数据：[官方记录](https://arxiv.org/abs/2610.26174)；[核读全文](https://arxiv.org/html/2610.26174v1)。
- 首发UTC：2026-10-19T11:03:56Z；核读v1，版本日期2026-10-19T11:03:56Z；状态：preprint; author-claimed ACM CCS 2026 acceptance。
- 定位：2-3; 5.1; 6.1-6.5 Fig. 15; 7.1-7.2; Appendices A/B。

PhantomTac supplies physical robustness evidence rather than a new manipulation policy. Controlled laboratory interventions corrupt magnetic tactile force estimates, disrupting feedback on a Dofbot gripper and Unitree G1 contact task (6). An interference-free 20-trial grasp baseline succeeds throughout; offset robustness tests use 20 trials per direction/distance and report greater than 95% attack success within the tested 8 mm bound (6.2/6.4). Response-model blind tests report approximately 0.16 N RMSE, but this evaluates sensor-response prediction, not calibrated manipulation uncertainty (5.1). Multiple commercial sensor models show susceptibility, with differing response magnitudes; model-specific characterization is needed (6.5/7.2). The proposed independent proprioceptive consistency monitor is a defense discussion, without a measured defense benchmark (7.1). Reviewer inference: supports evaluating whether represented contact is physically trustworthy and cross-modally corroborated. It establishes neither bimanual/load-transfer competence nor universal tactile vulnerability: optical, capacitive and resistive sensors are outside direct scope. The official abstract claims CCS 2026 acceptance and lists DOI 10.1145/3830454.3846657; publisher verification failed. No code execution or independent reproduction was performed.

### Tactile-Rotation-Morphology: Tactile In-Hand Object Rotation: A Comparative Study of Hand Morphology in Simulation and Hardware

- 元数据：[官方记录](https://arxiv.org/abs/2610.26759)；[核读全文](https://arxiv.org/html/2610.26759v1)。
- 首发UTC：2026-10-19T17:18:25Z；核读v1，版本日期2026-10-19T17:18:25Z；状态：preprint。
- 定位：III-A-D; IV-A-C; V Tables I-II; VI Tables III-V; VII。

Two four-finger LEAP layouts use the same contact-indicator, local contact-pose and force-magnitude interface. A privileged simulator teacher trains the student, which infers its latent from 30-step observation/command history. Hardware tactile models are calibrated offline against robot-arm and force/torque labels (III). Full tactile, binary-touch and proprioception-only conditions are compared in simulation on 12 held-out objects, using 64 environments and pooled episodes longer than 20 steps, not reported independent training-seed statistics (IV). Full touch increases normalized rotation versus proprioception by 94.8% and 66.9%; this simulation metric divides accumulated radians by 3.14, unlike hardware revolutions (Table I). Hardware tests only full-tactile policies on ten objects, five trials/object/orientation, reporting mean/SD. Symmetric layout yields 32.0% greater rotation count and 19.9% lower pooled mean load (V-VI). Load-sharing CV is 0.051 versus 0.148; loads sum estimated force magnitudes, not wrenches (IV-C). Reviewer inference: strong motivation for progress/contact/load metrics together, but morphology comparison is not cross-embodiment policy transfer. Hardware tactile ablations, calibrated uncertainty, independent load validation and bimanual handover remain untested.

### Blind-Baoding: No Eyes, No Problem: What Does Touch Contribute to Blind Baoding Ball Manipulation?

- 元数据：[官方记录](https://arxiv.org/abs/2610.23438)；[核读全文](https://arxiv.org/html/2610.23438v1)。
- 首发UTC：2026-10-16T13:22:03Z；核读v1，版本日期2026-10-16T13:22:03Z；状态：preprint。
- 定位：III-A-E; IV-A-B; V/Table II; VI-A-C; VII。

A four-frame proprioceptive/binary-touch policy controls one Shadow Hand Lite and two balls at 60 Hz, with hardware-aligned coupling, calibration and episodic sensor corruption (III). Ten hardware trials/configuration give 34.75 mean full rotations versus 5.00 when touch is zeroed in the same checkpoint (IV-V/Table II). The 112.5-rotation showcase is separate from these statistics. Simulation aggregates 768 episodes over three seeds; hardware uses one ball pair. The separately trained proprioception-only policy differs in slew-rate setting, so it is not a clean sensing-only comparison. Sensor corruption plus slew limits transfer better than the intermediate controller, but a cumulative ladder does not isolate all interactions. This strengthens a compact binary-feedback baseline and runtime-ablation requirement, not a claim for richer representations, independent load estimates or held-out contact-topology transfer. Artifact execution and independent reproduction were not performed.

## 已有论文修订

ForeTac v2 changes the contact-quality model, not the reported performance: four contact classes and a good-minus-logsumexp-failures objective in v1 become two good/bad prototypes, binary cross-entropy, and a good-minus-bad logit margin. The scorer dataset is now described as 100 good and 120 bad episodes; seed 42 is no longer stated. The direct-current-contact control is clarified as using the same good/bad labels and guidance schedule. Tables I–VI, task success/contact success values, action-masking and prefix diagnostics, and reported latency remain unchanged. Causal tactile history, candidate-action-conditioned prediction, frozen policy checkpoints, and inference-time gradient guidance still support structured predictive-contact evidence, not a hand–tool–object graph or topology transfer. Auxiliary tactile pretraining, task-specific outcome supervision, 20 trials per task, absent repeated-seed uncertainty, and additional replanning cost still constrain interpretation. Treat this as a substantive correction to the documented method, not proof of newly rerun experiments or stronger generalization.


[ForeTac官方历史](https://arxiv.org/abs/2610.18118)及精确版本PDF均复核；当前审读行与引用更新至v2，10月14日v1历史报告保留。20次/任务、附加预训练及任务质量标签、额外推断时间、不报告重复训练种子不确定性等限制保留。

[ILA v2](https://arxiv.org/pdf/2610.18855v2)发布于2026-10-14 16:29:07 UTC，属于同日边界维护。去掉版本水印与重复的ICLR 2027会议页眉后，v1/v2全篇提取文本相同；未比较每个图像像素，不声称二进制等同。当前pin更新，状态保持preprint。

[版本核验台账](2026-10-21_prior-version-checks.json)覆盖46个arXiv历史和1个Preprints.org页面，包括10月14日16条全部新增、上一轮15条复查与部分核心/数据工作。仅ForeTac/ILA重新精确版本全文比较，其他为版本元数据检查。部分页面缓存早于检查日，阴性结果仅针对获取到的历史；不是全库实时穷尽检查。

## 观察、边界与排除

- TacClaw-Infinity（[2610.20320](https://arxiv.org/abs/2610.20320)）：官方首发10月14日15:06:53 UTC，不按10月15日公告日期伪装窗口内首发。已读全文但作为边界待纳入，不计15篇；作者报告10,000小时数据，未验证下载完整性。
- Coordi-pi（[2610.19753](https://arxiv.org/abs/2610.19753)）与Active Perception through Handovers（[2610.19896](https://arxiv.org/abs/2610.19896)）：10月14日边界，未完成本轮全文审读，保留观察。
- OpenViTac（[2610.10384](https://arxiv.org/abs/2610.10384)）：10月7日旧发现/待补读，不算新窗口。
- Predictive Geometry to Action（[2610.28164](https://arxiv.org/abs/2610.28164)）：几何/双臂相关线索，未完成全文核读，不入正文。
- Physical Words（[2610.26854](https://arxiv.org/abs/2610.26854)）：替换列表线索，未完成版本/全文核验，观察，不据摘要宣称新增结论。
- 2610.20134综述属于10月14日边界与二级背景；不替代原始研究证据。
- FTP-1 v3与HTT v2均为10月13日修订、窗口前待核读，不作为新结果。重复版本不新增清单记录。
- 非相关展示/纯识别、日期不符或仅搜索摘要的线索不进入研究级综合。观察不代表最终学术排除。

## 检索与可获取性

以官方arXiv cs.RO近期列表、abstract提交/修订历史、HTML/PDF全文为纳入依据。定向检索组合包括 tactile representation / visuotactile control / bimanual / handover / cooperative tool / contact graph / physics / dataset / arXiv 2610 及October 15、16、19、20日期；第三方索引仅用于发现，不作为状态或方法证据。关键词和论文逐条查询不是可复现实验式的全数据库检索，不宣称PRISMA完整性。

PhysCanvas官方项目的code/model仍为coming soon；PhantomTac作者声明CCS 2026接收，ACM DOI检索失败，故保留作者声明层级。其他新工作只证明本次官方全文可访问，不据链接推断代码、权重、数据完整可用。没有共享第三方PDF或改动许可/权限。
