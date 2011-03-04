From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Fri, 4 Mar 2011 16:39:11 +1100
Message-ID: <20110304163911.034f7f27.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>, "Igor M. Liplianin" <liplianin@me.by>, Mauro Carvalho Chehab <mchehab@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/Makefile between commit
a1256092a1e87511c977a3d0ef96151cda77e5c9 ("[media] Altera FPGA firmware
download module") from the v4l-dvb tree and commit
0867b42113ec4eb8646eb361b15cbcfb741ddf5b ("staging: gma500: Intel GMA500
staging driver") from the staging tree.

One of the reasons I dislike unrelated white space changes ... I fixed it
up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/Makefile
index 0269142,0983edc..0000000
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@@ -61,13 -61,13 +61,14 @@@ obj-$(CONFIG_SOLO6X10)		+= solo6x10
  obj-$(CONFIG_TIDSPBRIDGE)	+= tidspbridge/
  obj-$(CONFIG_ACPI_QUICKSTART)	+= quickstart/
  obj-$(CONFIG_WESTBRIDGE_ASTORIA)	+= westbridge/astoria/
- obj-$(CONFIG_SBE_2T3E3)	+= sbe-2t3e3/
+ obj-$(CONFIG_SBE_2T3E3)		+= sbe-2t3e3/
  obj-$(CONFIG_ATH6K_LEGACY)	+= ath6kl/
  obj-$(CONFIG_USB_ENESTORAGE)	+= keucr/
- obj-$(CONFIG_BCM_WIMAX)	+= bcm/
+ obj-$(CONFIG_BCM_WIMAX)		+= bcm/
  obj-$(CONFIG_FT1000)		+= ft1000/
- obj-$(CONFIG_SND_INTEL_SST)		+= intel_sst/
- obj-$(CONFIG_SPEAKUP)	+= speakup/
+ obj-$(CONFIG_SND_INTEL_SST)	+= intel_sst/
+ obj-$(CONFIG_SPEAKUP)		+= speakup/
 +obj-$(CONFIG_ALTERA_STAPL)	+=altera-stapl/
  obj-$(CONFIG_TOUCHSCREEN_CLEARPAD_TM1217)	+= cptm1217/
  obj-$(CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4)	+= ste_rmi4/
+ obj-$(CONFIG_DRM_PSB)		+= gma500/
