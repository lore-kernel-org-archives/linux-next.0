From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree
Date: Tue, 8 Jul 2008 11:13:16 +1000
Message-ID: <20080708111316.c420c4b8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_11_13_16_+1000_wASs+/vq0tkVSUye"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57457 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754679AbYGHBN2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 21:13:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

--Signature=_Tue__8_Jul_2008_11_13_16_+1000_wASs+/vq0tkVSUye
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in
arch/sparc64/kernel/pci.c between commit
db212bde6b37e5cc60ae0f16d1872bbbcd1ae9e7 ("sparc64: fix up bus_id changes
in sparc core code") from the driver-core tree and commit
c6c4f070a61b2b6e5cd317a5fbf25255878688a2 ("PCI: make pci_name use
dev_name") from the pci tree (which also exists in the driver-core tree).

Looks like only half the update has been done (i.e. the change to use
dev_set_name is missing from the pci tree).  I took the driver-core
version.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_11_13_16_+1000_wASs+/vq0tkVSUye
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhyvywACgkQjjKRsyhoI8zT0wCgkkCtppFYEFz7JtYGyyw5Y7Z0
frMAoJ9tXpPDWqeCP6it5joj1KQtk81n
=9+NB
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_11_13_16_+1000_wASs+/vq0tkVSUye--
