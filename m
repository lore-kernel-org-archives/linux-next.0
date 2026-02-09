Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBFA37FF77;
	Mon,  9 Feb 2026 16:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770655368; cv=none; b=ZzoCAfjz1Zv0hs806Ee6I4C9vTZeIrNaPmhtvJgqnCg2beR0VVeL6FOKxWraJwPybUb9dp285nqC1dnCupyG0gNs0C/+M4vVw1UmZSAfNOrzdKDeA2wyNYSsynThZr3f9zb7jB+cYXQeH5dKBuH8M0X90IjiWO5ms9opflXmk5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770655368; c=relaxed/simple;
	bh=+d63SMCZnnd2IXt9GNq7DrLv6zH70bLxS33T95LYYyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJKecm9Zpv2mANOI6W57XTnIWTYCXE6tqsIUQLgneT2ML5+YMaaiiJB+pb5QoyvaWlopZ5fCh99nBYIuAPnn9X+YYhr16u5Ih7+1FjjOcFC66UH0NaJqCKmUnb0R1YKW9sDvyrzkiI9ek+S4Kuj+zpK89Mg0WcT+7l/05xk04GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MRrS0VOe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MRrS0VOe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E607C116C6;
	Mon,  9 Feb 2026 16:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770655368;
	bh=+d63SMCZnnd2IXt9GNq7DrLv6zH70bLxS33T95LYYyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MRrS0VOeI2P5ihdrWUD/sTBheGMwCLlxl4jK/tq/Jge1ZPOyFi60on7xVjvH9+IkL
	 IzyVQ9/I3J9z1RaN2uE6VC0n4b7BBNaEYjq9nIdcnZPxCl1r8gNHXKQcKzjtvy17S/
	 0XcpRHb7xWQ0MPKUurlFnR9HScvFhQ5kpWiAxFOgDQyE0THOjgzlLK/Tt1Be+ELX6W
	 I6JKQxGzi6tIXmLfWuT6PnA3iVU2xaBkIQOEj17Vro0t9U6KgxYCC4br4Ev5l8u/M+
	 jX/4xuZvvQ+GQQ/BFs2LRBYCz8OgVxKdPekGTBOt1aGjw1YGVU7YDOo1FeFJHpGFMo
	 DbdVqEOwIO81Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B6F0D1AC57F2; Mon, 09 Feb 2026 16:42:45 +0000 (GMT)
Date: Mon, 9 Feb 2026 16:42:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the risc-v tree
Message-ID: <aYoOhed05xn5jCn0@sirena.co.uk>
References: <aXtDEPQY8E9Fmsov@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f1i6gMOy6G/Rydy1"
Content-Disposition: inline
In-Reply-To: <aXtDEPQY8E9Fmsov@sirena.org.uk>
X-Cookie: Don't feed the bats tonight.


--f1i6gMOy6G/Rydy1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 11:22:56AM +0000, Mark Brown wrote:
> Commit
>=20
>   49d90f9626934 ("riscv: ptrace: return ENODATA for inactive vector exten=
sion")
>=20
> is missing a Signed-off-by from its committer

This issue is still present in today's -next.

--f1i6gMOy6G/Rydy1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmKDoQACgkQJNaLcl1U
h9D5Vwf9EMCzCRX5ekoDIbBlyzubqj+QnuQDnst01ShKAGNyKsF9SqOL/DxDw3HM
/ULMZZ9d5yZVkqi0TZElImRGMUbsueg7ZfRVmK5iOJUuw5dvl/RrzLLCios8wcmB
DHrsi4NKD0rbMT+6AHUxk7Hxief9svaS/0OljZSKMWbMby/X4B/ld/gH17JxvGB3
lwE/YoBuZgyu20M2IgMoj9hs7mtdVy3pUVXILdqPq1BSzpKBX7RCLsc3RoM6neVS
nCNFdlCmy6tcJ3gghXCgTzBjAo++gEkCYimbBMY82P4oM4z9EptsF+Cx1atihWTr
Y+kcoKjWJL3ZY+6XXz0So0rrshoiYw==
=TXhC
-----END PGP SIGNATURE-----

--f1i6gMOy6G/Rydy1--
