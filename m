From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: [PATCH] ima: Fix pr_fmt() redefinition
Date: Thu, 17 May 2018 08:04:55 -0400
Message-ID: <1526558695.3306.11.camel@linux.vnet.ibm.com>
References: <20180517104702.24689-1-pvorel@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180517104702.24689-1-pvorel@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Vorel <pvorel@suse.cz>, linux-integrity@vger.kernel.org
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

Hi Petr,

On Thu, 2018-05-17 at 12:47 +0200, Petr Vorel wrote:
> Previous definition was too late and caused problems in powerpc allyesconfig:
> security/integrity/ima/ima_kexec.c:18:0: warning: "pr_fmt" redefined
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
> In file included from include/linux/kernel.h:14:0,
>                  from include/asm-generic/bug.h:18,
>                  from arch/powerpc/include/asm/bug.h:128,
>                  from include/linux/bug.h:5,
>                  from include/linux/seq_file.h:7,
>                  from security/integrity/ima/ima_kexec.c:13:
> include/linux/printk.h:288:0: note: this is the location of the previous definition
>  #define pr_fmt(fmt) fmt
> 
> Fixes: 3dea0d93d257 ("ima: Unify logging")
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

As the original patch hasn't been upstreamed yet, I'll squash this fix
with the original patch.

thanks!

Mimi

> ---
>  security/integrity/ima/ima_kexec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/security/integrity/ima/ima_kexec.c b/security/integrity/ima/ima_kexec.c
> index db0de585f6c0..16bd18747cfa 100644
> --- a/security/integrity/ima/ima_kexec.c
> +++ b/security/integrity/ima/ima_kexec.c
> @@ -10,13 +10,13 @@
>   * the Free Software Foundation; either version 2 of the License, or
>   * (at your option) any later version.
>   */
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/seq_file.h>
>  #include <linux/vmalloc.h>
>  #include <linux/kexec.h>
>  #include "ima.h"
> 
> -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> -
>  #ifdef CONFIG_IMA_KEXEC
>  static int ima_dump_measurement_list(unsigned long *buffer_size, void **buffer,
>  				     unsigned long segment_size)
