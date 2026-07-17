Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405DF429027;
	Fri, 17 Jul 2026 14:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298536; cv=none; b=O/FBZegyDJvzFVVQ0adZcGjTEfz1Lt95y12xkbwJiAX+pkzZZoT0CXgVctXACFTIQ+YnEJkyMP2EN81i2SF8wtG4KO15I57bImWHyUq3V9NmfghJYeP6HBpoUoinHwaLddFC8k9a0Df7pSf4btqK9T7kzCD7YrGi8FIRpYAlric=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298536; c=relaxed/simple;
	bh=ZeUtyO0O6UdYPNmBLWbTnifp7Nn8coXXNwMi9uYKtVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kRL1jce3qxtnDboUj0aKtBragq48abAOnu/sKXfwT07D5w4Slc9UxzRMZw802aaP9VPaKtjpPQXt7ZRG9GucRo15rkGc/y/1I4ArIqF4gqCunUtMtrbcPh759xHRLvx97uVUDG1frVJkbpPpdGvsd1ehL1LwWT4mm5XnG9PcOLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwhQQx6s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwhQQx6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB101F000E9;
	Fri, 17 Jul 2026 14:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784298534;
	bh=BY1MoJ4lUi8/5ujmTjj39SsoBAQzNoS3kR7+hCelZo8=;
	h=Date:From:To:Cc:Subject;
	b=QwhQQx6sgihzP1Y+1m39zAeHbAclkuZ3ldqutkqnJHPDTQjwYQUXkyFXIWKIefpYY
	 9xfIz0E8N66AHAMqHUPepRj8jZxRME22I30E83HkdCao2cD65fQo9WuaKJBo1cbg73
	 0s7vuy5/GT2nKRXnw39BsRlEMPWgwRqLnRybHHaum1P1LWIDal3b9W/5c24wV8xhEz
	 8ovWIv1+9BTYFAO0Bjm1mOsjW9OfCGKcrK8ObDfOJ5iRpVrCWKsOSffCeK4r7nQUyP
	 xZrAtywE6B1tc49YD2j+bbg9LZkfAhWECtLlLtCtmZj1JAE91+6vRvDu1K67GEWOss
	 Ac1Qlm5xZqCiA==
Date: Fri, 17 Jul 2026 15:28:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bluetooth tree
Message-ID: <alo8I2rojFXuCEl6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RVwTX8vP8PjL7PER"
Content-Disposition: inline


--RVwTX8vP8PjL7PER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

   603b91aeb20a2 (Bluetooth: btintel_pcie: Refactor FLR to use device_reprobe())

--RVwTX8vP8PjL7PER
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaPCIACgkQJNaLcl1U
h9DlhQf/SOuDxdkVBKVj6ljUHSoMjXRgAMaaEou+BBCYvm0J/+8+S49xk6VntK3O
PkXEb+MqajBk1Gzr0D2xD3QFhFc/FKeRHggqmk61YVV03VUHsZnmdYx+Ai5bznxO
ZQmJ8qWi1q7/vdCSY9/yyRUwSQ4p+xyxSqnUy4Da92eMMakH4EkkpVMLotabX7Nf
9G7v1lBzJMBJXKTxbO0cOkyQ/4ymmfMlXbJ4ydG2F7+PBgsIAnYU4XOwD0+oxxtT
9OiA5ArhAa8TGfm47j2GdY7I+VgIo8eWVBrQ5jBFYSi2Ox4m/u1+WlC0Rwc+I9s/
I3SwiZuqUn+Eq+Eug7G8ifgo6zGOiA==
=KBi6
-----END PGP SIGNATURE-----

--RVwTX8vP8PjL7PER--
