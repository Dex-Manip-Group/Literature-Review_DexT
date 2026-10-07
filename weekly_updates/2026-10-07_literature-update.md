# 2026-10-07 文献补齐、全文审读与结论更新

## 1. 本轮边界与决定

- 执行/来源核验日期：**2026-10-07 UTC**。首发筛查窗口为 **2026-08-31 至本次检索时可获得的 2026-10-07 资料**，不是承诺覆盖 10 月 7 日结束后的发布。
- 这是从 8 月 30 日正文冻结后补齐的 targeted rapid surveillance；不是数据库穷尽检索，也不把检索命中数量当作全球发文数量。
- **纳入 14 条**：13 篇窗口内首发，另有 ContactWorld（6 月 11 日首发、9 月 24 日修订）作为明确分开的 revision-based discovery。均不与原 91 条重复。
- 全部新增记录通过官方全文检查部署输入、结构来源、评价协议和限制，并进入主文献、BibTeX、定位全文覆盖表和正文综合。
- 正文语料在整合后重冻结于 **2026-10-07，共 105 条：104 篇 scholarly work、1 条 resource-only**。
- **30 篇 precision subset 保持不变；其编码完成日期仍为 2026-08-13，19 A/11 B。** 新的全文归档审读不等于完整 precision schema，也不是独立实验复现。
- **0/30 是固定历史精标子集的结果，不是扩展到 104 篇后的零计数。** 本轮没有计算扩展全库的 topology-OOD 发生率。

## 2. 纳入记录、首发与审读版本

下表所有条目均按 preprint / author-claim 证据层处理。Dex-X、VISTA 的 CoRL 接收为作者声明；DexTouch-WM 为作者声明的 workshop lightning talk；BiView-Touch 的 ICRA 投稿不等于接收。CADeT 的期刊式页眉不等于正式发表。

