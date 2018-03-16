From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the asm-generic tree
Date: Fri, 16 Mar 2018 09:07:49 +0100
Message-ID: <CAK8P3a3fiRkqiR5ZGHAkjzHvX1H_+svtYGCd9SYQjtrFjXDpng@mail.gmail.com>
References: <20180316091355.2d2b7b04@canb.auug.org.au> <20180315224727.GC73@LTA0271908.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180315224727.GC73@LTA0271908.dhcp.ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Aaron Wu <aaron.wu@analog.com>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 15, 2018 at 11:47 PM, Bin Liu <b-liu@ti.com> wrote:
> Hi,
>
> On Fri, Mar 16, 2018 at 09:13:55AM +1100, Stephen Rothwell wrote:
>> Hi Arnd,
>>
>> After merging the asm-generic tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> drivers/usb/musb/musb_host.c: In function 'musb_rx_reinit':
>> drivers/usb/musb/musb_host.c:577:10: error: 'struct musb' has no member named 'double_buffer_not_ok'
>>   if (musb->double_buffer_not_ok)
>>           ^~
>> drivers/usb/musb/musb_host.c: In function 'musb_ep_program':
>> drivers/usb/musb/musb_host.c:807:12: error: 'struct musb' has no member named 'double_buffer_not_ok'
>>     if (musb->double_buffer_not_ok) {
>>             ^~
>>
>> Caused by commit
>>
>>   8312c0cad792 ("usb: musb: remove blackfin port")

Sorry about that, I should have done more testing after updating the patch.
Aaron sent a second version of the blackfin removal, and after comparing
his version with mine, I picked up a couple of extra hunks that I folded
into my patch series, including the two musb bits below.

> I don't have a clone of the asm-generic tree to check, but this patch
> Arnd sent yesterday for review doesn't remove double_buffer_not_ok from
> struct musb. Is it removed when Arnd you were revising it based on my
> review comments? Anyway, it is better to remove it too since this flag
> is Blackfin specific, but is it possible to combine this fixup patch with the
> original patch to avoid bisect headache in the future?

Sure, doing that now.

    Arnd

8<---

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 011c8ca7de42..13486588e561 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2166,7 +2166,7 @@ musb_init_controller(struct device *dev, int
nIrq, void __iomem *ctrl)
         *   - initializes musb->xceiv, usually by otg_get_phy()
         *   - stops powering VBUS
         *
-        * There are various transceiver configurations.  Blackfin,
+        * There are various transceiver configurations.
         * DaVinci, TUSB60x0, and others integrate them.  OMAP3 uses
         * external/discrete ones in various flavors (twl4030 family,
         * isp1504, non-OTG, etc) mostly hooking up through ULPI.
diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
index ac675b1a34c4..8a74cb2907f8 100644
--- a/drivers/usb/musb/musb_core.h
+++ b/drivers/usb/musb/musb_core.h
@@ -414,19 +414,6 @@ struct musb {
        struct usb_gadget_driver *gadget_driver;        /* its driver */
        struct usb_hcd          *hcd;                   /* the usb hcd */

-       /*
-        * FIXME: Remove this flag.
-        *
-        * This is only added to allow Blackfin to work
-        * with current driver. For some unknown reason
-        * Blackfin doesn't work with double buffering
-        * and that's enabled by default.
-        *
-        * We added this flag to forcefully disable double
-        * buffering until we get it working.
-        */
-       unsigned                double_buffer_not_ok:1;
-
        const struct musb_hdrc_config *config;

        int                     xceiv_old_state;
