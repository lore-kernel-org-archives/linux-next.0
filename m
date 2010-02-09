From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pci tree
Date: Tue, 9 Feb 2010 11:54:27 +1100
Message-ID: <20100209115427.fe1b7f0c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Feb_2010_11_54_27_+1100_B4CZ6OgQBm3HUt5J"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33298 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753012Ab0BIAyd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Feb 2010 19:54:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bjorn.helgaas@hp.com>

--Signature=_Tue__9_Feb_2010_11_54_27_+1100_B4CZ6OgQBm3HUt5J
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

After merging the pci tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/kernel/pci_64.c: In function 'pcibios_unmap_io_space':
arch/powerpc/kernel/pci_64.c:101: error: 'struct pci_bus' has no member nam=
ed 'resource'
arch/powerpc/kernel/pci_64.c: In function 'pcibios_map_io_space':
arch/powerpc/kernel/pci_64.c:149: error: 'struct pci_bus' has no member nam=
ed 'resource'
arch/powerpc/kernel/pci_64.c:149: error: 'struct pci_bus' has no member nam=
ed 'resource'

Caused by commit 17561b77695fa7e3027ea455ba6ecddb1a1c72f2 ("PCI: replace
bus resource table with a list").  More care required - grep is your
friend!

I have used the pci tree form next-20100208 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Feb_2010_11_54_27_+1100_B4CZ6OgQBm3HUt5J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktwskMACgkQjjKRsyhoI8yVRQCdFREwVqXbMKHZxOXsbRRj7Owz
cdsAni0SD4+p3ep8v4cAnlKggCk9MJcJ
=fV24
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Feb_2010_11_54_27_+1100_B4CZ6OgQBm3HUt5J--
