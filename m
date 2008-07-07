From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mmc tree
Date: Tue, 8 Jul 2008 01:02:17 +1000
Message-ID: <20080708010217.02e927bd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_01_02_17_+1000_kPxElL=v_mmTRLom"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46560 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753133AbYGGPC1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 11:02:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pierre Ossman <drzeus-list@drzeus.cx>
Cc: linux-next@vger.kernel.org, Andres Salomon <dilinger@queued.net>

--Signature=_Tue__8_Jul_2008_01_02_17_+1000_kPxElL=v_mmTRLom
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pierre,

Today's linux-next merge of the mmc tree got a conflict in
drivers/mmc/host/sdhci.c between commits
e08c1694d9e2138204f2b79b73f0f159074ce2f5 ("olpc: sdhci: add quirk for the
Marvell CaFe's vdd/powerup issue") and
603ded16a308d0a7a17738c973e3c8cbcd5db7dd ("olpc: sdhci: add quirk for the
Marvell CaFe's interrupt timeout") from Linus' tree and various similar
commits from the mmc tree including one that moves the code into separate
files.

I have reverted all the commits that affect that file from the mmc tree
for today in the hope that you will merge with Linus' tree and fix up the
conflicts for tomorrow.

The commits I reverted are:

sdhci: don't check block count for progress
sdhci: move pci stuff to separate module
sdhci: handle hot-remove
sdhci: add quirk for the Marvell CaFe's vdd/powerup issue
sdhci: add quirk for the Marvell CaFe's interrupt timeout
sdhci: scatter-gather (ADMA) support
sdhci: graceful handling of bad addresses

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_01_02_17_+1000_kPxElL=v_mmTRLom
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhyL/kACgkQjjKRsyhoI8yKoACdEhPGLxjUzfbNZIWRsTKm8IcJ
jTEAnAxdwLYOK4dYItsnbliRAAy2FCOe
=stKh
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_01_02_17_+1000_kPxElL=v_mmTRLom--
