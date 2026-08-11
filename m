Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE72A3C061C;
	Tue, 11 Aug 2026 16:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464434; cv=none; b=FSUBF7XvfkwWXVnjK9fEWGc7pwfhranBLMtDw6RFt0WaE7KJGMxUd5LoFMy6BPi3GReCiKcst61+dNohrPgf/Z+Nm/BjIAMR3CSjIEBqzdMCdJ6QcrJLgRB57maOWifZopU1TSuzLZOnBsH69ET9Otn+o9jWuvSTCW7Z8pfjb/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464434; c=relaxed/simple;
	bh=11Y/jrsozTdvm3iAmC8W9+SYjcbEhQwEWuVJNuH58kY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eUVnyZzVF8n0g83HjpV6TatF15uv/Qcc7jUKVP3+d82ae8JsxoqxbjFIfG0/2vsv7x3Uptfv0KGH90aZjkRTh0ymbXEWdSFHjV5IFwI2TyUiicKPm1YZjbZGpXy9oDMCb7Oz/qC5bkqHcKMWKc1rLpoOlyk2qUAA5h+JspbXZvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZJQGYEw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZJQGYEw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F7E1F000E9;
	Tue, 11 Aug 2026 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786464432;
	bh=2ly7dI66T9AVphi0DFBezzIKsk/zL1s8EwWEn6ty5Bw=;
	h=Date:From:To:Cc:Subject;
	b=NZJQGYEwfapoYMobMfNSzvAy6yE83v54bObnf7obX7sv7uOnQy8vu96TNaI6+qD+P
	 nadd7mS/fz2ic2CO75utkPq9LxTJ6Yw+evBWN5o45gCIDXT/FiD4NjPEYDwwQu9ZxB
	 VanfaaCnQ/vO0GukeF34qEEBqJHGqUf3ou5eyTkf/T0J0BUanGZ6dVO83GdAAFuDlq
	 zlNsd0zCKAQC39yLUMmyO5shOOZ7IXPf09NZJhwfa0uS9bc/CuooQLEt3b9w3Gnz/u
	 QOqpeIQdoZy8uslERLL3HWzhVpQxsgQTp37eo7aa6LbUw5Z0APJJy/W6Ytz9A5RRaN
	 Ii319XwkyZz0A==
Date: Tue, 11 Aug 2026 17:07:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 11
Message-ID: <antIrd2ds2OiEsl5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="htiKIZdmoFUbkdLh"
Content-Disposition: inline


--htiKIZdmoFUbkdLh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260810:

The f2fs tree acquired a build failure, I used the version from
next-20260810 instead.

The thermal tree lost it's build failure.

The kvm-arm tree acquired a conflict with the powerpc tree.

The char-misc tree acquired a conflict with the rust tree.

The pwm tree acquired a conflict with the rust tree.

Non-merge commits (relative to Linus' tree): 13196
 11613 files changed, 638650 insertions(+), 206468 deletions(-)

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

--htiKIZdmoFUbkdLh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7SKwACgkQJNaLcl1U
h9ASxwf/fN6eMQLacJ4/F+D1ZYzpvIqglkJ/HFPEMWpl00iVF0mOQurCU2FAaP6q
e9s4jXsFIVFFG9Nda8BNK7fTkDyUpABDIF8Zr4dlN92IFUh29wmdehYCRePATcry
DZiSPPnUYqLgIs56tw5I3koaGaUiL4WJn9sfrlVaD5vAhMSI0k/a2i01WLeQ13N0
ULxbbXPl7XQ/5XvC4KU5YRGBK0uDSeqdEs3V09j03XR6SaQ+X8ej04MoM711n1aK
I0F/U9GNROY1YxubNPKI5Usi7hx63TgFvNS+b02pvh6EGE4oeKL5Yr0tVy2j6ISa
5CLDJKZA3NrjxSgzNkoER0yxq/H95Q==
=R3uu
-----END PGP SIGNATURE-----

--htiKIZdmoFUbkdLh--
