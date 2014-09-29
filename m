From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Mon, 29 Sep 2014 14:30:24 -0700
Message-ID: <20140929143024.55ef9b2c3b6bf54d7d6e1758@linux-foundation.org>
References: <20140926204200.3e2175cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:41756 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbaI2VaZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Sep 2014 17:30:25 -0400
In-Reply-To: <20140926204200.3e2175cc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Fri, 26 Sep 2014 20:42:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> drivers/of/of_reserved_mem.c: In function 'of_reserved_mem_device_init':
> drivers/of/of_reserved_mem.c:253:3: warning: 'return' with no value, in function returning non-void [-Wreturn-type]
>    return;
>    ^
> drivers/of/of_reserved_mem.c:259:3: warning: 'return' with no value, in function returning non-void [-Wreturn-type]
>    return;
>    ^
> 
> Caused by commit 1a29544cc8c9 ("drivers: of: add return value to
> of_reserved_mem_device_init").  This patch changed the return type of a
> function but did not update any or the return statements in that
> function.

OK, thanks, I dropped it.  I could have fixed it but it doesn't appear
to be well tested.
