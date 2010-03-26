From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with the pci-current tree
Date: Fri, 26 Mar 2010 11:57:12 +1100
Message-ID: <20100326115712.2d800053.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__26_Mar_2010_11_57_12_+1100_JV9JiF4x9oy4Fq21"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54385 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752111Ab0CZA5S (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Mar 2010 20:57:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bjorn.helgaas@hp.com>

--Signature=_Fri__26_Mar_2010_11_57_12_+1100_JV9JiF4x9oy4Fq21
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in
arch/x86/pci/acpi.c between commit
eb9fc8ef7cb1362374e55d9503e3e7458f319991 ("x86/PCI: for host bridge
address space collisions, show conflicting resource") from the
pci-current tree and commit 7589c4d809ccfc88100ba224e3358706fd21f37e
("x86/PCI: trim _CRS windows when they conflict with previous
reservations") from the pci tree.

I fixed it up (by using the pci tree version) and can carry the fix for a
while.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__26_Mar_2010_11_57_12_+1100_JV9JiF4x9oy4Fq21
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkusBmgACgkQjjKRsyhoI8w2UQCfQdg/SzXzRkddunj31sZFzmiH
QDYAniOWFtTBBziaX9phFL7eJNPLVHd/
=9QxQ
-----END PGP SIGNATURE-----

--Signature=_Fri__26_Mar_2010_11_57_12_+1100_JV9JiF4x9oy4Fq21--
