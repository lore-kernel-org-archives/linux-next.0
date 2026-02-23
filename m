Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E9F318BAE;
	Mon, 23 Feb 2026 19:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771874479; cv=none; b=oja6NWPC7vvwie8E20wjn4/kWixjnuG1MZQbOZ+DjwUm8M6kpnxWwcz3q9QYsLgsImZEc1x8fB2kUyzX7xW0JQ7fV49o72UApE3qHA56v02krV1bFHbvF2u/GFXmUk3Wog0EpPEo+HheaPOHntIWgwoSCQHx3EVCG27kt0MeJWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771874479; c=relaxed/simple;
	bh=UEPHkhS3Y4Wk9Nmy5JY954r5Kc5ErNi5XvqhmodwBbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bhu0LXWxz9fTHffRKternKZ10wAm00dflmdyHxpMzYEwRvon0IKeCprA0YfbFbmsBf6ccA5JSYeWT7a44Nm31r2NT6hS2oBLxk7HiSl4ocIW+vuFXNK+/C+rwtKUtSUJuTF5/vJY4YM1nDSnQqusfj309+XJULaSB9LuRnx4UN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHT03WeO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHT03WeO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6CDC116C6;
	Mon, 23 Feb 2026 19:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771874479;
	bh=UEPHkhS3Y4Wk9Nmy5JY954r5Kc5ErNi5XvqhmodwBbc=;
	h=Date:From:To:Cc:Subject:From;
	b=QHT03WeOvMyLXabePzMHBc0YeMrr75aMUiDDtGgYHHRJg514vLityDwGm2PJF026m
	 qSE05q+gPEHIKcXuD0nzMD0yl0qackUpJUcH5/9Rdgfz60TcQTm0fZ4Q0jX3q6SDWp
	 sfMOL/l7w6HKRhX0u3xTalQLCQJqg/VMv1ExzaFbZWqExnEqy4cvVyjY0nqefxZauL
	 RrPEcm/FPw0gcWd+viVUyzVzciIeSg6bc9uehlYIwuFJC4H9L6qZugdFTqp7tvYKF7
	 QE4vURXH3YgMm8YTkGofr2WzVBaj3ZDsjKcTGnMBQrtD+yVJV9o9THe4PYFhZrokhP
	 tsgDWVfeahL2w==
Date: Mon, 23 Feb 2026 19:21:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the slab-fixes tree
Message-ID: <aZyoq2qhV7b-6rAP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AIMzRQZ4aQntrWT+"
Content-Disposition: inline


--AIMzRQZ4aQntrWT+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  46dbb7e2bc0b4 ("mm/slab: initialize slab->stride early to avoid memory ordering issues")

is missing a Signed-off-by from its committer

--AIMzRQZ4aQntrWT+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcqKoACgkQJNaLcl1U
h9B1Vwf9HEqj39CNJXnpKnKnzorjfios+jLfYQ0WIt66sYYIRL8G4Re/cX7EoUZb
VC44GGK3PcOAI1k3b0Pxx+d8kcT7ZI5PEXIfLKlT5DlXWIXfy2L8/iAC6etufBvi
nXr7yn3W0lIJ1RSmAapOqXynvnHl5JQiPBAHCwAzdbRcRUTPupmjjY21tE4aeSly
2ZDATfQN+XrgXpu/c1f2RegnuhyPZEHQLBCvR//wzbJfXGKH1LvmIaGLBjZ8qX1Q
DH/rqeWCfkSz9KF/qJ0T0vCb4np53KydEL/BlAFpCpZbqWS8WCv8xyscXabBrtOE
8R0ZryJRvkpdQTOAKP0ZrQ+NYj7N5g==
=fNTO
-----END PGP SIGNATURE-----

--AIMzRQZ4aQntrWT+--
