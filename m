From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the hid tree
Date: Mon, 12 Dec 2016 10:59:03 +1100
Message-ID: <20161212105903.418e913f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58647 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753944AbcLKX7G (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Dec 2016 18:59:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?Sm/Do28=?= Paulo Rechi Vita <jprvita@gmail.com>, David Arcari <darcari@redhat.com>

Hi Jiri,

After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/hid/i2c-hid/i2c-hid.c: In function 'i2c_hid_start':
drivers/hid/i2c-hid/i2c-hid.c:773:19: error: 'struct i2c_hid' has no member named 'irq'
   disable_irq(ihid->irq);
                   ^
drivers/hid/i2c-hid/i2c-hid.c:777:18: error: 'struct i2c_hid' has no member named 'irq'
   enable_irq(ihid->irq);
                  ^

Caused by commit

  de3c99488609 ("HID: i2c-hid: Disable IRQ before freeing buffers")

interacting with commit

  ba18a9314a94 ("Revert "HID: i2c-hid: Add support for ACPI GPIO interrupts"")

from earlier in the same tree!

I have used the hid tree from next-20161209 for today.

-- 
Cheers,
Stephen Rothwell
