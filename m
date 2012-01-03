From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: build failure after merge of the s5p tree
Date: Tue, 03 Jan 2012 17:12:54 +0900
Message-ID: <010601ccc9ef$7e784640$7b68d2c0$%kim@samsung.com>
References: <20120103180854.e9bff732db50c0fa9afd2967@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:30496 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751987Ab2ACIM5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Jan 2012 03:12:57 -0500
In-reply-to: <20120103180854.e9bff732db50c0fa9afd2967@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Greg KH' <greg@kroah.com>, 'Linus' <torvalds@linux-foundation.org>

Stephen Rothwell wrote:
> 
> Hi Kukjin,
> 
Hi,

> After merging the s5p tree, today's linux-next build (powerpc
> ppc64_defconfig) failed badly.   The problem is that you have merged into
> your tree a version of the driver-core tree that I reported broken on Dec
> 28.
> 
Oops, sorry that.

> Presumably you merged the driver-core tree to fix up some conflicts I
> have reported.  Don't do that, please.  Either leave them for Linus to
> fix up, or do a merge of Linus' tree after he has merged the (hopefully
> fixed) driver-core tree during the merge window. Or send him your tree
> unmerged with the merged version available for him to use if he wants to.
> 
OK, I see. Firstly, I will rebase my for-next as per your suggestion. As you
know, I just wanted to avoid known conflicts with driver-core tree.

> I have used the s5p tree from next-20111228 for today.

OK.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
