From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the uprobes tree with Linus' tree
Date: Tue, 28 Feb 2012 11:04:42 +0530
Message-ID: <20120228053442.GB32211@linux.vnet.ibm.com>
References: <20120228134319.033a60df8db2925d91604c18@canb.auug.org.au>
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e8.ny.us.ibm.com ([32.97.182.138]:37394 "EHLO e8.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752033Ab2B1Fft (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Feb 2012 00:35:49 -0500
Received: from /spool/local
	by e8.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <srikar@linux.vnet.ibm.com>;
	Tue, 28 Feb 2012 00:35:48 -0500
Content-Disposition: inline
In-Reply-To: <20120228134319.033a60df8db2925d91604c18@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jim Keniston <jkenisto@us.ibm.com>, Oleg Nesterov <oleg@redhat.com>

Hi Stephen,

> Today's linux-next merge of the uprobes tree got a conflict in
> kernel/fork.c between commit d80e731ecab4 ("epoll: introduce POLLFREE to
> flush ->signalfd_wqh before kfree()") from Linus' tree and commit
> 1f9eb65410a6 ("uprobes/core: handle breakpoint and signal step
> exception") from the uprobes tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Okay, Thanks for letting me know. 

I will fix this up accordingly.
