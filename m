From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm tree
Date: Mon, 4 Dec 2017 11:30:21 +1100
Message-ID: <20171204113021.074df7b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52021 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751105AbdLDAaY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Dec 2017 19:30:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/gpu/drm/i915/gvt/cmd_parser.c: In function 'perform_bb_shadow':
drivers/gpu/drm/i915/gvt/cmd_parser.c:1647:8: warning: unused variable 'dst' [-Wunused-variable]
  void *dst = NULL;
        ^

Introduced by commit

  93588e545a4f ("Merge tag 'drm-intel-next-2017-11-17-1' of git://anongit.freedesktop.org/drm/drm-intel into drm-next")

this merge reintroduced the variable declaration removed by commit

  f52c380a48f5 ("drm/i915/gvt: Refine shadow batch buffer")

-- 
Cheers,
Stephen Rothwell
