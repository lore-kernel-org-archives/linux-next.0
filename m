From: Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: manual merge of the drbd tree with the
	block tree
Date: Tue, 18 May 2010 15:05:46 +0200
Message-ID: <20100518130545.GZ25951@kernel.dk>
References: <20100518152031.9a244971.sfr@canb.auug.org.au>
	<201005181345.22986.philipp.reisner@linbit.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201005181345.22986.philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Help: <mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=subscribe>
Sender: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Errors-To: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
To: Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Tue, May 18 2010, Philipp Reisner wrote:
> Hi Stephen,
> 
> FYI:
> I use 
> git://git.drbd.org/linux-2.6-drbd.git for-jens
> as path of my patches to Jens.
> 
> I switched that tree to Jens' 
> git://git.kernel.dk/linux-2.6-block.git for-2.6.35
> and provided the DRBD patches on top of that.
> 
> Not that I am not willing to help, I have the feeling that this
> merge conflict has nothing to do with DRBD.

I suspect that the merge will go smoothly with the updated branches when
Stephen runs his scripts tomorrow.

-- 
Jens Axboe
