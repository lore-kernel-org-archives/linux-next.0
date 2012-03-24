From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: bad merge in "Merge branch 'rmobile-fixes-for-linus'" ?
Date: Sat, 24 Mar 2012 18:28:00 +0000
Message-ID: <201203241828.00436.arnd@arndb.de>
References: <20120324173732.GA7509@windriver.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:51447 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751470Ab2CXS2D (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 24 Mar 2012 14:28:03 -0400
In-Reply-To: <20120324173732.GA7509@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org

On Saturday 24 March 2012, Paul Gortmaker wrote:
> Hi Arnd,
> 
> I fed this failure to git bisect:
> 
> arch/arm/mach-shmobile/setup-sh7372.c:63:2: error: implicit declaration
> of function 'init_consistent_dma_size' 
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/5941296/
> 
> and it came back with your merge below.  Can you have a look and see if
> that makes sense?
> 

Thanks a lot for the report, this was indeed my mistake when merging
the patch. Fixed now.

	Arnd
