From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the chrome-platform
 tree
Date: Tue, 12 Sep 2017 09:45:04 +1000
Message-ID: <20170912094504.08a878e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51873 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751004AbdIKXpH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Sep 2017 19:45:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benson Leung <bleung@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Benson,

Commits

  b8b9f5d4a441 ("platform/chrome: Use proper protocol transfer function")
  19601fbb7d96 ("platform/chrome: cros_ec: sysfs: Modify error handling")
  3bd61d4d1d9e ("platform/chrome: cros_ec: Add sysfs entry to set keyboard wake lid angle")

are missing a Signed-off-by from their committer.

-- 
Cheers,
Stephen Rothwell
