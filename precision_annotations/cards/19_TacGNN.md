# TacGNN: Learning Tactile-Based In-Hand Manipulation with a Blind Robot

- 编号：19 | 精标等级：B | 批次：3 | 状态：complete | 置信度：high
- 出版状态：paper/preprint | 年份：2023
- 来源：https://arxiv.org/abs/2304.00736
- 本地全文：`referenced/03_graph_physics_contact/2023_TacGNN.pdf`

## 任务、拓扑与协调

- 任务：blind tactile in-hand manipulation
- 拓扑：single-hand taxels--object；载荷路径：no bimanual path；拓扑变化：active sensors/features change; graph connectivity largely fixed/hierarchical
- 角色：not applicable；协调必要性证据：GNN/MLP/CNN and perception ablations

## 传感与部署可实现性

- 触觉：activated tactile sensors with contact/force features and hand configuration（distributed tactile sensor array；fingers/hand; typically 4--5 active sensors in contact）
- 训练输入：tactile graph and object-state supervision in simulation/real data
- 部署输入：touch + proprioception
- 特权信息：训练=object pose/state labels for supervised perception；推理=no object vision/state；未来参考=no；仿真接触=training/simulation data in pipeline
- 部署判断：deployable_with_custom tactile hand

## 表征与实验

- 表征：hierarchical tactile GNN；单元：taxel/contact nodes aggregated to finger/hand hierarchy
- 结构先验：hand anatomy/tactile adjacency；来源：known sensor layout and hand kinematics；动态性：mostly static hierarchy; active features dynamic
- 目标：预训练=supervised object-state/ball-position prediction；下游=RL in-hand manipulation；物理目标=object state, not load flow
- 规模与拆分：object-state datasets and multiple manipulation tasks/objects；objects/tasks
- 基线/统计：MLP, CNN, static graph/perception variants；matched budget=partial; architecture capacities differ；seeds=prediction errors and success rates; seed/CI reporting limited
- 泛化：对象=limited；传感器=no；形态=no；拓扑=no

## 三级证据链

1. 作者主张：hierarchical tactile graphs enable vision-free state estimation and in-hand control
2. 可观察证据：lower object/ball state prediction error than MLP/CNN and higher task success with TacGNN perception
3. 精标判断：支持程度=partial。Key graph baseline, but BiCG's novelty must be cross-hand/tool interface edges and temporal load objectives.

证据位置：pp.3--6 method; pp.6--8 Tables I--III; conclusion

## 对 BiCG-Rep 的决策

- 影响：historical tactile GNN precursor
- 决策：cite and reproduce a simplified hierarchical-graph baseline if hardware/simulation mapping permits
- 理由：Controls for anatomical message passing without dynamic system topology.
- 主要局限：single hand, largely fixed anatomy graph, supervised object state, limited OOD/statistical reporting
- 未决问题：venue/status, code/data, exact seeds and real trial counts
