From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drivers-x86 tree
Date: Wed, 14 Dec 2016 13:50:44 +1100
Message-ID: <20161214135044.57dc96f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38911 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753016AbcLNDBb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Dec 2016 22:01:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lyude <lyude@redhat.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Hi Darren,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/kernel.h:13:0,
                 from drivers/platform/x86/thinkpad_acpi.c:52:
drivers/platform/x86/thinkpad_acpi.c: In function 'hotkey_init':
include/linux/printk.h:299:2: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
  ^
drivers/platform/x86/thinkpad_acpi.c:3147:8: note: 'type' was declared here
  char *type;
        ^
In file included from include/linux/kernel.h:13:0,
                 from drivers/platform/x86/thinkpad_acpi.c:52:
include/linux/printk.h:299:2: warning: 'in_tablet_mode' may be used uninitialized in this function [-Wmaybe-uninitialized]
  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
  ^
drivers/platform/x86/thinkpad_acpi.c:3146:6: note: 'in_tablet_mode' was declared here
  int in_tablet_mode, res;
      ^

Introduced by commit

  b31800283868 ("platform/x86: thinkpad_acpi: Move tablet detection into separate function")

I can't tell if this is a false positive or not.

-- 
Cheers,
Stephen Rothwell
