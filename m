Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11CE3002DD;
	Wed,  3 Jun 2026 11:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485881; cv=none; b=my2UsPs0C3DFjFdmMqlnIFivwsVb4FbEXUjxVWHf5YNsaC96Xbcu/V7HN7gUvqj59FzrH0ryguJn78O/Gd3ilsS6Tz2hM03dxsJMZgN9fniE6ISD3tck7qsq8xWSN2eY5W4UwKT0UEdG7Yv7flaPLYAGLiXCEDSI9KN7f36UO1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485881; c=relaxed/simple;
	bh=h0sNI7Xe2n3bOIApf+7LfLcjTwEz0gkQzn6Q+1XBqmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cKLB2jIS4IAGindJEfDxmZqp+f4KqP3f1dmtsfBlYIxxEA7e68ddfs0dB+/d5watgDJuMH4Hw1m/hMd0zzoxc9yhdySNcVrzm7jNpc3DzUuCaa4wzv+xq+zj/FfkdcJtQ3yjtVjyXDqxWMS+7jjtcWYkZ+J8aTUh01JzxtuG8As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqNyRO1N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqNyRO1N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA471F00893;
	Wed,  3 Jun 2026 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780485880;
	bh=7lZf+z6Q1BjcdEDKBmDl3Q5cInQCvnta+6rre9sYAFk=;
	h=Date:From:To:Cc:Subject;
	b=VqNyRO1NtTZ+LWZLMytVeBM4p22kyrXGsqZGppmHnogDzW1eobS/jLENIk4tVcuJ8
	 1JAqTPqxk+5QTBnYQHx2fycZI/gvvkG1yqOe0apF+bYPH7nC+mAQ9TVtMQeBMWQTsH
	 HzldLHJ5rVOQgOd70NsS4OopLKPNE2Ti1+9guzhz4XhgKb1hPG9I6ZF23wp8XxB9kL
	 cZPUNxEIxo5uRQsobu3E6JCBdlw0pMbuDNhKZ1TzzekgCbh/5twmK6xLq5nIVBafYi
	 egne/cjaSWLQMcnWipKQa5lJpeVo0hOULQ+IaF/do3WxlyldJ2K7Jo7JH8oem19Okk
	 rYc7zpnzcE02A==
Date: Wed, 3 Jun 2026 12:24:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: test failure after merge of the arm64 tree
Message-ID: <aiAO9KcQ8Irve7od@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lGs/qYdg/9kUVfR4"
Content-Disposition: inline


--lGs/qYdg/9kUVfR4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm64 tree, today's linux-next (arm64 kunit) failed
like this:

[11:04:45] Configuring KUnit Kernel ...
[11:04:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=3Darm64 O=3D/tmp/next/arm64_kunit olddefconfig CROSS_COMPILE=3D=
aarch64-linux-gnu-
Building with:
$ make all compile_commands.json scripts_gdb ARCH=3Darm64 O=3D/tmp/next/arm=
64_kunit --jobs=3D192 CROSS_COMPILE=3Daarch64-linux-gnu-
[11:05:11] Starting KUnit Kernel (1/1)...
Running tests with:
$ qemu-system-aarch64 -nodefaults -m 1024 -kernel /tmp/next/arm64_kunit/arc=
h/arm64/boot/Image.gz -append 'kunit.enable=3D1 console=3DttyAMA0 kunit_shu=
tdown=3Dreboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -ser=
ial stdio -machine virt -cpu max
Command '['qemu-system-aarch64', '-nodefaults', '-m', '1024', '-kernel', '/=
tmp/next/arm64_kunit/arch/arm64/boot/Image.gz', '-append', 'kunit.enable=3D=
1 console=3DttyAMA0 kunit_shutdown=3Dreboot', '-no-reboot', '-nographic', '=
-accel', 'kvm', '-accel', 'hvf', '-accel', 'tcg', '-serial', 'stdio', '-mac=
hine', 'virt', '-cpu', 'max']' timed out after 300 seconds
[11:10:11] [FAILED] <missing>
[11:10:11] Testing complete. Ran 0 tests: errors: 1
[11:10:11] Test results stored in /tmp/next/arm64_kunit.json
[11:10:11] Elapsed time: 325.499s total, 0.002s configuring, 25.490s buildi=
ng, 300.006s running

which is not hugely informative.  Looking at what's new in the arm64
tree from yesterday I'd be astonished if this were anything other than
Ard's linear map series. =20

This is running on a Graviton 4 system, the kunit command line is:

=2E/tools/testing/kunit/kunit.py run --failed --alltests --kconfig_add CONF=
IG_KASAN=3Dy --arch arm64 --cross_compile=3Daarch64-linux-gnu-

I have used the version from next-20260602 instead.

--lGs/qYdg/9kUVfR4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmogDvMACgkQJNaLcl1U
h9C2nwf/Ws7S5HV5bWNeSk79Axw92SHD9ndwaIA3ioRNojVCX3xeDE6apTqRdEyM
ShOgs0dnY6KzBNMj52/jHrDeUr3bABg8G79V/VAywmeJuuV8B5QdlcC8V6NH6gqg
31ISYNSWc8+CUR+2op+okLBUT60scoHLlv598cNfsCgtyxbJXFp7zsxz0EcXbpPX
YPv8Cy5o0e4gWpY8ShcDbhrZmwF6PhnPCfpIqTZCE3CD/EHc3db04IuTb1i4VwA3
PBKPFQl6ts/WQDCQstE1F06CWn06nJfUDhaqxcXo+waZJ5oAbHuZB4bgkmXJSFzC
iLQxxom69eKcTGU0G+rEPeOGge3nCA==
=G0B1
-----END PGP SIGNATURE-----

--lGs/qYdg/9kUVfR4--
