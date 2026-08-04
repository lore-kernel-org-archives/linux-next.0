Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C98C3E315F;
	Tue,  4 Aug 2026 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848418; cv=none; b=KUsqo2SUJb4FNiv5EyXOZnfhw//7BQEyiTnxcQXrqcfEwCL4r9N9k45r4fGs14MvvgFi58T0Ol05lJuTtlZDPJSW0gRwInrsulSapjl2vtJeo+HLVe/bkhsxZIvgIQdLv2Amd41LlQtfHJRJ8XWwjzd8EB975iSyxjgytiix+cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848418; c=relaxed/simple;
	bh=yNwadrWOpsZSKdpEFxj0LWwmWUpBcHymkQBYYkCyIQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KqtN0RziYKiXZ6wxJj3TgVptgSbqPvDBt5HROZz0IFc5dDSBLKZuN1WExV8zYLjcJqYjVrxNHeb0dy139lHGYgDlkBs7XsQF3/XjriCX/uJlf9LRpNSfWee+wYtp7oWzoyl7uUi8nC9oxQfn9e8ALWu+TFHQgx4Hpys3W7n9x9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9NN4n6e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9NN4n6e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204151F000E9;
	Tue,  4 Aug 2026 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785848416;
	bh=pDlV9Mm+RfTfa4jEK293VMEbRKj7GCrioEMCKSSvAAg=;
	h=Date:From:To:Cc:Subject;
	b=V9NN4n6eDoi4ZBkwcCUgKEBdy33FBRqoLgxlh/XRnKEtC3thvcA+W2xa1//8sBdPD
	 3gNGMuh00qyhszWdKijaoshMBwBZw8seV7+U06wy25bCf7UJuA7UJUnnKlw7lWhX1w
	 PZFu4jES1jraWiORJLJlOB3AHCPN5Sw/2CYjcmMuFC87hgMXNxa6F14WVnxKEdhtyB
	 JhZ3Tli84DeITXYtinpTpk0Ub1Mr75+vKKTnG3exxiXQKIX7maNPTFuXofccwE3S06
	 7OiHEGbHPf/aRh3/j5RkKdljHmK2QWYULik+fTlVsdbLTXYWFPi7s4Y7bJvDx70yA0
	 8B9f5CbdUcXPg==
Date: Tue, 4 Aug 2026 14:00:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 3
Message-ID: <anHiWIA1BZwmHIrF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j2vVfW8vh+mUSXHf"
Content-Disposition: inline


--j2vVfW8vh+mUSXHf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260731:

The ntfs tree lost it's build failure.

The wireless-next tree acquired a conflict with the arm64 tree.

The drm tree acquired multiple conflicts with the origin tree.

The paulmck tree lost it's build failure.

The vhost tree lost it's build failure.

The block tree acquired a sematic conflict with the vfs-brauner tree.

Non-merge commits (relative to Linus' tree): 11141
 10005 files changed, 530279 insertions(+), 161609 deletions(-)

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

--j2vVfW8vh+mUSXHf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpx4lcACgkQJNaLcl1U
h9D3KAf9GgfHNm/Lk+nZxL5vQkQI4upxv/89OMidg8e47BPmqJcxfL6ho8knr82j
rcNLPtZF101rdu6wvkE8DsKkY7qTTw58xtguK7+lr5q9FuQml1pwPRwc6arM66XU
xxUbBepsiTbti+2p3LMK8nH4q1BUejjzu7zvaa5/9T5/5cbG1jUJF7/AaOuJQUcc
WtPYrdCRfih48NfdS803dKHMdfCNiDyFhWTwgNW+p3AfT3tWbN5wX/ZTOseIsDJE
beO+VufplJmY9+ARfFk9H9VZ2hMO0PY+DH7J2uUYpZlgvYRds4VmZm0CgQaoT8Ze
XqLIkKW59wyjaaNqigtlhu/4NQo7Pg==
=fsm7
-----END PGP SIGNATURE-----

--j2vVfW8vh+mUSXHf--
