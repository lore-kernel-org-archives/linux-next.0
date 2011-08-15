From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH] evm: building without EVM enabled fixes cont
Date: Tue, 16 Aug 2011 09:24:31 +1000 (EST)
Message-ID: <alpine.LRH.2.00.1108160924171.7242@tundra.namei.org>
References: <1313413756-4920-1-git-send-email-zohar@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:32928 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752205Ab1HOXYq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Aug 2011 19:24:46 -0400
In-Reply-To: <1313413756-4920-1-git-send-email-zohar@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, David Safford <safford@watson.ibm.com>, Mimi Zohar <zohar@us.ibm.com>

On Mon, 15 Aug 2011, Mimi Zohar wrote:

> - Make the previously missing security_old_inode_init_security() stub
>   function definition static inline.
> 
> - The stub security_inode_init_security() function previously returned
>   -EOPNOTSUPP and relied on the callers to change it to 0.  The stub
>   security/security_old_inode_init_security() functions now return 0.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Mimi Zohar <zohar@us.ibm.com>

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next

-- 
James Morris
<jmorris@namei.org>
