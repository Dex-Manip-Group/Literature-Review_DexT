# TouchWGNN: spatio-temporal tactile perception for multimodal dexterous manipulation

- 编号：06 | 精标等级：A | 批次：1 | 状态：complete | 置信度：high
- 出版状态：peer-reviewed Frontiers 2026 | 年份：2026
- 来源：https://www.frontiersin.org/journals/robotics-and-ai/articles/10.3389/frobt.2026.1791424/full
- 本地全文：`referenced/00_core_bicg/2026_TouchWGNN.pdf`

## 任务、拓扑与协调

- 任务：single-hand in-hand manipulation with multimodal state estimation
- 拓扑：hand--object (single hand)；载荷路径：no bimanual path；拓扑变化：yes at taxel activation level
- 角色：not applicable；协调必要性证据：not applicable

## 传感与部署可实现性

- 触觉：normal force at 113 taxels and 3D taxel coordinates（custom distributed piezoresistive/force array；113 points over fingertips, digits and palm）
- 训练输入：taxel forces/positions, vision, proprioception
- 部署输入：same sensor observations
- 特权信息：训练=simulation/object-state supervision for perception/RL likely；推理=vision/proprio/touch only in proposed perception path；未来参考=no；仿真接触=not as graph edge source; active taxels from sensor
- 部署判断：deployable_with_custom_hardware

## 表征与实验

- 表征：dynamic tactile graph + equivariant/spatial GNN and temporal module；单元：active taxel nodes
- 结构先验：spatial proximity and local force variation edges；来源：observed taxel positions/forces and fixed sensor geometry；动态性：yes, active-node/contact graph changes
- 目标：预训练=supervised object-state estimation；下游=RL control；物理目标=object pose/state; normal forces as node inputs
- 规模与拆分：two in-hand tasks; sensor calibration/pose datasets；task difficulty/objects
- 基线/统计：vision/proprio/tactile perception variants; MLP/other GNN variants；matched budget=partial; same tasks but exact parameter matching NR；seeds=success/estimation metrics; seeds and confidence intervals limited
- 泛化：对象=limited；传感器=no；形态=no；拓扑=no

## 三级证据链

1. 作者主张：spatiotemporal dynamic tactile graphs improve multimodal in-hand perception and control
2. 可观察证据：taxel graph construction is deployable; performance reported on Baoding swapping and cube reorientation against perception baselines
3. 精标判断：支持程度=partial。This is the closest tactile-graph representation baseline; BiCG novelty cannot be 'dynamic tactile graph' alone.

证据位置：pp.3--7 Sec. 3, Tables 1--3 (sensor/graph); pp.13--15 Sec. 4, Table 6 (experiments); p.15 Sec. 5

## 对 BiCG-Rep 的决策

- 影响：direct representation competitor at taxel level, but not bimanual/system contact-flow level
- 决策：reproduce a parameter-matched dynamic taxel/spatial graph baseline or faithfully reimplement its builder
- 理由：Needed to attribute gains to cross-interface system edges rather than generic spatial graph encoding.
- 主要局限：single-hand and taxel-proximity graph; no tool-mediated inter-hand edge, load share, or topology OOD
- 未决问题：public implementation; exact real-vs-sim split of control experiments; independent seeds
