:: set your project  folder here
set PROJECTNAME=C:\Utilisateurs\Documents\amns


:: clean source and bench libs
echo "removing libs"
vdel -lib %PROJECTNAME%\lib\source -all
vdel -lib %PROJECTNAME%\lib\bench -all
::

:: create source and bench libs
echo "creating work libs"
vlib %PROJECTNAME%\lib\source
vmap source %PROJECTNAME%\lib\source
vlib %PROJECTNAME%\lib\bench
vmap bench %PROJECTNAME%\lib\bench
vlib %PROJECTNAME%\lib\AMNSLibrary
vmap AESLibrary %PROJECTNAME%\lib\AMNSLibrary

:: compile libs 
echo "compile vhdl libs"
vcom %PROJECTNAME%\sources\state_definition_package.vhd -work AESLibrary

echo "compile vhdl sources"

vcom -work source %PROJECTNAME%\sources\sbox.vhd




echo "compile vhdl test bench"
::vcom -work bench %PROJECTNAME%\bench\KeyExpansion_table_tb.vhd    
			
         




