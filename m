From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH -next] qdio: add missing export.h include
Date: Tue, 27 Sep 2011 18:17:18 -0400
Message-ID: <4E824B6E.20409@windriver.com>
References: <1316676108-5729-1-git-send-email-heiko.carstens@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:54533 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752643Ab1I0WR0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2011 18:17:26 -0400
In-Reply-To: <1316676108-5729-1-git-send-email-heiko.carstens@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, Frank Blaschka <blaschka@linux.vnet.ibm.com>, Jan Glauber <jang@linux.vnet.ibm.com>

On 11-09-22 03:21 AM, Heiko Carstens wrote:
> Fix compile breakage caused by splitting module.h:
> 
> drivers/s390/cio/qdio_setup.c:31:1:
>  warning: data definition has no type or storage class [enabled by default]
> drivers/s390/cio/qdio_setup.c:31:1:
>  warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]

Thanks, I've squashed this into what contained the other
s390 changes from you, which now touches the following:

 arch/s390/crypto/sha_common.c    |    1 +
 arch/s390/mm/init.c              |    1 +
 drivers/s390/char/fs3270.c       |    1 +
 drivers/s390/char/sclp_cpi_sys.c |    1 +
 drivers/s390/char/vmcp.c         |    1 +
 drivers/s390/char/vmur.c         |    1 +
 drivers/s390/cio/chp.c           |    2 ++
 drivers/s390/cio/qdio_debug.c    |    2 ++
 drivers/s390/cio/qdio_setup.c    |    1 +
 drivers/s390/kvm/kvm_virtio.c    |    1 +
 drivers/s390/scsi/zfcp_aux.c     |    1 +
 drivers/s390/scsi/zfcp_ccw.c     |    1 +
 drivers/s390/scsi/zfcp_dbf.c     |    1 +
 drivers/s390/scsi/zfcp_scsi.c    |    1 +
 14 files changed, 16 insertions(+)

Paul.

> 
> Cc: Frank Blaschka <blaschka@linux.vnet.ibm.com>
> Cc: Jan Glauber <jang@linux.vnet.ibm.com>
> Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
> ---
>  drivers/s390/cio/qdio_setup.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/s390/cio/qdio_setup.c b/drivers/s390/cio/qdio_setup.c
> index d9a46a4..25f4988 100644
> --- a/drivers/s390/cio/qdio_setup.c
> +++ b/drivers/s390/cio/qdio_setup.c
> @@ -7,6 +7,7 @@
>   * Author(s): Jan Glauber <jang@linux.vnet.ibm.com>
>   */
>  #include <linux/kernel.h>
> +#include <linux/export.h>
>  #include <linux/slab.h>
>  #include <asm/qdio.h>
>  
