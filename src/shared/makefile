include settings.mk

################################################################################

filename = lib$(1).so

define compile_bin
	gcc $(CFLAGS) -shared -o "$@" $^ $(LIBDIRS:%=-L%) $(RUNDIRS:%=-Wl,-rpath,%) $(LIBS:%=-l%)
endef

define compile_objs
	gcc $(CFLAGS) -fPIC -c -o "$@" $< $(IDIRS:%=-I%)
endef

################################################################################

include ../compilation.mk

################################################################################

include ../testing.mk

################################################################################

include ../installation.mk
