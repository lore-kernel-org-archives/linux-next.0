From: Michal Simek <monstr@monstr.eu>
Subject: Re: linux-next: manual merge of the arm-soc tree with Linus' tree
Date: Mon, 01 Jun 2015 09:12:55 +0200
Message-ID: <556C05F7.70302@monstr.eu>
References: <20150601102511.316f0262@canb.auug.org.au>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="qUEaGRiCH0wfbQFExFNDhQtKVKR9g1rdd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:36432 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750868AbbFAHM7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Jun 2015 03:12:59 -0400
Received: by wgbgq6 with SMTP id gq6so106090317wgb.3
        for <linux-next@vger.kernel.org>; Mon, 01 Jun 2015 00:12:58 -0700 (PDT)
In-Reply-To: <20150601102511.316f0262@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Sullivan <nathan.sullivan@ni.com>, Michal Simek <michal.simek@xilinx.com>, David Miller <davem@davemloft.net>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qUEaGRiCH0wfbQFExFNDhQtKVKR9g1rdd
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 06/01/2015 02:25 AM, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/boot/dts/zynq-7000.dtsi between commit 9eeb5161397a ("ARM:
> zynq: DT: Use the zynq binding with macb") from Linus' tree and commit
> 4481b18b7cf0 ("ARM: zynq: DT: Use the zynq binding with macb") from the=

> arm-soc tree.
>=20
> I fixed it up (it looks like that latter is a newer version of the
> former, so I used it) and can carry the fix as necessary (no action
> is required).
>=20

David applied v1 of the patch. I have applied v2 (pulled via arm-soc)
which also keep backward compatible string. There should be two
compatible strings.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--qUEaGRiCH0wfbQFExFNDhQtKVKR9g1rdd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEARECAAYFAlVsBfgACgkQykllyylKDCGvTgCffQNV7XHFiC7J6x/xN/YolFx8
ugMAniyvJ+190/CmLuuP267u9lRaOu4v
=h7Rg
-----END PGP SIGNATURE-----

--qUEaGRiCH0wfbQFExFNDhQtKVKR9g1rdd--
