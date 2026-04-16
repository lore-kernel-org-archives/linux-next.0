Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24044237180
	for <linux-next@vger.kernel.org>; Thu, 16 Apr 2026 14:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776351547; cv=none; b=YH48In5d5Rj3Wo3/om4Kwmg4ugQEKdSMQXqQZ4qaaeu3GkbgvnJRYoMpK7uMEaZQNhSJcFDLS1pdhMqy2XG0ERvNdDByTw3wSLApOdEFv3Y5pEKq9FdHtd2gBOWshYTvQEIHdUzqZ0yoCQb+Tlv4hwx7SkxuLMh4wLMssta81Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776351547; c=relaxed/simple;
	bh=nEZcCTbMV54noQ7HylpoVGyqeEZCV1ATyFsiiMR67aI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ifAnKjSky185zcSdkCCZUfna8BgZH4iTrRiBRQlZ5pPAhC08vDPYFLWpj2fngmUUs4DOjmIqxJ2WRq4omMl/H33aist7iqqqFAJXgJG2yITjdda/JHE2odD26NsuYkRQfpnMGCI9ZUf2a6+aoLvhQQjLp3xsLCXtZadUycGG5rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=ESpE0ETz; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="ESpE0ETz"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c565476d7so3398489c88.1
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2026 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776351545; x=1776956345; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V384+pK9nOIGW9ZWI05sugBChJBTGGbB1XgQN6V/XAw=;
        b=ESpE0ETz3qbMtDpGxcLg2H6BD/ciGsgl1RasZNRbwvGZ01WCCmJcQjGjDLHGcz1JoJ
         sXbdeVC7MQYngerdXzmQgDgrEsMg3p9H+sVTDEQP2BdS7t6v2ZN9GJT8NCcBDql9oxSk
         ELQUnw6EmUtSVqIRWUZjjqUAQMDK/haZwhSmes6YFyy2t3cagS1qikE/Pv3gzeSYcFXp
         dBXlwXIdYc9nE/mewr0tekd406yWWTMUcPRHU8FOBcIqTnsW2JKulLrCxRLT/GWzY59C
         mPaB8kyOVn0AKSzlZvpaMypHr4r3y/hwqEWbk+MvWy5NYbVNJVEmynWaQO/5J5wREVVN
         EoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776351545; x=1776956345;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V384+pK9nOIGW9ZWI05sugBChJBTGGbB1XgQN6V/XAw=;
        b=qZ7ebNDKY39Ih8ZIX2dgm8P1cz4vuyblstCcWfaCW4qqF84hyYjev45IAb/uV/fwgW
         zCVK/DyIAFiKoMDUtuGJfSIO9Tj1hJ5CaCDfU8bYWjJemrdMA4nMV/vo5mznE0DAxtM5
         eG7y6bfJ8r2Kc6lhzKFUS25nXimWTfBAzzWeqvpo+Aut8T4qAs1TxmDfsXozayPDyl9F
         71BDmmqLpV4nXPYeqjq9HC3ERZmwZ6v/ZT/uW5My/AVDx0+p3Prxzs4NXvBWj/vnyoHT
         O0MYZGJMIsj/a6hDU5B/jCorc6xIYgRp2ta79uIcFpKTpikAtMpxIE24Mh1xzbvUyy//
         b6wQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WUNnAe9CMnTmQmVmzyFc2SyELVbaKXzt9zGrPYDIsl3bIAQTHkN5WzOYUuS3gaEytClaQ6HwzUyLf@vger.kernel.org
X-Gm-Message-State: AOJu0YwAxuMidb/no+1XC4sst29HiuAAOFhcqnhrH/1Lje3fujPumD1O
	iDJeEcxKGunHMDMcC75qiK/IVfroslqYY+7ZK5sf0DKcd+liCn5PWCWhEuzJn3HmpxM=
X-Gm-Gg: AeBDievm+HWaf2SCi9tOdyWhQp2LE2aQUDRMCQxGsF+rLqQUDeTKw2ip4Bh7sIIQmVa
	Dxp8nXLYiEdTztQ0HUoivY419VLBKnpq/tvmFyQcIu1cxc7iSF+sJypwp0CPSaFGa1/fF/gtKbO
	mjm6FJugf9vYZvH/3h1M0pNpGr9kF5+hFqn/PCoyUd+6WVcWWSXB6SYvP0CMeedWjdhJEfMim94
	TJcuoyZLKy5VcMkDV6stMuMB9bG11FXMwRWL2psMj4EzBtiIhGkceTbBT0QaI94C7ZfPmTpvdtO
	QpjyB2PR0HeM23rCmKnDs8XopnNyvwAthyIcUEnRkqMSoCvp3FWyhg5ocQkdkz47z7LfIvKOmQP
	w3jqfZ/B/iMJwiUgiy/qRKCrKNcPayYD7VLUT3BuxoWft7Kto01z2mXGExNnrn3lPsTugPq5Cqa
	+RciP9d8uiCkNgL0GddsOUace0nFw=
X-Received: by 2002:a05:701b:2219:b0:12c:6da8:8570 with SMTP id a92af1059eb24-12c6da88750mr586006c88.2.1776351545082;
        Thu, 16 Apr 2026 07:59:05 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8fa5efb6sm7926116eec.28.2026.04.16.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) "byte_rev_table"
 [lib/zlib_deflate/zlib_deflate.ko] undefined! "by...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 16 Apr 2026 14:59:04 -0000
Message-ID: <177635154368.6552.7060101263009785041@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 "byte_rev_table" [lib/zlib_deflate/zlib_deflate.ko] undefined! "byte_rev_table" [drivers/net/ethernet/spacemit/k1_emac.ko] undefined! "byte_rev_table" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined! in Module.symvers (/tmp/kci/linux/scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
---

- dashboard: https://d.kernelci.org/i/maestro:48f931aecdceb03cad626bb809f8965302b7fc91
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  452c3b1ea875276105ac90ba474f72b4cd9b77a2
- tags: next-20260416

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
ERROR: modpost: "byte_rev_table" [lib/zlib_deflate/zlib_deflate.ko] undefined!
ERROR: modpost: "byte_rev_table" [drivers/net/ethernet/spacemit/k1_emac.ko] undefined!
ERROR: modpost: "byte_rev_table" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!

=====================================================


# Builds where the incident occurred:

## defconfig on (riscv):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69e0eea19b5a968309e4e915


#kernelci issue maestro:48f931aecdceb03cad626bb809f8965302b7fc91

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
