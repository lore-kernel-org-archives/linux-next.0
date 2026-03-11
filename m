Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B876846F;
	Wed, 11 Mar 2026 00:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773187225; cv=none; b=eI+ZDhdSsZQq+SJPk6aukKBM3AR3doHc5ljHjde0uc8CtKoOuEboke+ylIIp6rCAyYxpJIqr3iZ6IjOz4fGfvSodW66hXjYGfHzGPUqwaEHJVClA/99yQE4wJA0NY7xCEjR8TwKjreiitCBxFkWPMUYpMPULmqeNdEt56m1hjmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773187225; c=relaxed/simple;
	bh=ckrrxrzNBq6MR4l0zpq+tZlcbSv8zJnqQzexLwNqytI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqr3WeHntxTBmP7G9RrLdsNRu4h3SWct36li2gVUhk6NJi8VQn/P9fnyVYKgb57cr7Ko+y/ifFye6wH/gb8YLqS4ZAQHCqEAuAe4wl2aUPMMqhcEwwcsPfyzEsH6bWOp9Hijwvn2Ibx/Plr+z9ZrQn5Ba0bDR1DIoYvN1ejUAc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ST17pQKA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ST17pQKA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F169C19423;
	Wed, 11 Mar 2026 00:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773187224;
	bh=ckrrxrzNBq6MR4l0zpq+tZlcbSv8zJnqQzexLwNqytI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ST17pQKAlYxlSAwMjXyhyZVCMgHaRoeKXunizM1UjKM0wmThKpYTPu6vunewNRBrQ
	 7eK74YXRBS1KbqU7t+3DaHwSQD0g9+A5WuVg4OAU59ZbRyeBWCbrxK8MLrvu50y3Oh
	 oswBKVEz9zkpKBpY60xWajf1Py8rUyc7SP4CpTwdwOrwJFJarBUiQAvntbnC/ANCdi
	 TTk3DUcWq2DSkr9tEWNFveCjeGdoOAhRBF+3b7xY6rLBehnmz0NSNRPa+FdMiArRab
	 P+RqckLLRP+O2+welR9JWLKsejGLzR2uN0/OvR1AuFzw7114s73v57Ef3K6affaUke
	 N97/8lUM6X23A==
Date: Wed, 11 Mar 2026 00:00:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk>
References: <abBizpKaBlTZSYh6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1zwJ/OyHA1TAlHmP"
Content-Disposition: inline
In-Reply-To: <abBizpKaBlTZSYh6@sirena.org.uk>
X-Cookie: A fool and his honey are soon parted.


--1zwJ/OyHA1TAlHmP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 06:28:30PM +0000, Mark Brown wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next started crashing running
> arm64 KUnit like this:
>=20
> [18:12:16] [PASSED] split unwrit extent to 3 extents and convert 2nd half=
 writ (non-endio, zeroout) (highlevel)
> [18:12:16] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] test_sp=
lit_convert =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [18:12:16] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] ext4=
_extents_test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [18:12:16] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D ext4_mballoc_test (=
7 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Command '['qemu-system-aarch64', '-nodefaults', '-m', '1024', '-kernel', =
'/tmp/next/arm64_kunit/arch/arm64/boot/Image.gz', '-append', 'kunit.enable=
=3D1 console=3DttyAMA0 kunit_shutdown=3Dreboot', '-no-reboot', '-nographic'=
, '-accel', 'kvm', '-accel', 'hvf', '-accel', 'tcg', '-serial', 'stdio', '-=
machine', 'virt', '-cpu', 'max']' timed out after 300 seconds
>=20
> I didn't figure out what the source of the issue was, I merged the tip
> tree from 20260309 instead.

I tried to leave a bisect running but it got confused because a lot of
the branches are based on v7.0-rc1 which has a separate bug that causes
KUnit to lock up so the results are nonsense.  I did confirm an issue
with just tip/master.  My KUnit command line running on current Debian
stable is:

    ./tools/testing/kunit/kunit.py run --alltests --arch arm64 --cross_comp=
ile=3Daarch64-linux-gnu-

and I also tried:

    ./tools/testing/kunit/kunit.py run --alltests --arch x86_64 --cross_com=
pile=3Dx86_64-linux-gnu-

and got:

[23:51:03] [PASSED] split unwrit extent to 3 extents and convert 2nd half w=
rit (non-endio, zeroout) (highlevel)
[23:51:03] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] test_spli=
t_convert =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[23:51:03] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] ext4_e=
xtents_test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[23:51:03] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D ext4_mballoc_test (7 =
subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[23:51:03] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D test_new_blo=
cks_simple  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[23:51:03] [FAILED] block_bits=3D10 cluster_bits=3D3 blocks_per_group=3D819=
2 group_count=3D4 desc_size=3D64

before the deadlock which looks awfully similar, though it does make a
bit more progress and gives a crash:

[23:55:51] [ERROR] Test: test_new_blocks_simple: missing subtest result lin=
e!
[23:55:51] BUG: unable to handle page fault for address: 00000008bcf958c7
[23:55:51] #PF: supervisor write access in kernel mode
[23:55:51] #PF: error_code(0x0002) - not-present page

=2E..

[23:58:45] Call Trace:
[23:58:45] <TASK>
[23:58:45] ext4_mb_release (??:?)
[23:58:45] mbt_kunit_exit (mballoc.c:?)
[23:58:45] ? __pfx_kunit_generic_run_threadfn_adapter (try-catch.c:?)
[23:58:45] kunit_try_run_case_cleanup (test.c:?)
[23:58:45] kunit_generic_run_threadfn_adapter (try-catch.c:?)
[23:58:45] kthread (kthread.c:?)
[23:58:45] ? __pfx_kthread (kthread.c:?)
[23:58:45] ret_from_fork (??:?)
[23:58:45] ? __pfx_kthread (kthread.c:?)
[23:58:45] ret_from_fork_asm (??:?)

plus subsequent things that look like aftereffects of the same thing.

--1zwJ/OyHA1TAlHmP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwsJMACgkQJNaLcl1U
h9CiFAf8DP0gzRWhc44DyilYmRAKjU8HPWXAtR2DLEKRvx9N7XT8JSC5GcY2yRUh
ELToOY2lUkF/ofifWyvM/PvwiY2rCG9WMkEuXoKyqsWBjdogCKM8CSeAd80PDjd3
k54m411BHynTnAGp25dzAONVFQv4Tw7+tLVZOJ+zXTPig5WGCQlKYFM7ts7tuE9J
UniJ6EF014VcZvdl1T4VgUGX5NZH89soy6qYRDQUnQNUiAUgRzBQzW971in1huGG
dlcYUvihNL3CkTXoUZr25QNEvUjQZIJxVdaEFWrosbzO6eNBxY61+fWYvl8XSgcY
KpDy0aC1OmnGah8vudV+1gonY6eAyw==
=9Id4
-----END PGP SIGNATURE-----

--1zwJ/OyHA1TAlHmP--
