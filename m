From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: linux-next: build warning after merge of the mmc-uh tree
Date: Mon, 6 Jun 2016 09:51:06 +0800
Message-ID: <374e7cf7-fd34-45a7-db34-0d9337833fac@rock-chips.com>
References: <20160606113848.534cbdf7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:43266 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751806AbcFFBvf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 5 Jun 2016 21:51:35 -0400
In-Reply-To: <20160606113848.534cbdf7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: shawn.lin@rock-chips.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On 2016/6/6 9:38, Stephen Rothwell wrote:
> Hi Ulf,
>
> After merging the mmc-uh tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> In file included from include/linux/err.h:4:0,
>                  from drivers/mmc/core/mmc.c:13:
> drivers/mmc/core/mmc.c: In function 'mmc_select_hs400es':
> include/linux/err.h:21:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>  #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
>                                                  ^
> include/linux/compiler.h:170:42: note: in definition of macro 'unlikely'
>  # define unlikely(x) __builtin_expect(!!(x), 0)
>                                           ^
> drivers/mmc/core/mmc.c:1244:6: note: in expansion of macro 'IS_ERR_VALUE'
>   if (IS_ERR_VALUE(err))
>       ^

Yup, sorry for this noise. Arnd had removed a lot of IS_ERR_VALUE
abuses, but I forgot to amend this one.


Hi Ulf,

Should I come up with a new fix or you could manually amend it from
"IS_ERR_VALUE(err)" to "err < 0"? :)

>
> Introduced by commit
>
>   8141f0ace818 ("mmc: core: implement enhanced strobe support")
>
> I think error values now must be "long".
>


-- 
Best Regards
Shawn Lin
