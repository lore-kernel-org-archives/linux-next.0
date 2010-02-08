From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the arm tree
Date: Mon, 8 Feb 2010 15:48:40 +1100
Message-ID: <20100208154840.a58f46ad.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__8_Feb_2010_15_48_40_+1100_NBl9lrMUzHqiFDPV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42575 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754346Ab0BHEsp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Feb 2010 23:48:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <daniel@caiaq.de>, Ben Dooks <ben-linux@fluff.org>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Mon__8_Feb_2010_15_48_40_+1100_NBl9lrMUzHqiFDPV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
arch/arm/plat-s5pc1xx/irq.c between commit
be97162d47b2e067f9d21097650f2f0405dacc9f ("ARM: S5PC1XX: Use common UART
IRQ handling code") from the arm tree and commit
ba5584a307a1166597fbbe970ffdf49c8b7ee42a ("tree-wide: Assorted spelling
fixes") from the trivial tree.

The former removes the comment updated by the latter.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__8_Feb_2010_15_48_40_+1100_NBl9lrMUzHqiFDPV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktvl6gACgkQjjKRsyhoI8xCQACfbvtVPDj1a4JBQv7qcBJNgu49
7HYAnjVkmFeVdg/Mkr8aFKDOCqAFuUeh
=W26U
-----END PGP SIGNATURE-----

--Signature=_Mon__8_Feb_2010_15_48_40_+1100_NBl9lrMUzHqiFDPV--
