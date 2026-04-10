Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64761188713
	for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775824638; cv=none; b=mERTvUDwrW6CRw04mrCGONWBnIP1fayCZxMttx0PVLeJTypapSNrcyvkYxAZuIkcY27UXDsyVofRn68RunZxjWPwxUqpD1x2NGzLATU8O9MgxM7rrS3bs/oddcmgIM4Y8oa9t5R5n2DCK3PBfHr5ig1USuFmxDf6YQWtaE2Lfq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775824638; c=relaxed/simple;
	bh=B1v2q1OG8R3QC/7LCYsgcYJHY7L4xRv3rkstdtYf6uA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sy/U/A8BymKiYA3eo84E7ztAgD07dekgED3+DXvuPHQyixeVThpc4A2SZuImKTaNIbDqTUnmftzWUim0uR+Bz0OhOzBrGh39lmm0XX4A8AG/qwUYaeljsTqmYjU9vlNLcAUjBh81/uJu/drpg7k4kOSlIUUzuWfHRWAJVpHy7V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sT8NQUh1; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sT8NQUh1"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so1985014a91.1
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775824637; x=1776429437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObSlHorYoFId3LOZrgQbV492ce1VusgbgOP1QwTrQ4w=;
        b=sT8NQUh1u0rS4lSEnoGk6/8ZlwOVjctywzEen+gCbie7hKrIiBzFFL0cGZyvukFPmT
         8eiPkAjXWkRmPZnQs7b30nj+TPZylBoBH5Or1TS7NVG8V+wS8XE1e/4zeZGUkwP2nEZG
         Hqet4qpA2QCxgAsH0nK2ItEFup15ucxtozqFE14BX6aWcfCsTVK4KbMfwgW8ujbqlDld
         j2pSO6G7cIX3KIdIk5qUOMTHhzgmL2T3W7er5CEzDC4ABDo4C0zCkj4WVqqPl1KbFFFA
         mVF7F0nrGKqlFDBBHGr3VK1XBl8LT58HsyP3DE2SOEe37NljVAbYvT4gqWYYRLN/T3SI
         bE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775824637; x=1776429437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObSlHorYoFId3LOZrgQbV492ce1VusgbgOP1QwTrQ4w=;
        b=DqO4fzOeLEHcE/yBCMs/cfH4OOUoo70/5LEfa1pYcs6fIwYXZxZBxQsbiMy3+TnYc4
         DazjPEX/Jl4no7xknk8Ha3yhWgi1HM52IUwCeSyI3hIKnTMBrj6zzaPrpju+QTOR18DN
         ZrGEO69DTzSZd30L72K50sW2oFufm5ChYpE0SdKXiXFx1ED8rIM7cCWEnlY47N3CVs6J
         TCB1BxqX/KaNNZVIXFSp7HTBqiy592UtAnqzkJKfB226Fv5Z15lJVPMBbQhEVWaMQj0p
         uWzd8J2TG4ezsBKV8U7Mu4nacs1FfQCvkgoWAucnWdmS+4OUbL9zdBETJtY4L8lWucuD
         yQdA==
X-Forwarded-Encrypted: i=1; AJvYcCXb3l4OcGtKTV+pvyoVwfgSvDKYYQQ1pZwsqiVNyFBGxOzYpmjRawQRbHNVzfENNA/O8EbiYjsru8RL@vger.kernel.org
X-Gm-Message-State: AOJu0YxlAkGArlKIcbyKm1vDlc1uzNprsESbyLG38jEgGegTCfGnHnuh
	Vsbw+VCH2ysUzqIxBqzCNpuFuHZee118v0WO7KYcerI5qogWyyi0QQ/zY+5lnXKdsLA=
X-Gm-Gg: AeBDievIkd9hqnlaT0KfED7+3f97IGXXplLtkBVnKKRFhsuTCf7IEgyf9fy/qyHLp/e
	E3rVYP3809UNSpCogZNxUVfzeWibXZClbrze4r9wD+7o95A1K5ccIMJ7OOjDDRPf0+waeFaMhDk
	hRpa+gl+zEuFJVg7K4voSLdHurRYCiCGrbj+hYfnGXksZElnYP2JqYeIFmn/OCy6bjyvkSokK0P
	iciutTDS0iXNlgMui2v+3ZoBjeTFLH2sIol+cWl7tNyp2YXYA5s0sxUcicGBgeSHUwIHBguQgZc
	nSy/vq3pjMJw4ETyj/iqt6tOJRKcuftpPCtW/n/tga/Kw3eGK18FS5c3J9l7EeMcGZh3Ej+8eFO
	Knz+cXIxgCXiZT+MDpZ89mjfrsHQK3tgNFIoMWprQAWHy1O6evpLfa/eR0jQYuuFk/EVgYM0hZe
	nDD5w5Ukzh4quotDoP1Wpny0rT0nQ9jCa2+hcnjt7hFDmw
X-Received: by 2002:a17:90b:2ccb:b0:35d:a9bb:1e33 with SMTP id 98e67ed59e1d1-35e427afe02mr3338087a91.11.1775824636700;
        Fri, 10 Apr 2026 05:37:16 -0700 (PDT)
Received: from nagraj.tail8a2ac.ts.net ([2406:7400:98:af5f:a6a2:e126:5ae3:4132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e35155829sm6780138a91.13.2026.04.10.05.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 05:37:16 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: christian.koenig@amd.com
Cc: leon@kernel.org,
	broonie@kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH] dma-buf: fix htmldocs error for dma_buf_attach_revocable
Date: Fri, 10 Apr 2026 18:07:03 +0530
Message-ID: <20260410123703.937822-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linux-next testing showed this htmldoc error due to a missing extra
line in the comments; add it.

Fixes: be6d4c9e9d714 ("dma-buf: Add dma_buf_attach_revocable()")
Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a202a308c079..532c3f14bf9d 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1353,6 +1353,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_attach_revocable, "DMA_BUF");
  * Upon return importers may continue to access the DMA-buf memory. The caller
  * must do two additional waits to ensure that the memory is no longer being
  * accessed:
+ *
  *  1) Until dma_resv_wait_timeout() retires fences the importer is allowed to
  *     fully access the memory.
  *  2) Until the importer calls unmap it is allowed to speculatively
-- 
2.51.1

