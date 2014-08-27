From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2] regmap: of_regmap_get_endian() cleanup
Date: Wed, 27 Aug 2014 22:07:49 +0100
Message-ID: <20140827210749.GF17528@sirena.org.uk>
References: <1408466947-26593-1-git-send-email-swarren@wwwdotorg.org>
 <20140819211704.GS24407@sirena.org.uk>
 <CAMuHMdW1Ev9uTnWXTQxE0S+1SX2ahA7hFjHvb6JC5iRzgLJGFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NYD4lA55rUu1ktUD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW1Ev9uTnWXTQxE0S+1SX2ahA7hFjHvb6JC5iRzgLJGFw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <treding@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Xiubo Li <Li.Xiubo@freescale.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-next.vger.kernel.org


--NYD4lA55rUu1ktUD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 27, 2014 at 03:14:21PM +0200, Geert Uytterhoeven wrote:

> This morning I was greeted by some crashes, as your spi/for-next branch
> has just pulled in spi/topic/fsl-dspi, which contains regmap/dt-endian, but
> not the fixes :-(

Yes, probably.

--NYD4lA55rUu1ktUD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT/kiiAAoJELSic+t+oim92foP/R2ekLf88k8SjRPYnv99WQci
DoG8OrjEauH1SlJMLVdfCZfaDgZaV2A2oE4336xw2fD5aDaTOOEEP1cc5wpDW3CW
nhXBwYVRdFjXeBX6CcpYr0IkB1fDOuJYO1MoZti/bLL7UGYlozn09R+Qr24rl2yJ
gSJ/rSzYrHTm6P/3I9OWQR2Cv3k75A6AI48mweQWNxcawuJQ4WRckS/JDuw97w17
QDb16PtB0sTRzPKx93FV+0knIDSUFi/sQhoJZYHjWtH+30WwQVRDC2MrLzXMS/p2
xRqDaE8Xm5PllyTNfc2OlHq3gxf9Dbjbseed2o58wvmKaG9aHOwYPkt+Xw8BvLfU
pLESlXosmV2kISdtcq7FAQ00ti7EhQJuStRt8qkO2Atx1ItxAxtbqk3xYhKJZ4Dx
krqJXdD9/GkUFpnOwIJSdCywI4hgbex3WP7LYBWV4p1Q4S/DFypuTbSq/2s4RIcZ
6rSlG0uQAg1FSfU96LvJZLgGVHq0MLEXP09F2YCrYKgXq6Q5A1BVMjWqUFtBK1MG
jkimMS02OO2+yUWIMphwz+Q4eIrh3vy/m8x7FRuGkKd0N5YNgBO9LnRCoLpILhry
e0KoDlHlO3i3HqjAKEBt3yIJnItUFW65YZXnSFMD0u/eyOB/9JDygXtjQJR4Symx
iqd58nr+G3pQKOuX0NqM
=e5mD
-----END PGP SIGNATURE-----

--NYD4lA55rUu1ktUD--
