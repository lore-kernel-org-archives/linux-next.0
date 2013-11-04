From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Oct 30 (include/xen/swiotlb-xen.h)
Date: Mon, 04 Nov 2013 11:10:53 -0800
Message-ID: <5277F13D.6020003@infradead.org>
References: <20131030184511.c90aa7f40fec6b2e1652f394@canb.auug.org.au> <527153A3.5020404@infradead.org> <20131101193720.GB15622@phenom.dumpdata.com> <alpine.DEB.2.02.1311041801470.26077@kaball.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:39240 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751940Ab3KDTLR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2013 14:11:17 -0500
In-Reply-To: <alpine.DEB.2.02.1311041801470.26077@kaball.uk.xensource.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org

On 11/04/13 10:14, Stefano Stabellini wrote:
> On Fri, 1 Nov 2013, Konrad Rzeszutek Wilk wrote:
>> On Wed, Oct 30, 2013 at 11:44:51AM -0700, Randy Dunlap wrote:
>>> On 10/30/13 00:45, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> News:  I am now doing an arm multi_v7_defconfig build between each merge.
>>>>
>>>> Changes since 20131029:
>>>>
>>>> The arm defconfig build is fixed again.
>>>>
>>>> The net-next tree gained a conflict against the net tree.
>>>>
>>>> The xen-tip tree gained a conflict against the arm tree.
>>>>
>>>> The akpm-current tree gained a conflict against the tip tree and a build
>>>> failure for which I reverted 3 commits.
>>>>
>>>> Various build problems from yesterday have been resolved.
>>>
>>> on x86_64:
>>
>> Stefano, please fix that.
>  
> Thanks for the notification. I am appending the fix that I am about to
> apply to xentip/linux-next.
> 
> 
> commit bb5ebdb6a674c59cd7b5d159d6ca3c0084ee60e1
> Author: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
> Date:   Mon Nov 4 17:54:27 2013 +0000
> 
>     swiotlb-xen: missing include dma-direction.h
>     
>     Signed-off-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

Thanks for both fixes.

> diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
> index 7b64465..8b2eb93 100644
> --- a/include/xen/swiotlb-xen.h
> +++ b/include/xen/swiotlb-xen.h
> @@ -1,6 +1,7 @@
>  #ifndef __LINUX_SWIOTLB_XEN_H
>  #define __LINUX_SWIOTLB_XEN_H
>  
> +#include <linux/dma-direction.h>
>  #include <linux/swiotlb.h>
>  
>  extern int xen_swiotlb_init(int verbose, bool early);
> --


-- 
~Randy
