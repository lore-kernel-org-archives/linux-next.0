Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3171A239E7F;
	Fri, 31 Jul 2026 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514565; cv=none; b=klLAEEsMq21Ek+rzBVHtamXMnERffq+Icn+qZ8TQFxUpMnhkqZ3BKJM0q6zmlkczBbkoa/mNBhT9vF5Necz72gOzTaj1dl4pVvFaw5g0OsNoMhto0xDkw0p224yMneVHFT2nFsi8tKn6WnVjQ5AAOHyTmwGQ2EqUiI8gBAHtQyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514565; c=relaxed/simple;
	bh=ilm6XKoIpVMItxAtsZRa0WO3JBFX7sdDJg0fxZHsPow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5A+29HpnX844rcVRrK/xAzq3fDpy+aNOy8vwmoxa702KMJSwwQkO0mMcMBogo3TBTH/1aO0GsXEoUJixdRhEmsAtapac7mVow05iLpdKx6cC65I2fYbfx0ZPzg0DGhcDUn+yVsji/dYkzTs40RF0w92ggJ+yyns7ue9AUpqob0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUIc6iJ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUIc6iJ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379B91F00AC4;
	Fri, 31 Jul 2026 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785514552;
	bh=0MqIrCJ+TDgktbBvkKQXT+izXlIGu2qNJDS3Sqn90G0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=RUIc6iJ6O2R/0f6aU+GJTWthuCMwQzxYq3AxUo+/nRlWRx503+5mG+VCtbnk3qAJX
	 y5OMe+lVszz1ugxCLQjVx9fKDo8gVaH5u2JRR9fTJ6DVAhjvOnTOwCJPidD5+n3kWy
	 hC+unIigL7DO7147esReixHLD+hpcdobfQTeF2eUshR2RFW+XPVzQZJYY5Sa6G7aZI
	 yEev6iTMjYkn+HNO9I3DxiiiUsaCiMw3nqrrTs6xjg+xihNig+EEuRDyKcszOMLDqi
	 QtvVuL+FSZMIUfn413W8Qz4VfYqGUv3xGWC4vXayxrnJ5QpZKP5A/+gfKdQFBPFbIZ
	 04e4lJ31uXAng==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D700BCE13A5; Fri, 31 Jul 2026 09:15:51 -0700 (PDT)
Date: Fri, 31 Jul 2026 09:15:51 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the paulmck tree
Message-ID: <dd96ea2d-8f97-4de3-9559-49236914e49b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <amy2ApH8MZnll3Ff@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amy2ApH8MZnll3Ff@sirena.org.uk>

