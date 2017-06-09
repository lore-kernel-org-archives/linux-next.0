From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the uuid tree
Date: Fri, 9 Jun 2017 15:44:33 +1000
Message-ID: <20170609154433.1452fccf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40857 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751499AbdFIFof (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Jun 2017 01:44:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Christoph,

After merging the uuid tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/home/sfr/next/next/drivers/thermal/int340x_thermal/int3400_thermal.c: In function 'int3400_thermal_get_uuids':
/home/sfr/next/next/drivers/thermal/int340x_thermal/int3400_thermal.c:146:4: error: implicit declaration of function 'acpi_str_to_uuid' [-Werror=implicit-function-declaration]
    acpi_str_to_uuid(int3400_thermal_uuids[j], uuid);
    ^

Caused by commit

  94116f8126de ("ACPI: Switch to use generic guid_t in acpi_evaluate_dsm()")

I have used the uuid tree from next-20170607 again today.

-- 
Cheers,
Stephen Rothwell
