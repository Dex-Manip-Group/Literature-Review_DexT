# Bi-Touch: Bimanual Tactile Manipulation with Sim-to-Real Deep Reinforcement Learning

- 编号：10 | 精标等级：A | 批次：2 | 状态：complete | 置信度：high
- 出版状态：IEEE RA-L 2023 | 年份：2023
- 来源：https://arxiv.org/abs/2307.06423
- 本地全文：`referenced/00_core_bicg/2023_Bi-Touch.pdf`

## 任务、拓扑与协调

- 任务：bimanual tactile sim-to-real RL
- 拓扑：two grippers/hands--shared object；载荷路径：yes in bi-lifting/shared-object task；拓扑变化：contact state changes implicit
- 角色：symmetric/cooperative roles in lifting; task-dependent；协调必要性证据：vision/touch and reward/controller ablations; no explicit inferred graph

## 传感与部署可实现性

- 触觉：discrete/contact force tactile observations transferred from simulation（robot tactile/force sensing；gripper fingers on both arms）
- 训练输入：simulator proprioception, object/task state, tactile contact
- 部署输入：robot observations and tactile sensing after domain randomization
- 特权信息：训练=yes, simulator state and contact generation；推理=reduced real observations; verify task-specific state estimation；未来参考=no；仿真接触=yes in training
- 部署判断：deployable after sim-to-real mapping, with task-specific perception

## 表征与实验

- 表征：concatenated tactile policy state；单元：per-finger tactile features plus robot/object state
- 结构先验：bimanual reward/task design rather than explicit graph；来源：fixed observation layout；动态性：no explicit
- 目标：预训练=none；下游=deep RL task reward；物理目标=contact/grip success; no explicit future wrench/load share
- 规模与拆分：two bimanual tasks including bi-lifting, simulation training plus real trials；object/task conditions
- 基线/统计：no-touch/other modality and sim-to-real variants；matched budget=within same RL setup; exact parameter match limited；seeds=simulation aggregates and real trial counts; statistical detail limited
- 泛化：对象=limited；传感器=no；形态=no；拓扑=no

## 三级证据链

1. 作者主张：tactile sensing and sim-to-real RL enable bimanual manipulation that vision/state alone cannot reliably solve
2. 可观察证据：reported simulation and real robot performance for bi-lifting and companion task; modality/sim-to-real comparisons
3. 精标判断：支持程度=partial。Historical bimanual tactile baseline; useful to demonstrate that BiCG gains are not merely 'adding touch to PPO'.

证据位置：pp.3--6 method; pp.6--8 Tables I--III; p.8 discussion; supplementary/appendix real bi-lifting

## 对 BiCG-Rep 的决策

- 影响：mandatory early bimanual tactile reference, not a modern representation competitor
- 决策：reproduce only if code/task is stable; otherwise cite and build equivalent concat RL baseline
- 理由：The research question has moved from whether touch helps to whether explicit observation-grounded relational structure helps under matched sensing.
- 主要局限：small task/object suite, simulator contact supervision, simple fusion, limited OOD/statistics
- 未决问题：exact current code link/commit; sensor mapping and independent training seeds
