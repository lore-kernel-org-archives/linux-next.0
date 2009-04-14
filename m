From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cifs tree build failure
Date: Tue, 14 Apr 2009 11:41:53 +1000
Message-ID: <20090414114153.00467d45.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Apr_2009_11_41_53_+1000_5+k1G62G46oF9wUC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38431 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751697AbZDNBmJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2009 21:42:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org
Cc: linux-next@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Shirish Pargaonkar <shirishp@us.ibm.com>

--Signature=_Tue__14_Apr_2009_11_41_53_+1000_5+k1G62G46oF9wUC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/cifs/dir.c: In function 'cifs_lookup':
fs/cifs/dir.c:664: error: dereferencing pointer to incomplete type

Caused by commit 84c63ad9195b37b3de43427c11471a763c3993cc ("[CIFS] Add
support for posix open during lookup") from the cifs tree (probably an
interaction with commit 5ad4e53bd5406ee214ddc5a41f03f779b8b2d526 ("Get
rid of indirect include of fs_struct.h") - now in Linus' tree).

I have used the cifs tree from next-20090409 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Apr_2009_11_41_53_+1000_5+k1G62G46oF9wUC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknj6eEACgkQjjKRsyhoI8w04QCeK0Vi05G7xYQjvP8xYEhLC9W/
AMQAoKbMuIcWhvAvWRlsGCGq4ZTnMHJb
=Gu+Y
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Apr_2009_11_41_53_+1000_5+k1G62G46oF9wUC--
