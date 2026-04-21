Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95022BB17;
	Tue, 21 Apr 2026 23:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776814539; cv=none; b=JwnC0yXvaomwf9GReN4g74bWfwbRKAx+0yBhsBOVKVTRIPaYVngjbLnGyevF7cX5Kxt969J8V9Mt5y5KWsnXte1NJowyClZDQePGKY1h5+UKW2UY4CeO7k7xpRXh+vHWfePLmNHJuFH/nPUQUr/XgIvvboRwMirDjMr47TGM1yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776814539; c=relaxed/simple;
	bh=XEbw3+89UQM8yVVOwzsUOp7dDqDR0zm+uxZEMlVA850=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cugG8+xrav8Mncoc53FQ14wBt20qBbbey/h4C8rPICAgDEZ7vHnoN04OYWXroMl8gEQq7wkwghkz9Hk7rgxWsjzHWQp1ESE++hA2dT3UkF3NtB70rGC7P9cPZW1VOSghCfhy2beDFExEALsEw/Jw4saqVmriIxA8xLqNCi8G2/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mYqfEBaY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mYqfEBaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1776814533;
	bh=XEbw3+89UQM8yVVOwzsUOp7dDqDR0zm+uxZEMlVA850=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mYqfEBaY8kFPX1PPilsmaH7o1JLaJwl0TkOxZo37oxbm6Oa2cckdbbMjb/Wbol7ic
	 opzVWYpl7veWROdXopUur+HqBYcS9O1EjlSzLg/utdz1M3h/wQBelKIU8A4bs/8795
	 VFvmFY6YAPZYcjnNNbo8ziYIJLuzmZJDFOm/QRxNNXaqhdqezZ496ODg89+YneoMKE
	 3YsAFM2WyNU7ooRH4EyTLYKoFfGm9JaFlJc1d9SAfKF86YmCZ6gu+bT2dP97v3iMwo
	 iOG/wXqJXxfv/ay5AsKON+gASfV0Fu88XLqe/xo5eAO2uBtW87a5DAaOOBN9Cy33NA
	 X5+fd0+WpHM0A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4g0dyF1QKrz4wJD;
	Wed, 22 Apr 2026 09:35:33 +1000 (AEST)
Date: Wed, 22 Apr 2026 09:35:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>
Subject: Re: next sync updates
Message-ID: <20260422093528.42562dac@canb.auug.org.au>
In-Reply-To: <aee_mCW8p2J6IbIO@kernel.org>
References: <aee_mCW8p2J6IbIO@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y1voxQQ+DxhfgMF7sTL6lke";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Y1voxQQ+DxhfgMF7sTL6lke
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

On Tue, 21 Apr 2026 21:19:14 +0300 Jarkko Sakkinen <jarkko@kernel.org> wrot=
e:
>
> In order to address in long-term the issues reported by Linus [1], in
> addition to improving my workflows, I've create two branches:
>=20
> 1. https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git=
/log/?h=3Dfor-next-tpm
> 2. https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git=
/log/?h=3Dfor-next-keys
>=20
> These will replace the currently mirrored branch:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/lo=
g/?h=3Dnext
>=20
> So my request is to:
>=20
> 1. Include the two new branches.
> 2. Remove the old branch.
>=20
> [1] https://lore.kernel.org/linux-integrity/aeVSbVIFaCDRXf7C@kernel.org/
>=20
> BR, Jarkko

Linus-next is now being taken care of by Mark Brown (cc'd).
--=20
Cheers,
Stephen Rothwell

--Sig_/Y1voxQQ+DxhfgMF7sTL6lke
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmnoCcAACgkQAVBC80lX
0GxVAQf/WGnb3+4kyiIGb4eVY1T7EmfaYzUf0P7klB1OYQvKNVAP2XWKmmpxAcDB
rLBSHKWHcPNhvpWbDahBsxrKEm0/9rteaP/j1wYHv4KUr1eTm1A30hSxn3AbDzvk
WrVHgwBe6rmEtnRwEsawkIyoIBDmAM+/+8a80D3fVQjVA5dvifPlvSxb32KdPAS7
W8pXaSUxZqoTJqfO5olV45U8k5rUFwWeHfEa8oddQ1xiXYydMTh3K+kiSBk9/OMf
F4qUouXLzK3iYG+gX0DYigqykGf+ZJYDjfJU8fOQVrETuB/ZP+ZszsV7+cMCoA67
hSeTHM4013/N4zpqEzq6wK4fSvN8Gg==
=TF+7
-----END PGP SIGNATURE-----

--Sig_/Y1voxQQ+DxhfgMF7sTL6lke--
