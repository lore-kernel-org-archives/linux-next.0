From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ide build failure
Date: Sun, 1 Jun 2008 12:05:10 +1000
Message-ID: <20080601120510.f74f03fe.sfr@canb.auug.org.au>
References: <20080530115422.989d9ab6.sfr@canb.auug.org.au>
	<200805311538.37732.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__1_Jun_2008_12_05_10_+1000_fcaM/3LRTbrg3Xc4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39338 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755273AbYFACFW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 31 May 2008 22:05:22 -0400
In-Reply-To: <200805311538.37732.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Sun__1_Jun_2008_12_05_10_+1000_fcaM/3LRTbrg3Xc4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

On Sat, 31 May 2008 15:38:37 +0200 Bartlomiej Zolnierkiewicz <bzolnier@gmai=
l.com> wrote:
>
> On Friday 30 May 2008, Stephen Rothwell wrote:
> >=20
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> >=20
> > I applied the following patch.
>=20
> [...]
>=20
> Thanks, I integrated it with the guilty commit.

Good, thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__1_Jun_2008_12_05_10_+1000_fcaM/3LRTbrg3Xc4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIQgPfTgG2atn1QN8RAmwxAJ9Dqfey3OqnnJjAdum1AyBN8rSOTwCgg2ht
qnW3PX8tHRlN3ISAao5Sw1U=
=TFEj
-----END PGP SIGNATURE-----

--Signature=_Sun__1_Jun_2008_12_05_10_+1000_fcaM/3LRTbrg3Xc4--
