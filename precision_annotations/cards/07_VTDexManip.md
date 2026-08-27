# VTDexManip: A Dataset and Benchmark for Visual-Tactile Pretraining and Dexterous Manipulation with Reinforcement Learning

- 编号：07 | 精标等级：A | 批次：1 | 状态：complete | 置信度：high
- 出版状态：ICLR 2025 | 年份：2025
- 来源：https://proceedings.iclr.cc/paper_files/paper/2025/hash/e19b6f65791e350347bcff8a3955cb5b-Abstract-Conference.html
- 本地全文：`referenced/00_core_bicg/2025_VTDexManip.pdf`

## 任务、拓扑与协调

- 任务：visual-tactile pretraining and simulated dexterous benchmark including bimanual handover
- 拓扑：hand--object; hand--object--hand for handover；载荷路径：yes in bimanual handover simulation；拓扑变化：implicit binary contacts
- 角色：handover roles implicit；协调必要性证据：modality ablations but no removal of one hand

## 传感与部署可实现性

- 触觉：20-site piezoresistive glove/hand signals binarized to contact（custom piezoresistive sensors；20 sites）
- 训练输入：human RGB+binary touch for MAE; sim vision/touch/proprio for PPO
- 部署输入：sim RGB+binary touch+proprio; real student uses augmented observations including touch
- 特权信息：训练=yes for real-world teacher/domain randomization/distillation；推理=no full simulator state in student path; simulation benchmark itself has synthetic observations；未来参考=no；仿真接触=forces binarized to touch in simulation
- 部署判断：deployable_with_binary calibration

## 表征与实验

- 表征：joint masked-autoencoder visuotactile latent；单元：image patches + 20 binary tactile tokens
- 结构先验：modality masking; no explicit spatial graph；来源：fixed sensor ordering；动态性：no
- 目标：预训练=masked reconstruction of vision and touch；下游=PPO success；物理目标=binary contact only
- 规模与拆分：2,032 sequences, 10 tasks, 182 objects, 5 subjects；seen/unseen objects; task-level transfer; 4 random seeds and 100 tests per split
- 基线/统计：proprio-only, tactile-only, vision-only, concat, separate/joint pretraining, multiple visual encoders；matched budget=strong within benchmark; frozen pretrained encoders and shared RL setup；seeds=4 seeds; mean±variation; 100 tests seen and unseen
- 泛化：对象=yes；传感器=threshold/noise robustness, not new sensor hardware；形态=human glove to Shadow hand via binary abstraction；拓扑=bimanual handover is an unseen downstream task but not a held-out topology study

## 三级证据链

1. 作者主张：sparse binary touch and joint visuotactile pretraining improve dexterous manipulation and generalize to unseen tasks/objects
2. 可观察证据：six simulated tasks including handover, four seeds, seen/unseen objects, extensive modality/noise/threshold ablations; limited real deployment
3. 精标判断：支持程度=strong for benchmark scope。Best immediate reproducible handover environment and disciplined baseline suite, but insufficient for load-flow targets without added simulator labels/proxies.

证据位置：pp.1--4 dataset; pp.5--6 Sec. 4; pp.6--10 Tables 2--7; p.9 Sec. 5.4; pp.14--16 appendix settings/Tables 15--16

## 对 BiCG-Rep 的决策

- 影响：primary M1 benchmark and split/statistics template
- 决策：reproduce Bimanual Hand-over and use episode/object/contact-sequence splits; add future-edge/load proxies cautiously
- 理由：Accessible, seeds reported, and includes a distinct bimanual topology; avoid claiming force estimation from binary touch.
- 主要局限：binary contact discards load magnitude/shear; simulated handover lacks independent wrench truth; real bimanual validation absent
- 未决问题：exact current download integrity; official environment commit; whether bimanual labels expose per-contact force
