Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03013FFADE;
	Tue, 24 Mar 2026 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365078; cv=none; b=IQrJ6nS63hRSg5k19ihut3ZtnelP/79pr2vBI2v7dm9qnpNjurFi+OvDgEVDbUrMXZwoZ6a1MI9FfIVRmQp7ikbXwWq4VS7Nt9x68UceY7WFuks03R4Vm8Z8ew8A18KLpTbOYfh6xcoqbwmvtSLOyF0iZDCtCfIO7s+aw7uVF54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365078; c=relaxed/simple;
	bh=AXLEmFNlT8FJprI9SDtxmgf0B28rB8B9GFCkHdS5uVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ivaoa/cPxTzNVxAyfK5/zyV+5D55z8lvAH3PWpkaxhxzQ1uPpRp1MVhtqgbSu+gV90/8VhnFU7UhZtJDGbBRoKKysjHj4qEbDRC+Svwb2rzzMEoB2Rlqm7Rnzpl9CMb6xW4aEZcTudeJR+1dQi/s7Xpnli0BMo7Xg9NcGymYLIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/049k5D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/049k5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A239C19424;
	Tue, 24 Mar 2026 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774365078;
	bh=AXLEmFNlT8FJprI9SDtxmgf0B28rB8B9GFCkHdS5uVU=;
	h=Date:From:To:Cc:Subject:From;
	b=M/049k5Dh8SdFTBKwVU9cWfrl78OmKWxKnbfvO/ZyS2j8NLacEW3FJfB+BLxwXGQ+
	 WtHnY7ceDa3+X8FOJZC5RTFGYtdtqrN3NlAw4hU3lIYIA76Ql7nyieKLRJf3jVFHKJ
	 FZug1e3f+/PWkFyz0hFomm196rR6793t5CDyw+ueiXFqFtUpEqJPrLCoQAGx/1TRMV
	 bke9yDsZW1baeu16N0VeFjG7FqHCAmm/BvS4SFclBEs1uvb70hrrJT4YSq4xACP99z
	 IsWS32D53Uuy5YNOCdSsfQ5lrEQYEjpNXs0Y7fDufPp2B7K+/YicfgzvZzOTpyK+uT
	 ZGBV/F2H3G4Uw==
Date: Tue, 24 Mar 2026 15:11:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bitmap tree
Message-ID: <acKpkuWNBR8_91kF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GmWjedNJkXnHLhAe"
Content-Disposition: inline


--GmWjedNJkXnHLhAe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the bitmap tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "__bitmap_or_equal" [lib/test_bitmap.ko] undefined!
ERROR: modpost: "__bitmap_weighted_or" [lib/test_bitmap.ko] undefined!


Caused by commit

  3ceb692949ab9 (bitmap: add test_zero_nbits())

I have used the version from next-20260323 instead.

--GmWjedNJkXnHLhAe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnCqZIACgkQJNaLcl1U
h9C8dwf7BT4IStz/+Gg0ffZpaXO5lJButkO4QUyHlbnOSssEp1kSqg77jOlPKLz/
WGAWMB5CsL8i4VRqFlIRGIH/EI4Ol5sfpO3XuU/jPljpRvGjNOFdNLp0VyIFrvoD
nFnpFt5Ddz2nkL8cPh4ytuk9dKb76cl0r7hBUGeJ4te7zQ5iAX/mOcSlOXON6Qcx
6m1JmxnXb8iFgFRjOfAjiQ9qybyasj2A2r15ypWiPBotAsg8LFwe81qU+bQNBGIF
tThD1CbVPnr+/JBMNCjf4LkP1sP8SkxC4vz6BE0slQsLAwJGsuuWoyKzRRxnHve2
HI0Dh/3skEXEh2l/AcNv8A74P3oFUg==
=WokB
-----END PGP SIGNATURE-----

--GmWjedNJkXnHLhAe--
