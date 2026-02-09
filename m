Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711FD2E542A;
	Mon,  9 Feb 2026 12:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770639010; cv=none; b=l9q3nInI9LJ0aAlQI6uUqZtXud6zC/IBQRKb22HZRucK6ETxHMuLM/LBUAktUx3vlLkiPzCweM1836wlLHuqzgYoQpRwg8igumAVu0R+U6D0k+JUazQGnKGNxHLqOBLTZoEIhjbpk/miUOw+1241nxLmqeJm1nMTqx6Qp+ntgbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770639010; c=relaxed/simple;
	bh=qXdQH5jmg2dFJRO2vEJAGit3rboxpIkw3c14r7qSP2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ua0EH9laVHxeMorjY80gB7VTHCGTNsKKZaCzuy0hBkYsZFErex6D+3Xr54z2zYuvd/5/yyRTkgGh9RqnMcrIHduP1sV/UffbWdfAWnJBRGTDnH7rY2b7WnC6czPH/Limsd9gJQ06kBsALWpgBe+xGF8bxy5rgOr/p9gDXWAgeoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvBpN5Gr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvBpN5Gr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E41C116C6;
	Mon,  9 Feb 2026 12:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770639010;
	bh=qXdQH5jmg2dFJRO2vEJAGit3rboxpIkw3c14r7qSP2Q=;
	h=Date:From:To:Cc:Subject:From;
	b=NvBpN5GrhCIPI2a2L0qmtYTNYj8wqiyYgPJ1DuJDSaxogaD3veU7I8vOue6/0UXIR
	 lbsy3c387gAvWRK434BT3CqN9eS4xfMTIJa9+YB2E+SpqgwHkj8fdJIolBjcvpPaSB
	 d1my2gop9sLrKx7eg7Iu+pQqZCAIaJ/5NYcCwCdMbT1uVx3VMFbSpiSCdFg2f4bYh/
	 RMb1/l0om2jDA8FSGP10EMQ7QItZ8mNXnktLqu0gZTWU2IEP+MsKK9YPMnPGmHk58t
	 qs62m8MzD5V/ZQUqaWFJG3Z9L08BueXQtMCiq4VmJ+VRc/LDYe2ear1istYA0Zs3HV
	 WIVAYbyE8CAsg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 05AB91AC57F0; Mon, 09 Feb 2026 12:10:06 +0000 (GMT)
Date: Mon, 9 Feb 2026 12:10:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the sound-current tree
Message-ID: <aYnOnnINwmcc6qHg@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aA8iHdIZwLUIMtqF"
Content-Disposition: inline


--aA8iHdIZwLUIMtqF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  43cc944c8e28d2 ("ALSA: usx2y: Relax __free() variable declarations")

Fixes tag

  Fixes: 67afec157fe6 ("ALSA: usb-audio: us144mkii: Add MIDI support and mixer controlsj")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--aA8iHdIZwLUIMtqF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmJzp4ACgkQJNaLcl1U
h9AITwf+O/df3luglS+mQ49u+DLDADvhJtHeK3gHVK+isznlvxjD4p80ETKfdARW
ml7fi7yTzJQ6VaAxltFCZirBNB6xXl2SxBZrcfMiYqPq7zQ19r9ZQJcLjEg7ntkr
JxMOWEt2jJI8vbh0sca507J/3tC6PlFHtDVxbkfSP1JGAGvz65lsC1a3mFysIBlO
zuM97rLIFslThj9uf46nknbUyZgIMCd4/6cwEwmehF0SQrwsjlvWc/x6qLK9JiV/
/xl9RwGLSkgo+HwY2ds6DiiA+o5b8Ny04quiG84WCIfs8ZAxstv3bn6qQSKDxmKz
HznXMYirYA9OnteccKdUoZr4R/u9jg==
=H954
-----END PGP SIGNATURE-----

--aA8iHdIZwLUIMtqF--
