From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree
Date: Mon, 30 Jun 2008 14:49:04 +1000
Message-ID: <20080630144904.5178a024.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_14_49_04_+1000_aEqg8ockNRO4wgNE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46013 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751509AbYF3EtL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 00:49:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Devin Heitmueller <devin.heitmueller@gmail.com>

--Signature=_Mon__30_Jun_2008_14_49_04_+1000_aEqg8ockNRO4wgNE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a trivial conflict in
drivers/media/video/em28xx/em28xx-cards.c between commit
b38cc642000f0a262db367ffb95cd02ca2ead59b (V4L/DVB (8011): em28xx: enable
DVB for HVR-900"") from Linus' tree (which also exists in the dvb-v4l
tree) and commit bcb323c2fc5555307589386bffc58abd2a397661 ("V4L/DVB
(8006): em28xx: Split HVR900 into two separate entries") from the v4l-dvb
tree.

Same comments as the other conflict.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Jun_2008_14_49_04_+1000_aEqg8ockNRO4wgNE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhoZcAACgkQjjKRsyhoI8xfRgCfX3uGl8Fde/T2/3uJZCGr4R3j
zP0An0rZ2M347FXVLLHo5EvPo1g569OJ
=Qe9v
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_14_49_04_+1000_aEqg8ockNRO4wgNE--
