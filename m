From: Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH] EDAC: Document HW_EVENT_ERR_DEFERRED type
Date: Thu, 1 Dec 2016 21:27:42 +0100
Message-ID: <20161201202741.gb3lkeohdo26fofu@pd.tnic>
References: <20161201195753.rrxgwvltptq4gegp@yaz-fedora.dyhomenet>
 <1480623893-76399-1-git-send-email-Yazen.Ghannam@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44512 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753068AbcLAU1p (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Dec 2016 15:27:45 -0500
Content-Disposition: inline
In-Reply-To: <1480623893-76399-1-git-send-email-Yazen.Ghannam@amd.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yazen Ghannam <Yazen.Ghannam@amd.com>
Cc: linux-next@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>

On Thu, Dec 01, 2016 at 02:24:53PM -0600, Yazen Ghannam wrote:
> Add a description of the HW_EVENT_ERR_DEFERRED type that wasn't included
> with commit d12a969ebbfc ("EDAC, amd64: Add Deferred Error type").
> 
> Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
> Cc: Borislav Petkov <bp@suse.de>
> Signed-off-by: Yazen Ghannam <Yazen.Ghannam@amd.com>
> ---
>  include/linux/edac.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/linux/edac.h b/include/linux/edac.h
> index cb56dcb..43cd51d 100644
> --- a/include/linux/edac.h
> +++ b/include/linux/edac.h
> @@ -128,6 +128,12 @@ enum dev_type {
>   *				fatal (maybe it is on an unused memory area,
>   *				or the memory controller could recover from
>   *				it for example, by re-trying the operation).
> + * @HW_EVENT_ERR_DEFERRED:	Deferred Error - Indicates an uncorrectable
> + *				error whose handling is not urgent. This could
> + *				be due to hardware data poisoning where the
> + *				system can continue operation until the poisoned
> + *				data is consumed. Preemptive measures may also
> + *				be taken, e.g. offlining pages, etc.
>   * @HW_EVENT_ERR_FATAL:		Fatal Error - Uncorrected error that could not
>   *				be recovered.
>   */
> -- 

Acked-by: Borislav Petkov <bp@suse.de>

Mauro, are you taking this through your tree or should I?

-- 
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imendörffer, Jane Smithard, Graham Norton, HRB 21284 (AG Nürnberg)
-- 
