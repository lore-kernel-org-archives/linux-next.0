Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96769349CD2;
	Wed,  1 Jul 2026 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916534; cv=none; b=TnfHLb5zI2QHE4ZyI8qNGqqZ8p4S3l/zwTX9vT2qX3/U5G1jh3d3pZvlITxSsFnHo+UsMjc2+1SUWYgzN+OakEfUN7REXQ6gNOk2jO1JxPX8hF+DENpyE6VI2e6c9STodCehDTJpMig0unNbptlugojWcWbrrG/5aKIbH6OvPxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916534; c=relaxed/simple;
	bh=09/msgPHZh5yQvMJ6grpGs3OfcLs8kYaPsAKXhLCgbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bgf6bYjsCJC9bhZoVatdphPS9EbBaR1sTF+NQUaTApR1Ngt9SDu+hahnfshwf7wxV95b4MDsxkZhpxGwDeChRUkTo4h1i2TWnMvZtyN6QX9sbGH6Pf0K1AkrzYzY8bXKcpe4CRB62tZDrvcz/IO0TyQ3qwlhoNJidWv6dr6xaAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7ZGNfzR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7ZGNfzR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E361F000E9;
	Wed,  1 Jul 2026 14:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782916533;
	bh=qMQWvVc/sLFYQ1Kgyjf5BGeRPZtl+LbkpfB9p1TNJlw=;
	h=Date:From:To:Cc:Subject;
	b=W7ZGNfzRiF+wgEY9yFPYp5faiNpZxatKCRRwZiXmC74XfRDUEeZ3obSl80uICy4ki
	 ypMexjNUl6RW9Lj5Y++OO9JPKcyA1zectBud9M1A80mHFUgEqWFs/D6ENU90v5Mfuu
	 4gwn5d2m5DNqEjb4PRsYOuSpWHW5JW3ltxXNpr1FNz7+tD4eEiteDZ/cdvviJcq69X
	 HSFXt8bYKOgv1J0ihL2uaWwXC/vHqKX/fC4KcllD4oCpERCnA70YJMVOJgiuZE4X9Q
	 /KfwTggJo6v4jtjkEgV4RGZSvdotX3wcpMuFOF7EwokiJ6kSN4bWCqo4P7yUz+TIsL
	 qzbCS7DKXDiOw==
Date: Wed, 1 Jul 2026 15:35:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Viacheslav Bocharov <v@baodeep.com>
Subject: linux-next: manual merge of the device-id tree with the gpio tree
Message-ID: <akUlscmgGk8TLzgN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3PtsjhAoS3KF/zaz"
Content-Disposition: inline


--3PtsjhAoS3KF/zaz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the device-id tree got a conflict in:

  drivers/gpio/gpio-shared-proxy.c

between commit:

  163ba8782d521 ("Replace <linux/mod_devicetable.h> by more specific <linux=
/device-id/*.h> (c files)")

=66rom the device-id tree and commit:

  efecde8a254d1 ("gpio: shared-proxy: always serialize with a sleeping mute=
x")

=66rom the device-id tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpio/gpio-shared-proxy.c
index 10ca2ef77ef34,d3625b8d0ced2..0000000000000
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@@ -9,10 -9,7 +9,9 @@@
  #include <linux/err.h>
  #include <linux/gpio/consumer.h>
  #include <linux/gpio/driver.h>
 +#include <linux/lockdep.h>
- #include <linux/mod_devicetable.h>
  #include <linux/module.h>
 +#include <linux/mutex.h>
  #include <linux/string_choices.h>
  #include <linux/types.h>
 =20

--3PtsjhAoS3KF/zaz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFJbAACgkQJNaLcl1U
h9BStQgAgHuI6JXH09zhfL+igCBixDDABKSX34n6WZLDHNl/2rOYe5DX9RKLIzFr
NEj44LmYDpbaNd16akhOmSbq3fo58/SBX81t6Pq+ZBYU7S1Wpv7w1X1HpDmGWlEw
Y1dB8JRN+M/ekq4H8OYMbjUjhMTbw+U+sY3EEDhnQ48ovG1TY34XyQedRap0lQ4j
w+PIUViwZuIHQR0zjaaK9ub0fND6zwDrnhgsYI3K0of3WhIn26Xc5niDq96t0pzN
YLjlXME+NLDtwdDkxrtjL+h4TfjT/S/csmJMJI0AXp3hYHrZh5EIWBXpS01WYCBb
JNvYDsUmH4Dgbj0WNZ/3QZNkvhREeg==
=QkfQ
-----END PGP SIGNATURE-----

--3PtsjhAoS3KF/zaz--
