From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the qcom tree
Date: Thu, 29 Nov 2018 08:25:40 +1100
Message-ID: <20181129082540.4ceafca6@canb.auug.org.au>
References: <20181116101059.18ad3fc9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SN4eh0CRU8GVl=3z4orbLBe"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116101059.18ad3fc9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/SN4eh0CRU8GVl=3z4orbLBe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 16 Nov 2018 10:10:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the qcom tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> drivers/gpu/drm/msm/adreno/a6xx_gmu.c: In function 'a6xx_gmu_rpmh_arc_vot=
es_init.constprop':
> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:943:12: warning: 'pri_count' is use=
d uninitialized in this function [-Wuninitialized]
>   pri_count >>=3D 1;
>             ^~~
> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:948:12: warning: 'sec_count' may be=
 used uninitialized in this function [-Wmaybe-uninitialized]
>   sec_count >>=3D 1;
>             ^~~
>=20
> Introduced by commit
>=20
>   ed3cafa79ea7 ("soc: qcom: cmd-db: Stop memcpy()ing in cmd_db_read_aux_d=
ata()")
>=20
> # CONFIG_QCOM_COMMAND_DB is not set

I am still getting these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/SN4eh0CRU8GVl=3z4orbLBe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv/B9QACgkQAVBC80lX
0Gy62ggAlDWHi4LSmWRCg6HUZGvAE+NJA00y7bUKrFucfOuOpGKKJjkqd6ThzSDz
unzCwj7E0piXYRgNJdNJ0zu0R7oHd9fIKty353/gI7KfXThum9pgXotThulYm/UT
52pwxOGX4+PEKDsh4AT9O7mb6+9/I0235TkTH+v56CNDOb/zjnLYhcrjULhIW0D5
UhEutoBKKS+x+Jn1DXdgZZNhSraoCIl0q4K+yI8pQPjML11WTYak4SWdpaEUW9Zu
iJEIbUnEh97LVbtO4YSQ69gd/Jr1aqowl9tTHHp2AaglXVHOQ8IZWPjsNFXulmrx
jExalEAWG0XabYQGYxlyXsdeWf/5ug==
=u3Mf
-----END PGP SIGNATURE-----

--Sig_/SN4eh0CRU8GVl=3z4orbLBe--
