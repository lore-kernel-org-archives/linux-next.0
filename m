From: James Hogan <james.hogan@imgtec.com>
Subject: Re: EXPORT_SYMBOL(min_low_pfn);
Date: Wed, 6 Feb 2013 09:40:01 +0000
Message-ID: <511224F1.7020806@imgtec.com>
References: <CA+8MBbLW333z1Subx=fLu46u2RQXkNB1iTbORuKbq7YpZi1X_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:60999 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751276Ab3BFJkF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Feb 2013 04:40:05 -0500
In-Reply-To: <CA+8MBbLW333z1Subx=fLu46u2RQXkNB1iTbORuKbq7YpZi1X_w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Luck <tony.luck@intel.com>
Cc: Sanjay Lal <sanjayl@kymasys.com>, Ralf Baechle <ralf@linux-mips.org>, linux-next@vger.kernel.org

On 05/02/13 19:31, Tony Luck wrote:
> Today i noticed in linux-next this commit:
> 
> commit b0d9c17503444c2df8cb8e93ccfa4877edd71933
> Author: Sanjay Lal <sanjayl@kymasys.com>
> Date:   Wed Nov 21 18:34:14 2012 -0800
> 
>     MIPS: Export symbols used by KVM/MIPS module
> 
> which causes this kernel build warning on ia64:
> 
> WARNING: vmlinux: 'min_low_pfn' exported twice. Previous export was in vmlinux
> 
> 
> We just need to delete the arch/ia64 specific export (and grep says
> for arch/metag too):
> 
> $ git grep min_low_pfn | grep EXPORT
> arch/ia64/kernel/ia64_ksyms.c:EXPORT_SYMBOL(min_low_pfn);	/* defined
> by bootmem.c, but not exported by generic code */
> arch/metag/kernel/metag_ksyms.c:EXPORT_SYMBOL(min_low_pfn);
> mm/bootmem.c:EXPORT_SYMBOL(min_low_pfn);

Yes, I had noticed this the other day too. I'll probably roll the
equivalent metag patch into the metag tree since on metag it does no
real harm not exporting it at this stage.

Cheers
James
