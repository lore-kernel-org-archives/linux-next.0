From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: unable to fetch the xfs tree
Date: Fri, 7 Nov 2008 16:13:40 +1100
Message-ID: <20081107161340.268ee812.sfr@canb.auug.org.au>
References: <20081107111125.ef33b1dc.sfr@canb.auug.org.au>
	<20081107145332.52d49390.sfr@canb.auug.org.au>
	<4913BEC6.6080901@sgi.com>
	<20081107154602.8621ea3d.sfr@canb.auug.org.au>
	<4913C967.30309@sgi.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Nov_2008_16_13_40_+1100_//=X1SKeU.yVpAZe"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36454 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750771AbYKGFN4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 00:13:56 -0500
In-Reply-To: <4913C967.30309@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: lachlan@sgi.com
Cc: David Chinner <david@fromorbit.com>, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>

--Signature=_Fri__7_Nov_2008_16_13_40_+1100_//=X1SKeU.yVpAZe
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lachlan,

On Fri, 07 Nov 2008 15:51:51 +1100 Lachlan McIlroy <lachlan@sgi.com> wrote:
>
> Stephen Rothwell wrote:
> >=20
> > On Fri, 07 Nov 2008 15:06:30 +1100 Lachlan McIlroy <lachlan@sgi.com> wr=
ote:
> >> Stephen Rothwell wrote:
> >>>
> >>> On Fri, 7 Nov 2008 11:11:25 +1100 Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
> >>>> I am getting:
> >>>>
> >>>> oss.sgi.com[0: 192.48.170.157]: errno=3DConnection refused
> >>>>
> >>>> so I will use what I fetched yesterday.
> >>> And now I have received:
> >>>
> >>> <xfs-masters@oss.sgi.com>: host cuda-allmx.sgi.com[192.48.176.16] sai=
d: 550
> >>>     cuda_nsu 5.1.1 <xfs-masters@oss.sgi.com>... User unknown (in repl=
y to RCPT
> >>>     TO command)
> >>>
> >>> So, is this a permanent state of affairs, or just a temporary glitch?
> >> Should be temporary.  We have known DNS and email issues that we are w=
orking
> >> on.  We're also moving oss.sgi.com but I have no idea what the schedul=
e is.
> >=20
> > Thanks.
>=20
> I actually got a bounce message when I sent that reply.  Gotta love the i=
rony.

That is probably because I spelt linux-fsdevel wrong twice :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__7_Nov_2008_16_13_40_+1100_//=X1SKeU.yVpAZe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkTzoQACgkQjjKRsyhoI8xDAQCcDXfsShHmuder29mSHvBm9nzW
PAQAn0xJtKrEQUHGoiNab/IBRPGWFwF7
=F7QU
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Nov_2008_16_13_40_+1100_//=X1SKeU.yVpAZe--
