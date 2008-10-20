From: Christoph Hellwig <hch@infradead.org>
Subject: Re: BUG: sleeping function called from invalid context at
	kernel/rwsem.c:131 XFS? (was: Re: linux-next: Tree for October 17)
Date: Mon, 20 Oct 2008 12:33:27 -0400
Message-ID: <20081020163327.GA15651@infradead.org>
References: <a4423d670810170543vd6b4c39p44bf125610d8540@mail.gmail.com> <20081017164116.GA17375@infradead.org> <a4423d670810170954h7ca130aaw8895380a4c6b125@mail.gmail.com> <20081017165738.GA20818@infradead.org> <a4423d670810171013g5bc19c1cm3f7d9c014ee70349@mail.gmail.com> <20081017203710.GA27187@infradead.org> <20081017135510.7127c4e7@infradead.org> <a4423d670810200758m3cea3841h40988afc8eaf81@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <xfs-bounce@oss.sgi.com>
Content-Disposition: inline
In-Reply-To: <a4423d670810200758m3cea3841h40988afc8eaf81@mail.gmail.com>
Sender: xfs-bounce@oss.sgi.com
Errors-to: xfs-bounce@oss.sgi.com
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Arjan van de Ven <arjan@infradead.org>, Christoph Hellwig <hch@infradead.org>, xfs@oss.sgi.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 20, 2008 at 06:58:09PM +0400, Alexander Beregalov wrote:
> Hi Christoph
> 
> I have the same result with next-1020 and today's xfs-2.6.git/master
> (
> commit bfd2bd10da76378dc4afd87d7d204a1d3d70b347
> Author: David Chinner <david@fromorbit.com>
> Date:   Fri Oct 17 15:36:23 2008 +1000
>     Inode: Allow external list initialisation
> )
> 
> Should I start bisecting?

That would be extremely helpful! 


And as mentioned in the other mail I still can't reproduce it, but I can
currently only test on x86-32, not x86-64.
