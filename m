From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: Re: BUG: sleeping function called from invalid context at kernel/rwsem.c:131 XFS? (was: Re: linux-next: Tree for October 17)
Date: Mon, 20 Oct 2008 21:13:05 +0400
Message-ID: <a4423d670810201013w6448cb38w402771799cefb5f5@mail.gmail.com>
References: <a4423d670810170543vd6b4c39p44bf125610d8540@mail.gmail.com>
	 <20081017164116.GA17375@infradead.org>
	 <a4423d670810170954h7ca130aaw8895380a4c6b125@mail.gmail.com>
	 <20081017165738.GA20818@infradead.org>
	 <a4423d670810171013g5bc19c1cm3f7d9c014ee70349@mail.gmail.com>
	 <20081017203710.GA27187@infradead.org>
	 <20081017135510.7127c4e7@infradead.org>
	 <a4423d670810200758m3cea3841h40988afc8eaf81@mail.gmail.com>
	 <20081020163327.GA15651@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hs-out-0708.google.com ([64.233.178.243]:36098 "EHLO
	hs-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754381AbYJTRNI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Oct 2008 13:13:08 -0400
Received: by hs-out-0708.google.com with SMTP id 4so773473hsl.5
        for <linux-next@vger.kernel.org>; Mon, 20 Oct 2008 10:13:05 -0700 (PDT)
In-Reply-To: <20081020163327.GA15651@infradead.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Arjan van de Ven <arjan@infradead.org>, xfs@oss.sgi.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

2008/10/20 Christoph Hellwig <hch@infradead.org>:
> On Mon, Oct 20, 2008 at 06:58:09PM +0400, Alexander Beregalov wrote:
>> Hi Christoph
>>
>> I have the same result with next-1020 and today's xfs-2.6.git/master
>> (
>> commit bfd2bd10da76378dc4afd87d7d204a1d3d70b347
>> Author: David Chinner <david@fromorbit.com>
>> Date:   Fri Oct 17 15:36:23 2008 +1000
>>     Inode: Allow external list initialisation
>> )
Ha, that kernel (xfs/master) has made my system dead locked.
SysRQ-d:
Show all locks held in the system
1 lock held by pdflush
(&type->s_umount_key#18{----}, at writeback_inodes
1 lock held by login
(&(&ip->i_iolock)->mr_lock){----} at xfs_ilock
and so on ( many locks at xfs_ilock)

>>
>> Should I start bisecting?
>
> That would be extremely helpful!
>
>
> And as mentioned in the other mail I still can't reproduce it, but I can
> currently only test on x86-32, not x86-64.
>
