From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the uuid tree
Date: Thu, 8 Jun 2017 16:04:15 +1000
Message-ID: <20170608160415.007d1800@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49561 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750752AbdFHGES (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Jun 2017 02:04:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Christoph,

After merging the uuid tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from drivers/base/cpu.c:16:0:
include/linux/acpi.h:744:16: error: unknown type name 'guid_t'
          const guid_t *guid,
                ^

Caused by commit

  94116f8126de ("ACPI: Switch to use generic guid_t in acpi_evaluate_dsm()")

linux/uuid.h is only include for the CONFIG_ACPI case (in commit
41c8bdb3ab10 "acpi, nfit: Switch to use new generic UUID API").  This
build does not have CONFIG_ACPI set.

I have used the uuid tree from next-20170607 for today.

-- 
Cheers,
Stephen Rothwell
