Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA828641E;
	Fri, 27 Feb 2026 14:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772200843; cv=none; b=UoeZmsIhsit+6bOe2WV8jTfbDII/iRYJkgiBRUyDrdbucxZiDu0yj7TrXV+5HUbrMVCu7ug+HtsQ2yqzCc1IqYRITC5rL4tqew5nr1g2+iApkOOsfZWXGf583qYo78xFVL3w5LjgO40qwZLJRCTgUGoH/gDlIrdM++C1plqf5/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772200843; c=relaxed/simple;
	bh=aSticSv3KOgCLg6dp2Hwdk7UJeJ3pZbUlkZ8LzARx5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D7b0iDLK8gyKl+vAEUtqSggmhDEfmkVeI2ZR/ndWUCb3P7DFHbyRb4v3rPQ2bO8SlhwMNVLKW/mRkNhjXnLJXszPFjT3+jvz8l4oF/PmuEUhM8jEqFx651TqBNmkftZ8fRyHbu62LtqtYllun39rn5QwkRYN0+AUWp8Cvm6snY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2MNH5XG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2MNH5XG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E67C116C6;
	Fri, 27 Feb 2026 14:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772200842;
	bh=aSticSv3KOgCLg6dp2Hwdk7UJeJ3pZbUlkZ8LzARx5g=;
	h=Date:From:To:Cc:Subject:From;
	b=j2MNH5XGIre3m9jdBqGru8on96AXFwTlfp2/fO4gNciaRyX0yOgr9CJ2ZQgJd3Aom
	 JQKayBGvKid0ClhPsVRP8QscfJJ3mcTUtGBVXlrqHwkFzJYSGAE9lCWZ2V/FxmdFt6
	 /gZqW43aYLhyAzm/lKlN2cJ14DgenO0RI7o+Mx3rYYQ00ap2MSjE1Zm+POQIMtHiPO
	 Ore1j0Wae6cWY399cFraRuiwhtNGAbQeR6UVzFYDVySHMtpNTwX9WW+QhFNg0Dxcoa
	 XXu30rGXFQVjbmQTAur8Gc63eVfPP3ftQK/ygnjRGs7QwWMQMfPZPRNsxC8+rniFCp
	 8fc0E3/KP31XA==
Date: Fri, 27 Feb 2026 14:00:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the drivers-x86-fixes tree
Message-ID: <aaGjh51jAbyO15Eo@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4S7zHf4dB1UoExeW"
Content-Disposition: inline


--4S7zHf4dB1UoExeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  729ffcffa7306 ("platform/x86: hp-wmi: add Omen 14-fb1xxx (board 8E41) support")

is missing a Signed-off-by from its author

--4S7zHf4dB1UoExeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmho4YACgkQJNaLcl1U
h9DftQf/XonBhFNAnED6Ur5PvYGCIMyFVlqAiUkLd/yoBBJVCdQ8mBopLBXtwiXK
UXEUAZUKjaYs6nRC2QSsDHzQ8YnQVbyIVO7G/afB5N1tL+WFYE1UfXcDHDQzT0Rp
TBBsdPc+96XUB2sbpqr2WmMwQ2nJTzGkXi7/cQffPZegBSSwhqo4z9szwNG5bI14
yJtF9ZSVRRGFMW5+47lE2MlC6K4Gt2VmNvK1n8JL09lEEq/MLul3gCCOfLD9RcrB
S7q6+Zsc0ZkfRHMGZiN9iX/nG1LxLb15iqTN/f+Ebqy/U2035LPBScrZI+E7syK9
12/e+4t6UgvAU7ZgmDTY4Sr1a+Gwfw==
=X822
-----END PGP SIGNATURE-----

--4S7zHf4dB1UoExeW--
