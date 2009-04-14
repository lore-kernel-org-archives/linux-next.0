From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: arm tree build failure
Date: Tue, 14 Apr 2009 18:09:13 +0100
Message-ID: <20090414170913.GA6903@flint.arm.linux.org.uk>
References: <20090414174814.ab274d04.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:33751 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750839AbZDNRJb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2009 13:09:31 -0400
Content-Disposition: inline
In-Reply-To: <20090414174814.ab274d04.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, Apr 14, 2009 at 05:48:14PM +1000, Stephen Rothwell wrote:
> Today's linux-next build (arm em_x270_defconfig) failed like this:
> 
> arch/arm/kernel/sys_oabi-compat.c: In function 'sys_oabi_epoll_wait':
> arch/arm/kernel/sys_oabi-compat.c:288: error: implicit declaration of function 'kmalloc'
> arch/arm/kernel/sys_oabi-compat.c:288: error: 'GFP_KERNEL' undeclared (first use in this function)
> arch/arm/kernel/sys_oabi-compat.c:288: warning: assignment makes pointer from integer without a cast
> arch/arm/kernel/sys_oabi-compat.c:301: error: implicit declaration of function 'kfree'
> arch/arm/kernel/sys_oabi-compat.c: In function 'sys_oabi_semtimedop':
> arch/arm/kernel/sys_oabi-compat.c:324: error: 'GFP_KERNEL' undeclared (first use in this function)
> arch/arm/kernel/sys_oabi-compat.c:324: warning: assignment makes pointer from integer without a cast

It'll take me a while to resolve anything; I've effectively been away since
the 7th, so I've piles of email to read through.  I do notice that other
people have fixes, but the question is what caused this to occur (and
therefore is the fix the right one.)

Expect something within a week.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
