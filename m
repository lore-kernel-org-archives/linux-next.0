From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the iommu tree
Date: Mon, 29 Aug 2011 13:32:37 +1000
Message-ID: <20110829133237.80467b5d54438ace53b324df@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Aug_2011_13_32_37_+1000_5DGzXAklY+m+923x"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41898 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752316Ab1H2Dcp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Aug 2011 23:32:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>

--Signature=_Mon__29_Aug_2011_13_32_37_+1000_5DGzXAklY+m+923x
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Joerg,

After merging the iommu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/iommu/omap-iommu.c:27:24: fatal error: plat/iommu.h: No such file o=
r directory

Caused by commit fcf3a6ef4a58 ("omap: iommu/iovmm: move to dedicated
iommu folder").  Presumably building of this code should be restricted to
just some platforms only.

I have dropped the iommu tree for today (since I have no older working
version).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Aug_2011_13_32_37_+1000_5DGzXAklY+m+923x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOWwhVAAoJEDMEi1NhKgbsJ+wIAIcX8Did8JgO6PlQo+/4YshP
P+W80in6quTM4gnQkIAGGBHylFw+m9PLLW3V9edJQxuCpappqpxgDYOQ+rAI5kzT
WKFVuoNDhyHUrpumPuzhGeiwPBZFsSzMUgGKOyx50KKMwQo2YeN/eWVVafqROQMh
Tabdo5vICCAzVSp3IoSHvkMQoP2lizcXQYbdB+Pk8B9+wqZzUDr7wELc+usiOwo1
MSAkkeYP6oVvvp8vKww1j6muBc/h6nVgFZgQ094UQxHCZxKByEb27VSniHONZepJ
r0cphZVXX3ilPunp9Y8SPNsDzy/elrnOO10avtm358NF6bSZO+uy4XxCrlG/gWY=
=ex4L
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Aug_2011_13_32_37_+1000_5DGzXAklY+m+923x--
