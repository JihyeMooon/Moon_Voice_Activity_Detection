# Jihye Moon's Voice Activity Detection Study in 2015-2016
## Motivation
In 2014-2016, I have worked as an undergraduate researcher for [speech pathology detection projects](https://github.com/JihyeMooon/Speech-Analysis-Software).
One of my main works was developing robust eldery people's voice activity detection.

In 2015, the most popular method for voice activity detection was pitch-based end-point determination. Pitch computation commonly relied on the [Autocorrelation function (ACF)](https://www.isca-archive.org/interspeech_2010/ghaemmaghami10_interspeech.pdf) and Average Magnitude Difference Function (AMDF) methods. However, time-series speech relied on ACF and AMDF to compute Pitch for not only voiced sounds but also unvoiced sounds. 

For speech pathology detection, capturing voiced sounds produced from vocal cords is crucial. Elderly people's speech contains various unvoiced sounds, making it significant to develop **voice activity detection algorithms robust to unvoiced sounds for more accurate pathology detection within the elderly population**.

I have worked on [Higher Order Differential Energy Operators(HODEO)](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=404130) for desgin novel voice activity detection algorithms. 
Through this work, I have delved deeply into speech signal processing and experimented with various voice activity detection algorithms from scratch! 

## Source Code
This Github provides ACF, AMDF, and HODEO-based voice activity detection codes.

> Put your data (data.wav) and run 'Moon_2016_Scratch_Voice_Activity_Detection.m'

## Results
![image](https://github.com/JihyeMooon/Moon_Voice_Activity_Detection/assets/112595759/1e817bba-94b9-4870-9005-9931b887fae2)

We found that the HODEO-based Voice Activity Detection (VAD) approach might be better suited for the elderly population compared to ACF and AMDF-based methods. However, since I had access to only a limited amount of elderly speech data, further validation would necessitate the use of various datasets with appropriate ground truths.

Please feel free to contact me at husky.jihye.moon@gmail.com if you are interested in! :) 

