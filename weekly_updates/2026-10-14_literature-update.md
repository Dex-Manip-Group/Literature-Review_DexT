# 2026-10-14 文献增量、全文核读与解释记录

## 1. 范围、版本与三个日期

- 检索：2026-10-14 UTC，新增/修订事件窗口为 2026-10-07 之后至本次可检索来源。属于定向快速筛查，不宣称穷尽数据库或全天来源。
- 起点：main 6804f9c 已合并维护 PR #1；文献 PR #2 仍为未合并草稿，head e73c2e7。本轮在 PR #2 之上叠加独立可审查分支，不覆盖、合并或伪称其已获组员批准。PR #2 当时无评论/评审。
- 本轮新增 16 条定位全文审读记录，现 121 条：120 学术工作、1 资源。
- TouchScale 是10月7日首发、10月8日修订后的新发现；不能算10月8日之后首发，未声称v1-v2有已核验科学增量。
- 正文证据冻结：2026-10-14，新增证据与解释已经整合进正文、引用、矩阵和结论后更新。
- 精标：2026-08-13，30篇（19A/11B）保持不变。历史0/30只描述该目的性子集，不统计扩展库的零发生率。
- 新记录均为预印本/作者声明层级。没有仅凭作者的会议接收声明升级发表状态。

## 2. 对结论的影响

1. **核心联合缺口保持，具体比较基线更强。** 新证据支持时间角色分解、触觉预测/动作条件、阶段力专家、方向选择顺应和人类触觉数据规模；没有因此证明独立物理标签下的机器人跨界面载荷推断、等预算结构收益及严格接触拓扑迁移的联合成立。
2. **控制频率与信息可用性必须具体化。** 全策略每步重算、chunk起点感知后开环执行、未来动作/目标条件、训练未来触觉和部署当前触觉都不是同一种闭环。保留各论文实际使用的外部跟踪、人工切换和任务方向配置。
3. **工具协作已存在，不能笼统描述为空白。** 应区分任务完成、触觉表示机制和独立载荷传播证据。contact-stage条件成功率、成功trial上的误差、轮次/圈数和物理安全不混算。
4. **模型或数据的发布声明与实测可用性分开。** TouchScale论文500h与官方卡当前100h/受限获取不同；TACROSS和FOMO代码仍标为计划/Coming Soon。本轮未填写访问表单、提交联系信息或下载受限资料。
5. **局部结构不能自动升级为跨手结构证据。** 固定marker图、固定网格、身体点图或合成拓扑只能按其训练/测试划分解释；图收益还需要匹配非图/打乱边等消融。

## 3. 纳入记录：日期、证据和边界

