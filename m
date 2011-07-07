From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: build failure after merge of the pci-current tree
Date: Thu, 7 Jul 2011 08:52:05 -0700
Message-ID: <20110707085205.7524a5a7@jbarnes-desktop>
References: <20110707105823.43343d2f9446f994f97cfd65@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:48425 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751882Ab1GGPwV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2011 11:52:21 -0400
In-Reply-To: <20110707105823.43343d2f9446f994f97cfd65@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ram Pai <linuxram@us.ibm.com>

On Thu, 7 Jul 2011 10:58:23 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
> 
> After merging the pci-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/built-in.o:(.toc1+0xb98): undefined reference to `pci_realloc'
> 
> Caused by commit 72007d2b4797 ("PCI: conditional resource-reallocation
> through kernel parameter pci=realloc").
> 
> I have used the pci-current tree from next-20110706 for today.

Oops, x86 bits used in common code.  I've pushed a fix that just moves
the variable into setup-bus.c rather than x86/pci/common.c.

Ram, did you see the microblaze patch I forwarded you?  It moves some
re-alloc control flags into common code; for -next it might be cleaner
to use them in a few places.  Any comments?

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center
