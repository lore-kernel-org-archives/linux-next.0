Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A1F1F4CA9;
	Thu, 19 Mar 2026 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773927957; cv=none; b=uxH5LC8qCKa2HDwVyUM5CEB0nAaTf5WEHuM0rZ56Hvth+WIDK8aLQGPBGC/Hxe5ti31UmD29hgPx2Vw2VusgBxQ8drqoPdGNd4i5WH+QZagPct7Gy4LUBh69bqP+q+wnPzSjWlsFhTFg38KN85T1WmVTYnDfb+xDU46QueagERY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773927957; c=relaxed/simple;
	bh=5xpsGqYarAIRz1opIlfJCueSk9KhuUnqbzykyMwB5p8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ezQno1OkNs7q825kvisciAvPR+6r4OdWE96smx4UrgxooWys1wsaUTa0tKKH0/cQuz5bafk5ofsotl99xQKLxiYTis/j9t3+0NGXq8sc7g/l0UhwjjF6Cy15I4Gqaek1RYutwlCNmvMwW7rmCexzj6BtwlthTfygXKf160W9rCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrRBpfM5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrRBpfM5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B760FC19424;
	Thu, 19 Mar 2026 13:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773927957;
	bh=5xpsGqYarAIRz1opIlfJCueSk9KhuUnqbzykyMwB5p8=;
	h=Date:From:To:Cc:Subject:From;
	b=mrRBpfM5jKz3cqbWcv+4xeyNn7rD+9eZdrlaHDWHzGcYs7RMfBcjS+ukVxEetySE5
	 KM0/U66pClpR9NSo86caIlYweHfA55fEbbgndr3dlJRonF6bR7LjDL7gvlB6pDIWVU
	 aMIBY+C7fsute0kCc7z1dOtVn0AdtatqWPgBMlGg15hTGk4C+6O8FJJjxufXHonWx0
	 QRjIshQtKCa1rKHapZt7Qr8zUaRbdk/zJ1YmqZcFmMlT8WZB1Q9sjWBXjdsvtL6/XH
	 TVlf1yxUO2NVrXtvRTk1CdQfO8V6pZ+JUbRlFV3qvMlbFwjTyktNyzykL1fl0X9Emh
	 1PNPe//jUzCwg==
Date: Thu, 19 Mar 2026 13:45:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the clk-imx tree
Message-ID: <abv-EiiKz0ZpmhJZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mryWs10/sjAENklS"
Content-Disposition: inline


--mryWs10/sjAENklS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  0463762fa001c ("clk: imx: fracn-gppll: Add 477.4MHz support")
  3cbcf93329c0d ("clk: imx: fracn-gppll: Add 333.333333 MHz support")

are missing a Signed-off-by from their committers

--mryWs10/sjAENklS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm7/hEACgkQJNaLcl1U
h9CTbgf/aFKbs7NOLoHJq7BdpwEnzZs/uXFDV20KgpaPzmUKLy/NoQg3grpyGEZs
QfpS19FyG/0vY4paLb1K/CuCdXFUAtLorLd6xgt7rc7RsVjMzizcl63j8ouVQm81
W/R60D7+wPXIrELfDHLtXq9+bMds2/Cb3Zql+L0y2rdLzroZLi0KVqNQWVZ/0J+j
xoZPOYRFyDP4DzjaC5uzRTpYqUOoUx8X+/OccJNAmohsjS2lI1uUWq3EoplRUry9
5rMDbPB4/A/s9mSgaiZYPnRhlNqFRqn566u8kZ4BeMCaan9LXUcwIWP+n42zsTtp
8PGwEkaXbUOJO6iA0xhWmOXO13EpgQ==
=LrWH
-----END PGP SIGNATURE-----

--mryWs10/sjAENklS--
