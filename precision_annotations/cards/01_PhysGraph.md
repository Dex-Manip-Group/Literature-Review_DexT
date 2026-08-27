# PhysGraph: Physically-Grounded Graph-Transformer Policies for Bimanual Dexterous Hand-Tool-Object Manipulation

- 编号：01 | 精标等级：A | 批次：1 | 状态：complete | 置信度：high
- 出版状态：preprint/under review | 年份：2026
- 来源：https://arxiv.org/abs/2603.01436
- 本地全文：`referenced/00_core_bicg/2026_PhysGraph.pdf`

## 任务、拓扑与协调

- 任务：bimanual tool--workpiece reference-tracking RL
- 拓扑：hand--tool--workpiece--hand；载荷路径：yes；拓扑变化：claimed dynamic; public stock-main path requires code-level verification
- 角色：dominant tool hand / non-dominant object-stabilizing hand；协调必要性证据：partial: bimanual tasks, no unimanual removal test

## 传感与部署可实现性

- 触觉：simulator per-fingertip resultant forces plus full state（simulator contact-force signal；five fingertips per hand）
- 训练输入：proprioception, link/tool/object state, fingertip forces, BPS, future reference
- 部署输入：same privileged simulator state and reference trajectory
- 特权信息：训练=yes；推理=yes；未来参考=yes at inference；仿真接触=yes
- 部署判断：privileged

## 表征与实验

- 表征：graph-transformer policy；单元：rigid-body/link/tool/object tokens
- 结构先验：kinematic, edge/contact, geometric and anatomical attention biases；来源：simulator state/contact logic and hand kinematics；动态性：claimed yes; stock code audit indicates dynamic/contact inputs not passed to bias generator
- 目标：预训练=none；下游=PPO reference tracking；物理目标=task success and trajectory/pose errors; no self-supervised load target
- 规模与拆分：6 OakInk2 tasks; 4096 parallel Isaac Gym environments per task；task instances; three qualitative zero-shot instance transfers
- 基线/统计：ManipTrans; no-bias PhysGraph；matched budget=partial: same environment/reward/dynamics, but model sizes differ (PhysGraph 51% parameters)；seeds=NR; best checkpoint within 8k epochs
- 泛化：对象=limited qualitative frozen-policy transfer；传感器=no；形态=compatibility tested by retraining, not zero-shot；拓扑=no

## 三级证据链

1. 作者主张：physical graph biases and per-link tokens improve bimanual tool-use policy performance and transfer
2. 可观察证据：higher reported SR than ManipTrans on six simulation tasks; no-bias and bias ablations; qualitative instance transfer; multi-embodiment retraining
3. 精标判断：支持程度=partial。The paper supports morphology-aware tokenization as a strong baseline, but does not establish observation-grounded dynamic contact inference or tactile representation learning.

证据位置：p.3 Sec. III-A (state/reference); pp.4--5 Sec. IV (graph/biases); pp.6--8 Sec. V, Tables I--II (experiments); p.8 Sec. V-D (limitation); public code snapshot audit

## 对 BiCG-Rep 的决策

- 影响：direct architectural competitor but leaves BiCG-Rep gap intact
- 决策：reproduce stock-main and corrected-bias variants; never use as deployable tactile baseline
- 理由：Necessary to separate graph tokenization gains from claimed contact/geometric biases and from privileged observation advantages.
- 主要局限：requires future reference and privileged simulator state at inference; one principal baseline; seed/statistical reporting absent
- 未决问题：exact experimental commit; number of independent training seeds; whether released checkpoints reproduce paper tables
