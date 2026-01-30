---
title: Browsing ARGs
---

## Exercise setup

Make a folder called arg-dashboard

    mkdir arg-dashboard

Move into the folder

    cd arg-dashboard

Initialize a pixi environment

    pixi init

Add the munch-group channel:

    pixi workspace channel add munch-group

Install the packages:

    pixi add jupyter nodejs "jupyter-server-proxy>=4,<5" argdash

Download the notebook to your folder:

    wget https://raw.githubusercontent.com/munch-group/genomic-thinking/refs/heads/master/content/exercises/arg-dashboard/arg-dashboard.ipynb


## Exercise 1

1. The *Main* panel shows a simulated graph. Click `New` to generate a new graph. Dropdown menus control the type of graph, the number of samples and the sequence length. Choose "ARG" for the simulation, a sample size of "5" and a sequence length of "2kb". 

2. Simulate a lot of ARGS. Just keep clicking `New` to see the variation of ARGS.

3. Pick and ARG with 2-3 recombination events.

4. The *Coalesce and recombination events* panel controls the number of events shown in the graph. The *Recombination points* panel shows the points of recombination in the sequence. Use the *Coalesce and recombination events* panel to reconstruct the graph step by step by moving the slider from left to right. Make sure you understand what happens at each coalescence and recombination event.

5. Use the two sliders in the *Recombination points* to retrict the view to a smaller part of the sequence. Watch what happens to the arg as you include more or fewer recombination points on the sequence.

## Exercise 2

1. Click `New` to find an ARG with 2-3 recombincombination events where some of the nodes are not red. Ancestral node colors reflect the proportion of the sequence that is represented in the ancestor. Ancestral material is the part of the sequence that has a descendants among the sampled sequences. Mouse-over a node to see the type of event and the proportion of ancestal proportion sequence at each node. 

2. Notice how mouse-over also activates the *Ancestral sequences* and *Marginal trees* panels. The *Ancestral sequences* panel shows how ancestral material is merged at coalescence events and divided at recombination events. Sequence segments separated by recombination events are shown with separate colors. The genalogy for each segment is shown in the *Marginal tree* panel with a color matching the segment. Non-ancestral segments are shown in white. Mouse-over the root node of the ARG to see all marginal trees (genealogies) for the ARG. Mouse-over other nodes to see the marginal trees below that node.

3. Use the slider in the  *Recombination points* panel to show the graph for only a subset of the sequence. Notice how this affects the shown ARG and the marginal trees when you mouse-over a node. Sequence outside the range specified in the *Recombination points* panel is shown as gray in the *Ancestral sequences* panel.

## Exercise 3

1. The marginal trees look a lot like each other. Try to understand how each one if different from its neighbor. You can make the range in the *Recombination points* slider really small so it shows only one marginal tree at a time. Now move it along the sequence to see how the ARG changes. Can you see that only one branch detaches and is moved somewhere else?

2. Some recombination events do not show up as bifurcations. This because they are followed by a coalescence event that merge the same segments back into one lineage. Simulate some args to see if you can find some of these. You can see them as two nodes on a lineage following each other. Mouse-over the recombination node to see how the sequence segments first split into two lineages and then coalesce at the following coalescence node.

## Exercise 4

1. See if you can find any nodes where non-ancestral sequence is "captured" between two ancestral (colored) segments. Figure out how the segment you found got trapped between two ancestral sequence segments.

2. See if you can find it i the SMC'. If you cannot, why do you think that is?

## Exercise 5

1. Imagine and ARG for a human chromosome - 100,000 times larger than the 2kb we are considering here.
