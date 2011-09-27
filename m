From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH -next] qdio: add missing export.h include
Date: Tue, 27 Sep 2011 18:33:30 -0400
Message-ID: <4E824F3A.6070302@windriver.com>
References: <1316676108-5729-1-git-send-email-heiko.carstens@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:56950 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753116Ab1I0Wdi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2011 18:33:38 -0400
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

Now that I look at this, and the other patch, I'm not
seeing how this is possible.  Unless there is some
convoluted CPP magic going on, I don't see any instances
of EXPORT_SYMBOL in qdio_setup.c -- similarly I don't
see any module_ or MODULE_ references in zfcp_qdio.c

Am I missing something obvious here?   The line numbers
you quote dont match anything meaningful -- so I'm wondering
if perhaps these changes are meant to be in advance of the
s390 changes you've got queued in next -- which is fine, but
it would be nice to have that called out.

Thanks,
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
