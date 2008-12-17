From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build warnings
Date: Wed, 17 Dec 2008 18:22:24 +1100
Message-ID: <20081217182224.a7f20a12.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__17_Dec_2008_18_22_24_+1100_FGaC0ONLxFXflL5p"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39381 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751393AbYLQHWh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2008 02:22:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Steve Glendinning <steve.glendinning@smsc.com>, Yaniv Rosner <yanivr@broadcom.com>, Eilong Greenstein <eilong@broadcom.com>

--Signature=_Wed__17_Dec_2008_18_22_24_+1100_FGaC0ONLxFXflL5p
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

In file included from drivers/net/bnx2x_main.c:58:
drivers/net/bnx2x_link.h:30:1: warning: "FLOW_CTRL_TX" redefined
In file included from drivers/net/bnx2x_main.c:40:
include/linux/mii.h:139:1: warning: this is the location of the previous de=
finition
In file included from drivers/net/bnx2x_main.c:58:
drivers/net/bnx2x_link.h:31:1: warning: "FLOW_CTRL_RX" redefined
In file included from drivers/net/bnx2x_main.c:40:
include/linux/mii.h:140:1: warning: this is the location of the previous de=
finition

Caused by commit e18ce3465477502108187c6c08b6423fb784a313 ("net: Move flow =
control definitions to mii.h").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__17_Dec_2008_18_22_24_+1100_FGaC0ONLxFXflL5p
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklIqLAACgkQjjKRsyhoI8zT/wCeOwQpoKNtq5dnBGy06vUhQ0+p
yQEAn1QhcKSsg5KZzLpYkHzrlqreCMMI
=mAn+
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Dec_2008_18_22_24_+1100_FGaC0ONLxFXflL5p--
