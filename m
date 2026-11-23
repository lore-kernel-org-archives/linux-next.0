Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448095;
	b=ts/yB+aSH7au2qKtTfsJM4J1KZAkG4bfeijgKtbOMlxuWXq6l2Bc2oH+4i5uaR0kDIQT
	 LYgsciaHRoUAdXX3AxQ8zRGcZyulfpxcs9SxoHMvdZ9r4LqRDp5W4BlX4nYhxrmRnSXrC
	 yYfk0O5xDmnysIW6OpBdaRHIK5gYw5xP+eg4IRHluDJC+YOYuGek80ubezImU3jI6DCM/
	 LjXlNp9jUuHvyPFWfBnC9ylhgyZ8OQ2HP/Wv0Pe0zn9TC4jw9zny+v7LVrmWoPuGHfG1H
	 q/XTyJZgSGkNN5rznbSRyFBQk+XhWQSxx3m/i6vFpKfCAlyGbQiQMFhNDvtvulXOkyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448095;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=jf07Udiq2p+O4qiPOafk709qI4gZ7bjn4qKb4VieSNs=;
	b=ljDqHjcK3bcCDfSS4w3KiTW6/sR0zNozOxJQK4idiBt2E9o8VKBMTJDmWeca3BxH71TR
	 Fg78XzwcCZ5y+G0VTckumkESAR0W05p9r+FOwIfncKr4eKstjFDyKdnRJnCsAH0yyzSUD
	 4KqejAW/sXCbODwSlHkSEE298x+iz44qmQqjfClRxpwbpp/RKwui127c41nHsZsRzl5Wk
	 JWQKPo2shnw/BhhwVyVfnwaKAr5kVzCw1yGBIY5kwA1cS64HIVIRLF+oXQq8udYkL8Q16
	 r4GLbG2xo/Y7t/rp/Zd3lLmuUbhLQrLO/EcfJVftDpDqkv0HVP/25AZsUhm0iAZEfIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LukvrL1O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23665606A31A;
	Mon, 23 Nov 2026 15:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LukvrL1O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538881F000CA;
	Mon, 23 Nov 2026 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448094;
	bh=jf07Udiq2p+O4qiPOafk709qI4gZ7bjn4qKb4VieSNs=;
	h=Date:From:To:Cc:Subject;
	b=LukvrL1OQMzuaX0VEwj/HCMtNSIDrpmYSWQcjNPwZMimCi6wLM+wuTvu35GSB3ROT
	 asqksnvpdQ15Vx9YOS2nEk9Nhn0BW+vama/Ic5mFz2Jlc1LlyVMiob95DQEZM/WZlj
	 KKvKqEAN4LRe4HWykVJb1YGxXtqJkUySln5l7EwAvL88DTuoOInMejp99o355PqkKE
	 eV7cnkdUOQ5XA0fqT5ZSGbhQQN9WM4r2Nhk3ED8tjXwdS2yZ1EaG8mzTL59wyIjWaP
	 mdwJ2UpmxM2lUYZOSvlargWJXQRPKw7IEKmRZIjIdpjG74Dln8MieE2s9oZpxSbkVn
	 dJopZwZ0A5hVA==
Date: Mon, 23 Nov 2026 15:34:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Priyanka Mani <priyankamani2100@gmail.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Message-ID: <awRdGojPVH1LpICe@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XNZJx/CKyAdHbDVI"
Content-Disposition: inline


--XNZJx/CKyAdHbDVI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/gadget/function/uvc_configfs.c

between commit:

  8709574b03899 ("usb: gadget: uvc: fix dwFrameInterval array leak on frame=
 removal")

=66rom the usb.current tree and commit:

  01ad61c08da9f ("usb: Constify struct configfs_attribute pointers")

=66rom the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/usb/gadget/function/uvc_configfs.c
index a8717c95e5edf,3387060bab55a..0000000000000
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@@ -2143,27 -2027,15 +2028,27 @@@ static const struct configfs_attribute=
=20
  	NULL,
  };
 =20
 +static void uvcg_frame_release(struct config_item *item)
 +{
 +	struct uvcg_frame *frm =3D to_uvcg_frame(item);
 +
 +	kfree(frm->dw_frame_interval);
 +	kfree(frm);
 +}
 +
 +static const struct configfs_item_operations uvcg_frame_item_ops =3D {
 +	.release	=3D uvcg_frame_release,
 +};
 +
  static const struct config_item_type uvcg_frame_type1 =3D {
 -	.ct_item_ops	=3D &uvcg_config_item_ops,
 +	.ct_item_ops	=3D &uvcg_frame_item_ops,
- 	.ct_attrs	=3D uvcg_frame_attrs1,
+ 	.ct_attrs_const	=3D uvcg_frame_attrs1,
  	.ct_owner	=3D THIS_MODULE,
  };
 =20
  static const struct config_item_type uvcg_frame_type2 =3D {
 -	.ct_item_ops    =3D &uvcg_config_item_ops,
 +	.ct_item_ops    =3D &uvcg_frame_item_ops,
- 	.ct_attrs       =3D uvcg_frame_attrs2,
+ 	.ct_attrs_const       =3D uvcg_frame_attrs2,
  	.ct_owner       =3D THIS_MODULE,
  };
 =20

--XNZJx/CKyAdHbDVI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEXRoACgkQJNaLcl1U
h9Cnagf/armNty2Wk2k6JlKmR5PF+ZWt7qSkf5GnAhbFAMBLacoDHErnwzOTZiXB
YxW32XjiBp4YrdwU1Rn+coTKgIaQhEHUE+nZFaYL3SrBUfjgyaBo1fAkxeB98hEH
vvdFr3h1YwcqXx/cZcvRTe5yHa5k3kCQT5br95awB8fxDjH326gAHquHeYHCmxf+
5gCwhC5JAtlz1E06Kpy7Y5K9pWYHN/4Kz6uEXmcAp3A3608dzXPaHOMCxbbnImgU
bGBG2d3ActSXlgLcMkxw6AUiA151vGdD+tAk4NCx2PmslQCj3Rita0d4wsL5GMKB
vrgyiXZX8YYtlwVeGfLOejZZ/oGQeg==
=KmEn
-----END PGP SIGNATURE-----

--XNZJx/CKyAdHbDVI--
