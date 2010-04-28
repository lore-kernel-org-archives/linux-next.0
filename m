From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging-next tree with the v4l-dvb
 tree
Date: Wed, 28 Apr 2010 16:07:49 +1000
Message-ID: <20100428160749.52da847a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__28_Apr_2010_16_07_49_+1000_XyLI3oR4tupeTerq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56489 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754247Ab0D1GIC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Apr 2010 02:08:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wouter Van Rooy <wouter.vanrooy@gmail.com>, Mauro Carvalho Chehab <mchehab@infradead.org>

--Signature=_Wed__28_Apr_2010_16_07_49_+1000_XyLI3oR4tupeTerq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging-next tree got a conflict in
drivers/staging/cx25821/cx25821-alsa.c between commit
4e0c923a0d23f86c7331b32bc2aeb280e10e029e ("V4L/DVB: Staging: cx25821: fix
coding style issues in cx25821-alsa.c") from the v4l-dvb tree and commit
98a178beaaf4c9a0acc4815807be51425b91f0a7 ("Staging: cx25821 fixed C99
comments, white spaces and unnecessary braces") from the staging-next
tree.

I used the v4l-dvb versions of the conflicting bits (they looked neater
to me).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__28_Apr_2010_16_07_49_+1000_XyLI3oR4tupeTerq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvX0LUACgkQjjKRsyhoI8xdmQCgt5bWuw0nb0NmYmVGqG9X/Qmk
gkUAn0wYLEHwMDAvnrpQ+snYmZnGH7RW
=rEkx
-----END PGP SIGNATURE-----

--Signature=_Wed__28_Apr_2010_16_07_49_+1000_XyLI3oR4tupeTerq--
