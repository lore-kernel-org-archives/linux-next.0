Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F934C92;
	Sat, 18 Jul 2026 00:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332927; cv=none; b=cBUCPOn/qlDbFNWebdYj/b+6GHWEROd5mEGkIVlritle9+d5Jm9Nc5PvzCQgcSnqZ30zAFhta4gV5GpTx07uz9SXOB6XwOifRu3lPEmlaHdYTysVsbOkRP32LqAPst8UEttzpEMO2N4rvoruz+zEQ71mI1r+XqKJPMIM8APGEgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332927; c=relaxed/simple;
	bh=EJZ+ocgS+GN9vTNhm1pfm0uprhpyA5hXBI8A43wew8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ppGXJN1JzSsLu3e3J3djOtII297BZ/finFx3UnN2eiIuNcoax/bon+QA75wsOEgUp+mpVCJa/mukXV8+PmWNm5JLHSWWEb42L3NzJ0IMDAWK8MhlF5TU0LCUoDItCf2f9dzOUj4aUN5Oo5FArxOeFePzkJAMKUBlO7g8UzGZs4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkCLt6sf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkCLt6sf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD1F1F000E9;
	Sat, 18 Jul 2026 00:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784332925;
	bh=iXbu3BgmFHGO9kuKWlN/uJf+RKRWp2aQ2NY+k45RhEQ=;
	h=Date:From:To:Cc:Subject;
	b=fkCLt6sfG+syJ8phgno8mgFC2TISxa8RoZqqGcPM91n64+NycrIvLDZcfW5Etthfr
	 qyyGvIjYq8CNq2gGTvx4hie8MxvpPMvANidQ5EHdI45/ca1C2p4QzhVkp9DnEwxzbV
	 rmqzUXGYtZMQ/aVWmpQ5WYc0QeM/AKb8Tn/E8e2A72AK/IazmYSk5OIiG9leS3Ciir
	 uQ25prjgwHBGe0vKsxAMbFMvcwuQXO3BD33CgNss9UR8rwUWNYLPxGGY0/uat48KBX
	 L2mRFFeNJpPVip047UHygEOeVDmtqaJ9Il6QXEkFBM9PITCoKZqnXEIs+K6xqq13rv
	 4M7aw+qXUY1dQ==
Date: Sat, 18 Jul 2026 01:02:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	David Gow <david@davidgow.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: test failure after merge of the kunit-next tree
Message-ID: <alrCeerj_TmaqUuP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QE1jaMah4QrG46He"
Content-Disposition: inline


--QE1jaMah4QrG46He
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kunit-next tree, today's linux-next build
(arm64 kunit) failed like this:

[22:59:27] Configuring KUnit Kernel ...
[22:59:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=3Darm64 O=3D/tmp/next/arm64_kunit olddefconfig CROSS_COMPILE=3D=
aarch64-linux-gnu-
Building with:
$ make all compile_commands.json scripts_gdb ARCH=3Darm64 O=3D/tmp/next/arm=
64_kunit --jobs=3D192 CROSS_COMPILE=3Daarch64-linux-gnu-
[22:59:30] Starting KUnit Kernel (1/1)...
Running tests with:
$ qemu-system-aarch64 -nodefaults -m 1024 -kernel /tmp/next/arm64_kunit/arc=
h/arm64/boot/Image.gz -append 'kunit.enable=3D1 console=3DttyAMA0 kunit_shu=
tdown=3Dreboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -ser=
ial stdio -machine virt -cpu max
[23:00:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[23:00:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D gpio-unbind-with-consumers (1 sub=
test) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[23:00:36] # gpio_unbind_with_consumers: ASSERTION FAILED at drivers/gpio/g=
piolib-kunit.c:393
[23:00:36] Expected ret =3D=3D 0x0001, but
[23:00:36]     ret =3D=3D 0 (0x0)
[23:00:36]     0x0001 =3D=3D 1 (0x1)
[23:00:36] [FAILED] gpio_unbind_with_consumers
[23:00:36] # module: gpiolib_kunit
[23:00:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [FAILED] gpio-unbind-with-cons=
umers =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[23:00:36] # gpio-swnode-hog:     # failed to initialize (-17)
[23:00:36] [FAILED] gpio-swnode-hog
[23:00:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[23:00:36] Testing complete. Ran 9377 tests: passed: 9284, failed: 2, skipp=
ed: 91
[23:00:36] Failures: gpio-unbind-with-consumers, gpio-swnode-hog
[23:00:36] Test results stored in /tmp/next/arm64_kunit.json
[23:00:36] Elapsed time: 69.716s total, 0.002s configuring, 3.680s building=
, 66.027s running

This is caused by commit

  a05cfd98c5eca (gpio: kunit: add test cases for software node hogs)

which was from the gpio-brgl tree, it has only just become visible since=20

  34b5c0132952c (kunit: configs: enable GPIO kunit test cases in all_tests.=
config)

was added causing the gpiolib tests to actually be run though neither of
these commits was added today (the KUnit tree did not change for a
while).  I'm not clear why this has started failing today, presumably
some third commit from another tree has started triggering a regression
since neither of these trees has changed.

I have left this for today.

--QE1jaMah4QrG46He
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpawnkACgkQJNaLcl1U
h9Bc+gf/QIEPBAL2a1MeBtcicMWMctdXCmL/lYVfFZXSmXovHtw3/vTUxF1XTRk4
HO4m+ejWlpZhI+xZbpiB7XZIsy5LMy1re8aVGY0L0BtHNsrlwm9OHqJQnLHJ2mw2
aYz1dT+0EWTd85jrPxaQc23T4/Q+Ur7dIayWvfZ2FBsWblLb8Oe8Q5r62HiTFb0n
bxV+WTD5+mfFGuNe315qbBpkf6lja8304ezJmy6AZHHw92mq/+f+oqVmeUHXMrov
79kqHl6grT6P5LIYPHK2CO+TGrC+t5cYQfZyYMOK6JqCYGIXOMESXDZ+MC9ttrw5
NnkAmbqabz2NIoKBPVyAspZcIyPSHg==
=6I3e
-----END PGP SIGNATURE-----

--QE1jaMah4QrG46He--
