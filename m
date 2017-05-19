From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drivers-x86 tree
Date: Fri, 19 May 2017 13:23:17 +1000
Message-ID: <20170519132317.5dc47b24@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35549 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752916AbdESDXU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 May 2017 23:23:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ritesh Raj Sarraf <rrs@debian.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Darren,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/platform/x86/ideapad-laptop.c:438:16: warning: 'touchpad_store' defined but not used [-Wunused-function]
 static ssize_t touchpad_store(struct device *dev,
                ^

Introduced by commit

  7f363145992c ("platform/x86: ideapad-laptop: Switch touchpad attribute to be RO")

-- 
Cheers,
Stephen Rothwell
