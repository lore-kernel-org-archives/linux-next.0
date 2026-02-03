Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E7D34CFCF;
	Tue,  3 Feb 2026 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141032; cv=none; b=icP06a+yzrEjwGyYZLSlxycFqnaopGvBDozTbnimnb4kP24gwFZtHtiePgC+Myi7ZXcphHBxOrVX+WfFMjdNT8f2pbWSRXLocEaqXzT1coC7+33V7g9EFih18ZHrFDeCZTMdYsnAbnr3w1PFzPXEBTTRyaB1oyQ718Obw0fz29k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141032; c=relaxed/simple;
	bh=vpw2jpu7s/ndVNQcpVU3ZGY7t0SCnxRf+YsPlCajq9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GfPbHfP5gRHzIpw/tWagbcnIYIcAz6S6uKjwrjBEI0zCNkASoBK0e9aZyChKzy7Q2HqF5ApWj47Dqr5H7Z5g4cEw/Ua/8KGjfC1mzeOPpWLpEIZmdlgtqq4cerrDlPkpr2F3aA1X6xRvrqRsmCwVd8yZ6bMpDXZvw37vNsmSKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1VSndcV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1VSndcV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9809C16AAE;
	Tue,  3 Feb 2026 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770141032;
	bh=vpw2jpu7s/ndVNQcpVU3ZGY7t0SCnxRf+YsPlCajq9Y=;
	h=Date:From:To:Cc:Subject:From;
	b=e1VSndcV26Nv6NP5OtatOjT4/D3hEEGtS/CVfKM/JV848enqMTz6L3os2xo0tehHg
	 XbZRCoKek3xXhxOoG4+I57OotgLwKNfzxrQC7NArRAbdJMk2P3RY/YF6KgDYMAeteV
	 06mB+dc41qZonnLiqzf+ZXk1w+JMz6LEpr5T6cD6S+Dw5mrQSmDm/GZForO/IMNFnz
	 kMfMJ4DbkjqmldcfqqzKouum7ZEP5EqbnGMCOuHPgYIti5zCxw2XNu2+xMD7nS5T5U
	 bSkVff6kmJcVw1KPUuBCxpa0QBUmsh5h+Uj+gXPWRinp7r6j5jCvE9pTHu0kHGBZt1
	 a0qcFvaenw+Fg==
Date: Tue, 3 Feb 2026 17:50:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
	Connor Belli <connorbelli2003@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ionut Nechita <ionut_n2001@yahoo.com>,
	Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drivers-x86 tree with the hid tree
Message-ID: <aYI1Yyof6IL5-HUz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sLfSgYwH8FYS0r5J"
Content-Disposition: inline


--sLfSgYwH8FYS0r5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/hid/hid-asus.c

between commits:

  f631011e36b87 ("HID: hid-asus: Implement fn lock for Asus ProArt P16")
  06501b557faec ("HID: asus: Replace magic number with HID_UP_ASUSVENDOR co=
nstant")

=66rom the hid tree and commits:

  4ac51daa5078e ("HID: asus: initialize additional endpoints only for certa=
in devices")
  2b92b797a1532 ("HID: asus: move vendor initialization to probe")

=66rom the drivers-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/hid/hid-asus.c
index d55ad1f2f71e5,f5c8df20b88bf..0000000000000
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@@ -101,7 -90,7 +101,8 @@@ MODULE_DESCRIPTION("Asus HID Keyboard a
  #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
  #define QUIRK_ROG_ALLY_XPAD		BIT(13)
 -#define QUIRK_ROG_NKEY_ID1ID2_INIT		BIT(14)
 +#define QUIRK_HID_FN_LOCK		BIT(14)
++#define QUIRK_ROG_NKEY_ID1ID2_INIT		BIT(15)
 =20
  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
  						 QUIRK_NO_INIT_REPORTS | \
@@@ -988,6 -870,6 +959,12 @@@ static int asus_input_configured(struc
  		}
  	}
 =20
++	if (drvdata->quirks & QUIRK_HID_FN_LOCK) {
++		drvdata->fn_lock =3D true;
++		INIT_WORK(&drvdata->fn_lock_sync_work, asus_sync_fn_lock);
++		asus_kbd_set_fn_lock(hdev, true);
++	}
++
  	if (drvdata->tp) {
  		int ret;
 =20
@@@ -1490,10 -1372,10 +1470,10 @@@ static const struct hid_device_id asus_
  	  QUIRK_USE_KBD_BACKLIGHT },
  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
- 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+ 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_ID1=
ID2_INIT },
  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
- 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_HID_FN_LOCK =
},
 -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_ID1=
ID2_INIT },
++	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_HID_FN_LOCK =
| QUIRK_ROG_NKEY_ID1ID2_INIT },
  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
  	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },

--sLfSgYwH8FYS0r5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmCNWIACgkQJNaLcl1U
h9Cq6Af/T7aeTaWZGjp/v+/4TY0uo7iKHDAUqhrLFtybtMJGm6ZZIuN6c8BLnU3D
/PNr3KxpAjDzCNu9xyE2jMrbyRYpnYE+y//e5I/bfDJBcBtnUZyHInQFZD2/woFz
of/pULWromPZfW6y+Ebjs3xRs/NFdvPmP1rDKxit7VpWdfzfVheA5F2UQy/CVfpl
oHVYG7QLYmTtYXkwjpJXSXn9dcl6mV/+abLPVyJz82VSfnTXyiIwV9E08GNwQH1C
DA+oQRbFeQjct/d8+73SzJEX/JeVDG17XoAqYoXC0EBxcHWhJu40Mrgsn8/CXweG
+hIeqos3bh47rxlsnPJgsqc97wlf5g==
=V0eO
-----END PGP SIGNATURE-----

--sLfSgYwH8FYS0r5J--
