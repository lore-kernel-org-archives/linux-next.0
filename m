From: Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH -next] drbd: trace depends on TRACING
Date: Tue, 29 Sep 2009 17:32:50 +0200
Message-ID: <200909291732.51383.philipp.reisner@linbit.com>
References: <20090925133830.1ba29584.sfr@canb.auug.org.au>
	<4ABD4C28.9070202@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
In-Reply-To: <4ABD4C28.9070202-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Help: <mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=subscribe>
Sender: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Errors-To: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
To: drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Cc: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, akpm <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Saturday 26 September 2009 01:03:04 Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
>
> DRBD_TRACE should depend on TRACING.
> It's also possible that TRACEPOINTS should depend on TRACING.
>

Hi Randy,

I tried to figure out in which way that should be done. By looking
at "BLK_DEV_IO_TRACE" I got the impression that this should
be done by adding "select GENERIC_TRACER".

I will further examine this tomorrow. I just wanted to let you know
that this did not fall off the table...

-Phil

diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index 4e6f90f..7b35287 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -7,7 +7,7 @@ comment "DRBD disabled because PROC_FS, INET or CONNECTOR not 
selected"

 config BLK_DEV_DRBD
        tristate "DRBD Distributed Replicated Block Device support"
-       depends on PROC_FS && INET && CONNECTOR
+       depends on BLOCK && PROC_FS && INET && CONNECTOR
        select LRU_CACHE
        default n
        help
@@ -42,6 +42,7 @@ config DRBD_TRACE
        tristate "DRBD tracing"
        depends on BLK_DEV_DRBD
        select TRACEPOINTS
+       select GENERIC_TRACER
        default n
        help
-- 
: Dipl-Ing Philipp Reisner
: LINBIT | Your Way to High Availability
: Tel: +43-1-8178292-50, Fax: +43-1-8178292-82
: http://www.linbit.com

DRBD(R) and LINBIT(R) are registered trademarks of LINBIT, Austria.
