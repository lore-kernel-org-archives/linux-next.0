Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547141;
	b=Pes9sNyo3FAMmA/WCIcI8fyiHoFxfpeeGNbIPE54sTJoe7iQwnpXFYLPHYttuOdrc2Ok
	 0r3xmaQ205T9peOefYXIjbe/44jaHsHKUnubil/11YV/g6s0+2YLaKR5ass+gK4Yub5hn
	 xU1rm4Gsf1a7PWAZZVEdgpDjGuQDBo3CEczNnptzNsKH8QAyz3JLqQnnpnLUI0yl6MSPX
	 91stYMRl6rqhQxAj0VQih/xIoO/d4RCx1JmXPgmz5u8LmCyGvjqC20Lyx1xZM4dnhYMv3
	 Msct4sK7/u/p4wC3sulgNhxscM8YxUl9v+3Te50AxrkyMG4F0t65uGhJC3Hpg4yI97A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547141;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=GtulHr0w3fG6K3m+mxAlOwW0vuCnDX034p9HwMk5/eI=;
	b=WLfb5oJOmMAPfjLq66Nb6vf9GMJ00EfdWBDse/HFTukJQ3gURAQBCx+yWP1lzmE+MZrI
	 RhOr4Xr0af3IYc8iAH4yzvZoD+67SEbfuvPEJGrKYvEptiwi9S+hjNgocPgL2MOFhs2so
	 fUBGUuJvGz2w6DRSWP6TRWUK6wFry2cD8ONwo5EZRgxbmKsvgrqmzFAxd4rYj0gLygrQ/
	 4Vh7CJCGtuCZtsVnxdL94rcblAuKPA6cyU+6UWbscBavo1sH6ab7uPwI8GbM+xOsThc8N
	 Y1QQeIF5AosAc3w5FNFki+iVoOmUf/OzYEDxW+bWxaMw87cgk8ng0GgcE/Jxb9Xcs6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Sl6nrh9/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADD3606A326;
	Tue, 24 Nov 2026 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sl6nrh9/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370D51F00AD3;
	Tue, 24 Nov 2026 19:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795547140;
	bh=GtulHr0w3fG6K3m+mxAlOwW0vuCnDX034p9HwMk5/eI=;
	h=Date:From:To:Cc:Subject;
	b=Sl6nrh9/a8lTN6ndK0CGkLTz84o5cqQJJeSQV+cr1LuPQB/KvbCvu5j6Z0ZTq9WaM
	 cKpHvwGSo4GgXUejWSuURS9+vZH6CbdwEr4LhEK8yYEfMJ3Tx2s/bNAQlVnHoka2/V
	 w1r2G0PiyvD6T5Exd8z4WQ/pzUvD11LfE3uLbbGATSbTBeYvKTyIbYAykXzgHDMj8P
	 PR1Knm1Fuwa4ytwjmKVZ5IDcHd/UGLV2hlhin9S55rn0X6WJ3dCjFl+iCHN6+AeM5n
	 OIE+sY7vjpd87jw2uyLLOlGS1eWRnLSfjb6L60pcXWRc7MTbaM0mSWBdRa6Rtjzoqu
	 y/KmRJO8MnJPQ==
Date: Tue, 24 Nov 2026 19:05:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 24
Message-ID: <awXgAXbCifHSkVSC@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="uuiXkU4zfEV7gib+"
Content-Disposition: inline


--uuiXkU4zfEV7gib+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261123:

The ext4 tree acquired a conflict with the origin tree.

The bluetooth tree acquired a conflict with the origin tree.

The drm-misc tree acquired a conflict with the net-next tree.

The drm-intel tree acquired a conflict with the origin tree.

The tip tree acquired a conflict with the pm tree.

The net-next tree acquired a semantic conflict with the net tree.

The kvm-arm tree acquired a conflict with the kvm-arm-fixes tree.

The tip and pm trees acquired a semantic conflict.

The drm-misc and broadcom trees acquired a semantic conflict.

The usb tree acquired a conflict with the devictree tree.

Non-merge commits (relative to Linus' tree): 10149


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

--uuiXkU4zfEV7gib+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsF4AAACgkQJNaLcl1U
h9DK6Af/VcCiDP5FwWcUXo1e0sjgChwGzJaCpoO8yIjJHqZD/5y1mwrhIOJnOYug
Wkr18P3GZXR0CxPoxMUgw95SRHCXqygfqmYjbL1R5HroswRa51+39pTN4/4T/fH7
XBI09MwHGYA4T7aFHh5431re9pn2tlqtgCjowydZ6I99TvHHAGQpOgG8b8lKyuhd
ohSwdqgbMi0ra37NJCEpLUsX/fyMJy0KKW9dwCVN9eR497WEVEL0WFZqG54nsQiR
1QIB+ezNzbA9185QzKvEeGxxo6I9Q5ll970tDHAMlzzf6+nmyWMnM235lRVsmSNU
JX34h/kPSnUeu/PQi7mOeiE6RBm7pQ==
=B1Oc
-----END PGP SIGNATURE-----

--uuiXkU4zfEV7gib+--
