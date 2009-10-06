From: Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: block/drbd tree build warning
Date: Tue, 6 Oct 2009 09:31:16 +0200
Message-ID: <20091006073116.GE5216@kernel.dk>
References: <20091006140154.8d94d95c.sfr@canb.auug.org.au>
	<20091006071700.GA7665@johann>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20091006071700.GA7665@johann>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Help: <mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=subscribe>
Sender: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Errors-To: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
To: Lars Ellenberg <lars.ellenberg-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Tue, Oct 06 2009, Lars Ellenberg wrote:
> On Tue, Oct 06, 2009 at 02:01:54PM +1100, Stephen Rothwell wrote:
> > Hi Jens, Philipp,
> > 
> > Today's linux-next build (x86_64 allmodconfig) produced this warning:
> > 
> > drivers/block/drbd/drbd_nl.c: In function 'drbd_nl_init':
> > drivers/block/drbd/drbd_nl.c:2309: warning: passing argument 3 of 'cn_add_callback' from incompatible pointer type
> > include/linux/connector.h:167: note: expected 'void (*)(struct cn_msg *, struct netlink_skb_parms *)' but argument is of type 'void (*)(struct cn_msg *)'
> 
> Thanks, expected after our connector related patches got in.

Thanks for fixing it quickly, I've added the patch and updated for-next.

-- 
Jens Axboe
