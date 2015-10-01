From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Oct 1 (arch/x86/ras/mce_amd_inj.c)
Date: Thu, 1 Oct 2015 11:12:12 -0700
Message-ID: <560D777C.6050009@infradead.org>
References: <20151001165001.02d3ada5@canb.auug.org.au>
 <560D6FD4.20203@infradead.org> <20151001174958.GC3544@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:51248 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753015AbbJASMY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2015 14:12:24 -0400
In-Reply-To: <20151001174958.GC3544@pd.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aravind Gopalakrishnan <aravind.gopalakrishnan@amd.com>

On 10/01/15 10:49, Borislav Petkov wrote:
> On Thu, Oct 01, 2015 at 10:39:32AM -0700, Randy Dunlap wrote:
>> On 09/30/15 23:50, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20150930:
>>>
>>
>>
>> on x86_64:
>>
>> ../arch/x86/ras/mce_amd_inj.c: In function 'toggle_nb_mca_mst_cpu':
>> ../arch/x86/ras/mce_amd_inj.c:214:42: warning: dereferencing 'void *' pointer [enabled by default]
>>   struct pci_dev *F3 = node_to_amd_nb(nid)->misc;
>>                                           ^
>> ../arch/x86/ras/mce_amd_inj.c:214:42: error: request for member 'misc' in something not a structure or union
> 
> Thanks Randy,
> 
> this is most likely due to us using node_to_amd_nb() - an AMD_NB
> facility - but we're not depending on it. Does that help?

Yes, thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> diff --git a/arch/x86/ras/Kconfig b/arch/x86/ras/Kconfig
> index 10fea5fc821e..98b3ef750984 100644
> --- a/arch/x86/ras/Kconfig
> +++ b/arch/x86/ras/Kconfig
> @@ -1,6 +1,6 @@
>  config AMD_MCE_INJ
>  	tristate "Simple MCE injection interface for AMD processors"
> -	depends on RAS && EDAC_DECODE_MCE && DEBUG_FS
> +	depends on RAS && EDAC_DECODE_MCE && DEBUG_FS && AMD_NB
>  	default n
>  	help
>  	  This is a simple debugfs interface to inject MCEs and test different
> 


-- 
~Randy
