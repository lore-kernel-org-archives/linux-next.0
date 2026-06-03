Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ADE39DBF2;
	Wed,  3 Jun 2026 07:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471013; cv=none; b=QVQEk1TFNPN9GhwSItZiGTet0Kd7WouHkd8F0fQhMXIMLU3Z+TwN8YLQ91f558IWT36+aLlzQMQSLMKFJBWDAzd9PnRFWZ8/EYdsZoh27Ru/QrEvbN30StmOldvBzNtaXqlgMpec7NupfncmjP0UcKYGiC4e1Q1dZf/V1Ow6cVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471013; c=relaxed/simple;
	bh=va7jFxgh53mLi5iVKXyoNKn7WZMEv+pD8Pfn77xABuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=azTSputyOdFGi3jOg9sJGpBU+k3uwK6TYjurp71wsgtCtk7IKS6Jd2YQBf7zIVSHIbTjTevRdemQnLb8nop9Rwt+vfXHr+Z/ocGcHJbX96G0goXBlWYR2K7ASii6c6qvMSF6AHEs4LewqJqP6wCNiaO+Qa3TZNyvsPx0LaSroKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Blki+9jC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Blki+9jC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864DF1F00893;
	Wed,  3 Jun 2026 07:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780471012;
	bh=KOWmdQmCEeacOb+7NmkpgZeavTkPFAopdryRqiqLsfY=;
	h=Date:From:To:Cc:Subject;
	b=Blki+9jCavhpksuxjRIVQpq2XlAzcF9LeSSwMr7zz5AfQMF+T3+srgtM68pCDmQr6
	 HylPH8ROsz4ggpuBIPIPMMQdLDY6klVUqtpS2dH1Xz18D/VhGj6QjHyWeZnZO1rRqK
	 YCDNNphjL7aIaDfKDvFNLw8e4PtVSGx2jFUtRjgiZkp8m+mf9QIfJAPZPKOghyjF74
	 a1WYl0l0HcU566OAO+v4i3JN9KC6KVuLQ3EuE+Th6qzSo/Td/NfagPq7zIGlL1jWvP
	 qQlRwIAJCEOFx3WvlCyZcmmvJ60hUAXY77Dmx2SAfaamla1OMvUUvKJz1qUUHuFsuT
	 B3dvJIqVtVpNA==
Date: Wed, 3 Jun 2026 08:16:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the ntfs3 tree
Message-ID: <ah_U4Bjkpnue-YZH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IsLByaav9w/W6OW9"
Content-Disposition: inline


--IsLByaav9w/W6OW9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  236c81b8fc4cd ("fs/ntfs3: bound DeleteIndexEntryAllocation memmove length")

Fixes tag

  Fixes: b46acd6 ("fs/ntfs3: Add NTFS journal")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--IsLByaav9w/W6OW9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmof1OAACgkQJNaLcl1U
h9B/+Af9GDi5oLIwTm2OLrWBaj7ECt0ZvFvjYDZ4mgscl+QMArWUMIf2HpGvmVBC
BUG6PHr9NFs0+/RVxFJ8pUylldH6imh3zfxZ2l4pRaww4IMUla9rad96SOfQk3oR
qzg+7kQ2MCcAE0HtYIwtNjRqeP6W1roDd9STE8e+PQNLohFJTfnJ6CU6PdQw1y5I
gw9WxaaUaKlUJCCGnEy2dtz4NiKvNxG8pbReDE4yBIiZkqi8lc64pn53dWBEC3F0
JhPkWYwAEVFzidhCLgkWCiDRnBTdH/6sSd00DJ/lCuhtt/kxi/dP24WrKQMnTR0O
U3iGjq/3N7s2GNg+ymQRVK/UmoOROQ==
=C3oV
-----END PGP SIGNATURE-----

--IsLByaav9w/W6OW9--
