From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfs tree build failure
Date: Mon, 1 Feb 2010 18:38:38 +1100
Message-ID: <20100201183838.63439783.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Feb_2010_18_38_38_+1100_zdM0q13d=PAPZGns"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58711 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750990Ab0BAHiu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Feb 2010 02:38:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__1_Feb_2010_18_38_38_+1100_zdM0q13d=PAPZGns
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

Today's linux-next build (sparc defconfig) failed like this:

fs/nfs/write.c: In function 'nfs_wb_page':
fs/nfs/write.c:1478: error: implicit declaration of function 'nfs_commit_in=
ode'

Caused by commit d01b3158b56e292dbb3eea711a51a1d3dbec5094 ("NFS: Simplify
nfs_wb_page()").  Neither CONFIG_NFS_V3 nor CONFIG_NFS_V4 is set in this
build.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Feb_2010_18_38_38_+1100_zdM0q13d=PAPZGns
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktmhP4ACgkQjjKRsyhoI8w/JwCfRqvGQYNde+r+T0FYFM0zKuju
Hj8AnjFDXgNLUAl+MrMcn/q7DacyGP58
=eygu
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Feb_2010_18_38_38_+1100_zdM0q13d=PAPZGns--
