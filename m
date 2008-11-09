From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: arm build failure
Date: Sun, 9 Nov 2008 10:26:12 +0000
Message-ID: <20081109102612.GA1288@flint.arm.linux.org.uk>
References: <20081107131128.1cf9feb2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:37397 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753821AbYKIK0l (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 9 Nov 2008 05:26:41 -0500
Content-Disposition: inline
In-Reply-To: <20081107131128.1cf9feb2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Fri, Nov 07, 2008 at 01:11:28PM +1100, Stephen Rothwell wrote:
> An arm rpc_defconfig build of next-20081106 produced these errors:
> 
> arch/arm/mm/copypage-v3.c:37: error: 'from' undeclared (first use in this function)
> arch/arm/mm/copypage-v3.c:37: error: 'to' undeclared (first use in this function)
> 
> Caused by commit dbe92c825b7b9be950135da97f6f293caaeaa083 ("[ARM]
> copypage: convert assembly files to C").

Should now be fixed.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
