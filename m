Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D20B3CC338;
	Fri, 22 May 2026 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445424; cv=none; b=P899QDkbuDQhMIeeN+6bujuasEkVF63f0QmpWZhIf9NBiyptMbl7gYG8jtY0LbNpKM/dWiKJVrh1OWrLNkaoDBCCuZakV350ZJeGCgD3aXZVdXLLjIAJixShq6yCzdNrtKbRS33lWJF/nqAX+XPuPkImcYozxafby/5sx4Gx+I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445424; c=relaxed/simple;
	bh=d5v1RjrqrZ1v1kttuGNA0ebLtcHhC7AsS8aRKjN7E3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XtZLR4MjEDlh8G2zlH8rzgTg0pbQmiv8p5cgGZLlFDDcRtih1CcLJTY0xWQSQ0ym3JHWltiORe+cFyPP6duAoeWz8IDje5c7GhVHowJ7jadm2mdRvUyckM2/2Ndg4+fV6XNXTK77+J1+0l/EidK68NfCUzue8m3beSjI3MCqVSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDYV3wzV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDYV3wzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFE21F000E9;
	Fri, 22 May 2026 10:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445423;
	bh=FYXvbHJKzBZfZxtHoh0emFHINyjj3pgoyZsTwpFKZTQ=;
	h=Date:From:To:Cc:Subject;
	b=HDYV3wzV8lK/H1FSDkfrhYxrcnc/RF0UlW4+UKCwG/ObvX96Uwi9xR+Z5fDzu7u8S
	 WTQRmjW7m4dOEB1IQYBtyU1Oy1J76lIR7WED8bmeSLVqq7vwwH3ICXSBxz8Ysj7tZh
	 irZfBCz3hsA88loN4kRc2BpzNnA2R0s75Xyo/W5vVyEoBscVd7MAgUczuN9EoSlR9m
	 /7Zyle1dHv4NYgkH0KHnu3nR8K9AwI6CeYqBhbn4wgUlWYeF5qTpw5b0rdU+rXwtou
	 6eyrvo1KCmK2PoCqBpvGzup/6rNUy7iigRECsRhQUfVJAa3Tz9G0P5aG0j7zGyP3Qq
	 B5bHV5UhmrWQw==
Date: Fri, 22 May 2026 11:23:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the vfs-brauner-fixes tree
Message-ID: <ahAurCylIIAP4vf6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pgVxO0bun8YI+rmq"
Content-Disposition: inline


--pgVxO0bun8YI+rmq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  71556f3d55ee3 ("signal: clear JOBCTL_PENDING_MASK for caller in zap_other_threads()")

is missing a Signed-off-by from its author

--pgVxO0bun8YI+rmq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQLqsACgkQJNaLcl1U
h9CE8gf+JZ6rnnqnyVZVAVwNArwjLqNJrajRx83Hfmrx75BePBzrbEMdNe/PEB7T
29RmFA0DIqgYlqpxWSZ1sWGxOO7NH2ZFx+M8vRBGInr7DMtnJe7wRMHHzsSgi/uH
b0AbYcZ5W3MUyFNmAQ7iG1zCWfIs2/bzS7ztQSriiVFPUbC5aA8quLm6KBM0Z87g
mR4EerUMVKKGYATr7dnZo3jx/RdpwAMRGz1nnvpavg3rOfZVs4d5T4+IWPkAMcsp
LNjC4KhhXMN4qxhsqtW1IEV20sUwI4tu4O13cbJaQJe8QTrKOnkufBsZ9RGEwn01
3s2ReamG69sRyDWkhdPQAoPszNOTdg==
=Rrih
-----END PGP SIGNATURE-----

--pgVxO0bun8YI+rmq--
