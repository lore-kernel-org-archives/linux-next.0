From: Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: manual merge of the drbd tree with the
	block tree
Date: Tue, 18 May 2010 13:45:21 +0200
Message-ID: <201005181345.22986.philipp.reisner@linbit.com>
References: <20100518152031.9a244971.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
In-Reply-To: <20100518152031.9a244971.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
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
Cc: Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

FYI:
I use 
git://git.drbd.org/linux-2.6-drbd.git for-jens
as path of my patches to Jens.

I switched that tree to Jens' 
git://git.kernel.dk/linux-2.6-block.git for-2.6.35
and provided the DRBD patches on top of that.

Not that I am not willing to help, I have the feeling that this
merge conflict has nothing to do with DRBD.

Best,
 Phil

> Hi all,
> 
> Today's linux-next merge of the drbd tree got a conflict in
> mm/page-writeback.c between commit
> 42bd225c0ba7c95af39293d39a950c48e7e5cb23 (""laptop-mode: Make flushes
> per-device" fix") from the block tree and commit
> e913fc825dc685a444cb4c1d0f9d32f372f59861 ("writeback: fix WB_SYNC_NONE
> writeback from umount") from the drbd tree (via its merge of the block
> tree).
> 
> I used the next-20100517 version of the block tree today (because the
> above conflict was not resolved correctly in the block tree and caused a
> build failure), so I will also use the next-20100517 version of the drbd
> tree for today.
> 
-- 
: Dipl-Ing Philipp Reisner
: LINBIT | Your Way to High Availability
: Tel: +43-1-8178292-50, Fax: +43-1-8178292-82
: http://www.linbit.com

DRBD(R) and LINBIT(R) are registered trademarks of LINBIT, Austria.
