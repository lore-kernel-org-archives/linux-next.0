From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-bys missing for commits in the thermal tree
Date: Tue, 5 Sep 2017 10:57:34 +1000
Message-ID: <20170905105734.13e4c3cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55657 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754065AbdIEA5g (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Sep 2017 20:57:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Zhang Rui <rui.zhang@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Zhang,

Commits

  1f0d851d9359 ("Debug patch")
  083d998842a2 ("debug")

are missing a Signed-off-bys.

These are not really appropriate for linux-next inclusion - especially
during the merge window.

-- 
Cheers,
Stephen Rothwell
