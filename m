From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the tpmdd tree
Date: Wed, 10 May 2017 15:51:57 +0300
Message-ID: <20170510125157.dfv7dg7fbrmtbkzq@intel.com>
References: <20170510132327.599ddc02@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:54540 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752931AbdEJMwA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 May 2017 08:52:00 -0400
Content-Disposition: inline
In-Reply-To: <20170510132327.599ddc02@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>

Hi

On Wed, May 10, 2017 at 01:23:27PM +1000, Stephen Rothwell wrote:
> Hi Jarkko,
> 
> After merging the tpmdd tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/char/tpm/tpm_tis.c: In function 'tpm_tis_init':
> drivers/char/tpm/tpm_tis.c:193:23: error: passing argument 1 of 'check_acpi_tpm2' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   rc = check_acpi_tpm2(dev);
>                        ^
> drivers/char/tpm/tpm_tis.c:129:12: note: expected 'struct acpi_device *' but argument is of type 'struct device *'
>  static int check_acpi_tpm2(struct acpi_device *dev)
>             ^
> 
> Caused by commit
> 
>   e3b975d27b46 ("tpm_tis: Consolidate the platform and acpi probe flow")
> 
> CONFIG_ACPI is not set for this build.
> 
> I have added the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 10 May 2017 13:15:35 +1000
> Subject: [PATCH] tpm_tis: fixup for CONFIG_ACPI not set
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/char/tpm/tpm_tis.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
> index 54d90e31a7b6..b14d4aa97af8 100644
> --- a/drivers/char/tpm/tpm_tis.c
> +++ b/drivers/char/tpm/tpm_tis.c
> @@ -126,7 +126,7 @@ static int check_acpi_tpm2(struct device *dev)
>  	return 0;
>  }
>  #else
> -static int check_acpi_tpm2(struct acpi_device *dev)
> +static int check_acpi_tpm2(struct device *dev)
>  {
>  	return 0;
>  }
> -- 
> 2.11.0
> 
> -- 
> Cheers,
> Stephen Rothwell

Thank you! I'll squash this.

/Jarkko
