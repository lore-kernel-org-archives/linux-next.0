From: Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: block/drbd tree build failure
Date: Mon, 5 Oct 2009 09:29:29 +0200
Message-ID: <20091005072929.GS26573@kernel.dk>
References: <20091005143552.977a2d4d.sfr@canb.auug.org.au>
	<20091005063138.GO26573@kernel.dk>
	<20091005182103.0a391d15.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20091005182103.0a391d15.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Help: <mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=subscribe>
Sender: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Errors-To: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 05 2009, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Mon, 5 Oct 2009 08:31:38 +0200 Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > On Mon, Oct 05 2009, Stephen Rothwell wrote:
> > > 
> > > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > > 
> > > drivers/block/drbd/drbd_req.c: In function '_drbd_start_io_acct':
> > > drivers/block/drbd/drbd_req.c:43: error: subscripted value is neither array nor pointer
> > > drivers/block/drbd/drbd_req.c: In function '_drbd_end_io_acct':
> > > drivers/block/drbd/drbd_req.c:56: error: subscripted value is neither array nor pointer
> > > 
> > > I reported a similar error against the dbd tree, which was fixed, but now
> > > the commit that caused that error has been reverted and thus we get
> > > this :-(
> > > 
> > > I have reverted the drbd commits from the block tree for today.
> > 
> > That's probably my fault, not drbd. I moved it to a new branch since it
> > isn't going into 2.6.32, and perhaps dropped that fix along the way.
> > I'll look into it.
> 
> The original problem was caused by commit
> a9327cac440be4d8333bba975cbbf76045096275 ("Seperate read and write
> statistics of in_flight requests") which went into Linus' tree on Sept
> 15.  The drbd tee was fixed to cope with that change.  Then that commit
> was reverted in Linus' tree on Oct 5, so the fix to the drbd tree needs
> to be reverted as well.  Unfortunately, the drbd tree has been rebased
> into (basically) one commit, so that commit needs fixing.

Ah indeed, thanks. I'll put a fixup patch in place.

-- 
Jens Axboe
