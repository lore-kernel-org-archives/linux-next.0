From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH -next] module.h: add stub for is_module_percpu_address
Date: Wed, 31 Mar 2010 11:34:41 +0900
Message-ID: <4BB2B4C1.5040603@kernel.org>
References: <20100330191834.f2009292.sfr@canb.auug.org.au> <4BB2358B.3090800@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:43924 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755972Ab0CaCex (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Mar 2010 22:34:53 -0400
In-Reply-To: <4BB2358B.3090800@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>

On 03/31/2010 02:31 AM, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix build for CONFIG_MODULES not enabled by providing a stub
> for is_module_percpu_address().
> 
> kernel/lockdep.c:605: error: implicit declaration of function 'is_module_percpu_address'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks.  Applied to percpu tree.

-- 
tejun
