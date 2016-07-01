From: Colin Ian King <colin.king@canonical.com>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Date: Fri, 1 Jul 2016 09:59:07 +0100
Message-ID: <577630DB.9070401@canonical.com>
References: <20160701152707.444e03b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:46600 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752311AbcGAI7f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Jul 2016 04:59:35 -0400
In-Reply-To: <20160701152707.444e03b4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 01/07/16 06:27, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> arch/powerpc/kernel/fadump.c: In function 'fadump_invalidate_dump':
> arch/powerpc/kernel/fadump.c:1014:2: error: expected ';' before '}' token
>   }
>   ^
> 
> Caused by commit
> 
>   4a03749f140c ("powerpc/fadump: Trivial fix of spelling mistake, clean up message")
> 
> I have added this fix patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 1 Jul 2016 15:19:34 +1000
> Subject: [PATCH] powerpc/fadump: add missing semicolon
> 
> Fixes: 4a03749f140c ("powerpc/fadump: Trivial fix of spelling mistake, clean up message")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/kernel/fadump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index f0664860753e..b3a663333d36 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1010,7 +1010,7 @@ static int fadump_invalidate_dump(struct fadump_mem_struct *fdm)
>  
>  	if (rc) {
>  		pr_err("Failed to invalidate firmware-assisted dump registration. Unexpected error (%d).\n", rc);
> -		return rc
> +		return rc;
>  	}
>  	fw_dump.dump_active = 0;
>  	fdm_active = NULL;
> 

Apologies for that. Thanks for fixing it up.
