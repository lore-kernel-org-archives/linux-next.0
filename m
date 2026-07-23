Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C232F6931;
	Thu, 23 Jul 2026 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817496; cv=none; b=MClq/4YEV317JppSaXzWDMMhGOs0galbSzyyJBIDowE/RFfdjNw/R7j3ThLWPClG4rliwfTCCAtBXShrQ2jjnRE2/H668Ow3I/0JMf3x4bo6P5Sn/kKS8NIf2sh8URxAIUpiMaPw4NwRryggMRvcj7cs6hUYIhxAHKg3ArKLnEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817496; c=relaxed/simple;
	bh=El364jYiQDmyWpTqot/PaYER5fUcMfCuTVMniKmeaq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CSTWKkm3ny7eDAEliVXblESRZ13avGcwF6mNJpzruh0rbR/swdnbYX7kNr1eVQ+cSkTqrbMIwJIc5yKrMuhebDtmbY8FoQvPu/Rj8GBpPeTWFe1miUDSYCjytHVkTcdrUerxOO7q8Ps+non9obnk1g5WEAtRWLX7CFmo89hHADQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZS/QN3/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZS/QN3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6831F000E9;
	Thu, 23 Jul 2026 14:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784817492;
	bh=IN2lrK6PXSNBjgeov1BhXRj8XWLx9wXfNNrNaxdLQ8Q=;
	h=Date:From:To:Cc:Subject;
	b=fZS/QN3/B72kueF8EG33/5H90HdFNBOfTyEamivYkpNfPovU6Z1/YacS0ZjVcjSWK
	 brE0ZbO31Lk2+OU6vxOIsgX02zIx9OqJiCBRiQvoaYQk3dkQItUULucIPGRpLD3QTY
	 Z90peYB86uJbMPVVF4lg+y9VLOItmXwUoaCJUP0boOHnspskgV3InOp97/UA11iuuO
	 D82rgyby4PcDxKc2dlF3SI+4/3allim6+I/AZIbkyoJDoCETzfIW1gTlYg5hGPDg1v
	 NjuxetxK/Gxq+87eEUwEeRObVugn4IPBUXVNOoON4QDUr5EXJ5ElS7rIo5b4X9OxsV
	 y093zwP1cLAcQ==
Date: Thu, 23 Jul 2026 15:38:09 +0100
From: Mark Brown <broonie@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the paulmck tree
Message-ID: <amInUXBCvCX4vXUh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SDiq8ROFjCYozj6u"
Content-Disposition: inline


--SDiq8ROFjCYozj6u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in the tip-fixes tree as a different commit
(but the same patch):

  fbced06c64fd6 ("smp: Avoid invalid per-CPU CSD lookup with CSD lock debug")

--SDiq8ROFjCYozj6u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpiJ1AACgkQJNaLcl1U
h9CJyAf+N95gqkQPLXtgKjP89B/wN/vgT64D5QlnyWoF8V68NIcwYcOPSb7vek+n
JM1sWJN0vTB0T39LCZMhwfZ8t2yPvz2265aGz36Oe1gg7zWZzJgRkdmE8RjI4j9J
q6Pfv06zOUbVFIYmdt1JQEqmluMLVrCZHMjMn7aB2tfMi9BPInx4La84sq7rjD82
ycnJsquxM8jJqO8PSXNgq0zWQ3TLaJmRuH8orwYbNpuRjdSSqShAGyCk4mMFjirv
9yBxzdd5O04b+4XfYnaYc8eSfEtGlT2Xps8a53LafIIupJHfrq1k2b9Sl7juoqyU
9iUw1FkJSYLXZJ1xBrKpAkPddQ1eNw==
=ZGPl
-----END PGP SIGNATURE-----

--SDiq8ROFjCYozj6u--
