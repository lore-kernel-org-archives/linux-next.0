From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: xtensa: switch to generic clone()
Date: Tue, 27 Nov 2012 06:48:50 +0000
Message-ID: <20121127064850.GE4939@ZenIV.linux.org.uk>
References: <CAMo8BfLK4syxXEjwWXixdxMaPrVgec1u7pTHqTvWO4zfpYLEsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:47572 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756884Ab2K0Gsv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Nov 2012 01:48:51 -0500
Content-Disposition: inline
In-Reply-To: <CAMo8BfLK4syxXEjwWXixdxMaPrVgec1u7pTHqTvWO4zfpYLEsw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-next@vger.kernel.org, Chris Zankel <chris@zankel.net>

On Tue, Nov 27, 2012 at 08:48:24AM +0300, Max Filippov wrote:
> Hi Al,
> 
> looks like the following hunk is missing in the commit
>   a4bcde6 xtensa: switch to generic clone()
> found in the linux-next tree next-20121126, which breaks xtensa builds.
> 
> ---
> diff --git a/arch/xtensa/include/asm/syscall.h
> b/arch/xtensa/include/asm/syscall.h
> index b00c928..cd53ec2 100644
> --- a/arch/xtensa/include/asm/syscall.h
> +++ b/arch/xtensa/include/asm/syscall.h
> @@ -8,6 +8,8 @@
>   * Copyright (C) 2001 - 2007 Tensilica Inc.
>   */
> 
> +#include <asm-generic/syscalls.h>

The bug is real, all right, but I'm not sure I like that fix.
The problem hits in arch/xtensa/kernel/syscall.c, right?  I'd rather
get correct declaration into include/linux/syscalls.h and drop the
asm-generic/syscalls.h one.  I'll do it that way the next time I
push into for-next (in the morning, that is); for now your variant
will do as a temporary fix, of course.

Incidentally, xtensa_shmat() looks very similar to sys_shmat().  The
only difference is force_successful_syscall_return() in the latter
and that expands to do { } while (0) on xtensa (i.e. default gets used).
Granted, I'm half asleep right now and could've easily missed something,
but...
