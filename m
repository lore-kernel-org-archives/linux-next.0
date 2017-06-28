From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unsigned commit in the libata tree
Date: Thu, 29 Jun 2017 07:54:15 +1000
Message-ID: <20170629075415.6fc0e759@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36351 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751848AbdF1VyX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 17:54:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Tejun,

I appreciate the fix, but commit

  bb6133c54b97 ("libata: fix build warning from unused goto label")

has no Signed-off-by tag.

-- 
Cheers,
Stephen Rothwell
