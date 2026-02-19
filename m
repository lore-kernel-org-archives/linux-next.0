Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BE420C463;
	Thu, 19 Feb 2026 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771506283; cv=none; b=IVj62iWJU0CCOL29MVgG4tPPl6wb+Lf8/pC+3ir/YqLCV/KImFT8Yg6GeSlQRzsxwxeQwcT4CYR56HvEdxyMMkhLsSnlWR9pW1tSbKMVwHxoTPzuRHf13V1B8ZW4MqMOzirnifA7bH+uMVcFrxEwt3fTgvuTj0ig+EMrIc8BHoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771506283; c=relaxed/simple;
	bh=baRryKoCOSf2kNGrBL09V+0sNZp1Z1c/GkWivZlRgqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RI8u5RRUmi5gRPVex1MQJgTiqKkdF5DQuWWQ131GtTRzvnVn5lAfbVBK1OaMXEIUN/o6x9fDW6McWF6Wo903k9+YGgxN5v8hsDj16SGr4h02LftCrx4EW/cDqNysYvkR53f4oJaXAjEVFTSK60wpZ/MO88NLXFNsVw9ZudK7fqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/WUa7yZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/WUa7yZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C0AC4CEF7;
	Thu, 19 Feb 2026 13:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771506282;
	bh=baRryKoCOSf2kNGrBL09V+0sNZp1Z1c/GkWivZlRgqI=;
	h=Date:From:To:Cc:Subject:From;
	b=M/WUa7yZIlu0uT93HJ12dkBAhpTxsgnN2YGy602RtoClSriBwPSUPl6QsBVnTNtn7
	 bqLQnnq4P0oXWV47QNQWZAeltf1SwDArvk7b8iosb61wAStjPwmjjzxXRowW4+2fhD
	 xoH8RQURY6x2L7bu/vBav5aHgsTqSTxHMxlS/evLS4tHUllejzsAA1uIlfnQTXlS32
	 yrkaPMO4rzRUIDVOoTrLXlcEp21oDnVyHJ7lRv/4yxY/4O7ykyhpvcoR9IqWBdJKFt
	 utA9D6F6/gj7Lxw00S+flG2YALeUB9IIdNQeh6QdMTZ3esGbeshTeMMlPl55EGRsav
	 9+zJgvVkD3BsQ==
Date: Thu, 19 Feb 2026 13:04:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 19
Message-ID: <aZcKZ3JAd0g0-stZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xQuFnN3GTTHDGAv0"
Content-Disposition: inline


--xQuFnN3GTTHDGAv0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260218:

None.

Non-merge commits (relative to Linus' tree): 1323
 1250 files changed, 38941 insertions(+), 17680 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests, a KUnit build and run on arm64,
and a native build of tools/perf.  After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 405 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--xQuFnN3GTTHDGAv0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmXCmYACgkQJNaLcl1U
h9A0EAf9E6eUlrXfUfCVbUUyfw9sFU5r6qD2MYOsmdd5WNd6LBQ705eLoJ7Ickos
2oCiHEEeSgvTjWbCKt5I0K6GEYZXY5KFiS0+UrlBCO1U2u2JO+TUKToVPDS+cboQ
5i92Z7+QNq0pe4sqVNIX0wSU61h2KCbOXqVwgyvR3ps8ltgKGurUAmfXJr7IlX/P
6PrM/NHyos5WTg7ogQBkEmY1Dyx5lXRbIfFg3AqIYWZLmvYMmzvdlEeq2b6jIeV1
7VNxW1RNmtBAA7u8B4ELEaqEibSrUc2xqSS8ss5lg7hv7PTEeUL/2/sX4ve1qKvb
62s35ZhNMNXFzeP0mfXY1a+WLFSjXg==
=pYXd
-----END PGP SIGNATURE-----

--xQuFnN3GTTHDGAv0--
