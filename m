From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the i2c tree
Date: Wed, 6 Jan 2016 12:39:11 +1100
Message-ID: <20160106123911.2fff44b3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44227 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751949AbcAFBjM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Jan 2016 20:39:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, Loc Ho <lho@apm.com>

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  drivers/i2c/busses/i2c-designware-platdrv.c

between commit:

  90708ce22b48 ("i2c: designware: Add support for AMD Seattle I2C")

from the i2c tree and commit:

  a90410e8ae3f ("i2c: dw: Add APM X-Gene ACPI I2C device support")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/i2c/busses/i2c-designware-platdrv.c
index 4f86d0795f7f,bf72ae740fc1..000000000000
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@@ -122,7 -123,7 +123,8 @@@ static const struct acpi_device_id dw_i
  	{ "80860F41", 0 },
  	{ "808622C1", 0 },
  	{ "AMD0010", ACCESS_INTR_MASK },
 +	{ "AMDI0510", 0 },
+ 	{ "APMC0D0F", 0 },
  	{ }
  };
  MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
