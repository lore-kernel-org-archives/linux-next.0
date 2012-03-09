From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: slave-dma/next - please drop "drivers/dma: linux/module.h included
 twice"
Date: Thu, 8 Mar 2012 21:36:44 -0500
Message-ID: <20120309023643.GA1796@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:63087 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750900Ab2CICgq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Mar 2012 21:36:46 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: vinod.koul@linux.intel.com
Cc: linux-next@vger.kernel.org

Hi Vinod,

Please drop commit 865d9438eb1f7670d2e88849f059db551b320887 from your
tree.  There is a commit to delete all the duplicate module.h includes
tree-wide, and since your commit deletes one, and my commit deletes
the other, the final tree has no module.h which causes this fail:

http://kisskb.ellerman.id.au/kisskb/buildresult/5819464/

Thanks,
Paul.
