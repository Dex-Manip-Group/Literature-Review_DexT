# 2026-11-18 targeted revision and publication-status check

Scope: 24 purposively selected arXiv histories checked on 18 November UTC. Read the latest public history returned by the official endpoint to search for versions since the 4 November search, and checked against versioned archive pins. Tactus is a backlog correction: v3 arrived before the 4 November update, but the archive was still pinned to v2. No inference about unselected works or freshness of cached histories, and no exhaustive proceedings or publication check. Exact HTML article text was normalized and compared, supplemented by exact-version PDF textual inspection; this is not a pixel/figure diff, supplementary media audit or replication. None is a new study.

| Existing record | arXiv ID | Archive URL pin before this pass | Highest version returned | UTC submission time of highest version |
| --- | --- | --- | --- | --- |
| T-Rex | [2606.17055](https://arxiv.org/abs/2606.17055) | unversioned | v2 | Thu, 18 Jun 2026 20:58:46 UTC |
| TAMEn | [2604.07335](https://arxiv.org/abs/2604.07335) | unversioned | v1 | Wed, 8 Apr 2026 17:49:35 UTC |
| ViTacFormer | [2506.15953](https://arxiv.org/abs/2506.15953) | unversioned | v2 | Wed, 13 May 2026 00:42:26 UTC |
| FTP-1 | [2606.13102](https://arxiv.org/abs/2606.13102) | v4 | v4 | Tue, 27 Oct 2026 07:32:30 UTC |
| HiTac-WAM | [2608.19574](https://arxiv.org/abs/2608.19574) | unversioned | v1 | Thu, 20 Aug 2026 02:28:25 UTC |
| VT-MUSE | [2608.21290](https://arxiv.org/abs/2608.21290) | v4 | v4 | Tue, 3 Nov 2026 11:44:10 UTC |
| Active-Contact-Handover | [2605.04610](https://arxiv.org/abs/2605.04610) | unversioned | v1 | Wed, 6 May 2026 07:59:02 UTC |
| TouchScale | [2610.10288](https://arxiv.org/abs/2610.10288) | v3 | v3 | Mon, 2 Nov 2026 03:29:54 UTC |
| ForeTac | [2610.18118](https://arxiv.org/abs/2610.18118) | v2 | v2 | Tue, 20 Oct 2026 10:22:41 UTC |
| Keeping-Contact | [2610.36961](https://arxiv.org/abs/2610.36961) | v1 | v1 | Tue, 27 Oct 2026 10:19:27 UTC |
| PhysLadder | [2610.34527](https://arxiv.org/abs/2610.34527) | v3 | v3 | Tue, 3 Nov 2026 15:20:16 UTC |
| FLoRe | [2610.35862](https://arxiv.org/abs/2610.35862) | v1 | v1 | Mon, 26 Oct 2026 17:59:11 UTC |
| PanoTac | [2611.03520](https://arxiv.org/abs/2611.03520) | v1 | v1 | Mon, 2 Nov 2026 17:55:07 UTC |
| TacMind | [2611.00455](https://arxiv.org/abs/2611.00455) | v1 | v1 | Fri, 30 Oct 2026 23:13:52 UTC |
| AcrossDEX | [2610.40210](https://arxiv.org/abs/2610.40210) | v1 | v1 | Thu, 29 Oct 2026 14:56:30 UTC |
| TacO-Sensor-Benchmark | [2605.21976](https://arxiv.org/abs/2605.21976) | v2 | v2 | Thu, 29 Oct 2026 20:58:11 UTC |
| Tactus | [2610.39076](https://arxiv.org/abs/2610.39076) | v2 | v3 | Wed, 4 Nov 2026 00:59:31 UTC |
| TF2-Steering | [2611.01483](https://arxiv.org/abs/2611.01483) | v1 | v1 | Sun, 1 Nov 2026 03:15:09 UTC |
| DexArena | [2611.02629](https://arxiv.org/abs/2611.02629) | v2 | v2 | Tue, 3 Nov 2026 07:18:38 UTC |
| ForceLDM | [2611.03294](https://arxiv.org/abs/2611.03294) | v1 | v1 | Mon, 2 Nov 2026 15:31:54 UTC |
| ReContact | [2611.02968](https://arxiv.org/abs/2611.02968) | v1 | v1 | Mon, 2 Nov 2026 11:36:51 UTC |
| DexHOT | [2611.05119](https://arxiv.org/abs/2611.05119) | v1 | v2 | Fri, 6 Nov 2026 03:26:11 UTC |
| RoboTryOn | [2611.05163](https://arxiv.org/abs/2611.05163) | v1 | v3 | Thu, 5 Nov 2026 06:56:59 UTC |
| ReflexArc | [2611.04424](https://arxiv.org/abs/2611.04424) | v1 | v1 | Tue, 3 Nov 2026 07:10:52 UTC |

## Exact-version changes

- **Tactus [v2](https://arxiv.org/html/2610.39076v2) → [v3](https://arxiv.org/html/2610.39076v3), 4 November 00:59:31 UTC (archive backlog).** Normalized article text differs only in the correction of co-first author Sai Dhanooshi Marri to Sai Dhanoosh Marri. No scientific change located. Update the exact-version pin without adding to the novelty count.
- **RoboTryOn [v1](https://arxiv.org/html/2611.05163v1) → [v2](https://arxiv.org/html/2611.05163v2), 4 November 15:43:46 UTC (after last scan) → [v3](https://arxiv.org/html/2611.05163v3), 5 November 06:56:59 UTC.** v2 changes Minyoung Kim's affiliation to Korea University and relocates headings/pagination; normalized article text shows no v2→v3 difference, and extracted PDF text differs only in the version/date stamp. No located method, task-score or experimental changes; keep previous metric cautions. Update exact-version pin.
- **DexHOT [v1](https://arxiv.org/html/2611.05119v1) → [v2](https://arxiv.org/html/2611.05119v2), 6 November 03:26:11 UTC.** Author block and acknowledgments updated; author project link added. In §IV-C Eq. (9) the greedy planner's candidate set changes from configuration pool excluding final target to entire pool. The preceding direct-target branch for a distance at most the nominal step and the argmin constraints remain unchanged, so do not infer a different empirical result. Main reported metrics 73.1% over 120 objects in the evaluation pool and 61.5% over 200 physical transfers remain unchanged. Update exact-version pin; distinguish held-out object from contact-topology transfer.
- **ForceLDM:** Official [NeurIPS 2026 poster page](https://neurips.cc/virtual/2026/poster/156065) matches exact paper title and authors, is linked by [conference downloads](https://neurips.cc/Downloads/2026), and links to [OpenReview](https://openreview.net/forum?id=0j9L12vSKx). Recommend status “NeurIPS 2026 poster; official program verified 2026-11-18; proceedings not verified.” Existing arXiv v1 and methods/statistics are unaffected. Use “program” in the status string to retain the repository's correct program-listed coding.
- **T-Rex:** The [5 November Panasonic partner press release](https://news.panasonic.com/global/press/en261105-2) announces the existing CoRL-program paper and reiterates result numbers. The author release is neither a new arXiv version nor a proceedings record; official arXiv history returns v2 (18 June). Keep the existing record and conference-program status. No new evidence unit.
- **Keeping Contact**, **TFM4IL**, **Visuotactile-DP-Aux:** Targeted venue/DOI/title queries did not independently verify publisher/proceedings or program status for their RA-L/SII 2027/ICCSSE 2026 claims. Retain author-report caveats; this is not evidence that a venue entry does not exist.

## Exact version sources retrieved

| Exact arXiv PDF | SHA-256 of retrieved bytes |
| --- | --- |
| [2610.39076v2](https://arxiv.org/pdf/2610.39076v2) | `0a81add6a5e316591a6514b704b2f122736a230de037ffbea690ac21bac53b82` |
| [2610.39076v3](https://arxiv.org/pdf/2610.39076v3) | `318900c1065cc05eae689f2a52c0f6e8c2d6be826c6bf71716ffafbde75fef29` |
| [2611.05119v1](https://arxiv.org/pdf/2611.05119v1) | `5a2e4a9cd9119e09a213860e844d8e6783c03f015f2e694c251c6472a2aa997d` |
| [2611.05119v2](https://arxiv.org/pdf/2611.05119v2) | `a57fa0ac27a5da640500a4a9b295c68ccab5ced3f09cc763fafec70ba16e2798` |
| [2611.05163v1](https://arxiv.org/pdf/2611.05163v1) | `6b41a14881663fce655108a78cbc6fc73fa436607081a822d58dc8830ae0a3be` |
| [2611.05163v2](https://arxiv.org/pdf/2611.05163v2) | `2e74efa111dc1b1c831479123d3d42d28d048cccc6cc092a17c55dec2de1386e` |
| [2611.05163v3](https://arxiv.org/pdf/2611.05163v3) | `fc3e7e416e924b25ee3751dd864e883eaf325d8140d69d0c59ef317f958c56c9` |

## Newly admitted version check

WiTac [v1](https://arxiv.org/html/2611.21057v1) (16 November) to [v2](https://arxiv.org/html/2611.21057v2) (17 November): normalized text extracted from exact HTML changed only in the visible arXiv version/date banner. This does not certify figures, supplementary materials, or source-byte identity. The ledger uses v2 and counts one study.
