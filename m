Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9391B463B6C;
	Mon, 17 Aug 2026 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786986649; cv=none; b=ZEGqOb3fkZFHR2P7tCh/tOQGdVAdBWNuGIBjfhuybXeuNIb5U2H7F15SCrJFJGAu8Ha1ee828MEuhxw5QU8LZPis2+H4PXivUyTY8LTdlaNlYagtSIjLkPtQdtjRHkyDHtOWa8zgII0mAx/VhXcKdp76P9HMV19sf/Ra900Ne0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786986649; c=relaxed/simple;
	bh=sPsm6iyF4FXkHFEBsF7XCZirPFPHuy7iRNlg9k71gc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BfI593pVSU2x6dz0IQx/mdb+OgZGnPn4Nm9B3Hw8Le+s7mv0oqlulrIq+kPLRbe/DPe4ErWJaXhbUq4REZiY6eGuy49+DlumWxui7aK+tllEMXcnkwQ2Boz8J/LEgEqLBr5YzrG0P160JEsU6kKiYhdnU32Fkj0JzA8maeQxyos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNTd2spZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNTd2spZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7224F1F000E9;
	Mon, 17 Aug 2026 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786986648;
	bh=AAg1PFaxS+ZHc0nWuRHGt/wftHzCNpBXbfK6V3xrzxo=;
	h=Date:From:To:Cc:Subject;
	b=KNTd2spZz0h8VezhpYsRsGTljd7JRFeeZ4hobCTS/onc7HrDMKQgZKrgUhRWYI49F
	 844r3LRfIeii4N5h8updmS5ziLfKL3aYGrBVvTZGNXxquwz8Xe4oPnHoumC1UEypC7
	 4wqxRM/RmR2FpGQFB5hZT+Ld3wmtU1Nfmk7sGlCipYvCQvRTw5hJHlE0z8mqCtYJLy
	 9swBmzeuYUG0f0KW9s2/zzPcNbWA/An7fLDhLi4qWSqkF2iz1mFgJSVBucSiDbcNZ1
	 EmQuMAHZmTqBO4+xVWm+VvTk++CGhG7K22Oxd9/Mtn/hJfVGAsI79sCM/SlJuiKczq
	 eBSy7eVuDYGsw==
Date: Mon, 17 Aug 2026 18:10:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 17
Message-ID: <aoNAlJOO3ypV8ma_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ICqvgAGqYiHB688"
Content-Disposition: inline


--4ICqvgAGqYiHB688
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260814:

The net-next tree acquired a conflict with the origin tree.

The clk tree acquired a build failure, I used the tree from
next-20260814 instead.

The drm tree acquired a conflict with the origin tree.

The drm tree lost it's build failure.

The fbdev tree lost it's build failure.

The driver-core tree acquired a conflict with the pm tree.

The driver-core tree acquired a conflict with the drm tree.

The kunit tree acquired a conflict with the spi tree.

Non-merge commits (relative to Linus' tree): 14621
 12628 files changed, 859191 insertions(+), 259750 deletions(-)

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

--4ICqvgAGqYiHB688
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDQJQACgkQJNaLcl1U
h9DUhQf9Fvo5w/bmbFjHCcx76fn9zJPzHlED6QL3D++jqjDfOsrf3UwXknVsdyJ3
KrfY947Nemydfeiv5RQCJ1KQZlJa1K6h0Q1ay1sdIoFdwVN8L29jStFODfxnCv2a
imcIuR8Qbj782AxCtZhSauS9IGfOps3cIzwBony1smwYCjuUPKW1PMP8lFvB+kjV
WMwfM0kFrKb36UXqfQDifyidUYVzv+5NxF+bB98F1JD8kmVvBGHpuUF56bZvjBlT
LS+2jJgD0M96j/2+A7Gx+THr52vcIhKhWBYCgu0+sGhRQSULlVsuPE0HrDJDNBYm
diEPhW6gkH6brunqyx+smJeQHyn4Nw==
=JNCq
-----END PGP SIGNATURE-----

--4ICqvgAGqYiHB688--
