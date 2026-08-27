# Stabilize to Act: Learning to Coordinate for Bimanual Manipulation

- 编号：11 | 精标等级：A | 批次：2 | 状态：complete | 置信度：high
- 出版状态：CoRL 2023 | 年份：2023
- 来源：https://proceedings.mlr.press/v229/grannen23a.html
- 本地全文：`referenced/01_bimanual_handover/2023_Stabilize-to-Act-BUDS.pdf`

## 任务、拓扑与协调

- 任务：role-asymmetric bimanual tool/object manipulation
- 拓扑：stabilizing-hand--workpiece--tool--acting-hand；载荷路径：yes in four tasks；拓扑变化：restabilization events; roles fixed
- 角色：explicit acting vs stabilizing policies；协调必要性证据：strong: monolithic zero success; BC-Stabilizer and No-Restable ablations

## 传感与部署可实现性

- 触觉：none（vision only；not applicable）
- 训练输入：images, 20 rollout demonstrations/task plus labels for restabilization
- 部署输入：RGB workspace images and robot state
- 特权信息：训练=human expert labels restabilization time；推理=no；未来参考=acting demonstration policy；仿真接触=no
- 部署判断：deployable but vision-limited

## 表征与实验

- 表征：factorized role/keypoint policy；单元：stabilizing keypoint, acting action, restabilization state
- 结构先验：fixed actor/stabilizer decomposition；来源：task design and expert labeling；动态性：stabilization point changes, roles do not
- 目标：预训练=supervised keypoint/restabilization learning；下游=task success；物理目标=none sensed; coordination encoded as role/position
- 规模与拆分：four real tasks; 20 demos/task, 2,000 stabilizing images; 10 trials/condition；seen objects and easy/hard OOD objects
- 基线/统计：BC-Stabilizer, No-Restable, monolithic baseline, 40-Demo；matched budget=largely matched task/data comparisons; factorization changes supervision；seeds=mean±std across 10 physical trials; no training seeds
- 泛化：对象=yes, morphology-stratified；传感器=not applicable；形态=no；拓扑=no role swap

## 三级证据链

1. 作者主张：explicit stabilize-to-act role decomposition enables dexterous bimanual tasks that monolithic or unstructured stabilization fails
2. 可观察证据：76.9% mean seen success and 52.7% OOD; monolithic zero; BC-Stabilizer 20.9%; No-Restable degradation on dynamic tasks
3. 精标判断：支持程度=strong for fixed-role visual setting。Strong evidence that tool-use coordination is structurally necessary, supporting an actor/stabilizer topology and a coordination-necessity gate before the tool phase.

证据位置：pp.4--7 Sec. 4--5, Tables 1--2; p.8 Sec. 6 limitations; appendix data details

## 对 BiCG-Rep 的决策

- 影响：key non-tactile structured baseline and task-selection evidence
- 决策：adopt coordination-necessity checks and compare fixed-role prior vs inferred dynamic role/edges
- 理由：BiCG should only enter tool-use when structure has measurable benefit beyond a monolithic matched baseline.
- 主要局限：vision-only, fixed roles, expert restabilization labels, small tasks/trials; touch-critical tasks fail
- 未决问题：exact model parameter matching; code/data availability; generalization to alternating roles
