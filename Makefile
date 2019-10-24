.PHONY: all install clean

all:
	cd /gitroot/myresty/build/LuaJIT-2.1-20190228 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_ENABLE_GC64 -msse4.2' CC=cc PREFIX=/usr/local/myresty/luajit
	cd /gitroot/myresty/build/lua-cjson-2.1.0.7 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/gitroot/myresty/build/luajit-root/usr/local/myresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/myresty/lualib LUA_MODULE_DIR=/usr/local/myresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /gitroot/myresty/build/lua-resty-signal-0.02 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/gitroot/myresty/build/luajit-root/usr/local/myresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/myresty/lualib CC=cc
	cd /gitroot/myresty/build/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/gitroot/myresty/build/luajit-root/usr/local/myresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/myresty/lualib CC=cc
	cd /gitroot/myresty/build/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/gitroot/myresty/build/luajit-root/usr/local/myresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/myresty/lualib CC=cc
	cd /gitroot/myresty/build/nginx-1.15.8 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/myresty/
	-cp /gitroot/myresty/COPYRIGHT $(DESTDIR)/usr/local/myresty/
	cd /gitroot/myresty/build/LuaJIT-2.1-20190228 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_ENABLE_GC64 -msse4.2' CC=cc PREFIX=/usr/local/myresty/luajit DESTDIR=$(DESTDIR)
	cd /gitroot/myresty/build/lua-cjson-2.1.0.7 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/gitroot/myresty/build/luajit-root/usr/local/myresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/myresty/lualib LUA_MODULE_DIR=/usr/local/myresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /gitroot/myresty/build/lua-resty-signal-0.02 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/gitroot/myresty/build/luajit-root/usr/local/myresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/myresty/lualib CC=cc
	cd /gitroot/myresty/build/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/gitroot/myresty/build/luajit-root/usr/local/myresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/myresty/lualib CC=cc
	cd /gitroot/myresty/build/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/gitroot/myresty/build/luajit-root/usr/local/myresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/myresty/lualib CC=cc
	cd /gitroot/myresty/build/lua-resty-dns-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/lua-resty-memcached-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/lua-resty-redis-0.27 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/lua-resty-mysql-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/lua-resty-string-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/lua-resty-upload-0.10 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/lua-resty-websocket-0.07 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/lua-resty-lock-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/lua-resty-lrucache-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/lua-resty-core-0.1.16 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/lua-resty-upstream-healthcheck-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/lua-resty-limit-traffic-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/lua-resty-shell-0.02 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/lua-tablepool-0.01 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/myresty/lualib INSTALL=/gitroot/myresty/build/install
	cd /gitroot/myresty/build/opm-0.0.5 && /gitroot/myresty/build/install bin/* $(DESTDIR)/usr/local/myresty/bin/
	cd /gitroot/myresty/build/resty-cli-0.23 && /gitroot/myresty/build/install bin/* $(DESTDIR)/usr/local/myresty/bin/
	cp /gitroot/myresty/build/resty.index $(DESTDIR)/usr/local/myresty/
	cp -r /gitroot/myresty/build/pod $(DESTDIR)/usr/local/myresty/
	cd /gitroot/myresty/build/nginx-1.15.8 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/myresty/site/lualib $(DESTDIR)/usr/local/myresty/site/pod $(DESTDIR)/usr/local/myresty/site/manifest
	ln -sf /usr/local/myresty/nginx/sbin/nginx $(DESTDIR)/usr/local/myresty/bin/openresty

clean:
	rm -rf build
