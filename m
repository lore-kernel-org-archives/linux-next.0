From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: occassional build errors
Date: Thu, 4 Oct 2018 13:41:41 +1000
Message-ID: <20181004134141.1840d8ea@canb.auug.org.au>
References: <20181003135038.24438d97@canb.auug.org.au>
        <CAK7LNARD6qxX1fz4XF7yj2vWZurayhtksQnGfHBEUtCTNLmGYw@mail.gmail.com>
        <20181003165534.4bc87bbe@canb.auug.org.au>
        <20181004103937.5601c02a@canb.auug.org.au>
        <20181004115653.6a97e131@canb.auug.org.au>
        <CAK7LNAQsvtyU_2Lm4gPSU=q9KeAwjPCfQiwUeOjw=JjUpks_Pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xbCOWcAoriy8X5JP_b__m7K"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAQsvtyU_2Lm4gPSU=q9KeAwjPCfQiwUeOjw=JjUpks_Pw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/xbCOWcAoriy8X5JP_b__m7K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Thu, 4 Oct 2018 12:09:54 +0900 Masahiro Yamada <yamada.masahiro@socionex=
t.com> wrote:
>
> OK, confirmed.
>=20
>=20
> This is a regression of
>=20
> commit bb5de5d28f730eeec0aa1ced51a6f11327cd1201
> Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> Date:   Thu Sep 13 17:20:41 2018 +0900
>=20
>     kbuild: remove unneeded link_multi_deps
>=20
>=20
>=20
> I will fix like follows for tomorrow's linux-next.  Thanks!

I am glad that there was a good reason :-)

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/xbCOWcAoriy8X5JP_b__m7K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu1i/UACgkQAVBC80lX
0Gy8yAf/fzfpewbLuZLZ5hY3AVnwEEdWvsSj4rothZ5xcCwjNu8QDkPrAvqCaMv3
NYXbu3QHlKgWMPbGqWweinA6TmyM4IPd/rWVg5sFk79QibPx3UgQRxgIbx02YHI5
cJ0riKrAbG8o0X/yWzIxvf4DeTC8dkgYlC0YJb4lTPO52YYjsOuhBYNlo7Y/PXp5
QTQAhfxSiE+c1RlJ135gFX41EAqycsNJhXSiR8c/n04hGvkoRRMYsmTONPEmtSuD
9Ja8XnPJhD0uroxKnU7UuM/fH2YccTndS98gPHhycHITgHUK58yN6KR8daiyEmyO
iP3hnV5/tGqAlRoWC67NxWTU/d90/w==
=v26Y
-----END PGP SIGNATURE-----

--Sig_/xbCOWcAoriy8X5JP_b__m7K--
