From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Fwd: Re: [PATCH] kprobes: fix compilation break due to
 kprobe_mutex
Date: Sun, 18 May 2008 13:53:54 +1000
Message-ID: <20080518135354.d37baf4f.sfr@canb.auug.org.au>
References: <20080517114244.GB30141@flint.arm.linux.org.uk>
	<20080517220204.d78fdce2.sfr@canb.auug.org.au>
	<20080517133527.GC30141@flint.arm.linux.org.uk>
	<20080517235926.5133252f.sfr@canb.auug.org.au>
	<20080518022010.56a8bf46.sfr@canb.auug.org.au>
	<20080517190855.GC13933@flint.arm.linux.org.uk>
	<20080518134933.fe57718a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__18_May_2008_13_53_54_+1000_B3RpL.OAl6kW+2VA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42715 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751993AbYERDyF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 17 May 2008 23:54:05 -0400
In-Reply-To: <20080518134933.fe57718a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Sun__18_May_2008_13_53_54_+1000_B3RpL.OAl6kW+2VA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Sun, 18 May 2008 13:49:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Sat, 17 May 2008 20:08:55 +0100 Russell King - ARM Linux <linux@arm.li=
nux.org.uk> wrote:
> >
> > If I'm reading this right, it's taking you about 3.5 hours to build the
> > set?
>=20
> Not really, I added them in several goes and the build scripts have
> significant pauses between passes.  It also takes some time to mirror out
> the results between passes.  Tomorrow's build should be more
> representative.

It looks more like 2 hours 10 minutes or so.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__18_May_2008_13_53_54_+1000_B3RpL.OAl6kW+2VA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIL6hbTgG2atn1QN8RAmSVAJ0doXq/2D1u+i1P5PKKHl9naGD3nwCfb8gy
Yvvj/X8RWbi88ctscS9Lzo0=
=2Ujn
-----END PGP SIGNATURE-----

--Signature=_Sun__18_May_2008_13_53_54_+1000_B3RpL.OAl6kW+2VA--
