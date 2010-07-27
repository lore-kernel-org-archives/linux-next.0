From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/line6: needs to select SND_PCM
Date: Tue, 27 Jul 2010 12:21:19 -0700
Message-ID: <4C4F31AF.2090701@oracle.com>
References: <20100727160708.722c39c1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <20100727160708.722c39c1.sfr@canb.auug.org.au>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Sender: devel-bounces@linuxdriverproject.org
Errors-To: devel-bounces@linuxdriverproject.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devel@driverdev.osuosl.org, Markus Grabner <grabner@icg.tugraz.at>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

line6 uses snd_pcm*() functions, so it should select SND_PCM.

ERROR: "snd_pcm_period_elapsed" [drivers/staging/line6/line6usb.ko] undefined!
ERROR: "snd_pcm_set_ops" [drivers/staging/line6/line6usb.ko] undefined!
ERROR: "snd_pcm_lib_free_pages" [drivers/staging/line6/line6usb.ko] undefined!
ERROR: "snd_pcm_lib_ioctl" [drivers/staging/line6/line6usb.ko] undefined!
ERROR: "snd_pcm_lib_malloc_pages" [drivers/staging/line6/line6usb.ko] undefined!
ERROR: "snd_pcm_hw_constraint_ratdens" [drivers/staging/line6/line6usb.ko] undefined!
ERROR: "snd_pcm_format_physical_width" [drivers/staging/line6/line6usb.ko] undefined!
ERROR: "snd_pcm_lib_preallocate_pages_for_all" [drivers/staging/line6/line6usb.ko] undefined!
ERROR: "snd_pcm_new" [drivers/staging/line6/line6usb.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Markus Grabner <grabner@icg.tugraz.at>
---
 drivers/staging/line6/Kconfig |    1 +
 1 file changed, 1 insertion(+)

Third patch to staging/line6/Kconfig.  :(
Developers should know what kernel services their code needs
and how to configure for those needs.

--- linux-next-20100727.orig/drivers/staging/line6/Kconfig
+++ linux-next-20100727/drivers/staging/line6/Kconfig
@@ -2,6 +2,7 @@ config LINE6_USB
 	tristate "Line6 USB support"
 	depends on USB && SND
 	select SND_RAWMIDI
+	select SND_PCM
 	help
 	  This is a driver for the guitar amp, cab, and effects modeller
 	  PODxt Pro by Line6 (and similar devices), supporting the
