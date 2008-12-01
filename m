From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Sun, 30 Nov 2008 23:11:50 -0500 (EST)
Message-ID: <alpine.LFD.2.00.0811302246100.3314@localhost.localdomain>
References: <20081201131029.58f6d00c.sfr@canb.auug.org.au>
 <alpine.LFD.2.00.0811302150290.3314@localhost.localdomain>
 <20081201140233.cf65c890.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms046pub.verizon.net ([206.46.252.46]:61033 "EHLO
	vms046pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751470AbYLAEMP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 30 Nov 2008 23:12:15 -0500
Received: from localhost.localdomain ([96.237.168.40])
 by vms046.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01 (built Apr
 3 2006)) with ESMTPA id <0KB6008BMJNT90B2@vms046.mailsrvcs.net> for
 linux-next@vger.kernel.org; Sun, 30 Nov 2008 22:11:54 -0600 (CST)
In-reply-to: <20081201140233.cf65c890.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org



> And if you pull Linus' tree into the acpi tree the conflict will go away
> as well ... but you (who understand the intention of the code) get to fix
> it up rather than me (who is guessing).

Your guess was correct -- the patch with the later commit time
was the correct one to keep.

This was my pilot error.  I updated the patch in my release tree
and so you got the updated patch via Linus.  But I failed to update
my test tree, so you got the old patch from my test tree.

I've just re-constituted my test branch, so the old patch is gone,
and with it this conflict.

thanks for pointing this out,
-Len
