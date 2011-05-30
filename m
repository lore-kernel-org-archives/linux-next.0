From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: manual merge of the idle-test tree with the  tree
Date: Sun, 29 May 2011 22:50:52 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1105292247420.10035@arrandale.kernel.org>
References: <20110530122531.53399126.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173005pub.verizon.net ([206.46.173.5]:49505 "EHLO
	vms173005pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752085Ab1E3Cu4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 29 May 2011 22:50:56 -0400
In-reply-to: <20110530122531.53399126.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

> Today's linux-next merge of the idle-test tree got a conflict in
> arch/x86/include/asm/processor.h, arch/x86/kernel/cpu/common.c and
> arch/x86/kernel/process.c between commits from Linus' tree and similar
> commits from the idle-test tree.
> 
> I used the versions from Linus' tree as they seem to have been committed
> more recently (this may not be the correct solution).

I'll refresh the offending patch in idle-test -- upstream
changed out from under it.

thanks,
-Len
