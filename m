From: Sebastian Reichel <sre@kernel.org>
Subject: Re: linux-next: build warning after merge of the battery tree
Date: Fri, 6 Jan 2017 00:29:03 +0100
Message-ID: <20170105232902.gyxlc2uj3yjw4g54@earth>
References: <20170105125342.3dcce8ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2imwef57ro54myhb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:52038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752106AbdAEX3L (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Jan 2017 18:29:11 -0500
Content-Disposition: inline
In-Reply-To: <20170105125342.3dcce8ab@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>


--2imwef57ro54myhb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

On Thu, Jan 05, 2017 at 12:53:42PM +1100, Stephen Rothwell wrote:
> After merging the battery tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> drivers/power/supply/axp20x_usb_power.c: In function 'axp20x_usb_power_pr=
obe':
> drivers/power/supply/axp20x_usb_power.c:297:21: warning: cast from pointe=
r to integer of different size [-Wpointer-to-int-cast]
>   power->axp20x_id =3D (int)of_device_get_match_data(&pdev->dev);

Can you send a follow-up patch fixing this false-positive warning?

-- Sebastian

--2imwef57ro54myhb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlhu1rsACgkQ2O7X88g7
+poV/g/+IYoAvsXzIx5fFS98vb9fWgb02FWWuNrP5g9LNdK0LonjSnRYtthAVXYC
+XH7YZLvn35jkU21ILqK5kagRoLWb89T5fVB6JJqy2plkjl4qP/BUHcV8Fm+kGVT
uaRoOcGv9Ca6QSyzGEheU8HlE0Ty6vavbiP+mm3s8O9mq87+3FiSHgB4FhbqGcai
Ofj3EtjQvKWImpSRAgeWTZsBAf557oNZHNMg9HCO2AVSERfNmXqG0V2/37P5UKvh
0CTkXfdYSJ/tLGVErU7s0Seg2jGkvBtPms1Iz/D4koqkXajnWoZk3A6wnZ5UhsSm
Qi4iABAJsvdM4jsZsyMvwM+RPSVE8/B7fPE9f6n0DZDGViyF0Qet98/S/Eo1+wVf
5TCQ/a/IIafi4rdSlyI1i6SfzCQSrFV+sxfAC7IugBd5dP3VPW2OjSPimWn9c+Ro
I6XE7d7s7cQt19Q1EReTkNl+CGa87ujKmH6+3yfRAh/NnDFoiA2zoz5thtY1EqzT
8SB4iCHlrhU7Dnjy+/SC0g/BcDLjTDMJ+eiHu6Y0PxeXfnJb2g3DHDxTdqx/jEMp
oPsnNFcyw/xQ1wbDFPoPO/KnG9MXjMWnxh6COe9Vs71RvX1ouWYYFICLSR/7p4yP
mOxz/kpmETEZ7iEny9BZs/brB07c5M9m1M81EVpEy48WAMsKp2s=
=LngH
-----END PGP SIGNATURE-----

--2imwef57ro54myhb--
