# Towards Human-Level Bimanual Dexterous Manipulation with Reinforcement Learning

- 编号：13 | 精标等级：B | 批次：2 | 状态：complete | 置信度：high
- 出版状态：NeurIPS 2022 Datasets and Benchmarks | 年份：2022
- 来源：https://proceedings.neurips.cc/paper_files/paper/2022/hash/217a2a387f52c30755c37b0a73430291-Abstract-Datasets_and_Benchmarks.html
- 本地全文：`referenced/01_bimanual_handover/2022_Bi-DexHands.pdf`

## 任务、拓扑与协调

- 任务：large-scale simulated bimanual dexterous RL benchmark
- 拓扑：20 tasks across shared-object, dual-object, handover, catching and tool/articulated-object interactions；载荷路径：task-dependent；拓扑变化：task-specific, not explicit representation
- 角色：task-dependent；协调必要性证据：benchmark difficulty/multi-agent comparisons; no explicit hand-removal test

## 传感与部署可实现性

- 触觉：simulation observations may include fingertip forces but tactile representation is not central（privileged simulator state；Shadow hand rigid bodies/fingertips）
- 训练输入：high-dimensional simulator observations; centralized or per-agent variants
- 部署输入：simulation only
- 特权信息：训练=yes；推理=yes in benchmark state policies；未来参考=task goal state；仿真接触=sim forces/states
- 部署判断：privileged simulation benchmark

## 表征与实验

- 表征：flat centralized/decentralized policy state；单元：per-hand and object state vectors
- 结构先验：agent decomposition/task ID；来源：simulator/task design；动态性：no explicit graph
- 目标：预训练=none；下游=online/offline/multi-task/meta RL reward；物理目标=task rewards only
- 规模与拆分：20 tasks; online, offline, multi-task/meta settings; highly parallel simulation；task suites/object/goal variations; offline data quality categories
- 基线/统计：PPO, SAC, TD3, TRPO, MAPPO/HAPPO, offline RL and multi-task/meta algorithms；matched budget=benchmark configurations shared; algorithm hyperparameters vary；seeds=10 seeds for multi-task/meta table; other protocols task-dependent
- 泛化：对象=object/goal variation but not strict real OOD；传感器=no；形态=no；拓扑=multiple tasks but not held-out topology transfer

## 三级证据链

1. 作者主张：Bi-DexHands provides scalable, diverse benchmarks for human-level bimanual dexterous RL and exposes current algorithm limitations
2. 可观察证据：20-task benchmark, extensive online/offline/multi-agent/multi-task results, high simulation throughput and observation specifications
3. 精标判断：支持程度=strong as benchmark, weak for real tactile claims。Good source of task templates and infrastructure, but only tasks with simultaneous coupling should enter BiLoadBench; throwing/catching is unsuitable as the initial load-transfer benchmark.

证据位置：pp.4--8 Sec. 4--6, Tables 1--4; pp.17 onward Appendix observation/action tables

## 对 BiCG-Rep 的决策

- 影响：simulation task reservoir and negative control
- 决策：use only selected quasi-static shared-object/tool tasks after VTDexManip; do not begin with catch/throw
- 理由：Dynamic flight phases remove the inter-hand load path and confound contact inference with ballistic prediction.
- 主要局限：state privilege, no real robot, contact/touch not central, many tasks do not isolate simultaneous load paths
- 未决问题：maintenance compatibility; exact per-contact labels for selected tasks
