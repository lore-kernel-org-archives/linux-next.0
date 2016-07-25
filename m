From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Mon, 25 Jul 2016 17:42:09 +0100
Message-ID: <20160725164209.GF11806@sirena.org.uk>
References: <20160724153233.49f1574d@canb.auug.org.au>
 <alpine.DEB.2.11.1607250915160.5629@nanos>
 <57961014.7030902@linaro.org>
 <20160725145337.GT15995@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PGNNI9BzQDUtgA2J"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40250 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752463AbcGYQms (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jul 2016 12:42:48 -0400
Content-Disposition: inline
In-Reply-To: <20160725145337.GT15995@brightrain.aerifal.cx>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <Marc.Zyngier@arm.com>


--PGNNI9BzQDUtgA2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 25, 2016 at 10:53:37AM -0400, Rich Felker wrote:
> On Mon, Jul 25, 2016 at 03:11:48PM +0200, Daniel Lezcano wrote:

> > I don't know the goal of adding those patches in linux-next via your
> > tree, may be you misunderstood how linux-next works and you should
> > remove them. But if the purpose was to merge the patches, I remind you
> > that being an arch maintainer does not give you the right to apply any
> > patches, everywhere, at all cost, without review, because you want them
> > in, you must follow the process, otherwise you take the risk to upset a
> > lot of people and to be kicked out.

> If this is upsetting people I can remove them. Last time I got
> feedback from at least one (driver) subsystem maintainer that (if I
> understood it correctly) indicated they would like to have seen the
> patch in linux-next without problems before upstreaming it through

I think that was me and you've very much misunderstood what I was
saying.  A that time you were sending new drivers during the merge
window with the apparent expectation that they would be merged during
that merge window.  That's not going to happen, things need to go into
-next before the merge window.  This means that you need to submit your
patches well in advance of the merge window so they can be reviewed and
ideally applied to maintainer trees before the merge window opens.

It does not mean that you should include unreviewed code for other trees
in your -next tree, that's not the purpose of -next.  What goes into
-next from each maintainer tree should be what is currently intended to
go to Linus for that tree in the next merge window.

--PGNNI9BzQDUtgA2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXlkFhAAoJECTWi3JdVIfQv1UH/0oAy64HsC0bvGwCjLv/GkCs
FV9cbXNgCGRoPbnUiheza5TKkcRC+NQHvY/E4TSpVEE4d2kkmnbz4tj8eEBdkNGI
srWbf4Sruu20sS81yI6s6Ind6/mDvVkXXhS33k8AsyqQUPl90ZItRBcE5fTnBBHY
xME1X7JF9gB5XXQ2pAsSBT8qxxGjdzHKDUjoVXw+pyfa9Zpm8h/zYFQVCk4X3kfi
+QoleylyJTlKyohaFcbDoMoSqRnFjGHSeHW1ttruUT91oLIU2XH3mHOGVRln49gr
uFywBgPNZd/3iQEhSokyu6wvf7Si3Wi5qKxupXt+1KHNUE8JNwKuQxVzypWmU/8=
=CtfZ
-----END PGP SIGNATURE-----

--PGNNI9BzQDUtgA2J--
