From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: please clean up the hid tree
Date: Wed, 13 Jul 2016 09:28:09 +1000
Message-ID: <20160713092809.566559b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37528 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751703AbcGLX2N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Jul 2016 19:28:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jiri,

The hid tree
(git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid.git#for-next)
seems to be based on v3.19 and constists of a large number of merges
(of stuff that is now in Linus' tree) and ends with one particulary
large revert (of a merge).

Please just rebase it onto (e.g.) v4.7-rc<something>).

$ git shortlog origin/master..hid/for-next
Alexander Kuleshov (1):
      HID: debug: Check result of debugfs_create_dir() and debugfs_create_file()

Arnd Bergmann (1):
      HID: logitech-hidpp: select CONFIG_POWER_SUPPLY

Benjamin Tissoires (1):
      HID: logitech-hidpp: remove HIDPP_QUIRK_CONNECT_EVENTS

Fu, Zhonghui (1):
      HID: i2c_hid: enable i2c-hid devices to suspend/resume asynchronously

Guohua Zhong (1):
      HID: i2c-hid: set power sleep before shutdown

Heiner Kallweit (11):
      HID: migrate USB LED driver from usb misc to hid
      usb: misc: remove outdated USB LED driver
      HID: thingm: simplify debug output code
      HID: hid-led: add support for devices with multiple independent LEDs
      HID: hid-led: add support for reading from LED devices
      HID: hid-led: add support for ThingM blink(1)
      HID: remove ThingM blink(1) driver
      HID: hid-led: remove report id from struct hidled_config
      HID: hid-led: add support for Delcom Visual Signal Indicator G2
      HID: hid-led: add support for Greynut Luxafor
      HID: hid-led: fix Delcom support on big endian systems

Jean-Gabriel Gill-Couture (1):
      HID: add usb device id for Apple Magic Keyboard

Jiri Kosina (231):
      Merge branches 'for-4.1/genius', 'for-4.1/logitech', 'for-4.1/rmi', 'for-4.1/sony' and 'for-4.1/wacom' into for-next
      Merge branch 'for-4.1/sensor-hub' into for-next
      Merge branch 'for-4.1/upstream' into for-next
      Merge branch 'for-4.1/wacom' into for-next
      Merge branch 'for-4.1/i2c-hid' into for-next
      Merge branch 'for-4.1/rmi' into for-next
      Merge branch 'for-4.1/upstream' into for-next
      Merge branch 'for-4.1/wacom' into for-next
      Merge branch 'for-4.0/upstream-fixes' into for-next
      Merge branch 'for-4.1/huion-uclogic-merge' into for-next
      Merge branch 'for-4.1/huion-uclogic-merge' into for-next
      Merge branch 'for-4.1/upstream' into for-next
      Merge branch 'for-4.1/multitouch' into for-next
      Merge branch 'for-4.1/wacom' into for-next
      Merge branch 'for-4.0/upstream-fixes' into for-next
      Merge branch 'for-4.1/wacom' into for-next
      Merge branch 'for-4.1/multitouch' into for-next
      Merge branch 'for-4.0/upstream-fixes' into for-next
      Merge branch 'for-4.1/upstream' into for-next
      Merge branch 'for-4.1/huion-uclogic-merge' into for-next
      Merge branch 'for-4.1/kconfig-drop-expert-dependency' into for-next
      Merge branch 'for-4.1/upstream' into for-next
      Merge branch 'for-4.1/upstream' into for-next
      Merge branch 'for-4.1/sensor-hub' into for-next
      Merge branch 'for-4.1/sensor-hub' into for-next
      Merge branch 'for-4.1/wacom' into for-next
      Merge branch 'for-4.0/upstream-fixes' into for-next
      Merge branch 'for-4.0/upstream-fixes' into for-next
      Merge branch 'for-4.1/upstream' into for-next
      Merge branch 'for-4.1/wacom' into for-next
      Merge branch 'for-4.0/upstream-fixes' into for-next
      Merge branch 'for-4.1/logitech' into for-next
      Merge branch 'for-4.1/wacom' into for-next
      Merge branch 'for-4.1/logitech' into for-next
      Merge branch 'for-4.1/upstream' into for-next
      Merge branch 'for-4.1/upstream' into for-next
      Merge branch 'for-4.1/sensor-hub' into for-next
      Merge branch 'for-4.2/wacom' into for-next
      Merge branch 'for-4.2/upstream' into for-next
      Merge branch 'for-4.2/lenovo' into for-next
      Merge branch 'for-4.1/upstream-fixes' into for-next
      Merge branch 'for-4.2/wacom' into for-next
      Merge branch 'for-4.2/wacom' into for-next
      Merge branch 'for-4.2/lenovo' into for-next
      Merge branch 'for-4.2/logitech' into for-next
      Merge branch 'for-4.2/upstream' into for-next
      Merge branch 'for-4.2/sony' into for-next
      Merge branch 'for-4.2/sjoy' into for-next
      Merge branch 'for-4.1/upstream-fixes' into for-next
      Merge branch 'for-4.2/logitech' into for-next
      Merge branch 'for-4.1/upstream-fixes' into for-next
      Merge branch 'for-4.2/upstream' into for-next
      Merge branch 'for-4.1/upstream-fixes' into for-next
      Merge branch 'for-4.2/sensor-hub' into for-next
      Merge branch 'for-4.2/upstream' into for-next
      Merge branch 'for-4.1/upstream-fixes' into for-next
      Merge branch 'for-4.2/wacom' into for-next
      Merge branch 'for-4.1/upstream-fixes' into for-next
      Merge branch 'for-4.2/upstream' into for-next
      Merge branch 'for-4.2/upstream' into for-next
      Merge branch 'for-4.2/upstream' into for-next
      Merge branch 'for-4.2/logitech' into for-next
      Merge branch 'for-4.2/upstream' into for-next
      Merge branch 'for-4.2/i2c-hid' into for-next
      Merge branch 'for-4.2/sony' into for-next
      Merge branch 'for-4.2/plantronics' into for-next
      Merge branch 'for-4.2/rmi' into for-next
      Merge branch 'for-4.2/wacom' into for-next
      Merge branch 'for-4.2/sony' into for-next
      Merge branch 'for-4.2/upstream' into for-next
      Merge branch 'for-4.2/upstream' into for-next
      Merge branch 'for-4.3/picolcd' into for-next
      Merge branch 'for-4.2/upstream-fixes' into for-next
      Merge branch 'for-4.3/sensor-hub' into for-next
      Merge branch 'for-4.3/upstream' into for-next
      Merge branch 'for-4.2/upstream-fixes' into for-next
      Merge branch 'for-4.2/upstream-fixes' into for-next
      Merge branch 'for-4.3/i2c-hid' into for-next
      Merge branch 'for-4.3/cp2112' into for-next
      Merge branch 'for-4.3/rmi' into for-next
      Merge branch 'for-4.3/upstream' into for-next
      Merge branch 'for-4.3/cp2112' into for-next
      Merge branch 'for-4.3/upstream' into for-next
      Merge branch 'for-4.3/rmi' into for-next
      Merge branch 'for-4.3/wacom' into for-next
      Merge branch 'for-4.3/sony' into for-next
      Merge branch 'for-4.3/cp2112' into for-next
      Merge branch 'for-4.3/cp2112' into for-next
      Merge branch 'for-4.3/wacom' into for-next
      Merge branch 'for-4.3/rmi' into for-next
      Merge branch 'for-4.3/wacom' into for-next
      Merge branch 'for-4.3/microsoft' into for-next
      Merge branch 'for-4.3/multitouch' into for-next
      Merge branch 'for-4.3/sony' into for-next
      Merge branch 'for-4.3/upstream' into for-next
      Merge branch 'for-4.2/upstream-fixes' into for-next
      Merge branch 'for-4.3/logitech' into for-next
      Merge branch 'for-4.3/chicony' into for-next
      Merge branch 'for-4.2/upstream-fixes' into for-next
      Merge branch 'for-4.3/sony' into for-next
      Merge branch 'for-4.3/wacom' into for-next
      Revert "HID: core/input: Fix accessing freed memory during driver unbind"
      Merge branch 'for-4.2/upstream-fixes-devm-fixed' into for-next
      Merge branch 'for-4.3/wacom' into for-next
      Merge branch 'for-4.3/upstream' into for-next
      Merge branch 'for-4.2/upstream-fixes-devm-fixed' into for-next
      Merge branch 'for-4.3/wacom' into for-next
      Merge branch 'for-4.3/lenovo' into for-next
      Merge branch 'for-4.3/gembird' into for-next
      Merge branch 'for-4.3/wacom' into for-next
      Merge branch 'for-4.3/i2c-hid' into for-next
      Merge branch 'for-4.3/upstream' into for-next
      Merge branch 'for-4.3/upstream' into for-next
      Merge branch 'for-4.3/wacom' into for-next
      Merge branch 'for-4.3/upstream-fixes' into for-next
      Merge branches 'for-4.4/debugfs-fixes', 'for-4.4/dragonrise', 'for-4.4/logitech' and 'for-4.4/upstream' into for-next
      Merge branch 'for-4.4/microsoft' into for-next
      Merge branch 'for-4.4/upstream' into for-next
      Merge branch 'for-4.3/upstream-fixes' into for-next
      Merge branch 'for-4.4/wacom' into for-next
      Merge branch 'for-4.4/i2c-hid' into for-next
      Revert "HID: debug: Check result of debugfs_create_dir() and debugfs_create_file()"
      Merge branch 'for-4.4/multitouch' into for-next
      Merge branch 'for-4.4/upstream' into for-next
      Merge branch 'for-4.4/corsair' into for-next
      Merge branch 'for-4.3/upstream-fixes' into for-next
      Merge branch 'for-4.3/upstream-fixes' into for-next
      Merge branch 'for-4.4/multitouch' into for-next
      Merge branch 'for-4.4/wacom' into for-next
      Merge branch 'for-4.4/roccat-sysfs-deprecation' into for-next
      Merge branch 'for-4.3/upstream-fixes' into for-next
      Merge branch 'for-4.4/upstream' into for-next
      Merge branch 'for-4.4/wacom' into for-next
      Merge branch 'for-4.4/wacom' into for-next
      Merge branch 'for-4.4/wacom' into for-next
      Merge branch 'for-4.4/logitech' into for-next
      Merge branch 'for-4.4/upstream-fixes' into for-next
      Merge branch 'for-4.4/upstream-fixes' into for-next
      Merge branch 'for-4.5/sony' into for-next
      Merge branch 'for-4.5/sony' into for-next
      Merge branch 'for-4.5/i2c-hid' into for-next
      Merge branch 'for-4.5/wacom' into for-next
      Merge branch 'for-4.5/core' into for-next
      Merge branch 'for-4.5/core' into for-next
      Merge branch 'for-4.4/upstream-fixes' into for-next
      Merge branch 'for-4.5/logitech' into for-next
      Merge branch 'for-4.5/core' into for-next
      Merge branch 'for-4.5/core' into for-next
      Merge branch 'for-4.5/multitouch' into for-next
      Merge branch 'for-4.5/core' into for-next
      Merge branch 'for-4.5/core' into for-next
      Merge branch 'for-4.4/upstream-fixes' into for-next
      Merge branch 'for-4.5/multitouch' into for-next
      Merge branch 'for-4.5/wacom' into for-next
      Merge branch 'for-4.5/async-suspend' into for-next
      Merge branch 'for-4.5/wacom' into for-next
      Merge branch 'for-4.5/wacom' into for-next
      Merge branch 'for-4.5/core' into for-next
      Merge branch 'for-4.5/upstream' into for-next
      Merge branch 'for-4.5/upstream' into for-next
      Merge branch 'for-4.5/container-of-cleanups' into for-next
      Merge branch 'for-4.4/upstream-fixes' into for-next
      Merge branch 'for-4.5/wacom' into for-next
      Merge branch 'for-4.4/upstream-fixes' into for-next
      Merge branch 'for-4.4/upstream-fixes' into for-next
      Merge branch 'for-4.5/logitech' into for-next
      Merge branch 'for-4.5/upstream-fixes' into for-next
      Merge branch 'for-4.5/upstream-fixes' into for-next
      Merge branch 'for-4.6/upstream' into for-next
      Merge branch 'for-4.6/sony' into for-next
      Merge branch 'for-4.6/wacom' into for-next
      Merge branch 'for-4.5/upstream-fixes' into for-next
      Merge branch 'for-4.6/logitech' into for-next
      Merge branch 'for-4.5/upstream-fixes' into for-next
      Merge branch 'for-4.6/upstream' into for-next
      Merge branch 'for-4.6/upstream' into for-next
      Merge branches 'for-4.6/sony' and 'for-4.6/upstream' into for-next
      Merge branch 'for-4.5/upstream-fixes' into for-next
      Merge branch 'for-4.5/upstream-fixes' into for-next
      Merge branch 'for-4.6/wacom' into for-next
      Merge branch 'for-4.5/upstream-fixes' into for-next
      Merge branch 'for-4.6/thingm' into for-next
      Merge branch 'for-4.6/cmedia' into for-next
      Merge branch 'for-4.6/multitouch' into for-next
      Merge branch 'for-4.6/i2c-hid' into for-next
      Merge branch 'for-4.6/penmount' into for-next
      Merge branch 'for-4.5/upstream-fixes' into for-next
      Merge branch 'for-4.6/multitouch' into for-next
      Merge branch 'for-4.6/i2c-hid' into for-next
      Merge branch 'for-4.6/thingm' into for-next
      Merge branch 'for-4.6/upstream' into for-next
      Merge branch 'for-4.6/upstream-fixes' into for-next
      Merge branches 'for-4.6/upstream-fixes' and 'for-4.7/hidraw' into for-next
      Merge branch 'for-4.6/upstream-fixes' into for-next
      Merge branch 'for-4.7/asus' into for-next
      Merge branch 'for-4.7/upstream' into for-next
      Merge branch 'for-4.7/asus' into for-next
      Merge branch 'for-4.6/upstream-fixes' into for-next
      Merge branch 'for-4.6/upstream-fixes' into for-next
      Merge branch 'for-4.7/upstream' into for-next
      Merge branch 'for-4.6/upstream-fixes' into for-next
      Merge branch 'for-4.7/thingm' into for-next
      Merge branch 'for-4.7/thingm' into for-next
      Merge branch 'for-4.6/upstream-fixes' into for-next
      Merge branch 'for-4.7/upstream' into for-next
      Merge branch 'for-4.6/upstream-fixes' into for-next
      Merge branch 'for-4.7/upstream-fixes' into for-next
      Merge branch 'for-4.7/upstream-fixes' into for-next
      Merge branch 'for-4.8/uhid-offload-hid-device-add' into for-next
      Merge branch 'for-4.8/i2c-hid' into for-next
      HID: led: fix config
      Merge branch 'for-4.8/hid-led' into for-next
      HID: alps: struct u1_dev *priv is internal to the driver
      Merge branch 'for-4.8/alps' into for-next
      HID: alps: pass correct sizes to hid_hw_raw_request()
      Merge branch 'for-4.8/alps' into for-next
      Merge branch 'for-4.8/upstream' into for-next
      HID: alps: match alps devices in core
      Merge branch 'for-4.8/alps' into for-next
      Merge branch 'for-4.8/i2c-hid' into for-next
      Merge branch 'for-4.8/merge-thingm-into-hid-led' into for-next
      Merge branch 'for-4.8/alps' into for-next
      Merge branch 'for-4.7/upstream-fixes' into for-next
      Merge branch 'for-4.7/upstream-fixes' into for-next
      Merge branch 'for-4.8/hid-led' into for-next
      Merge branch 'for-4.8/logitech-hidpp-battery' into for-next
      Merge branch 'for-4.8/hid-led' into for-next
      Merge branch 'for-4.8/apple' into for-next
      Merge branch 'for-4.8/logitech-hidpp-battery' into for-next
      Revert "Merge branch 'for-4.8/logitech-hidpp-battery' into for-next"
      Revert "Merge branch 'for-4.8/logitech-hidpp-battery' into for-next"

Krzysztof Kozlowski (1):
      HID: core/input: Fix accessing freed memory during driver unbind

Masaki Ota (2):
      HID: add Alps I2C HID Touchpad-Stick support
      HID: alps: a few cleanups

Peter Hutterer (1):
      HID: logitech-hidpp: add battery support for HID++ 2.0 devices

Roderick Colenbrander (1):
      HID: uhid: fix timeout when probe races with IO

-- 
Cheers,
Stephen Rothwell
