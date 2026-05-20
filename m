Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A153536DA18;
	Wed, 20 May 2026 10:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271694; cv=none; b=Ye0Waw+p8IuqRyNK3EmTn9GjWYha9JGaCFQeSHEothtEAFt6mD63PI7GJfGxirJAwXM0JGC9+Lk0+IIz7CjKoS/C4kjqoN6IZBCvrcYdurqAiY+zTThMTLAW5pkuSDOvm/Q2kjV9fz4zkMJ2EhVsCOSJZf+3ClUeD2e9BCKTHdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271694; c=relaxed/simple;
	bh=dhxKaIPZuumC3LDx3UTBqlFzlV54dDASvlQ5F7t58Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AZ95MTmH7NNJfrafSoeh316AIDYXeU62g6N8p9Sfm8OQX1p4YA5zE6sonnMrN5kTrv33LzgjoRUm6nTntZ9NeqkXii57h/9S4ASDMkLoXpp7jZWm7PF2jNiSyB/Aod73S+k8+Py+phT0i4MvwfvbWsHcEag1sKIgW4y6uUMT+ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4l5/WbY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4l5/WbY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764E81F000E9;
	Wed, 20 May 2026 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271693;
	bh=2tMuJP8pOvhsJ87YLo2K1b9ZPN+NdJ6eDopLc4JX7To=;
	h=Date:From:To:Cc:Subject;
	b=c4l5/WbYWLFsP2drNNfHaXZjCrM1gOx2UoLHtpoP2Ak3cYvPSQHHZcr0kjOlf2+pD
	 F17GQYL+n+f1ZfZ1sHtkDNFG/MBDYIiRI+CSVOJZ6pv5eS7l299I50123Lg6aLEVrr
	 vHWIr1Om/cgpJ+IOwpb/XkQG8sOSbh0kts0MRWpLVU2JS267qb5HNmQsuEMP2AuXIK
	 z3cGbsfPvzgi12ULalwBDnlLlYhH8OOFuB4rbLEChDmRomB1WWCCsYWJz7uaBmyEWg
	 /G5lmhQ7LfKahKd0jqoHJsYCxZKeSJTJ0kpWG+5nr4WEn/8s0LXbQPZgy9d/qMVbRB
	 kmH4mwpmoFD8Q==
Date: Wed, 20 May 2026 11:08:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the nvmem tree
Message-ID: <ag2ICUOlMmGB_Bzi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tM6J/8MO97GRUhAO"
Content-Disposition: inline


--tM6J/8MO97GRUhAO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  9241373b4768f ("nvmem: layouts: Add fixed-layout driver")

is missing a Signed-off-by from its committer

--tM6J/8MO97GRUhAO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoNiAkACgkQJNaLcl1U
h9AueQf/Veg7w/LBJRCdQWVu/7at2EHj6YqN1VR78H5PmnaaqOoLcgPfOkK7Y0vG
SRqGfw89GN3pkRoIauR/QB4rDVagB+CEhmmce7rPgLdm62yepCLpHRhks9LAA4GL
uwn747DfOaiZpB0KJpJCrbl4H2tYqhYGEoxasYhnDptS5SPhn1f2TVZzx6wWtIwk
gZ2oegby66V8/lMV7K7XI0rtRphzD9thG56xzBfAQjWbbN+0MVS9+JVkJkuww5bD
mKLZxy8fMLXdwh9O00kTAKNcOyb8QKX5zQso4PDl893934DnoUcuZVSo6S5lfmsP
yyEsvzuX749b+N1C4NIaBsEwl3jxFA==
=06Za
-----END PGP SIGNATURE-----

--tM6J/8MO97GRUhAO--
