Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518213EDAB3;
	Wed, 15 Jul 2026 15:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130058; cv=none; b=nYHvjBi8jRMeCcGxUIRiQ1ShC/WAiIdYBuA9LYHvPEZh6oJnjNdZ4EJp2HPgBby6hu7Ymv9zrE321scRYbmyF8wLH/08dvyEFrO3oiSG41I3ShvWejrwooRf2UgAna3GBi3syu7P+ZL7mtjHXzyA4hxTJfMtX7p6Gs8GBw9otbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130058; c=relaxed/simple;
	bh=MogxiycHjHqGgmDWTFqJsh0Xg6LaGHBE4Ko9Z21bbes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r0YPuZsS0xKJ2rn5g1WTlybe8MkgSSKPwgOlnPCwNRcJWSVqtkMBBsEGMz20lhQnY3fZaUEtU6UKsbBA+oAxTS2fZTwhKnDqATeX00sr6+5exwQKnmD8gYEZTnKZTHYq12tDfJowu3WWmfRfyMNHjXBcwl1GackoGgsMgDIqH4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EV+hEWcX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EV+hEWcX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C4D1F000E9;
	Wed, 15 Jul 2026 15:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784130056;
	bh=WTI4Kjcq6F/lEQCrVjz5o/t9QBrXaY1MfL1rBVRXZMQ=;
	h=Date:From:To:Cc:Subject;
	b=EV+hEWcXVxng279+jUvbv3p+ZjMiosgpN4OvOl3AoBPOYjEt8zhhDAjn70wBjHQo7
	 xDA5vAPQxlLEQnyg5j4uP3RYPWqlbU0nEMu3c+pxKXTkxXIlm0iA6O9jC94BID+VDF
	 HucH8Ev/PVgoVh1RDPLKlLCbMhZOOwaZZO/eqNtQ5mccXJFkkijz4BRZGYbcgvGCnN
	 KZv/TW4pQ/GXR+bE1aTOAzNuYJXOkyWtU4vB3/EQel1E8WvF6caP5riqjIUOjpRh1u
	 5u5x96OUg7fe0bgnq9gUW6DzWJ33iKGmuRTW9gaWOmw2cmw5rLhUVqu1IJ1Lt5zckn
	 BHcr3YmV6TrCA==
Date: Wed, 15 Jul 2026 16:40:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 15
Message-ID: <aleqBbqu71TFQoPr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3TMX7tlRtunvQx8j"
Content-Disposition: inline


--3TMX7tlRtunvQx8j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260714:

The realtek tree was added.

The jc_docs tree acquired a conflict with the mm-unstable tree.

Non-merge commits (relative to Linus' tree): 6058
 5833 files changed, 245746 insertions(+), 96566 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
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

I am currently merging 429 trees (counting Linus' and 133 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--3TMX7tlRtunvQx8j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXqgUACgkQJNaLcl1U
h9DaVQf/dNHJr2CduRF6gK3vqrgWEN+oztgOUa6LNzT2rfQa74ob2qWIBJ5sPQJD
47V401BgWci4WWWXNppPq3qVesRGkpsH+40z/Ex8+51hOxV9mH8kOF7WKxBALXbj
BHt0qZ5g1qJOEaLy2m0y/q1cedyFyGOOI3iJf9q3OaTWwmNA5yxdP3dr5o1NfmZp
wU4bezOrzKXnBVApQMIK+9mCRVazmZatN+ClJEFfFo86WXT16BssfZCEHLXOHvZP
8poZ+pmL8n21D6q75/t8PRjoc0/4abplDKDaI7i0t7JeLhxoUSpDD9Cn/3zGswHz
0Rw2USGbRpEPqfqexintHVNxIEGH2A==
=74Ao
-----END PGP SIGNATURE-----

--3TMX7tlRtunvQx8j--
