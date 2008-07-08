From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 8 (HID)
Date: Tue, 8 Jul 2008 11:16:49 -0700
Message-ID: <20080708111649.e61b19bc.randy.dunlap@oracle.com>
References: <20080708192251.3275d283.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:38583 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753494AbYGHSR4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Jul 2008 14:17:56 -0400
In-Reply-To: <20080708192251.3275d283.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, jkosina@suse.cz

drivers/built-in.o: In function `usb_kbd_probe':
usbkbd.c:(.text+0x1457c9): undefined reference to `usbhid_lookup_quirk'
drivers/built-in.o: In function `usb_mouse_probe':
usbmouse.c:(.text+0x14603c): undefined reference to `usbhid_lookup_quirk'
make[1]: *** [.tmp_vmlinux1] Error 1


from (partial config):

CONFIG_HID_SUPPORT=y
CONFIG_HID=y
# CONFIG_HID_DEBUG is not set
CONFIG_HIDRAW=y

#
# USB Input Devices
#
CONFIG_USB_HID=m
CONFIG_USB_HIDINPUT_POWERBOOK=y
CONFIG_HID_FF=y
# CONFIG_HID_PID is not set
CONFIG_LOGITECH_FF=y
CONFIG_LOGIRUMBLEPAD2_FF=y
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_ZEROPLUS_FF is not set
CONFIG_USB_HIDDEV=y

#
# USB HID Boot Protocol drivers
#
CONFIG_USB_KBD=y
CONFIG_USB_MOUSE=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB_ARCH_HAS_OHCI=y
CONFIG_USB_ARCH_HAS_EHCI=y


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
