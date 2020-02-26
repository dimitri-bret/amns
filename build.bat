cls

:: set your project folder here
set PROJECTNAME=C:\Users\Dimitri\Documents\amns


:: clean source and bench libs
echo "removing libs"
vdel -lib %PROJECTNAME%\lib\source -all
vdel -lib %PROJECTNAME%\lib\bench -all


:: create source and bench libs
echo "creating work libs"
vlib %PROJECTNAME%\lib\source
vmap source %PROJECTNAME%\lib\source
vlib %PROJECTNAME%\lib\bench
vmap bench %PROJECTNAME%\lib\bench
vlib %PROJECTNAME%\lib\AMNSLibrary
vmap AMNSLibrary %PROJECTNAME%\lib\AMNSLibrary

:: compile libs 
echo "compile vhdl libs"
vcom %PROJECTNAME%\sources\amns_definition_package.vhd -work AMNSLibrary

echo "compile vhdl sources"
::vcom -work source %PROJECTNAME%\sources\add_pe.vhd
vcom -work source %PROJECTNAME%\sources\mult64_pe.vhd
vcom -work source %PROJECTNAME%\sources\mult128_2_pe.vhd
vcom -work source %PROJECTNAME%\sources\multiplexer_pe.vhd




echo "compile vhdl test bench"
::vcom -work bench %PROJECTNAME%\bench\add_pe_tb.vhd    
vcom -work bench %PROJECTNAME%\bench\mult64_pe_tb.vhd
vcom -work bench %PROJECTNAME%\bench\mult128_2_pe_tb.vhd 
vcom -work bench %PROJECTNAME%\bench\multiplexer_pe_tb.vhd



         




