Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749E43B9DA6;
	Tue, 28 Jul 2026 17:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260361; cv=none; b=G+Okb0BQh1t35VL7X7+0cAIOEmOUdP5gRjbuxouJ6qo2JfvW6Nr0Y+OL+C0DFDJM+KLlxNysINcew6uWS9kL20hlMgxc0OMzLg4IIKEletrTh1+dPc/3w8NiH0v9Xp/8Y5/Ma+hjVrNtxYvbayI9am/+IxZ4498JhMVuIoP6bIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260361; c=relaxed/simple;
	bh=uXzZZF8V9Y9FlJIQ2iSRviman/3ulGZieE8GR7asB4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B6xqy0+zdhealM6SBLEuiVysYuuNxypqvgH+Hds5HXvZqnHNA5cn3ya9lwZVblxnQyZPxCH1P5pFJUykA6mtwv4WqVGjFzhVE99ucqSgkhgiaBaQNQGMRhld1LxrJVEQzfPmStxHZCivv29TtijUpIk0/D2ORWjRUNbHcqfnoig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7GWdlSz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7GWdlSz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC87B1F000E9;
	Tue, 28 Jul 2026 17:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785260360;
	bh=pJz8rb+2OBTQ5IR8dL+EuPqQQcU2Y+y6oI13ES6Myn8=;
	h=Date:From:To:Cc:Subject;
	b=I7GWdlSzzQH3LLypPx0D30rDLkM6qlQERj9S+OH7ktCJ7rFa3hfUVgMLU7MVumVj5
	 mcUK/jJqxi4AjtkLOr41qtsk56lyOjiPR3YMHN71sZKSkwkQTlSXXiqwJ3sPv3B1Nr
	 JeLuOcwLDHuUEx7xMuM6FkpeXFjubFm+a5h7FcKKm7CZ3NgIim4tr6P49rYOV56zpA
	 WQkUTb8RibDep49McnB002wBJr4Uyn1I2NHO6BcWu2OthIsi/aAjnkZ6zPflYL36dN
	 XV0Otf9O6WI0iuC247tmkGLjgPNl4nTc8TTmhGsNHQ+JTKOQevor6Pe+9piSoBFTDE
	 hnRHxwtC6HwwQ==
Date: Tue, 28 Jul 2026 18:39:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Eugene Mavick <m@mavick.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Message-ID: <amjpRIA5G0pnhhyr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="opswjbZ+nXVs9YrU"
Content-Disposition: inline


--opswjbZ+nXVs9YrU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/rtl8723bs/core/rtw_wlan_util.c

between commit:

  ae21407350151 ("staging: rtl8723bs: fix OOB read in WMM_param_handler()")

=66rom the staging.current tree and commit:

  6e68c64a71f70 ("staging: rtl8723bs: remove unnecessary parentheses")

=66rom the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index c614c0b4c792d,8b0502a1881b5..0000000000000
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@@ -666,13 -665,10 +665,13 @@@ int WMM_param_handler(struct adapter *p
  		return false;
  	}
 =20
 +	if (pIE->length !=3D WLAN_WMM_LEN)
 +		return false;
 +
- 	if (!memcmp(&(pmlmeinfo->WMM_param), (pIE->data + 6), sizeof(struct WMM_=
para_element)))
+ 	if (!memcmp(&pmlmeinfo->WMM_param, (pIE->data + 6), sizeof(struct WMM_pa=
ra_element)))
  		return false;
 =20
- 	memcpy(&(pmlmeinfo->WMM_param), (pIE->data + 6), sizeof(struct WMM_para_=
element));
+ 	memcpy(&pmlmeinfo->WMM_param, (pIE->data + 6), sizeof(struct WMM_para_el=
ement));
 =20
  	pmlmeinfo->WMM_enable =3D 1;
  	return true;

--opswjbZ+nXVs9YrU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpo6UMACgkQJNaLcl1U
h9A6zQf/UG7RwXLJ3Z2JClc3yUQyX6zc6+5fLIJx2CKey+752Smk2Se9EV7Y+IPN
g9kmGyblNwM8h0UkrMPaZQqxVUpCzWXgk5CnhpXT6XzibKNcsEyNIXE0PpjntHNH
uhuGpulAN/Gm6oOp18EZcNS9U9HyvEfNoqfPA6KRA5Rv6QjErMnQ9EWQHEdKvY5D
zEEUdlO7XrJ5kLuFvwi9pI39wofWZ2VB7CuWU1rFsb4tUu4hq1UshBs/GhIPHKdC
XR3FWhHCClMCXRgIhbtEqkI6GHsR1wP0iH1BxQoWI6v8VrcchOuKeRm79RCr9xz/
mnS4koRlMabKO0BUjBvOJJPvNkM6ow==
=yz1T
-----END PGP SIGNATURE-----

--opswjbZ+nXVs9YrU--
