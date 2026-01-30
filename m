Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703AF274643;
	Fri, 30 Jan 2026 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775901; cv=none; b=T/7ReLXToMwVOlIw7JmEm4kfN6lljTOIh+3+PHvPwqtVPeQTK80WxoHyjpsjjUhj0Q9Gj50f5mW9IZISBsktCt/D8Fp7cV678oKqy7UERsdStJe9JhhzhyXf1pBJS3dkfBviMqFidd2+y7oOq8xNsw+3jY5XUtswlmTD28YXrl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775901; c=relaxed/simple;
	bh=g75Znyfo80zvr+2S7cUIcFyWaEArW+u9PqGVL0jnNBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKTBfdnt1CA0mwFSyx85Xu+Wh5X0rVnwMH0hgcr8NLK1uXs2hCf/OOO8QBmKGgHQP6LxkzZXfEGLB8oJQju/RtFcSWalfPoWfLxCCc+eUyNSkdEZtWp2qDUeJMLFZO8bzs0yTAMtsAuRNdSKTYhbs0HV6HkEYgSZptlGcLqLM5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tsdLO6xG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsdLO6xG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FE9C4CEF7;
	Fri, 30 Jan 2026 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769775901;
	bh=g75Znyfo80zvr+2S7cUIcFyWaEArW+u9PqGVL0jnNBY=;
	h=Date:From:To:Cc:Subject:From;
	b=tsdLO6xG1u+EfdVwcQgAKdoUCVNsDFiS5gmyVZ8ksRt9QdkX7N7MtdkvgLs2tPDeS
	 Ax0c/dvnlSIEtjdpfkfqd9CmUF7P4f84uQQTnQAgv+rYUZq/2RKgK83SF0X6rhTcHc
	 WrRBKEc9CyRW8st45G0lCK92YrNhv05larBj1L47g2FYZNX+gQ7NZjAXrkjaLuGAqN
	 4Qcmlm+3g1TLETgFplkKNqneE3/H4zt+vaO/6f4AMVf4YclOeQJfiEqCYFH37mHJjj
	 gc28E3hRrmvYr/r9lvUnUGFnBGzU++sJfQ1HlBeLyvtc3ivzYczkVVdpde8g0PeUTc
	 b3vKvzt/tq/XQ==
Date: Fri, 30 Jan 2026 12:24:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the tip tree
Message-ID: <aXyjGa_Oz5OzdbxD@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gA/+lgEoyRZrbD+e"
Content-Disposition: inline


--gA/+lgEoyRZrbD+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  8f9e1849402b3 ("tick/nohz: Optimize check_tick_dependency() with early return")

is missing a Signed-off-by from its author

--gA/+lgEoyRZrbD+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml8oxgACgkQJNaLcl1U
h9DrUAf/ZPR6yvUX1MTqO/od6sDFc38vABIzWnb1B/LofRD13HCzXd4pEf2tUsi6
ubK87V6E+4Lgq5Pj6pqTxoS+H7vhqh5LtF2eRCgWXyk5B1WXWTnHCVQ1JSZNg1tx
MWkdVln1QltH+PL8hPcyqFXq9oLLs5oFg4uUbgaHDvSXOvy7NjRcdgihFGNK/xOS
odwgPrRLEtACxt0XeoIUXXnc/Dc+h6OsHkem6yRQS+L+y7UP47pFmraSg56vrQ6O
Aj1S39VOuBQHKAa4/x8R017bTWCoC7CUY6WLmsUdbNc6AEizIkdyi+3QFEHDTIrT
6A7c8f7wRm6RJtGmm0WXyACTj1d17w==
=lOPl
-----END PGP SIGNATURE-----

--gA/+lgEoyRZrbD+e--
