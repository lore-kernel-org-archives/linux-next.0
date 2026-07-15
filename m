Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DFA4483B1;
	Wed, 15 Jul 2026 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113701; cv=none; b=pqPSOIaweCHJO+a2xPhtAiX12Q+d2j9KQmuTcjsgOWeQBQHpl55L9mk2PR+ve/FeedMxnRItPTsNP53/o2il062jUV3t/GeHVY5fY9QjwR99/rlhil2JHs74hl0UEo42Vyl+1qhVfhWalXtWIGKhXuME9/2XPj/ZAZ4zFC8QiVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113701; c=relaxed/simple;
	bh=7tYAjPhGe+w+xr3ZVhBLKT2B9IitkhMJMoYr175Mmzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MeT7X9WhD//aL7iPDCm4Qk2+6FBsUog9kFATviLhIYudDw/N0VcToBFYCXa8hZmuiP/aVgFjny95fjCySIHn4XG5n2IRH7aQ5Gy2VELiocypeQUXHvpmMwaojdoGVj07gnUXtzFZD275Kqocj18P3DWGSamgdvgsJIfcCurFpS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiZGZ2yx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiZGZ2yx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8D01F00AC4;
	Wed, 15 Jul 2026 11:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784113700;
	bh=McdG2rgYp/IWtBFzvbdDImxrnGmvSW1uZGwNqY1LHnI=;
	h=Date:From:To:Cc:Subject;
	b=OiZGZ2yx5ikrmCY04Ym7QL2GNYafn4McsKbdPF8YEdOsSyv6qCm534UQ+RRpp+KLI
	 X3WqBMDPVcysNrLKjJWEAL1ZxOY9fIMx/DYSSJ1e7eZIpD2dC2F3z9DjiH23fUU4rm
	 ZSVzV/PDQKRhGvd62Sp35JTO3Ub2xYMvjrluI5ea6zMtCDBxraEwdr5XQHgo0bJJ6B
	 lJ2VWn5HIHh9MsGzz/BpPae2ng1FQkqR/q+rYWeA5ezhXzT9xeyAZUOJCc88ho1L3n
	 SbnWZbAcigWWWorBQh0OYxk88Ox6yAyKiJq+a55HshFaolMENZntFbq1BtHxHn3WyV
	 b4yvpQC6waeFg==
Date: Wed, 15 Jul 2026 12:08:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the ntfs3 tree
Message-ID: <aldqIGRdMoJgNkER@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i1Y2kmdENYJFS/pl"
Content-Disposition: inline


--i1Y2kmdENYJFS/pl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  f023839df8010 ("fs/ntfs3: fix out-of-bounds read of INDEX_ROOT in reparse/objid init")

is missing a Signed-off-by from its author

--i1Y2kmdENYJFS/pl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXaiAACgkQJNaLcl1U
h9AIWAf9Hgaqpsee5IheNvnk+ga+5bz6Nn+n2kgDx0HaooNNa2zaGXCqkdfcQNi3
ng4EFakgD0SdpO/GVckyaXO9t4p2i+DjkY5kOqUjAZJClaYJIRXZx13UJ39dhPLi
f81z2MZdqZELbTkbUxMmuXWbM7J5bmEaXvjEkXk1hnkd9OpmVBZXo/2rjXmMqlrz
xhVUjcaiXURPOA2GicPFmnci/3B2fXGGcTtjNwptJEUc5Gy6b/5V8/pd2Tj2CRpU
T9xrFO0CN6i+f83LJ9yYhRsa6LVNi34NtyDfFuX6u+BdHe1Hhm1u1KCD75lPrUL2
ZiKYLAZwwyirf5myJP7mgYP5b76Isw==
=3gVU
-----END PGP SIGNATURE-----

--i1Y2kmdENYJFS/pl--
