Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811283546DF;
	Mon, 22 Jun 2026 10:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125103; cv=none; b=ggSaFS1Gxrer4pb+0PkHotM9dl0cDcMBidk48Olu/swMc5kOWC7PKy2V6xe75bS1jJOhCKxRkOcsPobNVXFeaB+aty96pDI/rhRzS4cN//Nc0fUMBTdYRIyRIzvqT72TKj/YPVByvF4hbNUz5AgDrUzvZNi4k9cplk15P00yJZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125103; c=relaxed/simple;
	bh=nETAQ1zQDE5zMWVn4s8/ex4VtQKGFaTY9cL53I8Z7VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mtNyXTtugqMvpPw5wBNzTOJAkBOSBJIlV/iAGY1TpXv2r3G/5BZak9FDt4hbTyFvSc2qnBCYTCgT2UUH8z1FcVRslA0DvCyI/GoiDZFYUkzHF3vlS36U0rw4rHAAcXbXqVLRDC7i7cxfx3xs3B4hwjyYg4uJO96RyDEAHOSEGVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMbFeNmu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMbFeNmu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894B11F00A3A;
	Mon, 22 Jun 2026 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782125102;
	bh=4pvtH0i/8oINSg0If7zvlL3F+sOAOW8t3Vxq5tLsDmA=;
	h=Date:From:To:Cc:Subject;
	b=bMbFeNmuroz4SeGmqya0rOO1aYJl5vNy+i0IY6SUsYbk7R6wSm0Dd8XY1QpMARA05
	 IBCUd5O47AF58WIgl8mtaj+QY1qIFsqKbJSWhxc76oa0uRQ9mg3i0fJzRRAbHVA/a8
	 +TWfNQpVkMIExVdkZeSaQhcB3+jGaW8J8MKjRy8sA55SENXt0gkAiLKamYE4A5ftIL
	 +Kf1Z60ptumkISdt/oUAo1naOJiDpJ7O+p63I5a8/NOhKdx0sAKjSrMwIlrFwtB097
	 4p2znuAyc3GRrCyRRBjH/zBtyoM9XNTBp5SQ2DTsJCeVMJdLPXRofTjTyFUBB6xzYt
	 vOsNrcpNF2bdA==
Date: Mon, 22 Jun 2026 11:44:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Gao Xiang <xiang@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the erofs tree
Message-ID: <ajkSK9jNJBSi4omB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JqFvvcjtey9MMW4O"
Content-Disposition: inline


--JqFvvcjtey9MMW4O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  8501551579195 ("erofs: handle 48-bit blocks_hi for compressed inodes")

is missing a Signed-off-by from its committer

--JqFvvcjtey9MMW4O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5EioACgkQJNaLcl1U
h9ARvwf/a+vG8ZsFx7fwPqkn9lZ5tj033beaP+hd5FhhUMXCV/NhaDiYKHbRgncj
WROGdv8FdSgBB5zBpTpx7CoTY54FnkC0vSZB4dglyK5xe76javbS0uLO61kljA7U
mlsjOFnltS+2NgQJ/ibI61mZBMDLteqhGARjKAUIrQ+rNSunZqaze8WwgdWalao/
T5wkCbP8D6wPY5Q9zKDhW8EiAlNu5+ckoS3n3TUpN1Y5mNxivYv0C5GVRG9pjwqp
RP1CeAc4cmVUj8v6d7t/3FQzWSw3P/AkNUV2tqzkrGP3BR8IL5Zrb/j/Sv3D6CQr
Yfbn76Laiyl5dS4eT7ZakUzoO7kiOg==
=3aI0
-----END PGP SIGNATURE-----

--JqFvvcjtey9MMW4O--
