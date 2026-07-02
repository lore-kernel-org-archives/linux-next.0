Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75D9318EC1;
	Thu,  2 Jul 2026 17:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014217; cv=none; b=B+dk2HJQTFKzLdYMIGNFewWeIOUlf0TzV3s06x1NmEzuiT7sjoSXuFx8vGDN466vSerwN2iAMcxrJm0lfiOeEut0/YTma465jns53KNlTFctHzHvf9QNnMtfX3JO4Wf1KZLDOHILNKzm2CUmuK9UmKtyno9dcxYjx5u3AEJ7YV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014217; c=relaxed/simple;
	bh=aUk0hIOWnzvN+qNnTInU9iKjzuh6IEMs9VNfT3i4MVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=axZI1wE8UhB/zTGjjXBzlmE6hNvRYcWw0wLgTD0qrzBMTxshBsAAN/R1Sg98OdrH/WfUG+dYORJt2EEPme1soJOsSIuYROchlgP5B7FIF4H3gfgNeaXsPzt9N74sJ+uBNJuXUNXw1djvtu3BB0SO8ZTn635pHBrM7FP/ONm3jZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXUzh+N7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXUzh+N7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E689A1F000E9;
	Thu,  2 Jul 2026 17:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783014216;
	bh=T6ixSuTRO2Omn5nag6/5Wh9pa4lUXhOW8FJENUa+yoM=;
	h=Date:From:To:Cc:Subject;
	b=iXUzh+N77g14utB+kqBkpmFdzpdTFwxKdZo/K/aJl366GwcK4MgDImX/bOOxEeHj8
	 HidBADhRedZldiv5H29/Fswp51Yl6xEreo50ypE3g3wYn+CwM6pQKGMjm2Gm8SPcER
	 pbqWMVOib16G2iBRFwJ+4+rVz4qxwj+nUcfJWbnAaCYd1IoutdpLXC0qvPQLSfVBP7
	 zjJlrmWq0bU6PkK6GcmWZ0LYwgqAOa5FlLG3hdXNLPZQZA3RxEhiBDr12RxmyDyUgR
	 3NzsmCJ+QZJfnoN7yD8c1XklAR4GEvjk+3+G1iQ/RAYjzKL1IrB1HHLNHJ9WeKSBxo
	 yWi5zl9jchx9w==
Date: Thu, 2 Jul 2026 18:43:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miao Li <limiao@kylinos.cn>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Subject: linux-next: manual merge of the device-id tree with the iio tree
Message-ID: <akajRDPG1mkYFL9K@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O7kK7Y/swlruM7fE"
Content-Disposition: inline


--O7kK7Y/swlruM7fE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the device-id tree got a conflict in:

  drivers/iio/accel/stk8ba50.c

between commit:

  e8de771d80a3a ("iio: accel: stk8ba50: Update includes to match IWYU")

=66rom the iio tree and commit:

  80f98bb4f07ea ("Replace <linux/mod_devicetable.h> by more specific <linux=
/device-id/*.h> (c files)")

=66rom the device-id tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/iio/accel/stk8ba50.c
index 4bacc007897ae,d0c53b8ac850a..0000000000000
--- a/drivers/iio/accel/stk8ba50.c
+++ b/drivers/iio/accel/stk8ba50.c
@@@ -7,19 -7,11 +7,18 @@@
   * STK8BA50 7-bit I2C address: 0x18.
   */
 =20
 +#include <linux/array_size.h>
 +#include <linux/bitops.h>
 +#include <linux/dev_printk.h>
 +#include <linux/errno.h>
  #include <linux/i2c.h>
  #include <linux/interrupt.h>
 -#include <linux/kernel.h>
  #include <linux/module.h>
- #include <linux/mod_devicetable.h>
 +#include <linux/mutex.h>
 +#include <linux/pm.h>
 +#include <linux/sysfs.h>
  #include <linux/types.h>
 +
  #include <linux/iio/buffer.h>
  #include <linux/iio/iio.h>
  #include <linux/iio/sysfs.h>

--O7kK7Y/swlruM7fE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGo0MACgkQJNaLcl1U
h9BTOwf+NAj/NYDaWB8rVrlc2YqfCeKTAeEDefQwDJlsF6DzfcboIbJ0zgInIglu
TdxKP5C9c6MC2JFWkFuc3OMJVzM7eZ9nVuN7cmxH1iMio3as7Op+XfCUjuQv5QOg
aiGv31X8UjAdF+KDuxiIZnBQC+RFl4mG44qpZwNyJvLrMUVY0LaOuzaF+rNPVAvI
L51E7jzgy06lvmems1ACSMUdqgs5JQgPOzjzLSwES9+7h0+ltgF0Vn8bEy8sj+mU
crmUlCBByjmsv0WSllUntXNbG9zYAj2Dkn1KIaUjau4106rZ4y27oA0QDDRVXsi7
UYGDqJb3RgMt7QsnOYEQVNkob7l21A==
=sNH6
-----END PGP SIGNATURE-----

--O7kK7Y/swlruM7fE--
