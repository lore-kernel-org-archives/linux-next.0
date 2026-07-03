Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090D127732;
	Fri,  3 Jul 2026 16:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783096804; cv=none; b=mBv+/JFvROwLmluJ0e8E8rAVgtls/PCIxj7m+nmLcGD+qmQV2RmhZu5qSB0sOW5hIiwqwZBvldL6cqaO39OpdbaMhLVzXmSLdNwIE/34QyIPLMqzNYgJlRfu4NvVmhjVF+gCK2/NFuiC6SsL8h4y0ijzWCG3xuH0IDGrtdHeHQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783096804; c=relaxed/simple;
	bh=q6QcOIHXqSZZOAtoVtsIxV7TxbSLyFi9SXUHKzdIzcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7RNYWaWq1mpuC3b5wpHpHOxSvSh76MuVJy/Q+nkfjRe25uHPRJE0KegzZl2yd6+8exDGa/PCag+m5xYN8sUFyQLp4y9eOtKpGlQIOZJ22GNwx52cujOzwgQyxmoyghGVAkeX7eUCeyKsKqji18crYAiNanR3zsHlFwDKqXUvfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gw8BpK0C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gw8BpK0C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62131F000E9;
	Fri,  3 Jul 2026 16:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783096802;
	bh=BPD47xblYCzo01iYTlll00e1TIFof5y5JQ+GS45F1KU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gw8BpK0CDrXlVXcQIswXNRPZzf5xkce3QfmSeTgh6uro569uS9dpFVrIG1LbBwuez
	 BuBJj/zVaLz2ew02Y7F2amw9PFI2mZe7kZsxFACOwj5nGsvs4IoFPHU8lvb6N7v6Ki
	 sI3hg/NdkuZgQFkKOrOXgItRpBGMKysOh3HRSReCdUoeoY1gJIGRa+GlMd/SPD9WY9
	 QkRH6ZQfS5osBcMKEp7Avjjrr9uX7EjsY5ArncEWyWyUSudRxJEfLFQ0auCvRTBR0D
	 5N0w0NVseW0Yiw8DJDAYPa5Zb9V0OBcmFPEs7BSRcpR/N/zdygQ1OFG+pxEYMzlP4h
	 976kX/+DMgIBw==
Date: Fri, 3 Jul 2026 17:39:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Alexey Dobriyan <adobriyan@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: KUnit failure after merge of the mm-nonmm-unstable
 tree
Message-ID: <992f91e5-a6cc-4b16-8026-74c9d32bc08d@sirena.org.uk>
References: <akfKl6lJlGL6fPG3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sr+OKjuYy6/b9oqS"
Content-Disposition: inline
In-Reply-To: <akfKl6lJlGL6fPG3@sirena.org.uk>
X-Cookie: Another megabytes the dust.


