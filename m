From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: Re: BUG: sleeping function called from invalid context at kernel/rwsem.c:131 XFS? (was: Re: linux-next: Tree for October 17)
Date: Tue, 21 Oct 2008 15:42:16 +0400
Message-ID: <a4423d670810210442y51b62fc2naf6cb649e6b26942@mail.gmail.com>
References: <a4423d670810170543vd6b4c39p44bf125610d8540@mail.gmail.com>
	 <a4423d670810170954h7ca130aaw8895380a4c6b125@mail.gmail.com>
	 <20081017165738.GA20818@infradead.org>
	 <a4423d670810171013g5bc19c1cm3f7d9c014ee70349@mail.gmail.com>
	 <20081017203710.GA27187@infradead.org>
	 <20081017135510.7127c4e7@infradead.org>
	 <a4423d670810200758m3cea3841h40988afc8eaf81@mail.gmail.com>
	 <20081020163327.GA15651@infradead.org>
	 <a4423d670810201013w6448cb38w402771799cefb5f5@mail.gmail.com>
	 <20081020223549.GA21152@disturbed>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.30]:38107 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753672AbYJULmR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Oct 2008 07:42:17 -0400
Received: by yx-out-2324.google.com with SMTP id 8so398403yxm.1
        for <linux-next@vger.kernel.org>; Tue, 21 Oct 2008 04:42:16 -0700 (PDT)
In-Reply-To: <20081020223549.GA21152@disturbed>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: lachlan@sgi.com, Dave Chinner <david@fromorbit.com>, Christoph Hellwig <hch@infradead.org>, Arjan van de Ven <arjan@infradead.org>, xfs@oss.sgi.com, linux-next@vger.kernel.org

2008/10/21 Dave Chinner <david@fromorbit.com>:
> On Mon, Oct 20, 2008 at 09:13:05PM +0400, Alexander Beregalov wrote:
>> 2008/10/20 Christoph Hellwig <hch@infradead.org>:
>> > On Mon, Oct 20, 2008 at 06:58:09PM +0400, Alexander Beregalov wrote:
>> >> Hi Christoph
>> >>
>> >> I have the same result with next-1020 and today's xfs-2.6.git/master
>> >> (
>> >> commit bfd2bd10da76378dc4afd87d7d204a1d3d70b347
>> >> Author: David Chinner <david@fromorbit.com>
>> >> Date:   Fri Oct 17 15:36:23 2008 +1000
>> >>     Inode: Allow external list initialisation
>> >> )
>> Ha, that kernel (xfs/master) has made my system dead locked.
>> SysRQ-d:
>> Show all locks held in the system
>> 1 lock held by pdflush
>> (&type->s_umount_key#18{----}, at writeback_inodes
>> 1 lock held by login
>> (&(&ip->i_iolock)->mr_lock){----} at xfs_ilock
>> and so on ( many locks at xfs_ilock)
>
> Curious. Can you post the full stack traces?
I can not reproduce it, yet.

Bisected to:
dd509097cb0b76d3836385f80d6b2d6fd3b97757 is first bad commit
commit dd509097cb0b76d3836385f80d6b2d6fd3b97757
Author: Lachlan McIlroy <lachlan@sgi.com>
Date:   Mon Sep 29 14:56:40 2008 +1000

    [XFS] Unlock inode before calling xfs_idestroy()

    Lock debugging reported the ilock was being destroyed without being
    unlocked. We don't need to lock the inode until we are going to insert it
    into the radix tree.

    SGI-PV: 987246

    SGI-Modid: xfs-linux-melb:xfs-kern:32159a

    Signed-off-by: Lachlan McIlroy <lachlan@sgi.com>
    Signed-off-by: Christoph Hellwig <hch@infradead.org>

:040000 040000 b56d4b74bf0cbdd66d0e61c537b4bb2f7461084f
40773db6102a1e348a0a21b0e960cb33ffd0d419 M      fs

git bisect start 'fs/xfs'
git bisect bad bfd2bd10da76378dc4afd87d7d204a1d3d70b347 Inode: Allow
external list initialisation
git bisect good 3fa8749e584b55f1180411ab1b51117190bac1e5 Linux 2.6.27
git bisect skip a55c8e45381bcc5588a544ba73580719887372eb
git bisect skip 35afc673a41114eb650c6ae766010160dd982a7b
git bisect skip 7a9ba9bb899933293604a2b3c5ca4f40ad5a92a8
git bisect skip c02afc5fa7433fbbc0a045afbb472533de0758de
git bisect skip c0f47794ba870f0cd1dbe5c8fdbf56b86f5f2afa
git bisect skip 7197197719eb94b527c6a422bf3fb682cdf89954
git bisect good e0fe783155e4f1c7106f3579c258b9f995330c19
git bisect bad 2472c6b938d2b3cb1698abe39cc90a3c1d7625b9
git bisect good 20c1bd2cc6d9311fb7d7d0eb91b46dc4a42b5d11
git bisect good 8e47c0b2427f0ea35984f02648163cc7a35d3592
git bisect good a1853934a9bef78aeb1aa7539c629cdb755edab2
git bisect bad 05de34dbbe744a4d235279f1493a8f05b903a4bb
git bisect bad c4fa37724d18a3444bb4b4f77c4580b9dd525ed9
git bisect good 4b4577db477462ff6f41babcc3b3e7036a1ba27d
git bisect bad dd509097cb0b76d3836385f80d6b2d6fd3b97757
