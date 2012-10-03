From: Richard Weinberger <richard@nod.at>
Subject: Re: linux-next: build failure after merge of the ubi tree
Date: Wed, 3 Oct 2012 10:30:45 +0200
Message-ID: <20121003103045.140f3a7a@spider.haslach.nod.at>
References: <20121003122735.692388e2f68dd85e43052c70@canb.auug.org.au>
	<1349248843.2017.108.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1349248843.2017.108.camel@sauron.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dedekind1@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Artem, Stephen,

Am Wed, 03 Oct 2012 10:20:43 +0300
schrieb Artem Bityutskiy <dedekind1@gmail.com>:

> On Wed, 2012-10-03 at 12:27 +1000, Stephen Rothwell wrote:
> > Hi Artem,
> > 
> > After merging the ubi tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > ERROR: "ubi_update_fastmap" [drivers/mtd/ubi/ubi.ko] undefined!
> > ERROR: "ubi_scan_fastmap" [drivers/mtd/ubi/ubi.ko] undefined!
> > ERROR: "ubi_calc_fm_size" [drivers/mtd/ubi/ubi.ko] undefined!
> 
> I've added Richard's fastmap work there. I'll look at these failures.

Thanks for reporting this.
I'm not sure why this happens with allmodconfig.
If I set CONFIG_MTD=m and CONFIG_MTD_UBI=m it builds fine,
that's how I did most build tests.

The following patch fixes the issue for me.
Artem, are you fine with it?

Thanks,
//richard

---
diff --git a/drivers/mtd/ubi/Makefile b/drivers/mtd/ubi/Makefile
index 7ab19ac..b46b0c97 100644
--- a/drivers/mtd/ubi/Makefile
+++ b/drivers/mtd/ubi/Makefile
@@ -2,6 +2,6 @@ obj-$(CONFIG_MTD_UBI) += ubi.o
 
 ubi-y += vtbl.o vmt.o upd.o build.o cdev.o kapi.o eba.o io.o wl.o
attach.o ubi-y += misc.o debug.o
+ubi-$(CONFIG_MTD_UBI_FASTMAP) += fastmap.o
 
 obj-$(CONFIG_MTD_UBI_GLUEBI) += gluebi.o
-obj-$(CONFIG_MTD_UBI_FASTMAP) += fastmap.o
