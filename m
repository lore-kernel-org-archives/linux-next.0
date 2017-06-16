From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Fri, 16 Jun 2017 15:21:36 +1000
Message-ID: <20170616152136.161630bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53535 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750827AbdFPFVj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Jun 2017 01:21:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>

Hi all,

Today's linux-next merge of the uuid tree got conflicts in:

  drivers/acpi/apei/ghes.c
  include/uapi/linux/uuid.h

between commits:

  f4dccde3f9b9 ("ras: acpi/apei: cper: add support for generic data v3 structure")
  476e4940c251 ("ras: acpi / apei: generate trace event for unrecognized CPER section")
  8a0456ea3dec ("trace, ras: add ARM processor error trace event")

from the arm64 tree and commit:

  60927bc31436 ("uuid: remove uuid_be defintions from the uapi header")
  f9727a17db9b ("uuid: rename uuid types")
  5b53696a30d5 ("ACPI / APEI: Switch to use new generic UUID API")

from the uuid tree.

I really can't fix this up, so can you guys get together and sort this
out, please.

For today, I have just dropped the uuid tree, sorry.



-- 
Cheers,
Stephen Rothwell
