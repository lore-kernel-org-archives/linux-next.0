Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852C73FDBFC;
	Fri, 22 May 2026 10:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445443; cv=none; b=mU21kklbrNooy2zJr8iEHPMD2jAqr0GSQSyJPuk70F+4/yFlvUKQLR+ozkztHq25E7x0l1BS3HZOW6eZvNAJ0SxgljW3oGhhOGFIw0rvdPuEwZsA9f115vb+bG8t+MWygun7Pc4Qo47fsYt6FqoJi0PAwgW09l+Aq3+rl5A3I9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445443; c=relaxed/simple;
	bh=VJnH4I4xviVAkuxcTywvkZwUzcjwTxXNJwWGWIRe9iU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kcw2r6Csg0nk4UdHfG4C8iup0NOrF4a70OG7h1gngbU91/uhgTB7+7lKyyu5ttfzcGEVsh4/gNKWZ3lST/uNdc7VghF7RcHTwA/UOziWehoqM2jMICA5rO7CiKm9/MMQaa9EQEoTyYEq504AQjjUyZOagMD49domrp/pACCWx5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpNr7B2s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpNr7B2s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48FB1F000E9;
	Fri, 22 May 2026 10:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445442;
	bh=ybsaxmWJtTV4/YXm3LwoV1Tg89WgikAThpDgG6pTB7g=;
	h=Date:From:To:Cc:Subject;
	b=dpNr7B2st6q8FMoQAWFe1y5F715pQLC2oeHfSTKrVgP47UkNKZNGhm4FpsfnY9Rw3
	 gHM4TT91k/NGchA8mVAWsyeezEFnACD99Mkep5XR+Op6iuphqVbEal2Mcbivk1bwCn
	 NtQUmxgqSRlBta5Rbn4sIXw8dkQb1I/fcfN5zAKWdSdU6Z+l17JHkGpoIYykEs7c6t
	 GSfIyzNwuDzVIpZWdptER4iVBX2BPO97lWrY4p6zoeeX4st8pUJKjl7CL4h0dqv8kg
	 /AaZN6oV7Qf9fMaBjLKP7tXuGVvMATuifi4OzHlPDZ2wQX4kgIoVQPjjbUVoLG49S3
	 zZvwJXXBxhsZg==
Date: Fri, 22 May 2026 11:23:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the nfsd tree
Message-ID: <ahAuv5KUwsmbNNsg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mbfqaN6YLhiOHukC"
Content-Disposition: inline


--mbfqaN6YLhiOHukC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  71556f3d55ee3 ("signal: clear JOBCTL_PENDING_MASK for caller in zap_other_threads()")

is missing a Signed-off-by from its author

--mbfqaN6YLhiOHukC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQLr4ACgkQJNaLcl1U
h9APQwf/fz+1CTfUm4wMLQvmudYDFJdAQBzkBdWhm1JPdZm/v02+nrX4E7xMS3qc
cEjH3t8no2W7yEZQyYBL7bAewGOWNTF7B2+tGHVru0mx0dmQwiEN89/dijiexly8
uKCcus6ggnkdEt7xFd3zQV5dzdAT14ekG9i90+5sqqV53xN7u695luJx/bCZEs0P
+wM2jt+k0zGcHN+IAkZrEApcyREc72foU0YgUjMXYWAvg1afHfmqeaVncZnoHIGc
6fR4HqZ/sW/q8fCoLYosEiY6nw5YoOqVaMtdpVFKepZFdLkryENz7+73PSEexcDm
KsGmcjE7un2iBMhJ27i0gItWh9X9vw==
=zkTD
-----END PGP SIGNATURE-----

--mbfqaN6YLhiOHukC--
