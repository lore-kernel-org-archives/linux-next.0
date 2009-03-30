From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ext4 tree build warning
Date: Mon, 30 Mar 2009 15:48:55 +1100
Message-ID: <20090330154855.fa132bf8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Mar_2009_15_48_55_+1100_jpjQ.ENvKf2ajaDo"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37338 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751020AbZC3EtG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Mar 2009 00:49:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Tso <tytso@MIT.EDU>
Cc: linux-next@vger.kernel.org, Thiemo Nagel <thiemo.nagel@ph.tum.de>

--Signature=_Mon__30_Mar_2009_15_48_55_+1100_jpjQ.ENvKf2ajaDo
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ted,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

fs/ext4/inode.c: In function '__ext4_check_blockref':
fs/ext4/inode.c:385: warning: format '%u' expects type 'unsigned int', but =
argument 7 has type 'long int'

Introduced by commit 768df0e2c1d53ee0384e3021e2f1c90882804548 ("ext4: add
checks of block references for non-extent inodes").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Mar_2009_15_48_55_+1100_jpjQ.ENvKf2ajaDo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknQTzcACgkQjjKRsyhoI8yydACfXb8nqMFjtYUfPMX06SzNT8lY
2RAAoIAE83fHTjcaqXM5gI/U/TpVmql1
=nQWY
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Mar_2009_15_48_55_+1100_jpjQ.ENvKf2ajaDo--
