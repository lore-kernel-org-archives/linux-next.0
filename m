From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drivers-x86 tree with the watchdog
 tree
Date: Tue, 2 May 2017 14:04:03 +1000
Message-ID: <20170502140403.24e315cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53427 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751023AbdEBEEG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 May 2017 00:04:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Wim Van Sebroeck <wim@iguana.be>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/watchdog/iTCO_wdt.c

between commit:

  38a700fa1df9 ("watchdog: iTCO_wdt: cleanup set/unset no_reboot_bit functions")
(which also appears in the drivers-x86 tree as commit f583a884afec)

from the watchdog tree and commit:

  140c91b26ebc ("watchdog: iTCO_wdt: Add PMC specific noreboot update api")

from the drivers-x86 tree.

I fixed it up and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
