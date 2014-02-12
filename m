From: Preeti U Murthy <preeti@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 12 Feb 2014 10:18:45 +0530
Message-ID: <52FAFD2D.2090306@linux.vnet.ibm.com>
References: <20140212134127.2c049bb94175e12201b257ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140212134127.2c049bb94175e12201b257ef@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 02/12/2014 08:11 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/cpuidle/cpuidle-pseries.c: In function 'idle_loop_prolog':
> drivers/cpuidle/cpuidle-pseries.c:32:2: error: implicit declaration of function 'ppc64_runlatch_off' [-Werror=implicit-function-declaration]
>   ppc64_runlatch_off();
>   ^
> drivers/cpuidle/cpuidle-pseries.c: In function 'idle_loop_epilog':
> drivers/cpuidle/cpuidle-pseries.c:52:2: error: implicit declaration of function 'ppc64_runlatch_on' [-Werror=implicit-function-declaration]
>   ppc64_runlatch_on();
>   ^
> 
> Caused by commit d8c6ad3184ca ("sched/idle, PPC: Remove redundant
> cpuidle_idle_call()").

Ok so after the commit

d8c6ad3184ca651:sched/idle, PPC: Remove redundant cpuidle_idle_call()
reintroduced ppc64_runlatch_off/on() in drivers/cpuidle/cpuidle-pseries.c
the cleanup caused by the commit "c0c4301c54adde05:pseries/cpuidle:
Remove redundant call to ppc64_runlatch_off() in cpu idle routines"
now needs to be introduced in part.

Below is the patch which should fix this. This is based on top of tip-tree.

Thanks

Regards
Preeti U Murthy

---------------------------------------------------------------------------------

cpuidle/pseries: Fix fallout caused due to cleanup in pseries cpuidle backend driver

From: Preeti U Murthy <preeti@linux.vnet.ibm.com>

Commit "d8c6ad3184ca651:sched/idle, PPC: Remove redundant cpuidle_idle_call()"
reintroduced ppc64_runlatch_off/on() in the pseries cpuidle backend driver.
Hence the cleanup caused by the commit "c0c4301c54adde05:pseries/cpuidle:
Remove redundant call to ppc64_runlatch_off() in cpu idle routines"  in
conjuction with the commit d8c6ad3184ca651 causes a build failure.

Signed-off-by: Preeti U Murthy <preeti@linux.vnet.ibm.com>
---
 drivers/cpuidle/cpuidle-pseries.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index d486489..6f7b019 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -17,6 +17,7 @@
 #include <asm/reg.h>
 #include <asm/machdep.h>
 #include <asm/firmware.h>
+#include <asm/runlatch.h>
 #include <asm/plpar_wrappers.h>
 
 struct cpuidle_driver pseries_idle_driver = {


> 
> I have used the tip tree from next-20140210 again today (since
> next-20140211 was broken differently).
> 
