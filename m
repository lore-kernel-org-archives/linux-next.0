From: Dan Streetman <ddstreet@ieee.org>
Subject: Re: linux-next: build failure after merge of the modules tree
Date: Thu, 25 Jun 2015 05:51:58 -0400
Message-ID: <CALZtONA4kOn2yciNYA2C9QdXuovdjFXBca4EU4CDs6XDiQtxJQ@mail.gmail.com>
References: <20150625165447.140502c9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:35680 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751207AbbFYJwS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2015 05:52:18 -0400
In-Reply-To: <20150625165447.140502c9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Thu, Jun 25, 2015 at 2:54 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rusty,
>
> After merging the modules tree, today's linux-next build (powerpc
> allnoconfig) failed like this:

I promise I'll build with all[no|mod|yes]config next time! ;-)

Thanks for catching this one too.

>
> kernel/params.c:628:6: error: redefinition of 'kernel_param_lock'
>  void kernel_param_lock(struct module *mod)
>       ^
> In file included from include/linux/module.h:18:0,
>                  from kernel/params.c:21:
> include/linux/moduleparam.h:246:20: note: previous definition of 'kernel_param_lock' was here
>  static inline void kernel_param_lock(struct module *mod)
>                     ^
> kernel/params.c:633:6: error: redefinition of 'kernel_param_unlock'
>  void kernel_param_unlock(struct module *mod)
>       ^
> In file included from include/linux/module.h:18:0,
>                  from kernel/params.c:21:
> include/linux/moduleparam.h:249:20: note: previous definition of 'kernel_param_unlock' was here
>  static inline void kernel_param_unlock(struct module *mod)
>                     ^
>
> Caused by commit b51d23e4e9fe ("module: add per-module param_lock").
> This had not been tested with CONFIG_SYSFS not set.
>
> I have added the following patch for today (which may not be complete,
> but builds).

this is one way to handle it, but it will cause all modules to use the
built-in param_lock,
which (I don't think) is needed if there's no sysfs; another way would
be to elide the
param_lock entirely if !CONFIG_SYSFS.  I'll send a patch for that.

Rusty, is param locking needed if there is no sysfs?

>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 25 Jun 2015 16:38:51 +1000
> Subject: [PATCH] modules: clean up add per-module param_lock
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/moduleparam.h | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
> index c12f2147c350..428d7c25c383 100644
> --- a/include/linux/moduleparam.h
> +++ b/include/linux/moduleparam.h
> @@ -239,17 +239,8 @@ __check_old_set_param(int (*oldset)(const char *, struct kernel_param *))
>         return 0;
>  }
>
> -#ifdef CONFIG_SYSFS
>  extern void kernel_param_lock(struct module *mod);
>  extern void kernel_param_unlock(struct module *mod);
> -#else
> -static inline void kernel_param_lock(struct module *mod)
> -{
> -}
> -static inline void kernel_param_unlock(struct module *mod)
> -{
> -}
> -#endif
>
>  #ifndef MODULE
>  /**
> --
> 2.1.4
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