| 记录 | 首发日期（UTC） | 审读版本 | 权威全文 |
|---|---|---|---|
| ContactWorld | 2026-06-11 | v3 Sep24 | [arXiv全文](https://arxiv.org/html/2606.13877v3) |
| DemoMimic | 2026-09-01 | v2 Sep3 | [arXiv全文](https://arxiv.org/html/2609.01938v2) |
| Temporal-Tactile-Handover | 2026-09-04 | v1 Sep4 | [arXiv全文](https://arxiv.org/html/2609.05282v1) |
| Dex-X | 2026-09-07 | v3 Oct1 | [arXiv全文](https://arxiv.org/html/2609.07747v3) |
| CALIPER | 2026-09-08 | v1 Sep8 | [arXiv全文](https://arxiv.org/html/2609.08250v1) |
| Bench2Dex | 2026-09-14 | v1 Sep14 | [arXiv全文](https://arxiv.org/html/2609.15726v1) |
| DexTouch-WM | 2026-09-17 | v2 Sep18 | [arXiv全文](https://arxiv.org/html/2609.20649v2) |
| ME-Dex-1.0 | 2026-09-18 | v2 Sep21 | [arXiv全文](https://arxiv.org/html/2609.21449v2) |
| BiView-Touch | 2026-09-20 | v1 Sep20 | [arXiv全文](https://arxiv.org/html/2609.23352v1) |
| UVTA | 2026-09-28 | v2 Sep29 | [arXiv全文](https://arxiv.org/html/2609.34182v2) |
| CADeT | 2026-09-29 | v1 Sep29 | [arXiv全文](https://arxiv.org/html/2609.38483v1) |
| RATE | 2026-10-02 | v1 Oct2 | [arXiv全文](https://arxiv.org/html/2610.03538v1) |
| SimpleTouch | 2026-10-02 | v1 Oct2 | [arXiv全文](https://arxiv.org/html/2610.02784v1) |
| VISTA | 2026-10-02 | v1 Oct2 | [arXiv全文](https://arxiv.org/html/2610.03333v1) |

## 3. 可定位证据与对结论的影响

### 跨手表示、handover 和数据基础

- **BiView-Touch**（III-A–E；IV-A–D，Tables I–XI；V/Table XII）：静态解剖区域与 geometry-conditioned cross-hand completion 确实利用对侧信息，已有时间/布局与 donor-context 干预。主比较中 dense fusion 与 cross-attention 接近，不能宣称几何 attention 架构优越。人类离线实验、部分由同一触觉输入派生的 phase/contact 标签和独立 wrist-motion 标签需区分；没有闭环机器人验证。T17 扣具任务留出是 task split，相关 handover/connection 模式在其他训练任务存在，不是明确 held-out participant/edge topology。**收窄“跨手表示缺失”的旧表述，加入 completion/dense-fusion 与独立载荷标签对照。**
- **Temporal Tactile Handover**（III-A–C；IV-A；IV-B/Table I）：两只 ergoCub 手向人交接箱体；约 0.9 s 力历史压缩为 24 维，与瞬时力向量同维。10 名新参与者、每策略 100 trials；93% 对比无 tactile policy input 54%（仍保留用力反馈的 compliance）、无 compliance 82% 是正确 release-or-hold outcome，包含正确继续持握，不是单纯交接完成率。控制部署用过去力、RGB、本体；没有显式图或独立人机载荷比分解。不同 compliance 训练数据虽 frame-matched，仍不是完美全因子实验。**必须把历史编码和 compliance 分开做强基线。**
- **Bench2Dex**（III.4–6；IV.1；Appendices A–G）：26 task–embodiment settings、12 手、约 1,300 demonstrations。触觉通道来自 mesh penetration depth；公开报告策略使用 RGB+proprioception，并按 task–embodiment 分别训练。多手/触觉数据可用不等于已验证 tactile gain、held-out embodiment 或 topology transfer。官网、GitHub、Hugging Face 数据/模型端点存在；未下载完整数据或执行代码。**提供实验平台，而非已完成关键表示验证。**
- **DemoMimic**（PDF pp.4–8，Sections 3–4/Figures 3、5；pp.19–20，Appendices C/F）：local normal alignment 与 sustained-contact reward 对 real contact preservation 有作用，部署为视觉参考、腕部深度和 proprioception，教师使用特权。16 对象、4 任务、2 embodiments；任务用 graded articulation/distance 或四阶段瓶子分数，headline 71% 不是统一二元成功率，且存在任务专用策略。**增加几何/接触保持基线，区分真实与近饱和仿真。**
- **Dex-X**（III.3–4；IV.2–4/Tables I–III；Appendices E/I；VI）：distilled student 移除 current privileged object-state blocks，但保留 next-step motion reference 与 demonstration target object pose。双手 handover 86.6% 是仿真 teacher 结果；真实 cube picking 28/30 对无触觉 11/30 属于单手。物体变化表现混合。**“去除部分特权状态”不能改写为 reference-free 或真实双手工具—工件验证。**

### 预测监督、世界模型与早十月空间基线

- **ME-Dex 1.0**（3.2–3.4；4.1；Tables 1–3、5；4.4；5）：工程化 canonical hand regions/masks 联合建模视频、触觉和动作。Table 1 observed/zero current touch 的 Random 为 91.92/91.74%；Table 2 Clean→Random 也将当前触觉置零；单训练 seed，真实部署为定性结果。**预测触觉监督收益不自动证明在线 tactile feedback 必要，也不是未见传感器迁移。**
- **DexTouch-WM**（III-A–D；IV-A/C/D/E；Figure 4；Tables I–V）：initial observations + future 67-D pose trajectory 条件化预测；人机共享 320-taxel 布局。固定 5 小时机器人数据、加入人类数据后 contact prediction 改善，但 synthetic substitution 在部分真实任务明显退化。**候选未来动作条件的 world model、surrogate evaluator 和 policy/data-augmentation utility 应分开；不是独立部署策略。**
- **UVTA**（III-B；IV-A–D；V-A/B；Table 1；Figure 5）：人机触觉压缩/对齐到 glove-region scalar，并采用 embodiment normalization。Table 1 的 70/29 与无 future-touch 的 42 是 stage-wise partial-credit score；每任务 10 trials。评价输出为右臂右手，虽然硬件有双臂；触觉预测 head 不进入控制。**保留预测辅助目标基线，避免把得分/双臂硬件改写为双手成功率。**
- **ContactWorld**（III-B/C；IV-B/E；V-A/B；VI；Tables II/III/VIII–X）：有 latent-size/planning-cost 控制、3 seeds、episode-disjoint 和 same-GelSight 对照；触觉并非一律有益。真实 TacFF 是 depth/marker-displacement proxy，不是 calibrated 3D force；部分平台比较改变 sensor，各硬件分别训练；goal observation 来自 held-out demonstration 的未来观测。**区分几何/模态信息、未来目标、硬件变化和结构本身。** 原标题/作者表与当前版本不同，采用 v3 metadata，未沿用项目页旧 BibTeX。
- **SimpleTouch**（3.2–3.4；Tables 1–4、9–12；Appendices A/C/D.2–4/E/F）：冻结 pretrained T3，任务级训练 VLA/tactile expert；future-touch 分支仅训练期使用。主 insertion 比较的 SimpleTouch 25-action refresh 与 vision baseline 50 不同；matched 25-action ablation 更适合归因。**无需额外 tactile-policy pretraining 不等于无需 encoder/VLA 预训练；匹配反馈周期。** 单夹爪光学触觉，无 topology/sensor-transfer 证据。
- **VISTA**（3.1–3.4、4.1–4.3；Tables 1–2；Appendices A.6–10）：spherical fusion 使用当前末端 orientation，等变假设是所选 finite groups 下 robot/object/sensor 的共同 workspace rotation。部分广义 baselines 的 tactile streams/group 不同；受控 fusion ablation 更有解释性。一个训练 seed；真实 100 demonstrations/task、10 held-out trials/task，22/30 总成功；10 Hz action playback 不等于 0.6–0.8 s observation refresh。**有限群空间结构不是任意 tactile rotation 或 contact-topology 泛化。**

### 模式、风险与有效评价

- **CADeT**（PDF pp.3–11，III–VII/Table I；pp.14–17，VIII–IX/Table V）：视觉 proxy/target response + physical probing 推断 Coupled/Decoupled/Blocked 与 GP Jacobian；150 仿真 trials 隐去 mode truth，149 正确；信息引导与随机探测共享其余设置，额外探测数 6.7±1.1 对 15.5±4.1。双臂 dVRK 的 phantom/ex-vivo 证据为正面补充，但先有 nominal calibration、有限预定义 modes；GP covariance 不沿 MPC horizon 传播。**这是可观测传递模式的正面例子，不能概括其整体缺失；也没有严格 topology OOD、概率校准或 measured force/strain safety guarantee。**
- **CALIPER**（PDF pp.3–6，3–5/Tables 1–3；pp.8–9，Appendices A/B）：冻结 encoder 与同 PCA/readout budget，用 calibration swap、随机表征与 random-direction removal 检查物理推断。Clean scene 可掩盖 nuisance 下的差异；任务是固定 contact type/object category 的仿真与 one-step speed choice。**先检查干预是否实际改变目标、是否有 trivial floors；不等于闭环控制或 topology transfer。**
- **RATE**（III-A–C/equations 3–6；IV-A/D；Tables I–III）：LSTM 历史与 training-only future/alert 辅助目标；部署 RGB/proprioception/触觉历史。“bilateral”是一个平行夹爪的两枚传感器。CSSR=safe successes/successes，用 deformation proxy；确切逐任务 alert 构造未定位。**报告分母、所有 trials 的失败/不安全结果与 label provenance，不能把 risk training 写成已校准概率或力安全保证。**

## 4. 结论与研究计划如何改变

1. 不再把 cross-hand tactile representation 或 observation-grounded transmission-mode inference 整体描述为空白。已有正面证据分布在人类离线表示、真实 handover 控制和视觉传递模式推断。
2. 更窄的待证联合主张是：**部署可观测的机器人跨界面载荷推断 + 独立物理标签 + 等预算结构对照 + 明确定义的接触参与者/边结构迁移**。
3. 保留手递手基准优先级，但加入 causal force-history/compliance、cross-hand completion、dense fusion、geometry-local contact shaping、goal-conditioned world model 和 pose-conditioned equivariance。
4. 同时匹配 encoder/data/model/history、未来动作或 goal access、观察刷新和 open-loop action horizon。闭环收益、预测精度、synthetic-data utility 分开评价。
5. 单列 phase proxy/independent wrench、graded score/binary success、conditional safe-success/all-trial outcome、mode entropy/calibration。历史 **0/30** 不扩大分母、不外推。

## 5. 观察名单与版本待复核（不计入 105 条）

### 只完成 primary metadata/abstract 的待审读候选

以下条目没有被用于本轮正文的研究结果主张：

- [PSR](https://arxiv.org/abs/2609.21753)，Sep18：待核验 force 模态、层次预测和匹配预算。
- [Object-centric Tactile Interactive Perception](https://arxiv.org/abs/2609.33235)，Sep27：待核验探索成本、属性监督和对象划分。
- [ZeroTouch](https://arxiv.org/abs/2609.21726)，Sep18：待核验训练触觉/部署视觉、重力来源及 wrench 标签。
- [TACIT](https://arxiv.org/abs/2609.24507)，Sep21：待核验 contact-target 来源、空间泛化与 matched controls。
- [TacOT](https://arxiv.org/abs/2610.04363)，Oct3：待核验触觉对应、时间对齐与迁移单元。
- [AgenticTactileVLA](https://arxiv.org/abs/2610.04391)，Oct3：摘要写 finger position/motor effort，不应按标题直接编码为 tactile-array 输入。
- [PEARS](https://arxiv.org/abs/2610.08784)，Oct6：待核验力边界、在线预算、安全代理与独立留出评价。
- [GOTT](https://arxiv.org/abs/2610.03861)，Oct2；[Shake to Learn](https://arxiv.org/abs/2609.20970)，Sep17：待进一步全文审读。

### 相邻研究 / 未满足本轮整合条件

- [WorldContact](https://arxiv.org/abs/2609.19600)：方法/实验已读；主要输入为仿真 mesh state/材料拓扑/未来动作，真实提升比较还增加了训练轨迹数。保留为仿真结构邻近项，尚不纳入本轮 deployable tactile synthesis；不可当作 matched-data 表示优越性。
- [GraphPoint](https://arxiv.org/abs/2609.18358)：固定 actor–patient–target attention chain，semantic task composition 不能改写为 contact-topology transfer；相邻视觉策略观察项。
- [Identifying Habit, Physics, and Nuisance](https://arxiv.org/abs/2609.09210)：通用 intervention/world-model 方法已检查；本轮优先整合更直接的接触/表示研究，未将其作为额外 corpus 条目。
- [FOCI Policy](https://arxiv.org/abs/2609.08743)：对象交互/pose依赖，连续接触覆盖有限；venue claim 仍为作者声明，保留邻近项。
- [Biomimetic Cues](https://doi.org/10.1145/3848631)：机构记录提示 Sep23 出版，但全文/主要页面无法读取；在全文复核前不纳入。
- **VT-MUSE，原有条目**：[官方记录](https://arxiv.org/abs/2608.21290) 显示 v2 Sep17、v3 Oct6。当前 v3 全文获取未成功，无法做版本差异审读；原结论保留旧版证据，未升级 metadata/作者列表或重复计数。

### 排除/不作为窗口内新增

- [BayesContact](https://arxiv.org/abs/2607.16123)：v1 Jul17、v2 Jul28，无已验证窗口内版本事件；不作为本轮新增。
- [ChainSplat](https://arxiv.org/abs/2608.28570) 与 [Bridging Semantics and Physics](https://arxiv.org/abs/2608.29379)：分别 Aug28、Aug29 首发，早于本轮首发窗口。
- [TacGELLO](https://arxiv.org/abs/2610.05583)：摘要为 teleoperation feedback interface，未找到与本综述直接相关的 representation-learning 贡献，本轮排除。
- TactiDex 已在清单；RealDexUMI、Touch G.O.G. 首发早于窗口且未建立窗口内事件，不重复/新增计数。EMG bricklaying handover 为周边输入类型且日期/全文未核验，不纳入。
- 社交媒体、新闻、项目页、未核验投稿/接收声明仅作发现线索，不作独立 study record。

## 6. 检索来源、查询与限制

- 权威全文与元数据：arXiv version histories、官方 HTML/PDF；版本和日期来自原始记录，不从 ID 编号、网页爬取日期或聚合器 updated 字段推断。
- 查询系列：`bimanual tactile dexterous manipulation September 2026 arxiv`；`handover tactile load transfer robot September 2026 paper`；`tactile benchmark dataset September 2026 arxiv`；`cooperative tool workpiece manipulation September 2026 robot`；`site:arxiv.org/abs/2609 bimanual tactile handover`；`site:arxiv.org/abs/2610 bimanual tactile manipulation`。另组合 tactile/visuotactile representation/foundation/control、graph/object-centric/contact/physics/causal/uncertainty 与 September/October 2026，及新作参考文献前向追踪、精确题名/作者的官方来源复核。
- 使用 [September cs.RO列表第一页](https://arxiv.org/list/cs.RO/2026-09?show=2000&skip=0)、[第二页](https://arxiv.org/list/cs.RO/2026-09?show=2000&skip=2000)、[October列表](https://arxiv.org/list/cs.RO/2026-10?show=2000&skip=0) 做题名过滤，August列表作边界检查。列表包含 cross-list；未逐条人工审查全部题名，不报告为独立文献筛查总量。词筛也会漏掉无显著关键词的相关研究。
- 既有结构论文的 arXiv histories 已检查：PhysGraph、MeshPriorDiT、CoToGrasp、Semantic Contact Fields、Contact-Anchored Policies、One-Shot Physical Interactions 未发现窗口内新版本；这不等于对每个代码仓库和 venue 的全面状态审计。
- 公开 artifact 端点的可访问性不等于数据完整性、许可或可运行性验证。未运行研究代码，也未复现实验；网页不可读取时不声称已读。

## 7. 归档、校验与再生成

- 当前 105 条；状态分布 **49 peer-reviewed、8 accepted/programme-listed、47 preprint/author-claim、1 community resource**。14 条新增均在 preprint/author-claim 档；同时修正 TactiDex 的 tier：原始状态为作者页声明接收，应归 author-claim，而非独立已接收证据。其他历史标签不冒充新一轮完整 venue audit。
- 主题数量：core 15、bimanual/handover 26、tactile representation 25、graph/physics/contact 20、tool/workpiece 9、datasets/benchmarks 10。
- `referenced/fulltext_audits.tsv` 的 14 行保留审读日期、版本、定位证据及六轴审读覆盖；生成器优先使用这些覆盖，`evidence_matrix.csv` 可重复生成。历史30精标、cards、XLSX未改变。
- 当前有 **100 个 PDF URL、5 个 source-only**。这不是“100 份已下载/已验证”。8 月记录的 86 份 PDF/checksums/download_results 保留为历史快照。
- 本轮实际核验 **3 份新 PDF**：CALIPER、CADeT、DemoMimic；文件头、大小、SHA-256 与文本提取通过，见 [独立记录](2026-10-07_selected_pdf_checks.json)。另外 11 篇新增记录通过官方 HTML 全文审读。未运行全量下载或 `-RequireLocalPdfs`；没有第三方 PDF 进入 Git。
- 正文已整合本轮科学结论后再更新 freeze；详细构建/回归结果随 PR 验证记录提供。
