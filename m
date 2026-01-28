Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA791352C2D
	for <linux-next@vger.kernel.org>; Wed, 28 Jan 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605149; cv=none; b=ZzgxuaUdW73nj+MT/U0DheoQr6DL2DBLQqeeRUn94tlpVRNn9XxhzGgd7ubMVrzjm+pKH54JH2TSDY9Gqk1vxsx86e5ONRyZ2i6G8/ma8feN7mMRb8U7t636pJPTEBFc+skNvmFBFv+l11a7DSUOc+/TPf9NtWSBlOdLaFXxOyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605149; c=relaxed/simple;
	bh=UlfO564AJzfBgWIhPixEpTnDJDJdI+parV/CzPYapSI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=rZvBzu/wIy910iw3onZcxjO5olERSK1puXMKN76pIrGWE3kCy9M8LStz6ulmloAGT9nS+ajseSMJfyGoHK7oDru3ZbmTbJaQSu/bbpcsnp2VG3bYz27IiXBziXXQra3GSDJoXwjBX5T+XQnEGrfeDSIBtzyaBq3Q2h8PGeCcqz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YIzPszPO; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YIzPszPO"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2b6b0500e06so9291280eec.1
        for <linux-next@vger.kernel.org>; Wed, 28 Jan 2026 04:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769605144; x=1770209944; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KkJh3RLDDj6h93IXIjyNerYTMuZsf1CSiGRf5IbgaQ=;
        b=YIzPszPOJQIPi4PnL/S+NLWHxPA28XFqEQEgn0JkUehg+sMqWrPIDhtQ5jo3u4mPTa
         vTq2R1zP7m1UEtzc4H73kMOaapsONdVksgDyEuKTmuT6brs8ovhe1GBMGS1fSy5AdCSX
         pRyhVB1qWutIyCBHSi7FXNJxzelDon7sQdZ7B3cVEpur910yS+uI7Obva8KQrdeja7KY
         9HhcbxxFLSljOTcdhfCo2lmv6ODftCY7M5LwQtl1Tj9FanPGjb0Ya/ZOXrrnqYGz4TUJ
         LZ2uA3WgrFIaTOMEeJgOl6z/7n58UXT8SapBtuWFuCBMoTtY78zFGIKs13pp2rU/p/wY
         hM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605144; x=1770209944;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+KkJh3RLDDj6h93IXIjyNerYTMuZsf1CSiGRf5IbgaQ=;
        b=Yxz7jurOu/NKJv28eynm03TaeipssRfIPN0T1VJGYMGNGUoDHln5KEecsLjPb6MpZJ
         RrpZqcv6timlLwZ49KpYEnkXUzNY4zQ7Sz63avDIgGyuvPK3rhJ415OVoMT+IXpVrNgL
         gVK8bLPS78OlcJFsuQQuiWwhtwfypS6MmLTOstSTxC3csUoRW7GwEfM8F9wv2ByK3sMF
         2Fjcms/55vuGbpg/e96CqdJqpyTlM1l8cc1PiwdfBjUy1WbSoCFV58caDPl8mWT/cuAI
         vPgd6iHNZVYOIEVmXkwnRrT6jbOxEg5RH9AgPizHUxqWz1BFoK7hyDXoS5jxoWAnJy7S
         cywA==
X-Forwarded-Encrypted: i=1; AJvYcCVZxz9SPPNhMsT0VBwm+OqPN7zuuN7l8dOs2QQaKVGCJ7p/qUpZ02YemMUwkr2jqOvE7EC0enIb/Kf8@vger.kernel.org
X-Gm-Message-State: AOJu0YziZTvP9bNFq3RsGB7dHVSpyT0DRPVlq4a4Cee3xoRBSC3dOUq0
	/gBlZHU3V9vmYi9ZdWOfrVsOHc+Q8SGDNuc1kZ+nPjWzzecUkwGdja1Ptr8NGOLfQGQ=
X-Gm-Gg: AZuq6aLgyLZmOgzvmZ3D1jp+HBFAl+rO9mLXPUNx++ztJCWPgQimlIqGHMY6W+F8KUw
	9V238Ea1b6Ebe7cEVpGHBHPW8IWn73UzEDNBAauFtO6etGcU/3OBrm/sCu2cEKynTA1VTLGBZBW
	e1qvBnjjQZ2tzQjK8T6zYNdN1fCdxnVvBrqAo9TV6sSUajgBnvabZwwULnbZmGlS+Zf0nx1G3GL
	L5tqkPV/8s6A/L1qRz8xYiJnGwnQ411IX2PxwRFNj7gf9ZYJalCtGsGMOVPNhVTA5MOdkFNAsnQ
	gu+6sCm3LmBAt4uyLVMyv5V7kG1XuqyLuHb6slNItr5ZjGq0xcQilaUw41WcBTG6F74W+M306MV
	Ig2FnpV6zR5UicKlxHd/u3p+T/i802ZNvRxbFg/HAsqAylCM4FfMJaRUkK051SoBX3bJnuBKSlL
	gPsiYL
X-Received: by 2002:a05:7301:1698:b0:2b7:1744:726f with SMTP id 5a478bee46e88-2b78d8a6127mr3104705eec.2.1769605144086;
        Wed, 28 Jan 2026 04:59:04 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef3b3sm2450516eec.12.2026.01.28.04.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/pending-fixes: (build) ./include/linux/cma.h:63:13:
 error:
 unused function 'cma_skip_dt_d...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 28 Jan 2026 12:59:03 -0000
Message-ID: <176960514308.3654.5873473738719715010@22d5995788c3>





Hello,

New build issue found on next/pending-fixes:

---
 ./include/linux/cma.h:63:13: error: unused function 'cma_skip_dt_default_reserved_mem' [-Werror,-Wunused-function] in mm/mm_init.o (mm/mm_init.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:0a972087c7b2bf11675332fb10ac48c0afa797a4
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  0fd19300e770b50ad9fc43026f5e148e185ddae1


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
In file included from mm/mm_init.c:29:
./include/linux/cma.h:63:13: error: unused function 'cma_skip_dt_default_reserved_mem' [-Werror,-Wunused-function]
   63 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-x86-6979faff1908a6300d9b70b2/.config
- dashboard: https://d.kernelci.org/build/maestro:6979faff1908a6300d9b70b2


#kernelci issue maestro:0a972087c7b2bf11675332fb10ac48c0afa797a4

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
