Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E2E3CA497;
	Sun, 26 Jul 2026 16:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785083222; cv=none; b=KH4TnxFtylH/DyNDY8cZ+7U52NTDvNjSrVrlfqLgd+n9YLz3iAsRIucQh1q3TbSxNzAwWM/YJFbvIpLc/zE0zQf9I9Za84DF2ZQLDKRXKnye+ch9dGNZsNn+rUUO/lvBOh5UJo1sXXjjxnKt08rA8nmsrzqcsU4Q65dPx/aaVAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785083222; c=relaxed/simple;
	bh=ZmqiSjkCaPYw28ypBJfuyvMwp6iQ72jqlpFGuQtgWoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jMWS6ANz/uvzzvQBgE3qx7QaakcrinmpJ3qbdQtMdECoAt7aGGZAe55GSedYzKsvQRBjbmMHt27cPznMhIyfEII+uJywH0JT4Dlxe76FoO99en8rtFHBjhh/OXLOZJ4mV6i+ZtP7H/9TZQ9va+uKS5lvWZso8zZCc5o+2tor4S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LruZMamb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LruZMamb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93271F000E9;
	Sun, 26 Jul 2026 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785083221;
	bh=QCfV8hAEvZFG+uf36wMOLKk1hHIE4UitFmJSJF03hOg=;
	h=Date:From:To:Cc:Subject;
	b=LruZMambyhGOjNuH7vk85WTqSfi55paxnTDsaC0UTEMPulOri2cxXBrZv7FZ4NXq5
	 yhy4MHVmYPTRXTTyfmfByQfr8MoD4N0sqKf2Cw03EFn2REijwukOulqGOHJpnjG7Df
	 fATWueCV6T3qg6O+bb6x/XdBm9YNBYz8C+46XirIHOuKrad6/Pqe7BEIibV5Y7LscF
	 BGLJZNdWtV8yNjfadSlVa7RNw6INNFZ50XqVR2TQl+QMk2W4f01TDFfW425VUt8Ttq
	 FNL6SDyCfZsdODxHpeHR4NXidWvSHcvtQDLMFd8CPZo1MY9Nqv/2HBKaJ68AMkxYxw
	 ennvwFekrbkRA==
Date: Sun, 26 Jul 2026 17:26:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the trace-fixes tree
Message-ID: <amY1UTfM4PdIx2wK@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0PDhN74yRucoNoWp"
Content-Disposition: inline


--0PDhN74yRucoNoWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  c1d87e724ae55 ("tracing: Fix resource leak on mmiotrace trace_pipe close")

Fixes tag

  Fixes: c521efd1700a8 ("tracing: Add pipe_close interface)

has these problem(s):

  - Subject has leading but no trailing quotes

--0PDhN74yRucoNoWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmNVAACgkQJNaLcl1U
h9A/GAf/Z9edm1k7d1uY1ucxn4ro3b0Bz4XLwelElCh7KbVv8L6SSsUjcZgCtJ+U
rk1ztIDatpSPLyKWnvLDPAXFpvZ85S/oCltij4W+8m8euc3qsHA0KVqy/292xKit
cCrFf22PUK2Z3Mq1kAEwwdHrjC3ngXFr0vAUtKAP0QLrYJe0x52tW0rJ33mH8MEJ
7g2+7/Vh1rP5MxS7ZkWtmYA8zWwjUvQsq4ejshH6ILF6MZPwswCzhpT851LF7DMq
4myyETMXATpHrKfW+p1+/DYGTApJIRX5D1KbHA8G8Yrh3q7UW54aqooEGb0F51v5
r+o4e6VmUGlJmY9JvjoePuWFE0H2Wg==
=x5+N
-----END PGP SIGNATURE-----

--0PDhN74yRucoNoWp--
