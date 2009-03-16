From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: nfs tree build failure
Date: Tue, 17 Mar 2009 10:04:13 +1100
Message-ID: <20090317100413.b5b5b263.sfr@canb.auug.org.au>
References: <20090316215552.8ca734d2.sfr@canb.auug.org.au>
	<1237205966.7229.1.camel@heimdal.trondhjem.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Mar_2009_10_04_13_+1100_d.uXXXWu2gaXBgzs"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50934 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754977AbZCPXEU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 19:04:20 -0400
In-Reply-To: <1237205966.7229.1.camel@heimdal.trondhjem.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__17_Mar_2009_10_04_13_+1100_d.uXXXWu2gaXBgzs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

On Mon, 16 Mar 2009 08:19:26 -0400 Trond Myklebust <trond.myklebust@fys.uio=
.no> wrote:
>
> Should be fixed now. Somehow the first definition had migrated out of
> the #ifdef section immediately following it.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Mar_2009_10_04_13_+1100_d.uXXXWu2gaXBgzs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm+2u0ACgkQjjKRsyhoI8w+KgCfWiOxzyPMbFyzcT9sEu3kcNs5
uloAoJVhDsH92KRirlO4vz7+6wHh1GrW
=+S9G
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Mar_2009_10_04_13_+1100_d.uXXXWu2gaXBgzs--
