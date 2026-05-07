Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B217B379989
	for <linux-next@vger.kernel.org>; Thu,  7 May 2026 07:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778140517; cv=none; b=ct3fD0UOw6aoi5H0fC5tsQkf995qTjVT0SP7RrtBXqDZXdrZpgNsZCwHxN/b5UlIaBJduZxQ8fjN/dXkV2Ld5ezV13rIEdNs8KL6U+XyzF2ofd6Qcig9+BdyhJtp4zV/liQZiKyUNk+j5d67q5SRSDDVNAfGFqx+A9HQupol0BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778140517; c=relaxed/simple;
	bh=/23ZUN2gyUbbukFsFiMv6LAojJdBCa90fUKgpgDsIVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpCigIAR1pFF+/HsnGG63bWy4ibxJ7qkRJiaM0ZVr5tSq8/jVr7SAt9mYhwRnAjJ6lcjUVK436tDtPfG5Bs2OhvEXQScHamJUQOm4705tw41yew6YgoUzKkYkQSNYoCrGwV2WouOLuvsxt+W2mxxuZ+3bbFxFApJ3fQL1Fe98kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObAmGt+8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObAmGt+8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-449de065cb3so537476f8f.2
        for <linux-next@vger.kernel.org>; Thu, 07 May 2026 00:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778140514; x=1778745314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/LKasr92R7tJXT16v7O6MVPfsO+W7AxdEZVy5FG3qlc=;
        b=ObAmGt+8uEn3jc9we4PqHuKH9F84upSqjHe3LUKIJhNXz0B/SlNui+L2e+KQ9C27bQ
         kEfaKEnoplRLf6RgYDorVZDXuGS85KFacQFXfBkMVpZFxzfErfN0y3fh1UmvQaro0Kii
         alNJoZ+sQ3EvsDx+qYg9o5rNAQtCTpNxhg7W+EdKWvZ8RDLvzKozcmNQe9hq6au7N2dj
         gpQpNIfNHQ8inIFfOH3sf5MFwnz3gq2A17Go49E4Jwzf9rftnaAtx2o+vJdpaaADjlFq
         g24dUYcfCm7DG0t+0lY5/8bRaycLAz07WLrftD2FGwBtA1HuIWEEANt7SrkG04cjCbn+
         TkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140514; x=1778745314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LKasr92R7tJXT16v7O6MVPfsO+W7AxdEZVy5FG3qlc=;
        b=drY2ZIlYPKILOlnnGNVRSggrB7e30gCZwcEcY1Dantd168g0/jZ+LZ4PiTqfmfrro6
         MmU0FI2pZczT/fFGf4Rofnx2iOn4uGa9uyNsfF4TARZ9pYWbHcp8Opwz3WaxKNplfTxM
         UGF63B/RW0rYJBqVjgZAnqTaVjG2WVrulQWb2i6ZcCsZUg//WaxVvQKwY5T6vO7TB+Li
         lTa731QznNdR6oY2DNj4lSxWVJOwvf1Sji6kqmRzotimW8wwdiadVqaWS/iO07LgleUn
         xP4zdxFx0Xnv+Vvu/rJerynhXSWrkQVqeRM0x1b1b65an9l4Ux27ptJbSiHHrINVaXCo
         IVjg==
X-Forwarded-Encrypted: i=1; AFNElJ/iRtTlNqRzyXHQEaBqVUiLSsQku1HDf4rh2UKTLsUTzBRHa0WXtLNJxgwiJuI6yJuSIsPfg/uz7wN6@vger.kernel.org
X-Gm-Message-State: AOJu0YyrqnHqekB1J7IZPJOhBcrSVz53ec3v+O6HVN4ZcflNkQdOJrbB
	19Id9B+wqhfhjI8kQFhkvjiqgqTprMQgBc26OCMpTgEzAtiTH3eSgoAb
X-Gm-Gg: AeBDietIPU6m996M79AMP5+0FIn0bQ52H6PRHDpaWpliIEQerX//ZQGcx2uMsSLl76e
	SBE/nH0hvzudtkJ4Wq5Ictke8lBEnw3RZeCmGEXiMwdcoeMbScTxDDSgJlABuk8I04XKAQ6DsgL
	v79qQy4MuIiZvaxW4jc0dxGyrqsafaWk368RlXOHqsLf9PmsFfIYeN+nd+453e0VfFq1YuYQRPw
	lZjGVWs6N9AnvrUinMzQUdXi7p0QfCITYZ9Ug3I0TggGwbxibDnJaFdQmVXOJIqN2rMd50CqSl3
	AhKGn58+VX+LKU86k/QG/h0+Pv0UCe/ljJCZpPqYzVceHz6RzRLfwIW8SzSm4xOr8hSmxLvstSL
	OUktKoNFYyjqiXcsSjHeke7DaNy7kmWpE60XrPUbK6inuvQXv7v0MgVOIuJYuetpX6riUmIhknv
	3K2YePw85Wrz04Dy8ILr+59uNDhsLzfpoX7QvyOQKacuTfLUtGkI6lXC8ViIGQq2Rb9PLpgtBA1
	F+hoC+GghlrM7vyEqbIugbB0tmykR5B5fA=
X-Received: by 2002:a5d:5d08:0:b0:441:1e8e:d8fd with SMTP id ffacd0b85a97d-4515d3dc4d5mr11263399f8f.29.1778140513662;
        Thu, 07 May 2026 00:55:13 -0700 (PDT)
