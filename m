Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED26E3B6BE2;
	Wed, 11 Mar 2026 10:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773225479; cv=none; b=M97M76KVO/+VbpQbvyi9JvZH1HTXLzsLV3lJT8g4BTGfifKkIAAd1w3Q8XxCOsucHjTzIiRZ0qY8nj8/ARjg6A2QzT/3CeP0aCL6EZsSwGrV0jGJgT/64ieE75HjAcqTItE3zBJlTjEtP2Bd6/E5tXVgZVsux3Udp3AVO3QqjtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773225479; c=relaxed/simple;
	bh=qtHjvXnzYnfUq5KGVnBZqd0cV5evIGX++5FUVgQpapI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8cuY4mavBKgdGTwBrhmoUVxtMwO2ewj6qFmXsNfLuuhualFNE018HeEnk7e2FtryzqIN4VwwkgBFrGUdClj0GOo3UvSX+I1ukF7y6ydA3JLOW0E2tnB4qjEIFxsXq3fV1bEh0HpjNUuz6jjF1Raddvu9hTDrvQRVpCr+WUYIUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=U2XHG54d; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="U2XHG54d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rrNLgVg93eKkWfvuHMRQPxzjsAlzpF6GPjuVeUevcTU=; b=U2XHG54davQHVyena2u+T3pM8z
	1HWDN11RtIFCDtONLw+GC6B0Bf1sT7htFQ7REOGPrtx2MRPNKL8MnpCEjw+IhKi24ieRTUn4uQD68
	V83KAybKaR6oh71UFmn1VlLROtGtgQh+PyFAQPbN7XSuL6zxYqQzfdw1H4XJnt3+X4hIStZbNvskF
	JAFAJCHlhR4xJ7MjGVIA7tyei7N/e0u2rxd4EdfgGFFkzeFKp0UaIZGRMn7JDnBbbaiC1Jh+e+y+X
	0zm5x6pInTdsqzRKcFfX/FHwsu0z9jWvKIxmXEDI3GgOJZMja6WzaGrJvl3nap5DT85qK9EAMaQGp
	FPieBNgg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gwi-00000009T01-2K30;
	Wed, 11 Mar 2026 10:37:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4B3F2300462; Wed, 11 Mar 2026 11:37:43 +0100 (CET)
Date: Wed, 11 Mar 2026 11:37:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	willy@infradead.org, ojaswin@linux.ibm.com, yi.zhang@huawei.com,
	jack@suse.cz, tytso@mit.edu
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20260311103743.GK606826@noisy.programming.kicks-ass.net>
References: <abBizpKaBlTZSYh6@sirena.org.uk>
 <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/s3zE0O4BWsP9rYk"
Content-Disposition: inline
In-Reply-To: <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk>


