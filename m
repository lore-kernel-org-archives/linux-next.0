From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the fastboot tree
Date: Fri, 15 Aug 2008 09:50:06 +0200
Message-ID: <20080815075006.GA2399@elte.hu>
References: <20080815174415.985eb69c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:36944 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752732AbYHOHud (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 03:50:33 -0400
Content-Disposition: inline
In-Reply-To: <20080815174415.985eb69c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Dave Hansen <haveblue@us.ibm.com>, Greg KH <greg@kroah.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> Today's linux-next merge of the fastboot tree got a trivial conflict 
> in include/linux/init.h between commit 
> 95fc5687f58152d62904e7dea36dca3a52514160 ("Dave Hansen 
> <haveblue@us.ibm.com>") from the driver-core tree and commit 

[ sidenote: interesting commit name ;-) ]

> a06e1c2b448b317bc141934879cbbbed8319b4d4 ("modules: extend 
> initcall_debug functionality to the module loader") from the fastboot 
> tree.
> 
> Just overlapping additions.  I fixed it up and will carry the fix.

thanks.

> [I have been asked to try adding the merge result diff, so just as a 
> test I have included it below.]

that's a very good idea!

[ The inlining seems a bit weird though - Mutt didnt show it in its
  default form, it only showed up when i did a reply to the mail. 
  Strange. I use mutt-1.5.18-2.fc8. ]

	Ingo
