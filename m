From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the firmware tree
Date: Mon, 30 Jun 2008 19:17:28 +1000
Message-ID: <20080630191728.7a410c27.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_19_17_28_+1000_ztNr+GX9WlAXe83c"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38116 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753994AbYF3JRd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 05:17:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__30_Jun_2008_19_17_28_+1000_ztNr+GX9WlAXe83c
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the firmware tree got a trivial conflict in
drivers/media/dvb/ttpci/Makefile between commit
4575147abb81e7a333f9e38068524e16cf84df30 ("V4L/DVB (8142): ttpci:
tda827x.h is at drivers/media/common") from the v4l-dvb tree and commit
3e1205c15ac97d8056aba3b078aae6eca2647947 ("Remove fdump tool for av7110
firmware") from the firmware tree.

Overlapping add/remove. Fixed up and I can carry it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Jun_2008_19_17_28_+1000_ztNr+GX9WlAXe83c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhopKgACgkQjjKRsyhoI8zWjACgjbtWMaVtFuWWta8k9CxHRm4Q
85UAniXOZiRUCWUf9C5ZY42tocT4tWOS
=5+5f
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_19_17_28_+1000_ztNr+GX9WlAXe83c--
