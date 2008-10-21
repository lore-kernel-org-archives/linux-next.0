From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linuxt-next: nfsd strange commit
Date: Tue, 21 Oct 2008 14:13:57 +1100
Message-ID: <20081021141357.ab15406f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__21_Oct_2008_14_13_57_+1100_1.0KYLkWvCL_UOA3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58725 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751338AbYJUDOI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 23:14:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__21_Oct_2008_14_13_57_+1100_1.0KYLkWvCL_UOA3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

I was just wondering what commit 9966acbedc54b9c2d38d97bdd56b612d8da45b8d
("proc: move rest of /proc/locks to fs/locks.c") is doing in the
nfsd-next tree?  As far as I can see, it has nothing to do with nfsd and
no interaction with the nfsd code.

Adding random patches to trees in linux-next just makes my job
harder ...  especially when it touched something like include/linux/fs.h
and triggers a major rebuild of the tree (*and* it is the only thing in
the nfsd-next tree).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__21_Oct_2008_14_13_57_+1100_1.0KYLkWvCL_UOA3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj9SPUACgkQjjKRsyhoI8yo1QCgtDAS46wNBcbPuLvAKw62lMvT
z6kAn2R0Oq2DRpg06YuacmTegJFLblM0
=cJMP
-----END PGP SIGNATURE-----

--Signature=_Tue__21_Oct_2008_14_13_57_+1100_1.0KYLkWvCL_UOA3--
