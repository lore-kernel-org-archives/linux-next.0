Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDF43F44EF;
	Thu,  4 Jun 2026 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590105; cv=none; b=XfN0eDm842fRHZ03GT/2MpeLim9Aav8xqF+rziuNxKzgnUeioL9X3eBnhniHUSN/lSnT1u72ubMqX+k9fxJS9LFcmqCaqo72pXWibOorRBy7+jwdmAPDR/3uw2al15BRaxj6TiLeh+fprPaPoP7uuTAMaIFxjixxyWnrX5pmx1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590105; c=relaxed/simple;
	bh=4SZMZUBqlOo/o+ITciW10bMTm0nbJ6IH1F+tdrb88uE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ag1kaUOvK2S4h6RGLqlZsu/rfnWFiXjPl/7RRL6Hvn13LT4mf3DAL0NwLwZggKUi/pnqIzkn9ozwUHisbTQ1bcJhzDVAUuXzM539L5k+NSnGbDyJ3j8qltmK33eP4WU8FpAdDsEo+BA6ZkzaY5cm80sQy6gWJsGW9p3gEvOK+xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ol+YL4Hb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ol+YL4Hb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB241F00893;
	Thu,  4 Jun 2026 16:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780590104;
	bh=nIcYlwzMKvB+SvxKmXFAZ/k8HAH0szd3ICx/kz/5jBI=;
	h=Date:From:To:Cc:Subject;
	b=Ol+YL4Hb9/Mi1I2Pmk+UwycyGds42LLG3lgZJQVt5AIasNEDOAUn688XWD1zzyEZy
	 VyCylTPihT/RRQLOfOaadaF6SVCNOfwb1JQY5KGif6OAVTmxbqH+eLbYtxEKYUAaFB
	 wrt2Gyzm66e8dZYIGlTWeohsFTyCJMs9D7a+wHNkaVe85F65FKLzNIwdZfpRJG0y8t
	 Qbyt4iJOO46aMttv3517iHuhHol7kuZsH1F1aZ7+AY2a3Y63xUtHEh1imf0Tpm0i5d
	 kmrETaFZbpVj2SIfxe6ADajhEphqHgU6huW47LG3nha1cXsEUV2WT1u6OQ3U4pDtIK
	 6lI7barCLFNmA==
Date: Thu, 4 Jun 2026 17:21:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 4
Message-ID: <aiGmE0u8l-TYUbDt@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yelpy4K9uLWVfAPj"
Content-Disposition: inline


--Yelpy4K9uLWVfAPj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260603:

The mm-unstable tree lost it's build failure.

The arm64 tree acquired a conflict with the origin tree.

The arm64 tree lost it's KUnit failure.

The bpf-next tree acquired a conflict with the vfs-brauner tree.

The bluetooth tree acquired a conflict with the net tree.

The drm tree acquired a conflict with the origin tree.

The sound tree acquired a build failure, I used the version from
next-20260603 instead.

Non-merge commits (relative to Linus' tree): 10326
 11145 files changed, 680782 insertions(+), 212804 deletions(-)

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

I am currently merging 423 trees (counting Linus' and 130 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--Yelpy4K9uLWVfAPj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmohphIACgkQJNaLcl1U
h9DAmgf8CR2fuCMe/B7/u3u+HgLIBzztdlW4EATM36GjE0vhspJ7/aCXaAd+ZbPp
AALcqp1Ot05yH11dXYW53cJ9d28qmQxx6gPLtFj0Jg4vNxFhtGxRqe1hK1LM8iVB
qJUeJz6lHpmDPnA1F4wijWTSa6dwV20mLiXpVOGM3clIUoc7kfUvdTboY7x2FpKg
/q9wjzW1tnd1EcK4KaK/T5a7uGBnEaiJszab4zmCPFwfN7CBZtr2hcK/Ctgxdob0
3xssrwZdZ+a0X2z5h0ha6lTN9fxinaVn/SEBDoEk1N0V02O0+XQ4yU6kcLWZFc10
Tc8cJ+cE/7dTC7vlp8YLIqorNkCDzw==
=1A7W
-----END PGP SIGNATURE-----

--Yelpy4K9uLWVfAPj--
