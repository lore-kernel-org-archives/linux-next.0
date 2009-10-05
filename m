From: Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: block/drbd tree build failure
Date: Mon, 5 Oct 2009 09:55:15 +0200
Message-ID: <20091005075515.GT26573@kernel.dk>
References: <20091005143552.977a2d4d.sfr@canb.auug.org.au>
	<20091005063138.GO26573@kernel.dk>
	<20091005182103.0a391d15.sfr@canb.auug.org.au>
	<20091005072929.GS26573@kernel.dk>
	<20091005185340.742f6abc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20091005185340.742f6abc.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
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
> On Mon, 5 Oct 2009 09:29:29 +0200 Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > Ah indeed, thanks. I'll put a fixup patch in place.
> 
> Thanks.

Already done, should work now.

-- 
Jens Axboe
