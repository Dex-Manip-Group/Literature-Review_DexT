# TactiDex: A Real-World Tactile-Guided Benchmark for Human-Like Dexterous Manipulation

- 编号：30 | 精标等级：B | 批次：5 | 状态：complete | 置信度：high
- 出版状态：author page states ACM MM 2026 accepted | 年份：2026
- 来源：https://arxiv.org/abs/2607.09190
- 本地全文：`referenced/05_datasets_benchmarks/2026_TactiDex.pdf`

## 任务、拓扑与协调

- 任务：real whole-hand tactile dexterity dataset and sim-to-real transfer
- 拓扑：single-hand and bimanual hand--object/object--object interactions；载荷路径：present in bimanual subset, but dataset covers mixed topologies；拓扑变化：contact intervals inferred from pressure+geometry
- 角色：task-dependent; not explicitly factorized；协调必要性证据：tactile reward/alignment/safety ablations, not hand-role removal

## 传感与部署可实现性

- 触觉：162-element whole-hand pressure array, 0.01 N resolution, 17 Hz（piezoresistive tactile glove；fingertips and palm）
- 训练输入：human tactile/kinematic/object trajectories, sim state/contact forces
- 部署输入：policy trajectory reference/goal; real sensing availability described, but main TactiSkill actor receives target tactile reference
- 特权信息：训练=critic receives simulated contact force; post-optimization uses global mocap/meshes；推理=yes: target tactile reference and reference trajectory are required for imitation transfer；未来参考=yes, target human tactile/kinematic sequence；仿真接触=yes for critic/reward and metrics
- 部署判断：privileged reference-conditioned transfer

## 表征与实验

- 表征：tactile-guided residual RL/benchmark；单元：finger-wise reference and simulated force/contact signals
- 结构先验：finger-wise alignment, contact intervals and tactile reward components；来源：human glove pressure + mocap + simulator contacts；动态性：contact sequence dynamic, no learned graph
- 目标：预训练=tactile-constrained post-optimization and sensor-to-sim mapping；下游=residual PPO/reference tracking；物理目标=contact F1, mean/peak force error and safety thresholds
- 规模与拆分：49 objects, 757 sequences; 73-sequence benchmark split；representative sequence evaluation; strict object/topology OOD split not established
- 基线/统计：ManipTrans and reward-component ablations；matched budget=shared transfer setup; representation baselines limited；seeds=73 sequences; independent training seeds NR
- 泛化：对象=dataset diversity but held-out protocol unclear；传感器=no；形态=human→robot transfer via mapping；拓扑=mixed sequences, no explicit held-out topology transfer

## 三级证据链

1. 作者主张：whole-hand tactile references improve physical fidelity and safety of human-to-robot dexterous transfer
2. 可观察证据：73-sequence tactile/kinematic metrics and reward ablations; qualitative single/bimanual sim and real rollout examples
3. 精标判断：支持程度=partial。Excellent metric/dataset-design precedent but not a deployment-observable representation competitor; do not copy its target tactile reference into BiCG inference.

证据位置：pp.5--7 Sec. 3; pp.7--11 Sec. 4; pp.11--14 Sec. 5, Table 2; pp.14--15 real deployment/limitations

## 对 BiCG-Rep 的决策

- 影响：whole-hand tactile metric and benchmark precursor
- 决策：adopt Contact F1/peak-safety-style metrics; wait for data release before any reproduction dependency
- 理由：Metrics are valuable, but current artifact and observability constraints make it unsuitable as M1 backbone.
- 主要局限：reference/target tactile privilege, sensor-to-sim mapping, no strict OOD topology or independent robot force truth, resources not yet downloadable
- 未决问题：artifact release date/license; exact real trial counts; strict train/test topology split
