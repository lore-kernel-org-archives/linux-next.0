From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the battery tree
Date: Thu, 5 Jan 2017 12:53:42 +1100
Message-ID: <20170105125342.3dcce8ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51545 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759919AbdAEByC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Jan 2017 20:54:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@free-electrons.com>

Hi all,

After merging the battery tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/power/supply/axp20x_usb_power.c: In function 'axp20x_usb_power_probe':
drivers/power/supply/axp20x_usb_power.c:297:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  power->axp20x_id = (int)of_device_get_match_data(&pdev->dev);
                     ^

Introduced by commit

  0dcc70ca8644 ("power: supply: axp20x_usb_power: use of_device_id data field instead of device_is_compatible")

-- 
Cheers,
Stephen Rothwell
