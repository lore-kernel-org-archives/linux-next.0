From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tegra tree
Date: Thu, 7 May 2015 14:06:17 +1000
Message-ID: <20150507140617.708b9c15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/O2RKgCklSl4kbLPLUF4UY74"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33778 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750701AbbEGEGZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 May 2015 00:06:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>

--Sig_/O2RKgCklSl4kbLPLUF4UY74
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tegra tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/clk/tegra/clk-emc.c: In function 'tegra_clk_register_emc':
drivers/clk/tegra/clk-emc.c:519:20: warning: assignment discards 'const' qu=
alifier from pointer target type
  init.parent_names =3D emc_parent_clk_names;
                    ^

Introduced by commit dc9fdb640b9f ("clk: tegra: Add EMC clock driver").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/O2RKgCklSl4kbLPLUF4UY74
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVSuS+AAoJEMDTa8Ir7ZwV+QQP/1v3S4aFedVbBlNl7rG3Ny/B
0khX+tOarl0kH6JLPDQq2PreZYTOGqlOKcFYaC6ZukF9yncIzn0+xUxQ8WYo9yLd
Hm3odmkjv9Eb7R0VCHpeQJ1a2INmCDBV2fovKFe7g9wTc88GtRcOBzlzkvt0g88v
uLdXWgtPGsXk5q67zIufVAHKnG67poAOfGSiGyVdvmDmJWMup4uiFrS0TdcbHBfE
fctT8dW1jDSTaAfTlhUweE8O2xEbvxGIkszAL4XZjz2TNE+rD1VbZ7e9zVFYj0jn
+OeEHllMvknl/3qUfeyOYiqCLT9fIhOHLL7CDtgdENm7KBjlOvt5NTB7cqUH+ndS
0wXHG32Ukqwv7oLNknXMC/+kZX/6d/lOk1tnkz4sbMG5n+EEA80mAk3nYhTQSqO0
hb0GpJf3IJXg2d2dh2/eB+N6rwM1l4MhpAA68OkDjqRLfPcl5MSOh0fDm6J9Q+Sr
ZkByVK1jdiOCe3b2VAuKSQWF/YFnrUTN5lO3gZ+sjdM0uHHG/BReJooXSHDO9tWV
hd0YFYBvV6zarr+ou9zuiogZTrFicPtiVPQxAg2MYCKFe4yzV1Isgpm2kyITFdUS
USofxAsijKFOXZQZw/HN4A2Le7AktFwNDIt9Ej95u5IVFMC8wUYZn7MwgGyQyJZr
CZGdBYqgKsZ9isdFzRkg
=N4Nl
-----END PGP SIGNATURE-----

--Sig_/O2RKgCklSl4kbLPLUF4UY74--
