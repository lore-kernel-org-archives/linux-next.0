Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D187371075;
	Mon,  2 Feb 2026 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770043577; cv=none; b=Jv3oCgUBw2PxnhHSEhw9mSeiVTPqmGm6wN248Q6xZnV6oPcWYAIC9c1qf2PLwdnIe8amAGoE/ZlFYQhrL/0yYC5N+YZJ56I4IGyT52kJSqjiU9Bpqv97XR10MHtRsPWk0QrARRzw+TEH/B643umzsPpSDd6lh7d7lCTsb2vua14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770043577; c=relaxed/simple;
	bh=xOkhtlkoVZl3CgK/Y5sWpccLLgXanEQY3PS+mPkjsC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pr5l3eFH0qpI/1sRRKHHMQ4poHkpEGgF6wjZtQ4WEMgna7GJ6pkjnl4URi8XvsGyXVz4UV+on+Dv61VXd9Uv+mTKeBwBjJzFeO3w0rZGRVgljKv2y5VVDDxspOa+XLalbGITx0LO/0AJWMvGaFJirFg3vBnewLIeIXJFTSj4Xn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SuwWdzoX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SuwWdzoX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D400BC116C6;
	Mon,  2 Feb 2026 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770043576;
	bh=xOkhtlkoVZl3CgK/Y5sWpccLLgXanEQY3PS+mPkjsC8=;
	h=Date:From:To:Cc:Subject:From;
	b=SuwWdzoXaQU9014DaaA+uutfTMzrRKNw0gSW3oY94AfU0AQeZDfUguGK0XK7Xj+YC
	 OM1D5WNfNwo/j6YgNM5iLo4z2BsxU7PO6y+6d9pK4+cE45xtUnDR+wHbTTeAMMFxq1
	 oHGkARgPr8iXptSrHaQygH617B1YOl3vNWExBRaCt7kUrImFtiVoauc1rqZx5+VVYc
	 HLmZ5TRZjssDSJe9m76PpUX1IPjpvYvwPq+JghbUPR2J68gsXJmgmsMldanRICdbbt
	 gMCuCByIqpApMA+jpRwFNlb0LP7hykF1fo3Ocr5u4h1EDqYbRXWX1ZpU/GwQGpj7WL
	 HDJxKGFMJBGGg==
Date: Mon, 2 Feb 2026 14:46:13 +0000
From: Mark Brown <broonie@kernel.org>
To: John Johansen <john.johansen@canonical.com>,
	Georgia Garcia <georgia.garcia@canonical.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the apparmor tree
Message-ID: <aYC4tVxCeW60W1LG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="12JNx3scx4DI/uri"
Content-Disposition: inline


--12JNx3scx4DI/uri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the apparmor tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/security/apparmor/label.c: In function 'aa_label_match':
/tmp/next/build/security/apparmor/label.c:1406:20: error: unused variable 'tmp' [-Werror=unused-variable]
 1406 |         aa_state_t tmp = label_compound_match(profile, rules, label, state,
      |                    ^~~
cc1: all warnings being treated as errors

Caused by commit

  796c146fa6c82 (apparmor: split xxx_in_ns into its two separate semantic use cases)

I have used the version from 20260130 instead.

--12JNx3scx4DI/uri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAuLQACgkQJNaLcl1U
h9AhBwgAgBzJY3SSzUSmtHbACSS6/KfyvpSCmwKeAYxA8tyofX8GAEX0Pgje0kFI
LhYc/OC3ZGogmxouhEAVsw5PcoHaL7hzB06qImGjWysjKFdKLzH07bOhpIbH5AYc
OEMDfo5DYOztJXgMyWMUFhx1pboMhAzerf6rir9mwY8gdAiDZUltdSJGiM8ZJfZk
jRrybD70Ohg6DbFfhL8LvYqtSGltmpFTqSDUrCR5/YMvkQ/Kr9/40+sSHtWZ6eMj
+RdUNK5X++nx7OwPJiXTywobuSuA1UoUaXpfswkfX93Q6I1THpI3NLCW+sgUp2Jp
/pnou9eZBqebQmSlQa8BaNM79V+adg==
=YYaH
-----END PGP SIGNATURE-----

--12JNx3scx4DI/uri--
