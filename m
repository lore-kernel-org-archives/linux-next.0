From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the irqchip tree with Linus' tree
Date: Mon, 16 Mar 2015 14:47:27 +1100
Message-ID: <20150316144727.488070cb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+O/89lq1T.jvFzuRcfs/7o/"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52184 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750914AbbCPDrf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Mar 2015 23:47:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marc Zyngier <marc.zyngier@arm.com>

--Sig_/+O/89lq1T.jvFzuRcfs/7o/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

Today's linux-next merge of the irqchip tree got a conflict in
arch/arm/mach-exynos/suspend.c between commit ace283a04a4a ("ARM:
EXYNOS: Fix wrong hwirq of RTC interrupt for Exynos3250 SoC") from
Linus' tree and commit be42c9ea7b5f ("ARM: exynos4/5: convert pmu
wakeup to stacked domains") from the irqchip tree.

I fixed it up (I just randomly chose to use the irqchip tree version)
and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/+O/89lq1T.jvFzuRcfs/7o/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVBlJUAAoJEMDTa8Ir7ZwVdZEP/2tAa01GJazO83zReEiKfxH8
LNdJuo0ULGQG/GDGKQ7WOSdpmWwhS0DlqhCJminpycwpAdrMXyK9j9bOCTUrv4mN
CQoDwPqlS3d35CVtcPgzAJLNywuKETBmCfwzYULYwANOknlLvhE3+FLmkrajRby7
Tmuh1UczEGe5r2MfwYRzgqBDf5lblhYVKh+g8HdwVUnXSfmAoTE9jFBowLXph+1+
uRVV8Rm3JjN4hdeoT9KRJJbSw2vNvkj1/IguTRr9LODyzsiOS9WCQMYaQC7N/SV6
h3aEdp+lXjp6+Y9knFCcLW3gaJJZ9tdiwxVjQkiKPuSf8TpDCy4OP5J4y+m5lO+a
KGmHaLC39mUkFKPRojJT+lGqbJJ/6xLQD9PytLAx6Y7jnQfHd37RMRYQS6cmwk+s
g6ZbmYGHwF5sicvk1IgnP5Y1Axu61dx12kgPy4qVnvln3nRpt1fXyIgyGmdk/7IE
Wo3+SG0yw/ap4kI28X4/83k7FIix9KGyEhgQaHdGoyGoBWZofBMBRuE8XgxBk+8b
DCZB7ovo51qeNfjCEEmbh0J8ZKoBSTSyWaOzXS+MKPuTT21aaFR3SNsrp/yf1KPL
zFZDJqCRNJInkLPGOS5vFluXi4dviyaP6PFJxh8VT+uorJlxQONhOmcKD15+rvQK
jWQFpPRuNW3MTvb03Fe3
=NWay
-----END PGP SIGNATURE-----

--Sig_/+O/89lq1T.jvFzuRcfs/7o/--
