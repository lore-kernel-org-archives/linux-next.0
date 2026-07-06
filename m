Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD963B14A5;
	Mon,  6 Jul 2026 18:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362905; cv=none; b=ZB/GVFfv7/hSae0iZmIZXTtJ/vWFSUTsz9mw5fbCXirAoi9VTY6Moom2ZeekJZmRS5MSQBqRQFPG1LRpYiBtax2GaS+v5jTbiYVpHAhQKARb5/U3UMt9PSZMeSabo9ph8Mu78d3p49gIx1GJJurmDWtRB65myGeK42ky2zqQcqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362905; c=relaxed/simple;
	bh=RXyYNiHRQq9sBk0b477bIEK+k5O10fvNaUlk3a57k9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tI77FAWJ3QrGpPFmOUZ/OuByob081p7e4cd1pSxmpIQxhtnU/kionC8pbP8bpyC60GvXgtn4HgZ7w3X4765bIt8VZ2quJMdPXSMU3P34KxCWL1j9aUeGiWclkJIEpNqbcuejIDtqNOlBIoZR8HKw89tUU3c9mfYmhgfSc+2RaR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cImYzigX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cImYzigX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693631F000E9;
	Mon,  6 Jul 2026 18:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783362904;
	bh=fmcsef6/gFgypv7UTFv8EeED3PaNT3ij47pXebunIhs=;
	h=Date:From:To:Cc:Subject;
	b=cImYzigX0yOtLRFPXNrnjS/GWvslC6hj059yCd1vijpDd7bZNBhwXjhoN/3KaMFyK
	 LAgl5MZz1bzmaEXt1Y/jiphVFWr/fYn9C8+OXuFyQ6lUFNGYLHwRxN8o5xwjVPpkc/
	 I+Pw+gCNZq5r0UWdptFo3kVEX5tKLn2qZGROl8gDX3VR8TPt6wLdc59nUgOydQexUN
	 JqXiqJ0+aB7JApbA4BRlZMM7Lim6Ps2DH7Ya+tLJddbu8E+ovX6aXRlfhD5SjGehsD
	 DIiOGLDA1DM88yR5NiRY+wiKTB34uCJbdnMmLb2PDO6s8+maG6t/cP+3EZg9ZmoTtw
	 NABtDOs6cBkSA==
Date: Mon, 6 Jul 2026 19:35:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 6
Message-ID: <akv1VBsvPLUqf9ar@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lzSDdDcfrBgvI+Mr"
Content-Disposition: inline


--lzSDdDcfrBgvI+Mr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260703:

The ext3 tree acquired a build failure, I used the version from
next-20260603 instead.

The mm-nonmm-unstable tree lost it's build failure.

The net-next tree acquired a conflict with the net tree.

The wireless tree acquired a build failure in the final build which I
ignored.

Non-merge commits (relative to Linus' tree): 3372
 3537 files changed, 159837 insertions(+), 65637 deletions(-)

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

I am currently merging 427 trees (counting Linus' and 132 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--lzSDdDcfrBgvI+Mr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpL9VMACgkQJNaLcl1U
h9DtoAf+I2T66VG/tnnYL1TFnPyN5tQL01un2w4hfFb55EBgBs9KLve1kuE+CsIW
F2hQMplrEoh6z7uLFp7SrCjQ/nx+AuVgC2lChrFCghGK4Xmlj/LVWdVBCmYsWLze
2vY+dWq427YExhlJwg9tQvxX16PItpwSJ1ATSKhLOdjhbuaesJg5JnEiPNKaGYKP
CoqoKqBzlAC5eHRFQk06m15lxh9Wr7HYU93VL2bgMSRYooN2y3w0fdPg4qV3Y//m
n7X398kAnorQuhSaTI53ybsRczVqNzI4Zg+maLsPh2bRjwrTw8s05gYB3delWOE1
6P2BonWhVOpnhWV+X9gGwNX+NkmICw==
=6Vio
-----END PGP SIGNATURE-----

--lzSDdDcfrBgvI+Mr--
