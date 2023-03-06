# Title 

Macrophages number in the cochlear spiral ganglion of deafened mice  

# Background 

Most of hearing loss is caused by the degeneration of auditory sensory cells so it is important to prevent auditory sensory like hair cells and spiral ganglion cells for hearing protection. In the cochlea, hair cells, which are the primary auditory receptor cells, can detect sound (air vibrations) and transfer these mechanical signals to electrical signals. Hair cells transmit acoustic signals to spiral ganglion neurons(SGN), which process auditory signals and send them to the cortex. Several factors like noise exposure, chemical exposure and aging, can damage hair cells and cause deafening. After hair cell death, spiral ganglion neurons gradually die and the reason is unknown. The loss of hair cell can be recovered by cochlear implant which imitates hair cell function so in clinic hair cell loss is not a disaster. However, loss of spiral ganglion neurons is hard to recover, so it is significant to study the prevention of spiral ganglion neurons after hair cell loss for better hearing protection. Some researchers suppose the death of SGN is caused by the lack of electrical signals or neurotrophic signals from hair cells. However, some cues indicate that immune response might play a role. Previous studies showed some immune response genes were activated during SGN loss and suppression of immune response prevents SGN loss. Therefore, we suspected the death of spiral ganglion neurons is caused by the immune response, triggered by the initial hair cell damage. To support our hypothesis, we need to prove the presence of immune response in the cochlea after deafening(hair cell death). Presence of immune response were implied by RNA-sequencing and we also need prove that in vivo study. The immune cell, macrophages are general marker for immune response so we are interested in the macrophages number changes during SGN loss in order to support that the immune response is associated with SGN loss. If our hypothesis is correct (immune response cause SGN loss after deafening), we expect to see more macrophages in the cochlea after deafening. 

 

A former graduate student showed an increase of macrophages(immune cell) in rat model after deafening.Rat were injected with kanamycin to damage the hair cell. Cochlea were harvested and section to 25 um on slide. The cochlea sample were labaled with antibody to identify SGN and macrophages and imaging were done on confocal microscope. He did a 2 way ANOVA Turkey’s test to compare the macrophages(iba1+ cell) number between hearing rats and deaf rat. The analysis is based on macrophages density and the cochlea is separated into 4 different region for comparison, they are basial cochlea , lower middle, higher middle and apical cochlea(the cochlea has a spiral structure and neurons are located along the spirals, we category neuron according to their location on the spiral structure)  A grouped bar graph is plotted with x axis for spatial region and y axis for macrophages density. For figure C, macrophages density were compared between deaf rats and hearing rats. In base, mid 2 ,apex and all turns(sum of all region), there are more macrophages after deafening. For figure D, macrophages distribution is compared. In hearing rats, macrophages density is the same from base to apex. In rats, macrophages density is higher in apex than base and mid1. 

The data I will work on is the macrophages in mice model. We expect to see the same result like rat model. Macrophages are expected to increase in deaf mice.I did the same immunostaining like rat model but different marker for macrophages, the macrophages marker in mice is F4/80. I have the macrophage density raw data in spreadsheet. The same bar graph will be plotted in R or Phyton, 2 columns for each cochlear region(5 groups). One for deaf mice and one for hearing mice. Bars for deaf mice and hearing mice will be put next to each other. The x axis will represent region and y axis will be macrophages density(F4/80 + cell). 

 

# Materials and Methods 

## Methods 

Mice cochlea were sectioned on microscope slide and labeled with antibodies to visualize the macrophages. The images were collected from confocal microscope. 

 

Data was uploaded to GitHub repository URL: https://github.com/Zhenshen2/Data.git 

The data on the Excel sheet is processed and calculated data, not raw data. For my project, I collected at least 3 tissue sections(3 samples) from each animal. Cell numbers and the area of cochlea in mm^2 were recorded for every section. On one section, cell counting were separated to 4 groups according to location of cells. For example, one section has 4 cochlear region, base middel1, middle2 and apex so for this section I have 4 groups of cell counting. Cell density were calculated by dividing number to area for every section slide. Therefore, for each animals, I have at least 3 cell density values (3 samples) on every region and the average of these 3 values were calculated to prevent the bias. The excel shows the average of cell density for each animals. There are 2 major data groups, one is the experiment group Deaf mice and other group is control group, hearing mice. Every group has at least 5 animals. 

 

 

# Reflection 

Challenges: having trouble to edit text into markdown file and failed to put figures in md file. In nano editors, the text was messed up. 

 

# Reference  

Rahman, M.T., Bailey, E.M., Gansemer, B.M. et al. Anti-inflammatory Therapy Protects Spiral Ganglion Neurons After Aminoglycoside Antibiotic-Induced Hair Cell Loss. Neurotherapeutics (2023). https://doi.org/10.1007/s13311-022-01336-2 
