From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mtd tree with the  tree
Date: Thu, 3 Dec 2009 12:15:33 +1100
Message-ID: <20091203121533.f9de2dac.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Dec_2009_12_15_33_+1100_GRGYM43z9SmxFu51"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54701 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752871AbZLCBPf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Dec 2009 20:15:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

--Signature=_Thu__3_Dec_2009_12_15_33_+1100_GRGYM43z9SmxFu51
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the mtd tree got a conflict in
drivers/mtd/nand/excite_nandflash.c between commit
9e910a91b88d450951c849d12598645562acc4b2 ("MIPS: eXcite: Remove
platform") from the mips tree and commit
8fead79c96c68164372c47c7b3c79d2da0871c93 ("mtd: move excite_nand_remove
to .devexit.text") from the mtd tree.

The former just removed the file, so I did that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Dec_2009_12_15_33_+1100_GRGYM43z9SmxFu51
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksXETUACgkQjjKRsyhoI8xijgCcCy1W91xAbdXMnWRsZ+0ikWcE
gOwAoKpDurf4hCALMH0hAJKJ84SGcb2q
=C6tn
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Dec_2009_12_15_33_+1100_GRGYM43z9SmxFu51--
