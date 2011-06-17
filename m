From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-lpae tree with the arm tree
Date: Fri, 17 Jun 2011 10:26:37 +1000
Message-ID: <20110617102637.7868bc00.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__17_Jun_2011_10_26_37_+1000_.lXH=Qe.A49iM+YO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52464 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753397Ab1FQA0q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jun 2011 20:26:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

--Signature=_Fri__17_Jun_2011_10_26_37_+1000_.lXH=Qe.A49iM+YO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

Today's linux-next merge of the arm-lpae tree got a conflict in
arch/arm/mm/dma-mapping.c between commit 8f5d638883e0 ("ARM: DMA: steal
memory for DMA coherent mappings") from the arm tree and commit
7b550c77c248 ("ARM: LPAE: Use PMD_(SHIFT|SIZE|MASK) instead of PGDIR_*")
from the arm-lpae tree.

The former has removed all the references to the PGDIR_* macros from this
file, so I used that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__17_Jun_2011_10_26_37_+1000_.lXH=Qe.A49iM+YO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN+p89AAoJEDMEi1NhKgbsVdMH/0llyONsqPNl0In/sZZKMjr1
e74x6UkcwaMaFU+GGZBmE6IAmwqM0zYHYgFq+04p72ddNVDRbup2ziQtudiq430+
5ukPQHekBqMml8ZCc9NbcWi/fYeRtCeBF5inBcQ9iRN+vnqiqsZNwIrDPgsIepon
U2zhFdqqhTkv8h/rAslGdXH7WhH74NyJkm6YyJvzrQKNk30hhOaMMMpevEaL4GkZ
61jBkitsztXuxbXpGmj+RryTeV0fPlQmClabvX7+Bnyz97fXbzSwqjF85aFFOO99
zutdLezPYPWtjGBDJ7V53co1HaND/FtBCHzkLBp5eVGuEXlBrh8B+/VpJ92kpxc=
=tvSv
-----END PGP SIGNATURE-----

--Signature=_Fri__17_Jun_2011_10_26_37_+1000_.lXH=Qe.A49iM+YO--
