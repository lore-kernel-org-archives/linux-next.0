From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ext4 tree with Linus' tree
Date: Mon, 2 Feb 2009 13:56:19 +1100
Message-ID: <20090202135619.cff6fe73.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__2_Feb_2009_13_56_19_+1100_FoKL9hd7YRzsxg5I"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41680 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752906AbZBBC42 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Feb 2009 21:56:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Tso <tytso@MIT.EDU>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__2_Feb_2009_13_56_19_+1100_FoKL9hd7YRzsxg5I
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ted,

Today's linux-next merge of the ext4 tree got a conflict in
fs/ext4/ext4.h between commit 06a279d636734da32bb62dd2f7b0ade666f65d7c
("ext4: only use i_size_high for regular files") from Linus' tree and
commit eef9a6114469769465d43b1f8198ee1ae888e143 ("ext4: ignore
i_size_high for directories") from the ext4 tree.

These two commits appear to do almost the same thing.  I used the version
from Linus' tree.  Please either merge Linus' tree into the ext4 tree or
drop/modify the commit there.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__2_Feb_2009_13_56_19_+1100_FoKL9hd7YRzsxg5I
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmGYNMACgkQjjKRsyhoI8zprACgimNIXws9A99IcIWs4gHgkq57
3l8An2ehnZAgeRrDunjoHmNsfi0hvm+Z
=lUR7
-----END PGP SIGNATURE-----

--Signature=_Mon__2_Feb_2009_13_56_19_+1100_FoKL9hd7YRzsxg5I--
