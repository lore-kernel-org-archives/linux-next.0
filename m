Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210EB39BFFB;
	Fri, 10 Apr 2026 11:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775822116; cv=none; b=erAmx6iq72EWeYYF+3H5mdOqgAwdmZEgrIJw0sJ+6VI9PEpG2temrl0MwkuQwIzPowxifySGLVC0WFnnRklkN6iXeeS1Z1XKsGEFQ9llqe86nUxJIT56ynnxBtaytVYJhaBkB6JVjIWzz0QCfH+mp1zjRlb2RKA/FsVRdjSk+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775822116; c=relaxed/simple;
	bh=W35erNWmmHejBu5Z670DwdBFDjnuRXNd5Z7STKnR7E4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNaByXHnbg1KRNm/o3lg3FMjLRmzerNyXH4MszPPWYQe0A9FDSnmhwMFQMFWYA3r+CIUHX/5pDKqZpZuBPXyJ4vM+wwz13N68IenOqSw476FyTG4j4+q6tM7RWBgpXvrbNZWAleVfkQjvv3AX0wRW/4f5iVLYQcW8gWJXt+aF9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1712IgO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1712IgO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3B6C19421;
	Fri, 10 Apr 2026 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775822115;
	bh=W35erNWmmHejBu5Z670DwdBFDjnuRXNd5Z7STKnR7E4=;
	h=Date:From:To:Cc:Subject:From;
	b=S1712IgOOsNjrTtVoqc7rDMiRpKhDvVWTj18yfRICwvaH7Z0Q2jHvlzZsrHzTjXtg
	 wdUYVDLo+rMG/q4d618jtgZmbgx6pZLSTM5j8KcDSedRm+VtMHjbky3btYVBJ9LcY3
	 18NQ6qvTjxHFptNyO7JlbA97YXGTpMOc9MLfKYcz8JsM/M/Roa1uC1tBKz6FJEc7yt
	 FtglRxOIFf5Z4uPfmngj7UwpraKEiYXOcSo1N4l8FJhYJKPPZ4EVsvXmIWF5W8bmQL
	 RLvDwYoRik8ry1JGfNEXdh+a6SecVUhkyZK2rWx2j56Qvc+21Jo0f2BGdfD99pkUny
	 oWE5IStweb/SQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B184B1AC58B5; Fri, 10 Apr 2026 12:55:12 +0100 (BST)
Date: Fri, 10 Apr 2026 12:55:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the sound tree
Message-ID: <adjlINACNHPtlahb@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cYOogJ86FdZU8RXk"
Content-Disposition: inline


--cYOogJ86FdZU8RXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  5a5fea9a0d663d ("ALSA: usx2y: us144mkii: fix NULL deref on missing interface 0")

Fixes tag

  Fixes: dee1bcf28a3d ("ALSA: usx2y: Add native ALSA driver for TASCAM US-144MKII")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--cYOogJ86FdZU8RXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnY5R8ACgkQJNaLcl1U
h9DZ9gf/QMj5c86CNYqynNBqzEDP8y38sJJZCqVVJ/7hUb8WuPp/zmp5rcCj4M80
O1XbB76+XK430e38kpvrlQ8Uv3PDgPyA2grMmW/RJB0YPr3RCKA0aEha5Rzb13pZ
cHzmHsCMtqdfeTu+n3QHA4L8tNvuOmt+RqQs9S1B8+CIGeUZxvzJTuTH4x44MRPq
xO78PioRudPnNnqAvoyLNngEcChGxK7ds2SeTkd0QKvVZ/MZWBUou+HAsNIWFZxB
3eGczl+i27+UonhKKWVSCdJ7rNeD8KLTG1rkNFimAWerOibERPms/55ZqWUlvvnh
joqf6bccTMmsv3iUBZ4hAqjLQ+coog==
=X6YQ
-----END PGP SIGNATURE-----

--cYOogJ86FdZU8RXk--
