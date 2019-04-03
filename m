From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 3 Apr 2019 10:35:18 +0700
Message-ID: <20190403033518.GI2059@sirena.org.uk>
References: <20190403111108.2ff4a309@canb.auug.org.au>
 <CAMz4ku+17HAZfh-03+y=WUy1NdsL7sQHK_XyzeToBh5-RAUSQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ggHp9WSrPOeNxb0b"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMz4ku+17HAZfh-03+y=WUy1NdsL7sQHK_XyzeToBh5-RAUSQg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yintang Ren <yintang.ren@unisoc.com>
List-Id: linux-next.vger.kernel.org


--ggHp9WSrPOeNxb0b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 03, 2019 at 10:12:47AM +0800, Baolin Wang wrote:

> snd-soc-sprd-platform-objs := sprd-pcm-dma.o sprd-pcm-compress.o

> obj-$(CONFIG_SND_SOC_SPRD) += snd-soc-sprd-platform.o

> I will send out one incremental patch to fix this issue after my
> business trip. Thanks.

We can't leave this broken in -next for that long, can you please post
the patch now if you've already got it?

--ggHp9WSrPOeNxb0b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlykKfUACgkQJNaLcl1U
h9BY6gf/ZpB3yEl94efbF5gOaXY6r5fyhFa25W+G+efPdBL5r6Cp8fcrlhZASCEy
I98JPfaJiXhlognp4F0hYLcbWvELt7MGWGPB8k4ANk9/H+/WCvnXPMqLF8fucY4x
qW2ZiaJLp7zwwiIkwh6LXTwHDX0labfeYFo5q8NCuAVEftvjUouKLHJfff+wmGvz
M7ZRaOumz+lQ4HkQRkdm2YAjZjpeC2pk9+yvklDIuX4gwyzSsuS4Wb82UNZP0ipR
s2CoN8pajVkQv4799FuoH4stqjYCmLh8rZ1HeB6VqTXcVask7iQZiRszCc3D7JT4
0MCUe4zSHp4vmbt5jiTx3rSViImkAg==
=fM9m
-----END PGP SIGNATURE-----

--ggHp9WSrPOeNxb0b--
