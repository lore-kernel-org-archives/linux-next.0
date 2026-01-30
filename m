Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A14B36B078;
	Fri, 30 Jan 2026 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775892; cv=none; b=fTmVKv6XVsD1MrYhGZP71w6uDhT1HBRW9BikwLR2GitrC+TFlpY4hxxMR5zMzqwSx6Ewx4Sw+IyEsGBXTnloc+WnGQcuX6NyHsb7ahUKgy7kQlQP5WygbP7cPy/xHtj2i8QRNa0J7vb9vgW1Pf4NgYBBOckacLaGG+OLKUOwx+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775892; c=relaxed/simple;
	bh=RpbMS8iDjPGoIU+PAEifH4XY+b4fB4twWBL2MpSdjQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L1zYlrUVTYTNOrjHi2Td1i/VZ0fV6aGEOH5bQwgMmGwdH+qhR0lx7ABtGctadKO/jQGGS9V7uLiuHujX7jq60gIUy6aZxKb4mlYCziof7Lm90dyZ7HHLXmo1QfbStVjNOggmBiHmEtvrheeldnpGqBZi3319ygrpnThn4qvErcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OonOuhrq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OonOuhrq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5E0C4CEF7;
	Fri, 30 Jan 2026 12:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769775891;
	bh=RpbMS8iDjPGoIU+PAEifH4XY+b4fB4twWBL2MpSdjQU=;
	h=Date:From:To:Cc:Subject:From;
	b=OonOuhrqEnHQRQts5pTdsGFRywfv0tn5/7ZvQCSSGuIxgjReWi00fBRz0QLTiCkEE
	 HifaQZ395cIO2eTIH6hzZv5qU0sNmjyHxi+hWHS7p7pHCrqxsJacLkV2SEHoKrEAGF
	 IeEqtw+5nzOB/rGYrd8vmYWuteQYoZfKZDuLwHP6RyNNRpTsyKZDhIKvoqSR1fHWTL
	 /siTN2cwT0dRASGyRftDGtqyxY35AHb7r0DqcHlCwgSpDzowCmcOevq5kWPh1QpjTk
	 GQzeOd5bw/WNXqFAk8q4rv/PK7EP9aWtwK2XMTT+gvyWDpkO8oazUITOEj6q8WTGre
	 OdG9ZcS3C5TxQ==
Date: Fri, 30 Jan 2026 12:24:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the pci tree
Message-ID: <aXyjEAHpQaqRcUj0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hL1NPENnPVd7l7l9"
Content-Disposition: inline


--hL1NPENnPVd7l7l9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  924385b745b5b ("PCI: Initialize RCB from pci_configure_device()")

Fixes tag

  Fixes: Commit e42010d8207f ("PCI: Set Read Completion Boundary to 128 iff Root Port supports it (_HPX)")

has these problem(s):

  - leading word 'Commit' unexpected

--hL1NPENnPVd7l7l9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml8ow8ACgkQJNaLcl1U
h9Al5wf/TVBF8wCQPmbWfs9bghdRmptjWCx493NzEtELD9AS1BSZExf6AAkQaRiZ
EOd2mSyqg04rC7jzrSwqddoQMHmte/+gSHZlRodQj1Zqard99LE3objjkrkpTAdM
MN3FQf4GeilUjDsWzSM+5Qf/1YWjtS2oQZQ+29a3qpQ4OKWR94GNfXObTq5XpbMC
2lhMLQqUqqT8kCdwsNJccdrXtu+/Txfv5TyAOPIrmTr+ISrpltMnsD2YCNIIIWRH
j/58iVJ4Ez4coeU7c83MG5SPtzJjUuHPJoMC0Qv5tFqaJ8C1XcZd47qe8gnKCfpY
sCsNQN+fZiushbUQkf4ahwNT1fKcQw==
=X1NT
-----END PGP SIGNATURE-----

--hL1NPENnPVd7l7l9--
