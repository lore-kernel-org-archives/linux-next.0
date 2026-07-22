Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1D84749F6;
	Wed, 22 Jul 2026 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735975; cv=none; b=mugenUkp50PJnQbUGLX/3ys0JGs00CliChZtkF3yoqEHuCuw1PsL/JIAtV0kTbQ4oSJRIayHTqSrw6kyGSwBbpuPIp+R63QLT7knwTIQ58Jo91WuBbj+QNkpqL6xzT1TMFACXEOuiMY/8J249YzBZwh43nTUO51/suQuY2YAJqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735975; c=relaxed/simple;
	bh=s6OHar9BygFw8/6EoaPner6oWB3bIH9zBdZFe4bzt/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ReAvuGaSfNLGtVHXHEkkTr8elyw0nGEhrlFB1Z+h0R0o+5z2XWguZ8p0en/UI68Ncf19+eCXPbFZRf/OoOBMeCUFV4ieZjsWuREOpOX/BA9TR9z46ScqE1o0WyupwVFlZYC/+sLFQlux8BeOcC2sN+XO1X7X4eN3N+RCUrzCOk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvHL3tFu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvHL3tFu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178C31F000E9;
	Wed, 22 Jul 2026 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784735972;
	bh=mg/H6XrXcjjae19KI9SYNsQAVPqkUvCpSg+dfPzmgg0=;
	h=Date:From:To:Cc:Subject;
	b=HvHL3tFu2Xa5Z3hQcidZSQCegOemX8UaxXh56NLAJSt+OTbIJsaFRvKRJpmp8wRaP
	 L5DGjDwdUSLTlgQJpupxv3OCevptfD+NvwT3c9c79MJZyGM13qsEq5lLcVpgsbC1Ee
	 5b6wZESyD9IDuLBInq2vql5n8dBP4N3QHjm+wSxLvSl/K7AYyohIISAwFPbzOL4J+W
	 IxNkNm9zRum3hU0Xh9NlMrbxjo88tWMCUo9syqbv7u9E8cyWq+zuS+ujv/dyCxZSp8
	 O9KgI4qj0PK3RdD2kIpr6jsGGsEe2TYmq228fkyO7YRXy68A8OFfR5QNGD1Po/yrGk
	 OjFGC5FltN+Tg==
Date: Wed, 22 Jul 2026 16:59:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 22
Message-ID: <amDo4dYWLIlKVIfr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="edGRXu07NtJ7bFEx"
Content-Disposition: inline


--edGRXu07NtJ7bFEx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260721:

The wireless-next tree acquired a conflict with the origin tree, and
also a semantic conflict for which I applied a fix.

The drm-misc tree lost it's build failure.

The drm-xe tree acquired a conflict with the origin tree.

The battery tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 7761
 7440 files changed, 361298 insertions(+), 115875 deletions(-)

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

--edGRXu07NtJ7bFEx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpg6OAACgkQJNaLcl1U
h9D8aAf+K+7INdc3Ug20CE6hY0hCT/neRSxABSlGW0vWMobXCa04poqELdZF43K3
oezoWeux1+GhiIOysO/CB3PoUgvGejia+xtiRFUh/He2X7wV5jobLF/7hdLBW9S9
Q/X9AsQ7mDX6B+V6BII7cgrI17aeFhEDe41hApaGbJ6GNT6joNKWj+IYHx+Muk6F
8mBwGueZgO7Wd64m6PplevZ0JjjlzZnTSJu57aEXnpSXxEo4fG1MYD+GchBr5qEg
9ZK+qYfMwIKOQyyaspoUTz7RVHMVBqTf3QCvz9HsgUK6gJGlWYaBpAAKHWnipVZA
n8wSpZX5Uk8RpotpG3xQEcsBOI23qQ==
=d/VC
-----END PGP SIGNATURE-----

--edGRXu07NtJ7bFEx--
