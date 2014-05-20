From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: linux-next: build failure after merge of the dma-buf tree
Date: Tue, 20 May 2014 10:26:44 +0200
Message-ID: <537B11C4.2010406@canonical.com>
References: <20140520171351.736fb238@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:39788 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750819AbaETI1D (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 May 2014 04:27:03 -0400
In-Reply-To: <20140520171351.736fb238@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sumit Semwal <sumit.semwal@linaro.org>, Thierry Reding <treding@nvidia.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hey,

op 20-05-14 09:13, Stephen Rothwell schreef:
> Hi Sumit,
>
> After merging the dma-buf tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/tegra/gem.c: In function 'tegra_gem_prime_export':
> drivers/gpu/drm/tegra/gem.c:423:15: error: macro "dma_buf_export" requires 5 arguments, but only 4 given
> drivers/gpu/drm/tegra/gem.c:422:9: error: 'dma_buf_export' undeclared (first use in this function)
>
> Caused by commit 8dfb1f0f8103 ("dma-buf: use reservation objects").
> Grep is your friend ...
>
> I have use the dma-buf tree from next-20140519 for today.

sumits can you amend the commit?
---

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index bcf9895cef9f..1e9de41a14ea 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -419,7 +419,7 @@ struct dma_buf *tegra_gem_prime_export(struct drm_device *drm,
  				       int flags)
  {
  	return dma_buf_export(gem, &tegra_gem_prime_dmabuf_ops, gem->size,
-			      flags);
+			      flags, NULL);
  }
  
  struct drm_gem_object *tegra_gem_prime_import(struct drm_device *drm,
