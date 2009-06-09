From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: nfs tree build warning
Date: Tue, 9 Jun 2009 19:13:44 +1000
Message-ID: <20090609191344.690a9ab7.sfr@canb.auug.org.au>
References: <20090501131545.ca8c314a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Jun_2009_19_13_44_+1000_F2II5iDqptYqjdMM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51240 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757181AbZFIJNy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 05:13:54 -0400
In-Reply-To: <20090501131545.ca8c314a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, Benny Halevy <bhalevy@panasas.com>, Andy Adamson <andros@umich.edu>

--Signature=_Tue__9_Jun_2009_19_13_44_+1000_F2II5iDqptYqjdMM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

On Fri, 1 May 2009 13:15:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
>=20
> fs/nfs/nfs4proc.c: In function 'nfs4_proc_exchange_id':
> fs/nfs/nfs4proc.c:4279: warning: the frame size of 2288 bytes is larger t=
han 2048 bytes

I am still getting this warning.  What happened to Benny's patch?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Jun_2009_19_13_44_+1000_F2II5iDqptYqjdMM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkouJ8gACgkQjjKRsyhoI8w2ywCfeSiiNn019Ymj3fohEpDmkn+y
vroAoI6XjaldZ/bfNBOHaxRDjTvtajXE
=u0Cv
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Jun_2009_19_13_44_+1000_F2II5iDqptYqjdMM--
