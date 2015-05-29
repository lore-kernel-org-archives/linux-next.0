From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the usb-gadget tree
Date: Fri, 29 May 2015 18:32:13 +1000
Message-ID: <20150529183213.7db39b9b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lpu.2AQp7UA2UkuPSazPfeI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/lpu.2AQp7UA2UkuPSazPfeI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Felipe,

After merging the usb-gadget tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/module.h:17:0,
                 from drivers/usb/gadget/legacy/nokia.c:19:
drivers/usb/gadget/legacy/nokia.c: In function '__check_num_buffers':
drivers/usb/gadget/function/f_mass_storage.h:51:34: error: 'fsg_num_buffers=
' undeclared (first use in this function)
  module_param_named(num_buffers, fsg_num_buffers, uint, S_IRUGO);\
                                  ^
include/linux/moduleparam.h:387:68: note: in definition of macro '__param_c=
heck'
  static inline type __always_unused *__check_##name(void) { return(p); }
                                                                    ^
include/linux/moduleparam.h:145:2: note: in expansion of macro 'param_check=
_uint'
  param_check_##type(name, &(value));       \
  ^
drivers/usb/gadget/function/f_mass_storage.h:51:2: note: in expansion of ma=
cro 'module_param_named'
  module_param_named(num_buffers, fsg_num_buffers, uint, S_IRUGO);\
  ^
drivers/usb/gadget/legacy/nokia.c:45:1: note: in expansion of macro 'FSG_MO=
DULE_PARAMETERS'
 FSG_MODULE_PARAMETERS(/* no prefix */, fsg_mod_data);
 ^
drivers/usb/gadget/function/f_mass_storage.h:51:34: note: each undeclared i=
dentifier is reported only once for each function it appears in
  module_param_named(num_buffers, fsg_num_buffers, uint, S_IRUGO);\
                                  ^
include/linux/moduleparam.h:387:68: note: in definition of macro '__param_c=
heck'
  static inline type __always_unused *__check_##name(void) { return(p); }
                                                                    ^
include/linux/moduleparam.h:145:2: note: in expansion of macro 'param_check=
_uint'
  param_check_##type(name, &(value));       \
  ^
drivers/usb/gadget/function/f_mass_storage.h:51:2: note: in expansion of ma=
cro 'module_param_named'
  module_param_named(num_buffers, fsg_num_buffers, uint, S_IRUGO);\
  ^
drivers/usb/gadget/legacy/nokia.c:45:1: note: in expansion of macro 'FSG_MO=
DULE_PARAMETERS'
 FSG_MODULE_PARAMETERS(/* no prefix */, fsg_mod_data);
 ^
drivers/usb/gadget/legacy/nokia.c: At top level:
drivers/usb/gadget/function/f_mass_storage.h:51:34: error: 'fsg_num_buffers=
' undeclared here (not in a function)
  module_param_named(num_buffers, fsg_num_buffers, uint, S_IRUGO);\
                                  ^
include/linux/moduleparam.h:224:22: note: in definition of macro '__module_=
param_call'
      level, flags, { arg } }
                      ^
include/linux/moduleparam.h:146:2: note: in expansion of macro 'module_para=
m_cb'
  module_param_cb(name, &param_ops_##type, &value, perm);     \
  ^
drivers/usb/gadget/function/f_mass_storage.h:51:2: note: in expansion of ma=
cro 'module_param_named'
  module_param_named(num_buffers, fsg_num_buffers, uint, S_IRUGO);\
  ^
drivers/usb/gadget/legacy/nokia.c:45:1: note: in expansion of macro 'FSG_MO=
DULE_PARAMETERS'
 FSG_MODULE_PARAMETERS(/* no prefix */, fsg_mod_data);
 ^

Caused by commit e4f8ef7b0770 ("usb: gadget: nokia: Add mass storage
driver to g_nokia").

I have used the usb-gadget tree from next-20150528 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/lpu.2AQp7UA2UkuPSazPfeI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVaCQSAAoJEMDTa8Ir7ZwVX2MP/1zB36EGVbLTnOpoQYIg+G3D
MhhDQ+3iFCB908KrnLBogOoYsSwkMVTFUDc59dnd/gg9Tv/Xu7Ws8JGnoW9jFkC8
LtSpkP5mmpPLphKdszUwkSyerzMR/figwRW1Yg8qL6Z76jihjULI1f6T4PTE3yyh
i8uaUcEycYTkjdusAsGHrKsTfk5v/VKsXkm13tBMp6MGg6HdaDfJzIEH4dkErwkV
CpMITsVN0HO7/Q3Zf5GNfR1P0Zan5DTEUNob/f++tqE6pgWAMgL+4Jn3jopG+QaF
XuaEwIbPL0nlvK4+vFR9DVw4zisgDQ4aBv6uBOtoYRpJnrOqFNY8Bf7w4+l4y0Yk
1maeKgYGLvdYL8fCa7Sov5kxTGEIm6b88Z0QY+IbX0Xy5WB9DKthYJuJXz3JOmJF
2b1PQJX8vZmYYhXWzFB+Z4+RrakuATnaUT8fRgCGvoSHrTW7FHottkY0J0twDMOM
T0N5H/OA/OB+J6wGwSzDl1ZC9sSgogN78GK7TGcLVB7VdLxjke81CavVNS2YKGRb
bKwdbXsPwtB+UQGSML7sRP7phznPlEpSa+Cz2+stIYovOoam5svQCzLQBR0RMyOk
V+dlLZTBrrVNHPJrpA0P7qn7L0I6wbVyoS8/Y07YXYJAVFIDg20QmVluMqBos7mX
5YVC580dficMZLMcwOaa
=8i7N
-----END PGP SIGNATURE-----

--Sig_/lpu.2AQp7UA2UkuPSazPfeI--
