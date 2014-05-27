From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: =?UTF-8?B?5Zue5aSN77ya?= Re: [Consult] About only one
 Signed-of-by for the patches
Date: Wed, 28 May 2014 08:43:04 +1000
Message-ID: <20140528084304.22a1a6c8@canb.auug.org.au>
References: <20140527113400.6fa2eeee@canb.auug.org.au>
	<458532278.27889.1401167250372.JavaMail.root@bj-mail03.pku.edu.cn>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1d4POUfyw3L2HhxzKRbKIgu"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52922 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751413AbaE0WnM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2014 18:43:12 -0400
In-Reply-To: <458532278.27889.1401167250372.JavaMail.root@bj-mail03.pku.edu.cn>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Xuetao Guan <gxt@pku.edu.cn>
Cc: Chen Gang <gang.chen.5i5j@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-next@vger.kernel.org

--Sig_/1d4POUfyw3L2HhxzKRbKIgu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 27 May 2014 13:07:30 +0800 (CST) Xuetao Guan <gxt@pku.edu.cn> wrote:
>
>=20
> ----- Stephen Rothwell <sfr@canb.auug.org.au> =E5=86=99=E9=81=93=EF=BC=9A
> > Hi Chen,
> >=20
> > On Tue, 27 May 2014 09:23:38 +0800 Chen Gang <gang.chen.5i5j@gmail.com>=
 wrote:
> > >
> > > I find some of patches are only Signed-of-by me, are they OK?
> >=20
> > Actually, this one is not OK.  Anyone who handles a patch needs to add a
> > Signed-off-by.  In the case below, that patch was commited to the tree
> > by Guan Xuetao <gxt@mprc.pku.edu.cn>, so there needs to be a
> > Signed-off-by from them as well.
> >=20
> > The same is true for all the commits in the unicore32 tree ...
>=20
> Ok, I see.
>=20
> Then, do I need to reply each mail with my sob? Or only replace acked-by =
by sob for all commits in my tree?

You do not need to reply to each email, but any patch that you send on
to Linus (or someone else) needs to have your Signed-off-by.  Please
read the "Developer's Certificate of Origin" in section 12 of
Documentation/SubmittingPatches.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/1d4POUfyw3L2HhxzKRbKIgu
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJThRT9AAoJEMDTa8Ir7ZwVIvkQAITjMBORPq5PZnePqtJseHOO
J3VXUXSQjqeN+Copq1+QY4zW7GZ3MFZ0JhjA/aDgF/W+hFFTNtspzxhDkL6y5VBk
TEonoOM6Lsy1IjRUmDtA8tsdslAObVFw/5AU8ItjP+iTgDQfwrF6XRMbMjWwBGZ5
+bd/q2G4GoseFVOuH2IY9Dzz8fhGJqkyYTKPGzgixM957Zt8TmpgBB29GipInHFS
Bsef21RQTSqeu/yPHn3gTAFHPQhEdgOrYOgqUuMrag2RlRWTa82Hpp4xiAftt4q6
RzvINS+YTp48zViz91PajhmyQCA9gmJkGp04m11T1wF5pkkxQRYaIjMKzYpGQkPx
68PQG2iq4XczCv3sqYle1vOYGdix0LmSjYU2i6NjfPD9UzPJDDocuxAMstGxD1AM
ytvYhp/iRjyVgTBooxwiaDP5s9So18HYe91WbN1nlANiP183gNNZ0h/ZvNKEUPpf
wvR8r1fMqhJc2Bu1ytVH+PeGf5jX1kIpYpLs5vJ5DmDwGxDvnEJJ7z6CBJxCM0Q7
lynQ4uk1L1HXGG4Hosz+abIQz4y5Vjqh5FaVdH2JKGPgRNc0QYk8KP78/YBu6Axw
153KIUkiV0be0JKxhH2s7f5/QErgVgWM1fEVFwY3+bqyZT1LnAvh2KxKLz6LPA+I
oKrSqX9t6/56gSwXTDIU
=tmRs
-----END PGP SIGNATURE-----

--Sig_/1d4POUfyw3L2HhxzKRbKIgu--
