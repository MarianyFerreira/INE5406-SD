-- Hello world program.

-- Imports the standard textio package.
use std.textio.all;

entity hello_world is
-- Defines a design entity, without any ports.
end hello_world;


architecture behaviour of hello_world is

	begin
		process
			variable l : line;
				begin
					write (l, String'("Hello world!"));
					writeline (output, l);
					wait;
		end process;
	
	end behaviour;