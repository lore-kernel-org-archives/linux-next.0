From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: manual merge of the akpm tree with the  tree
Date: Tue, 27 Sep 2011 14:22:17 +0200
Message-ID: <20110927122215.GM18553@somewhere>
References: <20110927165920.14b00e8595d10135d2a4397a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:65427 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753812Ab1I0MWW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2011 08:22:22 -0400
Content-Disposition: inline
In-Reply-To: <20110927165920.14b00e8595d10135d2a4397a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vaibhav Nagarnaik <vnagarnaik@google.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

On Tue, Sep 27, 2011 at 04:59:20PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the scsi-post-merge tree got conflicts in
> arch/x86/kernel/apic/apic.c, arch/x86/kernel/cpu/mcheck/therm_throt.c,
> arch/x86/kernel/cpu/mcheck/threshold.c and arch/x86/kernel/irq.c between
> commit ef14aea88fee ("x86: Call idle notifier after irq_enter()") from
> the rcu tree and commit 6a541324a31f ("The current interrupt traces from
> irq_handler_entry and irq_handler_exit") from the akpm tree.
> 
> Just context changes. I fixed them up (see below) and can carry the fixes
> as necessary.

Looks good as well.

Thanks!
