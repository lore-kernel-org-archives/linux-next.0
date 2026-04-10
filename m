Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF2F3E1CFA
	for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775840348; cv=none; b=ZycgIbRTUr+Dy8qyhZdQtiGBCs43yG1ndljgFneh1U1mlaoD+JKHe1/uahtID/GL6HWFbBhfeTr1nGNQHVQmI5uzSw+a9VJ8SoHDnC0jGK6e+ptHhakB6ZQ1rtHpt+9yqfKLBvRZIu6i/r41vNz/YLWfasu/MupcN8ceSpq5p68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775840348; c=relaxed/simple;
	bh=4fbWoUbN8ckCjQUSnSVhOHa9/jERtl+y/lKJTGDoBOI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=P0mn7djx0V8KvdUtO/w7KV9BJ04DISQ6A3IB3TiTqN/vep+++uTPIHqNbzxykxqycJai7CtmMYKHMwJPtgEWhEiBqnHN5acDcoGCgVvx/Jgh4OKAEfo1epF/4M3/RM1JEYjgiyBXeYFqM+2kdoGoffESE1sErdNEfoqYq8q1+l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=xBS6IEke; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="xBS6IEke"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so1956090eec.1
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775840345; x=1776445145; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI22AvQsygsRapOWu003btiGsXEMdheCp8cdpnvmm/o=;
        b=xBS6IEkeYWLR+nqSk0wY2iVqkjeIVkTRQl7RBvBcRCpnFiQmS1SZuuRdK2Yjqa0gi7
         88PbU7lz5BmMrDy375YOHno4Q6/Zf1nzztVDrfiUIla+6N4puPRpJqjmPnlQStw78k5m
         nhQ9MIFXoaspYKfwN54RImWjzIFYdNd3i9fqJP+FtFnlHSaXGpi/tVTtHlj+LmxKMe71
         L9o3voQOmzcPN4+niTiYyVF72H91MPhVNFGM369CE+CXxU6TzeqmYRCiqs76/ryqOxb3
         qy47ta98kkE5IRFueMKt99fNFmwLqCGmi3y0oIyQLyfdkJJk8cF2cUczJoqyHQq2ZIKI
         Unwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775840345; x=1776445145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CI22AvQsygsRapOWu003btiGsXEMdheCp8cdpnvmm/o=;
        b=YDcEiDmBrB9VFFf7aAd6d3URUB3YMS3wPLA7hb7ZsaD9cVmHZn1fwR8vfRkPbwp68X
         DnBoCvN4kaI2xUKqKzIDQtxHxfEUPRrRcYNIPn+H/OSWA/23h2nRxUK5XyQMBL/B8P8Y
         5ZSDWWfH8Hq8Z4lp+Xhz2TjPik765QOELal1JeVvqshele5ic3XyWLpr5W9/PQhHupzI
         wbz3SWnfMQD5afSos+z9VXFuutPez5XyPigliPHWRzrl66vAsz77Ra3Ne8b/dTztXEhP
         8oJtAfKjRKI/mP6ArMSQkuTDLBk0MO2RBM2XqZnwgUv+o7+3K4SP/VsBOvO8OoPto74Y
         pOIw==
X-Forwarded-Encrypted: i=1; AJvYcCVNH1qBfRVaP9blxLyf6dZKsIcfy1fLGk5soOFfA3nB892/fzJueYDNtT7qtSA2QDi0xUyNZdLlOVvk@vger.kernel.org
X-Gm-Message-State: AOJu0YyjNaQUAfUM/cBpMO6CIVwDxcfJ7CDWtaOPlxDjW3Qt3f/wSwus
	K1qRem2flu9AdMNVQzfq6SgRixTebqnl5wWF8n1z8y6RoZW1BX0Y8VMMzbgnK81clKY=
X-Gm-Gg: AeBDievctNqO2SzziBK8j3YgMDZvFpoWcdq5rR0xBeyir48yqYD930PPflvw6LkT6RC
	K0IW3MF/sUoTc5nENvpgu3HaHFhtSD+skgV39E14/Wq1XAOiPnSxV5s/2/TmJyuXC2JEtXia4Rr
	QJeYAUwGrtX4QEWs12ArS89a6Rly62AyPyWiItrscG3NQ9K9T1H1UJS8GvX+cyAyoPkK3FQ5IRE
	lzD1CXbRXVvaXrVQEnvHg5SyPkytgva2eyvcACE7wMHJJn1hsOn4cm+e5v6huS+6fG/PU11UXoL
	eAfZfpJfsu+2HbWPpPPpWdl6qVWLs9M0Dm5z5jkgI0LmdjnqiRYWRfypxrjxaO8SYTcmgDBG1c1
	Ms7XoI8IeyoXWY2e6eENH2Z3+ccqrVqz/xNkm+quzeyzrbH9w2MoTSQMScE5sah4dh5YvFkQLx3
	ItBB/2mquzJ+6wVp9V
X-Received: by 2002:a05:7300:d183:b0:2d6:526c:55cc with SMTP id 5a478bee46e88-2d6526c5736mr859599eec.6.1775840345053;
        Fri, 10 Apr 2026 09:59:05 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ff826dcsm4891573eec.13.2026.04.10.09.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 09:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in
 testcases/fake_sigreturn_sme_change_vl
 (Makefile:31) [logspec:k...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 10 Apr 2026 16:59:03 -0000
Message-ID: <177584034337.3832.10513430880731960501@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 in testcases/fake_sigreturn_sme_change_vl (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:78b76dc6acfd18845f6fc483e154076f27665ae6
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  66672af7a095d89f082c5327f3b15bc2f93d558e
- tags: next-20260410

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d9119886a2e63970e94ab7


#kernelci issue maestro:78b76dc6acfd18845f6fc483e154076f27665ae6

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
