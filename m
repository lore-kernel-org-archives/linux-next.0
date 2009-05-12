From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core tree build failure
Date: Tue, 12 May 2009 13:44:01 +1000
Message-ID: <20090512134401.a251bb22.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_May_2009_13_44_01_+1000_0E4pX4Eo9nW21XiB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34877 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752781AbZELDoI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 May 2009 23:44:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Roel Kluin <roel.kluin@gmail.com>

--Signature=_Tue__12_May_2009_13_44_01_+1000_0E4pX4Eo9nW21XiB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (powerpc_ppc64_defconfig) failed like this:

In file included from arch/powerpc/platforms/ps3/platform.h:28,
                 from arch/powerpc/platforms/ps3/mm.c:32:
arch/powerpc/include/asm/ps3.h: In function 'ps3_system_bus_set_driver_data=
':
arch/powerpc/include/asm/ps3.h:424: error: 'struct device' has no member na=
med 'driver_data'
arch/powerpc/include/asm/ps3.h: In function 'ps3_system_bus_get_driver_data=
':
arch/powerpc/include/asm/ps3.h:429: error: 'struct device' has no member na=
med 'driver_data'

Caused (obviously) by commit 9499952d8efc857406365bfc04079ff1e85660ff
("Driver core: move dev_get/set_drvdata to drivers/base/dd.c") which I
have reverted.

Grep is your friend ...  Actually there is a patch for this ...
http://patchwork.ozlabs.org/patch/27061/ ... also for another ...
http://patchwork.ozlabs.org/patch/27062/

Please leave the above commit out of the tree until you have at least
fixed all the in tree users.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_May_2009_13_44_01_+1000_0E4pX4Eo9nW21XiB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoI8IEACgkQjjKRsyhoI8xphwCeIYMgTA4vQC8uGqRLTbVdEtPB
gEgAoKVyM/kOSFWlYGy1CnivPW5I9fBZ
=UwuS
-----END PGP SIGNATURE-----

--Signature=_Tue__12_May_2009_13_44_01_+1000_0E4pX4Eo9nW21XiB--
