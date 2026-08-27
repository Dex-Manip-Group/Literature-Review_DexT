# Sparsh: Self-Supervised Touch Representations for Vision-Based Tactile Sensing

- 编号：22 | 精标等级：B | 批次：4 | 状态：complete | 置信度：high
- 出版状态：CoRL 2024 | 年份：2024
- 来源：https://proceedings.mlr.press/v270/higuera25a.html
- 本地全文：`referenced/02_tactile_representation/2024_Sparsh.pdf`

## 任务、拓扑与协调

- 任务：self-supervised vision-based tactile representation
- 拓扑：single sensor--contact interface；载荷路径：no bimanual path；拓扑变化：local contact dynamics in image history
- 角色：not applicable；协调必要性证据：not applicable

## 传感与部署可实现性

- 触觉：tactile RGB image pairs/clips with background subtraction（vision-based tactile；one/few fingertip sensors）
- 训练输入：unlabeled tactile images from three sensors
- 部署输入：tactile image history; downstream task inputs
- 特权信息：训练=no；推理=no；未来参考=no；仿真接触=no
- 部署判断：deployable_with_supported sensors

## 表征与实验

- 表征：local spatiotemporal tactile SSL encoder；单元：image patches/video tokens
- 结构先验：generic ViT SSL with tactile temporal sampling；来源：image grid/time；动态性：no explicit graph
- 目标：预训练=MAE, DINO, I-JEPA and V-JEPA variants；下游=frozen probes for force/slip/pose/stability/textile and diffusion-policy control；物理目标=force/slip only in downstream probes
- 规模与拆分：~661k curated images, 462.7k/70% used for SSL; six-task TacBench；dataset-provided or sample splits; grasp-stability uses randomized all-object split and is leakage-prone for object OOD
- 基线/统计：identical-capacity E2E and multiple SSL families/sensors；matched budget=strong frozen-probe capacity matching；seeds=95% CIs for force/pose; bead maze 10 randomized starts; task-specific protocols
- 泛化：对象=limited; some splits not object-held-out；传感器=few-shot/cross-sensor within vision-based family；形态=no；拓扑=no

## 三级证据链

1. 作者主张：SSL yields general tactile features that are data-efficient across tasks and similar vision-based sensors
2. 可观察证据：frozen-probe results across six tasks and label budgets; identical-capacity E2E baseline; force CIs; policy smoother but no full real completion
3. 精标判断：支持程度=strong for local tactile probes, weak for closed-loop success。Best default local encoder candidate, but using it cannot substitute for system-level relational modeling.

证据位置：pp.3--6 Sec. 3--4; pp.6--10 Sec. 5--8; Fig. 4; pp.10--11 limitations; Appendix Tables 3--11

## 对 BiCG-Rep 的决策

- 影响：strong local tactile backbone/control
- 决策：use frozen Sparsh variant when sensor imagery is available; keep local encoder fixed across graph/fusion baselines
- 理由：Prevents BiCG improvements from being attributed to unequal tactile pretraining.
- 主要局限：vision-based family only, discrete-contact data, limited shear, no history-length ablation, weak system-level control result
- 未决问题：best variant for Sharpa/non-optical signals; strict object-level re-splits for all probes
