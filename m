From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with the pci-current tree
Date: Fri, 6 Feb 2009 13:50:41 +1100
Message-ID: <20090206135041.fd7a8e7e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Feb_2009_13_50_41_+1100_0OTgCXK9StTGcirF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60077 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750885AbZBFCus (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 21:50:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

--Signature=_Fri__6_Feb_2009_13_50_41_+1100_0OTgCXK9StTGcirF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in
drivers/pci/pcie/portdrv_pci.c between commit
27be54a65c89c4b4aa9b25fc6fba31ffd01a08ca ("PCI: PCIe portdrv: Simplify
suspend and resume") from the pci-current tree and commit
120d3f44dd4c7a16ac71f26d4ff44ad7498cb81a ("PCI: PCIe portdrv: Implement
pm object") from the pci tree.

I fixed it up (I used the pci tree version) and assume it will be fixed in
the pci tree soon.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Feb_2009_13_50_41_+1100_0OTgCXK9StTGcirF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmLpYEACgkQjjKRsyhoI8zLLgCeNrakeLMvvOF5lZvEHPOq9BVx
TPoAoI2/8BOeVqbwCDI6TWof6Kk8Vnox
=MCzZ
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Feb_2009_13_50_41_+1100_0OTgCXK9StTGcirF--
