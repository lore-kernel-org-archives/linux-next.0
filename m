From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the thermal tree
Date: Fri, 8 Jun 2018 11:07:15 +1000
Message-ID: <20180608110715.29081e25@canb.auug.org.au>
References: <20180608105120.2e232f44@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_Tya2BKs_+uro/uaB=KpTxi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608105120.2e232f44@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/_Tya2BKs_+uro/uaB=KpTxi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 8 Jun 2018 10:51:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the thermal tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/thermal/qcom/tsens.c: In function 'tsens_probe':
> drivers/thermal/qcom/tsens.c:144:31: error: 's' undeclared (first use in =
this function)
>          num_sensors * sizeof(*s), GFP_KERNEL);
>                                ^
>=20
> Caused by commit
>=20
>   6d7c70d1cd65 ("thermal: qcom: tsens: Allow number of sensors to come fr=
om DT")
>=20
> interacting with commit
>=20
>   0ed2dd03b94b ("treewide: Use struct_size() for devm_kmalloc() and frien=
ds")
>=20
> from Linus' tree.  It looks like git somehow screwed up the automatic
> conflict resolution.

OK, this was caused by a bad rerere entry in my tree (from my recent import=
 of Andrew's mmotm patch series).  Sorry about that, I have fixed it up.

--=20
Cheers,
Stephen Rothwell

--Sig_/_Tya2BKs_+uro/uaB=KpTxi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsZ1sMACgkQAVBC80lX
0GwWWggAgqKYV8dMqSbBhrlPkFk/SY2l1fG65Bn6VUbTNt1YsGHJTPiE5/POMFVz
kG9WHb1keYYyfYC81WLVrBjq2r7lMFWyakLR/3IQL0lur227JYKnlEJMEkueZCPz
kT+qfkNbibgL+Ye8Lz/P/FL6ukGpaAVJm6otYb2E46B360SZSm5LPTMmI2wTow4R
fc7XtzGL+MbHlMTQQqZ7G1fwIl5XF/CjVx+F8ESUXcAl4P5sSvzvgwGHfV8WPV0I
mfdv1mzgx5Tm5UJFLYFY3J9G5yJSmShlOT962HF/cAf32f61ENpmuaI8GDkYm00S
ZfLMZL8TJOqLnrxHmwOfMGYku3sxcQ==
=GRTJ
-----END PGP SIGNATURE-----

--Sig_/_Tya2BKs_+uro/uaB=KpTxi--