Received: from orome (p200300e41f1c9800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:9800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02abbsm17413335f8f.18.2026.05.07.00.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:55:11 -0700 (PDT)
Date: Thu, 7 May 2026 09:55:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Alice Ryhl <aliceryhl@google.com>, linux-next@vger.kernel.org
Subject: Re: drm-rust: change branches merged into linux-next
Message-ID: <afxEshceOZza_ulp@orome>
References: <DI3DUMHIM5CI.2FMKD5MSWVCAU@kernel.org>
 <ae6GpnWSb4Mcel_Q@sirena.co.uk>
 <afCi7hSqv6AeGfeo@orome>
 <DIBZCHAXRBPZ.2AM1ZBR61RA9Z@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nyi6aemc7okvxr4s"
Content-Disposition: inline
In-Reply-To: <DIBZCHAXRBPZ.2AM1ZBR61RA9Z@kernel.org>


--nyi6aemc7okvxr4s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: drm-rust: change branches merged into linux-next
MIME-Version: 1.0

On Thu, May 07, 2026 at 01:24:38AM +0200, Danilo Krummrich wrote:
> On Tue Apr 28, 2026 at 2:08 PM CEST, Thierry Reding wrote:
> >> On Sun, Apr 26, 2026 at 10:52:36PM +0200, Danilo Krummrich wrote:
> >> >=20
> >> > 	drm-rust	https://gitlab.freedesktop.org/drm/rust/kernel.git#drm-rus=
t-next
> >> > 	drm-rust-fixes	https://gitlab.freedesktop.org/drm/rust/kernel.git#d=
rm-rust-fixes
> >> >=20
> >> > to
> >> >=20
> >> > 	drm-rust	https://gitlab.freedesktop.org/drm/rust/kernel.git#for-lin=
ux-next
> >> > 	drm-rust-fixes	https://gitlab.freedesktop.org/drm/rust/kernel.git#f=
or-linux-next-fixes
> >
> > Sorry, I noticed this too late. I've updated these now, so they should
> > be pulled for tomorrow's -next. I'm about to finish things up for today,
> > so it'll have the old trees still.
>=20
> Checking today's linux-next tree, it still seems to pull in the "old" bra=
nches.
> This by itself is not a problem; until -rc6 they are exactly the same.
>=20
> However, I noticed that it seems that linux-next stopped fetching new upd=
ates
> from the drm-rust remote.
>=20
> The current head of drm-rust-fixes should be at
> 0a69ac25bd596d50823d530d0a2004336668c0df, and drm-rust-next should be at
> 37f748ed0c19e007e7c5677f5d605d6b93841792 (same goes for the new branches).
>=20
> However, today's linux-next release still shows:
>=20
> 	$ cat Next/SHA1s | grep drm-rust
> 	drm-rust-fixes	15e8bae5d930c91b8739a87d75db0a6efca3cb32
> 	drm-rust	d9a6809478f9815b6455a327aa001737ac7b2c09
>=20
> d9a6809478f9815b6455a327aa001737ac7b2c09 has "CommitDate: Mon Apr 27 18:4=
3:05
> 2026"; the next commit in my history has "CommitDate: Wed Apr 29 00:57:54=
 2026
> +0200".

Sorry, looks like a rookie mistake on my side. The scripts were fetching
the correct branches but merging the old ones. I should've realized that
I need to update both the git config *and* the control file.

Should be fixed in today's -next.

Thanks for letting me know,
Thierry

--nyi6aemc7okvxr4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn8RV0ACgkQ3SOs138+
s6GgCw//aqVZWowHBGAf5yRhJzZIGog/9ewt+sIjuJbqcjxYC3O9YnkAsqNta2W8
e6v09knloKsKB8L3PjrNjSI01zbni/oWwGXtHoH9z+eKMmrqjnOxqjfaeadK5Wcb
Fnp01EY7PSo3O0qc13S96oT3o0F5BYHczSDmmbgspIcFgTM8JkKeR4dBLOeFFTpM
B2a6iRM1JRrVoDQ2nvEIigArMVdYRPzL7R9Zp9YVsYjK7EnQ6+iyRoLDMnYeF3QN
D/X2Cu7PCgehcBQNLKX9xCEX1wlP95s679pvDRJDIqLU/vEDPWTBxwBZ1SEkp1io
KrJDBBEUfWK/n4N3A9GsQgvOHIYOBaknfWWDv7mzsZiV+FXI8sPDcgAt8rzrK1Q5
8M2E/ovngsLKiABUizxQyO0Il74yCooDvCV85IHKFmMFeKo1gqTGK92i577CuQna
5bUXea3X1MfYHCtWURNti+ZMg74WRktvVwZ6ZuNI8IFjbloTzldTUh3uAxN6TMxm
nHb9ETiTIpIc29+n+utk+DUoIT6lTXjlU6RzQxj+3DsuX7Alt/p9tFDn6/mstZCs
h4fr++VEhyRsFbzZc8jZfvnToCi3FWrxM3iQaYwvTh8CjnEF6mjl7hd3RpDvgGw0
5PALaFC0i1XBjM6t6lGnNd8wz4gnihrO10n6SuhmYLmti7FRv58=
=Rx+7
-----END PGP SIGNATURE-----

--nyi6aemc7okvxr4s--
