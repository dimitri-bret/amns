cls

:: set your project folder here
set PROJECTNAME=C:\Users\Dimitri\Documents\amns

:: Current working directory
::set PROJECTNAME = echo %cd%

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
echo "compile libs"
vcom %PROJECTNAME%\sources\amns_definition_package.vhd -work AMNSLibrary

echo "compile sources"
::vcom -work source %PROJECTNAME%\sources\ram_1.vhd
::vcom -work source %PROJECTNAME%\sources\add_pe.vhd
::vcom -work source %PROJECTNAME%\sources\mult64_pe.vhd
::vcom -work source %PROJECTNAME%\sources\mult128_2_pe.vhd
::vcom -work source %PROJECTNAME%\sources\multiplexer_pe.vhd
::vcom -work source %PROJECTNAME%\sources\modulo_pe.vhd
::vcom -work source %PROJECTNAME%\sources\pe.vhd
::vcom -work source %PROJECTNAME%\sources\fsm_polynomial_mult.vhd
::vcom -work source %PROJECTNAME%\sources\single_register.vhd
::vcom -work source %PROJECTNAME%\sources\combined.vhd
::vcom -work source %PROJECTNAME%\sources\lambda_lookup.vhd
::vcom -work source %PROJECTNAME%\sources\counter.vhd
::vcom -work source %PROJECTNAME%\sources\fsm_polynomial_mult.vhd
::vcom -work source %PROJECTNAME%\sources\polynomial_mult.vhd
::vcom -work source %PROJECTNAME%\sources\polynomial_add.vhd
::vcom -work source %PROJECTNAME%\sources\div_phi.vhd
::vcom -work source %PROJECTNAME%\sources\amns_mult.vhd
vcom -work source %PROJECTNAME%\sources\conv_polynomial.vhd


echo "compile test bench"
::vcom -work bench %PROJECTNAME%\bench\ram_1_tb.vhd
::vcom -work bench %PROJECTNAME%\bench\add_pe_tb.vhd
::vcom -work bench %PROJECTNAME%\bench\mult64_pe_tb.vhd
::vcom -work bench %PROJECTNAME%\bench\mult128_2_pe_tb.vhd
::vcom -work bench %PROJECTNAME%\bench\multiplexer_pe_tb.vhd
::vcom -work bench %PROJECTNAME%\bench\modulo_pe_tb.vhd
::vcom -work bench %PROJECTNAME%\bench\pe_tb.vhd
::vcom -work bench %PROJECTNAME%\bench\single_register_tb.vhd
::vcom -work bench %PROJECTNAME%\bench\combined_tb.vhd
::vcom -work bench %PROJECTNAME%\bench\counter_tb.vhd
::vcom -work bench %PROJECTNAME%\bench\lambda_lookup_tb.vhd
::vcom -work bench %PROJECTNAME%\bench\polynomial_mult_tb.vhd
::vcom -work bench %PROJECTNAME%\bench\div_phi_tb.vhd
vcom -work bench %PROJECTNAME%\bench\conv_polynomial_tb.vhd
