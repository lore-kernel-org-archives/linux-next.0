From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: powercp-next build failure
Date: Thu, 15 May 2008 14:59:13 +1000
Message-ID: <20080515145913.5436adb9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__15_May_2008_14_59_13_+1000_GwRe1pIpjZ1T=AYL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35034 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751514AbYEOE7U (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 May 2008 00:59:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>
Cc: linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org, Olaf Hering <olaf@aepfle.de>, David Miller <davem@davemloft.net>

--Signature=_Thu__15_May_2008_14_59_13_+1000_GwRe1pIpjZ1T=AYL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next build (sparc64 defconfig) fails like this:

drivers/of/device.c: In function `modalias_show':
drivers/of/device.c:66: error: implicit declaration of function `of_device_=
get_modalias'

Caused by commit 140b932f8cb6cced10b96860651a198b1b89cbb9 ("[POWERPC]
Create modalias file in sysfs for of_platform bus") from the powerpc-next
tree as there is a definition and declaration of of_device_get_modalias
only for powerpc.  I reverted that commit for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__15_May_2008_14_59_13_+1000_GwRe1pIpjZ1T=AYL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIK8MmTgG2atn1QN8RAu4rAJ0QGvs4Yt8IvHqOeV7Z69ZqdHsjaACeNWYH
sbIM8bntnRcfv+yuYDaQdmU=
=UEL/
-----END PGP SIGNATURE-----

--Signature=_Thu__15_May_2008_14_59_13_+1000_GwRe1pIpjZ1T=AYL--
