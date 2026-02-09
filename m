Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7088A25D216;
	Mon,  9 Feb 2026 17:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770656871; cv=none; b=VQPFw47NtA8CHOt0l/dVrFQlFUCHYGmdVQEUZD9V48aTR7MNekVEcc1+3lUOtz6OjzEMBvNw+h/0y8YFsOho32gO5h160iFmXe8Kq73aJbhzKqyLwpO5fzkEi6gp5Qx55SE16zeWxdbHkax6jPnUQmaQS5LE+YfNuANRS19VWls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770656871; c=relaxed/simple;
	bh=kHDFXBPTZa1m16uCPgZj/KLOdZE1lHAgxYAv9XCZS/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q0C8bPIK2fM6HSDai9i/pc1QDd6hrAOmA1JQMN5sq4c7BLBiIa8ImgwYh3SHJOvt6oIAaCvk462SOlz/LwlpSAyVP7zn5HtL4tmIBTZohftzMKwqiiKVsKACzZXnyTdPZHYHC/XLWCG0jGf5GNwn70BDJYx/H6JGyWgJKrn7b1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npUySx/w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npUySx/w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA929C116C6;
	Mon,  9 Feb 2026 17:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770656871;
	bh=kHDFXBPTZa1m16uCPgZj/KLOdZE1lHAgxYAv9XCZS/U=;
	h=Date:From:To:Cc:Subject:From;
	b=npUySx/wb9IYsCaSUQG0/7U1QFQCheV1Z+ukGA4JqG6XyAajpBiOCxPp8arkpsNGm
	 AuOemK5ccYreGwzLDXGbCgL2j+b28P1kUBJOfRTy+tbnrOCqWObzBI/zE8aZPyFhoL
	 HBrI0+yuViaAKmRxmT0uL36V63ab1m1SPUrwKGt8LiPVko8Q7K+zR9ks1BUWYwMZwS
	 vRT07aaEMiTWhyjfUQKzSppHl85pS96VhXGl7aLsWLAMcrpkLnF+WXB26t3Bvdfuwt
	 nbkGhfy4OPpweEZslonuo7nca72QS4LrLG/2k+MPl2+EY7MBcSpxEWgTM/C55+0mPE
	 KfcBulDlQiD4g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 031871AC57F2; Mon, 09 Feb 2026 17:07:47 +0000 (GMT)
Date: Mon, 9 Feb 2026 17:07:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v6.19
Message-ID: <aYoUY5aHFoON7TZE@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aLn/LQeCRtJF603T"
Content-Disposition: inline
X-Cookie: Think big.  Pollute the Mississippi.


--aLn/LQeCRtJF603T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Trees being held at old versions:

fbdev		next-20260205 (New today)
mmc		next-20260204 (Simple misunderstanding of CONFIG_x vs
			       IS_ENABLED(x) breaking allmodconfig, fix
			       available)
vfs-brauner	next-20260126 (Al found the problem I think, looks like what's
			       in -next is what's intended to be sent anyway)

There are missing committer signoffs in these trees:

	device-mapper
	risc-v

Merge summary:

 Non-merge commits (relative to Linus' tree): 11263
 10808 files changed, 621615 insertions(+), 234618 deletions(-)

Thanks,
Mark

--aLn/LQeCRtJF603T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmKFGMACgkQJNaLcl1U
h9AgMwf+OMQ+GTHJvzIDyVd1whvXgB3qKazlA88poIz6s50Dpl4PdN+ooLmbHSiK
JeDulXaOXFRLeaedFo9h2mmgvZa0HZ0FM3/YW4TNTN5bOiQvpoiufjZ0u8vnQBnI
0CBPfFI0QW2oGMuYj+RkOw3hxFtHDmY7uH64qN2Y1H1qzcgz/Cp8vfXvr26L++8I
Z4xmY25YxYVA/vNummU9PIbm9Gfoo2qZGKexmsRB1JyytfV9Rxaq4nkL0w8eORs9
OZHFdYe+R5evfehdx6krcmtd8Nrthw15JMStAsPfH2drOVkiIRJhzP5+VdutQKaI
qyF6yYfah7Xr3flSAKAjoJJGymYMQw==
=Ia6/
-----END PGP SIGNATURE-----

--aLn/LQeCRtJF603T--
