From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the configfs tree with the  tree
Date: Mon, 15 Jun 2009 11:04:23 +1000
Message-ID: <20090615110423.4a4d8030.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__15_Jun_2009_11_04_23_+1000_G+Y+phjtQqGSmue3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43735 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750851AbZFOBE2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Jun 2009 21:04:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joel Becker <Joel.Becker@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Louis Rilling <louis.rilling@kerlabs.com>

--Signature=_Mon__15_Jun_2009_11_04_23_+1000_G+Y+phjtQqGSmue3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Joel,

Today's linux-next merge of the configfs tree got a conflict in
fs/configfs/dir.c between commit 420118caa32c8ccdf9fce5a623b9de3f951573c5
("configfs: Rework configfs_depend_item() locking and make lockdep
happy") from Linus' tree and commit
8af7d5ffe1b6468ed0de1c2bb5335ad40b755ba3 ("configfs: Rework
configfs_depend_item() locking and make lockdep happy") from the configfs
tree.

Two versions of the same patch (even the same author date).  I have no
idea what to do with these, so I just took the version from Linus' tree
(since that had a slightly later commit date).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__15_Jun_2009_11_04_23_+1000_G+Y+phjtQqGSmue3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko1nhcACgkQjjKRsyhoI8x3SACeNNfk1dHLvk1oH1qdaYswccsC
quIAoIRyNqcIYYpGswFhdWj1GAjw5vVU
=CPHa
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Jun_2009_11_04_23_+1000_G+Y+phjtQqGSmue3--
