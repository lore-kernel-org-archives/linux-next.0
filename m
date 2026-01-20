Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E11244A720;
	Tue, 20 Jan 2026 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923917; cv=none; b=CHLSGF9/64IUon3gJ7Em8Bvgo7WCaDQ2JEElQZltz37DtEa2VFsuyAU/K6IEhPdnVUyKOC7gAwCwlBVSTaD70OP+tLE4++epa0IrshhWioA+5zMev/H8FyXjPcz1WFR9FFT9XXSTtcoONsOpvKn64Ny/bMyKCSGsJlMzSaaS2/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923917; c=relaxed/simple;
	bh=om1lGFBKiLw5rRU6QdWCPu5/UVIsRa4uknxWmrCp0Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uv3Fr/P9V9VUUPTrJPIK7jzSgJSX2rGBgl2cJPE0tZmSfR6S73JJTEj3xWxHlfQo3M0iP8iAMVmQsZT7eaOUBOiXxK/VYw/32Z5+z8KutVRasEu2IgzAZMlkytcFd2r+pxDZH/A742QpUCr3FzaSGcg7O/sXtol0NZlEmhNAga0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5DNCbYP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5DNCbYP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1E6C19425;
	Tue, 20 Jan 2026 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768923916;
	bh=om1lGFBKiLw5rRU6QdWCPu5/UVIsRa4uknxWmrCp0Kc=;
	h=Date:From:To:Cc:Subject:From;
	b=L5DNCbYPY36FBHFKOGZxV34rVVm/CaGZoxYkALLKxVCMYIp/NwdBThO1/uCFE4sso
	 zZe+QHtGrCfaLeNp9KcZ1j7SZhwwJxQ1STXBifLuKUKskS8dRhQRZXPpIxozwvINRM
	 MABtavOZLndMtw/o4qggnOrLfrwKRvs3D+eYzAT0VKoAnkuHZ/mANqJQMOVLfvQfhE
	 RijYD4x0SJoymq3Fmy13fko8mkhgmPCTQRHwmoB+nrZTtHfyaygibjSnEsur6WkeCF
	 /XFNSynDkgKmM0pUZOoZiudvo55qQxQzyJWE+kFU8tZbpxWiDwkyRX+r9ayRkpFTXp
	 vhSUDy+oqzkug==
Date: Tue, 20 Jan 2026 15:45:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tomas Melin <tomas.melin@vaisala.com>
Subject: linux-next: manual merge of the iio tree with the iio-fixes tree
Message-ID: <aW-jCT9T1qWB_VPP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0vqmJ9uVFKCZyP+4"
Content-Disposition: inline


--0vqmJ9uVFKCZyP+4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/adc/ad9467.c

between commit:

  92452b1760ff2 ("iio: adc: ad9467: fix ad9434 vref mask")

=66rom the iio-fixes tree and commit:

  bac5e3d20c453 ("iio: adc: ad9467: include two's complement in default mod=
e")

=66rom the iio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/iio/adc/ad9467.c
index 2d8f8da3671da,9cfe66425d4e9..0000000000000
--- a/drivers/iio/adc/ad9467.c
+++ b/drivers/iio/adc/ad9467.c
@@@ -94,8 -103,8 +103,8 @@@
   */
 =20
  #define CHIPID_AD9434			0x6A
- #define AD9434_DEF_OUTPUT_MODE		0x00
+ #define AD9434_DEF_OUTPUT_MODE		0x01
 -#define AD9434_REG_VREF_MASK		0xC0
 +#define AD9434_REG_VREF_MASK		GENMASK(4, 0)
 =20
  /*
   * Analog Devices AD9467 16-Bit, 200/250 MSPS ADC

--0vqmJ9uVFKCZyP+4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvowgACgkQJNaLcl1U
h9DpqAf9F8fT9EMzwFAxGYtyeL/1r80as9q2FlnAoMnuEoZ6VyZOvjIL6bZjTimQ
eC6aO2DcRQvcuZKWo7+p8C88Ti00/5I1NkUuByYz0JLu9fADagVx+SPx+GSFqplu
mmppb2IU/kMVM0OjkwyK4Q4VwjhRLETQV4p+hCOzZJ0ddTvHqrPlUX+7CjZxd389
ARRqXF235O8NZg7Ajl8658iuy5rxI3rqAQbf/3ZAlwSxFheia0IvdFmUsyo+2hzp
OuYlZ2j/WP+UH1/qRX6XnlYYtd23KqVu8Pi+QDbkrFIdSr2vMo0dionb4bl1NVnW
UD5xie/gbJ3/+qoo/tveq8xqkEo6mQ==
=FNi6
-----END PGP SIGNATURE-----

--0vqmJ9uVFKCZyP+4--
