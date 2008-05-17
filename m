From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Fwd: Re: [PATCH] kprobes: fix compilation break due to
 kprobe_mutex
Date: Sun, 18 May 2008 02:20:10 +1000
Message-ID: <20080518022010.56a8bf46.sfr@canb.auug.org.au>
References: <20080517114244.GB30141@flint.arm.linux.org.uk>
	<20080517220204.d78fdce2.sfr@canb.auug.org.au>
	<20080517133527.GC30141@flint.arm.linux.org.uk>
	<20080517235926.5133252f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__18_May_2008_02_20_10_+1000_=FI+NW8euprLDV+g"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59840 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751176AbYEQQUT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 17 May 2008 12:20:19 -0400
In-Reply-To: <20080517235926.5133252f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Sun__18_May_2008_02_20_10_+1000_=FI+NW8euprLDV+g
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 17 May 2008 23:59:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Sat, 17 May 2008 14:35:27 +0100 Russell King - ARM Linux <linux@arm.li=
nux.org.uk> wrote:
> >
> > The answer is all of them.  I can't suggest any subset, mainly because
> > I don't know what's in each and what each will cover.  The coverage of
> > each is really up to each platform maintainer I'm afraid.
>=20
> OK, I will see what happens if I add them all.  You may need to ping me
> if any get added or removed.

I have added them all.  There are some results on the web page already
(http://kisskb.ellerman.id.au/kisskb/compiler/11/) which are all ok.  On
our internal page (which will be mirrored above in an hour or so) there
are some failures (so far clps7500_defconfig, collie_defconfig,
corgi_defconfig, eseries_pxa_defconfig and magician_defconfig). Check
there later.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__18_May_2008_02_20_10_+1000_=FI+NW8euprLDV+g
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFILwXATgG2atn1QN8RAiyJAJ0axdb93lCJG8MJ1dCguot5pdBWtACfeKax
PhsoW6Pxovn8QDXIg1QVBo8=
=21oF
-----END PGP SIGNATURE-----

--Signature=_Sun__18_May_2008_02_20_10_+1000_=FI+NW8euprLDV+g--
