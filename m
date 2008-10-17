From: Christoph Hellwig <hch@infradead.org>
Subject: Re: BUG: sleeping function called from invalid context at
	kernel/rwsem.c:131 XFS? (was: Re: linux-next: Tree for October 17)
Date: Fri, 17 Oct 2008 16:37:10 -0400
Message-ID: <20081017203710.GA27187@infradead.org>
References: <a4423d670810170543vd6b4c39p44bf125610d8540@mail.gmail.com> <20081017164116.GA17375@infradead.org> <a4423d670810170954h7ca130aaw8895380a4c6b125@mail.gmail.com> <20081017165738.GA20818@infradead.org> <a4423d670810171013g5bc19c1cm3f7d9c014ee70349@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:56322 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751483AbYJQUhL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Oct 2008 16:37:11 -0400
Content-Disposition: inline
In-Reply-To: <a4423d670810171013g5bc19c1cm3f7d9c014ee70349@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, xfs@oss.sgi.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

I just ran the xfs testsuite over linux-next on qemu (i386), and I can't
find anything at all.  Really strange.  Let's see if this still there
with mondays linux-next, and if yes can you just try the xfs patch from
the splitout linux-next patches and see if that alone causes it?

In fact that might be useful for todays linux-next, too.
