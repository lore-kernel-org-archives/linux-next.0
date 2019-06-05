From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the hwmon-fixes tree
Date: Thu, 6 Jun 2019 08:30:34 +1000
Message-ID: <20190606083034.196219f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/m0o70mjk2qUo7JMK./TCke/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alexander Sverdlin <alexander.sverdlin@nokia.com>
List-Id: linux-next.vger.kernel.org

--Sig_/m0o70mjk2qUo7JMK./TCke/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

After merging the hwmon-fixes tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

In file included from include/linux/notifier.h:14,
                 from arch/x86/include/asm/uprobes.h:13,
                 from include/linux/uprobes.h:49,
                 from include/linux/mm_types.h:14,
                 from include/linux/mmzone.h:21,
                 from include/linux/gfp.h:6,
                 from include/linux/xarray.h:14,
                 from include/linux/radix-tree.h:18,
                 from include/linux/fs.h:15,
                 from include/linux/debugfs.h:15,
                 from drivers/hwmon/pmbus/pmbus_core.c:9:
drivers/hwmon/pmbus/pmbus_core.c: In function 'pmbus_set_samples':
drivers/hwmon/pmbus/pmbus_core.c:1975:14: error: 'data' undeclared (first u=
se in this function); did you mean '_data'?
  mutex_lock(&data->update_lock);
              ^~~~
include/linux/mutex.h:166:44: note: in definition of macro 'mutex_lock'
 #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                            ^~~~
drivers/hwmon/pmbus/pmbus_core.c:1975:14: note: each undeclared identifier =
is reported only once for each function it appears in
  mutex_lock(&data->update_lock);
              ^~~~
include/linux/mutex.h:166:44: note: in definition of macro 'mutex_lock'
 #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                            ^~~~

Caused by commit

  8d719d6f3e97 ("hwmon: (pmbus/core) mutex_lock write in pmbus_set_samples")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/m0o70mjk2qUo7JMK./TCke/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz4QooACgkQAVBC80lX
0GySfQgAkiwS8dok8dNR3tdhI222YRvfJ+hSHENnT7bHokekA14PlpW6Nskfb13B
1uRx31U7RUHssowIB+PueZyaBnfJuPx1DpI0wwyhB+I5NRFoL9ixsRmJNUmLoxDf
rtWmTNIY+J8S8nCd5Qt573kXNMG6i1uUISe/RVVnNJ/lCEtsoX/Nwlx2FRYGjSjI
kj7QgToOYRPd/D44HHEXVO+GdRCn0JEhsL7NevmqJ67o3iBwL4x8SwN6ZIgHTIFS
FPMcdahwLGgA9eF20ISRbilYS8TnUrxNy9Rjhi+hN47V9E59XZhUCrTR6gwTRGkh
7Ic6tgWDCTJuqmKPV/VPW8WhzFWu0g==
=hq3o
-----END PGP SIGNATURE-----

--Sig_/m0o70mjk2qUo7JMK./TCke/--
