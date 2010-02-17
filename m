From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: build warning after merge of the i2c tree
Date: Wed, 17 Feb 2010 09:34:46 +0100
Message-ID: <20100217093446.2e610f45@hyperion.delvare>
References: <20100217113855.7ebf3d39.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from poutre.nerim.net ([62.4.16.124]:61334 "EHLO poutre.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752497Ab0BQIet (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Feb 2010 03:34:49 -0500
In-Reply-To: <20100217113855.7ebf3d39.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 17 Feb 2010 11:38:55 +1100, Stephen Rothwell wrote:
> Hi Jean,
> 
> After merging the i2c tree, today's linux-next build (powerpc
> ppc64_defconfig) produced warnings like this:
> 
> In file included from include/linux/bitops.h:17,
>                  from include/linux/kernel.h:15,
>                  from drivers/i2c/i2c-boardinfo.c:19:
> arch/powerpc/include/asm/bitops.h:226: warning: declaration of 'ffs' shadows a built-in function
> 
> The x86_64 allmodconfig produces similar:
> 
> In file included from include/linux/bitops.h:17,
>                  from include/linux/kernel.h:15,
>                  from next/drivers/i2c/i2c-boardinfo.c:19:
> arch/x86/include/asm/bitops.h:395: warning: declaration of 'ffs' shadows a built-in function
> 
> Exposed by commit fa4f62e9f3a85490aebe8857e2208c37da851ce3 ("i2c: Build
> core and algo drivers with -Wshadow").
> 
> Jean, I realise that these warnings are not something your tree has
> added, just that you have exposed them.  They are a bit annoying,
> though.  I am using gcc v4.4.3.

Oh well. I had the hope that at least the header files were
Wshadow-compliant so it could be enabled for selected source files. Not
getting any warning on my own system when I tried, I thought it was
fine... If it is not, then I'll just remove this patch from my tree.
Sorry for the noise and thanks for reporting.

-- 
Jean Delvare
