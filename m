From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the arm-current
 tree
Date: Fri, 30 Jan 2015 09:58:45 +1100
Message-ID: <20150130095845.260bd804@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7yayCsKf_kk1lzWlKidhVGa"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45405 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751213AbbA2W6w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Jan 2015 17:58:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

--Sig_/7yayCsKf_kk1lzWlKidhVGa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
arch/arm/mm/dma-mapping.c between commit c2273a185354 ("ARM: 8288/1:
dma-mapping: don't detach devices without an IOMMU during teardown")
from the arm-current tree and commit eab8d6530cc0 ("arm: dma-mapping:
Set DMA IOMMU ops in arm_iommu_attach_device()") from the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mm/dma-mapping.c
index f142ddd6c40a,a673c7f7e208..000000000000
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@@ -2025,10 -2048,7 +2048,10 @@@ static void arm_teardown_iommu_dma_ops(
  {
  	struct dma_iommu_mapping *mapping =3D dev->archdata.mapping;
 =20
 +	if (!mapping)
 +		return;
 +
- 	arm_iommu_detach_device(dev);
+ 	__arm_iommu_detach_device(dev);
  	arm_iommu_release_mapping(mapping);
  }
 =20

--Sig_/7yayCsKf_kk1lzWlKidhVGa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUyrsqAAoJEMDTa8Ir7ZwVDqgP/0S5On3nqu5eN362AWG5Hdg5
LQDaM4b6uorzBbM+pE61d5bYPT9sIW44aZNV9CYS/5ZkIgUQvJAWF5GMOHIhcEj7
o1QuCz2108BVs6ERYI3iJBlfmfOu50NGtQSwy99+H1DQ3MY8SpEvgwYXyDONldVZ
Jhibd58UiSWa94L0hg/b9U3fIp1EVKAf1x/MU023Sn4WK9Cu6i0dn4y4a+l4fTgB
4JNz/OYihnyCKGma9GI3LTlS0SVtlvqPPijk50R2PhG4xU3jlPSqNfRv04QJK+L+
eJvYAPp8pjBxYhKu3F61G6gVzKlGnQQ2BYaACbjaLTH4E4Q2GVixHmbq8aWI9aWY
Kd/svyQNuTdGfdam+mtzGXtd7UdJKbotNL3UXeiJXitKXdK1BPdKUi/2XB+mNJs6
wIC9fjDWrGW784XVd2GXZBHHuQdI+HrdUyVtdnC1Wl7IVfpBVmqGSsP/bn/fGkke
C9QiIXqtRjEI8k7sOQpH3mJWF4lQGgZdRFQ1XMRVErlLzjhxIc1dlNxi2aA9Yfl4
P7vpUGFyvQHbAeCAaeK/DS0A+LqsOaO7RAqt+0x+AtQg36NVyWT3fCZ2rIinM5Ja
3Yv1NDJTeXmTYnwk+J1OL05XKvImA1jd8aNbX2cJvA7PxGoC9/nwFEpGxljw3gUq
HQJaLmxALjIQwr3wJRpH
=cUS8
-----END PGP SIGNATURE-----

--Sig_/7yayCsKf_kk1lzWlKidhVGa--
