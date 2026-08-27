# Handover Control for Human-Robot and Robot-Robot Collaboration

- 编号：09 | 精标等级：A | 批次：2 | 状态：complete | 置信度：high
- 出版状态：Frontiers 2021 | 年份：2021
- 来源：https://www.frontiersin.org/journals/robotics-and-ai/articles/10.3389/frobt.2021.672995/full
- 本地全文：`referenced/01_bimanual_handover/2021_Handover-Control.pdf`

## 任务、拓扑与协调

- 任务：human--robot and robot--robot reactive handover control
- 拓扑：giver--object--receiver with explicit load-transfer state；载荷路径：yes during transfer；拓扑变化：explicit state machine for approach/grasp/load transfer/release
- 角色：giver and receiver roles; reactive release；协调必要性证据：controller modes and handover direction experiments, not learned-representation ablation

## 传感与部署可实现性

- 触觉：6D contact wrench at fingertips（soft fingertip force/tactile sensors；gripper fingertips）
- 训练输入：model/controller calibration, not learned policy
- 部署输入：vision, measured fingertip wrench, state machine
- 特权信息：训练=no；推理=object-specific calibration and contact model parameters；未来参考=precalibrated grasp pose, not future trajectory；仿真接触=no
- 部署判断：deployable_with_calibration

## 表征与实验

- 表征：physics-based contact state/controller；单元：per-fingertip wrench and controller state
- 结构先验：soft-contact/friction model and state machine；来源：known gripper contact geometry and measured wrench；动态性：phase changes explicit, no learned graph
- 目标：预训练=not applicable；下游=stable grasp, load reception and release；物理目标=slip margin, tangential/normal wrench, load transfer
- 规模与拆分：multiple real objects and H2R/R2R scenarios；object/scenario trials
- 基线/统计：control modes/objects; not a modern learned matched-budget suite；matched budget=not applicable；seeds=experimental repetitions reported, no ML seeds
- 泛化：对象=limited object set；传感器=no；形态=no；拓扑=handover direction variation only

## 三级证据链

1. 作者主张：combined visual servo and force/tactile grip control enables safe, reactive handovers under changing load
2. 可观察证据：real H2R and R2R handover experiments with measured wrench and state scheduling across several objects
3. 精标判断：支持程度=partial-to-strong for controller scope。Primary source for measurable load-transfer variables and release logic; its measured wrench should not be mislabeled as independent ground truth if used as input.

证据位置：pp.4--8 Sec. 2--3 (visual/force control and state machine); pp.11--15 Sec. 4; pp.16--17 conclusion

## 对 BiCG-Rep 的决策

- 影响：defines physical target vocabulary and safe phase metrics
- 决策：use for load-share/slip/release definitions and quasi-static benchmark design
- 理由：Provides a validated physical decomposition absent from representation papers.
- 主要局限：object-specific grasp calibration/friction parameters; limited objects; no learned representation/OOD study
- 未决问题：exact trial counts per condition; sensor hardware availability and calibration reproducibility
