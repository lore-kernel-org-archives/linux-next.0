From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Fri, 6 Mar 2009 11:05:48 +1100
Message-ID: <20090306110548.9ef01100.sfr@canb.auug.org.au>
References: <20090305113550.4369fe92.sfr@canb.auug.org.au>
	<20090305185150.69d8aff9@pedra.chehab.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Mar_2009_11_05_48_+1100_7KQZSuwsQnzlJCu."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50585 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754087AbZCFAF5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 19:05:57 -0500
In-Reply-To: <20090305185150.69d8aff9@pedra.chehab.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, "Igor M. Liplianin" <liplianin@netup.ru>

--Signature=_Fri__6_Mar_2009_11_05_48_+1100_7KQZSuwsQnzlJCu.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Thu, 5 Mar 2009 18:51:50 -0300 Mauro Carvalho Chehab <mchehab@infradead.=
org> wrote:
>
> Fixed.

Thanks.

> From time to time, I got an weird message like this when updating my remo=
te
> repository:
>=20
> $ git --git-dir /home/v4l/tokernel/bare/linux-next.git push -f origin
> Counting objects: 194, done.
> Compressing objects: 100% (70/70), done.
> Writing objects: 100% (93/93), 14.19 KiB, done.
> Total 93 (delta 82), reused 24 (delta 23)
> warning: updating the currently checked out branch; this may cause confus=
ion,
> as the index and working tree do not reflect changes that are now in HEAD.
> To ssh://master.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-next.git
>=20
> What's more weird is that I never touch directly
> on /home/v4l/tokernel/bare/linux-next.git, since this is just a local bare
> tree. My procedure is to update the patches on a work tree, then push it =
to the
> bare repository and then to kernel.org.

Is there some reason that you repo on kernel.org is not bare as well?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Mar_2009_11_05_48_+1100_7KQZSuwsQnzlJCu.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmwaNwACgkQjjKRsyhoI8xSlQCfR0nGrPul+JL1i/LHsvnV4hLI
5SUAn3cYD6gIik93U3PwRYwRNvyjkHU+
=lnuP
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Mar_2009_11_05_48_+1100_7KQZSuwsQnzlJCu.--
