From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: linux-next: build failure after merge of the kgdb tree
Date: Thu, 20 May 2010 19:49:51 -0500
Message-ID: <4BF5D8AF.6010408@windriver.com>
References: <20100323150443.608ad7f0.sfr@canb.auug.org.au><20100325154307.9cdeae10.sfr@canb.auug.org.au><201003242159.25770.dmitry.torokhov@gmail.com> <20100521102158.bf6df441.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:33267 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754991Ab0EUAt6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 May 2010 20:49:58 -0400
In-Reply-To: <20100521102158.bf6df441.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/20/2010 07:21 PM, Stephen Rothwell wrote:
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  kernel/debug/kdb/kdb_main.c |    6 ++----
>  1 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index f1f9309..bad8e63 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -1819,10 +1819,8 @@ static int kdb_sr(int argc, const char **argv)
>  {
>  	if (argc != 1)
>  		return KDB_ARGCOUNT;
> -	if (!__sysrq_enabled) {
> -		kdb_printf("Auto activating sysrq\n");
> -		__sysrq_enabled = 1;
> -	}
> +
> +	sysrq_toggle_support(1);
>  
>  	kdb_trap_printk++;
>  	handle_sysrq(*argv[1], NULL);
>   


Before brute force toggling it, it seems we should check the value and
restore it after the execution of handle_sysrq().

I'll have to look and see if there is an access function for this.

Jason.
