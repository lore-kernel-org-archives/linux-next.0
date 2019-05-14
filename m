From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the ecryptfs tree
Date: Tue, 14 May 2019 11:03:34 +1000
Message-ID: <20190514110334.424cf0be@canb.auug.org.au>
References: <20190514100910.6996d2f5@canb.auug.org.au>
        <CAK7LNAT_aJ4-abaNXe5VwvAYa2TOprjFL-vcUc730EDwHq80kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5BQ7GiXSJF5T3Uj/S7ohPa1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAT_aJ4-abaNXe5VwvAYa2TOprjFL-vcUc730EDwHq80kw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/5BQ7GiXSJF5T3Uj/S7ohPa1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

Also, this:

On Tue, 14 May 2019 09:40:53 +0900 Masahiro Yamada <yamada.masahiro@socione=
xt.com> wrote:
>
> > Mind you, I have no itdea why this file was begin rebuilt, the merge
> > only touched these files:
> >
> > fs/ecryptfs/crypto.c
> > fs/ecryptfs/keystore.c

Its a bit annoying that the module was even being looked at given
nothing it files depend upon had been modified.
--=20
Cheers,
Stephen Rothwell

--Sig_/5BQ7GiXSJF5T3Uj/S7ohPa1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzaE+YACgkQAVBC80lX
0GzpoQf/caGdA8WFtsZ9ghTTbdiRa0Myjrpol829RHpwJ4CBGPNn1Bq1Dag9/3Jq
RmgTEoRbiZ2Gxnfi8UDnPewSiK8mXHUH1AJxBqdY7Dll7JvaiLqpyaKL/3zoH57e
qtizru4sfkk1ZfFZuwJ8GnZMfi+UEGv4+973iJ9g9cstP4VADqq8rHd3VrKf+rKc
lSGZmLsIQBKLqm7SMKh1O+jXDdWxA1Zw1yrGwk1Ze2GvchTiCIuY1XK+Kd5+201J
knvUWVH5mLoyI8u3dGn/1NHDDSdKUREy8nTbNwq7tNcZpgOMMo/9QIjCZc/T3ecy
fYYVg0KYzWlVSGmiojcgsMOIMYivJg==
=/ylh
-----END PGP SIGNATURE-----

--Sig_/5BQ7GiXSJF5T3Uj/S7ohPa1--
