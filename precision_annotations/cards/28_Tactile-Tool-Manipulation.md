# Tactile Tool Manipulation

- 编号：28 | 精标等级：A | 批次：5 | 状态：complete | 置信度：high
- 出版状态：ICRA 2023 | 年份：2023
- 来源：https://arxiv.org/abs/2301.06698
- 本地全文：`referenced/04_tool_workpiece_control/2023_Tactile-Tool-Manipulation.pdf`

## 任务、拓扑与协调

- 任务：model-based tactile tool manipulation
- 拓扑：gripper--tool--object--environment；载荷路径：single arm/tool；拓扑变化：multiple assumed contact formations; mode B fixed to line contact in formulation
- 角色：environment supports object; gripper manipulates tool；协调必要性证据：closed-loop vs disturbance/model-error tests

## 传感与部署可实现性

- 触觉：tactile estimates of tool/grasp pose/contact used for feedback（vision-based/force-sensitive tactile gripper；gripper--tool patch）
- 训练输入：system identification/planning model
- 部署输入：tactile pose/contact estimate, robot state and known model
- 特权信息：训练=no；推理=strong quasi-static/rigid/known-friction assumptions；未来参考=planned trajectory；仿真接触=no
- 部署判断：deployable_with_calibration/model

## 表征与实验

- 表征：explicit quasi-static multi-contact mechanics；单元：contacts A/B/C with wrench cones
- 结构先验：force/moment equilibrium and friction cones；来源：known tool/object geometry and tactile grasp estimate；动态性：limited prescribed contact formations
- 目标：预训练=not applicable；下游=robust tool/object pose tracking；物理目标=reaction/contact wrenches and quasi-static equilibrium
- 规模与拆分：real pivoting/tool tasks and disturbance tests；tools/contact conditions/disturbances
- 基线/统计：open-loop/closed-loop and inaccurate-model conditions；matched budget=not an ML comparison；seeds=Tables II--III physical trials; no training seeds
- 泛化：对象=limited tool shapes；传感器=no；形态=no；拓扑=multiple predefined contact formations, no learned transfer

## 三级证据链

1. 作者主张：explicit mechanics plus tactile feedback robustifies tool manipulation under disturbances/model mismatch
2. 可观察证据：real closed-loop pivoting/tool tests under disturbances and inaccurate parameters
3. 精标判断：支持程度=partial-to-strong。Ideal oracle-mechanics baseline for the first rigid puck/stylus task and a source for equilibrium loss terms.

证据位置：pp.3--5 Sec. III, Table I; pp.5--7 controller/planning; pp.6--7 Tables II--III; conclusion

## 对 BiCG-Rep 的决策

- 影响：tool-load mechanics benchmark
- 决策：implement a simplified quasi-static oracle/controller in simulation before learned tool transfer
- 理由：Makes load-path evaluation physically interpretable and bounds what a learned graph can recover.
- 主要局限：rigid/quasi-static/known kinematics/friction assumptions and prescribed contact modes; single arm
- 未决问题：hardware details and exact trial counts; validity for compliant/deformable tools
