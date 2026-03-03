# URLLC研究现状（聚焦硬件损伤条件下的CF-mMIMO系统）

## 与本文研究直接相关的URLLC研究现状分析

### 1. CF-mMIMO系统中URLLC的理论基础与研究挑战

在CF-mMIMO系统中，URLLC研究已取得显著进展，但针对硬件损伤条件下的研究仍存在重要空白。Zhang等[one1]考虑了下行多设备CF-mMIMO系统的硬截止时间约束，利用瞬时评估指标刻画通信的时延和可靠性，为硬件损伤条件下的性能评估提供了方法论参考。Huang等[one2]研究了CF-mMIMO辅助的短包通信URLLC系统，推导了系统的错误概率和可达速率表达式，但其研究基于理想硬件假设，未能充分考虑功率放大器非线性等硬件损伤的影响。

CF-mMIMO中大量用户设备和多天线接入点的接入使资源管理复杂化，URLLC约束进一步增加了系统设计的复杂度[one3]。特别地，硬件损伤（如功率放大器非线性、低分辨率ADC量化噪声）会显著劣化系统性能，但在现有URLLC研究中往往被忽略或简化处理。

### 2. 有限块长理论在URLLC中的应用

Polyanskiy在有限块长体制下推导了系统的近似可达速率[two1]，该理论为URLLC短包传输提供了重要理论基础。研究表明，在有限块长传输条件下，传统香农容量理论不再适用，需要建立新的性能评估框架[one4]。这一理论对于分析硬件损伤条件下的URLLC性能尤为重要，因为硬件损伤会进一步压缩系统的有效信干噪比，加剧有限块长带来的速率损失。

### 3. 传统优化算法的局限性

传统资源分配方法在URLLC场景下面临严峻挑战。Nasir等[one5]开发的路径跟踪算法和Peng等[one6]提出的迭代优化方法虽然理论上具有优异性能，但其高昂的计算复杂度难以满足URLLC毫秒级时延要求。更重要的是，这些基于模型的优化方法难以有效处理硬件损伤引入的非线性失真和时变特性。

### 4. 智能算法在URLLC资源分配中的进展

近年来，深度学习技术在CF-mMIMO系统资源分配中展现出独特优势。Huang等[one7]提出了深度强化学习方法用于优化功率分配策略，可获得比传统算法更高的能量效率。Yan等[one8]开发了神经网络辅助的功率控制算法，大幅减少了计算时间。Salaün和Yang[one9]利用卷积神经网络处理信道矩阵，预测功率分配策略。

然而，现有智能算法研究存在以下局限性：首先，大多数研究基于理想硬件假设，未能充分考虑硬件损伤的影响；其次，传统DRL方法难以有效捕获用户间复杂的干扰耦合关系；第三，缺乏针对有限块长传输特性的专门优化。

### 5. 研究空白与本文贡献

综合分析现有研究，在CF-mMIMO系统URLLC资源分配方面存在以下重要研究空白：

1. **硬件损伤建模不足**：现有URLLC研究大多基于理想硬件假设，缺乏对功率放大器非线性、ADC量化噪声等硬件损伤的系统性建模与分析。

2. **有限块长与硬件损伤的耦合影响**：未能充分考虑有限块长传输特性与硬件损伤的联合影响机制，缺乏相应的性能分析框架。

3. **智能算法的适应性局限**：现有DRL方法难以有效处理硬件损伤导致的非线性失真和时变信道条件。

4. **图结构表征的缺失**：缺乏利用图神经网络建模用户间干扰拓扑关系的方法，限制了智能算法的表征能力。

本文针对上述研究空白，重点研究非理想硬件条件下CF-mMIMO系统的URLLC资源分配问题，通过建立精确的硬件损伤模型、推导有限块长下的性能表达式、设计GNN-DRL融合的智能优化算法，为实际工程部署提供完整的理论框架与技术方案。

---

**引用说明：**
- [one1]-[one9]：对应论文1中的引用
- [two1]：对应论文2中的引用
- 引用编号经过筛选，仅保留与本文研究直接相关的内容

[one5] Y. Gu, C. She, S. Bi, Z. Quan, and B. Vucetic, “Graph neural
network for distributed beamforming and power control in massive
URLLC networks,” IEEE Trans. Wireless Commun., vol. 23, no. 8,
pp. 9099–9112, Aug. 2024.

[one14] L. U. Khan et al., “Federated learning for edge networks: Resource
optimization and incentive mechanism,” IEEE Commun. Mag., vol. 58,
no. 10, pp. 88–93, Oct. 2020.

[one15] Y. LeCun, Y. Bengio, and G. Hinton, “Deep learning,” Nature, vol. 521,
no. 7553, pp. 436–444, 2015.
[one16]H. Sun, X. Chen, Q. Shi, M. Hong, X. Fu, and N. D. Sidiropoulos,
“Learning to optimize: Training deep neural networks for interference
management,” IEEE Trans. Signal. Process., vol. 66, no. 20,
pp. 5438–5453, Oct. 2018.
[one17]R. Sun, N. Cheng, C. Li, F. Chen, and W. Chen, “Knowledge-driven
deep learning paradigms for wireless network optimization in 6G,” IEEE
Netw., vol. 38, no. 2, pp. 70–78, Mar. 2024.
[one18]F. Liang, C. Shen, W. Yu, and F. Wu, “Towards optimal power control
via ensembling deep neural networks,” IEEE Trans. Commun., vol. 68,
no. 3, pp. 1760–1776, Mar. 2020.
[one19]W. Lee and R. Schober, “Deep learning-based resource allocation
for device-to-device communication,” IEEE Trans. Wireless Commun.,
vol. 21, no. 7, pp. 5235–5250, Jul. 2022.
[one20]A. R. Barron, “Universal approximation bounds for superpositions
of a sigmoidal function,” IEEE Trans. Inf. Theory., vol. 39, no. 3,
pp. 930–945, May 1993.
[one21]R. Dong, C. She, W. Hardjawana, Y. Li, and B. Vucetic, “Deep learning
for radio resource allocation with diverse quality-of-service requirements
in 5G,” IEEE Trans. Wireless Commun., vol. 20, no. 4, pp. 2309–2324,
Apr. 2021.