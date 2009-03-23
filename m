From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci tree build failure
Date: Mon, 23 Mar 2009 12:49:48 +1100
Message-ID: <20090323124948.fed84e3a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Mar_2009_12_49_48_+1100_CYZ8n/hxd4QbAgJ9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46649 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753147AbZCWBt4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Mar 2009 21:49:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>

--Signature=_Mon__23_Mar_2009_12_49_48_+1100_CYZ8n/hxd4QbAgJ9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

arch/powerpc/kernel/msi.c: In function 'arch_msi_check_device':
arch/powerpc/kernel/msi.c:23: error: 'PCI_CAP_ID_MSI' undeclared (first use=
 in this function)

Caused by commit 1c8d7b0a562da06d3ebe83f01b1ed553205d1ae4 ("PCI MSI: Add
support for multiple MSI").  PCI_CAP_ID_MSI is defined in
linux/pci_regs.h which is included by linux/pci.h, but neither is
included by arch/powerpc/kernel/msi.c.

I have used the version of the pci tree from next-20090320 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Mar_2009_12_49_48_+1100_CYZ8n/hxd4QbAgJ9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknG6rwACgkQjjKRsyhoI8wTTACghdrxbe5hMpTDVajkPKixk5Gk
jJEAoJt7/shqg3V8AoaW4r1QkXCJKgLT
=OQst
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Mar_2009_12_49_48_+1100_CYZ8n/hxd4QbAgJ9--
