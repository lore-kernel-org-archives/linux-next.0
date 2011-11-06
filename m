From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: failing to fetch the sysctl tree
Date: Sun, 06 Nov 2011 15:41:50 -0800
Message-ID: <m139e0q0n5.fsf@fess.ebiederm.org>
References: <20111107095835.208466a386fbcf046c512d70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:37666 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754272Ab1KFXk7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 6 Nov 2011 18:40:59 -0500
In-Reply-To: <20111107095835.208466a386fbcf046c512d70@canb.auug.org.au>
	(Stephen Rothwell's message of "Mon, 7 Nov 2011 09:58:35 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> Fetching the sysctl tree produces this error:
>
> fatal: Couldn't find remote ref refs/heads/master
>
> And indeed the sysctl tree on git.kernel.org is completely empty (i.e.
> there are no commits).  Maybe you should remove it and recreate it as a
> fork of Linus' tree.

Something weird happened when I re-uploaded things.  Apparently hitting
Ctrl-C if when you are uploading and realized you forgot to clone from
Linus's repository is fatal to how git.kernel.org manages things.  Last
I checked I could not even delete the broken repository.

Can you please switch to linux/kernel/git/ebiederm/sysctl.git instead of
sysctl-2.6.git.

With a little luck I will have something interesting in there this
round.

Thanks,
Eric
