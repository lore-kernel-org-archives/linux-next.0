From: Christoph Hellwig <hch@infradead.org>
Subject: Re: BUG: sleeping function called from invalid context at
	kernel/rwsem.c:131 XFS? (was: Re: linux-next: Tree for October 17)
Date: Fri, 17 Oct 2008 12:41:16 -0400
Message-ID: <20081017164116.GA17375@infradead.org>
References: <a4423d670810170543vd6b4c39p44bf125610d8540@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:48648 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755440AbYJQQlT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Oct 2008 12:41:19 -0400
Content-Disposition: inline
In-Reply-To: <a4423d670810170543vd6b4c39p44bf125610d8540@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: xfs@oss.sgi.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Oct 17, 2008 at 04:43:07PM +0400, Alexander Beregalov wrote:
> It is SMP x86_64, rootfs is on XFS

The message comes from code in XFS, but I really wonder where the atomic
context comes from.  xfs_iget_core has a few changes in the tree pulled
into todays Linux-next, but it's still missing the recent updates
redoing this area completely.  In some ways it looks like this process
has the the atomic context flag left pending somewhere, but that should
also trigger warnings on the VFS locks like i_mutex.

Very misterious.

IS there a specific workload you can reproduce this with?
