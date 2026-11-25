Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627585;
	b=fYz2St5XVMFxYfPAnggl78a/qfTdwGocu8+EKmm+2fPWnk2FNsL0T2j/ZjazW7vTDswz
	 OT/YMXyFxdpOkxI4sMep7IiSDtV4YqHCd+rZcDaViqDtZpqvDKv5EfYda7mAFDOhUwNOI
	 jmvwjTG+kf4/16HR1bsQfSC9JcMwyUj3r0vPzsFDlvn1Q0+iKO6+Uxf4dVvVD8Y1QcJRv
	 /AdSvhdDciGyiPTJZiRFfvi40BKGaOi8BuNaliaYRmO/rT9ggWH5FksczOaiAtJIwk5Ip
	 J9Alm8jRCxrNhnskRxEh4XzMplvmqRJIsz4KLbEFidYpV3NcPHnc0JrD5Juh0jKEyCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627585;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=J4yNQlVXzhlgxpWW/VWMNk4O1dDGaOKqRdceelW1SIM=;
	b=Qaa69iug9ucvCxXSgOIy5UlHJNo1JsVr/uYvzVWrHLEuo6RQ5Ah+aaTRaUVCGzDICYKp
	 1znbo2QfTmruIdrTp9Zi1U7PKrEXwIJLIkG+Drf28ndHOL6/Hja99FnXbSMpmtrgfosge
	 d6N4SXXErosZoiUlMYlUvpMHihbZ1i9DKGjBcph9GN2oZqFjTiMxRZsTj6hJKATFiaBVS
	 Z17KigRNshFP/0Chmw1G7m2L1Qf2IAf8BKB9j9YcOMBIYlB5NBV1pyqF6NtHB2D8VqOus
	 stchQzmExnYjmVqRDDT1yfLQt6UIEAOJL5jLlZ8mhMM3KhrnUQeRm7p/4gObbrMffpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W5LnpFhP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69F3606A31E;
	Wed, 25 Nov 2026 17:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W5LnpFhP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68511F000C0;
	Wed, 25 Nov 2026 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795627585;
	bh=J4yNQlVXzhlgxpWW/VWMNk4O1dDGaOKqRdceelW1SIM=;
	h=Date:From:To:Cc:Subject;
	b=W5LnpFhPCGHB1CsCfb9bCJyjvppPtQM6CoJTPkJQDwWrpyJv786rS9GbWN+HYXruI
	 1B/RU5DEO6bs/3A5WcgUCYF1Ww7G+9HKM1gtLQt33Z08e6Da7KrsRi36CSJbAv5Ee7
	 CaHPAZSONuKklBTxjDWGIOUyIVWPJbDcoF4p260yfWAfeW1dTKhkwA5bdI/NZKwx9X
	 kHTYAXxEJsHI6z/gTa34pyh9Qwn/2sXkXsAL9XUSSBhmaz/1zleLa5inUcsvwFXrdD
	 LNOUtSDbidvpszj7pJhgTWArZBm+nTE245U5Pz3RdTeXMe/BGF1kib/tKE6PpBbcgL
	 QbBJFBuRRBHzw==
Date: Wed, 25 Nov 2026 17:26:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 25
Message-ID: <awcaPXZ3nWjXDaNO@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="l0UbzjkRN/2SR5yD"
Content-Disposition: inline


--l0UbzjkRN/2SR5yD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261124:

The origin tree acquired a test failure for which I applied a
workaround.

The fs-next tree acquired a conflict with the mm-nonmm-unstable tree.

Non-merge commits (relative to Linus' tree): 10403

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

--l0UbzjkRN/2SR5yD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsHGj0ACgkQJNaLcl1U
h9Brswf9ECh2E+EVqw3R1FgpS+2JiXhsPK/ufE7oUezMUhcNpf8Ryac7b9A9Fpxv
00KPKNSU+9dDOjOXKfnR6Ut7HFZ1ebRHN5MGCXJASeDdjXIzuUFu85TDXmB15FIK
J7ri7caLRXJBKJHw0TUHqbzRfgyJgAbr1vZTEkC6qVGz7KeIWXU2fwFNP5ITrOaV
V8i3yInMRSBLMDBz0fBPpMlto3qdBbVSFdyR9cZz1QzwnvVkoKTS28IA1G9g+Qme
y/f8eWuemgQ045h2A7/Znm1FrltvAolY6sdlU98wXvc5leJ6kwyjs25vqi8cEI3V
0h7wB3KjSmUALoKiPspqRVr9QTxM0g==
=9lZb
-----END PGP SIGNATURE-----

--l0UbzjkRN/2SR5yD--
