From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfs tree build failure
Date: Mon, 16 Mar 2009 21:55:52 +1100
Message-ID: <20090316215552.8ca734d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Mar_2009_21_55_52_+1100_/K3pSgvzSs9tXwQ_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:32999 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752097AbZCPK4E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 06:56:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__16_Mar_2009_21_55_52_+1100_/K3pSgvzSs9tXwQ_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

Today's linux-next build (sparc defconfig) failed like this:

fs/nfs/write.c:568: error: redefinition of 'nfs_need_commit'
fs/nfs/write.c:542: error: previous definition of 'nfs_need_commit' was here

Caused by commit fb8a1f11b64e213d94dfa1cebb2a42a7b8c115c4 ("NFS: cleanup
- remove struct nfs_inode->ncommit") which I have reverted for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Mar_2009_21_55_52_+1100_/K3pSgvzSs9tXwQ_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm+MDgACgkQjjKRsyhoI8zwOwCeNQVNjAMQvXaWUAYag/ft1QDB
h9EAoInblRhKSjLXzToG1ZXkIdiCvwRu
=hV50
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Mar_2009_21_55_52_+1100_/K3pSgvzSs9tXwQ_--
