From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] cx231xx: fix wrong usage of select in kconfig
Date: Wed, 1 Apr 2009 06:03:27 +0400
Message-ID: <20090401020327.GA6808@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
To: linux-next@vger.kernel.org, mchehab@infradead.org, linux-media@vger.kernel.org, srinivasa.deevi@conexant.com
List-Id: linux-next.vger.kernel.org

VIDEO_CX231XX_ALSA depends on SND && SND_PCM,
but if we select it from VIDEO_CX231XX entry
it does not automatically select SND_PCM.
It causes build error:
ERROR: "snd_pcm_period_elapsed" [drivers/media/video/cx231xx/cx231xx-alsa.ko] undefined!

Documentation/kbuild/kconfig-language.txt:
Note:
        select should be used with care. select will force
        a symbol to a value without visiting the dependencies.
        By abusing select you are able to select a symbol FOO even
        if FOO depends on BAR that is not set.

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/media/video/cx231xx/Kconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/cx231xx/Kconfig b/drivers/media/video/cx231xx/Kconfig
index 9115654..85ae751 100644
--- a/drivers/media/video/cx231xx/Kconfig
+++ b/drivers/media/video/cx231xx/Kconfig
@@ -6,7 +6,6 @@ config VIDEO_CX231XX
        select VIDEO_IR
        select VIDEOBUF_VMALLOC
        select VIDEO_CX25840
-       select VIDEO_CX231XX_ALSA
 
 	---help---
 	  This is a video4linux driver for Conexant 231xx USB based TV cards.
