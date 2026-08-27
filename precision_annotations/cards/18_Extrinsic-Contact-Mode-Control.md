# Tactile-Driven Non-Prehensile Manipulation via Extrinsic Contact Mode Control

- 编号：18 | 精标等级：A | 批次：3 | 状态：complete | 置信度：high
- 出版状态：RSS 2024 | 年份：2024
- 来源：https://www.roboticsproceedings.org/rss20/p135.html
- 本地全文：`referenced/04_tool_workpiece_control/2024_Extrinsic-Contact-Mode-Control.pdf`

## 任务、拓扑与协调

- 任务：tactile-driven non-prehensile contact-mode control
- 拓扑：gripper/object--environment extrinsic contacts；载荷路径：not bimanual；拓扑变化：explicit extrinsic contact modes
- 角色：not applicable；协调必要性证据：controller/model variants and disturbances

## 传感与部署可实现性

- 触觉：tactile deformation/contact geometry used to estimate/control external contact modes（Soft-Bubble and more rigid tactile sensors；gripper contacts）
- 训练输入：calibration/system identification rather than large learned dataset
- 部署输入：tactile contact estimates and robot state
- 特权信息：训练=no major simulator privilege；推理=assumed contact type/model and geometry；未来参考=planned motion goal；仿真接触=no
- 部署判断：deployable_with_model_assumptions

## 表征与实验

- 表征：discrete extrinsic contact mode + optimization controller；单元：contact line/point/mode constraints
- 结构先验：contact mechanics and complementarity/feasibility；来源：tactile model and geometry；动态性：mode transitions explicit
- 目标：预训练=not applicable；下游=non-prehensile manipulation under disturbances；物理目标=contact mode feasibility and object motion
- 规模与拆分：real experiments across contact modes/sensors and disturbances；task/sensor/contact-mode conditions
- 基线/统计：sampling/controller/model variants；matched budget=not ML matched-budget；seeds=physical trials in Tables I--IV; no training seeds
- 泛化：对象=limited；传感器=some cross-sensor demonstration, not learned OOD；形态=no；拓扑=multiple extrinsic modes within designed family

## 三级证据链

1. 作者主张：tactile feedback and explicit extrinsic contact modes enable robust non-prehensile manipulation
2. 可观察证据：real closed-loop results under disturbances and inaccurate models, with several contact configurations/sensors
3. 精标判断：支持程度=partial-to-strong。Provides a physics-respecting oracle/contact-mode baseline and intervention protocol for slip/contact transitions.

证据位置：Sec. III--V; Tables I--IV; conclusion/limitations near pp.10--12

## 对 BiCG-Rep 的决策

- 影响：source for physical mode labels and perturbation tests
- 决策：use contact-mode oracle/heuristic as upper/control baseline, not main encoder
- 理由：A learned graph should be compared to engineered mechanics where assumptions hold.
- 主要局限：requires assumed contact model/mode family and calibration; not a learned general representation or bimanual system
- 未决问题：exact reproducible hardware/calibration; generalization beyond assumed modes
