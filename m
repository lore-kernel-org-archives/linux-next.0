From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the mfd tree
Date: Tue, 23 Aug 2011 13:56:19 +1000
Message-ID: <20110823135619.be8b64d2eec7cb78bc0160a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__23_Aug_2011_13_56_19_+1000_4VkZMSAtywa7rCfn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35379 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752530Ab1HWD42 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Aug 2011 23:56:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

--Signature=_Tue__23_Aug_2011_13_56_19_+1000_4VkZMSAtywa7rCfn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in
drivers/mfd/twl4030-irq.c between commit 99efe0d4c992 ("mfd: Drop the
twl4030-irq kthread") from the mfd tree and commit febab68efa45
("freezer: don't unnecessarily set PF_NOFREEZE explicitly") from the pm
tree.

The former dropped the code modified by the latter, so I did that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__23_Aug_2011_13_56_19_+1000_4VkZMSAtywa7rCfn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOUyTjAAoJEDMEi1NhKgbsemgH/jvpixloInqCPJUzDMeU5A+h
IBPjIx49ho48Pk2amIUeHIYxXyNgb1nPvkhaV2iqdFzNvR1CRKFHTzfjxYiT+RN6
R+jsNCz3xwh8dhZIQFO9ckFZ8C2bmbp28+OvuXisGFpYPcZnvSurLD1FTijZLE7D
xpRNiPTq2ScIUH1ak6Ahh5c46DMTNmNtsay0YxKzL/HWkKUNpk8F0X2+/FVSW6G2
PNChosG+MFNVBxL5+4ukp0ZGa/BNhmiHYvaSWjgg4tTkEF641Brur8/CuznOmX64
KYAJcb1k2cRjMa0/47h7TUDKWPBHuzFmCo7RTBjak+QJ+GGiWGbE04bycdrK24M=
=6plt
-----END PGP SIGNATURE-----

--Signature=_Tue__23_Aug_2011_13_56_19_+1000_4VkZMSAtywa7rCfn--
