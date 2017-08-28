From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the slave-dma tree
Date: Tue, 29 Aug 2017 09:10:56 +1000
Message-ID: <20170829091056.398976cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57275 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751189AbdH1XK7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Aug 2017 19:10:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinod Koul <vinod.koul@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>

Hi Vinod,

Commit

  966e5e01f420 ("dmaengine: altera: Use macros instead of structs to describe the registers")

is missing a Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
