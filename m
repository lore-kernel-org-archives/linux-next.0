From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next fixes
Date: Mon, 4 Nov 2013 09:34:30 +0100
Message-ID: <20131104083429.GA27445@ulmo.nvidia.com>
References: <20131101093638.GE27864@ulmo.nvidia.com>
 <5273C445.7060900@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:50947 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752240Ab3KDIej (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2013 03:34:39 -0500
Received: by mail-bk0-f46.google.com with SMTP id e11so478456bkh.5
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2013 00:34:38 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <5273C445.7060900@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2013 at 08:09:57AM -0700, Randy Dunlap wrote:
> On 11/01/13 02:36, Thierry Reding wrote:
> > Hi Stephen,
> >=20
> > There have been some discussions lately revolving around the topic of
> > linux-next fixes. That is, commits that people come up with over the
> > course of a day to fix issues found in the latest linux-next trees.
> >=20
> > It's a fact that many people rely on linux-next for everyday work, so
> > whenever things break in linux-next a lot of people end up chasing the
> > same bugs and posting the same patches (or not posting them for that
> > matter).
> >=20
> > A lot of developer time is wasted that way, so I originally proposed
> > that we could set up a separate linux-next-fixes tree where we collect
> > patches of interest. I volunteer to do that, since, well, I'm doing it
> > anyway as part of my daily routine. Timezone-wise it also fits pretty
> > well, since I usually start my day sometime around when you publish
> > linux-next.
> >=20
> > If we can establish a canonical location where such fixes are
> > accumulated, people could fetch those at the same time they fetch the
> > linux-next tree and automatically get fixes.
>=20
> Stephen has had a location for linux-next fixes for quite some time now --
> in the linux-next tree itself.
>=20
> Apparently Olof objected to this and you agreed with him.
> and I object to not having the fixes in the linux-next tree.

What I did agree to was a compromise. I do see some sense in not
carrying all the fixes in linux-next so that the actual state of
brokenness is reflected.

But I also think that for everyone using linux-next for daily work it
makes sense to have these patches in a central location in order to
minimize duplicate work.

> Maybe Stephen can work it out.  :)

If nobody wants to have this in linux-next itself, then I still plan on
maintaining a tree for myself so that people that work in the same areas
in a later timezone don't have to duplicate all of that.

Thierry

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSd1wUAAoJEN0jrNd/PrOhUjwP/1Yj/vSkgUKv2i7dMEosvxdH
wd61AvQcxwHj/dVANCM6RcdJPa0f8Rld1h/JoPBwpr8cQBAP8TM8z/7Hip+zFi71
iA4J1+9Day4/Pn0xCm7b6V9noaJdKXGBWerSPt1q+NOyz4bg+H3bVPQhpCH51GKL
vV3VsTMX3ze78t/RtYgnickLTdhwlzJEzYUEJ/uYcTjYNm2AlqH/Crr5mUTEABKF
udTjaimqDL4aMiCHzLyxfjjmUvR+3Qn0Sw/YHak38YYb3OuQ+DELdsd4thF6RDAS
e2spF0tgZPJ6AGx7bdSfi9mKqbH8cL9SiBxj3Vnw0/6Oxn1rfNG7K2YOTj6ztpRL
Z0CBVJK+iAeXHgjyqpPTPJPxpem9K0Lt/jShUctd9yKDyLpb6MVwJuFFA+a0AmfT
tN7baC18YghEH9h9nba8+XhS01O9PlV52Fq+lQKnfPyXqGLJBnoIWo+9Wqh00iZw
QG9tpgIpn27UT6sDiyzaCt0IZtH2VIV8gEFAr1iecDrnV9YcSenrhCYTKQTQOpOM
4YbYYQr5yhhSuyBBrGhqHeWFP6zxyopvsGVpZkBrlqbUA1jj7WoXlDA5vboN4ncS
0YkdzYkQ0uWKhz5ehiDXGB1dKhFw7UTnJxlCwm4+2Q1LOZoV/2FjDOVLiOUn6fZO
QXibU+SuCVDnBMstbRrl
=j7VF
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
