From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the drm tree
Date: Tue, 5 Dec 2017 13:45:50 +1100
Message-ID: <20171205134550.58e1f217@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44221 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751380AbdLECpx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Dec 2017 21:45:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Biju Das <biju.das@bp.renesas.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Hi all,

Commits

  36a46da90212 ("drm: rcar-du: Add R8A7743 support")
  cdd907001572 ("drm: rcar-du: Add R8A7745 support")
  7912dee7775e ("drm: rcar-du: Implement system suspend/resume support")
  cf05f74ef40e ("drm: rcar-du: Remove unused CRTC suspend/resume functions")

are missing a Signed-off-by from their committer.

-- 
Cheers,
Stephen Rothwell
