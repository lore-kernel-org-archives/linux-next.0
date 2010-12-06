From: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Subject: Re: linux-next: Tree for December 6
Date: Mon, 6 Dec 2010 16:09:33 +0100
Message-ID: <AANLkTi=iCZ=XQk3zXwK-BPnK4=9SU5W-arf+rom9dx8V@mail.gmail.com>
References: <20101206140055.34289498.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:64342 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837Ab0LFPJf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Dec 2010 10:09:35 -0500
In-Reply-To: <20101206140055.34289498.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Ave,

2010/12/6 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi all,
>
> [The mirroring on kernel.org is currently being slow, so this release=
 may
> not be available yet.]
>
> Changes since 20101203:
>

Nothing new here, only known issues

Kernel: arch/x86/boot/bzImage is ready  (#5)
  Building modules, stage 2.
  MODPOST 314 modules
ERROR: "dma_release_channel" [drivers/serial/pch_uart.ko] undefined!
ERROR: "__dma_request_channel" [drivers/serial/pch_uart.ko] undefined!
WARNING: modpost: Found 4 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=3Dy'
make[2]: *** [__modpost] Error 1
make[1]: *** [modules] Error 2
make: *** [sub-make] Error 2


WARNING: modpost: Found 9 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=3Dy'
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
drivers/built-in.o: In function `pch_uart_startup':
pch_uart.c:(.text+0x102efc): undefined reference to `__dma_request_chan=
nel'
pch_uart.c:(.text+0x102f46): undefined reference to `__dma_request_chan=
nel'
pch_uart.c:(.text+0x103037): undefined reference to `dma_release_channe=
l'
drivers/built-in.o: In function `pch_uart_shutdown':
pch_uart.c:(.text+0x103135): undefined reference to `dma_release_channe=
l'
pch_uart.c:(.text+0x103151): undefined reference to `dma_release_channe=
l'
make[1]: *** [.tmp_vmlinux1] Error 1
make: *** [sub-make] Error 2


  LD      drivers/rtc/built-in.o
make[4]: *** No rule to make target
`drivers/scsi/aic7xxx/aicasm/*.[chyl]', needed by
`drivers/scsi/aic7xxx/aicasm/aicasm'.  Stop.
make[3]: *** [drivers/scsi/aic7xxx] Error 2
make[2]: *** [drivers/scsi] Error 2
make[1]: *** [drivers] Error 2
make: *** [sub-make] Error 2

  GEN     /home/test/linux-2.6-obj/Makefile
scripts/kconfig/conf --silentoldconfig Kconfig
warning: (SCSI_SRP && SCSI_LOWLEVEL && SCSI && PCI) selects SCSI_TGT
which has unmet direct dependencies (SCSI && EXPERIMENTAL)
warning: (HAVE_TEXT_POKE_SMP && SMP) selects STOP_MACHINE which has
unmet direct dependencies (SMP && MODULE_UNLOAD || HOTPLUG_CPU)
warning: (CRYPTO_LRW && CRYPTO && EXPERIMENTAL || CRYPTO_XTS && CRYPTO
&& EXPERIMENTAL || CRYPTO_GHASH && CRYPTO) selects CRYPTO_GF128MUL
which has unmet dire
warning: (MEDIA_TUNER && MEDIA_SUPPORT && VIDEO_MEDIA && I2C &&
!MEDIA_TUNER_CUSTOMISE) selects MEDIA_TUNER_TEA5761 which has unmet
direct dependencies (MEDIA
*
* Restart config...
*
*
* USB Gadget Support
*
USB Gadget Support (USB_GADGET) [Y/n/?] y
  Debugging information files (DEVELOPMENT) (USB_GADGET_DEBUG_FILES) [N=
/y/?] n
  Debugging information files in debugfs (DEVELOPMENT)
(USB_GADGET_DEBUG_FS) [N/y/?] n
  Maximum VBUS Power usage (2-500 mA) (USB_GADGET_VBUS_DRAW) [2] 2
  USB Peripheral Controller
  > 1. Renesas R8A66597 USB Peripheral Controller (USB_GADGET_R8A66597)
    2. PXA9xx Processor USB2.0 controller (USB_GADGET_PXA_U2O)
    3. Renesas M66592 USB Peripheral Controller (USB_GADGET_M66592)
    4. AMD5536 UDC (USB_GADGET_AMD5536UDC)
    5. MIPS USB CI13xxx (USB_GADGET_CI13XXX)
    6. NetChip 228x (USB_GADGET_NET2280)
    7. Toshiba TC86C001 'Goku-S' (USB_GADGET_GOKU)
    8. Intel Langwell USB Device Controller (USB_GADGET_LANGWELL)
    9. Intel EG20T(Topcliff) USB Device controller (USB_GADGET_EG20T)
    10. Dummy HCD (DEVELOPMENT) (USB_GADGET_DUMMY_HCD)
  choice[1-10?]: 1
  USB Gadget Drivers
    1. Gadget Zero (DEVELOPMENT) (USB_ZERO)
    2. Audio Gadget (EXPERIMENTAL) (USB_AUDIO)
  > 3. Ethernet Gadget (with CDC Ethernet support) (USB_ETH)
    4. File-backed Storage Gadget (USB_FILE_STORAGE)
    5. Mass Storage Gadget (USB_MASS_STORAGE)
    6. Serial Gadget (with CDC ACM and CDC OBEX support) (USB_G_SERIAL)
    7. Printer Gadget (USB_G_PRINTER)
    8. CDC Composite Device (Ethernet and ACM) (USB_CDC_COMPOSITE)
    9. Nokia composite gadget (USB_G_NOKIA)
    10. Multifunction Composite Gadget (EXPERIMENTAL) (USB_G_MULTI)
    11. HID Gadget (USB_G_HID)
    12. EHCI Debug Device Gadget (USB_G_DBGP)
    13. USB Webcam Gadget (USB_G_WEBCAM)
  choice[1-13?]: 3
    RNDIS support (USB_ETH_RNDIS) [Y/n/?] (NEW) aborted!

Console input/output is redirected. Run 'make oldconfig' to update
configuration.

make[3]: *** [silentoldconfig] Error 1
make[2]: *** [silentoldconfig] Error 2
make[1]: *** No rule to make target `include/config/auto.conf', needed
by `include/config/kernel.release'.  Stop.
make: *** [sub-make] Error 2


--=20
Slawa!
Zimny "Spie dziadu!" Lech z Wawelu

Piekielny strach zagrzmia=B3
Patrz=EA na sufit
Krew tam
Strz=EApy g=B3=F3w w b=F3lach j=EAcz=B1 co=B6
