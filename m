From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: linux-next: manual merge of the tegra tree with the imx-mxs tree
Date: Thu, 7 Feb 2019 09:01:55 +0000
Message-ID: <20190207090154.myin5rcs3kprostg@fsr-ub1664-175>
References: <20190207095142.5ccc4a8a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207095142.5ccc4a8a@canb.auug.org.au>
Content-Language: en-US
Content-ID: <791CA834A472C246B4022A7108EAE047@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawn.guo@linaro.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 19-02-07 09:51:42, Stephen Rothwell wrote:
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

Looks fine to me.

Abel=
