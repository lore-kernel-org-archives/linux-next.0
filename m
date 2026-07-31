Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F1540242B;
	Fri, 31 Jul 2026 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509383; cv=none; b=n53NN17BKspPOZZgz9vOwGusNeHJbR0yb81URFk9BD3j0GIVDNTN9I1fXbot1Hj946KbQLBBi+C3DQOxG0mvLX6ZtW9LiXivhqByeEg/MhvkQyD2tRZo4K7eloKZklLI46DUWK8zyNu/n3o/Pldac+/iZ2DBSM2/ahyPBMnezPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509383; c=relaxed/simple;
	bh=JNMnH6IHZ1+BzkWo5cxCAMRy4qzh1BqUlJDzLZ/SnEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kTqCKPmpxWtDlE/TNlXojWV6+Cikm3iRErjnyaNcz+0gSBWNYM+ro8Uc5G0DT7J02oEvCkZRD+IduWVy0HljOx72OHUhktMZltEtp1qAaaldd8chpVNiGgEWj+gIUs9CFR7iWsQOW1Td60AGinmJLj4mV/OlQUpkWD4iqJVvVoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7virkJz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7virkJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577221F000E9;
	Fri, 31 Jul 2026 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785509382;
	bh=InbkeZAjxWvu3ho1SpjIxrdr4cqmGolT6YTKoHhzXzo=;
	h=Date:From:To:Cc:Subject;
	b=N7virkJzfrAJ149OHoRyOs4GAs8OH4z0SALTQChY/VaNSljAfR5tN7uPiidWDPG5C
	 HChqWrQIOy56Iui1rlMNeRLG+00zQrKzMVNNx4OCZG2vkvexZ3Q3ZkUOlebeDuwM8/
	 /nWtTCb2VvBUxtsg+jRmLlMcZccRJn7vQi8zCum0FHLmt955htftvsOnyXt3ePU+r+
	 fzmx1bPLef6JkJpZFVEHbdRUMs9DO1ONPBLhLatvAYZs5Ni8R3ecJda+7kMxCMvZif
	 sLZuFS4YtsDab/RolvuzwVajS4yM8sPCCHy/bmjY2C6Bm35KJnKvsZl9Z+/VlxBHJL
	 lISXrOXKaXttA==
Date: Fri, 31 Jul 2026 15:49:38 +0100
From: Mark Brown <broonie@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the paulmck tree
Message-ID: <amy2ApH8MZnll3Ff@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MxKYV32C4D1bdBJb"
Content-Disposition: inline


--MxKYV32C4D1bdBJb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the paulmck tree, today's linux-next build
(arm64 allnoconfig) failed like this:

In file included from /tmp/next/build/arch/arm64/include/asm/rwonce.h:81,
                 from /tmp/next/build/include/linux/compiler.h:369,
                 from /tmp/next/build/include/linux/proc_fs.h:8,
                 from /tmp/next/build/kernel/time/timer_list.c:8:
/tmp/next/build/kernel/time/timer_list.c: In function 'print_base':
/tmp/next/build/include/asm-generic/rwonce.h:44:71: error: lvalue required as unary '&' operand
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                                                       ^
/tmp/next/build/include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
/tmp/next/build/kernel/time/timer_list.c:102:52: note: in expansion of macro 'READ_ONCE'
  102 |         SEQ_printf(m, "  .resolution: %u nsecs\n", READ_ONCE(hrtimer_resolution));
      |                                                    ^~~~~~~~~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:290: kernel/time/timer_list.o] Error 1
make[5]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/arch/arm64/include/asm/rwonce.h:81,
                 from /tmp/next/build/include/linux/compiler.h:369,
                 from /tmp/next/build/include/linux/build_bug.h:5,
                 from /tmp/next/build/include/linux/bits.h:30,
                 from /tmp/next/build/include/linux/bitops.h:6,
                 from /tmp/next/build/arch/arm64/include/asm/cache.h:40,
                 from /tmp/next/build/include/vdso/cache.h:5,
                 from /tmp/next/build/include/linux/cache.h:6,
                 from /tmp/next/build/include/linux/time.h:5,
                 from /tmp/next/build/kernel/time/alarmtimer.c:15:
