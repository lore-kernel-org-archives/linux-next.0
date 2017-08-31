From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the dmi tree
Date: Thu, 31 Aug 2017 11:07:59 +1000
Message-ID: <20170831110759.334c9fe2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40271 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750822AbdHaBIC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Aug 2017 21:08:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Jean Delvare <jdelvare@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Toshi Kani <toshi.kani@hpe.com>

Hi all,

Today's linux-next merge of the pm tree got a conflict in:

  drivers/acpi/blacklist.c

between commit:

  f996c4155d0d ("dmi: Mark all struct dmi_system_id instances const")

from the dmi tree and commit:

  5aa5911a0ed9 ("ACPI / blacklist: add acpi_match_platform_list()")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
