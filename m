From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH -next] s390: add missing module.h/export.h includes
Date: Sat, 30 Jul 2011 13:41:52 -0400
Message-ID: <4E344260.8070100@windriver.com>
References: <20110730072515.GA2641@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:56085 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab1G3RmD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Jul 2011 13:42:03 -0400
In-Reply-To: <20110730072515.GA2641@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On 11-07-30 03:25 AM, Heiko Carstens wrote:
> Subject: [PATCH] s390: add missing module.h/export.h includes
> 
> From: Heiko Carstens <heiko.carstens@de.ibm.com>
> 
> Fix several compile errors on s390 caused by splitting module.h.

Thanks, I'll put this on the branch today.

P.

> 
> Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
> ---
>  arch/s390/crypto/sha_common.c    |    1 +
>  arch/s390/mm/init.c              |    1 +
>  drivers/s390/char/fs3270.c       |    1 +
>  drivers/s390/char/sclp_cpi_sys.c |    1 +
>  drivers/s390/char/vmur.c         |    1 +
>  drivers/s390/cio/chp.c           |    2 ++
>  drivers/s390/cio/qdio_debug.c    |    2 ++
>  drivers/s390/kvm/kvm_virtio.c    |    1 +
>  drivers/s390/scsi/zfcp_ccw.c     |    1 +
>  drivers/s390/scsi/zfcp_dbf.c     |    1 +
>  drivers/s390/scsi/zfcp_scsi.c    |    1 +
>  11 files changed, 13 insertions(+)
> 
> --- a/arch/s390/crypto/sha_common.c
> +++ b/arch/s390/crypto/sha_common.c
> @@ -14,6 +14,7 @@
>   */
>  
>  #include <crypto/internal/hash.h>
> +#include <linux/module.h>
>  #include "sha.h"
>  #include "crypt_s390.h"
>  
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -26,6 +26,7 @@
>  #include <linux/pfn.h>
>  #include <linux/poison.h>
>  #include <linux/initrd.h>
> +#include <linux/export.h>
>  #include <linux/gfp.h>
>  #include <asm/processor.h>
>  #include <asm/system.h>
> --- a/drivers/s390/char/fs3270.c
> +++ b/drivers/s390/char/fs3270.c
> @@ -11,6 +11,7 @@
>  #include <linux/console.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> +#include <linux/module.h>
>  #include <linux/list.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> --- a/drivers/s390/char/sclp_cpi_sys.c
> +++ b/drivers/s390/char/sclp_cpi_sys.c
> @@ -21,6 +21,7 @@
>  #include <linux/err.h>
>  #include <linux/slab.h>
>  #include <linux/completion.h>
> +#include <linux/export.h>
>  #include <asm/ebcdic.h>
>  #include <asm/sclp.h>
>  
> --- a/drivers/s390/char/vmur.c
> +++ b/drivers/s390/char/vmur.c
> @@ -12,6 +12,7 @@
>  #define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
>  
>  #include <linux/kernel_stat.h>
> +#include <linux/module.h>
>  #include <linux/cdev.h>
>  #include <linux/slab.h>
>  
> --- a/drivers/s390/cio/chp.c
> +++ b/drivers/s390/cio/chp.c
> @@ -10,6 +10,8 @@
>  #include <linux/bug.h>
>  #include <linux/workqueue.h>
>  #include <linux/spinlock.h>
> +#include <linux/export.h>
> +#include <linux/sched.h>
>  #include <linux/init.h>
>  #include <linux/jiffies.h>
>  #include <linux/wait.h>
> --- a/drivers/s390/cio/qdio_debug.c
> +++ b/drivers/s390/cio/qdio_debug.c
> @@ -7,6 +7,8 @@
>   */
>  #include <linux/seq_file.h>
>  #include <linux/debugfs.h>
> +#include <linux/uaccess.h>
> +#include <linux/export.h>
>  #include <asm/debug.h>
>  #include "qdio_debug.h"
>  #include "qdio.h"
> --- a/drivers/s390/kvm/kvm_virtio.c
> +++ b/drivers/s390/kvm/kvm_virtio.c
> @@ -20,6 +20,7 @@
>  #include <linux/virtio_console.h>
>  #include <linux/interrupt.h>
>  #include <linux/virtio_ring.h>
> +#include <linux/export.h>
>  #include <linux/pfn.h>
>  #include <asm/io.h>
>  #include <asm/kvm_para.h>
> --- a/drivers/s390/scsi/zfcp_ccw.c
> +++ b/drivers/s390/scsi/zfcp_ccw.c
> @@ -9,6 +9,7 @@
>  #define KMSG_COMPONENT "zfcp"
>  #define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
>  
> +#include <linux/module.h>
>  #include "zfcp_ext.h"
>  #include "zfcp_reqlist.h"
>  
> --- a/drivers/s390/scsi/zfcp_dbf.c
> +++ b/drivers/s390/scsi/zfcp_dbf.c
> @@ -9,6 +9,7 @@
>  #define KMSG_COMPONENT "zfcp"
>  #define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
>  
> +#include <linux/module.h>
>  #include <linux/ctype.h>
>  #include <linux/slab.h>
>  #include <asm/debug.h>
> --- a/drivers/s390/scsi/zfcp_scsi.c
> +++ b/drivers/s390/scsi/zfcp_scsi.c
> @@ -9,6 +9,7 @@
>  #define KMSG_COMPONENT "zfcp"
>  #define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
>  
> +#include <linux/module.h>
>  #include <linux/types.h>
>  #include <linux/slab.h>
>  #include <scsi/fc/fc_fcp.h>
