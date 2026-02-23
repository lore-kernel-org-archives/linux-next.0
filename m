Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4581D344D98;
	Mon, 23 Feb 2026 12:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849088; cv=none; b=oumyV9Dfkh0JW0LsemVjMnab4jUwdu0SVEyRazyoOFTjjmnTe+4G1Fr23tM314hfZKdFCJrsQjZLt3Mxk2uTk2Ep78Aix4bh2zm1MjoIFlnTzdCMnIQ/rGtbm3W2bpgLN5to7081Y8WcMf/mQ9si7nkN6vfLNW+c5PXAWPoSbi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849088; c=relaxed/simple;
	bh=S4G1b/AONOGbAEqESOh4pDoH3V1HNi5q7ZwxnUDJxsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cFvBk1TmgBwYiN1JjxoxESrIwjodz/VZqjm+vIz12f9qu7RAWGeKD4zSXV2Y9nrvG9BRimqJtmu5uVtGjmIaALD1BHng+dwx/Bd3os4Eh8IgoUpptzxpjjOrn+Gv9B1aBsMINk0arZ7NcpQFUAv30bo9SGVXON9rS1bzxXVL3Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dgr3Oaqq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dgr3Oaqq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C4AC116C6;
	Mon, 23 Feb 2026 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771849087;
	bh=S4G1b/AONOGbAEqESOh4pDoH3V1HNi5q7ZwxnUDJxsA=;
	h=Date:From:To:Cc:Subject:From;
	b=Dgr3OaqqpNAv946hWO0N4FqX58ecy4XUKrTZR7onlS84mK5psW+UMELeUOP/SFtFq
	 a2LDLRUBV+q3Db1Z9YFDWCklSoV/dyLRcJ5nPbsyoQCXPPlylPf1X9uHLlW4cGK69y
	 uayicnmUZE92F4wToHYFmLnJufCEp20msexUmvJcBrEV+kNvfEHCkO3dtHWp9drkp2
	 G5Z+X83CXqBLYzbab+usmCsfBOB++Cv0pkAbejPT/RESq6sszJPIJ3AXGDe+ZOuHkj
	 2PQAA6RVUWwwhiSHL1g6KSYvpC7mf9l2S4SIWHRsYdycy0g7PyGwBSlDrf/R1AZWjd
	 7kLsXmIn6RWrA==
Date: Mon, 23 Feb 2026 12:18:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the tomoyo tree
Message-ID: <aZxFe2cmZS2Eu7St@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yrRWs15uv6RNQmfl"
Content-Disposition: inline


--yrRWs15uv6RNQmfl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  af5c75cd122aa ("RDMA/core: Fix stale RoCE GIDs during netdev events at registration")

is missing a Signed-off-by from its committer

--yrRWs15uv6RNQmfl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcRXsACgkQJNaLcl1U
h9DXnwf9EshnSZn/Ppsb2VqIQcYC9FZDc2kJ/zuHn/XvkOFz/mNHExV9tMm6y1qT
kNzimBojkvK7/POwHRzuOd/zZmM7+dfjGb2oh9qJNziWd80NRLU+S+hf6OZMCUOy
mibiDAE4i5UBhfkL3SCyegd0TxXJl5S1VImnxpYVQ9djTZG/MJPVMqKkYrfZVga3
KMj6lZF1ncGUC5f/IC5vKtxssFdCj3cId7NugQEbghK/tYKc2mOtCGS06wwR3/X0
/KJoJ8IWXydeN3UZTVyqaD1md/9maJXXvnAAkuY6qcDxozY0Fe8AaJVFVMiDk3dY
CuRHJA55SgwpZccu/lA/CBYX7993XQ==
=ypGn
-----END PGP SIGNATURE-----

--yrRWs15uv6RNQmfl--
