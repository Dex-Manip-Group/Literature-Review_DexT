# ViTacFormer: Learning Cross-Modal Representation for Visuo-Tactile Dexterous Manipulation

- 编号：03 | 精标等级：A | 批次：1 | 状态：complete | 置信度：high
- 出版状态：RSS 2026 accepted | 年份：2025
- 来源：https://arxiv.org/abs/2506.15953
- 本地全文：`referenced/00_core_bicg/2025_ViTacFormer.pdf`

## 任务、拓扑与协调

- 任务：real bimanual visuotactile imitation learning
- 拓扑：mixed; shared-object and coordinated dexterous tasks；载荷路径：task-dependent；拓扑变化：implicit only
- 角色：task-dependent；协调必要性证据：no explicit single-hand/coordination ablation

## 传感与部署可实现性

- 触觉：force and tactile deformation/history from Sharpa hands（Sharpa Wave；both dexterous hands）
- 训练输入：vision, tactile, proprioception, future tactile targets
- 部署输入：vision, current/predicted tactile, proprioception
- 特权信息：训练=future tactile supervision only；推理=no ground-truth future tactile after transition；未来参考=no action reference; teacher forcing ground-truth tactile during first 75% training；仿真接触=no
- 部署判断：deployable_with_calibration

## 表征与实验

- 表征：cross-attention visuotactile latent；单元：visual tokens, tactile tokens, proprioceptive history
- 结构先验：cross-modal attention; no explicit contact topology；来源：learned；动态性：attention varies but no explicit graph
- 目标：预训练=future tactile prediction auxiliary objective；下游=imitation/action prediction；物理目标=future tactile signal; no load share/edge truth
- 规模与拆分：real bimanual dataset across short- and long-horizon tasks; exact sequence counts in appendix；task trials; no topology split
- 基线/统计：ACT-style and visuotactile baselines; ablations without prediction/two-stage/cross-modal components；matched budget=mostly architecture-matched within paper; compare carefully against larger pretrained models；seeds=trial-level success; independent training seeds NR
- 泛化：对象=some task object variations；传感器=no；形态=no；拓扑=no

## 三级证据链

1. 作者主张：cross-modal fusion and future tactile prediction improve dexterous visuotactile manipulation, including long-horizon tasks
2. 可观察证据：reported gains across four short-horizon and multiple long-horizon real tasks; prediction/two-stage ablations degrade performance
3. 精标判断：支持程度=partial。A required equal-modality cross-attention baseline; any BiCG gain must survive matched parameter and auxiliary-prediction controls.

证据位置：pp.3--5 Sec. IV; pp.5--7 Sec. V, Tables I--II; p.8 Sec. VI; pp.11--15 appendix Tables III--XI

## 对 BiCG-Rep 的决策

- 影响：direct fusion baseline, not an explicit inter-hand contact-flow model
- 决策：reimplement matched-budget cross-attention + future tactile head
- 理由：Controls whether gains come from general temporal prediction rather than explicit graph inference.
- 主要局限：imitation data and task-specific hardware; future tactile is learned but relational/load structure is not evaluated; seed statistics limited
- 未决问题：public code/data/model links; exact independent seeds; sensor sampling and synchronization details
