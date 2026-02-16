Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F74E286417;
	Mon, 16 Feb 2026 21:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771278173; cv=none; b=PRtg/9Vuqsc5seRjQaEdeMoL7YZjHsTXLcueOxmIG1gIVZREqrY5DlhF7HVZzZX6NlGJ3M13z2qrrt2KOKaqMnCGYYlsLK0+V6WdxHZupu0pDPmQoBxXG2KCpu+NTR1iEqFAgi+5EoA/eKRwgA1oPX3NpK/6QC4iXBNJBJLANsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771278173; c=relaxed/simple;
	bh=O/1aBT5JF7oo7Kr2DxAHEtuSwaph6VUUYQ82DCmKdWo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DurcelmCwgtyVAEI7KkNEpGl+3Q4Q0WNmrxaCG8ArP1dYiJE98wR7wDYgSzrLzdCTo3+8LCtKmQ36OHVmdTlaVerahxjaSLDbJUfF7F1PmsvFij9i2IFoiLYDiCO6g9CCQhOOGyImTqZYTX1iqdL2G6Uh4KEdWfbvJmBGtyIohg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kikz3Dq5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kikz3Dq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1771278166;
	bh=6RWPOItAVm0MUo5O57Xowg27Ao8PMDwOcIO9CiSeSZM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kikz3Dq5H/u+iNbnMPhHw0JfQnyr4zFhFfUzpjyi1DI9zSnD9bdyaNCU7jXAb7C/F
	 4rqXnvIlWpBEHOF+2mGXYbvZ/3uKqdHWjE3fAsvbktwuMkvf1TV2ojxp4SQGmRJWlJ
	 6T5otCOuRaC0r76qAUqIb5u176xu874lI7XYrZmz8YEoby/o1BpxpBkGuXq6jtOz1D
	 m3nPh0MEhv4Hr78IeTgJRQ+/N8fPfhg/1kQJCRNR8c5yA4LF0gUVqw4d+dlmDfUoZT
	 RZqvSqAXyBaZQXVmzYO1l2SG2GNXYxAfBB3x0xg3f1XXCq7InlfVhcSeYuXH7NfVVd
	 rNQOFKtiEdCIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4fFGTd0CJNz4wpM;
	Tue, 17 Feb 2026 08:42:44 +1100 (AEDT)
Date: Tue, 17 Feb 2026 08:42:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org
Subject: Re: [PATCH] CREDITS: Add -next to Stephen Rothwell's entry
Message-ID: <20260216214242.0322c5ba@canb.auug.org.au>
In-Reply-To: <20260216-credits-sfr-next-v1-1-5b6563b29234@kernel.org>
References: <20260216-credits-sfr-next-v1-1-5b6563b29234@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6u6ph1DfbvxkB9TTYBFb2cO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6u6ph1DfbvxkB9TTYBFb2cO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, 16 Feb 2026 17:28:22 +0000 Mark Brown <broonie@kernel.org> wrote:
>
> Stephen retired and stepped back from -next maintainership, update his
> entry in CREDITS to recognise his 18 years of hard work making it what
> it is today and all the impact it's had on our development process.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  CREDITS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/CREDITS b/CREDITS
> index ec8a2acf1947..324959909603 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -3489,6 +3489,7 @@ N: Stephen Rothwell
>  E: sfr@canb.auug.org.au
>  W: http://www.canb.auug.org.au/~sfr
>  P: 1024/BD8C7805 CD A4 9D 01 10 6E 7E 3B  91 88 FA D9 C8 40 AA 02

We should probably change this to

P: 4096R/5AD24211C060D1C8 D41C A3ED 5B30 275C F5A0  1B05 5AD2 4211 C060 D1C8

while we are here.

> +D: Created linux-next and maintained it 2008-2026
>  D: Boot/setup/build work for setup > 2K
>  D: Author, APM driver
>  D: Directory notification

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/6u6ph1DfbvxkB9TTYBFb2cO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmmTj1MACgkQAVBC80lX
0GwPFQf9ECwgPkN0Un8qjwTAIfi9JmGM8/H/FIRb7z7We5iTAz6DeeJI6Mgq5vNf
Bu8UuYgWPAw9hsSRNbJOOFfN9xzMv1PKRo+0qG6Zn6UZL4XrFChdrb6LAxj1y0dN
MKgGhvmFMTv8unhbdV/TAQoRdMNIy/jh5hKsElmcW/LacNxEywtaW7TbHzyHZ6Rv
aT9G94QTApeZzNNrwEDcwwkF3b5HPmc3XnKjqzgYoIMJ3o9RN+x7pMhg9jhj87sP
YPCcskMtJfH/6m6COYCkx3GqalN1C9fCmUAjii5JTLEgbatZDCrsxKaBYKDqC+Ch
xrx0L+LJc5WvLYojaqqzrXqhYHjj3w==
=sSxM
-----END PGP SIGNATURE-----

--Sig_/6u6ph1DfbvxkB9TTYBFb2cO--
