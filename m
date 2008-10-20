From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: Re: BUG: sleeping function called from invalid context at kernel/rwsem.c:131 XFS? (was: Re: linux-next: Tree for October 17)
Date: Mon, 20 Oct 2008 18:58:09 +0400
Message-ID: <a4423d670810200758m3cea3841h40988afc8eaf81@mail.gmail.com>
References: <a4423d670810170543vd6b4c39p44bf125610d8540@mail.gmail.com>
	 <20081017164116.GA17375@infradead.org>
	 <a4423d670810170954h7ca130aaw8895380a4c6b125@mail.gmail.com>
	 <20081017165738.GA20818@infradead.org>
	 <a4423d670810171013g5bc19c1cm3f7d9c014ee70349@mail.gmail.com>
	 <20081017203710.GA27187@infradead.org>
	 <20081017135510.7127c4e7@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <xfs-bounce@oss.sgi.com>
In-Reply-To: <20081017135510.7127c4e7@infradead.org>
Content-Disposition: inline
Sender: xfs-bounce@oss.sgi.com
Errors-to: xfs-bounce@oss.sgi.com
To: Arjan van de Ven <arjan@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, xfs@oss.sgi.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

2008/10/18 Arjan van de Ven <arjan@infradead.org>:
> On Fri, 17 Oct 2008 16:37:10 -0400
> Christoph Hellwig <hch@infradead.org> wrote:
>
>> I just ran the xfs testsuite over linux-next on qemu (i386), and I
>> can't find anything at all.  Really strange.  Let's see if this still
>> there with mondays linux-next, and if yes can you just try the xfs
>> patch from the splitout linux-next patches and see if that alone
>> causes it?

Hi Christoph

I have the same result with next-1020 and today's xfs-2.6.git/master
(
commit bfd2bd10da76378dc4afd87d7d204a1d3d70b347
Author: David Chinner <david@fromorbit.com>
Date:   Fri Oct 17 15:36:23 2008 +1000
    Inode: Allow external list initialisation
)

Should I start bisecting?
>>
>> In fact that might be useful for todays linux-next, too.
>> --
>
> also if you enable lockdep, it tracks where irq's got turned off (with
> a stacktrace I think) so it would provide some good clues.

Yes, lockdep was enabled, but there is no more information than I
already posted.
