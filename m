Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442424;
	b=3uifMabw/D8Ya/N31Rz1odit8loEFuT5cyAuGKNf4iJTbWExVIikn1LICFJxJ9kAi3mZ
	 OTRMvdYPhgNvOXeEyToE9A88ExLmrYBA+yMd074CJyi7YnevjUXPs184MbwYrWoi9X01f
	 cMJxxqagBhcJffCANyyI0QkJ7Tb5CtrIdraso1+0f/rm9aAmbfBPlRRKjlwxWa27HQW8e
	 tu+fau6MZfrv+Dt76IbGulJSRk+rcGo8BdTsP+CEqvyqsJiIlL/5eDoiVVMU7oCsJv0ua
	 V/aO1vu2KIJGfnGgCb39dBkoDjyXBW8nWRrOwEH3Ru45fvH2hrxeXtXYxIOKOwC372g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442424;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=egfs13YxzwvvDhACIgglBWTzRR/lLioC3rii5KVNWHE=;
	b=piTszpohuADIKh10A7q1KAbo4xXsiDkoB5fZys/Gy9Sfe6a7tuFHCE+qP76q6ZZiB+Zj
	 kIo2bMZNJREJEirr08IWyATBgqyDla7ZI6JhHbs743SmA5QR+sad/ml3xzLo9ppGUlgwG
	 YT5gpr/9cjuGWFl+l8UjE4k6OxP0u1P5JCbrH1GdeX/jEo0oU3HdYACcveNzQLuQgFs4x
	 v3gxLXhvuanRi0gtrIBcTr5jgcN3lA2EgQOjRUaxxpAX+cPiJg0HlX33wOHz4xhyHHNQi
	 nhZVPOsoysLrEWuQKigWKxFoON1zAyyuUAYBuL19roOwMhRYPBQqshfJZh9YoZn3p7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dXmrvqXE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB7C606A321;
	Mon, 23 Nov 2026 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dXmrvqXE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1BD1F000ED;
	Mon, 23 Nov 2026 14:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795442424;
	bh=egfs13YxzwvvDhACIgglBWTzRR/lLioC3rii5KVNWHE=;
	h=Date:From:To:Cc:Subject;
	b=dXmrvqXEx9jnZo7S0PGjvflRvRl4SWYGz9v3iOiainQLiKkKZSag7zeb6Y3GToMop
	 G/HPrIo/ABp/SIrt4ETIHDzH2Y6ttLH6pOyNuSddtA/5cFJ0vtzdvn+GAtOvYgJrX0
	 7kkVaBFqhO99BDb55GL009nnZE+X/vEQ7cQ3/TAv6Upp9AXirCzvHkCJIurTJQ3ma6
	 gwaAXwDOi9ZGBLIoLnoCaqIS/FKv9omO4UlEA9A2Dt7CulHIMfbHqPwcyYj/texdEP
	 T+3gsybNeR7V2inAE6f6aqMjzU8w3zRSEcFWyj6pDG3zV6PlrSW/9h+MqnhWRhdYzZ
	 C4TH0wvfKoHxQ==
Date: Mon, 23 Nov 2026 14:00:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the mtd-fixes tree
Message-ID: <awRG9EV0a4XI43IF@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T7SWWI32STWpnT3t"
Content-Disposition: inline


--T7SWWI32STWpnT3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  e21e7d66b4ef8 ("mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8")
  50ac56fbcb843 ("mtd: rawnand: samsung: fix pages_per_eraseblock calculation")
  09c1dd5c11927 ("mtd: spinand: Do not re-enable continuous reads vetoed during variant selection")

are missing a Signed-off-by from their committers

--T7SWWI32STWpnT3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsERvMACgkQJNaLcl1U
h9B6GQf/eqtXHZo8bH2+uwH6J5bh8aVNzxxgRFg8AZxRv7uGuLmUFhsR6zOT1/Di
fD0TtWtJ8Iu5QC0tNrBg+MA3andm8etj6t7ZMx3raw2PbohDjFYWFANf9ImrMDyE
47pZ6CfATyO5AMIRwlYidvJuBp39lbbm21S6dAf7E9iAc5Yj97aVE7FZwrRkamIq
5k9iSFkYJfUAOnU/1obFujdQx2R00Wf/tSGanL5g3GrUi8rRhVJYqgGdN5iYqDx4
4JQkKCOxiu6Ei/Z1llqTcTVGIyxR6PhB15mbjdJPEzIgp3KQUyNMc98R0QFd/E76
+XhUYLcsSBohV9cwbmSnevdPltZ2yg==
=wBoo
-----END PGP SIGNATURE-----

--T7SWWI32STWpnT3t--
