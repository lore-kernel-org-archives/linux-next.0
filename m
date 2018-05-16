From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Date: Wed, 16 May 2018 17:26:01 +1000
Message-ID: <20180516172601.03188b22@canb.auug.org.au>
References: <20180515155038.7387bf2c@canb.auug.org.au>
        <CAK7LNASNMZbz=re1sRzh8Ffkt8g78=ddV7d_TZm4MVq1+JS-hA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NCfuoTAPXRkf9v+T2kpLIVN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNASNMZbz=re1sRzh8Ffkt8g78=ddV7d_TZm4MVq1+JS-hA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

--Sig_/NCfuoTAPXRkf9v+T2kpLIVN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Wed, 16 May 2018 15:01:38 +0900 Masahiro Yamada <yamada.masahiro@socione=
xt.com> wrote:
>
> How should I handle your fix-up?
>=20
> May I squash into the original one if you ack to do it,
> or is it better to keep it as a separate patch?

Either way is fine by me, but the former reduces the bisection gap.  So
it depends on whether you want to rebase your tree or not.

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell

--Sig_/NCfuoTAPXRkf9v+T2kpLIVN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlr73QkACgkQAVBC80lX
0GzABwf/e/qRmPZqUY2UDk1i0wqlaZ7jpY83UhcvVJKKo3BmWTSvdjgyo7kvhNbv
BgINZYx726O7cr2KjkNzvNyoMGBcTb3DPyHpa1fL2anC/E6zrVFqgOK+qitBLumb
6kpqtDyJo1ebCBmeU71o5NIJIQ56AV68gerUVJDCtlKt7uzG8hHPd3H2VcxQ/m6g
GXoVnwzqdaX4V3SXhWbM53MQfSy77Elu9yjX/0KmZAbF6Vd1uyRSWtH/enRKQpah
5sA98mmxrA3fmpsxLYxL36PstcOi8HSWSWiZnqjHrw/Ia2iCpJv+nR/GymWCKPFy
0V10vdczDJNihtDY9VLDZL1HkYMOWA==
=ABeq
-----END PGP SIGNATURE-----

--Sig_/NCfuoTAPXRkf9v+T2kpLIVN--
