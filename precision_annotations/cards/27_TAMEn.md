# TAMEn: Tactile-Aware Manipulation Engine for Closed-Loop Data Collection in Contact-Rich Tasks

- 编号：27 | 精标等级：A | 批次：5 | 状态：complete | 置信度：high
- 出版状态：preprint | 年份：2026
- 来源：https://arxiv.org/abs/2604.07335
- 本地全文：`referenced/00_core_bicg/2026_TAMEn.pdf`

## 任务、拓扑与协调

- 任务：closed-loop bimanual visuotactile data collection and policy learning
- 拓扑：dual grippers--two objects/tool--workpiece; includes sponge--dish sustained contact；载荷路径：yes, especially dish washing/clip/cable tasks；拓扑变化：multi-stage contacts and recovery states, implicit in policy
- 角色：task-specific dual roles; dish and sponge/tool roles；协调必要性证据：vision-only vs touch vs pretrained vs recovery comparisons; no single-hand feasibility test

## 传感与部署可实现性

- 触觉：four fingertip visuotactile video streams（modular GelSight/FreeTacMan-compatible sensors；two tactile observations/four fingertips across both grippers）
- 训练输入：3M+ visuotactile pairs/10k single-arm trajectories for pretraining; task bimanual demos; recovery corrections
- 部署输入：two RGB + two tactile observations; 16-D dual-arm/gripper action
- 特权信息：训练=human corrections and structured tracking; no simulator privilege；推理=no；未来参考=imitation demos only；仿真接触=no
- 部署判断：deployable_with_tracking/sensors

## 表征与实验

- 表征：contrastive local tactile encoder + ACT policy + DAgger recovery；单元：per-view visual/tactile embeddings
- 结构先验：data pyramid, not explicit contact graph；来源：single-arm pretraining, task demos and failure-state interventions；动态性：implicit temporal stages
- 目标：预训练=multi-positive tactile contrastive learning；下游=supervised action loss and recovery updates；物理目标=contact maintenance only through task success; no wrench/load labels
- 规模与拆分：FreeTacMan >3M pairs, >10k trajectories/50 tasks; four bimanual tasks; 20 evaluation trials/task；task/object appearance and disturbance conditions
- 基线/统计：vision-only ACT, touch without pretrain, +pretrain, +DAgger/recovery variants；matched budget=good staged ablations; pretraining data is a major unequal resource by design；seeds=20 trials/task; no independent training seeds
- 泛化：对象=yes appearance/object variations；传感器=framework modular; strict learned cross-sensor generalization not tested；形态=interface adaptation tested across collection grippers, not policy OOD；拓扑=no held-out topology transfer

## 三级证据链

1. 作者主张：a visuotactile data flywheel combining scalable pretraining, bimanual demonstrations and targeted recovery improves contact-rich policy robustness
2. 可观察证据：touch raises mean 34→55%, pretraining 55→65%, recovery 65→75% over four tasks; unseen-object and visual-disturbance tests; 20 trials/task
3. 精标判断：支持程度=strong for tested tasks。The exact brush/sponge--dish idea is validated as publishable and less saturated, but TAMEn is now a direct system competitor; BiCG must focus on interpretable transfer/physics, not simply doing dish washing with touch.

证据位置：pp.4--8 Sec. III; pp.9--14 Sec. IV, Tables I--VI; pp.14--15 limitations

## 对 BiCG-Rep 的决策

- 影响：direct tool-workpiece task competitor and phase-2 target
- 决策：add rigid stylus/wiping puck--plate first; later sponge/brush--dish with matched graph/fusion baselines
- 理由：Start with rigid, measurable contacts before deformable sponge dynamics; enter tool phase only after handover representation gate passes.
- 主要局限：gripper rather than dexterous hands, no explicit load/path representation, large borrowed pretraining corpus, no topology/role transfer or seed uncertainty
- 未决问题：public downloads; sensor rates/synchronization; exact training seeds; independent force instrumentation
