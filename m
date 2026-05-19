Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84365369D75;
	Tue, 19 May 2026 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193760; cv=none; b=sJ4o76x1Olg0o+v5bIQGIyXR17Ytqq73oU08ZdK/lex6QO1biWkcHw9YWDA7wWlDwR6w+tY2kg6sRxRrovvsJFN2yXFJns6kK6Mc0SEkjGAdOfjkpWfbS6toUyL6JGS8uErC4QrcWoDDvVg2k0XY8yeXMLRrg0LSGTLylaVOp+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193760; c=relaxed/simple;
	bh=LqgYwNEQFZCArJNYTXXuzgG+mZ2y1CvQgLtAeL/7KyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bpX75tS6Js8FbupPEeV/YgAmGnOdg75nRCo7g2tOkPCS3LUQNFMT+SJiM1pLXCNkKjSKfV6vHyv3JRy/fghd2Kieq/6sSjc1NIwFFUSxgHraLASClh3khOANjwOounzVLbcX7F8gWcbCf/RsllpzZVjwOimZ8+KldY6xQKaNp7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Emfe1DjH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Emfe1DjH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC30C2BCB3;
	Tue, 19 May 2026 12:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779193760;
	bh=LqgYwNEQFZCArJNYTXXuzgG+mZ2y1CvQgLtAeL/7KyI=;
	h=Date:From:To:Cc:Subject:From;
	b=Emfe1DjHTyQDjwvf+t8Wh3OYNVOppKyitqlPXxT1HZcFXL5p4aO/v68+ai6u8YDoU
	 DboQWz+Ji9e8fUNzAfK2YPNRXJakUWqakaB4wllJvMet78c0LmkOn2KeluH1vjJFH5
	 QL5Kzfumzma4M0JVTAzeQ0S28dCQo4PmIO25PXGPNaZL0h0R8Df/3To4Q9AoeFvBan
	 9v+b2BWidbOUNJb+KOJkGnxluAVNU4r+UDz5rB0o7gN6R+goWZUh4EQqXoSHo39FyQ
	 mR5NB7c9hON1Ru9u1za8DWXoqjF7ciJ/KKOVq3RtBZE/3BZDXgIUd+/+O1dkJIFZsl
	 Fa1ZTOVNQle7Q==
Date: Tue, 19 May 2026 13:29:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 19
Message-ID: <agxXnOZDiGmoupoN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="64mwwc8bF3QLxfxX"
Content-Disposition: inline


--64mwwc8bF3QLxfxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260518:

The mm-nonmm-unstable tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 5742
 6536 files changed, 365498 insertions(+), 125143 deletions(-)

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

I am currently merging 423 trees (counting Linus' and 130 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--64mwwc8bF3QLxfxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMV5sACgkQJNaLcl1U
h9COHgf/e+eKRo8ffVbDxw04f+8thdpUGWEmtFAxNQP/+/8t9DS/6ptW1oCremFA
O8Vjjg2NxYU/+KpO7pnAJV9aONYy4rpSP8NPZ2EM7HE+ccD6dMKmIiePFTy+R+rI
ShjScohSujkCEPGGqJwcnL13jmBwkiEFKK1kPK1dO6p248g9cpkec9bxR8x6Rh9q
NOqwHmtexH14/6PD8itrSbBc65QLBP4h+O1tYkbHa+R6qRQMIgBbVRiKibZyvtlH
LZBITrqJvfT3pF3+vX9YZZmyJI3sv7UhcxDPQumceAd6Y7InwvM38J208aoz8rwT
PmTMMf1v4ySOn5b5WG2NRW4PWw9Wng==
=eGST
-----END PGP SIGNATURE-----

--64mwwc8bF3QLxfxX--
