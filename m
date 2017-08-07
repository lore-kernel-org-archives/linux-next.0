From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the dmi tree
Date: Mon, 7 Aug 2017 11:40:33 +1000
Message-ID: <20170807114033.4d484e6c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51371 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751378AbdHGBkf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 6 Aug 2017 21:40:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Jean Delvare <jdelvare@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Lukas Wunner <lukas@wunner.de>

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  drivers/acpi/sbs.c

between commit:

  f996c4155d0d ("dmi: Mark all struct dmi_system_id instances const")

from the dmi tree and commit:

  630b3aff8a51 ("treewide: Consolidate Apple DMI checks")

from the pm tree.

I fixed it up (the latter removed the declaration updated by the former)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