--Sr+OKjuYy6/b9oqS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2026 at 03:43:35PM +0100, Mark Brown wrote:
> Hi all,
>=20
> After merging the mm-nonmm-unstable tree, today's linux-next failed
> KUnit testing like this:
>=20
> [14:20:52] Configuring KUnit Kernel ...
> [14:20:52] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=3Darm64 O=3D/tmp/next/arm64_kunit olddefconfig CROSS_COMPILE=
=3Daarch64-linux-gnu-
> Building with:
> $ make all compile_commands.json scripts_gdb ARCH=3Darm64 O=3D/tmp/next/a=
rm64_kunit --jobs=3D192 CROSS_COMPILE=3Daarch64-linux-gnu-
> [14:21:06] Starting KUnit Kernel (1/1)...
> Running tests with:
> $ qemu-system-aarch64 -nodefaults -m 1024 -kernel /tmp/next/arm64_kunit/a=
rch/arm64/boot/Image.gz -append 'kunit.enable=3D1 console=3DttyAMA0 kunit_s=
hutdown=3Dreboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -s=
erial stdio -machine virt -cpu max
> [14:22:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:22:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D cmdl=
ine (8 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:22:11] # cmdline_test_memparse: EXPECTATION FAILED at lib/tests/cmdli=
ne_kunit.c:249
> [14:22:11] Expected ret =3D=3D e->result, but
> [14:22:11]     ret =3D=3D -16 (0xfffffffffffffff0)
> [14:22:11]     e->result =3D=3D -1 (0xffffffffffffffff)
> [14:22:11] when parsing '0xffffffffffffffff0'
> [14:22:11] [FAILED] cmdline_test_memparse
> [14:22:11]     # module: cmdline_kunit
> [14:22:11] # cmdline: pass:7 fail:1 skip:0 total:8
> [14:22:11] # Totals: pass:7 fail:1 skip:0 total:8
> [14:22:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [FAILED] cmdline =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> [14:22:11] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:22:11] Testing complete. Ran 9225 tests: passed: 9104, failed: 1, ski=
pped: 120
> [14:22:11] Failures: cmdline.cmdline_test_memparse
> [14:22:11] Test results stored in /tmp/next/arm64_kunit.json
> [14:22:11] Elapsed time: 79.318s total, 0.002s configuring, 14.632s build=
ing, 64.682s running
>=20
> I honestly have no idea what's triggering this, nothing jumps out from
> the commits introduced in the merge of the branch.  If I have time later
> I'll try to bisect the issue.  I have used the tree from next-20260602
> instead.

bisect tells me it's due to:

  e595545005616 (Revert "lib: fix _parse_integer_limit() to handle overflow=
")

log:

git bisect start
# status: waiting for both good and bad commits
# bad: [604ad02caddab12905643d5191b4a301d87033ef] ocfs2: fix hung task in o=
rphan recovery
git bisect bad 604ad02caddab12905643d5191b4a301d87033ef
# status: waiting for good commit(s), bad commit known
# good: [f548f2851b9323e7d0834d0c655a46644beeda64] MAINTAINERS: add Usama a=
s a THP reviewer
git bisect good f548f2851b9323e7d0834d0c655a46644beeda64
# good: [1c5b1ee7d53126e8b0f027a7e7277a77900bb29f] signal: change sys_kill(=
) to use SEND_SIG_NOINFO
git bisect good 1c5b1ee7d53126e8b0f027a7e7277a77900bb29f
# good: [a4db696aedb5f7ce197978df4a3c9e60c5c132cc] riscv: mm: fix concurren=
cy in mark_new_valid_map()
git bisect good a4db696aedb5f7ce197978df4a3c9e60c5c132cc
# bad: [e595545005616ea8664184a6c81413fa52d46a49] Revert "lib: fix _parse_i=
nteger_limit() to handle overflow"
git bisect bad e595545005616ea8664184a6c81413fa52d46a49
# good: [8264c1b8de74dd1215ac2e35166db29562f16e23] tools/compiler: match gl=
ibc 2.42 definition of __attribute_const__
git bisect good 8264c1b8de74dd1215ac2e35166db29562f16e23
# first bad commit: [e595545005616ea8664184a6c81413fa52d46a49] Revert "lib:=
 fix _parse_integer_limit() to handle overflow"

--Sr+OKjuYy6/b9oqS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpH5d4ACgkQJNaLcl1U
h9AczQf/fy4jrkEpRr7KsEwi9yIAtQXykFJQBL8gvLIxvkdnxAkAg4izvRIOEBUB
i45rrTRM9MoQizDfhPFSUfI0fsgC3Hwr4x1UEifFHolU3jS8w6g8W/RR8mlk6kpw
sNxvpcFaXpBcRw9mXH9ieiDUUV3o+kkj/G/OOaRc6/H/r0UfvPuXvx2mULOyGrf2
xkGZ9Hs7jwKCjv2Y7bzT9GzmqleDZnzIysss8h2IEJyL0jyKrDwJnmYiHNKpVBtl
FQxHY20+T3NrP6FfNQPxS45hNBQsIPnHht4bgi+XP6IwfjiWcMsbYUo7M/w33CQa
c9QQtW/frTlA8YlosmX3FXFWSH53IQ==
=gHVO
-----END PGP SIGNATURE-----

--Sr+OKjuYy6/b9oqS--
