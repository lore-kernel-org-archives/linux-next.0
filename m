Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05C83F0767;
	Tue, 30 Jun 2026 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814682; cv=none; b=lc5dFNwQbrCNkwBpMEtUtdW59tx+3lvA8waXiUnff9TWtbyob/4KsQ1nZVEwI+AQ3prfEJa9nVcWgOFkzRCjJbtGRxuxeQTjhWZnoA27WHtPqezcgVPIp0iLVFN9GsHLp4dEuuQyJLMf7s6corAf25ZBZIALdzKNdQnBTu8pRvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814682; c=relaxed/simple;
	bh=zZx2ztTcJcmYOXHdPwGPVaDi2S02jWdir8aT35S7jco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uXoFO938oOcXWcAmt2mr8igTyfTHqsIw7wzGopAOqmNzV22rvd4wo0AiFvyY6/bZ0os8ScyuxDCIvyBdddKgzlTIEQ6pKXQIm9nesSL5nLBg7Sp8HNC1J7bVuVVi0GBDD2Ev8ti7OLbKQTiiyxB5waxdzSkQ5QBRIoVsNUwufm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCXycXdY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCXycXdY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEEF1F000E9;
	Tue, 30 Jun 2026 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782814675;
	bh=VV6jZRdySPbrAZGBTcQex4e+GF2oHiIF1cOIewA31To=;
	h=Date:From:To:Cc:Subject;
	b=CCXycXdYTJE71Z/GvqmeCumJ+BVW0b9DC+EyCpdBFnlkmcYAgD607YTOIoU8p2kB1
	 saa9DcfnoUJ0B2KQ6Z+xfvL6M+67fxDN3i3ebHJuMrmz6N15aaHkyf8BvjZtnmJ/7Z
	 pYXVVInx1Y4ag2wV6my9jfrv8uv+UDb2a8UtVi65AfVGcAT7BCmJRun0LvHpWgfyTw
	 X6pV3xQ9OmHAoxar7T8g3LZKjCDwtgH17Ln1kwbY3A5P0RbRyBSrxiJVUJo+3kvY/G
	 VEWBHW5kwPpCS/E9yHtqbrxuQDcl9Eestw+ZYoXbMPQluJDqKb5NC3XiqceWPqwxXz
	 uwBVQs7rCLHgA==
Date: Tue, 30 Jun 2026 11:17:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the nfsd tree
Message-ID: <akOXz9FI4le8d5FT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rchDUdHcyOi54g/I"
Content-Disposition: inline


--rchDUdHcyOi54g/I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  296c5e5960b55 ("SUNRPC: xdr_buf_trim: clamp buf->len to avoid underflow")

Fixes tag

  Fixes: 0a8e7b7d0846 ("SUNRPC: Revert 241b1f419f0e (\"SUNRPC: Remove xdr_buf_trim()\")")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--rchDUdHcyOi54g/I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpDl84ACgkQJNaLcl1U
h9Dcdwf9EJ9aUErilNogZ4oVN4M2yYg+HlfaZ1bQli4s1KToA78WMcEEeCrebuq6
KA5bpauuf6j3/pVeAYUMbVmt29KpTDMTwBrVzeJwUFmw25YwS9mH9cUpji9m5o65
Dy7ZAnHIvODhuwDZcVdyomEtvOIi9YiIdAzdjYwE2MTQLpKCUwV8SiDnIkLdcjeL
bCqxA8Pl8jtzOZj26v4JjJoS1aRxwbzEdHtCeYk8vkI0q8o9NGodtYeI04LtsONP
oSWvj/HLhUyoBkthZDvoiZ34JPm3QrTIv7PNF2G/lbfOtBMQoS2LNbDzeFtdaC5w
KE1POiWmAoEuJ28Y47EegNfJDq8uSQ==
=X+j2
-----END PGP SIGNATURE-----

--rchDUdHcyOi54g/I--
