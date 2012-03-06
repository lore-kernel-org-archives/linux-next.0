From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: build failure after merge of the final tree
 (moduleh/trivial trees related)
Date: Tue, 6 Mar 2012 15:14:28 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1203061513530.23367@pobox.suse.cz>
References: <20120306175844.9c97ac3bcc5579fba377fbd8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44695 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758264Ab2CFOOa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Mar 2012 09:14:30 -0500
In-Reply-To: <20120306175844.9c97ac3bcc5579fba377fbd8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jesper Juhl <jj@chaosbits.net>

On Tue, 6 Mar 2012, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/power/max8998_charger.c:198:12: error: 'THIS_MODULE' undeclared here (not in a function)
> drivers/power/max8998_charger.c:207:20: error: expected declaration specifiers or '...' before string constant
> drivers/power/max8998_charger.c:208:15: error: expected declaration specifiers or '...' before string constant
> drivers/power/max8998_charger.c:209:16: error: expected declaration specifiers or '...' before string constant
> drivers/power/max8998_charger.c:210:14: error: expected declaration specifiers or '...' before string constant
> 
> Caused by commit 13ae246db4a0 ("includecheck: delete any duplicate
> instances of module.h") from the moduleh tree interacting with commit
> ce64b8d85de9 ("power, max8998: Include linux/module.h just once in
> drivers/power/max8998_charger.c") from the trivial tree.
> 
> They both removed different includes of module.h leaving none.
> 
> I have applied the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 6 Mar 2012 17:56:45 +1100
> Subject: [PATCH] power, max8998: we need at least one include of module.h
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/power/max8998_charger.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/power/max8998_charger.c b/drivers/power/max8998_charger.c
> index d6a8c16..5c5f281 100644
> --- a/drivers/power/max8998_charger.c
> +++ b/drivers/power/max8998_charger.c
> @@ -19,6 +19,7 @@
>   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
>   */
>  
> +#include <linux/module.h>
>  #include <linux/err.h>
>  #include <linux/slab.h>
>  #include <linux/platform_device.h>

I have dropped the patch from my tree, thanks for the report Stephen.

-- 
Jiri Kosina
SUSE Labs
