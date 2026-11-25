Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615925;
	b=DxF6aGnBVgv9RqTZG9DCa4JGdg51npBFdlZMS3O02KGPN6t42E8viSlK3XdqWBTua45j
	 HE4L1GcJMG4+xQrT+GPX1KsmOJ5RudRBtzk/DwZLi55TndZqVuFWfit2tcbkuVknYJtls
	 oi4pkAYlz54tUt6T2xOKJVpnAU2nAHG64Ih6AV0HjxSuEWiBAr50zORxhSp9cZor2j5wA
	 R4HWGa/wpSB/r0A5z4JWbvDtqIX6ucrUxnpcPiXFT7n9A9t1Ja/JhCHKu+CeREZMWO3tm
	 JPm+ED9fpAHi+Lec6EcYHzlo+f6CrXX58hgFdQnk1PD6Yc/J3aX/Q8jzYuYVBG2+5NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615925;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=VG1K2lizq4RP3R3BR9HCQPQcoAFLg2+RbFTeAq6t43c=;
	b=Dau2eJh6YwKgrRG+2M3+40s9TrDRSnB6YYLhSURYKxdMAPUKtJKY9ebW0NT8iHVFCQql
	 F10mlqnD+kbJu94xmsFGt65I56Vsz6qQg9jGIOBX9q9o3CDQKSB2tuUjXLP9spL1T8pZY
	 y3tn5twNx074ooLWx10kJje0C+yj0+ewtWK3YiJjdw/osb1CihQvlGnSODpVK62twy41l
	 uTFHqwqjZu2NN7DHFLEDWPaX2ep8P+qHfNtZ3n+lL+3/8GizOcaHeJLkknBFoQB7Uab4G
	 bZ9caX777iT/PoECKJgKhNJ0cM665Fjp8OIymmgujXDZVVfgKo93ZzZ1LsafogKgaLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WrmcRDZT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBB5606A683;
	Wed, 25 Nov 2026 14:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WrmcRDZT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7001F0093C;
	Wed, 25 Nov 2026 14:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615925;
	bh=VG1K2lizq4RP3R3BR9HCQPQcoAFLg2+RbFTeAq6t43c=;
	h=Date:From:To:Cc:Subject;
	b=WrmcRDZTpI7MTMz/ZxRlJr+3NmHY9/HqZyfIYuljXBMXjY+pPxU0eQEx+kAgL8Sjl
	 FFDA4JhaoR7cUa2OfJUy/SGqijyJZ0V6ENexmEFpWiDRwz+ULPsENBODVWC+1dKGtu
	 N61cmkWRk18pj9/NFsd6wQee2VuHAH7Tj2rjrnGwx1JQnFnASqrtOBTpm6G3yJGaSC
	 c+cby3lo63jh93eE4k6j4Nea90ZS+mQIR5aJPwG1x8/dYXsqQQLNKe8b+v9J+znsA9
	 XeLJfqiUvAJhDl3pMWxlOvWOGYZeCShtixVq+og+U756rxoAONfsUXgfluHXW756eW
	 ieOqtbzrj5ieg==
Date: Wed, 25 Nov 2026 14:12:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbssSi5VeY0Sxuk@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="z819s4aEUNXTvRYz"
Content-Disposition: inline


--z819s4aEUNXTvRYz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  f5bdd68ce3db3 ("arm64: dts: imx95-aquila: mark +V1.2_DP as boot-on")

Fixes tag

  Fixes: d5c082ba23db ("arm64: dts: add Aquila iMX95 support")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--z819s4aEUNXTvRYz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7LEACgkQJNaLcl1U
h9D5vgf/TeMVYUT4IJ5QxooIoSn56HDVYo8o3wsdOi75mA9lv3v+wICCNCzpD5Ww
p63jRCBtOqGMZz3THboDkFDLzupfhuoyvDfAoEFvpUiQ/v+OA6EIgF4bQa8JRIOl
x4jNteFtDv5o/wtASubWN7xCOtZ42xMzFnw93eRoRx/HQ5s1t05miZkyQnBPboAb
EWX9dpjAtk3VuGiYmIzT+YYPyaqc/0qnhYF6KRJN07J9b7GNugjHHtOIaBrItnGx
/LrAXUzuHFtYECflgrb8+7ose2TdOymmi0Y6NVctMA60ayqJgFYU/QiTTWJ8S0A6
ywGWDp5p1J1bmbU3U4b0xaVQmh1dDA==
=AfBi
-----END PGP SIGNATURE-----

--z819s4aEUNXTvRYz--
