From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: dwmw2-iommu tree build failure
Date: Wed, 15 Jul 2009 14:01:16 +1000
Message-ID: <20090715140116.c2ce8fde.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__15_Jul_2009_14_01_16_+1000_1dByRbfzTkmPxLIZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39001 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1749667AbZGOEBV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Jul 2009 00:01:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__15_Jul_2009_14_01_16_+1000_1dByRbfzTkmPxLIZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/pci/intel-iommu.c: In function 'dmar_init_reserved_ranges':
drivers/pci/intel-iommu.c:1323: error: 'struct iova_domain' has no member n=
amed 'iova_alloc_lock'

Caused by commit b25c32b0af7045d3837c44d9685358aeeb9b7ac8 ("intel-iommu:
Remove superfluous iova_alloc_lock from IOVA code").

I have used the verion of the dwmw2-iommu tree from next-20090714 for
today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__15_Jul_2009_14_01_16_+1000_1dByRbfzTkmPxLIZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpdVIwACgkQjjKRsyhoI8ztPgCfRaIU/3SgPQoofma33vNtcMeC
6VoAoLVkYndUmYES6Uydfw0QbKUBcpKG
=3a5e
-----END PGP SIGNATURE-----

--Signature=_Wed__15_Jul_2009_14_01_16_+1000_1dByRbfzTkmPxLIZ--
