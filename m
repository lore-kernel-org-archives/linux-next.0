From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfs tree build warnings
Date: Fri, 13 Mar 2009 11:42:46 +1100
Message-ID: <20090313114246.15838b02.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Mar_2009_11_42_46_+1100__9x+2lqly7L+q7EF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52025 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752948AbZCMAmy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 20:42:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, Tom Talpey <tmtalpey@gmail.com>

--Signature=_Fri__13_Mar_2009_11_42_46_+1100__9x+2lqly7L+q7EF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

Today's linux-next build (/powerpc ppc64_defconfig) produced these warnings:

net/sunrpc/xprtrdma/svc_rdma_sendto.c: In function 'map_xdr':
net/sunrpc/xprtrdma/svc_rdma_sendto.c:237: warning: format '%zd' expects ty=
pe 'signed size_t', but argument 4 has type 'unsigned int'
net/sunrpc/xprtrdma/svc_rdma_sendto.c:237: warning: format '%zd' expects ty=
pe 'signed size_t', but argument 5 has type 'unsigned int'
net/sunrpc/xprtrdma/svc_rdma_sendto.c:237: warning: format '%d' expects typ=
e 'int', but argument 6 has type 'size_t'
net/sunrpc/xprtrdma/svc_rdma_sendto.c:237: warning: format '%d' expects typ=
e 'int', but argument 7 has type 'size_t'

Caused by commit b1e1e158779f1d99c2cc18e466f6bf9099fc0853 ("SVCRDMA:
remove faulty assertions in rpc/rdma chunk validation").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Mar_2009_11_42_46_+1100__9x+2lqly7L+q7EF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm5rAYACgkQjjKRsyhoI8wUIwCfWjsQv1xiEOSF7MkDB51v8BNC
QI4AoJfzkr6lMsbu43vu3dGtIEgR/+hK
=Wbeg
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Mar_2009_11_42_46_+1100__9x+2lqly7L+q7EF--
