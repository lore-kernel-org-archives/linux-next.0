From: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH] tpm: Move tpm_tis_reenable_interrupts out of CONFIG_PNP
 block
Date: Sun, 17 Jul 2011 08:14:21 -0400
Message-ID: <4E22D21D.9070903@linux.vnet.ibm.com>
References: <1310879064.15064.4.camel@d941e-10> <20110716223426.f1507465.rdunlap@xenotime.net> <20110717115320.GA14595@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e7.ny.us.ibm.com ([32.97.182.137]:56882 "EHLO e7.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750945Ab1GQMO1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Jul 2011 08:14:27 -0400
In-Reply-To: <20110717115320.GA14595@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>, sfr@canb.auug.org.au, srajiv@linux.vnet.ibm.com, jmorris@namei.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, kongjianjun@gmail.co

On 07/17/2011 07:53 AM, Harry Wei wrote:
> On Sat, Jul 16, 2011 at 10:34:26PM -0700, Randy Dunlap wrote:
>> New warning:
>> drivers/char/tpm/tpm_tis.c:97: warning: 'is_itpm' defined but not used
> From: Harry Wei <harryxiyou@gmail.com>
>
> This patch can fix above warning.
>
> Reported-by: Randy Dunlap <rdunlap@xenotime.net>
> Signed-off-by: Harry Wei <harryxiyou@gmail.com>
> ---
>  drivers/char/tpm/tpm_tis.c |   20 --------------------
>  1 files changed, 0 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
> index dd21df5..5929bb2 100644
> --- a/drivers/char/tpm/tpm_tis.c
> +++ b/drivers/char/tpm/tpm_tis.c
> @@ -79,26 +79,6 @@ enum tis_defaults {
>  static LIST_HEAD(tis_chips);
>  static DEFINE_SPINLOCK(tis_lock);
>
> -#ifdef CONFIG_ACPI
> -static int is_itpm(struct pnp_dev *dev)
> -{
> -	struct acpi_device *acpi = pnp_acpi_device(dev);
> -	struct acpi_hardware_id *id;
> -
> -	list_for_each_entry(id, &acpi->pnp.ids, list) {
> -		if (!strcmp("INTC0102", id->id))
> -			return 1;
> -	}
> -
> -	return 0;
> -}
> -#else
> -static int is_itpm(struct pnp_dev *dev)
> -{
> -	return 0;
> -}
> -#endif
> -
>  static int check_locality(struct tpm_chip *chip, int l)
>  {
>  	if ((ioread8(chip->vendor.iobase + TPM_ACCESS(l)) &
It's not dead code. You'll get a compiler error once CONFIG_PNP is
enabled. NACK.

Stefan
