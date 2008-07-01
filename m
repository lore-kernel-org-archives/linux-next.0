From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Wed, 2 Jul 2008 00:04:15 +1000
Message-ID: <20080702000415.c51b7838.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__2_Jul_2008_00_04_15_+1000_=RO=KOaPTNxpMI/o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58884 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753800AbYGAOES (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 10:04:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

--Signature=_Wed__2_Jul_2008_00_04_15_+1000_=RO=KOaPTNxpMI/o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/whiteheat.c between commit
018a04cf1bff6e940600f1b65a147607f10d3a47 ("whiteheat: use request_firmware
()") from the firmware tree and commit
70f8e6e2b768df1105eea0a8ebf33527de9eae34 ("24-whiteheat-coding-style")
from the ttydev tree.

I basically took the firmware tree's version.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__2_Jul_2008_00_04_15_+1000_=RO=KOaPTNxpMI/o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqOV8ACgkQjjKRsyhoI8wUTwCgvnS4H1szUNk55od127XjgV+9
FbIAoK18Gm95n0YgHOjnRvW+nqF2edOJ
=5yAp
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Jul_2008_00_04_15_+1000_=RO=KOaPTNxpMI/o--
