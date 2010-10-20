From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: build failure after merge of the final tree
 (security-testing tree related)
Date: Thu, 21 Oct 2010 09:28:36 +1100 (EST)
Message-ID: <alpine.LRH.2.00.1010210928270.8572@tundra.namei.org>
References: <20101020161024.af794b4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:53928 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754102Ab0JTW2x (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Oct 2010 18:28:53 -0400
In-Reply-To: <20101020161024.af794b4a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>

On Wed, 20 Oct 2010, Stephen Rothwell wrote:

> Hi James,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> security/selinux/ss/services.c: In function 'security_read_policy':
> security/selinux/ss/services.c:3172: error: implicit declaration of function 'vmalloc_user'
> security/selinux/ss/services.c:3172: warning: assignment makes pointer from integer without a cast
> 
> Caused by commit ed167abda544bb7f8cf09dc3d3608c79e1cfb25f ("SELinux:
> allow userspace to read policy back out of the kernel") and
> bb17427490e1e295f3c0550c308684bd952a585d ("selinux: implement mmap
> on /selinux/policy").
> 
> Please see Rule 1 (in Documentation/SubmitChecklist).
> 
> I applied the following patch for today:

Thanks, applied.

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 20 Oct 2010 16:08:00 +1100
> Subject: [PATCH] selinux: include vmalloc.h for vmalloc_user
> 
> ---
>  security/selinux/ss/services.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
> index 3a1739b..223c1ff 100644
> --- a/security/selinux/ss/services.c
> +++ b/security/selinux/ss/services.c
> @@ -51,6 +51,7 @@
>  #include <linux/mutex.h>
>  #include <linux/selinux.h>
>  #include <linux/flex_array.h>
> +#include <linux/vmalloc.h>
>  #include <net/netlabel.h>
>  
>  #include "flask.h"
> -- 
> 1.7.1
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 

-- 
James Morris
<jmorris@namei.org>
