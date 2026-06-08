Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D130A3D093B;
	Mon,  8 Jun 2026 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929124; cv=none; b=UAf4ipSQq5wffOtSVyrvF/NUbghlCwj8+XnWBrZR/O+j/T+zAqrEFwcBwS1LC91uM7DvVDjn0qmsPvfT1GmOnjR6ifMf9uiNTvY74L++xicczG5tZmncsOH87bpRPjosHIIBLmBXGPb9+UHzNzoSf7K2nwotfXY9Tc0LkncR0H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929124; c=relaxed/simple;
	bh=r0Zw8isqcSxSiqzxWbe0xhoZ5EMHzhbaSZlXzmR6API=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AgVZiNvilxGftrEdsAWhHs/7iO4+vOxN6mp9hC0XjtoTU6pQnDpUWK0AAoPcjoNbTQygHuiH3KI+T0kEsGN193dBvkW5i2DK3hBDzvLBS9rbUYLW6A+UjE5qEVU0h32on0IW0Mkx9ukEe/aLvT11LHVFD/6wXvWziaZrnrYhIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwJ5u29u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwJ5u29u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA681F00898;
	Mon,  8 Jun 2026 14:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929123;
	bh=2+8pc9iAcfQeNVbXGqQfuDZxajEP+9K9NoHJicSqcsY=;
	h=Date:From:To:Cc:Subject;
	b=nwJ5u29uPQQevt1j1IBzXalOOtHGPmpcb1cxn/NJP/6BHsPPdyCCAEaLy5iTYQs7J
	 9RJAAB+1Y2j6RUti56fwID1InGbibmgCjiiiMFOuKr7aaDGCx9YFRk7wgiYmToz7KV
	 xVGKshNbd07TwnUdaDndy6wxIV6u6V4YJ0SI15NI+WTBFAboBL5eIZjfUoDdnTsMoy
	 EEFSKPz0DIwn5CQETohb918bjYXDlfg8otAFPgpgf7QnH4xNsA5vfPlut8yY0f+mYN
	 yxdo46QQB6HvTg1IZFtiTLbj5P50q1IkxZWIQaJOeYmU/SzVgR5qG8H8m5hxod8JFS
	 Hng6yWKk1HI3Q==
Date: Mon, 8 Jun 2026 15:31:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Roman Bakshansky <bakshansky.lists@gmail.com>
Subject: linux-next: manual merge of the tip tree with the hwmon-staging tree
Message-ID: <aibSXki-s7geOFFn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AITTWlfKlTjdVQpJ"
Content-Disposition: inline


--AITTWlfKlTjdVQpJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/hwmon/coretemp.c

between commit:

  1b16a26e79433 ("hwmon: (coretemp) fix coding style issues")

=66rom the hwmon-staging tree and commit:

  91660aae2f864 ("x86/msr: Switch rdmsr_safe_on_cpu() users to rdmsrq_safe_=
on_cpu()")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/hwmon/coretemp.c
index 02b4e46d965b9,70711a7cca123..0000000000000
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@@ -220,13 -220,14 +220,13 @@@ static int adjust_tjmax(struct cpuinfo_
  		 * http://softwarecommunity.intel.com/Wiki/Mobility/720.htm
  		 * For Core2 cores, check MSR 0x17, bit 28 1 =3D Mobile CPU
  		 */
- 		err =3D rdmsr_safe_on_cpu(id, 0x17, &eax, &edx);
+ 		err =3D rdmsrq_safe_on_cpu(id, 0x17, &val);
  		if (err) {
  			dev_warn(dev,
 -				 "Unable to access MSR 0x17, assuming desktop"
 -				 " CPU\n");
 +				 "Unable to access MSR 0x17, assuming desktop CPU\n");
  			usemsr_ee =3D 0;
  		} else if (c->x86_vfm < INTEL_CORE2_PENRYN &&
- 			   !(eax & 0x10000000)) {
+ 			   !(val & 0x10000000)) {
  			/*
  			 * Trust bit 28 up to Penryn, I could not find any
  			 * documentation on that; if you happen to know
@@@ -254,11 -255,12 +254,11 @@@
  	}
 =20
  	if (usemsr_ee) {
- 		err =3D rdmsr_safe_on_cpu(id, 0xee, &eax, &edx);
+ 		err =3D rdmsrq_safe_on_cpu(id, 0xee, &val);
  		if (err) {
  			dev_warn(dev,
 -				 "Unable to access MSR 0xEE, for Tjmax, left"
 -				 " at default\n");
 +				 "Unable to access MSR 0xEE, for Tjmax, left at default\n");
- 		} else if (eax & 0x40000000) {
+ 		} else if (val & 0x40000000) {
  			tjmax =3D tjmax_ee;
  		}
  	} else if (tjmax =3D=3D 100000) {
@@@ -352,9 -354,9 +352,9 @@@ static ssize_t show_label(struct devic
  }
 =20
  static ssize_t show_crit_alarm(struct device *dev,
 -				struct device_attribute *devattr, char *buf)
 +			       struct device_attribute *devattr, char *buf)
  {
- 	u32 eax, edx;
+ 	struct msr val;
  	struct temp_data *tdata =3D container_of(devattr, struct temp_data,
  						sd_attrs[ATTR_CRIT_ALARM]);
 =20
@@@ -394,9 -396,9 +394,9 @@@ static ssize_t show_ttarget(struct devi
  }
 =20
  static ssize_t show_temp(struct device *dev,
 -			struct device_attribute *devattr, char *buf)
 +			 struct device_attribute *devattr, char *buf)
  {
- 	u32 eax, edx;
+ 	struct msr val;
  	struct temp_data *tdata =3D container_of(devattr, struct temp_data, sd_a=
ttrs[ATTR_TEMP]);
  	int tjmax;
 =20

--AITTWlfKlTjdVQpJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmom0l0ACgkQJNaLcl1U
h9AUlQf7BRlJp+F6lkR6FXBfOmf+Tpb1ZMl2eudvJn1iQj01PdZOPPsuUaXgeEHI
8xrN1h+tenUB81rdaG5aQGF7GQolxD4nHPTOCAsn9Ri3gDpq0hZh6SK1dV24DQG0
hkqo40dkEJRdIr2Nzajl2Ku5//BLIj+9CxRSrYUooNkwSHEbyPOXL05Hx0h0GvVz
sS4hBWf5JMXAnZEuF44xcx2qBsoAH2Mqd2gWyX5RZ0VoaDd0MlXkOLzekcBZy4Nn
2hv0oWbJ29zln6O9JKMyhm0wlIa31Pq4wYUUU/Nt2rCEgr2WR6W4qVkoDpMvhaVj
iALy4eYfiSlyz2CbfCuRTg3cJeHUtA==
=vNqy
-----END PGP SIGNATURE-----

--AITTWlfKlTjdVQpJ--
