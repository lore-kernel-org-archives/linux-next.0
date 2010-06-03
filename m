From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: Tree for June 3
Date: Thu, 3 Jun 2010 22:22:56 +0930
Message-ID: <201006032222.57411.rusty@rustcorp.com.au>
References: <20100603134753.710a64b3.sfr@canb.auug.org.au> <AANLkTilr92GkR8bfgyjtb8ToYEEAv4oCsFsfsy04HJRU@mail.gmail.com> <AANLkTim6v2s-Q5BndAKLOZKaA1wYgbU3UKJwNy-6Jkki@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:53629 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752385Ab0FCMxB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jun 2010 08:53:01 -0400
In-Reply-To: <AANLkTim6v2s-Q5BndAKLOZKaA1wYgbU3UKJwNy-6Jkki@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Young <hidave.darkstar@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

On Thu, 3 Jun 2010 05:30:09 pm Dave Young wrote:
> Seems for some module drop reference of 0 in following code of init_module:
> 
>        /* Drop initial reference. */
>         module_put(mod);

Thanks Dave, good bug report.

It was "module: refactor load_module part 4" where I initialized 
the per-cpu pointer before allocating it:

static int module_unload_init(struct module *mod)
{
...
	/* Hold reference count during initialization. */
	__this_cpu_write(mod->refptr->incs, 1);
...
	mod->refptr = alloc_percpu(struct module_ref);
...

This also explains Stephen's crash during module load (which was more
expected since refptr is NULL, though percpu ptrs don't work that way).

I've fixed it (by reversing the order of those lines) for tomorrow's
linux-next.

Thanks!
Rusty.
