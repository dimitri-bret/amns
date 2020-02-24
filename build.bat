cls

:: set your project  folder here
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
vcom -work source %PROJECTNAME%\sources\add.vhd


echo "compile vhdl test bench"
vcom -work bench %PROJECTNAME%\bench\add_tb.vhd    
			
         




