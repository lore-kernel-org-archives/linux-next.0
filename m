From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Sun, 30 Nov 2008 21:55:38 -0500 (EST)
Message-ID: <alpine.LFD.2.00.0811302150290.3314@localhost.localdomain>
References: <20081201131029.58f6d00c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms044pub.verizon.net ([206.46.252.44]:63222 "EHLO
	vms044pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753004AbYLACzn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 30 Nov 2008 21:55:43 -0500
Received: from localhost.localdomain ([96.237.168.40])
 by vms044.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01 (built Apr
 3 2006)) with ESMTPA id <0KB6004TNG4T9DB4@vms044.mailsrvcs.net> for
 linux-next@vger.kernel.org; Sun, 30 Nov 2008 20:55:42 -0600 (CST)
In-reply-to: <20081201131029.58f6d00c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org



On Mon, 1 Dec 2008, Stephen Rothwell wrote:

> Hi Len,
> 
> Today's linux-next merge of the acpi tree got a conflict in
> drivers/acpi/blacklist.c between commit
> a6e0887f21bbab337ee32d9c0a84d7c0b6e9141b ("ACPI: delete OSI(Linux) DMI
> dmesg spam") from Linus' tree and commit
> 865596071bb89ec67a44b0ef2da172e0e733ce16 ("ACPI: delete OSI(Linux) DMI
> dmesg spam") from the acpi tree.
> 
> The former had a slightly later commit time, so I used that.  Please fix
> up the conflict in the acpi tree.

Hi Stephen,
Like linux-next, pulling the acpi tree into old copies of itself
doesn't work.

This is because I occasionally have to revise various patches and generate
"clean history" for the upstream pull into Linus' tree.
Also, I occasionally re-base branches within the tree up to
newer baselines so that they are easier to test vs upstream.

So if you pull the acpi tree into a copy of Linus' tree
then this type of conflict will go away.

thanks,
-Len
