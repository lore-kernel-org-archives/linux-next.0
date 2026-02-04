Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97E73ECBED;
	Wed,  4 Feb 2026 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206290; cv=none; b=Y69CEHP5sJh+jJUcoBkbstxSQcDtq3+KLt0R7nTrnxaawwAh5CWYyhx0gHyUEdH3w7qVBmHOi2H+k6quFv2jZidW0/IXW6L6O4pjpn5j2ZnDA406thvbSnHN3TXeirQNQpa2cLPumlp/vy1KY8PHdKncWJmzl4BWx2QZlKzB2X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206290; c=relaxed/simple;
	bh=T1dtYPXeCzBhZLXJm7dpyz3friQKPa2BUqYBMV/sDog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQhJnWsBgbsVFP1LVwVq9UE455oyXfjHraiXi5096ElPujBIxmyy/FHjpjCZAybCyG6d9cYnA6rU+FKQpLs5LdXiGOpkmX76rr/Qeg/OR4+cmT8nSwKYs8JeAFa53ULiA/+svAuM5p4I411mbaJK+MUv2oS+hCBwE4dx6QY45qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3UAdm9F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3UAdm9F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23FCC19422;
	Wed,  4 Feb 2026 11:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770206290;
	bh=T1dtYPXeCzBhZLXJm7dpyz3friQKPa2BUqYBMV/sDog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3UAdm9Fx56sA/b1sHTsrI0cpbWexGMjQoorqSBfUWojxCowXWQNGxbJhCNrhH9Yh
	 26+KxuMFtvkFW7PhPsRRn+FUahtBKyiVYVjYcSb3+nqH6DkQPoOZdLILVykPUcYTgk
	 XSlt6orXxjvprnOA7EOrNJWPyj8MPy25PRnFEm6mc7WClRk01RBuLnRpHT8pl+LRWI
	 PxHRlZbMYIbTIbjmR5dnanftTFRlePBI5Mgy7YrXbqb8d/BQrYwWm6tvePsYEl96hy
	 dpB8qBUOnhNsa82DCR9FjJaD/IJnBI0BWI1vWJtHI4GuzFcY+eHB1kew6LvMBR591+
	 losbj9NZTJ5/Q==
Date: Wed, 4 Feb 2026 11:58:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>, Aksh Garg <a-garg7@ti.com>,
	Koichiro Den <den@valinux.co.jp>
Subject: Re: Fixes tags could use some work in the pci tree
Message-ID: <3232b98d-a091-49be-ab81-28bfb41b148e@sirena.org.uk>
References: <484d687e-4ce1-442e-b8c1-9299631a7fe1@sirena.org.uk>
 <20260203231352.GA195886@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+LYST+tgv4jbHz79"
Content-Disposition: inline
In-Reply-To: <20260203231352.GA195886@bhelgaas>
X-Cookie: Are you having fun yet?


--+LYST+tgv4jbHz79
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2026 at 05:13:52PM -0600, Bjorn Helgaas wrote:
> [+cc Mani (should be cc'd for all PCI emails like this), Aksh, Koichiro]

I've added him as a contact for pci and pci-current, note that -next has
a separately maintained list of contacts for each tree so if something
changes with who should be emailed please let me know.

--+LYST+tgv4jbHz79
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDNE0ACgkQJNaLcl1U
h9CrTAf7BXTEUxvnX9ferfRi8FdOULdJ0uzl24liV0LHV/8S7H+i1IJNlyBDw4SS
AN/RIquaxt1O/p5h4NAdSHZZqKqNZFBXQqhzuj7ND2B409xZxcud6tT80/YdzOee
9Y54GnVeLw5SnXILvRb/p68jMeElwtymsi4+DkruOkP+35ZAWfsSOZwjrXocJbCM
X7fj62AnP946e0l7f5MhaZoc045m3A+U6iyN22wsbiNa7pSghUscY78A2JOX68Be
e2s9rKH4XdMXwUNOY3UUbRgCrOZtskWUJJAyHMrsgaLX9/361Q//0ljuh0OcmpP8
QYnfAtRRTLiW4yjvgb8TwcBj2gGj/A==
=9Wrt
-----END PGP SIGNATURE-----

--+LYST+tgv4jbHz79--
