From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH suspend-2.6#linux-next] PM / freezer: add missing include
Date: Thu, 8 Oct 2009 22:51:48 +0200
Message-ID: <200910082251.48381.rjw@sisk.pl>
References: <20091008153051.37f043fa.sfr@canb.auug.org.au> <4ACDAF18.2030705@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760080AbZJHUvA@vger.kernel.org>
In-Reply-To: <4ACDAF18.2030705@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thursday 08 October 2009, Tejun Heo wrote:
> Fix compile failure caused by a48145a7cbf3b0555ba3ad61aaf2c38719bab95d
> forgetting to include delay.h.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

I folded it into the original patch and pushed the updated tree.

Thanks,
Rafael


> ---
>  kernel/power/process.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/power/process.c b/kernel/power/process.c
> index 66161f0..5ade1bd 100644
> --- a/kernel/power/process.c
> +++ b/kernel/power/process.c
> @@ -14,6 +14,7 @@
>  #include <linux/module.h>
>  #include <linux/syscalls.h>
>  #include <linux/freezer.h>
> +#include <linux/delay.h>
>  
>  /* 
>   * Timeout for stopping processes
> 
> 
