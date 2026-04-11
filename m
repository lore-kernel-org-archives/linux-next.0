Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF322FE05C
	for <linux-next@vger.kernel.org>; Sat, 11 Apr 2026 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775902970; cv=none; b=CjPPcsiNq8uyP3MPb885qoe71Gk2XfLQ+WOmcH6ebJrbBQ0swFZ7kkyKxuklyadWkEGzbiXVAkimL5W4NWRsg3xVueytQz8Fucu8fY6x9K0wrlUzwnXnUyBNIv8ZQCHpFZC0CHR8MxPpBQQyBKbkXhE+g+m2RWcsj8AxpgSCijY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775902970; c=relaxed/simple;
	bh=iD3hDAw9eMzBWcJH6RRw311g8o/SYKByF+pTTAx9ZTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTu5ITOmdJqmrIaw1+F7N51REJoz5zw2bw78SxS/8o8AhvWN0fyhaiRzcbGI3aIcZ/B9r1tuNc7ZEfYEEZ8DPrMnv8OMPbMtcV/wOFrGazvh09Qsz+KSIyeeykbTa5n0uNDkyazVww1alN714LtEYR+9M9u5Q0tLwSKwKeECrR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gtx/BS4R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gtx/BS4R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1091C4CEF7;
	Sat, 11 Apr 2026 10:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775902970;
	bh=iD3hDAw9eMzBWcJH6RRw311g8o/SYKByF+pTTAx9ZTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gtx/BS4RkmfvhMvWCa2xqidaWbYoPrbv/RCcHPJxGdRsKWTxf/AnQmcF2wNfLc2H1
	 8enDPyewVNbbtirMj45PJq2aZZrc4nYC81E000GhGFjOmtm9+tMwQGggETz52L+vkO
	 +kAtvrFZjYMbgO1KoZX2jeVRevKcV2i9dHuxztbANnXhcbghxaTOU5Z1tSOYYfWXck
	 V3aKudFqb72Jgcc8XK4YHatBY3Ri6mTm4oJaEW6rRErR772VCGprGtsrLJh3rYbuqm
	 yt5aSapQU3iFCyfIV4kM53gXYdDERP6qcjhRq9ltSZSoI3KIlZmuVoCKIjGNi1qWzY
	 IMrkckvQlo00Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 826A91AC58BA; Sat, 11 Apr 2026 11:22:47 +0100 (BST)
Date: Sat, 11 Apr 2026 11:22:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: linux-next: Tree for Apr 10
Message-ID: <adog99ZrlIi-cWnF@sirena.co.uk>
References: <adkN9ZX6xjhARbbh@sirena.co.uk>
 <e1a1c2bb-cb1d-4647-8639-8ee86b218509@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IAy2j/G3wlRT/FHf"
Content-Disposition: inline
In-Reply-To: <e1a1c2bb-cb1d-4647-8639-8ee86b218509@infradead.org>
X-Cookie: You will be divorced within a year.


--IAy2j/G3wlRT/FHf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 10, 2026 at 04:32:07PM -0700, Randy Dunlap wrote:

> I don't see today's linux-next patch(es) at
> kernel.org/pub/linux/kernel/next/.

> Are they delayed or something else?

I have no idea, the script ran.

--IAy2j/G3wlRT/FHf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnaIPMACgkQJNaLcl1U
h9BCCAf+OgnkGmzo303gMiMUWEIAQcAQ8EbSD/YhcGhDr598WrYjjrpEIYVODswu
UE4Et4yrxEOUlVd5guydzbv/whtwoQw9DG/H9dYoIFRQVgwyCUj6E2FvxlvIhfI/
zbPLmnzkonV32P6/P2ExYHmUEYKK8ss/RYgeQqVONHJrYmgEeXFqcRXMNFhZ0YMT
ZQWz9BVr3cIYF1TsCjTF84yjcXnqZXMFZCvNfj2C0P17SIY+bKsUkr0+SC123vr9
B+PA+ZAHbPWw1k7fepsdsNGBwad6kHxVssZqivXnt6i4DTdppuwCCZA8cArQvqzo
LfVlP0jRfjt2kMKxM9zvKSHPONBiwA==
=Cgx7
-----END PGP SIGNATURE-----

--IAy2j/G3wlRT/FHf--
