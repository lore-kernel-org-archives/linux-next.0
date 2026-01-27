Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06279306B1B;
	Tue, 27 Jan 2026 16:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529900; cv=none; b=kYls2BRJFTx7xt/Ci83Bi1zSoRAR6zT/7g/wmEQNGwKmtwvLiz3m13Q3gERGZEaenlLyee2VkU2IrZFfgjA7M+VkMmK/5CQXC3ujsoKM/r37osXctjiNqZfob/RbP5ykesN6Ac9IXvfhoozmq2Pkj9JyWEIvPF1pNeTxyH2oohA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529900; c=relaxed/simple;
	bh=8N+ah0P+/jHBhcbBl1XRvE9P/Gzo/H0TG3Xd9y6/4PM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qsN5tZ1KQzTxiB51S6Z4f8ZnLIBB/fxR/uEqisPE2ZqscGRxatBl3NGqcBwVHJ85XGknvbGNkV055O6VlW4qlz8/iJTz5vMxXHlmVyioeNRublKg440LJpNTWCGlh130zDg5ORkwSP6QdN4tr3hT6k4vJB+suqOryvPj8R21EaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WY1l450A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WY1l450A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8097AC116C6;
	Tue, 27 Jan 2026 16:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769529899;
	bh=8N+ah0P+/jHBhcbBl1XRvE9P/Gzo/H0TG3Xd9y6/4PM=;
	h=Date:From:To:Cc:Subject:From;
	b=WY1l450Auee/cSKJ1COLc1ZbpYy21GK7a84oFlwCP//bUg046nj/98r319V1gNjPC
	 YI/XPpSHxWd/SafJwWLh9mM+B8cUwGuCy3CGYSIADdEfEOaUzen0R/5CBrwPmzAcqr
	 SdOS7tNX7Tu6W8rHRsxNffotG9tPse2Y2Ax1phFuLYDl4XRft7uxx2RCAKRjHF764p
	 a3uMpWzI9PYVyXWufpKd/1EnaDCrOlbDiUMb9VBFoKXqJW3GA7Enk594JRLKTJLpfB
	 hmUGHw1q5tbSFC1TP4DLV4h0yvE6JtHKpJqQfYulrCmfOrPoBShq1xNaOODBy9HnAu
	 lS8SZWWTY/fFQ==
Date: Tue, 27 Jan 2026 16:04:54 +0000
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
Message-ID: <aXjiJsJamyzEU8Xi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53aj9JnqlFBqxJ+Q"
Content-Disposition: inline


--53aj9JnqlFBqxJ+Q
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

  3415a1beb3d87 ("HID: asus: initialize additional endpoints only for certa=
in devices")
  8baca948f6aad ("HID: asus: move vendor initialization to probe")

=66rom the drivers-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/hid/hid-asus.c
index df7c03dde67fa,f5c8df20b88bf..0000000000000
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
@@@ -1490,10 -1372,10 +1464,10 @@@ static const struct hid_device_id asus_
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

index 876529df0d6ae..1b9793f7c07ed 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -959,6 +959,12 @@ static int asus_input_configured(struct hid_device *hd=
ev, struct hid_input *hi)
 		}
 	}
=20
+	if (drvdata->quirks & QUIRK_HID_FN_LOCK) {
+		drvdata->fn_lock =3D true;
+		INIT_WORK(&drvdata->fn_lock_sync_work, asus_sync_fn_lock);
+		asus_kbd_set_fn_lock(hdev, true);
+	}
+
 	if (drvdata->tp) {
 		int ret;
=20
--=20
2.47.3


--53aj9JnqlFBqxJ+Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml44iUACgkQJNaLcl1U
h9D7igf/RCoVs1DsNqCG2Cu1XQsnNu8q4WKh8ZKYQb4tKLSHxVtJ1hL7JZrP71iL
woeL1917+BOQDbOr+wVjR9NeT76OH6fL8gdccij3O5yv4JoovIBw/0KnJCqJezKy
RqbSD71lB+B5959Osx7b2tb81fv2eOitu9DIGXoHuW4ts5b3fkSY7+uhAcBf/tTj
bTyyhLv5jfYIG61AttQB/t0gA4DVcW5LbYqeT/3hZrne56zItPUEMt2ZPgKLFhMU
QAjaxvpkr1hEeU4AlXukkmnqJFkRsqFHyk8sasHK9lHc2pLqvuZZ87E98Igmc0ZO
wr/v/XZshzw6a4dphhf4RqyYWjbF6g==
=oGHm
-----END PGP SIGNATURE-----

--53aj9JnqlFBqxJ+Q--
