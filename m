From: Michal Simek <monstr@monstr.eu>
Subject: Re: linux-next: manual merge of the xilinx tree
Date: Tue, 20 Aug 2013 12:58:32 +0200
Message-ID: <52134BD8.4050004@monstr.eu>
References: <20130703111030.c0df2a231fc3e4ba6cb566cd@canb.auug.org.au> <51D3BC5C.1080505@monstr.eu> <20130703160247.bc20792d7bfaef893ee72137@canb.auug.org.au>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="WH6bNNW73KUdKPRV14JJL3FBhxIPlKCLi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ea0-f171.google.com ([209.85.215.171]:47294 "EHLO
	mail-ea0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750905Ab3HTK6m (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Aug 2013 06:58:42 -0400
Received: by mail-ea0-f171.google.com with SMTP id n15so135985ead.2
        for <linux-next@vger.kernel.org>; Tue, 20 Aug 2013 03:58:41 -0700 (PDT)
In-Reply-To: <20130703160247.bc20792d7bfaef893ee72137@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Simek <michal.simek@xilinx.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WH6bNNW73KUdKPRV14JJL3FBhxIPlKCLi
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On 07/03/2013 08:02 AM, Stephen Rothwell wrote:
> Hi Michal,
>=20
> On Wed, 03 Jul 2013 07:53:32 +0200 Michal Simek <monstr@monstr.eu> wrot=
e:
>>
>> I have fixed it - it should be fixed there soon.
>=20
> Thanks.
>=20
>> But I am thinking about removing this tree from linux-next
>> because we are pushing arm changes through arm-soc tree
>> and they require to have specific feature branches.
>=20
> Just let me know when you decide.
>=20

Please remove this tree from the linux-next testing.

xilinx          git     git://git.xilinx.com/linux-xlnx.git#arm-next

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--WH6bNNW73KUdKPRV14JJL3FBhxIPlKCLi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlITS9gACgkQykllyylKDCGBVgCfdb44aj53d6wTxUDPxilbQzB3
LVsAoIJR/52TSElNsHiZYVcVrOHOtKal
=mDww
-----END PGP SIGNATURE-----

--WH6bNNW73KUdKPRV14JJL3FBhxIPlKCLi--