### Bimanual-RMA: Scaling Latent Motor Adaptation to Coordinated Bimanual Manipulation

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.14833)；全文：[审读版本](https://arxiv.org/html/2610.14833v1)。
- 首发：2026-10-10T11:49:02Z；审读版本：v1，2026-10-10T11:49:02Z。状态：preprint; author-claimed IROS 2026 Bimanual Manipulation Workshop acceptance。
- 定位：III-A/B (deployable x, privileged e/state, adapter); III-C (reward); IV (randomization and training); V/Table I (4 seeds, 512 environments); VI (14/20 hardware); VII (scope)。

A shared RMA latent provides a useful bimanual baseline without explicit tactile graphs. The teacher receives object identity/properties, orientation and contact impulses; the student uses 50-step observation/action history and wrist depth. Crucially, runtime object position still comes from an external camera/AprilTag (III-A/B; VI). Table I reports four-seed simulation success: Pick 65.74%, Lift 85.13%, Stack 3.81%; the unconditioned PPO baseline receives the same randomization/training recipe but lacks latent conditioning. Success means achieving the condition at least once during an episode. Hardware evidence is 14/20 lifts of one box, with stability required; failures include two slips and four oscillatory completions (VI). The study varies properties within a predefined object set, not held-out topology or broad unseen categories (VII). Reviewer inference: include as deployment-observable latent-system-identification baseline, while separating tracker-assisted control, training contact rewards, and force-aware tactile representations. No independent load-sharing estimate, causal force attribution, or hardware baseline is established.

Artifact boundary: No code/data execution or independent workshop programme verification performed.

### TACROSS: TACROSS: An Efficient and Low-Cost Scalable Human Touch System Across Heterogeneous Tactile Sensors for Dexterous Robot Learning

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.11945)；全文：[审读版本](https://arxiv.org/html/2610.11945v1)。
- 首发：2026-10-08T13:34:31Z；审读版本：v1，2026-10-08T13:34:31Z。状态：preprint。
- 定位：III-B/Table I; III-C1-4/eqs6-9; III-D; IV-A; IV-B/Table II; IV-C/D/Tables IV-V/Fig7; V。

TACROSS aligns heterogeneous human/robot sensing through anatomy-based contact fields, validity masks, sensor adapters, and a causal temporal/inter-finger Transformer (III-C). Its intensity and instability channels are relative/proxy quantities, not calibrated force or measured slip. ACT deploys robot RGB, proprioception and tactile history; robot demonstrations provide action ground truth, while retargeted human targets are auxiliary pseudo-labels (III-D). Four single-hand real tasks test dispensing, liquid transfer, pipetting and fruit handling (IV-A). At fixed 30 robot/150 human demonstrations, Table IV reports 91.9% mean success versus 73.1% without human tactile input and 49.4% without semantic alignment. The 16/160 condition's listed tasks average 88.125%, agreeing with table 88.1%, not prose 88.3%. Only the separate fruit-budget experiment explicitly states 40 rollouts/configuration; seed and broader split details are not established. Reviewer inference: add canonicalization/masking and human-data alignment baselines, but do not infer unseen-sensor, cross-hand/topology generalization, independent physical-label validation, or necessity of online robot touch from human-input ablations.

Artifact boundary: Official project https://tacross-touch-project.github.io/ Resources states hardware, code and data planned, repository/download links to follow (checked Oct14). This conflicts with paper I statement that designs are available; do not mark artifacts released. Paper Table II reports 183.95 h total (159.09 h human + 24.86 h robot), separate from training subsets.

### TouchScale: TouchScale: 500 Hours of Human Vision and Touch for Visual-Tactile Learning

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.10288)；全文：[审读版本](https://arxiv.org/html/2610.10288v2)。
- 首发：2026-10-07T15:49:41Z；审读版本：v2，2026-10-08T17:13:36Z。状态：preprint。
- 定位：3.1-3.2; 4.1/Table 2/Fig4; 4.3/Table 4/Fig6; 5; Appendix6.1-6.3; Appendix9/Table5; Appendix10.2。

TouchScale reports 500h of synchronized human RGB-D/wrist video and bimanual normal-pressure data (3.1-3.2). Cross-sensor evaluation pools native grids into 12 fixed anatomical regions; pressure labels use sequence-maximum normalization (Appendix6). Size-matched approximately 16 h training gives EgoTactile contact IoU 0.181 versus 0.134, whereas the headline 0.383 uses full-scale training (4.1/Table 2/Fig4). Thus scale and dataset identity must be separated. Action-free future-touch mid-training followed by identical 50-demonstration/task robot post-training raises average success 22.5%→57.5%, with 20 trials/task on one xArm6/Revo2 platform (4.3/Table 4). Deployment uses current touch; future changes supervise training (Appendix10.2). Bimanual human collection does not establish bimanual robot control. Future-touch/action-error association is weak, and retrieval Top-10 differs from physical prediction accuracy (4.3; Appendix9). Reviewer inference: valuable data-scale and anatomical-evaluation baselines, but no independent wrench/load-transfer labels, matched-total-compute tactile causality, or held-out contact topology. The v2 date qualifies as revision discovery; no v1-v2 content change is claimed.

Artifact boundary: Official project links verified: https://github.com/phai-lab/touchscale and https://huggingface.co/datasets/2077AIDataFoundation/TouchScale . HF card Release status/Overview currently advertises 100 h, 15,324 episodes, full 500 h planned before November 2026; files require contact-information sharing. No gate accepted/files downloaded. Paper and HF key features report normal pressure; GitHub overview says normal+shear, and HF NPZ schema mentions tangential components. Treat tested evidence as normal-pressure and note unresolved artifact/schema difference. Repository QC and n0-vtla directories observed, not run.

### DEFT-VLA: DEFT-VLA: Stage-Localized Force Specialization for Contact-Rich Robotic Manipulation

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.14854)；全文：[审读版本](https://arxiv.org/html/2610.14854v1)。
- 首发：2026-10-10T12:14:28Z；审读版本：v1，2026-10-10T12:14:28Z。状态：preprint。
- 定位：III-A/B eqs1-5 and Automatic expert routing; III-C; IV-A; IV-B/Table I; IV-C/Table II; IV-D/Table III; V。

DEFT-VLA separates a frozen task-adapted base expert from a force-specialized contact expert, conditioning the latter on projected wrist-wrench history (III-A/B). Force-threshold labels include temporal look-ahead during training; learned pipette routing uses causal observations. Whiteboard wiping instead uses manually triggered expert switching (IV-A; V). The contact-localized blur/state-masking curriculum should be compared against simple force tokens and global curricula, with expert capacity and routing controlled. Using identical demonstrations and 20 trials/task, overall success is 70% tip attachment, 50% bimanual aspiration and 90% wiping (Table I). Contact-stage rates condition on reaching contact; aspiration 104 μL MAE covers successful trials only. Held-out grasp heights yield 5/10 successes on each pipette task, representing configuration change rather than topology OOD (IV-C). State-mask ablation improves tip-attachment success 15%→70% (IV-D), but no training-seed uncertainty is reported. Reviewer inference: this is real cooperative tool-actuation evidence and a stage-aware baseline, not validated cross-interface load inference, automatic routing on every task, or calibrated force safety.

Artifact boundary: Official arXiv full text audited. No code link located in the paper or its abstract page during this pass; no claim of independent reproducibility. No research code executed.

### FOMO-Dex: Force-Modulated Dexterity: Unified Compliance for Contact-Rich Manipulation

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.17161)；全文：[审读版本](https://arxiv.org/html/2610.17161v1)。
- 首发：2026-10-12T17:37:23Z；审读版本：v1，2026-10-12T17:37:23Z。状态：preprint。
- 定位：3.2; 3.3.1-3.3.4 eqs2-11/Table 1; 3.4; 4.1/Table 2/eq 12; 4.2; 4.3/Table 3; 4.4/Table 4; 5。

FOMO-Dex applies task-configured directional admittance to wrist/fingertip force feedback, preserving nominal motion in excluded directions (3.2-3.3). Single-hand experiments cover card pickup, cutting, nut rotation and screwdriving. The isotropic-compliance control shares sensing, rates and applicable admittance parameters, making direction selection a useful baseline (4.1). Results show force/progress tradeoffs: nut rotation is lower than stiff control, while screwdriving improves; minimum force exceedance is not universal best task performance (Table 2; 4.2). Force thresholds are operational limits, not validated safety guarantees. Four participants undergo randomized controller/task order before/after practice (4.3). With 50 demonstrations/setting, corrected-action imitation attains 67% card lift success over 18 trials, versus 0% for raw commands with online compliance; corrected-action policies use stiff deployment control (4.4). Rotation outcomes use 10 trials and measure turns, not completion. Reviewer inference: separate directional compliance, demonstration quality and action-target representation. Contact directions/targets remain configured, with no held-out topology or independent load-inference audit. Table 2’s50-trial wording does not resolve per-condition card denominators.

Artifact boundary: Official project https://yingyuan0414.github.io/fomo-dex/ inspected; Code is marked Coming Soon. Videos listed but not treated as independent trials. No code/data execution.

### PACE: PACE: Temporal-Role Tactile Conditioning for Chunk-Based Insertion Policies

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.16308)；全文：[审读版本](https://arxiv.org/html/2610.16308v1)。
- 首发：2026-10-12T07:35:21Z；审读版本：v1，2026-10-12T07:35:21Z。状态：preprint; author-reported CoRL 2026 acceptance。
- 定位：3.1-3.5 Eqs.1-7; 4.1-4.8 Tables1-4; A.3/A.6; C.2/C.6/C.7; D.2/D.4/D.6/D.8; E-H。

PACE separates a tactile stream into smoothed state conditioning, event-driven action residuals, and future-contact prediction during training. On five real insertion tasks, it reports 136/150 successes versus 69/150 for tactile concatenation, with common demonstrations and control frequency. Its strongest contribution is a controlled temporal-organization baseline, not spatial contact structure. Appendix A.6 reruns the complete ACT policy each control step, so the event pathway should not be described as a separately asynchronous reflex. Models are selected separately for task and geometry-clearance configurations; alternative force/current inputs do not establish zero-shot sensor transfer. Future-contact prediction is absent at inference. Wilson rollout intervals, force-stop-as-failure accounting, and demonstration-quality controls improve interpretability; independent training-seed variation, held-out topology, and calibrated contact safety remain untested.

Artifact boundary: Official HTML full text audited; code/data not executed; no precision-schema promotion.

### Minimal-Tactile-Flow: A Minimal Optical-Flow Representation for Vision-Based Tactile Rotation Classification in Robotic Manipulation Across Gravity Domains

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.12073)；全文：[审读版本](https://arxiv.org/html/2610.12073v1)。
- 首发：2026-10-08T14:50:08Z；审读版本：v1，2026-10-08T14:50:08Z。状态：preprint。
- 定位：III-A-E; IV-A/B Tables I-II; V-A-E Tables III-VII; VI-A-D; VII。

A fixed-grid optical-flow representation supplies a useful compact, spatially organized baseline. Trial-disjoint simulation evaluation isolates gravity-domain shift: Earth-trained XGBoost falls from 94.4% on Earth to 75.9% in orbit. Training across all four gravities reaches 96.3%, but that is coverage of seen domains, not novel-gravity generalization. Forty features retain 95.7%. Labels describe load-induced rotation direction in a fixed grasp; events without clear rotation or dominated by linear slip are removed. Thus this is conditional contact-event classification, not slip safety or closed-loop manipulation. The reported 0.14 ms classifier latency omits optical-flow and aggregation costs. Rigid-gel simulation, one object geometry, orientation sensitivity and no real-sensor validation bound transfer claims.

Artifact boundary: Official HTML full text audited; code/data not executed; no precision-schema promotion.

### FEM-Tactile-GNN: FEM-Validated Real-Time Modelling of Soft Tactile Deformation

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.16667)；全文：[审读版本](https://arxiv.org/html/2610.16667v1)。
- 首发：2026-10-12T12:15:46Z；审读版本：v1，2026-10-12T12:15:46Z。状态：preprint。
- 定位：III-A-E Fig.2 Tables I-II; IV-A-C Tables III-V Figs.3-4; V-A-D; VI。

This sensor-local graph surrogate links finite-element supervision to real tactile marker observations. Seven fixed marker nodes and eleven undirected edges support contact localization and deformation prediction. The FEM uses 82 real configurations for validation, while the paper separately reports 400 real GNN-validation samples; the abstract’s small-data headline should not hide that distinction. Real contact-localization MAE is 0.80/0.41 mm along the two planar axes. No matched non-graph or edge-shuffle comparison isolates graph value. The MuJoCo component explicitly disables skin–indenter collision and provides visualization rather than physically coupled simulation or control. The study contributes a local mechanics-grounding example, with quasi-static single-contact, fixed sensor geometry, and no bimanual, topology-transfer or force-control evidence.

Artifact boundary: Official HTML full text audited; code/data not executed; no precision-schema promotion.

### MorphoPlanner: Whole-Body Contact-Rich Compliant Motion Planning Based on Morphology Representation

- 权威元数据：[原始记录](https://www.preprints.org/manuscript/202610.1082)；全文：[审读版本](https://www.preprints.org/frontend/manuscript/8fd8f6481d8e3f6282ff66945bb913d5/download_pub)。
- 首发：2026-10-12（官方发布页未给UTC时分）；审读版本：v1，2026-10-12；提交日期2026-10-10不等于发布日期。状态：preprint; not peer reviewed。
- 定位：PDF printed pp.4-11 Sections2.1-2.3/Fig3/Table1; pp.11-13 Section3.1; pp.15-19 Sections3.3-3.4/Figs7-9; pp.20-27 Sections3.5-3.6/Figs12-13; pp.27-28 Discussion/Data availability; physical PDF page = printed page+1。

MorphoPlanner anchors force/proximity observations and body motion to consistently indexed material points, combines a fixed body-connectivity graph with attention, and learns next-step morphology from a tactile interaction planner. This directly broadens the archive beyond fingertip representations. Its 749K samples are simulator-generated, with a 98/1/1 split whose unit is unspecified and one listed seed. Deployment uses current sensing and a separate MorphoGuard controller. The 95.5–100% headline concerns simulated reaching among movable obstacles, 200 trials per density condition, not real bimanual manipulation success. The paper states 216 total hardware trials but provides qualitative hardware comparisons rather than a located numerical readout. Baselines differ in tactile feedback and representation; graph/attention value is not isolated. Changing obstacle counts supplies complexity extrapolation, without a predefined held-out contact-edge split or independent inter-arm load-transfer evidence.

Artifact boundary: Official version1 PDF downloaded from citation_pdf_url metadata, validated %PDF header, pdfinfo and pdftotext; Fig9 visually checked. Data available on request, no runnable artifact verified.

### CTP: Contact Trajectory Prompting: In-Context Transfer of Contact-Rich Behaviors from a Single Demonstration

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.18848v1)；全文：[审读版本](https://arxiv.org/html/2610.18848v1)。
- 首发：2026-10-13T17:58:08Z；审读版本：v1，2026-10-13T17:58:08Z。状态：preprint。
- 定位：III-A-C; IV-A-E; Tables I-II; Figures 3-7。

CTP encodes a target-object demonstration’s motion, fingertip wrenches and tactile deformation into ordered contact tokens, which current sensor observations query during single-arm execution. Its object-disjoint, one-shot tests report 78.7% success versus 65.7% for a force-augmented prompting baseline. More diagnostic ablations separate reference contact as behavior specification from online contact as feedback: position-only references lose graded wiping-intensity ordering, while removing current contact sharply harms height-perturbed execution. The method strengthens the case for temporally structured contact references without establishing bimanual role structure or topology transfer. Deployment requires a target-object demonstration; dense tactile inputs are deformation proxies. Baselines share task data and evaluation but not all architectural or adaptation budgets, and training-seed uncertainty is unreported.

CTP timing clarification (IV-A2): 32 actions are generated and the first 16 executed before replanning; 30 Hz observation/action streams do not imply a separately continuous tactile reflex.

### ForceWAM: ForceWAM: Decoupling Future and Response Learning from Demo and Play Data for Contact-Rich Manipulation

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.18852v1)；全文：[审读版本](https://arxiv.org/html/2610.18852v1)。
- 首发：2026-10-13T17:58:44Z；审读版本：v1，2026-10-13T17:58:44Z。状态：preprint。
- 定位：3.1-3.4; 4.1-4.5; Tables 1-3; Appendices A-F。

ForceWAM separates a task-trained visual–wrench future generator from an inverse-dynamics executor trained on demonstrations and exploratory play. Recorded futures supervise the executor offline; generated futures and causal measured wrench feedback drive real single-arm deployment. Holding task demonstrations, ForceWM and optimizer updates fixed, adding play raises success by 15–45 percentage points across sliding, flipping and ring placement, although total experience increases. A shared-data ablation supports joint visual and wrench futures over either alone. These results favor temporally explicit contact-outcome conditioning and broader execution learning. They do not establish tactile spatial structure, bimanual transfer or topology OOD; wrench prediction evidence is qualitative and training-seed/success uncertainty is unreported. The project lists code as forthcoming.

### ILA: Interaction Latents as Actions for Contact-Rich Manipulation

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.18855v1)；全文：[审读版本](https://arxiv.org/html/2610.18855v1)。
- 首发：2026-10-13T17:59:16Z；审读版本：v1，2026-10-13T17:59:16Z。状态：preprint。
- 定位：3.1-3.3; 4.1-4.5; Tables 1-3/6; Appendices A.1-A.5/B.1-B.7/C/D。

ILA makes joint motion–tactile latents the action target on a real dual-arm platform, including plate holding and wiping. Its encoder learns from complete recorded chunks; deployment predicts latents from chunk-start observations and executes 128 actions before replanning. Representation ablations retain policy touch while removing tactile latent supervision, supporting contact-aware targets beyond tactile inputs. Held-out-trajectory probes and separate causal-input future-prediction tests add evidence beyond success, but probe intervals exclude training-seed variation. Headline comparisons also add visual dynamics tokens; force quantities are sensor-native deformation proxies. Offline rewards use realized tactile outcomes and expert references without becoming online observations or calibrated success probabilities. Mixed cut-versus-rollout success units, manual force-profile alignment and absent topology holdout limit generalization claims.

### DeTac: DeTac: Dual-branch Decoupling of Texture and Force Signals in Vision-Based Tactile Sensors

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.16463v1)；全文：[审读版本](https://arxiv.org/html/2610.16463v1)。
- 首发：2026-10-12T09:20:44Z；审读版本：v1，2026-10-12T09:20:44Z。状态：author-reported CoRL 2026 acceptance。
- 定位：3.1-3.3; 4.1-4.4 Tables 1-4; 5 Limitations; Appendix A.3 and C Table A1。

Include as local optical-tactile disentanglement, not evidence of closed-loop bimanual control. DeTac predicts shading and marker images jointly from one mixed tactile image, with marker-neighborhood and cross-branch consistency supervision. Its real aligned pairs improve the grounding of the image-separation problem. Evaluation separates held-out objects and poses, adds same-paired-data deterministic baselines, and reports downstream force and geometry errors. However, the large improvement over TacDiff mixes architectural and supervision differences: TacDiff is trained on synthetic overlays, whereas DeTac uses real pairs. Unseen-object PSNR is only 0.04 dB higher than the paired-data U-Net. Cross-sensor results are qualitative, inference uses hundreds of sequential diffusion steps, and controlled shear is absent. This supports signal-specific local representations and careful supervision accounting, not general transferable contact topology.

Artifact boundary: Version-specific official full text audited; no replication or code execution. No study-specific public code/data link located in audited full text.

### TacSpin: TacSpin: Tactile Tracking of In-Gripper Object Rotation on SO(3) via Axis-Magnitude Estimation

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.17574v1)；全文：[审读版本](https://arxiv.org/html/2610.17574v1)。
- 首发：2026-10-13T01:54:29Z；审读版本：v1，2026-10-13T01:54:29Z。状态：preprint。
- 定位：III-A-C Eqs. 1-11; IV-A-D Tables I-II; V。

Include as a tactile-observable geometric estimator and a useful negative-control example. TacSpin retains local contact depth/shear fields, estimates rotation axis and magnitude separately, refines using boundary circulation, and fuses two opposing fingertip responses. AprilTag poses supervise calibration and evaluation only. Matched calibration splits and a full-matrix TacSE3 control make the fixed-axis gain more interpretable. But benefits do not generalize uniformly: on mixed-axis sphere sequences, full TacSpin ties the stronger baseline's mean trajectory error and has worse endpoint error than both baselines; removing circulation also improves both sphere metrics. Real-object transfer is qualitative, no closed-loop manipulation is evaluated, and the fusion ablation removes mirror alignment along with attenuation. The result supports geometric structure under a restricted contact arrangement, not topology- or embodiment-general robustness.

Artifact boundary: Version-specific official full text audited; no replication or code execution. No study-specific public code/data link located in audited full text.

### ForeTac: ForeTac: Predictive Contact Guidance for Generative Robot Policies

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.18118v1)；全文：[审读版本](https://arxiv.org/pdf/2610.18118v1)。
- 首发：2026-10-13T10:28:49Z；审读版本：v1，2026-10-13T10:28:49Z。状态：preprint。
- 定位：PDF pp.2-4 III-A-D; pp.4-7 IV-A-F Tables I-VI; p.7 V; p.8 Fig.4。

Include as a deployable causal tactile representation feeding action-conditioned prediction and inference-time control guidance. ForeTac preserves a spatial marker-field latent rather than reducing touch to one force scalar; predicted future latents, not measured future touch, guide candidate actions. Four-task closed-loop gains coexist with reconstruction, action-masking, horizon, ranking, and runtime analyses. Matched frozen DP and flow-matching checkpoints help isolate the added guidance system, but not equal total training data or compute: auxiliary tactile training and per-task good/failure scorers are substantial. With one training/split seed and 20 trials per task, task-success uncertainty is not characterized. Transfer across two policy architectures is neither embodiment nor topology OOD, and no held-out object or sensor generalization is established. This is evidence for structured predictive contact quality, with task-specific supervision and latency boundaries.

Artifact boundary: Version-specific official full text audited; no replication or code execution. ForeTac official PDF downloaded and Tables I-VI visually checked; project Code button marked coming soon.

### Edge-Native-DualExpert: Edge-Native Temporal--Graph Dual-Expert Inference for Dexterous Grasp Classification

- 权威元数据：[原始记录](https://arxiv.org/abs/2610.14926v1)；全文：[审读版本](https://arxiv.org/html/2610.14926v1)。
- 首发：2026-10-10T13:58:38Z；审读版本：v1，2026-10-10T13:58:38Z。状态：preprint。
- 定位：III-A-C; IV-A-C; V-A-B; VI-A-E Tables I-III; VII。

Include as an adjacent deployment-observable graph/kinesthetic baseline, explicitly separated from direct tactile sensing. A four-frame angle/load-proxy history feeds temporal and fixed finger-graph experts. The graph branch contributes only to instance classification; all learned Stop outputs come unchanged from the temporal branch. Trajectory-first splitting and local embedded execution are useful methodological evidence, but five labels each contain one physical instance, so the test measures within-instance recognition. Stop targets imitate a threshold-and-limit teacher, not grasp-stability ground truth; physical lift-and-hold results are evaluated separately. The fused model also has about twice each expert's parameter count. The study supports task-specific structural allocation and embedded inference, not a causal benefit of graph structure for grasp control, object-category generalization, calibrated force sensing, or held-out contact topology.

Artifact boundary: Version-specific official full text audited; no replication or code execution. No study-specific public code/data link located in audited full text.

## 4. 观察、排除和边界条目

- [StereoEngine: Scaling Stereo Bimanual Robot Data without Stereo Cameras](https://arxiv.org/abs/2610.12734): adjacent watch, not recommended for this tactile synthesis expansion. Stereo synthesis/data augmentation; deployment stereo+proprioception. Five physical tasks include independent two-object lifting and single-arm fridge-door closing. No tactile/contact-state representation or shared-load inference. Full-text methods/evaluation/limitations checked, not a precision audit.

- [Competitive Task Allocation with Temporal Proposal Windows and Improved Artificial Potential Fields for Dual-Arm Industrial Manipulation](https://arxiv.org/abs/2610.15763): exclude from focused study-level synthesis. Vision-based competitive allocation and independent pick/place of nuts/bolts. Force fields are artificial motion-planning quantities, not sensed loads; no shared contact/load-transfer representation.

- [Scalable Multi-Human Cooperative Manipulation via Commander-Executor Coordination](https://arxiv.org/abs/2610.14911): metadata-only adjacent watch. Primary abstract describes role-specific object trajectory planning and physics-based humanoid execution. Official HTML returned internal error; no results promoted into synthesis.

- [PatternDex: Learning Interaction Patterns to Guide Reinforcement Learning of Bimanual Dexterous Manipulation of Articulated Objects](https://arxiv.org/abs/2610.04765): outside new first-release window; older backlog lead only. Official history has only Oct3v1. Not counted as Oct8-14 first release or revision; metadata only in this pass.

- [Arm-wise Compositional Generalization in Dual-Arm Vision-Language-Action Models](https://arxiv.org/abs/2610.06184): outside window; older backlog lead only. Official history only Oct5v1. Skill composition should not be presumed contact-topology OOD without full-text audit.

- [Reactive Task-Oriented Robot-Human Handovers via Generative Hypothesis Selection](https://arxiv.org/abs/2610.08003): outside window; older backlog lead only. Official history only Oct6v1; no new version located.

- [Robot-WATCHDOG : failure detection through object-centric graph representation](https://arxiv.org/abs/2610.13403): watch_adjacent_visual_monitoring. Selective full-text methods/results read. RGB-derived labeled 2D centroids and pairwise geometry do not measure contact, touch or force. Orientation and fine contact state are absent. The nonparametric TPC scorer outperforms the graph Transformer; conformal calibration uses an uncorrected empirical quantile and approximate coverage. Keep as adjacent visual monitoring. CoRL acceptance is an author claim.

- [Tactile Sensing-based Secure and Gentle Grasping of Unknown Objects](https://arxiv.org/abs/2610.12790): watch_full_audit_pending. Official date and abstract verified; full text fetched but not audited to inclusion depth. The GP-MPC probabilistic safety claim needs review of assumptions, calibration, stop/failure denominators and matched controls.

- [Multi-modal world model for physical robot interactions: Simultaneous visual and tactile predictions for enhanced accuracy (SPOTS)](https://www.sciencedirect.com/science/article/pii/S0921889026001855): watch_date_fulltext_unverified. Publisher discovery shows October2026 volume204, not verified in-window first-online date. Publisher fetch403; no full-text audit. Do not convert issue month/search-recency into new release.

- [Temporal Visuo-Tactile Learning for Dexterous Grasp Stability](https://arxiv.org/abs/2610.10283): watch_boundary_first_release. Official metadata verified. First release was October 7, outside the strict after-October-7 window. Full-text inclusion audit not completed in this pass.

- [Factorized Tactile Representation and Control for Sim-to-Real Manipulation](https://arxiv.org/abs/2610.10510): watch_boundary_first_release. Official metadata verified. First release was October 7, outside the strict after-October-7 window. Full-text inclusion audit not completed in this pass.

- [OpenViTac: Learning and Benchmarking Visuo-Tactile Policies in a Unified Sim-and-Real Framework](https://arxiv.org/abs/2610.10384): watch_boundary_first_release. Official metadata verified. First release was October 7, outside the strict after-October-7 window. Full-text inclusion audit not completed in this pass.

- [Contact-Aware Imitation Learning Through Contact Factorization](https://arxiv.org/abs/2610.09533): watch_boundary_first_release. Official metadata verified. First release was October 7, outside the strict after-October-7 window. Full-text inclusion audit not completed in this pass.

- [Tactile Reconstruction of Contact Task Frames and Forces for Hybrid Force/Motion Control](https://arxiv.org/abs/2610.10020): watch_boundary_first_release. Official metadata verified. First release was October 7, outside the strict after-October-7 window. Full-text inclusion audit not completed in this pass.

- [TacHair: Tactile Contact-Distribution Guided Online Correction for Robotic Hair Stroking and Perception](https://arxiv.org/abs/2610.10637): watch_boundary_first_release. Official metadata verified. First release was October 7, outside the strict after-October-7 window. Full-text inclusion audit not completed in this pass.

- [Visuo-Tactile Sensor in Robotics: Design, Perception, and Manipulation With Emphasis on the TactEdge Sensor](https://link.springer.com/book/9789819209132): exclude_unverified_window_event. Publisher lists an August 3 eBook date and October 28 hardcover date, not an in-window research release.

- [Appendage-Inspired Soft Overturning Robot With Tactile-Driven Navigation in Confined Channels](https://ieeexplore.ieee.org/abstract/document/11673082): exclude_scope_and_date. Navigation rather than contact-rich manipulation; official publication date is September 1 despite the October issue.

- [A Sense of Touch: Three-Axis Sensing for Robotic Prosthetic Fingertips](https://xplorestaging.ieee.org/document/11668634/): exclude_window_event. Official publication date is August 27 despite the October issue; outside the window.

## 5. 旧版复核和检索限制

- [已纳入14篇及VT-MUSE的版本历史检查](2026-10-14_prior-version-checks.json)未发现10月7日后的新版本；只代表列出的记录，不是全库发表状态复核。
- CoToGrasp的10月8日v3经全文对照，正文/附录未发现实质改变；参考文献及编号变化不新增study，不改写拓扑泛化结论。VT-MUSE v3仍为10月6日，保留前轮未完成该版本全文升级的边界。
- 主要检索：官方[October cs.RO列表](https://arxiv.org/list/cs.RO/2026-10?show=2000&skip=0)，结合 tactile/visuotactile/representation/graph/contact/physics/bimanual/handover/tool/benchmark/dataset 关键词，针对2026年10月8日至14日组合查询、精确题名/作者复核与官方项目/数据页检查。完整本轮查询及补充发现记录见下方附录。
- arXiv或其他原始发布记录的版本时间用于窗口归类；不以ID、爬取时间、PDF内日期或新闻日期代替首发/修订日期。
- 这不是PRISMA完整系统综述；关键词会漏检，无全库检索分母，无独立实验复现，无自动扩张精标。

## 6. 归档和验证

定位全文审读写入 referenced/fulltext_audits.tsv，生成器覆盖粗粒度规则编码；证据矩阵可再生。未上传任何第三方论文PDF，也未改变许可或仓库权限。历史86份PDF缓存不是本轮重下/重验结果。新综述PDF来自本次正文编译，中文导览旧PDF仍是历史导出。

本轮校验、完整回归、PDF编译和页面检查结果由同分支的验证记录与草稿PR汇总；不能把旧CI结果当成本次commit通过。

## 附录：具体查询、版本和PDF核验

- Read review_protocol and 2026-10-07 weekly update. Downloaded official October cs.RO listing: https://arxiv.org/list/cs.RO/2026-10?show=2000&skip=0. Title keyword scan used tactile, touch, contact, physics, graph, object-centric, force and wrench, followed by official individual version histories. The list reports 1110 entries; this is not a screening count. Keyword scanning and cross-lists are not exhaustive.
- Broad web queries: site:arxiv.org tactile October 2026; site:arxiv.org/abs/2610 tactile representation; contact graph physics robot; visuotactile; plus tactile, visuotactile, contact graph and October 2026 outside arXiv. Publisher issue dates were not accepted as release dates.
- Official arXiv full texts fetched through urllib into local plain text. No study code execution or reproduction. CoToGrasp v2/v3 scientific-body comparison ignored citation renumbering. Preprints.org MorphoPlanner PDF metadata link was verified; PDF header, hash, text extraction and Figure 9 rendering were checked.
- Additional histories RATE 2610.03538, SimpleTouch 2610.02784 and VISTA 2610.03333 were checked through official web pages: only October 2 v1, no in-window revision. Fourteen other histories are listed separately.

双臂/交接查询系列：


- site:arxiv.org bimanual dexterous "October" "2026"
- site:arxiv.org handover tactile "Oct" "2026"
- site:arxiv.org cooperative tool manipulation "2610"
- site:arxiv.org dataset dexterous bimanual "2610"
- "bimanual" "Oct 2026" "arxiv"
- "handover" "October 2026" robot tactile paper
- "cooperative" "tool" robot "October 2026"
- "bimanual" "Oct" "2026" site:arxiv.org/abs/2610 -PatternDex -Compositional
- "handover" "Oct 8" "2026" robot
- "handover" "Oct 9" "2026" robot
- "tool" "bimanual" "Oct 12" "2026"
- site:arxiv.org "bimanual" "tactile" "Oct" "2026" -2610.04765 -2609.23352 -2609.15726 -2609.05282
- site:arxiv.org "handover" "2026" "Oct 12"
- site:arxiv.org "handover" "2026" "Oct 13"
- site:arxiv.org "tool" "tactile" "Oct 8" "2026"


CoToGrasp v2/v3对照：正文与附录在忽略引文编号后相同，未新增study；ECCV/DOI元数据不在本轮独立复核出版社记录范围。

本轮16条新增：14份官方HTML全文和2份官方PDF，均为归档级审读；不等于30篇完整precision schema。
