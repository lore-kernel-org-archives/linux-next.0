From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm-misc tree
Date: Fri, 3 Jun 2016 11:09:36 +1000
Message-ID: <20160603110936.45553e3a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33783 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750966AbcFCBJj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Jun 2016 21:09:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Sumit Semwal <sumit.semwal@linaro.org>

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/dma-buf/sync_file.c: In function 'sync_file_create':
drivers/dma-buf/sync_file.c:85:53: warning: format '%d' expects argument of type 'int', but argument 6 has type 'u64 {aka long long unsigned int}' [-Wformat=]
  snprintf(sync_file->name, sizeof(sync_file->name), "%s-%s%d-%d",
                                                     ^

Introduced by commit

  76bf0db55439 ("dma-buf/fence: make fence context 64 bit v2")

-- 
Cheers,
Stephen Rothwell
