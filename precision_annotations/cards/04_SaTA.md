# Spatially-Anchored Tactile Awareness for Dexterous Manipulation

- 编号：04 | 精标等级：A | 批次：1 | 状态：complete | 置信度：high
- 出版状态：preprint | 年份：2025
- 来源：https://arxiv.org/abs/2510.14647
- 本地全文：`referenced/00_core_bicg/2025_SaTA.pdf`

## 任务、拓扑与协调

- 任务：spatially precise dexterous manipulation
- 拓扑：mostly single-system multi-finger contact; includes bimanual relevance but not load-flow benchmark；载荷路径：not central；拓扑变化：contact activations implicit
- 角色：not central；协调必要性证据：no

## 传感与部署可实现性

- 触觉：vision-based tactile images/features anchored using fingertip forward kinematics（vision-based tactile fingertip sensors；multiple fingertips）
- 训练输入：vision, tactile images, finger poses
- 部署输入：same observable sensing and calibrated kinematics
- 特权信息：训练=no major simulator privilege；推理=no；未来参考=no；仿真接触=no
- 部署判断：deployable_with_calibration

## 表征与实验

- 表征：spatially anchored tactile tokens；单元：per-fingertip tactile feature with 3D pose/anchor
- 结构先验：forward-kinematic spatial anchoring；来源：robot kinematics and sensor placement；动态性：dynamic positions, fixed token relations
- 目标：预训练=task learning; exact encoder objectives in Sec. II；下游=action prediction/control；物理目标=geometric contact awareness; no explicit wrench/load-share target
- 规模与拆分：three precision tasks；task trials/object conditions
- 基线/统计：visuotactile fusion variants and SaTA ablations；matched budget=reasonable internal ablations; parameter matching not fully established；seeds=success and geometric precision; independent seeds NR
- 泛化：对象=limited；传感器=no；形态=no；拓扑=no

## 三级证据链

1. 作者主张：anchoring tactile features in kinematic space enables geometric reasoning and robust precision manipulation
2. 可观察证据：reported up-to-30% success improvement across three tasks and anchoring ablations on card sliding
3. 精标判断：支持程度=partial。Provides the strongest non-graph spatial-anchor baseline and a useful node-coordinate construction for BiCG.

证据位置：pp.3--5 Sec. II; pp.5--7 Sec. III, Tables I--II; pp.7--8 limitations/conclusion

## 对 BiCG-Rep 的决策

- 影响：narrows novelty: spatial anchoring alone cannot be claimed
- 决策：implement SaTA-like FK anchoring as mandatory baseline and node initializer
- 理由：BiCG must show value from dynamic inter-interface edges and mechanics beyond calibrated spatialization.
- 主要局限：calibration/kinematics dependence; small task suite; no inter-hand load transfer, OOD topology, or uncertainty test
- 未决问题：code/data availability; exact seed protocol; transfer beyond calibrated hand
