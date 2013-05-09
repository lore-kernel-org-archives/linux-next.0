From: Michal Simek <monstr@monstr.eu>
Subject: Re: linux-next: manual merge of the microblaze tree with Linus' tree
Date: Thu, 09 May 2013 08:55:49 +0200
Message-ID: <518B4875.9000303@monstr.eu>
References: <20130509103513.8432fb1f7834a57de404f2a7@canb.auug.org.au>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2XWBFHJWVVDCCRNGFUSHJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:41230 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750831Ab3EIGz7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 May 2013 02:55:59 -0400
Received: by mail-ee0-f50.google.com with SMTP id c41so1324686eek.9
        for <linux-next@vger.kernel.org>; Wed, 08 May 2013 23:55:58 -0700 (PDT)
In-Reply-To: <20130509103513.8432fb1f7834a57de404f2a7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiang Liu <liuj97@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2XWBFHJWVVDCCRNGFUSHJ
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Stephen

On 05/09/2013 02:35 AM, Stephen Rothwell wrote:
> Hi Michal,
>=20
> Today's linux-next merge of the microblaze tree got a conflict in
> arch/microblaze/mm/init.c between commit 7beb5987875b ("mm/microblaze:
> use common help functions to free reserved pages") from Linus' tree and=

> commits 17408c87ba9e ("microblaze: Fix free_init_pages function") and
> c5c09c08718b ("microblaze: Fix initrd support") from the microblaze tre=
e.
>=20
> I just used the version from Linus' tree (I am not sure if that is the
> correct solution) and can carry the fix as necessary (no action is
> required).

Thanks for reporting this. I will look at it and fix it.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



------enig2XWBFHJWVVDCCRNGFUSHJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlGLSHUACgkQykllyylKDCE4YwCeLeUI5f7LxzmUDpV+10ihRYFP
DHIAoI10tcvnGXjRIPnhlTj4+iYW+53v
=PbKd
-----END PGP SIGNATURE-----

------enig2XWBFHJWVVDCCRNGFUSHJ--
