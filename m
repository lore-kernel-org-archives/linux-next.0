From: Christoph Hellwig <hch@infradead.org>
Subject: Re: BUG: sleeping function called from invalid context at
	kernel/rwsem.c:131 XFS? (was: Re: linux-next: Tree for October 17)
Date: Fri, 17 Oct 2008 12:57:38 -0400
Message-ID: <20081017165738.GA20818@infradead.org>
References: <a4423d670810170543vd6b4c39p44bf125610d8540@mail.gmail.com> <20081017164116.GA17375@infradead.org> <a4423d670810170954h7ca130aaw8895380a4c6b125@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:52022 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754879AbYJQQ5j (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Oct 2008 12:57:39 -0400
Content-Disposition: inline
In-Reply-To: <a4423d670810170954h7ca130aaw8895380a4c6b125@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, xfs@oss.sgi.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Oct 17, 2008 at 08:54:35PM +0400, Alexander Beregalov wrote:
> Workload is not specific, many i/o commands trigger the message.
> 
>  dmesg|grep comm:
> [    4.419605] Pid: 1396, comm: mkdir Not tainted 2.6.27-next-20081017 #2
> [    6.056443] Pid: 1782, comm: dhcpcd Not tainted 2.6.27-next-20081017 #2
> [   17.899905] Pid: 1791, comm: dhcpcd-run-hook Not tainted
> 2.6.27-next-20081017 #2
> [ 3846.588549] Pid: 2005, comm: screen Not tainted 2.6.27-next-20081017 #2
> [ 4416.242723] Pid: 2023, comm: git Not tainted 2.6.27-next-20081017 #2
> [ 4430.618037] Pid: 2023, comm: git Not tainted 2.6.27-next-20081017 #2
> [ 4431.641578] Pid: 2023, comm: git Not tainted 2.6.27-next-20081017 #2
> [ 4432.944265] Pid: 2023, comm: git Not tainted 2.6.27-next-20081017 #2
> [ 4590.330706] Pid: 2026, comm: git-merge Not tainted 2.6.27-next-20081017 #2
> [14882.802479] Pid: 2058, comm: git-merge Not tainted 2.6.27-next-20081017 #2
> [16955.026436] Pid: 2091, comm: git-merge Not tainted 2.6.27-next-20081017 #2
> [18466.645935] Pid: 2119, comm: git-merge Not tainted 2.6.27-next-20081017 #2
> [19165.813049] Pid: 2150, comm: git-merge Not tainted 2.6.27-next-20081017 #2

Very strange.  Can you retry with tomorrow Linux-next which should have
a large XFS update?  If it still happens I'll investigate it in more
detail.