/tmp/next/build/kernel/time/alarmtimer.c: In function 'alarm_clock_getres':
/tmp/next/build/include/asm-generic/rwonce.h:44:71: error: lvalue required as unary '&' operand
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                                                       ^
/tmp/next/build/include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
/tmp/next/build/kernel/time/alarmtimer.c:606:23: note: in expansion of macro 'READ_ONCE'
  606 |         tp->tv_nsec = READ_ONCE(hrtimer_resolution);
      |                       ^~~~~~~~~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:290: kernel/time/alarmtimer.o] Error 1
In file included from /tmp/next/build/arch/arm64/include/asm/rwonce.h:81,
                 from /tmp/next/build/include/linux/compiler.h:369,
                 from /tmp/next/build/include/linux/dev_printk.h:14,
                 from /tmp/next/build/include/linux/device.h:15,
                 from /tmp/next/build/include/linux/node.h:18,
                 from /tmp/next/build/include/linux/cpu.h:17,
                 from /tmp/next/build/kernel/time/hrtimer.c:25:
/tmp/next/build/kernel/time/hrtimer.c: In function 'hrtimer_forward':
/tmp/next/build/include/asm-generic/rwonce.h:44:71: error: lvalue required as unary '&' operand
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                                                       ^
/tmp/next/build/include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
/tmp/next/build/kernel/time/hrtimer.c:1100:15: note: in expansion of macro 'READ_ONCE'
 1100 |         res = READ_ONCE(hrtimer_resolution);
      |               ^~~~~~~~~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:290: kernel/time/hrtimer.o] Error 1
In file included from /tmp/next/build/arch/arm64/include/asm/rwonce.h:81,
                 from /tmp/next/build/include/linux/compiler.h:369,
                 from /tmp/next/build/include/linux/build_bug.h:5,
                 from /tmp/next/build/include/linux/bits.h:30,
                 from /tmp/next/build/include/linux/bitops.h:6,
                 from /tmp/next/build/arch/arm64/include/asm/cache.h:40,
                 from /tmp/next/build/include/vdso/cache.h:5,
                 from /tmp/next/build/include/linux/cache.h:6,
                 from /tmp/next/build/include/linux/time.h:5,
                 from /tmp/next/build/include/linux/compat.h:10,
                 from /tmp/next/build/kernel/time/posix-timers.c:12:
/tmp/next/build/kernel/time/posix-timers.c: In function 'posix_get_hrtimer_res':
/tmp/next/build/include/asm-generic/rwonce.h:44:71: error: lvalue required as unary '&' operand
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                                                       ^
/tmp/next/build/include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
/tmp/next/build/kernel/time/posix-timers.c:275:23: note: in expansion of macro 'READ_ONCE'
  275 |         tp->tv_nsec = READ_ONCE(hrtimer_resolution);
      |                       ^~~~~~~~~

Caused by commit

   84f2a4fba1353 (hrtimer: Apply {READ,WRITE}_ONCE() to hrtimer_resolution accesses)

I used the tree from next-20260730 instead.

--MxKYV32C4D1bdBJb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpstgIACgkQJNaLcl1U
h9BaXAf7BxAt+FD8f5yAxcTVfVmq3mmD3uVOEoy8BeqaKwm9gUtDOW6kLOWEuPhM
3bNgJrBhByI4jW+Q99NBoPZ403ffBIyEIQ/f0pdcv9Z2mw0vF4IEyFNhJkwBJVFL
o/+b76bB4p45/GIxeibfFBZM/likGu2xblpw6pE4be/ly02I9TyZUGi47IA/6OPe
0in9hFKZkbwM/2k96k9DbMaAIHAjaIZyvfDp4MdDZtlGmeQAVb2+RcjT5hJhI6tm
cagujRgUVJoVaBGDCacCQyewqJLnAqr7VwG2W8PGgl0mSMCYdeIWcI018kTL2tTe
tQkD/tU1h7xJdVV3cw78cbO8AdZJEw==
=1gat
-----END PGP SIGNATURE-----

--MxKYV32C4D1bdBJb--
