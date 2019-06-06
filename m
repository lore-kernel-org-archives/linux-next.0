From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hwmon-staging tree with Linus' tree
Date: Thu, 6 Jun 2019 10:25:06 +1000
Message-ID: <20190606102506.1c282b9f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=VdmdnMjiu6kW+BZHgPX0gx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "amy.shih" <amy.shih@advantech.com.tw>
List-Id: linux-next.vger.kernel.org

--Sig_/=VdmdnMjiu6kW+BZHgPX0gx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hwmon-staging tree got a conflict in:

  drivers/hwmon/nct7904.c

between commit:

  c942fddf8793 ("treewide: Replace GPLv2 boilerplate/reference with SPDX - =
rule 157")

from Linus' tree and commit:

  7394ec51cf51 ("hwmon: (nct7904) Fix the incorrect value of tcpu_mask in n=
ct7904_data struct.")

from the hwmon-staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/hwmon/nct7904.c
index 58a957445484,91d1eb822707..000000000000
--- a/drivers/hwmon/nct7904.c
+++ b/drivers/hwmon/nct7904.c
@@@ -4,6 -3,19 +4,9 @@@
   *
   * Copyright (c) 2015 Kontron
   * Author: Vadim V. Vlasov <vvlasov@dev.rtsoft.ru>
+  *
+  * Copyright (c) 2019 Advantech
+  * Author: Amy.Shih <amy.shih@advantech.com.tw>
 - *
 - * This program is free software; you can redistribute it and/or modify
 - * it under the terms of the GNU General Public License as published by
 - * the Free Software Foundation; either version 2 of the License, or
 - * (at your option) any later version.
 - *
 - * This program is distributed in the hope that it will be useful,
 - * but WITHOUT ANY WARRANTY; without even the implied warranty of
 - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 - * GNU General Public License for more details.
   */
 =20
  #include <linux/module.h>

--Sig_/=VdmdnMjiu6kW+BZHgPX0gx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz4XWIACgkQAVBC80lX
0Gyn7ggAgW2GKvePdG00SrnsyWfR0jx3d3zKPZkOGy6F7qxnC/gJoWTorUl3u5ub
WBjCnardgQZCTLuThWNO7atZQLGSCdV3uv9UT7XB1otqZ2ty45f8w5wG5x9N2QA4
oeoPpz6KssKpswEXTT5t78pzSjFb2mAlKWGjzLEG3ucxjpTV20F9gQpPS5HV/YZ4
E3iK0TtSwIu6qIHz7vdZU/6Lky4AVhK3kkuJvUo4R51XPqwTmmm8qg3/4NMmkcjC
Ej+5Xn9to1Kjz52T2WXLhUFCwjdHUVvQpVyx7Ye+OMciJB3iWbNVlehEu5+gWY37
/rDzZglL38r6U9Dyt2zj2BuArHEQPQ==
=05w+
-----END PGP SIGNATURE-----

--Sig_/=VdmdnMjiu6kW+BZHgPX0gx--
