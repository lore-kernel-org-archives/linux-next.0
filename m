From: Thierry Reding <treding@nvidia.com>
Subject: Re: linux-next: manual merge of the tegra tree with the imx-mxs tree
Date: Thu, 7 Feb 2019 09:49:48 +0100
Message-ID: <20190207084946.GA8741@ulmo>
References: <20190207095142.5ccc4a8a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207095142.5ccc4a8a@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawn.guo@linaro.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: linux-next.vger.kernel.org

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2019 at 09:51:42AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the tegra tree got a conflict in:
>=20
>   arch/arm64/configs/defconfig
>=20
> between commit:
>=20
>   9bd01e74c715 ("arm64: defconfig: Add i.MX8MQ boot necessary configs")
>=20
> from the imx-mxs tree and commit:
>=20
>   bc72bed682a9 ("arm64: defconfig: Enable Tegra TCU")
>=20
> from the tegra tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/arm64/configs/defconfig
> index e82bc8cf1253,ad8f3dea0a74..000000000000
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@@ -323,8 -319,7 +323,9 @@@ CONFIG_SERIAL_MESON_CONSOLE=3D
>   CONFIG_SERIAL_SAMSUNG=3Dy
>   CONFIG_SERIAL_SAMSUNG_CONSOLE=3Dy
>   CONFIG_SERIAL_TEGRA=3Dy
> + CONFIG_SERIAL_TEGRA_TCU=3Dy
>  +CONFIG_SERIAL_IMX=3Dy
>  +CONFIG_SERIAL_IMX_CONSOLE=3Dy
>   CONFIG_SERIAL_SH_SCI=3Dy
>   CONFIG_SERIAL_MSM=3Dy
>   CONFIG_SERIAL_MSM_CONSOLE=3Dy

Looks good to me.

Thierry

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxb8ScACgkQ3SOs138+
s6HRPg/+KwFzYrM5xwqCpacCYlcLCj3NEe9Prg6MfdrCGGN3txJRiGmgNE1RtJRY
MiJY9wLxhEAOD4qZq6OUaP3sL7blkdVegu8ilMlBfcAbk8iECdUk7ttpbcPheSdW
LxjqQ1fPYvIprZEA/hTOfhUAL3T8f6kWDfclVvKu4pQKnkq2XDGIdh1cEjZZwBcJ
Nae+x7Aw7Olr57UAO/XqlVkkSjHDNklOTkkaUvoQvxnNP4o/koUUQWq3vI21cuSl
pnijxr/Ee8efD2Kuu5XNxnO4snnuYjGGrmuXy2VI5Xwu1SfUeMBwbzjRvNhsxgHX
oz44YJlRAa7SNMk15814DL9AgGu4vNbTdOYtWNTKCYrEHL+ap9o/d9dNgHKAqhga
GS/NoN8Bk0xzQK/bnPCcT1DeuE+NGZp10NHnD1eqdDLxv09dsKsdQv5dXQ05OrMp
d1XKKRCtO/3RT1m9+JAjyeVBAodE4xh00sYDpGclYw+x4xISbeF5TOeHJRS6JuXK
CfFhRefxN1jYoJfgf94ZnqfBaRduJMaV2dduWD+cdNPr8EB7qrdSzUPQHZgLTiwN
OeQTNJsDPSrLghJOHkQQBfSBTPptiGnzR4h5jiXDS5UfMXj4MY62o6tfMvy/KOYm
Z8eqc91rTJhrK19v/OYibVenN87nRg0sN/4ZRaqSBPHUJXJRYZI=
=U5z5
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
