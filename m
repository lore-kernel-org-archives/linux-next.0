Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC693D5251;
	Wed, 25 Mar 2026 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441204; cv=none; b=DJOve1Ha5bJwOeXZeXjuXYeM+CBYgo/3sv8XrG+xTLNQWS6eRNZTQlDaIuuLZEhAuO19ENdDFv7rmorBOQgaC8exl+/DWDU0futyVtUYTMBtL69mdVK64ivmZbDOSKHbHUc4uzUDYfNXGppSdmpmY3FcP738tjWhEX03TVg6UgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441204; c=relaxed/simple;
	bh=2ovJ7/07U4NWiDPtR+cgfQqd7g4Nr29tq0OUiZ+vwg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E1Alqf0xL22JFnAxXz1R3tp1Z/8Zr8OHQFLlaod+2nzEwSe0CPkRLSI8l8GSG1xKKT+KvGsMlxUUVNPpDvqXSFKAubO1hfnG5T76eaL4SrVDTTx5x7ouUj/MaFBe7r67OUCnv9JbtW6gObDdjkj4lJ2btlbzeu4TcD7eagc1zPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wj6FcacB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wj6FcacB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3095C4CEF7;
	Wed, 25 Mar 2026 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774441203;
	bh=2ovJ7/07U4NWiDPtR+cgfQqd7g4Nr29tq0OUiZ+vwg8=;
	h=Date:From:To:Cc:Subject:From;
	b=Wj6FcacBKPnGwPy1VTpSsYgQ38Wsx3ohhzDagr1nce2Hn3Yx3qUipCbx7Mx8IH70s
	 F59YcAvf1BE5wxGgZgiRFwckdWbxvFBXiJpmh+AwzULlevCNGtYvsvpE66Bu++vwpQ
	 rRy6wI1w2TzLT0RP644dpzUqCAllXSCAUAsfQ4c7p7+zhwrHVnV4dxJSuPVKYqW8Y2
	 U/miogLYXmjlzkh7mIiAjNh5Nn2eo6eEnQNufwc8tm7obMe2jj1l8N8T95Y1Y+mXLz
	 IMhqz5ooHmtvisqUk7hJqcLb+OoQYO0rR86w90fte7Zq1+7sNXuqm+keLECVa9rpbL
	 waysMQgoyslJQ==
Date: Wed, 25 Mar 2026 12:20:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the vfs-brauner tree
Message-ID: <acPS8Mh_ka94moxe@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sI4n6oELkAQdjSYZ"
Content-Disposition: inline


--sI4n6oELkAQdjSYZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  418d1c0cdd872 ("selftests/statmount: remove duplicate wait_for_pid()")

Fixes tag

  Fixes: 32f54f2bbccf (your "add tests for empty mount namespaces")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--sI4n6oELkAQdjSYZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnD0u8ACgkQJNaLcl1U
h9DZ+Qf9HzPk4jz38vq+vdtS1fJZzm1ZyQCweWqFqLtsUjEKZpBqdvbYrSgcddNx
GHCv9QQxsI/0odo5oLBgz2QYAKR/8vU8dqGZIIfwoub+P9fAQ/QyDg1Aqdoz3IlP
fS2vZUSRcWeiyZKDT1plJHaJ9Kmjfi1x1yBjKuPAE4nH/QUfXWQyAltcZVk50p7I
GxPGMwuhJvArB6ssPuZiW7LBNivWgIEvs/Tsq1dxf7FffJ+xDiyqAYotsW/XW8ox
QsO0gFJssBge6+awk/Aoi6MzArqQjBQjqn6vJwBws92Nu6O1N04VShAwkWQZSA8e
NgSqKDQbLgSExkHBSp02dzhLgJJ5wA==
=MESO
-----END PGP SIGNATURE-----

--sI4n6oELkAQdjSYZ--
