From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the pinctrl
 tree
Date: Thu, 8 Mar 2018 11:36:47 +1100
Message-ID: <20180308113647.75279391@canb.auug.org.au>
References: <20180308073921.5c104e74@canb.auug.org.au>
        <CACRpkdaWd_7QWd7t5i6DvU3_Gu1giR9v2uoqQiLNXVWTPEty8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fPX23p+65JglBHjx_00rr7J"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaWd_7QWd7t5i6DvU3_Gu1giR9v2uoqQiLNXVWTPEty8w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/fPX23p+65JglBHjx_00rr7J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 7 Mar 2018 23:25:48 +0100 Linus Walleij <linus.walleij@linaro.org> =
wrote:
>
> On Wed, Mar 7, 2018 at 9:39 PM, Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> > Commit
> >
> >   fc08fa6009a0 ("pinctrl: sh-pfc: r8a7795: remove duplicate of CLKOUT p=
in in pinmux_pins[]")
> >
> > is missing a Signed-off-by from its committer. =20
>=20
> Looping in Geert,
>=20
> I guess this came in through the Renesas PFC pull request.
>=20
> Geert do you prefer that I back it all out so you can send me
> a new pull request? Or some other solution?

But you are listed as the committer ...
--=20
Cheers,
Stephen Rothwell

--Sig_/fPX23p+65JglBHjx_00rr7J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqghZ8ACgkQAVBC80lX
0Gy8ZAf/QWwQ8GKG7GLgDnkAvk3Pp7zF0N+cqMN5iz7J0s8kcnoiNS42iegfus/h
5h97ggHsBo2zDNbeKqO0jDywOcuP84uGZ6lPt3Vk56/be7OgXyx6SoNSmtWyuqOP
OZBMpilQzYarOFP8lGPAcwdyZDw5WFqraCh7zIyESZWFf5uOYdNtGi7tZDoPwh5m
6tabb0mDCa7JH60jAAZxH9yP6DBfha/wn36Nds0TDMFED9WACXjPUeUN0vocjKns
eDexZPvHQFbXHGFGMxAdA1bXfEhAcDpf8/emwNz1/++oxiHBeclSGu0DZcXlPBqL
Ybo/ynu5jq7unRUQCmvD36DNTbAmFw==
=SMLf
-----END PGP SIGNATURE-----

--Sig_/fPX23p+65JglBHjx_00rr7J--
