From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: Re: BUG: sleeping function called from invalid context at kernel/rwsem.c:131 XFS? (was: Re: linux-next: Tree for October 17)
Date: Fri, 17 Oct 2008 20:54:35 +0400
Message-ID: <a4423d670810170954h7ca130aaw8895380a4c6b125@mail.gmail.com>
References: <a4423d670810170543vd6b4c39p44bf125610d8540@mail.gmail.com>
	 <20081017164116.GA17375@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ag-out-0708.google.com ([72.14.246.249]:11296 "EHLO
	ag-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755402AbYJQQyi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Oct 2008 12:54:38 -0400
Received: by ag-out-0708.google.com with SMTP id 31so978378agc.10
        for <linux-next@vger.kernel.org>; Fri, 17 Oct 2008 09:54:35 -0700 (PDT)
In-Reply-To: <20081017164116.GA17375@infradead.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: xfs@oss.sgi.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

2008/10/17 Christoph Hellwig <hch@infradead.org>:
> On Fri, Oct 17, 2008 at 04:43:07PM +0400, Alexander Beregalov wrote:
>> It is SMP x86_64, rootfs is on XFS
>
> The message comes from code in XFS, but I really wonder where the atomic
> context comes from.  xfs_iget_core has a few changes in the tree pulled
> into todays Linux-next, but it's still missing the recent updates
> redoing this area completely.  In some ways it looks like this process
> has the the atomic context flag left pending somewhere, but that should
> also trigger warnings on the VFS locks like i_mutex.
>
> Very misterious.
>
> IS there a specific workload you can reproduce this with?
>
Workload is not specific, many i/o commands trigger the message.

 dmesg|grep comm:
[    4.419605] Pid: 1396, comm: mkdir Not tainted 2.6.27-next-20081017 #2
[    6.056443] Pid: 1782, comm: dhcpcd Not tainted 2.6.27-next-20081017 #2
[   17.899905] Pid: 1791, comm: dhcpcd-run-hook Not tainted
2.6.27-next-20081017 #2
[ 3846.588549] Pid: 2005, comm: screen Not tainted 2.6.27-next-20081017 #2
[ 4416.242723] Pid: 2023, comm: git Not tainted 2.6.27-next-20081017 #2
[ 4430.618037] Pid: 2023, comm: git Not tainted 2.6.27-next-20081017 #2
[ 4431.641578] Pid: 2023, comm: git Not tainted 2.6.27-next-20081017 #2
[ 4432.944265] Pid: 2023, comm: git Not tainted 2.6.27-next-20081017 #2
[ 4590.330706] Pid: 2026, comm: git-merge Not tainted 2.6.27-next-20081017 #2
[14882.802479] Pid: 2058, comm: git-merge Not tainted 2.6.27-next-20081017 #2
[16955.026436] Pid: 2091, comm: git-merge Not tainted 2.6.27-next-20081017 #2
[18466.645935] Pid: 2119, comm: git-merge Not tainted 2.6.27-next-20081017 #2
[19165.813049] Pid: 2150, comm: git-merge Not tainted 2.6.27-next-20081017 #2
