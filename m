From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next resend/fixed] media/miro: fix kconfig depends/select
Date: Sun, 6 Dec 2009 10:04:58 -0800
Message-ID: <20091206100458.9f24a9c8.randy.dunlap@oracle.com>
References: <20091204203014.e8ee54ca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934209AbZLFTIc@vger.kernel.org>
In-Reply-To: <20091204203014.e8ee54ca.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-media@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

miropcm20 uses ALSA (snd_) interfaces from the SND_MIRO
driver, so it should depend on SND.
(selecting SND_MIRO when CONFIG_SND is not enabled is a
problem.)

drivers/built-in.o: In function `vidioc_s_ctrl':
radio-miropcm20.c:(.text+0x227499): undefined reference to `snd_aci_cmd'
drivers/built-in.o: In function `vidioc_s_frequency':
radio-miropcm20.c:(.text+0x227574): undefined reference to `snd_aci_cmd'
radio-miropcm20.c:(.text+0x227588): undefined reference to `snd_aci_cmd'
drivers/built-in.o: In function `pcm20_init':
radio-miropcm20.c:(.init.text+0x2a784): undefined reference to `snd_aci_get_aci'

miropcm20 selects SND_MIRO but SND_ISA may be not enabled, so
also select SND_ISA so that the snd-miro driver will be built.
Otherwise there are missing symbols:

ERROR: "snd_opl4_create" [sound/isa/opti9xx/snd-miro.ko] undefined!
ERROR: "snd_wss_pcm" [sound/isa/opti9xx/snd-miro.ko] undefined!
ERROR: "snd_wss_timer" [sound/isa/opti9xx/snd-miro.ko] undefined!
ERROR: "snd_wss_create" [sound/isa/opti9xx/snd-miro.ko] undefined!
ERROR: "snd_wss_mixer" [sound/isa/opti9xx/snd-miro.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/media/radio/Kconfig |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20091204.orig/drivers/media/radio/Kconfig
+++ linux-next-20091204/drivers/media/radio/Kconfig
@@ -197,7 +197,8 @@ config RADIO_MAESTRO
 
 config RADIO_MIROPCM20
 	tristate "miroSOUND PCM20 radio"
-	depends on ISA && VIDEO_V4L2
+	depends on ISA && VIDEO_V4L2 && SND
+	select SND_ISA
 	select SND_MIRO
 	---help---
 	  Choose Y here if you have this FM radio card. You also need to enable
