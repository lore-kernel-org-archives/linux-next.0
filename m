From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: missing Signed-off-by in commit in the drm tree
Date: Thu, 27 Jul 2017 09:30:58 +1000
Message-ID: <20170727093058.235d974c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49443 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751202AbdGZXbA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Jul 2017 19:31:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Eric Anholt <eric@anholt.net>

Hi all,

Commit

  edeb729f7929 ("drm/vc4: Send a VBLANK event when disabling a CRTC")

is missing a Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
