Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D632265192
	for <linux-next@vger.kernel.org>; Mon, 18 May 2026 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112748; cv=none; b=Ty8cmzBpt2oPGUc/tYBmU/ZKuP5ML6KRXVenE7dKb6lkVOXV+nVTN2M8viasyHgSWzd5blc7RrmS7LVSsYHftqrk3kH7aOgmg3cSf2ojXb+F71PDf3MsbvN8dtjUM6gp6pOhOsKk703eni7XJ/Z6CLFpC4XCpJYZzfwQ185i60s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112748; c=relaxed/simple;
	bh=byBSY8/p4MUqq7nTg4fDT/uexWJQLmz/HqHZ0zlkuWw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=e9q2ceimK8MXask1NLmEqxOOC1FDwJuTdXiONPGgQOjyn/Z7yx3x9Pu6eDWETkBDwztIEfid/9kgBWVPb8SGRfjh/mGaMK/kTOKk374Izjs/fSkGkQa7UX9MZ3KixlUIb+NmvHfI3bbSfya4N5R7WqhknPD4/ID5YY2JnmgM3KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Myv0fr7/; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Myv0fr7/"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-303f2fb7225so221677eec.1
        for <linux-next@vger.kernel.org>; Mon, 18 May 2026 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779112745; x=1779717545; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLihxZ3CAf0WAx03zk131v5nnNf6cERDVla+NTBzN5g=;
        b=Myv0fr7/MOn+97kJwiEXRuSDUaFTSY4WmtCWD+bwh+kxoXdOk1HAn5xd0oRSayzDEa
         LONEh5h/5f+1GKwa0U5eJwtOtjkn+o6PJ8Mt3Rsk9U9Pm8VMfo9BMZVgrcUZx4Ev+Koq
         UPTRsPazFLaZlcigu8Jwimf0hE3uPRJ37i8xmFGcEBE6kKajzE7XkjZAujWPrkKnz2TN
         XcRB3D/WTNTNyVMK80Y/1A2owewRHUmty7FMd7JwCEovh5d5VOaGuGHJtcouWgyHfKTX
         im7Wh9/xiM5Pef85u/ZGZpYQb2zr/Y1yliteb0GtV26S+Zvhd8sIXGN3eZnVR2cghKp/
         eHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112745; x=1779717545;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CLihxZ3CAf0WAx03zk131v5nnNf6cERDVla+NTBzN5g=;
        b=cmlYMSJVa435feLhEqp87REfCRCy9zH3MxWh+bzEfHPPaTNJL5CfHysc32xECKD/B6
         AkvoNTFVldY1MACwrKfBM+0KVWhTG9jaPuJ+NPaFjaOQgEMQw+Mjby+juWK4zAJ4JnyC
         +eNzqwYP/PqYnQqi39LL6poUSIqdxxiCcNxwiR1quPQIxpuYmcdHzRCfvzqojrmh9Utb
         XUeCHle3loOUUChizBx0G1NQ66L65G0yvSpqf/8fW/kuGmsVi4VhH1K+lk2cGe1MZ0mD
         UZUfqXvHUhI+JyKpr4PhD54bWBWEXoLgEM/HsVMTnN3sd63Jd1wk3Hy9fnoYH7qunZnu
         4N7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/WkO4EgdQYo/KDqec8lvOW87BjkHYuRK6Ovzuvl0WQ5pCbC6obrHOFd7+tDYpetxq/ynUm7/JzWY9i@vger.kernel.org
X-Gm-Message-State: AOJu0YxFl8mYp/Q1lFGhZw4f0nRkTdOamrJct+b5KDSwc2ZB7uPZczEd
	Tk4WYGFOP7WndUhG9WdKGCZPtI8cqvwf1cfYv2NrMhHaxJJYNx/It+xJWs+9dJUYRxs=
X-Gm-Gg: Acq92OF/rme+a/s4I2wrFZeHjbfDPL/dqIuB2YSkX2Lheces+Wre72H5PgBJsZtUIjH
	ksE+2ndeYSe/r+Q2ODAn/2lk4vCR6kO/HOESYPcBxdW7OPFmECD8x3NHVGasnZ8Ewr1dnW9PM4f
	OhkhGqS4WMXZM1xX0MTpgjKODs1BwsoSCMgSqLk+wUkWgJeLgXYFqF1kYGZLi2CeUVOldt974gR
	DbS3U2rTGo22Pi40BxUatg49f6GaYJMaTk9bUsM/D0ARsSAwlrnTgmvJBqkVXYOwcgCeFvw79e8
	HDPp2Dlu2t2Ukd8iv9DUfeh691VVRwe/wIB5vxnnQzrN7bIlWt+P1LQlrkUxDQFPHQaJLEECNEd
	sSBPeJn81CyxHkVC/UwOTUKA5HoOw67tpTI0ElUn1e2AG2Ke0BwyX1J4ATST2qyENirei1Ho8jQ
	jN6TOyE3ro3i35A3iuC4BiF71DaTQ=
X-Received: by 2002:a05:7301:198e:b0:2dd:144b:6c2 with SMTP id 5a478bee46e88-303986a03b9mr5812003eec.27.1779112744876;
        Mon, 18 May 2026 06:59:04 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc458sm16517523eec.18.2026.05.18.06.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/pending-fixes: (build) call to undeclared function
 '__huge_pmd_unshare'; ISO C99 and late...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 18 May 2026 13:59:04 -0000
Message-ID: <177911274362.2366.9336793608219101169@330cfa3079ca>





Hello,

New build issue found on next/pending-fixes:

---
 call to undeclared function '__huge_pmd_unshare'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration] in mm/hugetlb.o (mm/hugetlb.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:2586999164f3c8a7d01dd3db2d8850a7c0865475
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  298cc5aa5aae60cc009e3cd66ff730bb53e3e1ad


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/mm/hugetlb.c:7281:3: error: call to undeclared function '__huge_pmd_unshare'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
 7281 |                 __huge_pmd_unshare(&tlb, vma, address, ptep, take_locks);
      |                 ^
/tmp/kci/linux/mm/hugetlb.c:7281:3: note: did you mean 'huge_pmd_unshare'?
/tmp/kci/linux/mm/hugetlb.c:6973:5: note: 'huge_pmd_unshare' declared here
 6973 | int huge_pmd_unshare(struct mmu_gather *tlb, struct vm_area_struct *vma,
      |     ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## defconfig+CONFIG_ARM64_64K_PAGES=y on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a0b05bad06a47b7c8f81a2c


#kernelci issue maestro:2586999164f3c8a7d01dd3db2d8850a7c0865475

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
