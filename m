From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: xfs tree build failure
Date: Thu, 6 Nov 2008 10:27:53 -0500
Message-ID: <20081106152753.GA9161@infradead.org>
References: <20081030132324.0d619fdd.sfr@canb.auug.org.au> <20081030090832.GQ17077@disturbed> <20081105132000.4e560cad.sfr@canb.auug.org.au> <20081105204754.GO4985@disturbed>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081105204754.GO4985@disturbed>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, Lachlan McIlroy <lachlan@sgi.com>, linux-fsdevel@vger.kernel.org, hch@infradead.org, viro
List-Id: linux-next.vger.kernel.org

On Thu, Nov 06, 2008 at 07:47:54AM +1100, Dave Chinner wrote:
> > > I think it's probably the only solution - we need to wait until
> > > the I_LOCK bit is cleared from the inode and AFAICT wait_on_inode()
> > > is the only way to do it.
> > 
> > Any resolution?
> 
> I was waiting on a comment from Christoph. I'll cc him directly this
> time ;)

What comment do you expect from me?  The fix looks correct, but at some
point you should probably run all these exports past Al to get another
review.  Especially as he's doing major work in this area currently.

