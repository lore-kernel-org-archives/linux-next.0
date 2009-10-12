From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: suspend tree build failure
Date: Tue, 13 Oct 2009 00:44:12 +0200
Message-ID: <200910130044.12494.rjw@sisk.pl>
References: <20091012140002.10f1f3d1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758354AbZJLWnV@vger.kernel.org>
In-Reply-To: <20091012140002.10f1f3d1.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Monday 12 October 2009, Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/base/power/main.c: In function 'device_pm_wait':
> drivers/base/power/main.c:218: error: 'TASK_UNINTERRUPTIBLE' undeclared (first use in this function)
> drivers/base/power/main.c:218: error: (Each undeclared identifier is reported only once
> drivers/base/power/main.c:218: error: for each function it appears in.)
> drivers/base/power/main.c:218: error: implicit declaration of function 'schedule'
> drivers/base/power/main.c: In function 'dbg_show_time':
> drivers/base/power/main.c:514: error: implicit declaration of function 'task_pid_nr'
> drivers/base/power/main.c: In function '__device_resume_noirq':
> drivers/base/power/main.c:551: error: 'TASK_NORMAL' undeclared (first use in this function)
> drivers/base/power/main.c: In function '__device_resume':
> drivers/base/power/main.c:713: error: 'TASK_NORMAL' undeclared (first use in this function)
> drivers/base/power/main.c: In function '__device_suspend_noirq':
> drivers/base/power/main.c:970: error: 'TASK_NORMAL' undeclared (first use in this function)
> drivers/base/power/main.c: In function '__device_suspend':
> drivers/base/power/main.c:1145: error: 'TASK_NORMAL' undeclared (first use in this function)
> 
> Presumably caused by commit d43c36dc6b357fa1806800f18aa30123c747a6d1
> ("headers: remove sched.h from interrupt.h") from Linus' tree.
> 
> I have added the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 12 Oct 2009 13:48:27 +1100
> Subject: [PATCH] suspend: using TASK_ macros requires sched.h

Thanks Stephen, I added your patch below to the suspend-2.6 tree.

> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/base/power/main.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index 3b09009..fb1c648 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -29,6 +29,7 @@
>  #include <linux/async.h>
>  #include <linux/completion.h>
>  #include <linux/time.h>
> +#include <linux/sched.h>
>  
>  #include "../base.h"
>  #include "power.h"

Best,
Rafael
