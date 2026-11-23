Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442952;
	b=jlDYyhc8zrprhRzFpyCNOrGUuiHmd2AjivMJXHgCABidqBnCYyJuQ3/j2bFsJ56kEWZY
	 Mo+YgfNVjuh+JB3PXeIda9Lyu1R3QgkIxAr9RoMJyXqJ/zB4sNrxtq6MCTlfVmmPw076r
	 HLSWtwP5b3etHy6fY0LBsxKG9wR+fftlcIuyoZlo0FKUWlCGN8cMIvB9x0I5Fpa37iOYf
	 jkYSwWMMEz5Eby65vhWmxHsjwsn5Ot7nqysm5ps5I6MqvRfWJYV8IZJrnVyfoqBKQYzCG
	 0Ov51jwCaim3D67Smdc2xgZ3o/VzrD9wQec1flgq/gTb2kQJtuRi0M+qLGCCWKKAkig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442952;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=hje8/Rn7NK6ft0JVQo++bBsZNs8SMQxhUWurSb3FeJg=;
	b=FxtoCdZLV1MDT8hehRZX+aNMR06gX+15X1ZjtSEASW3jMZ+t8vvDycTvWzzrkWnsb2FW
	 4sdSwBk5pch/xVfzMzjrFXJUNlitqzntvM8EQhRR6YOnPO/VCGmyRqEcEJtszKPWgKvRw
	 G8UkYL8DHnHSq7s+l3eJNmTzHDkLTNR3Jm2OtV60b3V23Uz0NHERnUiFFFZBRyMUP8r3A
	 VkQH4/8fkvCmiblGLmn+g2h1GQYv+lfebetVAXUKw3T+xv8IRud7h4yys65IOmLDNsZNO
	 c02mY7hp7D7wwz24IDG8Tln+yoFTHD9TbRV1z6MeHjMRSmHuQTtvL2MeTP5/q9pDCBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yoqw9gbX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB0E606A339;
	Mon, 23 Nov 2026 14:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yoqw9gbX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8E01F000CA;
	Mon, 23 Nov 2026 14:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795442952;
	bh=hje8/Rn7NK6ft0JVQo++bBsZNs8SMQxhUWurSb3FeJg=;
	h=Date:From:To:Cc:Subject;
	b=Yoqw9gbXadxwB/yGAo05Y1ONaZTmlP9qcvfljgIC2nAaRUSlyl1v3bNzqMV1s9wlJ
	 Ezq8ijp07y85sS3Yz1rFosATdVXwyxp4PSA+Zs4DqrAymq93T7eiCYOfiRZRKwIQVt
	 2ZTch62+8Aqd4P46eWwoxGaQcvPATQOwr8DaY60LEb6OUp1pi8y80SdK46+1PXSfgK
	 FxyupAkSOzxRPHrwwXBP2Zo4V6K1TAy36Zye2XVqmI2BkbLAb+71lPDEqkYB7wzu66
	 nfjvjaf42apkG04+bN58L+UUEUUb58dq5E8/Wg0+pnnYZ/O+vD3eURXFnNA9BXUSXw
	 y8n+8Y/EcgAcQ==
Date: Mon, 23 Nov 2026 14:09:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Jiri Kosina <jkosina@suse.com>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: linux-next: manual merge of the hid tree with the origin tree
Message-ID: <awRJA60QzxdxM0Mo@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="kpqviuv/bfzMDw2O"
Content-Disposition: inline


--kpqviuv/bfzMDw2O
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

  ac6c19392c799 ("HID: sensor: custom: Fix state lifetime during removal")

=66rom the hid tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/hid/hid-sensor-custom.c
index c12272479d82d,4d7cb7994dd81..0000000000000
--- a/drivers/hid/hid-sensor-custom.c
+++ b/drivers/hid/hid-sensor-custom.c
@@@ -977,7 -1019,7 +1019,7 @@@ static int hid_sensor_custom_probe(stru
  	int ret;
  	const struct hid_sensor_custom_match *match;
 =20
- 	sensor_inst =3D devm_kzalloc_obj(&pdev->dev, *sensor_inst);
 -	sensor_inst =3D kzalloc(sizeof(*sensor_inst), GFP_KERNEL);
++	sensor_inst =3D kzalloc_obj(*sensor_inst);
  	if (!sensor_inst)
  		return -ENOMEM;
 =20

--kpqviuv/bfzMDw2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsESQMACgkQJNaLcl1U
h9D31gf/QR6mGla+ws/gsxAD5RqV17B6ygIauA7S8VynXD0ty6e+kbqpnS2byW7I
nXUsi0XjAwVPmbM5sBRi8Vu7VNcovEzVYxOu6jn5xqSOO5ESWZqsrBg018oxQx/N
pNp1RKg524qPL8m7FncorLcOUw96Wndx9RTU4YqgYIXVaWyWbBVX6zW8SZx+OltN
Sb+TCeKtx18nJaGFaWe/FeTRXkQXzVdkiLjM6ugiJgUtUak+qFoeyCKt1NaBhjAq
gsPTHREclVuykXfyqQxburasCibwKcHRFVO5A3AwYTxycDQW+QUjev8bJ2xwfUxy
5Bfa6pisq3Nxj3Tb1ZbUpui8MPJqog==
=w5Ta
-----END PGP SIGNATURE-----

--kpqviuv/bfzMDw2O--
