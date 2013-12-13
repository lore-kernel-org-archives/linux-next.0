From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mmc tree
Date: Fri, 13 Dec 2013 12:57:16 +1100
Message-ID: <20131213125716.f432c59bf8782a489400a5a7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__13_Dec_2013_12_57_16_+1100_zukTqccmKs8xWNx5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:60211 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751929Ab3LMB5W (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Dec 2013 20:57:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Ball <cjb@laptop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dong Aisheng <b29396@freescale.com>

--Signature=_Fri__13_Dec_2013_12_57_16_+1100_zukTqccmKs8xWNx5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chris,

After merging the mmc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR (phandle_references): Reference to non-existent node or label "pinctr=
l_usdhc4_1"

ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [arch/arm/boot/dts/imx6dl-sabresd.dtb] Error 2
ERROR (phandle_references): Reference to non-existent node or label "pinctr=
l_usdhc4_1"

ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [arch/arm/boot/dts/imx6q-sabresd.dtb] Error 2

Caused by commit fc4fafac9656 ("ARM: dts: sabresd: add usdhc4 support").

I have used the mmc tree from next-20131212 for today.

--=20
Cheers,
Stephen Rothwell <sfr@canb.auug.org.au>

--Signature=_Fri__13_Dec_2013_12_57_16_+1100_zukTqccmKs8xWNx5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSqmmAAAoJEMDTa8Ir7ZwVtFcP/j1qWoh57jq0DppZ2YoKue1Q
AgrJZymQvmZrKRGpF/T6G5aN81evrVBZ1MO7nsz2rGiRgeYpcVksVNE87P/A9WUi
5JOXxKidFOX9zLI752yo0QrDlq4jWiVm1FqvSSTOGsNNxNUQvwjlBqcSXtkcyDvM
w/3CzAS+Q3bLH1IC3bFuxSV5u+2drG3J+dbf0Izey0XdKlIfx2Kp/8umZfD4lGm1
RJPpDhZPqIvvzVWrNmlGGcRro5WoFBGvZZy6tj1QyVgMmdptoCiCvYWV/o14Pi/B
eun4UlSwvQY2SE6Kl6TR45zgrwlIUB7okw/u/8kRRxYsjYdcCcR4CC2lwqVfspjR
y8r1rBg85zsrkT0ETg3Ow1A5nXv1C0498McNDfEic2SROMu/9r6bPaK/JSKANAyQ
hdHyM/S5Vpr4nHNWWvMddn/kswupn6Mgz43q2lTKmiWeBjYkJEov4vcNgS3N+H9/
1SIGClp29zNpi0iZr18G4mJrjrsmcRfm960hfUWIG1MB2jx8MWUw/xVeYhLA3oRP
2r2awIhEUqXxEEvdrPJADaH/HDJocVPNRxsAof94XttaSrTltijp+hv8QyUzCBQ9
ETY/UQrdD2W1V8kmhsIg66bJMxMcnlikJCwqN1rc7BBH9cukUcCD1UsmK7iNH3OC
+h/4WgaQSbrJX1t9hb19
=n2lj
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Dec_2013_12_57_16_+1100_zukTqccmKs8xWNx5--
