From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] DMA: PL330: Fix build error (on linux-next-20120924)
Date: Wed, 26 Sep 2012 11:16:50 +1000
Message-ID: <20120926111650.724546b8d46f3cf94d046eab@canb.auug.org.au>
References: <1348546800-15857-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__26_Sep_2012_11_16_50_+1000_MSJ.xCB0VMoqpdZj"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:43314 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753967Ab2IZBQ7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Sep 2012 21:16:59 -0400
In-Reply-To: <1348546800-15857-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-next@vger.kernel.org, patches@linaro.org, Inderpal Singh <inderpal.singh@linaro.org>, Vinod Koul <vinod.koul@linux.intel.com>

--Signature=_Wed__26_Sep_2012_11_16_50_+1000_MSJ.xCB0VMoqpdZj
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sachin,

On Tue, 25 Sep 2012 09:50:00 +0530 Sachin Kamat <sachin.kamat@linaro.org> w=
rote:
>
> Auto resolution of merge conflict between commits 61c6e753 (DMA: PL330:
> Check the pointer returned by kzalloc) from Linus tree and 7c71b8eb
> (DMA: PL330: Remove redundant runtime_suspend/resume functions) from slav=
e-dma
> tree probably led to this build error.
>=20
> drivers/dma/pl330.c: In function =E2=80=98pl330_probe=E2=80=99:
> drivers/dma/pl330.c:2921:3: error: label =E2=80=98probe_err5=E2=80=99 use=
d but not defined
>=20
> Cc: Inderpal Singh <inderpal.singh@linaro.org>
> Cc: Vinod Koul <vinod.koul@linux.intel.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

I have added this as a merge fix from today.

Vinod:

Please remember to let Linus know when you ask him to merge the slave-dma
tree during the merge window (or do a commented back merge of the
appropriate part of Linus' tree and fix it before then).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__26_Sep_2012_11_16_50_+1000_MSJ.xCB0VMoqpdZj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQYleCAAoJEECxmPOUX5FE1wUP/0z2ys8VRsxR1D9+Qd+tTvAo
XDn9rvwZW3yVG2AG0IOVI5WbBLftcQwO9D86LLobxV8zedv6dhp/C2hmPseGdEhk
2u3g+TADVcZ8B/jBmZzsggrtMNTJCjXEcQV38PKQPNtcOK5TafxjkmlT5qrhnmlf
pBINi28nlNXyJeKUb26EgHUZfsVdz5z8GrdLmaWZa9JBCWZT41cYG8nvVZiAGJi1
Dd1idzMJBKlfVhLdEA1BJIAB94uqBYazEpMaEfQhTTQRT9O6XJ7Irh+5pw7Q0D++
4Yp68Nxc5pHTNCwjbeTMSLRnfTPB9yoNGjEtgwcGUWseY/8htBFb6k8LT4Qles4O
YU7zsaGXuj5IpItP+Vh1n4+Z2jBAVvIWxlSnk1Mqz3kS3bvzv28CPo1V3rtyLxFH
pTFPB8aQz5g6lysKKU0a5cUSfikyorgWiY4FpDwnOjDw2QIYRxe3720ffpufE+gr
x8o2ED5Pbe7Dmc5ub7CcFmZUD7qaq3rfqPWHxTwlO+Bh7BK3w3AXXty50UiaE12y
KnklhURUR7i9HRJDrzrwBHfGflngljadPY6duRRnv7LdMmn2zFN/R697a5AKVrba
1oSLpqw4kAbazDMZTEe5XXXGKbkImVYJc6IE7/KIhbXSaR7lP8/1F+BrPSLljQVu
RBKxK57G35YxcFQfWQpz
=N/sr
-----END PGP SIGNATURE-----

--Signature=_Wed__26_Sep_2012_11_16_50_+1000_MSJ.xCB0VMoqpdZj--
