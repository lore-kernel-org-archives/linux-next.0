From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tty tree build warning
Date: Wed, 5 Aug 2009 17:16:06 +1000
Message-ID: <20090805171606.d3d3877c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Aug_2009_17_16_06_+1000_eapp_nZ8y=i.dphg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44436 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933548AbZHEHQS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Aug 2009 03:16:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

--Signature=_Wed__5_Aug_2009_17_16_06_+1000_eapp_nZ8y=i.dphg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (powerpc allyesconfig) produced this warning:

drivers/char/cyclades.c:3112: warning: initialization from incompatible poi=
nter type
drivers/char/cyclades.c:3118: warning: initialization from incompatible poi=
nter type

Introduced by commit 46075a6e64b5e4e96079ea273781a1ba366d8244
("tty-cyclades-port-close").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Aug_2009_17_16_06_+1000_eapp_nZ8y=i.dphg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkp5MbYACgkQjjKRsyhoI8xsqQCfWYZqvPEW5/IPkg+dY1HBmWrD
GnwAoJcI/fuPuCfDK1KSr6v2fnNVAmQj
=pth+
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Aug_2009_17_16_06_+1000_eapp_nZ8y=i.dphg--
