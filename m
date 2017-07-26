From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: missing Signed-off-by in commit in the drm tree
Date: Thu, 27 Jul 2017 09:28:03 +1000
Message-ID: <20170727092803.4f0d0172@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41243 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751078AbdGZX2F (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Jul 2017 19:28:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mario Kleiner <mario.kleiner.de@gmail.com>, Eric Anholt <eric@anholt.net>

Hi all,

Commit

  7d2818f54e38 ("drm/vc4: Allow vblank_disable_immediate on non-fw-kms. (v2)")

is missing a Signed-off-by line for its commiter.

-- 
Cheers,
Stephen Rothwell
