From: Chris Metcalf <cmetcalf@tilera.com>
Subject: Re: linux-next: build failure after merge of the final tree (tile
 tree related)
Date: Tue, 24 May 2011 08:25:18 -0400
Message-ID: <4DDBA3AE.6080608@tilera.com>
References: <20110524134203.62d859c0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110524134203.62d859c0.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 5/23/2011 11:42 PM, Stephen Rothwell wrote:
> Hi Chris,
>
> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
>
> [...]
>
> I added this patch for today:
>
> [...]
>
> diff --git a/include/linux/compat.h b/include/linux/compat.h
> index 644e1a4..ddcb7db 100644
> --- a/include/linux/compat.h
> +++ b/include/linux/compat.h
> @@ -13,6 +13,7 @@
>  #include <linux/socket.h>
>  #include <linux/if.h>
>  #include <linux/fs.h>
> +#include <linux/aio_abi.h>	/* for aio_context_t */
>  
>  #include <asm/compat.h>
>  #include <asm/siginfo.h>

Stephen, thanks for the discovery and the fix.  Apparently the uses in the
"tile" tree already happen to have this header included earlier, so I
didn't trip up against it.  I'll take the change into my tree.

-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com
