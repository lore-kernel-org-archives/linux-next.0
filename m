Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF42F6164;
	Tue,  3 Feb 2026 19:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770146337; cv=none; b=f9oIDXOt0vVSsvd0LSWvdCOjJEZw+Mrd0abN8aEmiAzAsjGP8tWh0Fp6psQHWS6kLjE5E+iJqK+jAz1hHzfD7nWW5mZ3VE5Jb6h/1tPBfR6St1KD3sYq2cPcEXgz2jEHOzni/U1pDO16fHPzQGPV+g2HbVd9W7JA56Hsrh4pj6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770146337; c=relaxed/simple;
	bh=9zmoGa8wsy0XA7wQ9VPuy6nPMExsp9ynOJCXF1WXSeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0hZr/ESPtoIk9a86SJWE0iB+0/seIDZb2xao68YW/80vBEO6MmkKlXIDhbD76mS8R60uaMkCVqiZtNgzwJKRGCooe5CjRLTe4uyULOBJWuxsDmgVuI3j+l3RmZxAt5UyY2ubK1QXkBfNUIS8ksBzzHOZQwCNEqY70nlvWFF0ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGyoX7gO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGyoX7gO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A4AC116D0;
	Tue,  3 Feb 2026 19:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770146337;
	bh=9zmoGa8wsy0XA7wQ9VPuy6nPMExsp9ynOJCXF1WXSeg=;
	h=Date:From:To:Cc:Subject:From;
	b=GGyoX7gO/jw7dckWk2Uv/B8K+N/xPFLPN7IQ1O2sbgM46ykRN/G6uBVBl/pYdvL/n
	 2Mud7MrSSnuHZKPNkN5jIlmGHmXGMaEpuoDxSpfFBNunxzfE9/AeNQhuZJOx3smBKZ
	 jG7IrR/eE55DMQRcvfP5aImFnJ+S1I/4Ye3pua3nNYc2EmP1ubw31VLAudyGoOYwpd
	 1zhL7TPAStCgG9BPofmAHbzm66KIzOtlQTNe4DEtEKrsUoaxoSveRMZt+upWkw9Csj
	 eDLY9PYjEDhlxByRFJhSKUMhzraesDns8SbZILiIVyPa8IIcl7VNfnhTgRybJs32F9
	 DkYlvowiZHNyw==
Date: Tue, 3 Feb 2026 19:18:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 3
Message-ID: <aYJKHbWpzH-ReBAY@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LlQyCzIwCMRJfRn6"
Content-Disposition: inline


--LlQyCzIwCMRJfRn6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260202:

The btrfs-fixes lost it's build failure.

The fsverity tree acquired a semantic conflict with f2fs for which I
applied a patch with corrections from Christoph Hellwig.

The net-next tree acquired a conflict with the net tree.

The drivers-x86 tree acquired a conflict with the hid tree.

The apparmor lost it's build failure.

The random lost it's build failure.

The keys-next tree acquired a conflict with the modules tree.

Non-merge commits (relative to Linus' tree): 10552
 10250 files changed, 587128 insertions(+), 214478 deletions(-)

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

--LlQyCzIwCMRJfRn6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmCSh0ACgkQJNaLcl1U
h9AEiQf9Essg+0h/PINp5eI9JCUlIh+J79v1cdljf7lAvzwXbMY5LhXQ7OHi/6/l
5FpjVdBjdLHl1fWpI7TZGHHM9FDr4ssdz/vJhdQYOGWzeB6qz3eUa6jTA2Ut1BnX
M3PRdhBi1AWY6wHH0kTDUcUTf/ig/2Tl3IaYsl4o0equpV4l459Z4rYFV1Emsa4O
QxoVV3VFmUp79YG89dup7QutWrzaQZyw8l7b/KoQrYcyq3KAVEkOCGm6CbFWDBkW
qmQ6rCPf9T/cHse+GVMdzreausdCj4Ahi9goiiti1hJ8Zv39MSTxoEbNMuuYUG0k
r9cFzIu3dbsFcFkll3DWyCmj0fV6dQ==
=v740
-----END PGP SIGNATURE-----

--LlQyCzIwCMRJfRn6--
