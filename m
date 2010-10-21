From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: [Xen-devel] linux-next: build warning after merge of the final
 tree (xen tree related)
Date: Thu, 21 Oct 2010 14:39:56 -0700
Message-ID: <4CC0B32C.8000503@goop.org>
References: <20101021145326.9f133f40.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from claw.goop.org ([74.207.240.146]:39867 "EHLO claw.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751414Ab0JUVkD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Oct 2010 17:40:03 -0400
In-Reply-To: <20101021145326.9f133f40.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Xen Devel <Xen-devel@lists.xensource.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

 On 10/20/2010 08:53 PM, Stephen Rothwell wrote:
> Hi Jeremy,
>
> After merging the final tree, today's linux-next build (i386 defconfig)
> produced this warning:
>
> arch/x86/mm/fault.c: In function 'vmalloc_sync_all':
> arch/x86/mm/fault.c:244: warning: assignment makes integer from pointer without a cast
>
> Introduced by commit aef8b70e5c4b7753fc4bf20dbb01e93fc8883027 ("x86: hold
> mm->page_table_lock while doing vmalloc_sync").

This change got merged into tip/master, and it looks like there's
already a fix there for this warning.  I've dropped it from my branch.

Thanks,
    J
