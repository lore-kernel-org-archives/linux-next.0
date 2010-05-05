From: Marin Mitov <mitov@issp.bas.bg>
Subject: Re: linux-next: Tree for May 4 (staging/dt3155v4l) [PATCH]
Date: Wed, 5 May 2010 20:31:38 +0300
Message-ID: <201005052031.39043.mitov@issp.bas.bg>
References: <20100504162305.4a07a18a.sfr@canb.auug.org.au>
	<20100504191223.GB13208@suse.de> <4BE07890.8060707@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <4BE07890.8060707@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Sender: devel-bounces@linuxdriverproject.org
Errors-To: devel-bounces@linuxdriverproject.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: devel@driverdev.osuosl.org, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <gregkh@suse.de>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tuesday 04 May 2010 10:42:08 pm Randy Dunlap wrote:
> On 05/04/10 12:12, Greg KH wrote:
> > On Tue, May 04, 2010 at 11:36:04AM -0700, Randy Dunlap wrote:
> >> On Tue, 4 May 2010 16:23:05 +1000 Stephen Rothwell wrote:
> >>
> >>> Hi all,
> >>>
> >>> Changes since 20100503:
> >>
> >>
> >> drivers/staging/dt3155v4l/dt3155v4l.c:73: error: implicit declaration of function 'udelay'
> >> drivers/staging/dt3155v4l/dt3155v4l.c:616: warning: assignment from incompatible pointer type
> >> drivers/staging/dt3155v4l/dt3155v4l.c:1270: error: implicit declaration of function 'msleep'
> > 
> > Ick.  What arch was this?
> 
> That is on x86_64.
> 
> The config is attached.
> 
It's my fault, sorry.

Here is a patch solving the problem. Compiles with Randy's config, but does not link

drivers/staging/built-in.o: In function `format_by_fourcc':
(.text+0x211da): multiple definition of `format_by_fourcc'
drivers/media/built-in.o:(.text+0x2a744): first defined here

drivers/media/common/saa7146_video.c:struct saa7146_format* format_by_fourcc(struct saa7146_dev *dev, int fourcc)
drivers/staging/cx25821/cx25821-video.c:struct cx25821_fmt *format_by_fourcc(unsigned int fourcc)

Marin MItov

=========================================

[PATCH] Adding the missing linux/delay.h

The prototypes of udelay() and msleep() are in linux/delay.h,
so include it.

Signed-off-by: Marin Mitov <mitov@issp.bas.bg>

==========================================================================
--- a/drivers/staging/dt3155v4l/dt3155v4l.c	2010-05-05 08:55:30.000000000 +0300
+++ b/drivers/staging/dt3155v4l/dt3155v4l.c	2010-05-05 08:57:00.000000000 +0300
@@ -4,6 +4,7 @@
 #include <linux/pci.h>
 #include <linux/version.h>
 #include <linux/stringify.h>
+#include <linux/delay.h>
 #include <media/videobuf-dma-contig.h>
 #include <linux/kthread.h>
