Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5CB2E11D2;
	Tue, 10 Mar 2026 18:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773167314; cv=none; b=nqQK1mZYJdc056EnKtUTni0+YoLep6ZyBRgC7/OhfDypCXBkajXMc6wk4lS7W9FJrJxklPScn6ReZIh9Ck2D/1RJjyn7Jg7fiQKxwhvRtwPH2OhZkKwxXaVEdtxj+cC/0qDzjcwr85A0+q2e+bXmfaBjjkpKkeY7gxrofwN2eqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773167314; c=relaxed/simple;
	bh=CpI7VS27vX/Hobt51mkUh7SEVzah/CDBVDL3D1L8aQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RAR6MZxj8vnStee30QfhB0+RTv79WvL1ZsUbqlWhgofT9yJiRG3+YMg+TLbEEFnfOcgGqxglXapArjwIiRdGJIT3N+uO7cXEfouvRZec3Wqw7kG7lSl76In6xquBaz/z0N4Mh0EWbmBpdSyXdcuWDs8uT2lk+5jxcYe6el582vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsEkEScs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsEkEScs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97F3C19423;
	Tue, 10 Mar 2026 18:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773167314;
	bh=CpI7VS27vX/Hobt51mkUh7SEVzah/CDBVDL3D1L8aQs=;
	h=Date:From:To:Cc:Subject:From;
	b=jsEkEScsTAJa9SKOEHiwXfZWu9cA5cz/7k7LBLozSOBE2m05qM0XUmiIpA0HsXjIo
	 XzRjpANjM1KWzbEw4LLbY9wDTXrTlRNhIK8AfxCzZZE2jrFfE00JutBMptZS9G91VN
	 GFRWcU/SV0LcIOiNxuWXq5GNaxq1gBrM/j3OHsd5EnLv4Vxwaod6KfJhrRKsPXzraD
	 31OI2iAuqZzECXCYKs2L9TVEu+F6zCNQH8tIe2WxBBIKJDm7pb/gB0uNxcZM3SOfDq
	 OmMwb8feNq9OPc4BVlMu6+6DiyRCdl3ehg00PRlmIhV0pXKMYaNqwkN9JSqZSfMpha
	 if2A0B7pgHvhA==
Date: Tue, 10 Mar 2026 18:28:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <abBizpKaBlTZSYh6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HM+z55HJTiSOmXh/"
Content-Disposition: inline


--HM+z55HJTiSOmXh/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the tip tree, today's linux-next started crashing running
arm64 KUnit like this:

[18:12:16] [PASSED] split unwrit extent to 3 extents and convert 2nd half writ (non-endio, zeroout) (highlevel)
[18:12:16] =============== [PASSED] test_split_convert ================
[18:12:16] ================ [PASSED] ext4_extents_test ================
[18:12:16] ============== ext4_mballoc_test (7 subtests) ==============
Command '['qemu-system-aarch64', '-nodefaults', '-m', '1024', '-kernel', '/tmp/next/arm64_kunit/arch/arm64/boot/Image.gz', '-append', 'kunit.enable=1 console=ttyAMA0 kunit_shutdown=reboot', '-no-reboot', '-nographic', '-accel', 'kvm', '-accel', 'hvf', '-accel', 'tcg', '-serial', 'stdio', '-machine', 'virt', '-cpu', 'max']' timed out after 300 seconds

I didn't figure out what the source of the issue was, I merged the tip
tree from 20260309 instead.

--HM+z55HJTiSOmXh/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwYs0ACgkQJNaLcl1U
h9CuZAf7BbQob5naroGZGabzqG7ijJh304DAnh1oXQXDNpZbgpKFtMVTVTQQCR/8
6p20j39sDo2KpXp3mUcE43mBzmJGzuMpHLawa8omUvmutc4RaxGfQG+CHToR9ia1
D/Kf2NXcEYUlqIbZAUtxA/C4D8fXLXmdmQU7hcAteoFw1z0du+9dUXWQAxCbOvBG
pc4V++b5J5DGjZhMWcYyUV97DwPlTfLGR/YpxXZ6FyA64BT/k7nCtInWzBEejrfC
xyhMHDUdy5ionXXn5N9V3ld6uG5Qeyf3ciouuIRfGOOU5DN3HPjvLJglcY1TePb0
E7t3Shlb6ScDwFbgF5mTSr5xfTP56w==
=7T1Z
-----END PGP SIGNATURE-----

--HM+z55HJTiSOmXh/--
