Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EE82DCF67;
	Fri, 29 May 2026 21:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780091205; cv=none; b=MS+4ZLC8bCKdf28ibQGznc5oSSKox6kiya7qFtJ5XMewuiHhdMfh/612JGOWNkXjn8AmyTGQDWMpYcjsNEDHMi7Sg0VHC6hf5x7ulK9PHw/BITPPx3vVYd65o+sZ5NyvV1RJjyiX2vEXbiDLNBjd4S174LHG6jx13nPY3jPT1IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780091205; c=relaxed/simple;
	bh=llJhnEjYFhcJbaeIA2WBTm1mJrOPZsUbs3BewGkRr7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GDThwkxl12YxcXReOGEdZm35pI5FCQZzZDxioPsmKmEYd+uihGsrUyhdrepL9PjTY0LdO6IacziN5wS97BwDgHfxwh4tvufAtz9XzjLAab/TQ3Xel4xC2DxZnNUE83A3qZhgXx9IBnt50khZ1Sjfl6jFDp1sVo7L1+NMlMS+joM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWtQxroI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWtQxroI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16D51F00893;
	Fri, 29 May 2026 21:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780091204;
	bh=p2od5GIEDDc0oOcJJrIsB0EhyZ5uWclu8MLthdBU8nI=;
	h=Date:From:To:Cc:Subject;
	b=hWtQxroIs1JrkSa1tH8Qnb43CYNCFoOI1dGZgLpnlvjp3/w7PAzZprFHkhsR3hu5q
	 wYGaq16QTD/eycyO5IqIXDFH/JiKuUyhrRZtexBfqvI3QhDg4ImEkDW2pVbyyha0/M
	 GDx6s9rc16i6xsfoOlhjYfdSu3Mn1E128lcBHtkOsWnXxKN3+caBfpB+Hb9Zqe6p9n
	 zYIWN4BFn9rhSsnN1XM95NRJg5qYKVKm/dWUuedepVY08+7LsoVu5/OKOHrFpOiwR6
	 SW93DrWUiHP8mI44C3WctdoXyQfE9D6fDNsKHTL98mRDf0egwzxJ0ixvcFXTqUt3hk
	 064mm/tYeIyhA==
Date: Fri, 29 May 2026 22:46:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas Lin <thomas_lin@lecomputing.com>
Subject: linux-next: manual merge of the spi tree with the i2c-host tree
Message-ID: <ahoJQKqhYl8yHLiJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NJeFhlifbBCCf8GB"
Content-Disposition: inline


--NJeFhlifbBCCf8GB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the spi tree got a conflict in:

  drivers/acpi/acpi_apd.c

between commit:

  fae5e96bb646e ("i2c: designware: Add ACPI ID LECA0003 for LECARC SoCs")

=66rom the i2c-host tree and commit:

  019947c495850 ("spi: dw-mmio: Add ACPI ID LECA0002 for LECARC SoCs")

=66rom the spi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/acpi/acpi_apd.c
index 86678ee22a041,4d5a51d30adcd..0000000000000
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@@ -182,11 -182,11 +182,16 @@@ static const struct apd_device_desc hip
  	.fixed_clk_rate =3D 250000000,
  };
 =20
 +static const struct apd_device_desc leca_i2c_desc =3D {
 +	.setup =3D acpi_apd_setup,
 +	.fixed_clk_rate =3D 250000000,
 +};
 +
+ static const struct apd_device_desc leca_spi_desc =3D {
+ 	.setup =3D acpi_apd_setup,
+ 	.fixed_clk_rate =3D 400000000,
+ };
+=20
  #endif /* CONFIG_ARM64 */
 =20
  #endif
@@@ -257,7 -257,7 +262,8 @@@ static const struct acpi_device_id acpi
  	{ "HISI02A2", APD_ADDR(hip08_i2c_desc) },
  	{ "HISI02A3", APD_ADDR(hip08_lite_i2c_desc) },
  	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
+ 	{ "LECA0002", APD_ADDR(leca_spi_desc) },
 +	{ "LECA0003", APD_ADDR(leca_i2c_desc) },
  	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
  #endif
  	{ }

--NJeFhlifbBCCf8GB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoaCT8ACgkQJNaLcl1U
h9DXlggAhhpuvBAWJj8hDNDKegeSew1+TaXiZEggpPtQD+/TEMm1zNK87mFnHpQC
4v89638c0Ewg+MhkJ0B22pJWqgqrhtn3K2G0iZ8uMgH9ZJqS+1G8AOEBSs5t+ASK
X6cjH2lW3oRah5aIQQY/SHrgUcSs00yeDiV9fdZSyCsBnQLxHC/UPXt4WyS7Ymzt
d1aVIA50x5MDT46I+3Z1imUD1/UP3/vvwit1Mu/JOoOfjWzGW0EGhNv/MMnMiVIh
mhaO9Y0Bkyt1XAXSgxl0cnmxxjaQogwTVsHaxqs4F2q5gPPkZrFIDk1twQdn5O9Y
tf6TIvKsSFfrehB+9zy62YsDsQuOLQ==
=nr6X
-----END PGP SIGNATURE-----

--NJeFhlifbBCCf8GB--
