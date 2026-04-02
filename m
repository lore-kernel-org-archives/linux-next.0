Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D56E3BAD94;
	Thu,  2 Apr 2026 11:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775127859; cv=none; b=SCisF+Zhs7LkcBNlLpBFocm+AvyVZKtjRZ0V3sFYgHoY34EASQU0k0IlkiPs6oW4l/LkPvcnZGoc5PGw5Zd8vDXSbQ0Hk3vlQudnjdiUTja8yIConUhN0QNe7kf96DTfTfi3oMQHlGtRDTlg4z+mmX5TWG/7vGW1+WgzCqfmpl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775127859; c=relaxed/simple;
	bh=aFFNKU6JAczUgSBTuiJAoGLi0JXAMcnFamIjjTW3Z8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E/v0kvC945E6snYPwpngoDwf92U0o7TmUzQ7UtfdIlRnvtFtRH5PKesRBRrVIyb3pl86HW4dElvKmYQK30dH1sMBcDWcrtTVIWIlLJcl0aoHDlfLJs230C48dAxWQKterb7BmFN3EGqCfB+HZKeXrSGa5DVxhf06G2BpkpcdROI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouVaJdu+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouVaJdu+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E6BC116C6;
	Thu,  2 Apr 2026 11:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775127859;
	bh=aFFNKU6JAczUgSBTuiJAoGLi0JXAMcnFamIjjTW3Z8s=;
	h=Date:From:To:Cc:Subject:From;
	b=ouVaJdu+Mn3D9SScs3+2ccT+8pb+8fdC1NJDUYiahYQLmTdwdQ/DApTZrX7/q3A69
	 F0RxSfPIexFUhwgbJ/jO9b/sptib3+QQq3gGpB/hzSyxrVj/AtX5bExwigWZSqHg54
	 tDN6Ah5/9bej3gqeDx0BcOlfDVtkT6E+gkuFb3Io3P4qssMmKXSnJRwh5OHP7aPGHg
	 rR85b8jtKLy8nAmFQ5yTodOrHOMPeFW75W3yfF+KsYzQz3FEAlst7wFW5B9UgtHLuk
	 nSPCiu70oF1BTQEl7p//kcgcCTyB0nF1oIfQriyhX9QWwB54YloNUI+fyRs5tkUKH1
	 cqNyAzCNfgWdg==
Date: Thu, 2 Apr 2026 12:04:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the vfs-brauner-fixes tree
Message-ID: <ac5NL-ClYJZWAGJO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lah/mYZh5/A0bn9Z"
Content-Disposition: inline


--lah/mYZh5/A0bn9Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  fa430096c7100 ("eventpoll: defer struct eventpoll free to RCU grace period")

is missing a Signed-off-by from its committer

--lah/mYZh5/A0bn9Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOTS4ACgkQJNaLcl1U
h9C41wf9FAJbxxtezWbcXJfx/EzYkBGcY7Ck3iMOQF0YO/qymjuwl8uXceofg9Od
4vbpTmnkTS94HclJ0DcM33AzsuBH9vvUMGStBrOOKOis2ENwqPBl799/TooA1CnB
nklG33QrMCfMMbgbUF7VbX0XGecSJDEWKV2o659R1PJ571Iq7jx8nZU0/cub8TWG
basEPCSc5NbFxH6oAX90ECevSWk0ApGqIjaDN3/ObnULfZx2b1fCYeLAlhLATN3r
xaI8+nIb3iA8836ZmpJxe7A8NZmPi5DFkWyTtLK90OykYQJoQF9G7SSG9mxNq5Ey
JclKhQsuIE6e2PNZMLPexQs9GeYHpw==
=FrML
-----END PGP SIGNATURE-----

--lah/mYZh5/A0bn9Z--
