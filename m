From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: nfs build failure
Date: Wed, 18 Jun 2008 10:49:23 +1000
Message-ID: <20080618104923.7c8ed6b2.sfr@canb.auug.org.au>
References: <20080617192622.e448a37e.sfr@canb.auug.org.au>
	<1213733955.7288.24.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__18_Jun_2008_10_49_23_+1000_UzWAeG8ZFY75prWC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44958 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751386AbYFRAtc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 20:49:32 -0400
In-Reply-To: <1213733955.7288.24.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, Jeff Layton <jlayton@redhat.com>

--Signature=_Wed__18_Jun_2008_10_49_23_+1000_UzWAeG8ZFY75prWC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

On Tue, 17 Jun 2008 16:19:15 -0400 Trond Myklebust <trond.myklebust@fys.uio=
.no> wrote:
>
> Thanks Stephen! The patch looks correct, but I think I'd still prefer
> the following to avoid the #ifdef.

Its your tree, I just hack it so it will build for me.  :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__18_Jun_2008_10_49_23_+1000_UzWAeG8ZFY75prWC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhYW5MACgkQTgG2atn1QN+hagCff+rGq7I88JyPRWN8n0lfyvxI
XLsAn0JF3nnQyAUsJ4lwQL7bXTgrALKc
=f+6+
-----END PGP SIGNATURE-----

--Signature=_Wed__18_Jun_2008_10_49_23_+1000_UzWAeG8ZFY75prWC--
