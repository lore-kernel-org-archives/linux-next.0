From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfs tree build warning
Date: Fri, 19 Jun 2009 10:50:22 +1000
Message-ID: <20090619105022.4dc10679.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__19_Jun_2009_10_50_22_+1000_Ot9uoIP7Twc=fJ1o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39441 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751646AbZFSAuX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Jun 2009 20:50:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Sager <sager@netapp.com>

--Signature=_Fri__19_Jun_2009_10_50_22_+1000_Ot9uoIP7Twc=fJ1o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

fs/nfs/super.c: In function 'nfs_parse_mount_options':
fs/nfs/super.c:1253: warning: passing argument 2 of 'match_int' from incomp=
atible pointer type
include/linux/parser.h:29: note: expected 'int *' but argument is of type '=
long unsigned int *'

Introduced by commit 3fd5be9e19921a89d9ed78d6a708a379a6c3c76a ("nfs41:
add mount command option minorversion").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__19_Jun_2009_10_50_22_+1000_Ot9uoIP7Twc=fJ1o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko64M4ACgkQjjKRsyhoI8yCnACggEnXM9VQ0AZ8xMZm++rFtzoi
vFwAnj2GGA/AIp9BbmAv0+b0mQdNBIlL
=G1d2
-----END PGP SIGNATURE-----

--Signature=_Fri__19_Jun_2009_10_50_22_+1000_Ot9uoIP7Twc=fJ1o--
