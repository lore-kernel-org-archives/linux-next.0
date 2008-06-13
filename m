From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: manual merge of block tree
Date: Fri, 13 Jun 2008 09:48:40 +0200
Message-ID: <20080613074839.GY20851@kernel.dk>
References: <20080611184729.978d62d2.sfr@canb.auug.org.au> <20080613172229.8cc6a483.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([87.55.233.238]:20641 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754229AbYFMHsm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jun 2008 03:48:42 -0400
Content-Disposition: inline
In-Reply-To: <20080613172229.8cc6a483.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Fri, Jun 13 2008, Stephen Rothwell wrote:
> > include/asm-x86/mach-voyager/irq_vectors.h	against the x86 tree (merged
> > 						into asm-x86/irq_vectors.h)
> > (There was a bug in the above file - QIC_CALL_FUNCTION_CPI is used twice
> > instead of being QIC_CALL_FUNCTION_SINGLE_CPI the second time)
> 
> That bug is still there.

Missed that one, thanks for noticing that! Fixed now.


-- 
Jens Axboe

