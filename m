From: Thierry Reding <treding@nvidia.com>
Subject: Re: linux-next: manual merge of the irqchip tree with the tegra tree
Date: Mon, 16 Mar 2015 11:04:58 +0100
Message-ID: <20150316100457.GF30817@ulmo.nvidia.com>
References: <20150316145508.62cad7d0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lkTb+7nhmha7W+c3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13210 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751450AbbCPKFI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2015 06:05:08 -0400
In-Reply-To: <20150316145508.62cad7d0@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Bob Mottram <bob.mottram@codethink.co.uk>

--lkTb+7nhmha7W+c3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2015 at 02:55:08PM +1100, Stephen Rothwell wrote:
> * PGP Signed by an unknown key
>=20
> Hi Jason,
>=20
> Today's linux-next merge of the irqchip tree got a conflict in
> arch/arm/mach-tegra/irq.c between commit 0a63e1e0617f ("ARM: tegra: Fix
> big-endian issue with IRQ code") from the tegra tree and commit
> 1a703bffd82e ("ARM: tegra: remove old LIC support") from the irqchip
> tree.
>=20
> I fixed it up (the latter removed the code changed by the former) and
> can carry the fix as necessary (no action is required).

Hi Jason,

There's a chance that we might get a couple of other patches for Tegra
that conflict with this series. Would you be able to provide a stable
branch that I can pull into the Tegra tree to resolve those. Another
alternative, if you're okay with it, would be for you to ack the series
and back it out of your tree and I'll take it through the Tegra tree (I
could also provide a stable branch if necessary).

Thierry

--lkTb+7nhmha7W+c3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVBqrGAAoJEN0jrNd/PrOhsuoP/3buhDPD+OQAzc4kD6XTdRHW
6VNhx08SnNa+hto2VMTivtyfiO01O/l4iOmPjdxynGO0pTvELYdwstN/NrdiqE6f
pUFCq17XwuEHsc8V57I9u/4PmC9B/rwdYjP21VEgvd49jqTOBX7OibmFYKo50+7b
2HyxX5GFShGsv+qfiXvLhmdcIQCn6xfeOTzcxJ81p0sJTjA0UkeS0gKJ41lHCety
aTGXN3u6VpCkW6yCIW2woeAhfoEn6sn/qG4arNsN/QABOBdrptrGrfTYN+f/u9SD
8rZ33gIdCZVbjBpAZ9ehsk3uwX7FjeQSnfDVxzjDFK85E0btiYmwMnIccZUzSgbr
WyxbeX2kag6By9meLlmpK+HfTKIcEoMzvyDPVq0Nx9Bu+zUqlQx3rLk+9fvMAmTt
SE1YhfkW9xCC3uEObc6Xr+G6vHeOSx35448VZIfnPp9YYiYC4r2Ki6IhHv4DibFj
E9rTyFrvChRlyipQks+jHXLI0msCtXhyp4O3uECY3s5EvoxfcCSPhGfm1rkyKQK7
5KXeVDrbOcx5s/x4Pndc+73tJ/fac9+2SOH1LeWmOZxlpY+MbPyUukd3ZBKRkmuS
PA8e2JcbauwmjCiqYb1YVrbrzL8vSsGQk1J0D0xO4B+cg7uOr4xppdgmoBXwS3yX
6i8EZs/MsbqPgX/nQyNR
=/Y3F
-----END PGP SIGNATURE-----

--lkTb+7nhmha7W+c3--
