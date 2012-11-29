From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: build warning after merge of the xen-two tree
Date: Thu, 29 Nov 2012 09:05:13 -0500
Message-ID: <20121129140513.GA21184@phenom.dumpdata.com>
References: <20121129142530.37630048cd37048f884b17e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:32191 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754433Ab2K2OF0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Nov 2012 09:05:26 -0500
Content-Disposition: inline
In-Reply-To: <20121129142530.37630048cd37048f884b17e9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Olaf Hering <olaf@aepfle.de>

On Thu, Nov 29, 2012 at 02:25:30PM +1100, Stephen Rothwell wrote:
> Hi Konrad,
> 
> After merging the xen-two tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> arch/x86/xen/enlighten.c: In function 'init_hvm_pv_info':
> arch/x86/xen/enlighten.c:1617:16: warning: unused variable 'ebx' [-Wunused-variable]
> arch/x86/xen/enlighten.c:1617:11: warning: unused variable 'eax' [-Wunused-variable]
> 
> Introduced by commit 9d02b43dee0d ("xen PVonHVM: use E820_Reserved area
> for shared_info").

Olaf, could you send me a patch to fix that pls?

> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