--/s3zE0O4BWsP9rYk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 12:00:20AM +0000, Mark Brown wrote:
> On Tue, Mar 10, 2026 at 06:28:30PM +0000, Mark Brown wrote:
> > Hi all,
> >=20
> > After merging the tip tree, today's linux-next started crashing running
> > arm64 KUnit like this:
> >=20
> > [18:12:16] [PASSED] split unwrit extent to 3 extents and convert 2nd ha=
lf writ (non-endio, zeroout) (highlevel)
> > [18:12:16] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] test_=
split_convert =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [18:12:16] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] ex=
t4_extents_test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [18:12:16] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D ext4_mballoc_test=
 (7 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Command '['qemu-system-aarch64', '-nodefaults', '-m', '1024', '-kernel'=
, '/tmp/next/arm64_kunit/arch/arm64/boot/Image.gz', '-append', 'kunit.enabl=
e=3D1 console=3DttyAMA0 kunit_shutdown=3Dreboot', '-no-reboot', '-nographic=
', '-accel', 'kvm', '-accel', 'hvf', '-accel', 'tcg', '-serial', 'stdio', '=
-machine', 'virt', '-cpu', 'max']' timed out after 300 seconds
> >=20
> > I didn't figure out what the source of the issue was, I merged the tip
> > tree from 20260309 instead.
>=20
> I tried to leave a bisect running but it got confused because a lot of
> the branches are based on v7.0-rc1 which has a separate bug that causes
> KUnit to lock up so the results are nonsense.  I did confirm an issue
> with just tip/master.  My KUnit command line running on current Debian
> stable is:
>=20
>     ./tools/testing/kunit/kunit.py run --alltests --arch arm64 --cross_co=
mpile=3Daarch64-linux-gnu-
>=20
> and I also tried:
>=20
>     ./tools/testing/kunit/kunit.py run --alltests --arch x86_64 --cross_c=
ompile=3Dx86_64-linux-gnu-
>=20
> and got:
>=20
> [23:51:03] [PASSED] split unwrit extent to 3 extents and convert 2nd half=
 writ (non-endio, zeroout) (highlevel)
> [23:51:03] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] test_sp=
lit_convert =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [23:51:03] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] ext4=
_extents_test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [23:51:03] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D ext4_mballoc_test (=
7 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [23:51:03] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D test_new_b=
locks_simple  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [23:51:03] [FAILED] block_bits=3D10 cluster_bits=3D3 blocks_per_group=3D8=
192 group_count=3D4 desc_size=3D64


Right, so I bisected this using:

  ./tools/testing/kunit/kunit.py run --alltests --build_dir=3D$PWD/kunit-bu=
ild/ --arch=3Dx86_64 ext4_*

and hit:

  25500ba7e77c ("locking/mutex: Remove the list_head from struct mutex")

After much staring, I couldn't find anything wrong with it, and decided
to add a few DEBUG options on. And it magically started working.

Then I did a KASAN run of the above, and that got me the below.
There seems to have been some recent commits in this area, Cc'ed
relevant people.

[11:17:27] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[11:17:27] BUG: KASAN: slab-use-after-free in __percpu_counter_init_many+0x=
21b/0x2f0
[11:17:27] Write of size 8 at addr ffff8880029425a8 by task kunit_try_catch=
/37
[11:17:27]
[11:17:27] CPU: 0 UID: 0 PID: 37 Comm: kunit_try_catch Tainted: G          =
       N  7.0.0-rc1-00023-g25500ba7e77c #3 PREEMPT(lazy)
[11:17:27] Tainted: [N]=3DTEST
[11:17:27] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 =
11/11/2019
[11:17:27] Call Trace:
[11:17:27]  <TASK>
[11:17:27]  dump_stack_lvl+0x4e/0x70
[11:17:27]  print_report+0x152/0x4b0
[11:17:27]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[11:17:27]  ? __pfx_mutex_unlock+0x10/0x10
[11:17:27]  ? __percpu_counter_init_many+0x21b/0x2f0
[11:17:27]  kasan_report+0xe0/0x110
[11:17:27]  ? __percpu_counter_init_many+0x21b/0x2f0
[11:17:27]  __percpu_counter_init_many+0x21b/0x2f0
[11:17:27]  ext4_es_register_shrinker+0x115/0x3e0
[11:17:27]  ? kasan_save_track+0x14/0x30
[11:17:27]  extents_kunit_init+0x1d1/0x890
[11:17:27]  kunit_try_run_case+0x170/0x2d0
[11:17:27]  ? __pfx_kunit_try_run_case+0x10/0x10
[11:17:27]  ? kthread_affine_node+0x1b3/0x250
[11:17:27]  ? __pfx_kthread_affine_node+0x10/0x10
[11:17:27]  ? __pfx_kunit_try_run_case+0x10/0x10
[11:17:27]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
[11:17:27]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
[11:17:27]  kthread+0x2dc/0x3c0
[11:17:27]  ? recalc_sigpending+0x15d/0x1e0
[11:17:27]  ? __pfx_kthread+0x10/0x10
[11:17:27]  ret_from_fork+0x445/0x610
[11:17:27]  ? __pfx_ret_from_fork+0x10/0x10
[11:17:27]  ? __switch_to+0x31/0xd60
[11:17:27]  ? __switch_to_asm+0x39/0x70
[11:17:27]  ? __switch_to_asm+0x33/0x70
[11:17:27]  ? __pfx_kthread+0x10/0x10
[11:17:27]  ret_from_fork_asm+0x1a/0x30
[11:17:27]  </TASK>
[11:17:27]
[11:17:27] Allocated by task 35:
[11:17:27]  kasan_save_stack+0x30/0x50
[11:17:27]  kasan_save_track+0x14/0x30
[11:17:27]  __kasan_kmalloc+0x8f/0xa0
[11:17:27]  extents_kunit_init+0xf0/0x890
[11:17:27]  kunit_try_run_case+0x170/0x2d0
[11:17:27]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
[11:17:27]  kthread+0x2dc/0x3c0
[11:17:27]  ret_from_fork+0x445/0x610
[11:17:27]  ret_from_fork_asm+0x1a/0x30
[11:17:27]
[11:17:27] Freed by task 36:
[11:17:27]  kasan_save_stack+0x30/0x50
[11:17:27]  kasan_save_track+0x14/0x30
[11:17:27]  kasan_save_free_info+0x3b/0x60
[11:17:27]  __kasan_slab_free+0x43/0x70
[11:17:27]  kfree+0x130/0x330
[11:17:27]  extents_kunit_exit+0x5b/0x90
[11:17:27]  kunit_try_run_case_cleanup+0xad/0xe0
[11:17:27]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
[11:17:27]  kthread+0x2dc/0x3c0
[11:17:27]  ret_from_fork+0x445/0x610
[11:17:27]  ret_from_fork_asm+0x1a/0x30
[11:17:27]
[11:17:27] The buggy address belongs to the object at ffff888002942000
[11:17:27]  which belongs to the cache kmalloc-4k of size 4096
[11:17:27] The buggy address is located 1448 bytes inside of
[11:17:27]  freed 4096-byte region [ffff888002942000, ffff888002943000)
[11:17:27]
[11:17:27] The buggy address belongs to the physical page:
[11:17:27] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 p=
fn:0x2940
[11:17:27] head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pin=
count:0
[11:17:27] flags: 0x4000000000000040(head|zone=3D1)
[11:17:27] page_type: f5(slab)
[11:17:27] raw: 4000000000000040 ffff888001041d00 dead000000000100 dead0000=
00000122
[11:17:27] raw: 0000000000000000 0000000000040004 00000000f5000000 00000000=
00000000
[11:17:27] head: 4000000000000040 ffff888001041d00 dead000000000100 dead000=
000000122
[11:17:27] head: 0000000000000000 0000000000040004 00000000f5000000 0000000=
000000000
[11:17:27] head: 4000000000000003 ffffea00000a5001 00000000ffffffff 0000000=
0ffffffff
[11:17:27] head: 0000000000000000 0000000000000000 00000000ffffffff 0000000=
000000000
[11:17:27] page dumped because: kasan: bad access detected
[11:17:27]
[11:17:27] Memory state around the buggy address:
[11:17:27]  ffff888002942480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb =
fb
[11:17:27]  ffff888002942500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb =
fb
[11:17:27] >ffff888002942580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb =
fb
[11:17:27]                                   ^
[11:17:27]  ffff888002942600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb =
fb
[11:17:27]  ffff888002942680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb =
fb
[11:17:27] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[11:17:27] Disabling lock debugging due to kernel taint
[11:17:27] # [extent 0] exp: lblk:10 len:1 unwrit:1
[11:17:27] # [extent 0] got: lblk:10 len:1 unwrit:1
[11:17:27] ------------------
[11:17:27] # [extent 1] exp: lblk:11 len:2 unwrit:0
[11:17:27] # [extent 1] got: lblk:11 len:2 unwrit:0
[11:17:27] ------------------
[11:17:27] [FAILED] split unwrit extent to 2 extents and convert 2nd half w=
rit


--/s3zE0O4BWsP9rYk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAmmxRewACgkQdkfhpEvA
5LpTJA/+MJImWQRWi++06dg0AMtRumVjfI7PQIV2ikwLj9mQlNbPAq2wXj3Yz/tP
YSk58xbUiWEI7PbYVzn2+J//DkfnCQQ9Gd38maHY0Kq0SLkBro1lzxwwytqxbCSW
9SsRvzjKxiQijEfdIEKkCwdtrL2+xA/HEtdQIcloFgPdIrjO8T9aDP/n3KZyHuUX
41uUWtvnfRhpNdAlAizUA/oNJSpm69bXxi8tvGzsVjt1QKo6ZrBLpsgi7jHAw/cN
oDJ2YD/Hjs34dNuvvuQliKpQiMSUH6prU3WSH9/XCALoIhb+PLPXznjY2FAQe/KS
H1sWB0O3RcmqYN5fBtRyF1TrGafwrvsihy5QL3M56DNnQtg8ed1eBl8jvmzQZKFw
OG7I7Xs4a02xu+0VOZTPKqOfFqGlf1iQ6bIuxjaNfYYUuI3qEBWrNUuxKPSS1N4C
FCoX5Mhm7xLwWhdAouS9KN1wA3jX4GYBtV45I63bjGLYL+GC7DDpcEMjmK2T8EKF
YYrDpOI6tqi+so2PkLOKQfUMLsaxh1i3zer4flw5FLrimO+lkbnbPZVrqk+/iAIa
ItqHJpzHXs+ySRl9Ni+NYkWpE3t2DqIz7R13NYERTAT9D3HcJMvKlVXPYNmjKPn9
vyiJJ1Y6M/Y35zXhPw7aNT/v48qbHag0T4pqTBc6lMIUz3oepGo=
=/WpK
-----END PGP SIGNATURE-----

--/s3zE0O4BWsP9rYk--
