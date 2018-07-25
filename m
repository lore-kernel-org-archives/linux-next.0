From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the gfs2 tree
Date: Wed, 25 Jul 2018 11:16:41 +1000
Message-ID: <20180725111514.14951d78@canb.auug.org.au>
References: <20180725080130.314f62bb@canb.auug.org.au>
        <CAHpGcM+WkOKkd+GLMiTWsvnLA_daY_5pBfSQp_KYoPVcRQQHGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9+GW7cuk9ae9H_Au9Ppa+XY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHpGcM+WkOKkd+GLMiTWsvnLA_daY_5pBfSQp_KYoPVcRQQHGg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?UTF-8?B?R3LDvG5iYWNoZXI=?= <andreas.gruenbacher@gmail.com>
Cc: Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas Gruenbacher <agruenba@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/9+GW7cuk9ae9H_Au9Ppa+XY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Wed, 25 Jul 2018 00:23:22 +0200 Andreas Gr=C3=BCnbacher <andreas.gruenba=
cher@gmail.com> wrote:
>
> 2018-07-25 0:01 GMT+02:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> > Hi all,
> >
> > Commit
> >
> >   b6fbc2f6a686 ("GFS2: Fix recovery issues for spectators")
> >
> > is missing a Signed-off-by from its committer.  It was rebased. =20
>=20
> thanks, I've fixed it now but this is getting rather annoying -- and
> it must happen to others as well. Do you happen to have git hooks that
> prevent this from happening?

No, but I don't rebase stuff (that matters) ;-)  I think that someone
did write a hook, but can't remember who, sorry.

What I have is a script that I run over each new set of commits I fetch
that checks these things.

--=20
Cheers,
Stephen Rothwell

--Sig_/9+GW7cuk9ae9H_Au9Ppa+XY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltXz3kACgkQAVBC80lX
0Gw3dwf8CQD3KNnshB88ALbaJJH/5/p52FFqf4xhG7iif4MqgsC7+IAgUdLM399a
D48euC28HfLiijRTv03RJeBNxuy04jcRRheqEU0Kd2ghQR64H/trRelao4npt0ZX
g21IVGyoEZOOa5dcE9fnhFY0MT0lCS0MCMrWdiuAHk6r2desbxCJyUT52OSZmc2B
O2HpmGDRVAWswNd0a53JAK8wTOpovx5M7EFmOXhvCQ5Qy6j1WYbvfVV5T7xSAAcW
EYHz2E5vrdntcrJ4fDv3hxeGuqkkCdtlJcZC/ljgX1ZHrsPOi+1moiUqe09a2yN3
a6Tilx+Uktk6diSH4/7RUy5ibivHhg==
=9SgH
-----END PGP SIGNATURE-----

--Sig_/9+GW7cuk9ae9H_Au9Ppa+XY--
