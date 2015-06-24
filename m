From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the modules tree
Date: Wed, 24 Jun 2015 11:37:27 +1000
Message-ID: <20150624113727.4f61ba18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cx2GwdIjQWA0b8xLc2CAH0A"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58600 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752352AbbFXBhd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Jun 2015 21:37:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Streetman <ddstreet@ieee.org>

--Sig_/cx2GwdIjQWA0b8xLc2CAH0A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

After merging the modules tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/linkage.h:4:0,
                 from include/linux/kernel.h:6,
                 from kernel/params.c:18:
kernel/params.c: In function 'param_array':
kernel/params.c:32:42: error: dereferencing pointer to incomplete type
 #define KPARAM_MUTEX(mod) ((mod) ? &(mod)->param_lock : &param_lock)
                                          ^
include/linux/compiler.h:164:42: note: in definition of macro 'unlikely'
 # define unlikely(x) __builtin_expect(!!(x), 0)
                                          ^
kernel/params.c:462:3: note: in expansion of macro 'BUG_ON'
   BUG_ON(!KPARAM_IS_LOCKED(mod));
   ^
kernel/params.c:33:47: note: in expansion of macro 'KPARAM_MUTEX'
 #define KPARAM_IS_LOCKED(mod) mutex_is_locked(KPARAM_MUTEX(mod))
                                               ^
kernel/params.c:462:11: note: in expansion of macro 'KPARAM_IS_LOCKED'
   BUG_ON(!KPARAM_IS_LOCKED(mod));
           ^
kernel/params.c: In function 'param_array_get':
kernel/params.c:32:42: error: dereferencing pointer to incomplete type
 #define KPARAM_MUTEX(mod) ((mod) ? &(mod)->param_lock : &param_lock)
                                          ^
include/linux/compiler.h:164:42: note: in definition of macro 'unlikely'
 # define unlikely(x) __builtin_expect(!!(x), 0)
                                          ^
kernel/params.c:499:3: note: in expansion of macro 'BUG_ON'
   BUG_ON(!KPARAM_IS_LOCKED(p.mod));
   ^
kernel/params.c:33:47: note: in expansion of macro 'KPARAM_MUTEX'
 #define KPARAM_IS_LOCKED(mod) mutex_is_locked(KPARAM_MUTEX(mod))
                                               ^
kernel/params.c:499:11: note: in expansion of macro 'KPARAM_IS_LOCKED'
   BUG_ON(!KPARAM_IS_LOCKED(p.mod));
           ^
In file included from include/linux/notifier.h:13:0,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:789,
                 from include/linux/gfp.h:5,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from kernel/params.c:21:
kernel/params.c: In function 'kernel_param_lock':
kernel/params.c:32:42: error: dereferencing pointer to incomplete type
 #define KPARAM_MUTEX(mod) ((mod) ? &(mod)->param_lock : &param_lock)
                                          ^
include/linux/mutex.h:146:44: note: in definition of macro 'mutex_lock'
 #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                            ^
kernel/params.c:621:13: note: in expansion of macro 'KPARAM_MUTEX'
  mutex_lock(KPARAM_MUTEX(mod));
             ^
kernel/params.c: In function 'kernel_param_unlock':
kernel/params.c:32:42: error: dereferencing pointer to incomplete type
 #define KPARAM_MUTEX(mod) ((mod) ? &(mod)->param_lock : &param_lock)
                                          ^
kernel/params.c:626:15: note: in expansion of macro 'KPARAM_MUTEX'
  mutex_unlock(KPARAM_MUTEX(mod));
               ^

Caused by commit b51d23e4e9fe ("module: add per-module param_lock").

I am not exactly sure why this fails to build.  It may be an
interaction with some other change.

I have used the modules tree from next-20150623 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/cx2GwdIjQWA0b8xLc2CAH0A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVignbAAoJEMDTa8Ir7ZwVwD4P/RuZUnrsSLnlZW9qR/1V8Jwf
YIp/68NSR64B5RhG8ZqKuTS12iMO2hpPtsAYnoW4OGQV30bD78TEmlvR5qQvcVqI
oHrq/WsJWNQudQtNIF9wsMtzFR57qNHEF4PXNRTVVSF7BhdE2gVU/kbA9IqI4J7G
t/zk/cKxNzumRiFlHi917FBwJucIrq7IckpJnXD6fhuyHopg0cfjqfXogpe+yB6C
hES9kGnq13DuzkKVglgD85QV1MCanl/I31vVVnH9ZDzP8OB/lF+VZIo+Rbfwi/D5
4dYZeme/4eG2lKYbxWzAT875RJagIei0oqb+k1YE4uS8kryqTsM/8URNRdvbP/cE
r51BEbLdLv2K6HGHO2oNWXaKh0+MgH/Et02MFy7y7frwdvyuGWrVSraDp0N9iczJ
SgBle0ouW6vJRwfRBC6V0Pj4uTeHPB5oMlPkDgVy3Aj/5OzwOwGg8Dn6OTK8DtK2
rztXeLHTXD/kpFw/FWxxBt74p9X6krsprp8sfOBl2/Fm/sZ07DEb8q2DgZSJIWVG
AK95nmrkPhfbG4VchcpWmcRHCbAXcixOPw1NbTwfL6GmF2/gBzKsCAIM5rVR7voP
BPwNqEJoOYTaZjpGi5CA0gtop7BSCTc/cANporpCM+1nToBHwDZ3BYMoEOEpaWY0
vOTlADgxQS0Ca/MGCpq3
=7qeC
-----END PGP SIGNATURE-----

--Sig_/cx2GwdIjQWA0b8xLc2CAH0A--
