From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: nfs tree build failure
Date: Fri, 13 Mar 2009 09:07:58 +1100
Message-ID: <20090313090759.e6507916.sfr@canb.auug.org.au>
References: <20090312112605.d22546b6.sfr@canb.auug.org.au>
	<1236884072.7179.37.camel@heimdal.trondhjem.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Mar_2009_09_07_59_+1100_u_fcuqYhIC.=dGq6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48729 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755435AbZCLWIG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 18:08:06 -0400
In-Reply-To: <1236884072.7179.37.camel@heimdal.trondhjem.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, Ian Dall <ian@beware.dropbear.id.au>

--Signature=_Fri__13_Mar_2009_09_07_59_+1100_u_fcuqYhIC.=dGq6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

On Thu, 12 Mar 2009 14:54:32 -0400 Trond Myklebust <trond.myklebust@fys.uio=
.no> wrote:
>
> Should be fixed in today's tree. I appended the following patch:
> -----------------------------------------------------------------
> From: Trond Myklebust <Trond.Myklebust@netapp.com>
> Subject: NFS: Fix the fix to Bugzilla #11061, when IPv6 isn't defined...

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Mar_2009_09_07_59_+1100_u_fcuqYhIC.=dGq6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm5h78ACgkQjjKRsyhoI8y5uACbB5gN/h15d6EgQGTVu6iGUB4f
1C8AnjZIs2I9xwPnRt+fjT4ZI/08pIcC
=Y79Q
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Mar_2009_09_07_59_+1100_u_fcuqYhIC.=dGq6--
