From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the final tree (pm tree related)
Date: Wed, 24 Oct 2012 23:40:48 +0200
Message-ID: <8858946.fOHz3dP2jS@vostro.rjw.lan>
References: <20121024144400.f5779e119f248256aa183ef5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([193.178.161.156]:35513 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964877Ab2JXVgx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Oct 2012 17:36:53 -0400
In-Reply-To: <20121024144400.f5779e119f248256aa183ef5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Youquan Song <youquan.song@intel.com>, Rik van Riel <riel@redhat.com>

On Wednesday 24 of October 2012 14:44:00 Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
> In file included from arch/powerpc/kernel/idle.c:27:0:
> include/linux/tick.h: In function 'menu_hrtimer_cancel':
> include/linux/tick.h:148:48: error: 'return' with a value, in function returning void [-Werror]
> 
> Several of these :-(

Sorry for the breakage, it shoule be fixed now.

Thanks,
Rafael


> Caused by commit 25d77b76d7ae ("cpuidle: Quickly notice prediction
> failure for repeat mode") from the pm tree.  This build has
> CONFIG_CPU_IDLE_GOV_MENU turned off.  For changes that are obviously
> affected by CONFIG options, please test build with the CONFIG option on
> and off.
> 
> I have applied the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 24 Oct 2012 14:40:47 +1100
> Subject: [PATCH] cpuidle: fix up but return type for inline function
> 
> Fixes this error when CONFIG_CPU_IDLE_GOV_MENU is not enabled:
> 
> In file included from arch/powerpc/kernel/idle.c:27:0:
> include/linux/tick.h: In function 'menu_hrtimer_cancel':
> include/linux/tick.h:148:48: error: 'return' with a value, in function returning void [-Werror]
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/tick.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/tick.h b/include/linux/tick.h
> index 8867424..40d123e 100644
> --- a/include/linux/tick.h
> +++ b/include/linux/tick.h
> @@ -145,7 +145,7 @@ static inline u64 get_cpu_iowait_time_us(int cpu, u64 *unused) { return -1; }
>  # ifdef CONFIG_CPU_IDLE_GOV_MENU
>  extern void menu_hrtimer_cancel(void);
>  # else
> -static inline void menu_hrtimer_cancel(void) { return -1; }
> +static inline void menu_hrtimer_cancel(void) { }
>  # endif /* CONFIG_CPU_IDLE_GOV_MENU */
>  
>  #endif
> 
-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
