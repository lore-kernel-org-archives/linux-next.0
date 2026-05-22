Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F373CC7EA;
	Fri, 22 May 2026 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445484; cv=none; b=q39mANYoY4geYiEbGvS9Hmn3rTSuJ7gknLJDszUfkdNtq/An8QIFVbdgzG8hlbNmw22/F5XCvsVXmXdnJnpBJd9ZtQbhwNUB9HZU/uAYdGDSsTP0JZeQpndvSz8rzgxuTo8vcV1SgzJL8h2tDvEAdXkVnrOCeTGJnF80JjfJKlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445484; c=relaxed/simple;
	bh=z0jz1Fd2qRlbTT4HvJh9IxaISav4W2O3HPUnONrbVtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cHMW2C7a2UesC7E5G7YlAPnvnBW9E8/zCOx2tYDEtEabKEMz8bIJbm7o9xdgWrYmep3SBVorvVWvYFxxkrlVVeODi6GViwxNQY5zsdqDZ7oLMeim3kEp9EhNGca5vp3b6Y5foKhqoK1SA09IBcAE1zqihZSFPd5LJ07wAL4QHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/UDMxy6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/UDMxy6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4C51F000E9;
	Fri, 22 May 2026 10:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445483;
	bh=mowqTnnAaXFBh0Af3L8aL2+ceukGUof6vLaxhbp6zFM=;
	h=Date:From:To:Cc:Subject;
	b=O/UDMxy6k2l6kkutAYETBMS1C7ilYqev9A4+YtZgiySLQBgnxnskFaOrGqScL10hM
	 l7C+YG0gK9Mu56Ysy5a/PbVteG34XqYNAm7GXnGKFpQz5N1sYgJSFfN0XqCewmuCba
	 dxTff/wb+iZlYked4RrDPweINMVbgpx4HnYeLMggllxztntyWwEZ7RZ4xELIJR5Prq
	 8UUkuVxOP6q6660zSqcIPtm8WMnWfBOnNZPVpGQM6IsvYBWAia0Ss1WpClNS3SuozN
	 3Xk8vNiKm3bG4zv5urr7gDjbkBHpuBeh19DSDKn5m+7oe53bAzQIzEbl0fGKWCYPuk
	 smfRLH0gO6HAQ==
Date: Fri, 22 May 2026 11:24:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the kvm-arm tree
Message-ID: <ahAu6BujfgW6dtwh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ohtt/CTqsPrwq8mw"
Content-Disposition: inline


--Ohtt/CTqsPrwq8mw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  f82189e1862c9 ("KVM: arm64: vgic-v5: Add missing trap handing for NV triage")

Fixes tag

  Fixes: 9d6d9514c08f "(KVM: arm64: gic-v5: Support GICv5 FGTs & FGUs")

has these problem(s):

  - Subject has leading but no trailing quotes
  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--Ohtt/CTqsPrwq8mw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQLucACgkQJNaLcl1U
h9CZXwf8DCYEGeFAq41u8zOh8WRcDGyw8U0tJbxvTam3sXqeIVYDuRHVDPfKEq7t
6avEwUKH9NBkyljPjyCE+FJ23SK7iW5lQvNYim1s5QklIyPlE43ikiX7QGbkaCi+
FrlM1P7CLIayTQ1ifz/T+r32MeTLlOPdeSd869bWybyLuCmv4mNDQR1MmZwzfUxZ
E+tpJyXM1WUZIsJ1+uotbcuNse3aQalSzqpd+kFh1t3OJNS+fy7LZJJXyrPQvtt1
BCnR604Tq91Y0gkW6n9LqrHFpJW4VykqmMKqP/i/FW93Zn/pYdB0UDMV74BTzo6S
3SOIWw5AVb9kum+A0692VtvVKBDpiQ==
=myLw
-----END PGP SIGNATURE-----

--Ohtt/CTqsPrwq8mw--
