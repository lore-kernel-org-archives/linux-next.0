Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949E7368276;
	Fri,  6 Feb 2026 17:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770397934; cv=none; b=SgAmfOyjy1mkh81LxQzXPxfAb17m4/ih2xiPz53aQCNgQkTaVLMC6j+8hhRRrO2CgoyjST74WHXm2sCLJfxihXB8gL8jRXQqaOmYrfTxb90SCvKrcCBP11JhD1s0GwPvcMuKPAzIK228CMdjHtSTzBv51ZOWI5mTcWKiVMKR1Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770397934; c=relaxed/simple;
	bh=8AVwtm++MbnTl9yIRt4zODVRtC92nW/Tdb7STQMC7ts=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsWEGOq48++RorKarTW/3MzL7ZdIrUYY69MdRnx27dP7HcaHpzK87YZvlZfS16EqhUHl1NDq0F8HA33LCSOo7voKmbUJNOBX6FHOeap0ZjvtIgc2ShbZXZGuib/Yn4YOskFkGHZVgBfF29zovRyNDMcjkAkrFru14BBZDHvL0oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ut46QfW7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ut46QfW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E424AC116C6;
	Fri,  6 Feb 2026 17:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770397934;
	bh=8AVwtm++MbnTl9yIRt4zODVRtC92nW/Tdb7STQMC7ts=;
	h=Date:From:To:Subject:From;
	b=Ut46QfW7nFwYr9HI7YmZ3Lfu6wi/PUWJvOvk/azAhjfcoLBmkls7dTghROQFnfERE
	 twtxfvfg+UlFKsQ+LmotVuCsbsq3fwemhT28MAYVLWjVIX0tOU1kH+fbUzdtm8/iYX
	 DOc2R8nU4tjn4Ejz+6x69jald2R4cf2e4ox0grHLeTcDExzihwhbGJs1lVnHmvFMkw
	 icgGX2Gm1scj8NlV3mEonx4EZoRpRhtbDkdQhcFyb8OsmzkssOPBpUf8z2KHASmDE/
	 bwGHqC+yhT/j2pYoWKrREsLxdDErJ+xu+Tqv7zy6n9PnuBRtlC787TnwrW9OnpEWRU
	 4uD+3GDRK+U6Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 672701AC57F6; Fri, 06 Feb 2026 17:12:10 +0000 (GMT)
Date: Fri, 6 Feb 2026 17:12:10 +0000
From: Mark Brown <broonie@kernel.org>
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: No tree for 6th Febuary
Message-ID: <aYYg6venQi_rIShV@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U+oeuyZQwYk2Hkp3"
Content-Disposition: inline
X-Cookie: Think big.  Pollute the Mississippi.


--U+oeuyZQwYk2Hkp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Due to a mess up with the scripting there will be no -next tree today, I
will push one out on Sunday all being well.

Thanks,
Mark

--U+oeuyZQwYk2Hkp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmGIOkACgkQJNaLcl1U
h9DH5wf/UlhLUjWbM6L4gI7jD/B+VNXxF5FsPq1NE1JzkTAlyUgxIQ4bR+i5mgBk
3FWvnVA3Z0ylPqAeQdBEcMAfyV/OtzqUkQUy9D5DATo/cw363ldsLLUPzqcNSgFr
BizHY12QIcis2A7IpCCEpEK7/oBC2tp5tjPPs9FjTyPwcomUqL8yFFlkXlZgsT26
G3WHZ81+XPvFdgf22q5FLLUuKK+ODawvhXrD/kyRfS9+PvCI00CuGqoPvw/sZxId
4Hkev7DBaFqFEU9o/3AYNxNVQ51VuvO5GRV+0883C0WHSLeC8yP934b/mP5RWTnK
tGBEmn5D9mpAE2peEIhFUvCGIUFuoQ==
=m2Pv
-----END PGP SIGNATURE-----

--U+oeuyZQwYk2Hkp3--
