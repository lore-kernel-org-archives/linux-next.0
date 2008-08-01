From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci-current tree
Date: Fri, 1 Aug 2008 10:22:45 +1000
Message-ID: <20080801102245.2c25f666.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__1_Aug_2008_10_22_45_+1000_XkB7uJ5zF0vB3i/t"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52948 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751586AbYHAAWx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Jul 2008 20:22:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Prarit Bhargava <prarit@redhat.com>

--Signature=_Fri__1_Aug_2008_10_22_45_+1000_XkB7uJ5zF0vB3i/t
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next merge of the pci-current tree got a conflict in
arch/x86/kernel/pci-gart_64.c between commit
7968531880c89b3c987e6a7a0d33eafb0962d8d9 ("Revert "Merge branch
'x86/iommu' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip into
for-linus"") from the linux-next tree and commit
074ec1727196c4a2ba2f909902d55ec5014e50c3 ("PCI: GART iommu alignment
fixes") from the pci-current tree.

This is, of course caused by my revert of the iommu_num_pages patches.  I
fixed it up as best I could.=20
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__1_Aug_2008_10_22_45_+1000_XkB7uJ5zF0vB3i/t
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiSV1UACgkQjjKRsyhoI8xe7gCfVh8+rrnPqRH9DcIq8i1L9EaN
9wUAoKGsE7vZmbkHGLKEEAS771nSEZ8h
=NAkf
-----END PGP SIGNATURE-----

--Signature=_Fri__1_Aug_2008_10_22_45_+1000_XkB7uJ5zF0vB3i/t--
