: Brisanje prethodnih datoteka poredjenja
cd OutCmp
del test_Model0_vs_Model1.txt
del test_Model1_vs_Model2.txt
del test_Model2_vs_Model3.txt

cd ..

: Pokretanje modela 0, 1 i 2
cd Debug
"ProcessWavFile_model_0.exe" "..\TestStreams\test_input.wav" "..\OutStreams\test_output_model_0.wav" 1 -6 -3 0_2_0
"ProcessWavFile_model_1.exe" "..\TestStreams\test_input.wav" "..\OutStreams\test_output_model_1.wav" 1 -6 -3 0_2_0
"ProcessWavFile_model_2.exe" "..\TestStreams\test_input.wav" "..\OutStreams\test_output_model_2.wav" 1 -6 -3 0_2_0
cd ..

cd ..
cd model3
c:\CirrusDSP\bin\cmdline_simulator.exe -project SimulatorConfigurationTemp.sbr -max_cycles 1000000
cp test_output_model_3.wav ..\ProcessWavFile\OutStreams
cd ..
cd ProcessWavFile

: Poredjenje izlaza
PCMCOMPARE OutStreams//test_output_model_0.wav OutStreams//test_output_model_1.wav 2> OutCmp//test_Model0_vs_Model1.txt
PCMCOMPARE OutStreams//test_output_model_1.wav OutStreams//test_output_model_2.wav 2> OutCmp//test_Model1_vs_Model2.txt
PCMCOMPARE OutStreams//test_output_model_2.wav OutStreams//test_output_model_3.wav 2> OutCmp//test_Model2_vs_Model3.txt

pause