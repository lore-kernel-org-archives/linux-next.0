Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0F03F9F25;
	Mon, 18 May 2026 12:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105613; cv=none; b=BPJ1HtNsPJvwJq6wkZwag+FMfSs3vncPHnc95y7dnafDpDcWEiW2pp6699JPB1gCX0AP3giQl0Y9bxvmGe1h7P1rO1U/D8tPrghrOMJ10yFIxfAiP9SKPcKx7l+RfBcD/RddQ/mQUpqtRAwhZnFBUGI2TrS0vuYA1UMkMfyanDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105613; c=relaxed/simple;
	bh=M9qh8Hq0ywCAzQg3x8UF/15ocbErSER4fSC/q1fi8X0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B5JUps4jS8+1h5XFw5jkfa2LqVHJPAJNBTikGQ58MjTPLcoWrwWeD3auwBfb/KdYiAxzRMOkxrb3mfzcjFY7l+x1qI6f136az4Sm9eZHMIwMiEs5MIj8EnJDY2rJquDIbOfeE85C4ZIlg11GOk59JFE8B98zn8o0jSax/9/1Esc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNLODZQy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNLODZQy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC5EC2BCF6;
	Mon, 18 May 2026 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779105611;
	bh=M9qh8Hq0ywCAzQg3x8UF/15ocbErSER4fSC/q1fi8X0=;
	h=Date:From:To:Cc:Subject:From;
	b=gNLODZQyc2NZaeReag6BjI5UUgM5eiJIPUhWiiyrRG0TYHp7+MTd4psRHH3bf7Ode
	 G0HqN49HvytsxWCT56OboF7JuMH0B+fspF5NSfXPzSBPZpIt/QoLMXRTO+pWHPHOLd
	 973rftYHSGTu/z6RqpeiIjCHfnb+wsyqqQAVF9W+BsSA4e5lWytm5Uf0QRusVA1VAA
	 K2OnlvGnD2pyJpxvj//0iP7WjC0pHHMBm3KSDff8MqUxQ3eNAWSUtV1dJqqVD/JcEE
	 tUMUDvnFh4uj6hKv4B4AB0uUqZsrburzYMbRofPL4TkBH5hk306BLerYekyH1R8KYO
	 de1FMJ5Ol3Cig==
Date: Mon, 18 May 2026 13:00:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ankur Arora <ankur.a.arora@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: test failure after merge of the mm-nonmm-unstable tree
Message-ID: <agr_RxvNtfASfevg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gt8IbS5oetCd5j/5"
Content-Disposition: inline


--gt8IbS5oetCd5j/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next testing
(arm64 kunit) failed like this:

$ qemu-system-aarch64 -nodefaults -m 1024 -kernel /tmp/next/arm64_kunit/arch/arm64/boot/Image.gz -append 'kunit.enable=1 console=ttyAMA0 kunit_shutdown=reboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -serial stdio -machine virt -cpu max
[11:39:24] ============================================================
[11:39:24] ======== smp-cond-load-relaxed-timeout (3 subtests) ========
[11:39:24] # smp_cond_relaxed_timeout_succeeds: EXPECTATION FAILED at lib/tests/barrier-timeout-test.c:69
[11:39:24] Expected runtime <= timeout_ns == succeeds, but
[11:39:24]     runtime <= timeout_ns == 0 (0x0)
[11:39:24]     succeeds == 1 (0x1)
[11:39:24] [FAILED] smp_cond_relaxed_timeout_succeeds
[11:39:24]     # module: barrier_timeout_test
[11:39:24] # smp-cond-load-relaxed-timeout: pass:2 fail:1 skip:0 total:3
[11:39:24] # Totals: pass:2 fail:1 skip:0 total:3
[11:39:24] ========== [FAILED] smp-cond-load-relaxed-timeout ==========
[11:39:24] ============================================================
[11:39:24] Testing complete. Ran 9436 tests: passed: 9315, failed: 1, skipped: 120
[11:39:24] Failures: smp-cond-load-relaxed-timeout.smp_cond_relaxed_timeout_succeeds
[11:39:24] Test results stored in /tmp/next/arm64_kunit.json
[11:39:24] Elapsed time: 121.367s total, 0.002s configuring, 63.737s building, 57.613s running

Note that we are running on an arm64 host with access to KVM so the
above should be running with KVM rather than being emulated.

Caused by commit

   0403c34571d1d (kunit: add tests for smp_cond_load_relaxed_timeout())

in that it's adding the new test which fails, I didn't investigate the
quality of the test.  I do note that there's some related functional
work also from Ankur that's also added by the mm-nonmm-unstable tree but
didn't investigate that either.

I have used the version from next-20260506 instead, the code was in
next-20260508 but I belive Thierry was emulating.

--gt8IbS5oetCd5j/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoK/0YACgkQJNaLcl1U
h9DmlAf/SKNxtkLulpQJ5XY1mNUnaDzh+X1pfzpFu/3hG5IagEIH+LtmWQ5IP7qi
fzKB5poR00vMXLN1B/MFhwscfv5RHdKQPL7Q1EYhzXhBogqw/doSUtIgYzjifYD5
FVlMeiGkvCjQz2KEAG4D1v5BvC1ZOoi5Em5V2LGsRsO/J1XqX1S7rIWeaAMHmu/Q
+r19NEOnLu/Y+aeza4LZCvFtS50AsffEAu2lrTVe0XjltvNf7FxorPuHAK267oyB
HlnI7rsC7qLUgcMDckj/Y9LQUSGG4uG8Q9QbvGraxdp/5+cgyVJrtZQIzoryO2g/
caWNiR7kmm0+y2oaLMeX5KGedDGNBQ==
=3eHb
-----END PGP SIGNATURE-----

--gt8IbS5oetCd5j/5--
