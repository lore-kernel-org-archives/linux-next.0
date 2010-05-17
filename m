From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the usb tree
Date: Mon, 17 May 2010 16:09:58 +1000
Message-ID: <20100517160958.b5208a24.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__17_May_2010_16_09_58_+1000_bD1CeZzwTOMvuUZ."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47271 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751742Ab0EQGKG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 May 2010 02:10:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>

--Signature=_Mon__17_May_2010_16_09_58_+1000_bD1CeZzwTOMvuUZ.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the usb tree, today's linux-next build (powerpc
ppc44x_defconfig) produced this warning:

drivers/usb/core/usb.c:596: warning: 'match_device' defined but not used

Introduced by commit c8a3789b05e2ed43d8fd98934edbf66587cd3f96 ("USB:
remove usb_find_device") which removed the last user of this function.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__17_May_2010_16_09_58_+1000_bD1CeZzwTOMvuUZ.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvw3bYACgkQjjKRsyhoI8zZDgCgtBapz7oA071W9D2Q5MYwvFzm
TfcAniNtnoPWrTzj8VmbE3w81I4qjPIM
=z4bt
-----END PGP SIGNATURE-----

--Signature=_Mon__17_May_2010_16_09_58_+1000_bD1CeZzwTOMvuUZ.--
