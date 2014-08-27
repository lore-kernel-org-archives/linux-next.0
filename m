From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Aug 27
Date: Wed, 27 Aug 2014 16:58:09 -0700
Message-ID: <20140827235809.GA9598@roeck-us.net>
References: <20140827161021.298aede6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:36269 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935798AbaH0X6N (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Aug 2014 19:58:13 -0400
Content-Disposition: inline
In-Reply-To: <20140827161021.298aede6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Aug 27, 2014 at 04:10:21PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20140826:
> 
> The net tree lost its build failure.
> 
> The usb.current tree gained a build failure for which I reverted a commit.
> 
> The mfd tree lost its build failure.
> 
> The percpu tree gained a build failure so I used the version from
> next-20140826.
> 
> The staging tree still had its build failure for which I applied a
> fix patch.
> 
> The akpm-current tree lost its build failure.
> 
> The akpm tree lost its build failure and a patch that turned up elsewhere.
> 
> Non-merge commits (relative to Linus' tree): 2028
>  2105 files changed, 56310 insertions(+), 35111 deletions(-)
> 
I see a large number of build failures with this kernel.

drivers/base/dma-mapping.c: In function 'dma_common_contiguous_remap':
drivers/base/dma-mapping.c:294:2: error: implicit declaration of function
'dma_common_pages_remap' [-Werror=implicit-function-declaration]
drivers/base/dma-mapping.c:294:6: warning: assignment makes pointer from integer
without a cast [enabled by default]
drivers/base/dma-mapping.c: At top level:
drivers/base/dma-mapping.c:305:7: error: conflicting types for
'dma_common_pages_remap'
drivers/base/dma-mapping.c:294:8: note: previous implicit declaration of
'dma_common_pages_remap' was here
cc1: some warnings being treated as errors
make[2]: *** [drivers/base/dma-mapping.o] Error 1

Guenter
