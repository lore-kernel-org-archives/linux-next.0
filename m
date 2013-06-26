From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: manual merge of the akpm tree with the powerpc tree
Date: Thu, 27 Jun 2013 07:56:20 +1000
Message-ID: <1372283780.18612.31.camel@pasglop>
References: <20130626165642.8740ecb6d5d5882b06f173c8@canb.auug.org.au>
	 <1372234231.18612.6.camel@pasglop> <20130626141916.GA30716@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:56064 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751401Ab3FZV5A (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Jun 2013 17:57:00 -0400
In-Reply-To: <20130626141916.GA30716@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org

On Wed, 2013-06-26 at 16:19 +0200, Oleg Nesterov wrote:
> 
> You were cc'ed every time ;)
> 
> > Why didn't it go through the powerpc tree ?
> 
> Because this series needs to update any user of
> ptrace_get/put_breakpoints
> in arch/ (simply remove these calls), then change the core kernel
> code, then
> fix arch/86.

That's fine. I didn't realize that was a series, thought it was a
standalone patch I had missed.

Ben.
