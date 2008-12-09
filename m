From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Tue, 9 Dec 2008 13:13:58 +1100
Message-ID: <20081209131358.8529a1a0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Dec_2008_13_13_58_+1100_iE/qMRun/YlmpPQw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55514 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752017AbYLICOM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Dec 2008 21:14:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>, "J. Bruce Fields" <bfields@fieldses.org>, Harvey Harrison <harvey.harrison@gmail.com>

--Signature=_Tue__9_Dec_2008_13_13_58_+1100_iE/qMRun/YlmpPQw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in fs/lockd/mon.c
between commit 9e414471988c5558df3674b94e145d8f926a683f ("NSM: Support
IPv6 version of mon_name") from the nfsd tree and commit
be859405487324ed548f1ba11dc949b8230ab991 ("fs: replace NIPQUAD()") from
the net tree.

The former removed the code that the latter modified.  However, the nfsd
tree has added some more usages of the NIP macros ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Dec_2008_13_13_58_+1100_iE/qMRun/YlmpPQw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk91GYACgkQjjKRsyhoI8yvzQCgrLPYvf8mHPKnn6fwjkb75z9d
MzUAoKynqkQhmzrWtkEzrK4l20yYhHB2
=Vx9P
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Dec_2008_13_13_58_+1100_iE/qMRun/YlmpPQw--
