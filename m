From: Alan Cox <alan@linux.intel.com>
Subject: Re: linux-next: Tree for Feb 10 (sep_crypto)
Date: Sat, 11 Feb 2012 10:43:20 +0000
Message-ID: <20120211104320.1ba5d23d@bob.linux.org.uk>
References: <20120210171937.6b3e08e6b34c79416181a362@canb.auug.org.au>
	<4F35DB8D.8090706@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:12339 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753367Ab2BKK3b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 11 Feb 2012 05:29:31 -0500
In-Reply-To: <4F35DB8D.8090706@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 10 Feb 2012 19:07:57 -0800
Randy Dunlap <rdunlap@xenotime.net> wrote:

> On 02/09/2012 10:19 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20120209:
> 
> > ----------------------------------------------------------------------------
> 
> 
> on x86_64:
> 
> sep_crypto.c:(.text+0x155d32): undefined reference to
> `ablkcipher_walk_phys' drivers/built-in.o: In function `sep_dequeuer':

Thanks.. Will take a look Monday. I think I know what that is.

Alan
