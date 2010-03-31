From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH -next] module.h: add stub for is_module_percpu_address
Date: Wed, 31 Mar 2010 23:29:09 +1030
Message-ID: <201003312329.09722.rusty@rustcorp.com.au>
References: <20100330191834.f2009292.sfr@canb.auug.org.au> <4BB2358B.3090800@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:40618 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757348Ab0CaM7M (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 31 Mar 2010 08:59:12 -0400
In-Reply-To: <4BB2358B.3090800@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tejun Heo <tj@kernel.org>

On Wed, 31 Mar 2010 04:01:55 am Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix build for CONFIG_MODULES not enabled by providing a stub
> for is_module_percpu_address().
> 
> kernel/lockdep.c:605: error: implicit declaration of function 'is_module_percpu_address'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Acked-by: Rusty Russell <rusty@rustcorp.com.au>

Thanks!
Rusty.
