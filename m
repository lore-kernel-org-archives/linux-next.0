Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E744B3783AE;
	Mon,  2 Feb 2026 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045049; cv=none; b=ZT4LsH6Boiw+qfz/ntVAq9oMe+V0cnwtCmdNSvoAq0OoYj3FfGtA0acM5rIEnnZl1oXKASiAvfKBXzsR+LTuIWXzd6Pv4VmN42kc/hMhv3V9DmlDVLkhqdugGFn3VIYBgSm/FXjaUZztl8Y+bwcjrZGYeGG3n8lDxiCwIfKnyic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045049; c=relaxed/simple;
	bh=Y1ley3AIGzu2Mvq8iLkFCE/c8wtIW5DJJUlNqyqNUmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GaSh01a27NDhBp1q79HYyn0/L9/X8wB1KW65ZqP+nR6HZyidqONhnmh1Ct1+29xjfebuueswOrKuWWA3YFZTSXt0w1gJ4ufl/o0CR3Sr/ETb8UxrVF1ugENSMsLcdJa+Ve/rBSpVVpQFLUzuoM30ENpz0VPI09ksG+qxBVuuqBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCYgkxn8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCYgkxn8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C447DC116C6;
	Mon,  2 Feb 2026 15:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770045048;
	bh=Y1ley3AIGzu2Mvq8iLkFCE/c8wtIW5DJJUlNqyqNUmo=;
	h=Date:From:To:Cc:Subject:From;
	b=QCYgkxn8nD11+WtE95tAE0S3GOXa60pAofV5PCv62neP8Q+sfFzxbB8pq+EuDswLj
	 OUhvz+4AW2ahlIqLt5DXrHWxReY9Hh5dTsb852Wecw0/rP0GpHbrlWkK4QEAhCDrZQ
	 51j+vru9slPn8+hUFsNrCRLgZPGz2OXoYlwoged6nIgSKBVCOTvTZwOpxjOgc+J4sa
	 K+eo8egGfNoVuhCs5Mjd4qo47jKTe/I3VblJH1wOV3Oq4Z9wyjq1aZT3DwXOGhez2g
	 kcdE/YL5L2o3XW6dc0TGNbTGGRbzQNo+Z2aognflcm9TXBhQJPzi4hx88WbuB8aIsG
	 +TJaojgB6CEpQ==
Date: Mon, 2 Feb 2026 15:10:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jonathan Santos <Jonathan.Santos@analog.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Subject: linux-next: manual merge of the iio tree with the tip tree
Message-ID: <aYC-dATLw09TXP4K@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JUh7micIPHPXDOZq"
Content-Disposition: inline


--JUh7micIPHPXDOZq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/adc/ad7768-1.c

between commit:

  c04731b5f1502 ("iio: Replace IRQF_ONESHOT with IRQF_NO_THREAD")

=66rom the tip tree and commits:

  ff085189cb170 ("iio: adc: ad7768-1: add support for ADAQ776x-1 ADC Family=
")
  ac9fabd578a03 ("iio: Replace IRQF_ONESHOT with IRQF_NO_THREAD")

=66rom the iio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/iio/adc/ad7768-1.c
index 84ce23c8e5782,fcd8aea7152e8..0000000000000
--- a/drivers/iio/adc/ad7768-1.c
+++ b/drivers/iio/adc/ad7768-1.c

--JUh7micIPHPXDOZq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAvnMACgkQJNaLcl1U
h9BS+wf/cctgSwThmBYPC86ne0HreodX2slpE7qrTxWXO0mHlyxoARfM0I6X6CH2
V9xSXwdL05SyS8otN282QBQB1Ozwqq5MSkrR9spwiuSfKFqv3z+V74GtaPvA6Uzd
qffATw81dN7nmovvF7SWGPvSWSata77ogzdc/nZKV+FMd4EWhIjhcwgyB9ZQMQWr
o0aPoMiHvHPRvhRdoyy7Y5srMibdhoXR17vDa9FCreHH1McS08bCUQewfc5gr/z+
9VvuDzhxD1WOsb38WNxV09uH1og4WSDGrioiDCUHANHdPOj4WcIgbzM+JzzqGhS7
YJQljeWzBq/mmK1l4BMYRkiW8W1tQQ==
=ldEI
-----END PGP SIGNATURE-----

--JUh7micIPHPXDOZq--
