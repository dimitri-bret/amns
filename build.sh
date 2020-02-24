#!/bin/bash

export PROJECTNAME="."
echo "the project location is : $PROJECTNAME"
# clean source and bench libs
echo "removing libs"
vdel -lib $PROJECTNAME/lib/source -all
vdel -lib $PROJECTNAME/lib/bench -all

# create source and bench libs
echo "creating work libs"
vlib $PROJECTNAME/lib/source
vmap source $PROJECTNAME/lib/source
vlib $PROJECTNAME/lib/bench
vmap bench $PROJECTNAME/lib/bench
# map existing AESLibrary lib
vlib $PROJECTNAME/lib/AESLibrary
vmap AESLibrary $PROJECTNAME/lib/AESLibrary

# compile sources and launch the VHDL simulator
echo "compile vhdl sources"
vcom -work source $PROJECTNAME/sources/KeyExpansion_table.vhd

echo "compile vhdl test bench"
vcom -work bench $PROJECTNAME/bench/KeyExpansion_table_tb.vhd

echo "compilation finished"
echo "start simulation..."
vsim bench.keyexpansion_table_tb &



