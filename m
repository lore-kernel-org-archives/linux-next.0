From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH -next] sound/soc/codecs: Mark snd-soc-wm2200 and
 snd-soc-wm-adsp as BROKEN
Date: Sat, 30 Mar 2013 13:52:13 +0000
Message-ID: <20130330135212.GN18316@opensource.wolfsonmicro.com>
References: <1364566347-29941-1-git-send-email-peter@hurleysoftware.com>
 <20130329171229.GD18316@opensource.wolfsonmicro.com>
 <1364582754.3559.66.camel@thor.lan>
 <20130329185004.GL18316@opensource.wolfsonmicro.com>
 <alpine.DEB.2.02.1303302029231.25958@M2420>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4gsOvWtXbzsKMKqq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:33844 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755527Ab3C3NwR (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sat, 30 Mar 2013 09:52:17 -0400
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1303302029231.25958@M2420>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Xiong Zhou <jencce.kernel@gmail.com>
Cc: Peter Hurley <peter@hurleysoftware.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


--4gsOvWtXbzsKMKqq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 30, 2013 at 08:30:39PM +0800, Xiong Zhou wrote:

> So the failure comes. Yes, this config is kind of specific, not much.

Right, but look at what the options are doing - ALL_CODECS is purely for
build coverage so someone seeing the issue in this form must be running
a partial build coverage test which happens to cover a relatively
obscure subsystem.  This is why none of the all*configs that are run on
-next as standard fail.

> The definition of one array which is cited by one module comes in=20
> another module, and this dependence does not appear in Kconfig=20
> architecture. Indeed, the help text of ALL_CODECS reminds the=20
> separated surpporting bus options. Still I think this is unreasonable.
> Even though build coverage test is the only proper purpose. It breaks
> the whole building procedure.

I'm not saying this doesn't need to be fixed, I'm saying we need a sane
fix.

> I think copying the same array definition across c file is ugly, and Mark
> said that this is not a Kconfig issue. So far, I have not got any other
> idea to fix this. Code cruising.

I actually looked at this earlier and sent a fix for it (didn't get
round to mailing this thread yet, sorry), the code wouldn't have worked
at all for WM2200 - this is the sort of thing that should be apparent as
soon as people start asking questions like "why was this dependency
added, is it sensible?" which should be among the first questions asked
when turning up something like this, especially for recent changes.

--4gsOvWtXbzsKMKqq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRVu4GAAoJELSic+t+oim9cvMP/03+9hcAH9+W3zQbqN34ha16
rOjEGZH0y65aF0JkDgWlE7kNuuoRGVAeCTZl8BvMMK4sZJz/ZgKl1B/HS2G+Jszm
r5w2+ULTZJRH44pnny2D9imOLcYUTNXuKdVrfc5DLthsL3HQbt8NxkrDM3UxqkQD
Ji2MvYLTBKZgoRvfrrRittGPlZ3CG9Z2gOL7vN5sYJi2IexLmaHoaRu/gu6dEBI3
0jGk/jit5F/bC9QVwsJEgapKfi+r+Trx2fLgr7XhPk+BoFKpN15TV1In5ppJYsxD
3pesNfzAu7hOFm1oYwOoqzM8SqC2oqGzvDhSMk9dpLvHttzd3s6vussMmYdqg0v5
A+LKS9jBKvolhbaJeZb/3jdOTYm1nn+BfQJkiGMxysPR7AcBvOKdBMOkhXGznPKG
kb40I8t0nWj60Vre5xBG+mSYR1/p6b0VBKeVe3QOVb5iOUXYySPKTMSHL4Fhyb3N
JbwAiuajXVZHqNT9QfkpsfD4eIYsO/x2AdzFapu73fHv7f2fn2jXkXOGnnJxoRmm
TGJ2L1kSyKK7+1Kl+hPHRjzTy26koJ5UQ4xp1JHOeSv2Tz3iIh0QVD3Skqsmv5Q+
n/aeI2LP3HZtRtRmUJV06hrP91SU7E4BMTW+7NJPtsvvjEHS+5Z23Ty/heQL7mEO
CGTvvC8RKcuU96jlpVA9
=BkIL
-----END PGP SIGNATURE-----

--4gsOvWtXbzsKMKqq--