On Fri, Jul 31, 2026 at 03:49:38PM +0100, Mark Brown wrote:
> Hi all,
> 
> After merging the paulmck tree, today's linux-next build
> (arm64 allnoconfig) failed like this:
> 
> In file included from /tmp/next/build/arch/arm64/include/asm/rwonce.h:81,
>                  from /tmp/next/build/include/linux/compiler.h:369,
>                  from /tmp/next/build/include/linux/proc_fs.h:8,
>                  from /tmp/next/build/kernel/time/timer_list.c:8:
> /tmp/next/build/kernel/time/timer_list.c: In function 'print_base':
> /tmp/next/build/include/asm-generic/rwonce.h:44:71: error: lvalue required as unary '&' operand
>    44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>       |                                                                       ^
> /tmp/next/build/include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
>    50 |         __READ_ONCE(x);                                                 \
>       |         ^~~~~~~~~~~
> /tmp/next/build/kernel/time/timer_list.c:102:52: note: in expansion of macro 'READ_ONCE'
>   102 |         SEQ_printf(m, "  .resolution: %u nsecs\n", READ_ONCE(hrtimer_resolution));
>       |                                                    ^~~~~~~~~
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:290: kernel/time/timer_list.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> In file included from /tmp/next/build/arch/arm64/include/asm/rwonce.h:81,
>                  from /tmp/next/build/include/linux/compiler.h:369,
>                  from /tmp/next/build/include/linux/build_bug.h:5,
>                  from /tmp/next/build/include/linux/bits.h:30,
>                  from /tmp/next/build/include/linux/bitops.h:6,
>                  from /tmp/next/build/arch/arm64/include/asm/cache.h:40,
>                  from /tmp/next/build/include/vdso/cache.h:5,
>                  from /tmp/next/build/include/linux/cache.h:6,
>                  from /tmp/next/build/include/linux/time.h:5,
>                  from /tmp/next/build/kernel/time/alarmtimer.c:15:
> /tmp/next/build/kernel/time/alarmtimer.c: In function 'alarm_clock_getres':
> /tmp/next/build/include/asm-generic/rwonce.h:44:71: error: lvalue required as unary '&' operand
>    44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>       |                                                                       ^
> /tmp/next/build/include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
>    50 |         __READ_ONCE(x);                                                 \
>       |         ^~~~~~~~~~~
> /tmp/next/build/kernel/time/alarmtimer.c:606:23: note: in expansion of macro 'READ_ONCE'
>   606 |         tp->tv_nsec = READ_ONCE(hrtimer_resolution);
>       |                       ^~~~~~~~~
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:290: kernel/time/alarmtimer.o] Error 1
> In file included from /tmp/next/build/arch/arm64/include/asm/rwonce.h:81,
>                  from /tmp/next/build/include/linux/compiler.h:369,
>                  from /tmp/next/build/include/linux/dev_printk.h:14,
>                  from /tmp/next/build/include/linux/device.h:15,
>                  from /tmp/next/build/include/linux/node.h:18,
>                  from /tmp/next/build/include/linux/cpu.h:17,
>                  from /tmp/next/build/kernel/time/hrtimer.c:25:
> /tmp/next/build/kernel/time/hrtimer.c: In function 'hrtimer_forward':
> /tmp/next/build/include/asm-generic/rwonce.h:44:71: error: lvalue required as unary '&' operand
>    44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>       |                                                                       ^
> /tmp/next/build/include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
>    50 |         __READ_ONCE(x);                                                 \
>       |         ^~~~~~~~~~~
> /tmp/next/build/kernel/time/hrtimer.c:1100:15: note: in expansion of macro 'READ_ONCE'
>  1100 |         res = READ_ONCE(hrtimer_resolution);
>       |               ^~~~~~~~~
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:290: kernel/time/hrtimer.o] Error 1
> In file included from /tmp/next/build/arch/arm64/include/asm/rwonce.h:81,
>                  from /tmp/next/build/include/linux/compiler.h:369,
>                  from /tmp/next/build/include/linux/build_bug.h:5,
>                  from /tmp/next/build/include/linux/bits.h:30,
>                  from /tmp/next/build/include/linux/bitops.h:6,
>                  from /tmp/next/build/arch/arm64/include/asm/cache.h:40,
>                  from /tmp/next/build/include/vdso/cache.h:5,
>                  from /tmp/next/build/include/linux/cache.h:6,
>                  from /tmp/next/build/include/linux/time.h:5,
>                  from /tmp/next/build/include/linux/compat.h:10,
>                  from /tmp/next/build/kernel/time/posix-timers.c:12:
> /tmp/next/build/kernel/time/posix-timers.c: In function 'posix_get_hrtimer_res':
> /tmp/next/build/include/asm-generic/rwonce.h:44:71: error: lvalue required as unary '&' operand
>    44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>       |                                                                       ^
> /tmp/next/build/include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
>    50 |         __READ_ONCE(x);                                                 \
>       |         ^~~~~~~~~~~
> /tmp/next/build/kernel/time/posix-timers.c:275:23: note: in expansion of macro 'READ_ONCE'
>   275 |         tp->tv_nsec = READ_ONCE(hrtimer_resolution);
>       |                       ^~~~~~~~~
> 
> Caused by commit
> 
>    84f2a4fba1353 (hrtimer: Apply {READ,WRITE}_ONCE() to hrtimer_resolution accesses)
> 
> I used the tree from next-20260730 instead.

I will drop/fix this one, apologies.

							Thanx, Paul
