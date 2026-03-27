Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555CA32E12E;
	Fri, 27 Mar 2026 17:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633738; cv=none; b=G35ciGiQr96c0xqCCb80vchdoHvjeRNgDxkETkHA0xugKY6Nbq1Kic5o7CsptGqATG9ux/r3DIr89oV+bwh/+wyWV8PInYGdPvUBDFUx+cEqU16NcXacofqQhKle/gDaDKmqXqkBG6p13JMbSFYQLUiFLc7hS/ZC5/C+SlaMgGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633738; c=relaxed/simple;
	bh=PnqQbwyKhzojgt4Cs+v5XaHfA/FZrJuj1Kuy56RIXtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPW5wgbGwly5307d395KKHs2Tymmp6YSHX/cS4CNJUUCarheRbjKzWCgUylqtildxSP0GwoF37Oh+ywkQU9DaxU9NAb7fA2UEXBAUdKWNw3SvNyvb6YRqVvCyoajDntX7xSL2116vbt5T6IYY5HLH3LjqJV4DI0e3gC2t391xHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8fXrXlb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8fXrXlb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F55C19423;
	Fri, 27 Mar 2026 17:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774633738;
	bh=PnqQbwyKhzojgt4Cs+v5XaHfA/FZrJuj1Kuy56RIXtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b8fXrXlbzHMOxClBozimqkPRIK7p79QoCxE9QavX5fg0yCndHQq3nzi9rK/QctQIP
	 uuqXRvVi71OLPUjV5bAJHEiZAp3rb8ZpoPASPIfOTytdUW3fjdNitmuXbJEW5qeZpl
	 IsK1U1UXKHHxA/uxuE+8iB0s0XEW9tEEORd47RtKmz8rObpXufMWLQGJ1IEpEGdpcX
	 GKspVSk6r0Afjzy4qTnXKUbM6dtSFmrZMBtDQHc/MhYqX464FO2YDwoqarzfpKddRI
	 ySeL7HspSK4lDJ+627jhuSjIIi0+Jt+2wJTv8IEuMsMSar5iZA35nUyBwbfDytIXf9
	 XVe88qDZm5Z3Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 506921AC5847; Fri, 27 Mar 2026 17:48:55 +0000 (GMT)
Date: Fri, 27 Mar 2026 17:48:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <acbDBxR6tgO6WzCB@sirena.co.uk>
References: <acPV19IY3Gna6Ira@sirena.org.uk>
 <20260326-gefeiert-beschaffen-edf852a3aa71@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TJ88pOiTcT7iGiT/"
Content-Disposition: inline
In-Reply-To: <20260326-gefeiert-beschaffen-edf852a3aa71@brauner>
X-Cookie: Identify your visitor.


--TJ88pOiTcT7iGiT/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 26, 2026 at 02:36:50PM +0100, Christian Brauner wrote:
> On Wed, Mar 25, 2026 at 12:32:23PM +0000, Mark Brown wrote:

> > In file included from listns_efault_test.c:23:
> > ../pidfd/pidfd.h:229:19: error: static declaration of 'wait_for_pid' follows non-static declaration
> >   229 | static inline int wait_for_pid(pid_t pid)
> >       |                   ^~~~~~~~~~~~

> > I am continuing to use the tree from next-20260312.

> This should be fixed now. Sorry.

I'm still seeing this today.  I have:

84f524dca4b8bc9e9aca8ea1dbbd2aa3a239d998 Merge branch 'namespaces-7.1.misc' into vfs.all

as the vfs-brauner tree, I'm not seeing any new patches to the test case
there.

--TJ88pOiTcT7iGiT/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnGwwYACgkQJNaLcl1U
h9Bc1wf/fMhJ/hsICjB2Pxn+OHqASJD3mywU5h/DNj/+WS+5OWf3oKcRuYHhjdO1
vaton5JEO4GdCYsC4n7pK1tQe2qXEBlY3pTFHYkAeWct8BNi8jT65ydQpMmrP2+E
wvC0kSnimORwZrYtwe91jNiMruoBdrsfV9NFDQ1CxTDjlmw9WbiROKrGzP+IZXf5
IyfqCU84JKWXFlc6EuwcjeMJxZYsVaj/VWemBo8QlaVCl+a8W0RI897jHL0fQGHP
akbcJuvGKzGI/Du0kHxF3jLeZie+P3C3s0zL4iBwWD2JhHshPV7/amnFiQD4gfqU
ITYEKC7QKiH8MiLT6rXSwPd7TUzIBQ==
=Ckpn
-----END PGP SIGNATURE-----

--TJ88pOiTcT7iGiT/--
