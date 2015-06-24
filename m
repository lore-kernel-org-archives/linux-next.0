From: Dan Streetman <ddstreet@ieee.org>
Subject: Re: linux-next: build failure after merge of the modules tree
Date: Wed, 24 Jun 2015 14:18:44 -0400
Message-ID: <CALZtONAqdXeV0=Enjsw6YzuWFC-4ZqpeWfwxcEgBa+1CasqbGA@mail.gmail.com>
References: <20150624113727.4f61ba18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:34595 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752620AbbFXSTE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2015 14:19:04 -0400
In-Reply-To: <20150624113727.4f61ba18@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Tue, Jun 23, 2015 at 9:37 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rusty,
>
> After merging the modules tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

that's weird.  Are you sure it failed during allmodconfig?  I can see
why it would fail like that if CONFIG_MODULES ins't defined, which
I'll send a patch for...

>
> In file included from include/linux/linkage.h:4:0,
>                  from include/linux/kernel.h:6,
>                  from kernel/params.c:18:
> kernel/params.c: In function 'param_array':
> kernel/params.c:32:42: error: dereferencing pointer to incomplete type
>  #define KPARAM_MUTEX(mod) ((mod) ? &(mod)->param_lock : &param_lock)
>                                           ^
> include/linux/compiler.h:164:42: note: in definition of macro 'unlikely'
>  # define unlikely(x) __builtin_expect(!!(x), 0)
>                                           ^
> kernel/params.c:462:3: note: in expansion of macro 'BUG_ON'
>    BUG_ON(!KPARAM_IS_LOCKED(mod));
>    ^
> kernel/params.c:33:47: note: in expansion of macro 'KPARAM_MUTEX'
>  #define KPARAM_IS_LOCKED(mod) mutex_is_locked(KPARAM_MUTEX(mod))
>                                                ^
> kernel/params.c:462:11: note: in expansion of macro 'KPARAM_IS_LOCKED'
>    BUG_ON(!KPARAM_IS_LOCKED(mod));
>            ^
> kernel/params.c: In function 'param_array_get':
> kernel/params.c:32:42: error: dereferencing pointer to incomplete type
>  #define KPARAM_MUTEX(mod) ((mod) ? &(mod)->param_lock : &param_lock)
>                                           ^
> include/linux/compiler.h:164:42: note: in definition of macro 'unlikely'
>  # define unlikely(x) __builtin_expect(!!(x), 0)
>                                           ^
> kernel/params.c:499:3: note: in expansion of macro 'BUG_ON'
>    BUG_ON(!KPARAM_IS_LOCKED(p.mod));
>    ^
> kernel/params.c:33:47: note: in expansion of macro 'KPARAM_MUTEX'
>  #define KPARAM_IS_LOCKED(mod) mutex_is_locked(KPARAM_MUTEX(mod))
>                                                ^
> kernel/params.c:499:11: note: in expansion of macro 'KPARAM_IS_LOCKED'
>    BUG_ON(!KPARAM_IS_LOCKED(p.mod));
>            ^
> In file included from include/linux/notifier.h:13:0,
>                  from include/linux/memory_hotplug.h:6,
>                  from include/linux/mmzone.h:789,
>                  from include/linux/gfp.h:5,
>                  from include/linux/kmod.h:22,
>                  from include/linux/module.h:13,
>                  from kernel/params.c:21:
> kernel/params.c: In function 'kernel_param_lock':
> kernel/params.c:32:42: error: dereferencing pointer to incomplete type
>  #define KPARAM_MUTEX(mod) ((mod) ? &(mod)->param_lock : &param_lock)
>                                           ^
> include/linux/mutex.h:146:44: note: in definition of macro 'mutex_lock'
>  #define mutex_lock(lock) mutex_lock_nested(lock, 0)
>                                             ^
> kernel/params.c:621:13: note: in expansion of macro 'KPARAM_MUTEX'
>   mutex_lock(KPARAM_MUTEX(mod));
>              ^
> kernel/params.c: In function 'kernel_param_unlock':
> kernel/params.c:32:42: error: dereferencing pointer to incomplete type
>  #define KPARAM_MUTEX(mod) ((mod) ? &(mod)->param_lock : &param_lock)
>                                           ^
> kernel/params.c:626:15: note: in expansion of macro 'KPARAM_MUTEX'
>   mutex_unlock(KPARAM_MUTEX(mod));
>                ^
>
> Caused by commit b51d23e4e9fe ("module: add per-module param_lock").
>
> I am not exactly sure why this fails to build.  It may be an
> interaction with some other change.
>
> I have used the modules tree from next-20150623 for today.
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
