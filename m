Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF93638AC9A;
	Tue, 18 Aug 2026 15:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787067767; cv=none; b=sxyCrPILkR1f7zYuX0m+/UgWpRO44GfDpHR3NCbs5CSfeXDf9UGJvvjz8x2D+JjoKxvPoPoxxpxoHIyKEeTS1Is3cMRQFQtZoDnN+x4bguuBamek87uu+awB/zbKanSDiUMCYRDTDLY7Pp5jXT2HJVQtxWGh0SYaKoU6L78DMEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787067767; c=relaxed/simple;
	bh=veLc+ojUMA6CvF0VDwXW2G+h/6mz6wBcndss1Ajm4qg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jovEr9G/YIwYODiOlbtfJ6x5a6G5gTlGVxMKfgCPZH1nioCVdZKdZWDuUuSW19YjwQUxcAUwqQt9oazrjV3wHBqMUFOgd3Eqzn6Fjg+5+65JD3oysp4pSmDhBgDV1m0aBcFLArrTUOpiojrw1dJW3FJBI9gbcA/9k1kqdchB0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irfFaYh4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irfFaYh4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0FD1F000E9;
	Tue, 18 Aug 2026 15:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787067764;
	bh=ep8WVW5wggj4SjcnlOIIohjCQvEimQ4ZMdS3UobKK5g=;
	h=Date:From:To:Cc:Subject;
	b=irfFaYh4/6PiYkf9+J5Cmr9pLjxq/T7mvuokI0saQlyhZt9zEM2cPDaTu+62IxIMd
	 7voHznNDPhl9AjNsYmrCFbIgfr8cw0GI6HUSPoq9pR2FZMatKGwGo0PJjf8ztusPPm
	 MIdeWydAIMGios9Nwiqg7KaXUqyfRyMYIlBEfYoPoOkibSbN2TZG7oSogVPZCvjyEs
	 GgTuPO1e0Xqu0Ql+FAnlLvBjqR4UbmOI6L9khSg3WzjMbVhy06o85mpFwniOnTfQNz
	 VyY7y8qlQIh8HUN0jV+LeUK/fk/u51dmdsjNqj5cxS+fdWmyRLh8CZkDao5nIKnDoH
	 tQQNLbWjd2SBg==
Date: Tue, 18 Aug 2026 16:42:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-intel tree
Message-ID: <aoR9bznCkJHwK4DY@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ytBpLuxRCFmmqAtX"
Content-Disposition: inline


--ytBpLuxRCFmmqAtX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  0aeed866cb938 ("drm/amd/display: Fix dangling pointer in CRTC reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--ytBpLuxRCFmmqAtX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqEfW4ACgkQJNaLcl1U
h9CWaAf/SD2WxId2eOOczlzMXZfiBuIEUELJM4rnLEjvRJYRhun/4NtjY2c8Tfhy
jOoI7jpczSpS0JjEWYftRYuq3FPA2nqIBjWwQdA0T4OjHshNq7+znjsat2NBEAjF
rfGihYVyZ/znIQRvcw9NfNpyFCwXn+Sa03Iguci8/iM5NB9ZV/uoJC7mKy72CXlJ
h9J21RzHVaHPiCV/Oz896oKGh63GArozu47ctS2wAV/48j1P3uzsFSWVekyhEMZ4
NoIPRzJi2nYBsAhgpkqROw0GPAQOdZTISAk01BO3sBQKm4wK0cG5wuRghQ644/Qp
zspuTYKqmur4u7BNW7fTE9ZST+oEfg==
=beVb
-----END PGP SIGNATURE-----

--ytBpLuxRCFmmqAtX--
