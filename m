From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the extcon tree
Date: Thu, 4 Jun 2015 19:18:38 +1000
Message-ID: <20150604191838.26c8ac23@canb.auug.org.au>
References: <20150525210503.6bd3dec3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7O3.IC4qKg0nMmcJWe6z3+t"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59249 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751878AbbFDJSp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Jun 2015 05:18:45 -0400
In-Reply-To: <20150525210503.6bd3dec3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sebastian Reichel <sre@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ramakrishna Pallala <ramakrishna.pallala@intel.com>, Lee Jones <lee.jones@linaro.org>

--Sig_/7O3.IC4qKg0nMmcJWe6z3+t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This is now needed when the char-misc and battery trees are merged ...

On Mon, 25 May 2015 21:05:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the extcon tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> drivers/power/axp288_charger.c: In function 'axp288_charger_probe':
> drivers/power/axp288_charger.c:851:8: error: incompatible type for argume=
nt 2 of 'extcon_register_notifier'
>   ret =3D extcon_register_notifier(info->cable.edev, &info->cable.nb);
>         ^
> In file included from drivers/power/axp288_charger.c:29:0:
> include/linux/extcon.h:240:12: note: expected 'enum extcon' but argument =
is of type 'struct notifier_block *'
>  extern int extcon_register_notifier(struct extcon_dev *edev, enum extcon=
 id,
>             ^
> drivers/power/axp288_charger.c:851:8: error: too few arguments to functio=
n 'extcon_register_notifier'
>   ret =3D extcon_register_notifier(info->cable.edev, &info->cable.nb);
>         ^
> In file included from drivers/power/axp288_charger.c:29:0:
> include/linux/extcon.h:240:12: note: declared here
>  extern int extcon_register_notifier(struct extcon_dev *edev, enum extcon=
 id,
>             ^
> drivers/power/axp288_charger.c:912:2: error: incompatible type for argume=
nt 2 of 'extcon_unregister_notifier'
>   extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
>   ^
> In file included from drivers/power/axp288_charger.c:29:0:
> include/linux/extcon.h:242:12: note: expected 'enum extcon' but argument =
is of type 'struct notifier_block *'
>  extern int extcon_unregister_notifier(struct extcon_dev *edev, enum extc=
on id,
>             ^
> drivers/power/axp288_charger.c:912:2: error: too few arguments to functio=
n 'extcon_unregister_notifier'
>   extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
>   ^
> In file included from drivers/power/axp288_charger.c:29:0:
> include/linux/extcon.h:242:12: note: declared here
>  extern int extcon_unregister_notifier(struct extcon_dev *edev, enum extc=
on id,
>             ^
> drivers/power/axp288_charger.c: In function 'axp288_charger_remove':
> drivers/power/axp288_charger.c:923:2: error: incompatible type for argume=
nt 2 of 'extcon_unregister_notifier'
>   extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
>   ^
> In file included from drivers/power/axp288_charger.c:29:0:
> include/linux/extcon.h:242:12: note: expected 'enum extcon' but argument =
is of type 'struct notifier_block *'
>  extern int extcon_unregister_notifier(struct extcon_dev *edev, enum extc=
on id,
>             ^
> drivers/power/axp288_charger.c:923:2: error: too few arguments to functio=
n 'extcon_unregister_notifier'
>   extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
>   ^
> In file included from drivers/power/axp288_charger.c:29:0:
> include/linux/extcon.h:242:12: note: declared here
>  extern int extcon_unregister_notifier(struct extcon_dev *edev, enum extc=
on id,
>             ^
>=20
> Caused by commit 843735b788a4 ("power: axp288_charger: axp288 charger
> driver") from the battery tree interacting with commit 046050f6e623
> ("extcon: Update the prototype of extcon_register_notifier() with enum
> extcon") from the extcon tree.
>=20
> I applied this merge fix patch for tday and can carry it as necessary
> (it is clearly not correct, but it will make it build):
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 25 May 2015 21:00:24 +1000
> Subject: [PATCH] power: axp288_charger: fix for AIP change
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/power/axp288_charger.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/power/axp288_charger.c b/drivers/power/axp288_charge=
r.c
> index 5680317f4823..e4d569f57acc 100644
> --- a/drivers/power/axp288_charger.c
> +++ b/drivers/power/axp288_charger.c
> @@ -848,7 +848,7 @@ static int axp288_charger_probe(struct platform_devic=
e *pdev)
>  	/* Register for extcon notification */
>  	INIT_WORK(&info->cable.work, axp288_charger_extcon_evt_worker);
>  	info->cable.nb.notifier_call =3D axp288_charger_handle_cable_evt;
> -	ret =3D extcon_register_notifier(info->cable.edev, &info->cable.nb);
> +	ret =3D extcon_register_notifier(info->cable.edev, EXTCON_NONE, &info->=
cable.nb);
>  	if (ret) {
>  		dev_err(&info->pdev->dev,
>  			"failed to register extcon notifier %d\n", ret);
> @@ -909,7 +909,7 @@ intr_reg_failed:
>  		extcon_unregister_interest(&info->otg.cable);
>  	power_supply_unregister(info->psy_usb);
>  psy_reg_failed:
> -	extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
> +	extcon_unregister_notifier(info->cable.edev, EXTCON_NONE, &info->cable.=
nb);
>  	return ret;
>  }
> =20
> @@ -920,7 +920,7 @@ static int axp288_charger_remove(struct platform_devi=
ce *pdev)
>  	if (info->otg.cable.edev)
>  		extcon_unregister_interest(&info->otg.cable);
> =20
> -	extcon_unregister_notifier(info->cable.edev, &info->cable.nb);
> +	extcon_unregister_notifier(info->cable.edev, EXTCON_NONE, &info->cable.=
nb);
>  	power_supply_unregister(info->psy_usb);
> =20
>  	return 0;
> --=20
> 2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/7O3.IC4qKg0nMmcJWe6z3+t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVcBfzAAoJEMDTa8Ir7ZwVG6UP/R/fg1kge8nKx72DtTU6tZQW
lDJi35BOAXxrbi+RAhiGzGUu4ol5gKri7l/GBiYcfalUW1hENUgp4Yc+L1BxJxGT
LacZjiFINb5I4bP9L3prfGHfvSFeBlfRHFG5neYqTgmTGY7y5R+0sZCVhOePsBV+
MxF18Dw01sxRGsBQN1mjjeXcqu6QGA5Ed12041H/HY0TO+YPOM77Wczx+XbC7YTW
95RWaTFSYBqyXr6J0tVclN9FDchHnM4kbh+Q79FQ84aeLMrB2uAz0scHc1TJW7Cs
4wbSoPq9uprbN89PmRO8CmGP0rXeCKj+Mp737aIuNrw1VNlTOg9EWKkUiljWFHhr
obS2K1ACU1gZaOYJt/5pPFjVtucUlj+6y7GLm4DCFv5P9FKhcMpE1IgblhqmyR2X
9uyJ/R3qb33PstiN49fyuO1xbH2BvbLpvhB9KlasNpbdHQVHyJAtM+zGZz0Ay5Is
2TryjnuRkvXjpDa9RLDSTED1KxX4noqxkdBegoRBv3oSp5z4+dxcrhhhR2Yn6lL0
t9EZsqQC6x+htqzy9eFu4VMAnu8sU70OkQGCEy6JC+gFY31AofaIk4Sd2Si4O/8c
8skRqHrB+llAjl1NZkY1Yi466bpTepyNYav/dIIQOv9SGoe+ra8+/VCMnkjnXEgA
quDb4ZIwEaK7yTgMrGcH
=zZ4p
-----END PGP SIGNATURE-----

--Sig_/7O3.IC4qKg0nMmcJWe6z3+t--
