From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (tty
 tree related)
Date: Thu, 25 Aug 2011 07:08:20 -0700
Message-ID: <20110825140820.GA9126@kroah.com>
References: <20110825161843.daf46b6b4023926fcfeec387@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:38188 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750917Ab1HYOYn (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Aug 2011 10:24:43 -0400
Content-Disposition: inline
In-Reply-To: <20110825161843.daf46b6b4023926fcfeec387@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Timur Tabi <timur@freescale.com>, ppc-dev <linuxppc-dev@lists.ozlabs.org>

On Thu, Aug 25, 2011 at 04:18:43PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/tty/ehv_bytechan.c: In function 'udbg_init_ehv_bc':
> drivers/tty/ehv_bytechan.c:230:18: error: 'MSR_GS' undeclared (first use in this function)
> drivers/tty/ehv_bytechan.c: In function 'ehv_bc_console_write':
> drivers/tty/ehv_bytechan.c:289:24: warning: cast from pointer to integer of different size
> drivers/tty/ehv_bytechan.c: In function 'ehv_bc_console_init':
> drivers/tty/ehv_bytechan.c:355:24: warning: cast to pointer from integer of different size
> 
> Caused by commit dcd83aaff1c8 ("tty/powerpc: introduce the ePAPR embedded
> hypervisor byte channel driver").
> 
> MSR_GS is defined in arch/powerpc/include/asm/reg_booke.h which is
> included by arch/powerpc/include/asm/reg.h but only when defined
> (CONFIG_BOOKE) || defined(CONFIG_40x).

Thanks for the report.

Timur, care to send a fixup patch for this so this gets resolved?

greg k-h
