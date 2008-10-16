From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci tree build failure
Date: Thu, 16 Oct 2008 14:41:05 +1100
Message-ID: <20081016144105.fd0f5d5b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__16_Oct_2008_14_41_05_+1100_qaUz7sV/9VumGmTU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51434 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751497AbYJPDlX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 23:41:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>

--Signature=_Thu__16_Oct_2008_14_41_05_+1100_qaUz7sV/9VumGmTU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/pci/probe.c: In function 'pci_create_legacy_files':
drivers/pci/probe.c:69: error: 'pci_read_legacy_io' undeclared (first use i=
n this function)
drivers/pci/probe.c:70: error: 'pci_write_legacy_io' undeclared (first use =
in this function)
drivers/pci/probe.c:80: error: 'pci_mmap_legacy_mem' undeclared (first use =
in this function)

Direct cause (probably) is commit 913d3708831ec551ca8560ea2cc793f738df88d6
("powerpc/PCI: Add legacy PCI access via sysfs") which I have reverted.
Actually caused by the removal of commit
d965c04f27d4df28b1ce77b0aea6329c07a8e13d ("PCI: Add ability to mmap
legacy_io on some platforms") which the above commit depends on.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__16_Oct_2008_14_41_05_+1100_qaUz7sV/9VumGmTU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj2t9EACgkQjjKRsyhoI8xgKwCgvZhUiccZxMdROyTsdKlgjpAE
Bu8An31mNaaflwxditE51juBMRyceRnE
=PCsW
-----END PGP SIGNATURE-----

--Signature=_Thu__16_Oct_2008_14_41_05_+1100_qaUz7sV/9VumGmTU--
