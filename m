Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185469;
	b=ZRq3RHpDrjW7D5rf4p9yW6Yw7zOedfdBO/aoyI1yFzLy+NzPxLCfu/fr/2HWHBNMdlsD
	 7dvqXzM613gLW8ix20b+4z1Sy1TZqnKMV1t5wSVBJOtqITqPShjOn5C5g5kngf/aN1hbb
	 nc9HSNpbETG8VJ3KCqJaSU16qjW140rVGyKYLRgvSUOu27Grz8RY7obRE8cEhvvdmnWFo
	 tv+6KzQfzuf/Q7C0VtXhvGvgvX31hejdbq0fbDPmMGLSrthEd0JrvGL6QFs5rBLB8e0vP
	 OhpHbTt1Pfr/wQa/ljnN+dhoyGjW99uKjlVquFS72kMJv4Km503BuOmUX4B1IHH0f3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185469;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=T5R/PeSgIFg+ZSyUN7aEvdcRUdxKA2wXlQRJFCOnmQ8=;
	b=HxZN+f3uq6ino3KE91FYVbzjCOVA2jx3X660Nw4eOXs8gVCJU3bNGegSql5nau5QGy8u
	 VCldAUExtzApQomS5Y1VwWOFxpEmjPLM1DUC4pGf+KF//Hq++/nNo+DNWQnP9FAyODf4k
	 JHN+Zm9JRe4j4n/gTIYUHqwl30/EU5fIHs0E4e3WDUw6nS60wBCmSbxNDv+Y0u5auOHah
	 sMJIV800Lh7rtgl/4xc7elrlyXdrYIUYaEJdTbjkYSp6R4Kr7lOm89XClP0cp6yfDkr3Y
	 LD+IZLfqY/uxvuDqKD9mVJNMHdSn1Kw3c2yV027gEt06I2IlRg9kUeY7y1nAz4k5OYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qzl+rJ5b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8496D606A320;
	Fri, 20 Nov 2026 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qzl+rJ5b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661281F000C0;
	Fri, 20 Nov 2026 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185469;
	bh=T5R/PeSgIFg+ZSyUN7aEvdcRUdxKA2wXlQRJFCOnmQ8=;
	h=Date:From:To:Cc:Subject;
	b=Qzl+rJ5bPiHBUBv6QObyf9fn/9CbjnBjJtjLqU7XB2CryfNOB+zoWOZEhwVbXHx8C
	 /RvkLPLo68a9CKJ5G98jSAFAsKZKIeLB4yveBQxtvpn0gw32ptVrYOXNiGXtQ/B43U
	 ICuAMz1EBVDOdHyPHfW8fl7hQ544wulyydauGfaRMrUW+kNryZAjusrWQG/8S56ISE
	 rPw1IrVRb2BR6upu9tqEUS4AdZ3uomBi3bQJq6lWF5i8ynUkGnwlb59NOAXAVAXnkr
	 eyU9RyMLL5iW8PM+4zrkbHNAOT+fgbVmr8vXpuYivhL3X+6ATI1XYvT6jCed5I+TEx
	 x/YwCzpGMpY1A==
Date: Fri, 20 Nov 2026 14:37:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Jiri Kosina <jkosina@suse.com>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: linux-next: manual merge of the hid tree with the origin tree
Message-ID: <awBbOE022xyZY3Vl@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="ZzPA4M+AoqRJahMC"
Content-Disposition: inline


--ZzPA4M+AoqRJahMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hid tree got a conflict in:

  drivers/hid/hid-sensor-custom.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  d8dcea5754a29 ("HID: sensor: custom: Fix state lifetime during removal")

=66rom the hid tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/hid/hid-sensor-custom.c
index c12272479d82d,66fca5c4855b5..0000000000000
--- a/drivers/hid/hid-sensor-custom.c
+++ b/drivers/hid/hid-sensor-custom.c
@@@ -977,7 -1019,8 +1019,7 @@@ static int hid_sensor_custom_probe(stru
  	int ret;
  	const struct hid_sensor_custom_match *match;
 =20
- 	sensor_inst =3D devm_kzalloc_obj(&pdev->dev, *sensor_inst);
 -	sensor_inst =3D kzalloc(&pdev->dev, sizeof(*sensor_inst),
 -				   GFP_KERNEL);
++	sensor_inst =3D kzalloc_obj(*sensor_inst);
  	if (!sensor_inst)
  		return -ENOMEM;
 =20

--ZzPA4M+AoqRJahMC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsAWzgACgkQJNaLcl1U
h9CTlgf+NrbaG9NxBn11jFfEoWCroZ3xtgmWdnpEnz2RLEhq+A1uyeuVy8Nk3WU+
f4cdfzrCjKnD3P+HLFV1gJpfdI6k5fkAS4FkLGKXDY0svHHKRPV3Pn8tHP2I281r
uqcnZEcXQvpamzRK118kMQYUwqGTAMlJUMX8FfzC9jxIcezzaXUMl0bqXZR2mZj8
YNZLoYxieY7utNguiEDZ6vgO0D91xF8a4kxFVsURY6g9W66cB6E/rwwKs2XRF2Qg
F2jdaAZLpnzq5yn3tqiKv1erOZ9NF2N+cC1/ZXm2AVD2+pbkWBaC94QFlJQQIwnY
+MbpQEtsmXCtBvYxKJcik7m6KwfMnw==
=A7/i
-----END PGP SIGNATURE-----

--ZzPA4M+AoqRJahMC--
