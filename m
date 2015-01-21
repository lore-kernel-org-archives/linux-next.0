From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] tpm/tpm_tis: Add missing ifdef CONFIG_ACPI for
 pnp_acpi_device
Date: Thu, 22 Jan 2015 08:23:50 +1100
Message-ID: <20150122082350.121301eb@canb.auug.org.au>
References: <1421872815-16644-1-git-send-email-peterhuewe@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wt.I7iFoOTCF6VH7FCukKIr"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43560 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751999AbbAUVX6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Jan 2015 16:23:58 -0500
In-Reply-To: <1421872815-16644-1-git-send-email-peterhuewe@gmx.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Huewe <peterhuewe@gmx.de>
Cc: linux-next <linux-next@vger.kernel.org>, tpmdd-devel@lists.sourceforge.net, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jim Davis <jim.epost@gmail.com>

--Sig_/wt.I7iFoOTCF6VH7FCukKIr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Wed, 21 Jan 2015 21:40:15 +0100 Peter Huewe <peterhuewe@gmx.de> wrote:
>
> This fixes a build failure if CONFIG_PNP is set but CONFIG_ACPI is not:
> drivers/char/tpm/tpm_tis.c: In function =E2=80=98tpm_tis_pnp_init=E2=80=
=99:
> drivers/char/tpm/tpm_tis.c:912:45: error: invalid type argument of
> =E2=80=98->=E2=80=99 (have =E2=80=98int=E2=80=99)
>    acpi_dev_handle =3D pnp_acpi_device(pnp_dev)->handle;
>=20
> If CONFIG_PNPACPI is not set pnp_acpi_device is defined as 0 and thus
> accesing the handle is not possible.
>=20
> Fixes: 0dc553652102 ("tpm: fix raciness of PPI interface lookup")
> Reported-by: Jim Davis <jim.epost@gmail.com>
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> ---
>  drivers/char/tpm/tpm_tis.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
> index 20a61bc98db8..6725bef7cb96 100644
> --- a/drivers/char/tpm/tpm_tis.c
> +++ b/drivers/char/tpm/tpm_tis.c
> @@ -908,8 +908,10 @@ static int tpm_tis_pnp_init(struct pnp_dev *pnp_dev,
>  	if (is_itpm(pnp_dev))
>  		itpm =3D true;
> =20
> +#ifdef CONFIG_ACPI
>  	if (pnp_acpi_device(pnp_dev))
>  		acpi_dev_handle =3D pnp_acpi_device(pnp_dev)->handle;
> +#endif
> =20
>  	return tpm_tis_init(&pnp_dev->dev, acpi_dev_handle, start, len, irq);
>  }

To save on the ifdef, why not

	struct acpi_device *acpi;

	.
	.

	acpi =3D pnp_acpi_device(dev);
	if (acpi)
		acpi_dev_handle =3D acpi->handle;

As an aside, the dummy pnp_acpi_device() should be returning NULL not
0, and could be a static inline function (as could several other things
in that header.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/wt.I7iFoOTCF6VH7FCukKIr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUwBjrAAoJEMDTa8Ir7ZwVBHwQAILFhOmUPxcVFahzFgZILGgR
zZFcuLG731M9Fcma8cKFygNmHM0Kh5qZaC0GY8int9y2idgY3Ih1fs1QxoS6rIdu
+eRJQ1YXrPMjIX80HT6Js1v6xRzodFsHYZ8IzA2Cfgv/gMsfWgxS3UyahkwN2h0Y
SWUzSGRbXKXEMxBMGHNMjV5s/5DrRC9+nmZutLpRjxU6lUnsJShmPVRtJKI+/hmg
CJHGac2dsy0pvgG/cwSbd0ld7eD+O7jdtW90KiGPNQRM9kLBieC6uIGLsqfzC6vI
KdD50hqniFjvrHcokevUEffB1hn1ldJ27LR9gJeT4KEExaaiFH30+MqXcEjYIjAl
iDynveWMySdW8sfl/ufcQzPUoL+TemrIqmp7xZ+75LBWol09eJeg339dvgQuxo8v
hTnUrIErxFaiYMEM3y8N4ZFzRsc8R3X+6GkuBkg5AGP5qQsZ9U5JUy6lEiMUEHt4
/zqFoiz20/AD6TC/Ac6uezCIByEpGv7tjgs/NXt1wH+Vld5vCTr2rtTnyuqb9WPj
S2i+t2WPlgpeO+26X03Pi+MSWDlmmC26aiZaCri90YqXmgPXnXz0JRgLMPp1jyzz
gE+YfEpL4t4nKmCiY36z5hfqHOnbEJttuFVX9hF5pD40nT4r4coyiI0BF4lnTG2R
G0vv65HRRFHGdK3WhsJJ
=6Ofj
-----END PGP SIGNATURE-----

--Sig_/wt.I7iFoOTCF6VH7FCukKIr--
