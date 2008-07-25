From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build failure
Date: Fri, 25 Jul 2008 10:30:21 +1000
Message-ID: <20080725103021.b913c24c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__25_Jul_2008_10_30_21_+1000_HmNCL7n6LctfkuOC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46678 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753120AbYGYAa3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Jul 2008 20:30:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Trond Myklebust <trond.myklebust@fys.uio.no>, ppc-dev <linuxppc-dev@ozlabs.org>, LKML <linux-kernel@vger.kernel.org>, Steven Whitehouse <swhiteho@redhat.com>

--Signature=_Fri__25_Jul_2008_10_30_21_+1000_HmNCL7n6LctfkuOC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next (really just Linus' tree) build (powerpc
ppc64_defconfig) failed like this:

fs/nfs/nfsroot.c:130: error: tokens causes a section type conflict

"tokens" is a match_table_t which has const added to it in commit
f9247273cb69ba101877e946d2d83044409cc8c5 "UFS: add const to parser token
table".  But "tokens" is also marked __initdata.  I changed it to
__initconst.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__25_Jul_2008_10_30_21_+1000_HmNCL7n6LctfkuOC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiJHp0ACgkQjjKRsyhoI8xG9wCeOutOS7BqKHvo2K8f1LaW1qlK
zMsAn3XtT+yNaYCbr0xpkkKm+D4N8RPr
=/L8s
-----END PGP SIGNATURE-----

--Signature=_Fri__25_Jul_2008_10_30_21_+1000_HmNCL7n6LctfkuOC--
