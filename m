From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: manual merge of the powerpc tree
Date: Fri, 11 Jul 2008 21:01:25 +0200
Message-ID: <200807112101.25704.bzolnier@gmail.com>
References: <20080707230717.10429faf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.28]:56894 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761973AbYGJTFq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Jul 2008 15:05:46 -0400
Received: by yx-out-2324.google.com with SMTP id 8so1173439yxm.1
        for <linux-next@vger.kernel.org>; Thu, 10 Jul 2008 12:05:43 -0700 (PDT)
In-Reply-To: <20080707230717.10429faf.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Daniel Walker <dwalker@mvista.com>, Andrew Morton <akpm@linux-foundation.org>


Hi,

On Monday 07 July 2008, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the powerpc tree got a conflict in
> drivers/macintosh/mediabay.c between commit
> 7ad963b103d3863b1161c59f3e65a435979804ed ("ide-pmac: media-bay support
> fixes (take 4)") from the ide tree and commit
> 9a24729d8aeef967eac7af71c6a69edc83d06558 ("macintosh/media bay: Convert
> semaphore to mutex") from the powerpc tree.

Since I haven't heard back from Ben [1] on ide-pmac/media-bay IRQ issue
I took another look at ide-pmac patches and I think that it should be
possible to rework them in such way that consecutive ide patches (> 100)
won't depend on "ide-pmac: media-bay support fixes (take 4)" patch.

This would allow us to re-schedule it to 2.6.28 (which is probably what
we want because 2.6.26 is probably just around the corner and we will be
pretty busy with 2.6.27 merge window soon).  Ben, what's your opinion?

[1] which doesn't surprise me given his new responsibilities ;)

Thanks,
Bart
