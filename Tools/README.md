Install GHDL Ubuntu:

	$ sudo apt-get update
	$ sudo add-apt-repository ppa:pgavin/ghdl
	$ sudo apt-get install ghdl

Install VHDL package to Sublime text editor:

	Download and Installation to Sublime Control:

		https://packagecontrol.io/installation

	After Include Package VHDL:
		
		Open Sublime > Preferences > Package Control > Search "Install Package" > (wait) > Search "VHDL"

-----------------------------------------------------------------------------------------------------------------

Use GHDL Ubuntu:

	Inside the folder with the VHDL files, first, you have to compile the file; this is called analysis of a design file in VHDL terms.

		$ ghdl -a file_name.vhdl

	This command generates a file 'file_name.o', which is the object file corresponding to your VHDL program.  This command also creates or updates a file 'work-obj93.cf', which describes the library 'work'.



	Then, you have to build an executable file:

		$ ghdl -e entity_name

	The '-e' option means elaborate. With this option, GHDL creates code in order to elab-orate a design, with the 'hello' entity at the top of the hierarchy. 



	The result is an executable program called 'file_name' which can be run:

		$ ghdl -r entity_name

			or directly:

		$ ./entity_name
