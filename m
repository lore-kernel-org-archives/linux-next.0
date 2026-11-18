Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025780;
	b=xGaes7kd/RlQkRz/rLw8AjC65GPvS7DvWDeNREA7VdieXGRWx7bkLuPK6Vr7qqvlvRtD
	 YcVVp+MwfiX4iEDh0InTL6QGfo9yjNjZ1vUzeLrI+do1G/CzthFRRoceypMnGWmOiGpI7
	 hkoAocZyqnnGc3Fzlztu7mABjmjOtpPzGOxjEieIkBMXaUXHVu/B0z3QRtK/F2hAdB9ki
	 QS/6y9w3bZrPzu8PZ+8vYCa7MkAGKsZs+Vry9Z7pPXJ4kstL6PHKC3e5qDUbssR61oj7v
	 mT0WQO8ZOHRMJzAMLZXMQ5TxS8L2uawWENWFWJCaMrfjxeiLKXQWZkrb/7e1z+iX/Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025780;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=behdxxIhEiSENJYsqx4ifG9z0wTQvPIFuvU2aESMuPQ=;
	b=uyYNP0oLSyZBsCJYKrFYoEKT0KNmn/CzPJljsCcT0Mt7rctFwEKwVPOquynMjjmLBg5I
	 7HwNTUwq21ICxjrb36p63dZ79UzTCAol30FlbZ63RSODSj1vvIzzMCpK/MxZBflGowI93
	 Yz9XvrqYXciAoWne0iCfA7q2fr8mzbGKUZvt65NbIQ/PAfRImOOzHl+/fYGvrm1+V6obh
	 FBKzTN9eIJMWd4CCD1aLXabhnywAcMMBjnhOEtAS9r2mRArNFw/3PYzMy+H4rod5iyKsb
	 /XDEknwTDfJRTuYkDkRZDOG6IdsXC2Fc//8yO87TeSuqaNtujBj8EscIHVvECnr/w6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCzQlr14;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F90606A31C;
	Wed, 18 Nov 2026 18:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCzQlr14
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FB81F000C5;
	Wed, 18 Nov 2026 18:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025779;
	bh=behdxxIhEiSENJYsqx4ifG9z0wTQvPIFuvU2aESMuPQ=;
	h=Date:From:To:Cc:Subject;
	b=SCzQlr14SWLLqQJRk20BaqOnsWFbl8KD/KogyuqhPYn4yONC0ddW5DKOUfAAWnMy7
	 6EkA0qMsXsXP1B+dWBKB/azNY9RKTl5SIjXd4g8mn2kSSMHbjLTdhXJAGzRqPr3Dhm
	 USr9unqk9jI5NFJWq+0kKss6pP9P6FA/aK184ItQcMwg0wdzNvn9eq0BISxEkbVZHP
	 zPt6PUXIr0nJ4u6HqwrsKAg7lA0yHOjVj4NVmJFZ0M7+AtjIwLq8pZFzP08WVAqx7s
	 jkfnvpoL1la9STRMTqFbYrpeiPiHocrj8+bEDUWCnbjVwFCcZvukO6hT5UrchknDGf
	 sSkF62F24G8cQ==
Date: Wed, 18 Nov 2026 18:16:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 18
Message-ID: <av3rcAAUdgmAFcaR@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VeRV1/4D3wKsFB5L"
Content-Disposition: inline


--VeRV1/4D3wKsFB5L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261117:

The exfat tree acquired multiple conflicts with the origin tree.

The vfs-brauner tree acquired a conflict with the exfat tree.

The scsi-fixes tree acquired a conflict with the origin tree.

The mtd tree acquired a conflict with the origin tree.

The crypto tree acquired a conflict with the mips tree.

The drm tree acquired a conflict with the drm-misc-fixes tree.

The block tree acquired a conflict with the vfs-brauner tree.

The scsi-mkp tree acquired a conflict with the scsi-fixes tree.

Non-merge commits (relative to Linus' tree): 7966


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

I am currently merging 438 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--VeRV1/4D3wKsFB5L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr963AACgkQJNaLcl1U
h9CFJgf+NGzQWHqKDxu9wfRQ+DwyQ/Nc29KRTil5u2KRQv8pIiWlx8oNFDwJ2dP1
Lt+Nle/bpug/WKJtUETxVs6fzFwJPBVtnMQ+yZx8hg+adEPTuqQIKeeQUZTz6KIi
r6ZqWu/o/no3Il27F1dDuy9c3YrCkSEAW8zzbH9oHvLX/J/CtiY6gS+nXAtXKKu2
Fe0+UBiiDITyNcJutcQ6wkhakvNQyeF7eD6+3uxgJxPucwM8OstQCPNb3aKLXKoK
5/AZtZVcgcJX+zfv9+6KO+GMdaNb5k9ohAoqFXSLK80fzmh3qY4kFfZhpHNkIkk8
Tv0hgU8aoDFkgoJWvuwDEgJK17NsiQ==
=pTzM
-----END PGP SIGNATURE-----

--VeRV1/4D3wKsFB5L--
