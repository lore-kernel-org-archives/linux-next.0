From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the percpu tree with the asm-generic
 tree
Date: Tue, 27 Sep 2016 22:01:26 +0200
Message-ID: <20160927200126.GA16429@mtj.duckdns.org>
References: <20160927135434.0040b41c@canb.auug.org.au>
 <201609272159.32261.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:35382 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934274AbcI0UBa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2016 16:01:30 -0400
Content-Disposition: inline
In-Reply-To: <201609272159.32261.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.chunyan@linaro.org>, Nicholas Piggin <npiggin@gmail.com>

Hello, Arnd.

On Tue, Sep 27, 2016 at 09:59:32PM +0200, Arnd Bergmann wrote:
> The merge solution seems correct, but this is one of only two trivial
> patches I have queued up for asm-generic this time, so I wonder if we could
> put the _notrace patch into the percpu tree that already has the
> raw_cpu_generic_read change to avoid the conflict.

I'll be happy to pick it up.  Can you please send me the patch
refreshed on top of percpu/for-4.9?

Thanks.

-- 
tejun
