Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D1C2609C5;
	Tue, 21 Apr 2026 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782878; cv=none; b=DgyLEe14WpZ89ki6NfB0fqR2HqHvxm6mCkULWaLw89bmyAgeKjF6vx8obFkrf6Fh2izoJlvrtnrJK4VTyHWOP0L6ghhFbuaYugEFMbvGxh5KJjDz3+ty905Uc/oGSyCm1ED0TFPV6dF+EOe1P/DlM4GtejpQqnblBR18Z+fg+JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782878; c=relaxed/simple;
	bh=PHVDKFOSheMKw9fPQmk8n1NOLtBT8myXhQuMzEcaylc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u+Eyt2ZQrj4ZQPQ6lYnknLpmAt3knyeHu9YTy6cJQUunSy5XWioAhi9hMg1gL9IvjLE5C1LN8+9sF4smzA59Sk61ok4nfSJTtETUjs6rncc1zlYUrZ+anhrXw9uz1180cAYqI2YYkxzvnhbsVqko/Y3p/cbxqRGiak4XxFC4YKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGBLj2vo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGBLj2vo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA09DC2BCB0;
	Tue, 21 Apr 2026 14:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776782878;
	bh=PHVDKFOSheMKw9fPQmk8n1NOLtBT8myXhQuMzEcaylc=;
	h=Date:From:To:Cc:Subject:From;
	b=WGBLj2voKUPQWLHgZV+6ils9DgExmOQM+WK02Hjlsin39Z0ias/Bo3npvFuJgc/jL
	 t3sns1bL2QHRYUyHv/0ldVU4eQm3/U346+7odaTPKbAwUXnAESrSMujuQJOC8HmhYI
	 sIG4kW/7y8uI/QGoNe25utLJeZqFAT8kH5HCx98CaaJsXom9gl+rWBCIBd2zTpdYyX
	 mcNhJnY2Uhtn0HRuXWxF1w0VHBNy/HsZR2C8uiIRRvUF5GwmBE3m/ltYsVdpHYXgtr
	 jF1iy5zekv9fOLMyoLBtc4KsZkEQstv72xIiQ01v1Q0iVDtZwwOTnXbZXc9S/qpoLp
	 RvRylb9kwHoiA==
Date: Tue, 21 Apr 2026 15:47:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 21
Message-ID: <aeeOG1nbNZnx3as-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qA5kG9uLm71TFPB/"
Content-Disposition: inline


--qA5kG9uLm71TFPB/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

The merge window is open, so please to not addd any v7.1) material
to your linux-next included branches until after the merge window closes.

I will be on holiday from 25th April to 15th May, Thierry Reding has
generously volunteered to provide some cover in that period.

Changes since 20260420:

The mm-hotfixes tree acquired a build failure, I used the version
=66rom next-20260420 instead.

The mm-unstable tree acquired a build failure, I used the version from
next-20260420 instead.

The mm-nonmm-unstable tree acquired a build failure, I used the version
=66rom next-20260420 instead.

Non-merge commits (relative to Linus' tree): 1792
 2001 files changed, 64261 insertions(+), 29119 deletions(-)

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

I am currently merging 419 trees (counting Linus' and 128 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--qA5kG9uLm71TFPB/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnnjhoACgkQJNaLcl1U
h9CtDAf/YTyb9KOFH78DSnZ8VdmLXJbgP81zIpy4kWmj7JsGHlNWpZv8mzltjhK5
lqLgB4T1c1TheCnK16kU4Sbcu83BcUQELVHaJwyD4zghJ0U4wFIk09kmTYxTNrM5
4Jno8NQ16Q8+Muo9e852/VL8BYKXW8UnG/g4yzuNcP6fGu2Oa0xLT72JfB97whpE
oHcPK0qFgqQmqKFLTejhU4r4FSRBBb2d/Bx0+M8r6YaqLE+rOqj1YTs9EuNehtPz
JyelpXmNhdsJXndikCmM37Zgf5BYe5wwAMO4bytYHlBNi4dij7NqdaIndQRNAvfT
ZHxkmSEszDb5l9BTE1eXlqVpfDDLcQ==
=3b5l
-----END PGP SIGNATURE-----

--qA5kG9uLm71TFPB/--
