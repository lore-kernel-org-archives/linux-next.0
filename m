From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH linux-next] arm: zynq: fix compilation warning
Date: Thu, 27 Jun 2013 15:01:51 +0200
Message-ID: <51CC37BF.8030309@monstr.eu>
References: <1372336962-6459-1-git-send-email-vincent.stehle@freescale.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2STBNAGOUBSRUVMTIETRM"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372336962-6459-1-git-send-email-vincent.stehle@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Robin Holt <holt@sgi.com>, Michal Simek <michal.simek@xilinx.com>, Russell King <linux@arm.linux.org.uk>, trivial@kernel.org, Arnd Bergmann <arnd@arndb.de>holt@sgi.com
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2STBNAGOUBSRUVMTIETRM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

Arnd asked in this post
http://www.mail-archive.com/linux-kernel@vger.kernel.org/msg454947.html
to fold his small patch to that larger one.

Not sure why it is not there.
Arnd, Robin?

Thanks
Michal


On 06/27/2013 02:42 PM, Vincent Stehl=C3=A9 wrote:
> Fix the following compilation warning:
>=20
>   arch/arm/mach-zynq/common.c:110:2: warning: initialization from incom=
patible pointer type [enabled by default]
>   arch/arm/mach-zynq/common.c:110:2: warning: (near initialization for =
=E2=80=98__mach_desc_XILINX_EP107.restart=E2=80=99) [enabled by default]
>=20
> Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@freescale.com>
> Cc: Robin Holt <holt@sgi.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: trivial@kernel.org
> ---
>=20
>=20
> Hi,
>=20
> This warning was seen on linux-next tag next-20130627, with config ARM
> multi_v7_defconfig.
>=20
> Best regards,
>=20
> V.
>=20
>=20
>  arch/arm/mach-zynq/common.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-zynq/common.c b/arch/arm/mach-zynq/common.c
> index 4130e65..8ea5f11 100644
> --- a/arch/arm/mach-zynq/common.c
> +++ b/arch/arm/mach-zynq/common.c
> @@ -91,7 +91,7 @@ static void __init zynq_map_io(void)
>  	zynq_scu_map_io();
>  }
> =20
> -static void zynq_system_reset(char mode, const char *cmd)
> +static void zynq_system_reset(enum reboot_mode mode, const char *cmd)
>  {
>  	zynq_slcr_system_reset();
>  }
>=20


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



------enig2STBNAGOUBSRUVMTIETRM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlHMN78ACgkQykllyylKDCFOOgCeId/zVK/yXVupdorfCD5eEVxZ
PrYAn2t5blG6GhNrSwchF8UCoRnQki3W
=2zqQ
-----END PGP SIGNATURE-----

------enig2STBNAGOUBSRUVMTIETRM--
