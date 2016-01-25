From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: linux-next: manual merge of the mips tree with Linus' tree
Date: Mon, 25 Jan 2016 08:42:29 +0100
Message-ID: <20160125074229.GA22276@linux-mips.org>
References: <20160125092510.50a6fb35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:60816 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753321AbcAYHmg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2016 02:42:36 -0500
Content-Disposition: inline
In-Reply-To: <20160125092510.50a6fb35@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, James Hogan <james.hogan@imgtec.com>

On Mon, Jan 25, 2016 at 09:25:10AM +1100, Stephen Rothwell wrote:

> 
> Today's linux-next merge of the mips tree got conflicts in:
> 
>   arch/mips/kvm/tlb.c
> 
> between commit:
> 
>   ba049e93aef7 ("kvm: rename pfn_t to kvm_pfn_t")
> 
> from Linus' tree and commit:
> 
>   cb1b447f0c36 ("MIPS: KVM: Convert EXPORT_SYMBOL to _GPL")
> 
> from the mips tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Linus has pulled so I'm reseting my branch for you back to v4.5-rc1.

Thanks,

  Ralf
