From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the pinctrl
 tree
Date: Mon, 16 Jul 2018 18:29:44 +1000
Message-ID: <20180716182944.593cca3c@canb.auug.org.au>
References: <20180716081018.21bfe495@canb.auug.org.au>
        <CACRpkdZ5BA1wn=TPn4yWkwWd3pAKh9wuMHd9woBF=+6+L1jtFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kLgnjxYTczi979.lb9L=53H"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ5BA1wn=TPn4yWkwWd3pAKh9wuMHd9woBF=+6+L1jtFA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Next Mailing List <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/kLgnjxYTczi979.lb9L=53H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, 16 Jul 2018 09:52:44 +0200 Linus Walleij <linus.walleij@linaro.org>=
 wrote:
>
> On Mon, Jul 16, 2018 at 12:10 AM Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> > Commits
> >
> >   bc319333c156 ("pinctrl: sh-pfc: r8a77965: Add HSCIF pins, groups, and=
 functions")
> >   99500c6a4836 ("pinctrl: sh-pfc: r8a77990: Revise USB ID pin name")
> >   3d3c62d3458a ("pinctrl: sh-pfc: r8a77990: Add USB2.0 pins, groups and=
 functions")
> >   1e0f13198edf ("pinctrl: sh-pfc: r8a77990: Add USB3.0 pins, groups and=
 functions")
> >
> > are missing a Signed-off-by from their committer. =20
>=20
> I am looking at this and I just feel confused. Top to bottom:
>=20
  ...
>=20
> This is very confusing, it looks correct to me.
>=20
> As usual it must be some minor syntactic thing like a character missing or
> something, I am just soo.... what's wrong here, really?

In the tree I fetched this morning, those commits are all committed by
you, but you did not add a Signed-off-by to then.  This usually happens
when you rebase a branch/tree.

$ git show --pretty=3Dfull bc319333c156
Author: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Commit: Linus Walleij <linus.walleij@linaro.org>

    pinctrl: sh-pfc: r8a77965: Add HSCIF pins, groups, and functions
   =20
    This patch adds HSCIF{0,1,2,3,4} pins, groups and functions to
    the R8A77965 SoC.
   =20
    Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
    Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

...
--=20
Cheers,
Stephen Rothwell

--Sig_/kLgnjxYTczi979.lb9L=53H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltMV3gACgkQAVBC80lX
0GxMWwf/YZvd4hqOAfL2UhJyun7iZGlsrpadv91AJ4UhAUAa2HSlvZxm2+tzvKIz
8rtPPKdGAfdD7Vat+ERMnXGqopUPB/nDWS6sHgkvcYOocPbrfpD6B2bwx6vGlD/V
E83iWksEpWSdw1DxI+CApncqY5CZl57H0rpatsgZ8Nz5Q6iGHbD7JGBddPpyiYU1
gQtV9E8Tu/DMHyRbUbwdKzdVHWztWOgckHuMeMrcoLhFLyA1J0/OfRAujlWqubkG
kvryf1/WdOvNbhi4VDlYhoPnAzxpLZDIANihK/lUELPVmLtf1GRtCY86Ro0sRY9o
rjp2hE6Ao3zEAmQOG70PDMlz8HcYsw==
=l3ht
-----END PGP SIGNATURE-----

--Sig_/kLgnjxYTczi979.lb9L=53H--
