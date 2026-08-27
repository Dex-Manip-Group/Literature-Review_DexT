# Contact-Grounded Policy Learning for Contact-Rich Manipulation

- 编号：15 | 精标等级：A | 批次：3 | 状态：complete | 置信度：high
- 出版状态：RSS 2026 accepted | 年份：2026
- 来源：https://arxiv.org/abs/2603.05687
- 本地全文：`referenced/00_core_bicg/2026_Contact-Grounded-Policy.pdf`

## 任务、拓扑与协调

- 任务：dexterous visuotactile contact-rich policy learning
- 拓扑：hand--object/environment with distributed contacts；载荷路径：not bimanual；拓扑变化：represented implicitly through predicted tactile/state triples
- 角色：not applicable；协调必要性证据：contact-consistency/representation ablations

## 传感与部署可实现性

- 触觉：tactile RGB images or tactile arrays（DIGIT360 and array/full-hand configurations；fingertip or distributed full hand）
- 训练输入：vision, tactile, actual robot state, demonstrated future actual/tactile/target states
- 部署输入：current observable vision/tactile/state; outputs target state
- 特权信息：训练=future supervision from demonstrations；推理=no；未来参考=predicts future targets, does not consume reference trajectory；仿真接触=simulation data may train tactile compressor; contact not an inference input
- 部署判断：deployable_with_calibration

## 表征与实验

- 表征：contact-grounded predictive latent；单元：coupled actual state, tactile feedback and executable target state
- 结构先验：compliance-control contact consistency；来源：measurable state/touch and controller targets；动态性：time-varying implicit contacts, no explicit graph
- 目标：预训练=tactile VAE reconstruction with KL regularization；下游=predict executable target states with contact-consistency loss；物理目标=expected tactile feedback and state consistency, not explicit force balance
- 规模与拆分：five challenging tasks; simulation tactile compression plus real validation；task/validation trajectories
- 基线/统计：diffusion policy and contact-grounding variants; tactile encoder/loss ablations；matched budget=substantial internal matching, exact parameter equality not always reported；seeds=success rates and MAE/KL; five-task trials; independent training seeds NR
- 泛化：对象=limited；传感器=supports multiple tactile forms conceptually; strict sensor-held-out transfer not shown；形态=no；拓扑=no

## 三级证据链

1. 作者主张：contact can be grounded without hand-designed modes by jointly predicting measurable actual state, tactile outcome and executable target state
2. 可观察证据：higher reported success on five tasks; state-prediction and tactile-compression ablations/validation including real DIGIT360 sequences
3. 精标判断：支持程度=partial-to-strong。A serious alternative to explicit graphs; BiCG must beat it on interpretability/transfer while matching future-state/tactile auxiliary targets.

证据位置：pp.4--7 Sec. III; pp.8--10 Sec. V, Tables II--IV; pp.10--11 limitations; appendix Tables V--VI

## 对 BiCG-Rep 的决策

- 影响：direct conceptual competitor: implicit executable contact grounding
- 决策：include contact-grounded predictive baseline with the same local encoder and horizons
- 理由：Controls whether explicit topology is useful beyond coupled future observation/control prediction.
- 主要局限：implicit contact representation is controller/sensor specific; no explicit edges/load share, topology OOD or calibrated uncertainty
- 未决问题：public code/data/model; independent seeds; exact sensor/task training split
