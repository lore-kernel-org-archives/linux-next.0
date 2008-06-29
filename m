From: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: linux-next: Tree for June 26
Date: Sun, 29 Jun 2008 21:49:35 +0100
Message-ID: <1214772575.10393.306.camel@pmac.infradead.org>
References: <20080627010842.e1a0c4b5.sfr@canb.auug.org.au>
	 <200806290215.03792.rjw@sisk.pl>
	 <1214726476.10393.289.camel@pmac.infradead.org>
	 <200806291336.44603.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200806291336.44603.rjw-KKrjLPT3xs0@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>
Cc: Jaswinder Singh <jaswinder-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, "Maciej W. Rozycki" <macro-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Sun, 2008-06-29 at 13:36 +0200, Rafael J. Wysocki wrote:
> # make INSTALL_FW_PATH=/lib/firmware firmware_install
> make -C /home/rafael/src/linux-next
> O=/home/rafael/src/build/next/albercik/. firmware_install
> make[3]: *** No rule to make target `firmware/acenic/tg1.bin', needed
> by `/lib/firmware/acenic/tg1.bin'.  Stop.
> make[2]: *** [firmware_install] Error 2
> make[1]: *** [sub-make] Error 2
> make: *** [all] Error 2

Ah, sorry -- I haven't been testing firmware_install with O= builds very
often, and I seem to have broken it. This should fix it:

--- a/firmware/Makefile
+++ b/firmware/Makefile
@@ -69,7 +69,7 @@ fw-shipped-y :=
 endif
 
 firmware-y    := $(fw-external-y) $(fw-shipped-y)
-firmware-dirs := $(sort $(patsubst %,$(objtree)/$(obj)/%/,$(dir $(firmware-y))))
+firmware-dirs := $(sort $(patsubst %,$(objtree)/$(obj)/%/,$(dir $(firmware-y) $(fw-shipped-))))
 
 quiet_cmd_mkdir = MKDIR   $(patsubst $(objtree)/%,%,$@)
       cmd_mkdir = mkdir -p $@


-- 
dwmw2
