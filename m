From: Bing Zhao <bzhao@marvell.com>
Subject: RE: linux-next: build failure after merge of the wireless-next tree
Date: Wed, 23 Apr 2014 13:54:27 -0700
Message-ID: <477F20668A386D41ADCC57781B1F70430F70A2A9C2@SC-VEXCH1.marvell.com>
References: <20140423134753.4731f16efe32ee9f20925757@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140423134753.4731f16efe32ee9f20925757@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, "John W. Linville" <linville@tuxdriver.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Amitkumar Karwar <akarwar@marvell.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> Hi John,
> 
> After merging the wireless-next tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/net/wireless/mwifiex/pcie.c: In function 'mwifiex_pcie_fw_dump_work':
> drivers/net/wireless/mwifiex/pcie.c:2290:3: error: implicit declaration of function 'vmalloc' [-
> Werror=implicit-function-declaration]
>    entry->mem_ptr = vmalloc(memory_size + 1);
>    ^
> drivers/net/wireless/mwifiex/pcie.c:2290:18: warning: assignment makes pointer from integer without a
> cast [enabled by default]
>    entry->mem_ptr = vmalloc(memory_size + 1);
>                   ^
> drivers/net/wireless/mwifiex/pcie.c:2361:4: error: implicit declaration of function 'vfree' [-
> Werror=implicit-function-declaration]
>     vfree(entry->mem_ptr);
>     ^
> 
> Caused by commit e050c76fcf49 ("mwifiex: add firmware dump feature for
> PCIe").
> 
> I have applied this patch for today:


Sorry for the trouble and thanks a lot for the fix.

Regards,
Bing


> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 23 Apr 2014 13:44:59 +1000
> Subject: [PATCH] mwifiex: using vmallog requires including vmalloc.h
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/net/wireless/mwifiex/pcie.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/mwifiex/pcie.c b/drivers/net/wireless/mwifiex/pcie.c
> index 51989b31137a..9c1f42754bbe 100644
> --- a/drivers/net/wireless/mwifiex/pcie.c
> +++ b/drivers/net/wireless/mwifiex/pcie.c
> @@ -17,6 +17,7 @@
>   * this warranty disclaimer.
>   */
> 
> +#include <linux/vmalloc.h>
>  #include <linux/firmware.h>
> 
>  #include "decl.h"
> --
> 1.9.2
> 
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
