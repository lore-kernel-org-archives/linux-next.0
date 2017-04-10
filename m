From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: missing signatures on commits in the drm tree
Date: Tue, 11 Apr 2017 07:50:23 +1000
Message-ID: <20170411075023.3bf147de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35117 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751702AbdDJVu1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Apr 2017 17:50:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, CK Hu <ck.hu@mediatek.com>, YT Shen <yt.shen@mediatek.com>, shaoming chen <shaoming.chen@mediatek.com>, Rob Herring <robh@kernel.org>

Hi Dave,

I noticed that a series of commits in the drm tree
(git://people.freedesktop.org/~airlied/linux.git#drm-next) do not have
Signed-off-by tags from their committer - they have Acked-by tags instead:

84a5ead18e57 drm/mediatek: add support for Mediatek SoC MT2701
0707632b5bac drm/mediatek: update DSI sub driver flow for sending commands to panel
2d52bfba09d1 drm/mediatek: add non-continuous clock mode and EOT packet control
21898816831f drm/mediatek: add dsi transfer function
dd5080a54df8 drm/mediatek: add dsi interrupt control
80a5cfd60d2a drm/mediatek: cleaning up and refine
fb2557de27e3 drm/mediatek: update display module connections
c37813de6687 drm/mediatek: add BLS component
9dc84e98a31f drm/mediatek: add shadow register support
c5f228ef6ccd drm/mediatek: add *driver_data for different hardware settings
55dc065e3ec6 drm/mediatek: add helpers for coverting from the generic components
e3215713f878 dt-bindings: display: mediatek: update supported chips

This last one doesn't even have an Acked-by from its committer.

-- 
Cheers,
Stephen Rothwell
