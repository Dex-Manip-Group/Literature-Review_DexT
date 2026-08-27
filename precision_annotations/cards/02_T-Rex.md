# T-Rex: Tactile-Reactive Dexterous Manipulation

- 编号：02 | 精标等级：A | 批次：1 | 状态：complete | 置信度：high
- 出版状态：preprint | 年份：2026
- 来源：https://arxiv.org/abs/2606.17055
- 本地全文：`referenced/00_core_bicg/2026_T-Rex.pdf`

## 任务、拓扑与协调

- 任务：real bimanual tactile-reactive manipulation
- 拓扑：mostly two-hand shared object and dual-hand contact-rich skills；载荷路径：task-dependent; present in several tasks；拓扑变化：implicit in tactile sequence; no explicit graph
- 角色：task-dependent, not explicitly factorized；协调必要性证据：partial: tactile/no-tactile and architecture ablations; no single-hand removal

## 传感与部署可实现性

- 触觉：per-finger 6D force history and current deformation maps（Sharpa Wave integrated force/deformation sensing；ten fingertips）
- 训练输入：RGB, language, tactile force history, deformation, demonstrations
- 部署输入：RGB, language, current/history tactile; cached visual context
- 特权信息：训练=no simulator privilege in main real-data policy；推理=no；未来参考=no; predicts future action chunk；仿真接触=no
- 部署判断：deployable_with_calibration

## 表征与实验

- 表征：spatiotemporal local tactile encoder + asynchronous multimodal policy；单元：one force token per finger plus deformation tokens
- 结构先验：finger identity and slow/fast expert decomposition；来源：fixed sensor morphology；动态性：no explicit relational edges
- 目标：预训练=VQ-VAE force reconstruction; deformation autoencoder; human video pretraining and tactile mid-training；下游=conditional flow matching for action chunks plus future visual latent loss；物理目标=none for edge/load share/interface wrench
- 规模与拆分：100 h real robot tactile data; paper states ~100 demos per post-training task; 12 evaluation tasks；task/motor primitive; randomized object pose over 16 trials
- 基线/统计：ViTacFormer, RDP, Tactile-VLA, pi0.5, EgoScale, pi0.5+tactile；matched budget=partial: same robot/action/evaluation; pretraining scale differs substantially; dedicated 100 h mid-training budget comparison provided；seeds=16 trials/task; no independent training seeds or confidence intervals reported
- 泛化：对象=position/rotation randomization; limited zero-shot primitives；传感器=no；形态=no；拓扑=no explicit test

## 三级证据链

1. 作者主张：asynchronous temporal tactile refinement plus staged pre/mid/post-training yields strongly tactile-reactive bimanual control
2. 可观察证据：65% average task score versus 35% strongest listed baseline; -23 points without touch; -5 without asynchronous path; matched 100 h mid-training comparison
3. 精标判断：支持程度=partial-to-strong。Best first offline data source and strong policy baseline, but it competes on scale and reactivity rather than interpretable inter-hand load-flow representation.

证据位置：pp.4--5 Sec. 4 (inputs/architecture); p.6 Sec. 4.3 and 5.1 (data/platform); pp.7--8 Tables 1--3 (results/ablations); p.9 Sec. 7 (limitations); pp.18--20 App. B--D

## 对 BiCG-Rep 的决策

- 影响：raises the policy baseline and makes naive tactile fusion noncompetitive
- 决策：audit 20--100 episodes, normalize schema, run frozen/offline BiCG probes before hardware
- 理由：Its synchronized ten-fingertip force/deformation streams and bimanual episodes can test whether an explicit inferred graph adds information beyond a strong temporal tactile encoder.
- 主要局限：huge and unequal pretraining resources; 16 trials/task without training-seed uncertainty; no explicit coordination/load-path labels
- 未决问题：exact publicly downloadable hours/episodes; licenses; train/validation object split; independent repeated training runs
