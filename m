Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DE823183C;
	Mon,  2 Mar 2026 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464405; cv=none; b=t1x8nMEKJblnkfz6XeOz00+ohRlc8C4kvl6UrzXmkN/TPxGXrCm/5HvrH/S4OnMAvjAsLcS+IGbaN4s//hh/zrWsAYehW7MsVjGedGuuoMSY059YMoLVcMyy5jTnNzO0KL7LFvZUH/osaTumFcTGclDZN+lg7YAZcKJ+C9H686A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464405; c=relaxed/simple;
	bh=v3/qwEQUbFTcKeMyPh28L7MbrIXacPwocp/0ZGtyBJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YTYe5YslLvKjAYfOWlXdYUgkkbjEYbcsVgFGxPplRTiy78447sY6QHCviC/tZPNaHxONnjDJrzPJPewD/28iFWPqYl+F8gtLn6a3N9eIDrR3LLcmo8P9kjD/qkSInLavm8MS6IMAlxTN4EKjVzbQxAfE7j08qQyVTLGNHJXiBa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d79ov7X/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d79ov7X/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3112C2BC87;
	Mon,  2 Mar 2026 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772464404;
	bh=v3/qwEQUbFTcKeMyPh28L7MbrIXacPwocp/0ZGtyBJc=;
	h=Date:From:To:Cc:Subject:From;
	b=d79ov7X/zhb6YOcvW1QvG5PFkOYbGFXlYp5nc/yjJrCb+rRSD9eof85f7RVSeUAKv
	 f/6D9Iq1qwIfS0wdgUOOF7kS96UycswqarLC4lDsaxG2f3DjCzga2jw1HfVs74dLLr
	 hYE3HFf+tb2CRFPrx8UpteAZ/0lRzB2W8Ct4C0S7jeGwok2wYV5hsjfO5CbWcFNMZ/
	 4GRoqvA3BTYSJZTBae/DjL688hdbpFz6GkM2UBsf5buuAX84Or/0V/yN5QAVkRlCJ4
	 2uRkurcKmtRUF7XakeUmOUIqdPGmQy2+6Jln0QOC98258sbyIF8aGxgJ1yHmdmhbvd
	 mMsLrc5x5b11A==
Date: Mon, 2 Mar 2026 15:13:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.0-rc2
Message-ID: <885cdd60-f272-48bd-ad98-4acd0de352c6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hi3RdtsBASxOfnzs"
Content-Disposition: inline
X-Cookie: You love peace.


--Hi3RdtsBASxOfnzs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

We now run rustfmtcheck as part of the build.

Trees being held at old versions:

  hid 	next-20260226	(Trivial allyesconfig coverage issue on Friday,
			 fixed but another new -Werror thing today)

Trees with signoff problems:

  drivers-x86-fixes	(missing author)

Non-merge commits relative to Linus' tree: 2601
 3030 files changed, 228180 insertions(+), 43394 deletions(-)

Top trees adding commits to -next:

  191	drm-xe
  188	drm-intel
  165	drm-misc
  124	mm-unstable
  117	net-next

Thanks,
Mark

--Hi3RdtsBASxOfnzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmlqRAACgkQJNaLcl1U
h9DdKwf/fAWOZyTITlIRb3OTov5Hu1kHm0sz0WbZaIlNTyIxEoAUlv6q90YLlPru
MOBWDZM6p/ShARMGmb5imSrj/xHXovupiv4Ts7Op7mKsMMsQU0HwlgqJ/i5Ka1py
LfqlMMVWjZhJgY2zS7Zi5ilGE6MN/mUakII2gA1C6a18ZiZ47GFdcxpSm8ruar1E
qt1XiLC6pJjprz95j21loHq/ZjuDnuEWePPPqyJlwnDHsiBF6ATB+lf/CjT62SHF
0KNKXNi6/4EGmOeX3UlseBbhWnPQwSIU1aSgsQEDbOKV5UDfjL+cHltph0T0Pckz
wiGSL/lJLZZ1B+kPKMoPKXQVFaf1Mw==
=Pf8I
-----END PGP SIGNATURE-----

--Hi3RdtsBASxOfnzs--
