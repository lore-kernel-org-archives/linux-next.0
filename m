From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [-next] comedi I/O accessor name clashes
Date: Fri, 20 Jun 2014 13:07:39 +0200
Message-ID: <CAMuHMdVhU6JZFzuPkx=wtLcPYc7wwaMFwCrZu=zG7PmCYssy-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: H Hartley Sweeten <hsweeten@visionengravers.com>, Ian Abbott <abbotti@mev.co.uk>, Greg KH <gregkh@linuxfoundation.org>
Cc: driverdevel <devel@driverdev.osuosl.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

commit 9c340ac934dbbfd46e776465b08391baac32d486
Author: H Hartley Sweeten <hsweeten@visionengravers.com>
Date:   Thu May 29 10:56:32 2014 -0700

    staging: comedi: ni_stc.h: add read/write callbacks to struct ni_private

--- a/drivers/staging/comedi/drivers/ni_stc.h
+++ b/drivers/staging/comedi/drivers/ni_stc.h
@@ -1421,6 +1421,13 @@ struct ni_board_struct {
 #define NUM_GPCT       2

 struct ni_private {
+       uint8_t (*readb)(struct comedi_device *, int reg);
+       uint16_t (*readw)(struct comedi_device *, int reg);
+       uint32_t (*readl)(struct comedi_device *, int reg);
+       void (*writeb)(struct comedi_device *, uint8_t value, int reg);
+       void (*writew)(struct comedi_device *, uint16_t value, int reg);
+       void (*writel)(struct comedi_device *, uint32_t value, int reg);
+
        uint16_t (*stc_readw)(struct comedi_device *, int reg);
        uint32_t (*stc_readl)(struct comedi_device *, int reg);
        void (*stc_writew)(struct comedi_device *, uint16_t value, int reg);

However, on several architectures, writel() and friends are macros, causing:

drivers/staging/comedi/drivers/ni_atmio.c:318:38: error: macro
"writew" passed 3 arguments, but takes just 2

m68k http://kisskb.ellerman.id.au/kisskb/buildresult/11346953/
s390 kisskb.ellerman.id.au/kisskb/buildresult/11347163/
sparc64 kisskb.ellerman.id.au/kisskb/buildresult/11347152/
xtensa http://kisskb.ellerman.id.au/kisskb/buildresult/11346651/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
