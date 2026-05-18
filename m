Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837693CB2E5;
	Mon, 18 May 2026 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091872; cv=none; b=X8F8/LZ5TedP6WrauJXriBtYDzcElZPtzMURp+FRjxW59/IkUQVENrjZZ7IH/ULm3n6eM0uH4l5ik3P/1OrLzEYRdPN4TbSumPBcnVe2+kQGjeyYInUpgO3dANgoWsz+/fXjFc8AJu6+dUMtnly6Dv/Ckll1i1v9w8x/dJ+OAU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091872; c=relaxed/simple;
	bh=1h4GrFGmxzuqu6yWSJeFciMd4ZiC/H7kpZCkWALaFps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F2jD6EqSM7VenCDta+sGcBx2reHe7R0YJxxLcyaxdmhweCkLedMQBdmlmP63EvNKgS9wIbs8i85MM1py40N+ZAfPyD2UMczQ/fBqTm/HrKm1TieltvqNgx0tt8TCFBCO+zcQW79oYtz2OF5P6cTnjQYHph0ldjfPfacQWErVYTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLMPaydX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLMPaydX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEB6C2BCB7;
	Mon, 18 May 2026 08:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779091872;
	bh=1h4GrFGmxzuqu6yWSJeFciMd4ZiC/H7kpZCkWALaFps=;
	h=Date:From:To:Cc:Subject:From;
	b=VLMPaydXZphkRci4iwqiUH80sK//f4PhcpTnsR3Y/pruOcPFuy0us5BiYFO1otnHj
	 HSXFFHReUHU7A38lgS4+MNcOUZi+ZFapqTBSmhFy8HUDCtRtZW15OaMyeVZr0lBdo9
	 m95JKfyrQ/tK4ettEpAQuMZhH6JpfSvQ+gRgqOjLIl5Qves+xsEkOFLZ84KF/D2Vhi
	 6VN0ggKU2/Wo26xApUqHbJucBnPs0gMJo606ALZWx/5p6n6jtj7FiWr9PXD19B4C9p
	 yY5V4XcChGekRMbSkY+NwnNYlApngdnRUKU3ixBTbxPOBjX1RJhNDytPr2/AKmoKa/
	 OYEf92bwv+/pg==
Date: Mon, 18 May 2026 09:11:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the ntfs3 tree
Message-ID: <agrJnF8Gro7PUXV8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dy3b9aZZRLuQQLfB"
Content-Disposition: inline


--Dy3b9aZZRLuQQLfB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  4160f74379854 ("fs/ntfs3: add bounds check to run_get_highest_vcn()")

Fixes tag

  Fixes: b62567bca474 ("fs/ntfs3: Out-of-bound check in run_unpack")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--Dy3b9aZZRLuQQLfB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoKyZsACgkQJNaLcl1U
h9CqPQf/b1qvqhpqDKay0OUq1HyTuOOmwiRS4zbouZIu8eCQhgr60SyMaq0IDHRY
ZUqwHvGQt6iAEFto98Lo9tFx07m4lh1yVN95pHnmMOtwSyV6OkW34Jg07MFuarlw
fjuTkFCizKmjWhM6OW1PXTtU7xNB4BvtFsa19OrxeW9ctOH4n60wMvH9UY74I0AE
qLQjd19HYufdHjkxKs6Edk+g/yQa2UQyrSG0UFk0FQIoUitDdMTbeoQy2Mil+xDv
9C2rgZ25V1Rx/8+qPptcsQRY8iIT8aPS5E8yCAWVXbLBtJ0ffTdn82yt77LzQeOK
b5pPYr1+EHb/pgvP04lIOawzKaYAsQ==
=RcHM
-----END PGP SIGNATURE-----

--Dy3b9aZZRLuQQLfB--
