From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: block/rcu merge build failure
Date: Fri, 13 Jun 2008 17:31:04 +1000
Message-ID: <20080613173104.a516da79.sfr@canb.auug.org.au>
References: <20080613171351.9ad7e1df.sfr@canb.auug.org.au>
	<20080613071803.GT20851@kernel.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Jun_2008_17_31_04_+1000_Rvkqi5BH6w2CSB/5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35164 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753535AbYFMHbK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jun 2008 03:31:10 -0400
In-Reply-To: <20080613071803.GT20851@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__13_Jun_2008_17_31_04_+1000_Rvkqi5BH6w2CSB/5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Fri, 13 Jun 2008 09:18:04 +0200 Jens Axboe <jens.axboe@oracle.com> wrote:
>
> That patch is fine, I guess there's an rcu include splitup patch in
> -next which clashes with this a bit. Thanks Stephen.

Indeed there is.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Jun_2008_17_31_04_+1000_Rvkqi5BH6w2CSB/5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhSIjgACgkQTgG2atn1QN/UxwCfVnWi8YumYbk1aTl+Bl2XPtBc
rQMAoJNdHtmDNAh4UhKFH6e6LxVJslkt
=txmv
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Jun_2008_17_31_04_+1000_Rvkqi5BH6w2CSB/5--
