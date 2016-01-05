From: Thierry Reding <treding@nvidia.com>
Subject: Re: linux-next: build failure after merge of the mmc-uh tree
Date: Tue, 5 Jan 2016 17:30:52 +0100
Message-ID: <20160105163051.GB7287@ulmo.nvidia.com>
References: <20151231145329.63b42c86@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151231145329.63b42c86@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lucas Stach <dev@lynxeye.de>
List-Id: linux-next.vger.kernel.org

--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 31, 2015 at 02:53:29PM +1100, Stephen Rothwell wrote:
> Hi Ulf,
>=20
> After merging the mmc-uh tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/mmc/host/sdhci-tegra.c:361:38: error: redefinition of 'sdhci_tegr=
a210_pdata'
>  static const struct sdhci_pltfm_data sdhci_tegra210_pdata =3D {
>                                       ^
> drivers/mmc/host/sdhci-tegra.c:343:38: note: previous definition of 'sdhc=
i_tegra210_pdata' was here
>  static const struct sdhci_pltfm_data sdhci_tegra210_pdata =3D {
>                                       ^
> drivers/mmc/host/sdhci-tegra.c:370:42: error: redefinition of 'soc_data_t=
egra210'
>  static const struct sdhci_tegra_soc_data soc_data_tegra210 =3D {
>                                           ^
> drivers/mmc/host/sdhci-tegra.c:354:42: note: previous definition of 'soc_=
data_tegra210' was here
>  static const struct sdhci_tegra_soc_data soc_data_tegra210 =3D {
>                                           ^
> drivers/mmc/host/sdhci-tegra.c:372:14: error: 'NVQUIRK_DISABLE_SDR50' und=
eclared here (not in a function)
>   .nvquirks =3D NVQUIRK_DISABLE_SDR50 |
>               ^
> drivers/mmc/host/sdhci-tegra.c:373:7: error: 'NVQUIRK_DISABLE_DDR50' unde=
clared here (not in a function)
>        NVQUIRK_DISABLE_DDR50 |
>        ^
> drivers/mmc/host/sdhci-tegra.c:374:7: error: 'NVQUIRK_DISABLE_SDR104' und=
eclared here (not in a function)
>        NVQUIRK_DISABLE_SDR104,
>        ^
>=20
> Caused by patch
>=20
>    "mmc: tegra: Add Tegra210 support"
>=20
> turning up in two trees (mmc-uh and tegra) as separate commits and then
> further changes to this file in the mmc-uh tree.
>=20
> I used the version of the file from the mmc-uh tree.

Sorry about this. I had meant to send this to Ulf as a pull request
before the Christmas break but then got side-tracked and never got
around to it.

I've now removed that branch from the Tegra tree.

Thierry

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWi++4AAoJEN0jrNd/PrOhXG0P/Rv/jkADYudiY2Y0UNF1tTSd
CKlBm/qDl00BcLPt5Z2ps+Isgl1LpRwu7iDlw7l0p6+vq1DSxOxHyLNZ+sKJ0LMS
l8eMEGhZN/X8MfMFoQ/DT6WG21cIaGSldHayrA282okIYufmPt9ftfypO2ZrwYbZ
kyb5RSFweOuRyDjtSJdrBf1O68Y7wzkKaAOcLDtmlAQ9vfDKZ730Qw2T1wrXtROs
7uboO6hBV2daC+Tju2a+KiUBzqgezUhRpctcF1EckH5mwuDbJ7fFuW6O7j2xP5lI
79xIaKP4AzoMvprTBRl+GTNIA0Yq0uePN6Z14jk3xM1jfnfByMmFmDKiigmDfeqs
JwqdDRq8WYtT0oYFOS/p3ArfABACJ3z3evE6qd26J2Yz01ix5F2i2QWPMJ/wd3iP
wPx1Q1rvPfJSSFzU5mBNcu2VGJAbzO877ZJdZqt9lk2sDEfuW1UK0C6ssvgU4gQM
qR9wKCGmC06iHstxRtioxj+X4LGlZs6LQVfxX5XH6dQZS33OvGIPIfQMELH89uR/
Pfth9aZxiGLwLmIauXEJIHLixFMrhtOZ+LrOFgY6KmvnaXa/KT9J1wLyN4hAol/h
OzkIZAwbG4hz84cIBxAlfw2mZq79yM1XcBkLEjkxrnDEharRg5iLRaIEmN935GXf
qa8+bj92cYC6FTF7A7LO
=wb92
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
