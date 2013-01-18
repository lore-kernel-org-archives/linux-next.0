From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jan 18 (powerclamp)
Date: Fri, 18 Jan 2013 15:01:28 -0800
Message-ID: <50F9D448.4070000@infradead.org>
References: <20130118153707.0909fb9039e411acc1674c32@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:47382 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751863Ab3ARXAY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Jan 2013 18:00:24 -0500
In-Reply-To: <20130118153707.0909fb9039e411acc1674c32@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jacob.jun.pan@linux.intel.com, rui.zhang@intel.com

On 01/17/13 20:37, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130117:
> 


on i386;

drivers/built-in.o: In function `clamp_thread':
intel_powerclamp.c:(.text+0x2d39ae): undefined reference to `__udivdi3'
drivers/built-in.o: In function `poll_pkg_cstate':
intel_powerclamp.c:(.text+0x2d3bb9): undefined reference to `__udivdi3'



-- 
~Randy
