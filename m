From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: bad merge in the y2038 tree
Date: Fri, 7 Dec 2018 10:07:29 +1100
Message-ID: <20181207100729.0ed0fc7a@canb.auug.org.au>
References: <20181207071147.3b41fb5c@canb.auug.org.au>
        <CAK8P3a1U9y7rHq9GUd-BrY4=aLLyBYZLm8X0JcKU6j2_sYCCmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2n92d5lkldTSpZBmyTD0Sgi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a1U9y7rHq9GUd-BrY4=aLLyBYZLm8X0JcKU6j2_sYCCmQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/2n92d5lkldTSpZBmyTD0Sgi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Thu, 6 Dec 2018 23:09:01 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Dec 6, 2018 at 9:12 PM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> >
> > The y2038 tree contains a merge of next-20181206.  I cannot use a tree
> > that includes a version of linux-next.  I assume that this was just a
> > test merge, so please remove it. =20
>=20
> Fixed now, I had pushed the wrong branch after I had done the test build =
to
> make sure that it wouldn't conflict with anything in yesterday's linux-ne=
xt.

I figured something like that.  Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/2n92d5lkldTSpZBmyTD0Sgi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwJq7EACgkQAVBC80lX
0GyW+wgAoNLe/mgbo5DZpSjEUo1sPipkaP0RI+ROZgxzRYaZ05vNCy6hWtmsIFdg
cBuiNlXbg3DwHWnylTr63CU8nZRrZ5ySys8CaQUcXaKa1IsIh2qRg0uo+1zlzJlk
l9Mu8QzL9WMAayWWYCZcypNGRHOPjMF56tmKyXIVm7J77hwLUn4bcp+2MWnT/S0H
ciMFqiPykjOcBVB5C2nIGYrBsN3rLCFZjSwCVJEoR9ye2/xAqhpV9tnmH96jjvbL
eQ6vrZCt1uxur5Wn65DIyUMNnOiZJjhe3OGibLcOHK/g6nwrGcmhdaN7ivYodvfg
OlR8W6wHSSidQUAeVn7DHbwfQ/v0sg==
=jo/D
-----END PGP SIGNATURE-----

--Sig_/2n92d5lkldTSpZBmyTD0Sgi--
