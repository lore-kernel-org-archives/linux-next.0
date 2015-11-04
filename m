From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Wed, 4 Nov 2015 20:22:26 +1100
Message-ID: <20151104202226.28468a03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57143 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751403AbbKDJWb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Nov 2015 04:22:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>

Hi Dave,

After merging the drm tree, today's linux-next build (s390 allmodconfig)
failed like this:

drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c:143:2: error: implicit declaration of function 'dma_to_phys' [-Werror=implicit-function-declaration]

Caused by commit

  69c4938249fb ("drm/nouveau/instmem/gk20a: use direct CPU access")

Discovered after the release.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
