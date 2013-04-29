From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the xen-arm tree
Date: Mon, 29 Apr 2013 09:25:12 +0100
Message-ID: <20130429082511.GA539@arm.com>
References: <20130429175426.9423279609437a2d746cbb7b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130429175426.9423279609437a2d746cbb7b@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

Stephen,

On Mon, Apr 29, 2013 at 08:54:26AM +0100, Stephen Rothwell wrote:
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-virt/platsmp.c between commit fe4bff02886b ("arm: introduce
> psci_smp_ops") from the xen-arm tree and commit c0114709ed85 ("irqchip:
> gic: Perform the gic_secondary_init() call via CPU notifier") from the
> arm-soc tree.
> 
> The former renamed the file (and contents) so I applied the following
> patch and can carry the fix as necessary (no action is required).
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 29 Apr 2013 17:52:27 +1000
> Subject: [PATCH] arm: fix for Perform the gic_secondary_init() call via CPU
>  notifier
> 
> due to code movement.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/arm/kernel/psci_smp.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/arch/arm/kernel/psci_smp.c b/arch/arm/kernel/psci_smp.c
> index 6ef139d..cd9acc7 100644
> --- a/arch/arm/kernel/psci_smp.c
> +++ b/arch/arm/kernel/psci_smp.c
> @@ -14,7 +14,6 @@
>   */
>  
>  #include <linux/init.h>
> -#include <linux/irqchip/arm-gic.h>
>  #include <linux/smp.h>
>  #include <linux/of.h>
>  
> @@ -55,11 +54,6 @@ static int __cpuinit psci_boot_secondary(unsigned int cpu,
>  	return -ENODEV;
>  }
>  
> -static void __cpuinit psci_secondary_init(unsigned int cpu)
> -{
> -	gic_secondary_init(0);
> -}
> -
>  #ifdef CONFIG_HOTPLUG_CPU
>  void __ref psci_cpu_die(unsigned int cpu)
>  {
> @@ -84,7 +78,6 @@ bool __init psci_smp_available(void)
>  }
>  
>  struct smp_operations __initdata psci_smp_ops = {
> -	.smp_secondary_init	= psci_secondary_init,
>  	.smp_boot_secondary	= psci_boot_secondary,
>  	.cpu_die		= psci_cpu_die,
>  };

The fix looks fine. Thanks.

-- 
Catalin
