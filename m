Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FBE32ABCF;
	Tue, 27 Jan 2026 11:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512267; cv=none; b=Io8lmS9rLkZUxS45tTlqLN8lcENwcRm5cPzJwqHp3BigZ0YKWek3ndSUnxxN/BEZvIJmBlbi1ndSWLZyEcC1ZEg/61b08l6t37oHSRYksb2/gaGG8fjyTNwrXKCRuG0UpwS009FwXKj6LKYnkgUP7Kp4fJ1EYv8LG8O6cjpoGKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512267; c=relaxed/simple;
	bh=swRffS9japoI3vsrBT5gGZ1i4E90HLTZ/wsG8IdhsVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y39lW94LcBOqoApSLPWyn1AQXcYssso80NyaYMK1MP+/IcwiQIn+GK6wVQW7rpV0E5XlQOmmRQQkMdg2tzt/WfKPm6UFM2Kt+i2tFd7cOFCyg417M81bqSDY9TAIsdysjsqIvEzvvz5LGwIEEcBfoCK7ZNK9ppeiaLeezRe50ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gm4A1Wrp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gm4A1Wrp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E86C116C6;
	Tue, 27 Jan 2026 11:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769512267;
	bh=swRffS9japoI3vsrBT5gGZ1i4E90HLTZ/wsG8IdhsVU=;
	h=Date:From:To:Cc:Subject:From;
	b=Gm4A1WrpkwkjeA1Q9yA0RicFSxcrHXpBVy4Ix4tx3/pj7pAVXnbW0FXXns/utHbXo
	 6wEed4EyZxfsOpwCbYBjs1BxTXhLMtQxYkgP3K3GCyw1dmahsXJ7+g/tYyWbIHe3y5
	 /K8xPV6qOBU32JSNIfZXDgavFsJBDOUEbkk2EbyI6B8P4uwkPztg4DifnByR73uCgA
	 gYZNnEVJp1og+rdjkjEXHurbXcIz+GIgiRb0lc0n3Me0G/grhZyCJ4oBmSK0F0kZUh
	 /jw8Ay1yfaAMxJ8muEFHjNf5ZqRt2NG7Pb7wTFCgJPZ+pXBFjQFJXmgqwoyJIqV28h
	 GKB62VHHzymTw==
Date: Tue, 27 Jan 2026 11:11:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Fixes tag could use some work in the pci tree
Message-ID: <f09eaf3c-3df0-4cd3-9feb-b8ce9408f462@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zb3GvidlaUOVERiG"
Content-Disposition: inline
X-Cookie: I brake for chezlogs!


--zb3GvidlaUOVERiG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  a21a27a0e8933 ("PCI: Rewrite bridge window head alignment function")

Fixes tag

  Fixes: 5d0a8965aea9 ("[PATCH] 2.5.14: New PCI allocation code (alpha, arm, parisc) [2/2]")

has these problem(s):

  - Target SHA1 does not exist

--zb3GvidlaUOVERiG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml4nUYACgkQJNaLcl1U
h9AJ9wf/X9VlmqJ28ebkFa6/avZ4X6CS4WLqFDbghTTg/TRBKn4nZA4UiwTkQ3c/
pmAJJmcqnihLkoa2CLkzqaihbouWK8V+lObkhfS6uCkwpw9l2cD2G1y3tV5reE+P
UkPaQuSr4mfZidvE3ZN1ft9rkpAfwHCBxN+KtHGae/ayUoH8JiUMUq+rtmx0UMDW
DXQNNSiAnGPuzKEbcpIah5yZc90jcVRJc5mcE14xz1EesIxQN9o2bemz55w/4hih
n4/9zUp4rnMULiVw8u5zdxMiuUmHSqYH07o7TObpV1DVdpjRr+8/daz1zYXJ8SZz
/Mczb1oPDaieLvhwRuvBi0Xg5yhRww==
=eU1k
-----END PGP SIGNATURE-----

--zb3GvidlaUOVERiG--
