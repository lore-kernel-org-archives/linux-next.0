From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Thu, 29 Sep 2016 14:25:14 +0200
Message-ID: <4057532.rZT5v6PsDv@vostro.rjw.lan>
References: <20160929132007.4fa85f3a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:58511 "HELO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with SMTP id S1753068AbcI2MSr (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Sep 2016 08:18:47 -0400
In-Reply-To: <20160929132007.4fa85f3a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Denys Vlasenko <dvlasenk@redhat.com>, Chen Yu <yu.c.chen@intel.com>

On Thursday, September 29, 2016 01:20:07 PM Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> arch/x86/power/hibernate_64.c: In function 'hibernation_e820_save':
> arch/x86/power/hibernate_64.c:236:15: error: passing argument 1 of 'get_e820_md5' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   get_e820_md5(&e820_saved, buf);
>                ^
> arch/x86/power/hibernate_64.c:203:12: note: expected 'struct e820map *' but argument is of type 'struct e820map **'
>  static int get_e820_md5(struct e820map *map, void *buf)
>             ^
> arch/x86/power/hibernate_64.c: In function 'hibernation_e820_mismatch':
> arch/x86/power/hibernate_64.c:249:21: error: passing argument 1 of 'get_e820_md5' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   ret = get_e820_md5(&e820_saved, result);
>                      ^
> arch/x86/power/hibernate_64.c:203:12: note: expected 'struct e820map *' but argument is of type 'struct e820map **'
>  static int get_e820_md5(struct e820map *map, void *buf)
>             ^
> 
> Caused by commit
> 
>   475339684ef1 ("x86/e820: Prepare e280 code for switch to dynamic storage")
> 
> interacting with commit
> 
>   6f95ad2b6162 ("PM / hibernate: Verify e820 memory map by MD5 digest")
> 
> from the pm tree.
> 
> I have applied the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 29 Sep 2016 13:13:45 +1000
> Subject: [PATCH] pm/hibernate: merge fix for type of e820_saved changing
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/x86/power/hibernate_64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/power/hibernate_64.c b/arch/x86/power/hibernate_64.c
> index 72f2c9531b03..904048f7a9c9 100644
> --- a/arch/x86/power/hibernate_64.c
> +++ b/arch/x86/power/hibernate_64.c
> @@ -233,7 +233,7 @@ static int get_e820_md5(struct e820map *map, void *buf)
>  
>  static void hibernation_e820_save(void *buf)
>  {
> -	get_e820_md5(&e820_saved, buf);
> +	get_e820_md5(e820_saved, buf);
>  }
>  
>  static bool hibernation_e820_mismatch(void *buf)
> @@ -246,7 +246,7 @@ static bool hibernation_e820_mismatch(void *buf)
>  	if (!memcmp(result, buf, MD5_DIGEST_SIZE))
>  		return false;
>  
> -	ret = get_e820_md5(&e820_saved, result);
> +	ret = get_e820_md5(e820_saved, result);
>  	if (ret)
>  		return true;
>  
> 

Looks good to me, thanks Stephen!

Rafael
