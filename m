Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603AC3A7584;
	Fri, 20 Mar 2026 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009839; cv=none; b=Rzlol9Ic9RFKdGAhYV7y7ioroOuwqM2LOBkMKz/zGHd8GHam+Eyaosv9DS1rbYjs091VwH/hVaBEClofhhQXZvo+ugG1BA3Rbdzs9Pso80NwRgG08Y+/bnxu+8qdR+mUvTh9ffg6w4SAolAEikFZyfjVzoxd/xgUp6X3kt9lS5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009839; c=relaxed/simple;
	bh=vkY48pFQJJnb+UUFvPA8T8cnhTwM/RPwoBgP6R2YHRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WxxUKFKjjKu5Nk2BObQd5Lrd85MZrnbioEf0dfTFJ3QRTEZAzEKY1VT1/48PE6MAAdgAh0ENTRBCdR6RCyjiI9VRo5KJnq01/wEqHep5yvhOiisr/wwFo7pUndSpYE6KbSUGgCipwwTbRI0TK7l9GRHp30K4BRgPc3XOCiUll4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qY6IDMiH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qY6IDMiH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D088C4CEF7;
	Fri, 20 Mar 2026 12:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774009839;
	bh=vkY48pFQJJnb+UUFvPA8T8cnhTwM/RPwoBgP6R2YHRI=;
	h=Date:From:To:Cc:Subject:From;
	b=qY6IDMiHXO00UsdMcgmy8obdk3HI21lzlqBb4+9MgG81ee5A+N39WwXcECaAlLR+Z
	 Ge/WCXzLZ8lNNR6wDhQb3m97Bzm5FcxJnSJFK+2JCTp8nNAlGeTkFDE4MoIf8HSw/6
	 BrQcuuY+IUAcbh1yN88RqDECuk98xFFSKv4aV2aVYngHuDBcjqAM95lnJHbIioNnrX
	 fNK0gpOWQ3SjeKf530oQq6yHRZwL9yTp+0Ih4JIQiqS8DJhnU1uYODpWIXCfVEZmDy
	 4zxnHg99AM49hxb+0nJiCK8QMtyl+nNiCJzVvuKXIQLL2lA/TSSPhRbhxaI8TxoQ5m
	 y0DSI97EIGtmw==
Date: Fri, 20 Mar 2026 12:30:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the hid tree
Message-ID: <ab096wLbcpu0M-GF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4+2JdULTrjq5YLB5"
Content-Disposition: inline


--4+2JdULTrjq5YLB5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  142068281f513 ("HID: input: use __free(kfree) to clean up temporary buffers")

is missing a Signed-off-by from its committer

--4+2JdULTrjq5YLB5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm9PeoACgkQJNaLcl1U
h9CvkAf/bqUzLLipKQ8EbB/qIUzKpbZ9i4saaXBJ/cxAFO0MCl/mW47fBbJEP9DZ
cGQQp6c6PnyWjvtkzCjjWyf5iWBHhORECm+I8WPGnXsOEA1KN/OJJOyPpO+rRyWd
BWnamdBZ5NFS48oiusESTHMyxoCkK5IZMhmUWVdS0K+fRtSQBJp6Ab0OidjdKIGB
76WooCCK8T7iIMo6yqYkSrfUfmcTkxz4OFQcInNlJ9qjjSJ4wZE3pDsbddlj1nQa
rOqZGJ+ZFuxA3NpOPMuG+e3MoVltsxCRaHXTPSDKRVqcUG5WH1FOVcf8lZU11AVK
wz0hqe2Od1TAUDBPYxX0aVILu7jRUQ==
=+4in
-----END PGP SIGNATURE-----

--4+2JdULTrjq5YLB5--
