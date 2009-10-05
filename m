From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build failure
Date: Mon, 05 Oct 2009 00:45:33 -0700 (PDT)
Message-ID: <20091005.004533.195025386.davem@davemloft.net>
References: <20091005184357.a6f41165.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40159
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758588AbZJEHpi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Oct 2009 03:45:38 -0400
In-Reply-To: <20091005184357.a6f41165.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 5 Oct 2009 18:43:57 +1100

> Today's linux-next build (sparc64 defconfig) failed like this:
> 
> arch/sparc/oprofile/init.c: In function 'timer_start':
> arch/sparc/oprofile/init.c:46: error: 'HZ' undeclared (first use in this function)
> 
> I have no idea why this just cropped up, but I have added the following
> patch for today.

I suspect:

commit a99bbaf5ee6bad1aca0c88ea65ec6e5373e86184
Author: Alexey Dobriyan <adobriyan@gmail.com>
Date:   Sun Oct 4 16:11:37 2009 +0400

    headers: remove sched.h from poll.h
    
    Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

I'll add your fix to sparc-2.6, thanks!
