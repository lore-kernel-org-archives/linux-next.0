From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: Tree for September 13
Date: Sat, 13 Sep 2008 10:33:10 -0500
Message-ID: <1221319990.3516.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from accolon.hansenpartnership.com ([76.243.235.52]:58939 "EHLO
	accolon.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752768AbYIMPdN (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sat, 13 Sep 2008 11:33:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>

Actually, there's a grave problem with this tree in that it's missing
90% of the SCSI tree for upstream.  Until this can be fixed, could
people test this merge candidate tree instead:

http://www.kernel.org/pub/linux/kernel/people/jejb/merge-tree/

2.6.27-rc6-mc1 contains all of linux-next-20080913 plus all the missing
bits.

There's also a corresponding git tree here:

git://git.kernel.org/pub/scm/linux/kernel/jejb/merge-tree/.git

The reason we need this done is because the SCSI patches could do with a
thorough test run, particularly in the areas of block layer timers and
the new target reset infrastructure.

There's a cron job running that will build a new merge candidate tree
nightly (in the above directory) from whatever the latest incarnation of
linux-next is, so it will give daily snapshots.

Thanks,

James
