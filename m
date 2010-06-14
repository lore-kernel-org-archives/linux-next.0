From: Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: manual merge of the drbd tree with the
	block trees
Date: Mon, 14 Jun 2010 11:43:42 +0200
Message-ID: <201006141143.42783.philipp.reisner@linbit.com>
References: <20100610135203.4649453a.sfr@canb.auug.org.au>
	<20100614112639.ef45a777.sfr@canb.auug.org.au>
	<4C15F18C.3050905@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
In-Reply-To: <4C15F18C.3050905-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Help: <mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=subscribe>
Sender: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Errors-To: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
To: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

Am Montag, 14. Juni 2010, um 11:08:28 schrieb Jens Axboe:
> On 2010-06-14 03:26, Stephen Rothwell wrote:
> > Hi Jens, Philipp,
> > 
> > On Thu, 10 Jun 2010 08:01:35 +0200 Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org> wrote:
> >> I'm starting to think that it would be a little easier if you did not
> >> pull the drbd tree, I really should be pulling that into my -next branch
> >> instead.
> > 
> > Given that the drbd tree has not been updated to match the increasingly
> > different block tree, I have dropped it for today.
> > 
> > There a a few possibilities here:
> > 	- I just drop the drbd tree completely and it only gets merged
> > 
> > into the block tree.
> > 
> > 	- if the drbd tree doesn't actually depend on any of the features
> > 
> > in the block tree then it could be rebased onto Linus tree (and I would
> > cope with any merge fixups - as I do with many other trees).
> > 
> > 	- if it does depend on things in the block tree, those particular
> > 
> > features in the block tree could be put in a separate branch that is
> > never rebased and then that branch could be merged into both the block
> > and drbd trees (this has been done before e.g. stuff in the vfs tree.
> > 
> > 	- the drbd tree could be rebased on tom of the current block tree
> > 
> > (but then it must be kept up to date if the block tree is rebased).
> 
> The thing with the dependencies is that sometimes they are true,
> sometimes they are not. What I suggested to the drbd team is that they
> always just base off Linus and then ask me to pull their changes, then I
> will resolve any potential conflicts when that happens. The consequence
> would be that you stop pulling the drbd tree separately.

Ok, from now on I will use Linus most recent -rc as base and put DRBD
patches on top of that. -- I will do this today (CEST timezone).

Best,
 Phil
-- 
: Dipl-Ing Philipp Reisner
: LINBIT | Your Way to High Availability
: Tel: +43-1-8178292-50, Fax: +43-1-8178292-82
: http://www.linbit.com

DRBD(R) and LINBIT(R) are registered trademarks of LINBIT, Austria.
