Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5A24C040A;
	Thu,  2 Jul 2026 14:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001053; cv=none; b=Wpo70qLSey88UBiQhw86yJsZH/srMM15p6spd5d23FZ1mRMLp32LcvR2SHY9/Omm/uVSLL+HwTa0NDUknv2utK7t41pgz+tNGUBxOsGbBjjRKLGmSBlAubZTsV01xM39ohIOsAEw9Ro6MENFnUjqOHznSpIoi2pSwt5Q5nSyuLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001053; c=relaxed/simple;
	bh=IiGRFO47BZ58C8RVLgkt0eMysc6SVLn2/G2QaYP9YHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pdje7rGOV+xKGvuhAW+VWQ91XNk+BYpGuPy6Q4Ykw46qwVYdj8wCN6Bua9dCLLaYoNYS64augMEJZ0ryBJcDhvLXPIZOi+gjJDgW+EyU7vX9rHuY3JkYoLsWHnpXkftNEq3FFx8d0eCUD5J89rRg4DO7DfthX0aKnzcxDsOI4Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iW46M2Vg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iW46M2Vg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2401F00A3A;
	Thu,  2 Jul 2026 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783001052;
	bh=UW/PRL2p706z6WOa/CakRKZ7iDUrXkN5GtTA9j4dcCs=;
	h=Date:From:To:Cc:Subject;
	b=iW46M2VgP9itNrkT68S6FWsCZb9uF+QFZlPXPq5cRSky7Xee1Oaq/TgNsHjAmMUVt
	 XK/7t2e5rMtp/6vZ1eh6j2b54Z3Olpq/qIko2Kxf6yTvPsv7/82oITiTSzYPQvv7cx
	 7eMTk1sNIwIJJy8om/LFd7goiJyUyAg3YVm7Ug74mEBmxukJgjVMLcqpW9RCU4UGgp
	 YF5QBUrqnhzO5vzaE8ebFEbszJh6ck6Yg3xxJcqal4NwQbWanc7IxcSms0aO02CqvM
	 AUSkcWPxe9BCKGxo8OaLHiHUNP3v7vt7fMHD01MubgKfE1bIqpN7XSeSxxJSudz9v7
	 E7P7DA1Jylupg==
Date: Thu, 2 Jul 2026 15:04:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the selinux tree
Message-ID: <akZv2JkwJhqantRf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EboOY+j4QI/qOvy5"
Content-Disposition: inline


--EboOY+j4QI/qOvy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  99ecde22ef1c9 ("selinux: drop unnecessary goto and label from avc_alloc_node()")

is missing a Signed-off-by from its committer

--EboOY+j4QI/qOvy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGb9gACgkQJNaLcl1U
h9Dchwf/Y4ZPnWAER7fRyoLQDOOXmR/x0TH8YZ5KKzByLxJPVKZt8VgbYhCqmZ95
eBe2kgVv8+xcPiDuVavEmAfatKhs5NUd2VDwO/xItnBzsjecf6FgK7TjzV8nTucO
I3ThBVEh1bR+MauWhCk3V9shuhWPO0de3ESZRnGZi0nJwoUCtb1tGwUcJq7JhzBX
U2P6YHW+kPQsRiKW5flZF8tR1ZPgzu7uUd+5NTgq/WWGzEobPXqT9SD3lwVRaimp
ky1hLmeRJZYfXfwdZE083oPSokg7VfTLdDnDobs7VyzGG84teZdJSbUlE/BtpbLd
Y4/Czhkrw3nm3B1/cMwUrOe+LCfILA==
=BrR7
-----END PGP SIGNATURE-----

--EboOY+j4QI/qOvy5--
