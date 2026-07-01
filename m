Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051C21B4224;
	Wed,  1 Jul 2026 15:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782919921; cv=none; b=Y8kCG3b9bnE9zDKjZagSlqTQK4giGya+/qZQ1K6YmT5uH54gmBz6tpY4745niVUpgxl7Oq2aYoFAXmwbb3jMOYK3HpIthWTsSFCCOeqMFOkRu37mpGkYmR6huOvvkxxPqx3Xhbrly3Se6LBGQMTPKrJxCY/9OpJGJ90qPKNXDt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782919921; c=relaxed/simple;
	bh=VnVDHNw7j4keDY4sbuGbBAiwi/xHOHdRlSvihBDUg/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iU2bLhbs8BSgqZestHEucUEYxGTFuTUv0NSzk749HaBoprhfeHvrVaJtPNhCWTk58UIaWzM132FWcbS5hjfXn/tIyUmwM6XwTSCs2sWFnWkmLG4WpQDtorXKa0U1/taZlqwH6+LDtAhP2NQQMK45KJOVusEbJDLQdKj3nWGusB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ni+Qs51z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ni+Qs51z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004991F00A3A;
	Wed,  1 Jul 2026 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782919919;
	bh=ILDuhF2/TCi9i+Mf1vK77UoJfzV++Z+KRJdnH3lSol4=;
	h=Date:From:To:Cc:Subject;
	b=ni+Qs51zMdalWptm1nIV6O6YU+QBZmkhzVJZ1NAw0ryV8aVns5pR5TdMAszEqBdDQ
	 zmXqEhQnkGON0qV28AuYlVl98+NjcOXTqRGLfpoTzQgy74fxG2rDgz6/Y4ICUrV3By
	 qXKJEZpuNgC3wuCF7fW5eFUIL/xFJN5miHWAwKaeXfFfTdwF2x7i6eKoCZX/WZHOKo
	 tMJkCoDyIOoQ+llPX+hTw3pyTfWuuC9u0oqz0g9Si3yXJ7+318CFAOq3FXsK+Zk+hu
	 MonnKIGjJFtv9YHddn6c+SN0McwFPURbaYnOQx0bHNHbKJKjvT2UNKIenrIRfRptKU
	 IESLnI4KYgHtQ==
Date: Wed, 1 Jul 2026 16:31:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 1
Message-ID: <akUy7LtqQjWOL4oU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sTnjA/WUtRvydUSl"
Content-Disposition: inline


--sTnjA/WUtRvydUSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260630:

The pinctrl-qcom and pinctrl-qcom-fixes trees were added.

The device-id tree acquired a conflict with the gpio tree.

Non-merge commits (relative to Linus' tree): 2204
 3860 files changed, 83925 insertions(+), 35044 deletions(-)

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

--sTnjA/WUtRvydUSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFMusACgkQJNaLcl1U
h9Ccpgf/ZnxUpet5hzly9KqLZw6e9cs54mU/9YYOXv7Amty2oBGuh/Uw8dL2Tso2
WqFE1pzHRlQ/Jat/FpytsRfZOUUgoo4t0M00B3irgp2fxaDKvs6+P+BAcm148c0v
glE76OzEJBwahE6PzdJmK0IZIxg61E52aBhiBBJyyE5v//0TxVWvezIbxTtAhMiv
ph+kMf0VSrffcAnd2l1ox80p3E65kbehiczAAm1uoVdjZEawdGUzECpeATtbHIET
CwBaLn5HjQNZJbYgt2qCrhIfWhB7dwYb/FRy/iYe1S282sxqliFJzldhlhZI6i1M
TXv3BRLScqrr5kSEXYLhwkUQTE735Q==
=CevA
-----END PGP SIGNATURE-----

--sTnjA/WUtRvydUSl--
