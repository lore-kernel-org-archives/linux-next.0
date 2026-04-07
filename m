Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD341377566
	for <linux-next@vger.kernel.org>; Tue,  7 Apr 2026 19:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591949; cv=none; b=oWbSDUvJ4Kj/FwrbJ4Y3JKozj2OerHfvEP58J3nnSfNlqaY/ZIyZUIfj1BEyCkJH2QbBiq6jMzVwWiqAA28+g66FSt90i6smRx8m24gkXv2eE9Su83z3wd+RTPCUPd8gWNirvwR66sDTiCNPG2zSXTvBzhD1sLHM+4P884rEsvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591949; c=relaxed/simple;
	bh=S1tM7xxkwMcLDeM+v5C4JaBV9zHjD4x0m0RPTYT2ZQM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=TfuO/dvNLGqFdHP0mdZRHnBPO79DM0YTMKfPbiy+PjkldsjWvxQwbeIXwX7f2fKDSiz3Rcq0f0YO6z2d+q0zmDl5LZQTC9fF7+L87sFCra3XmF22vRnf6VbQBIoTogU3b9C3rF2K90RC0/sfBvfLOhXNSXyz66a/BbrwUphv/Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=PWBo9wdj; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="PWBo9wdj"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c0b72dac7so3129876c88.0
        for <linux-next@vger.kernel.org>; Tue, 07 Apr 2026 12:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775591947; x=1776196747; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUQmqyYQE+hXgJyhVywm3Cr2ZTnXA9Aogk5fIhY1BOo=;
        b=PWBo9wdjLMxHQlqYvDpTeUSlRIh4gfPQ7vyYRIAhzkcgPUP/7JqLnORoxYHo4aZ7aX
         bK6v7HO/7GmX6r2oPn8L/jsAJsw2vgJWVt6O2lppIP+WJsqzLXB4ZqQSSvZ0XWPRjh67
         DRyl3g56UodCMkb5MJ45yHxonXJfI3TXBOyF8rsnjrF0aMzYQgcEEtDvZLCHrygeejN8
         364CWvPVLQ6ZDFNvZapn6U1AYzMB3WgNqlNQn5TNjrlXbI+d6d1KMWYdYlSMNXhB/uXP
         o+Ee3B0tw/3q1wxbDazVmz4fIin+7ZaBhWIkymPgupAPMzc1vWhUQ4OBQY53HdQKnlIE
         8hsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775591947; x=1776196747;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUQmqyYQE+hXgJyhVywm3Cr2ZTnXA9Aogk5fIhY1BOo=;
        b=Vv/TDPzOII7DljYqTaSSpTBYiOfOBcdCUjlx2wA2yRtOGj+gcBddgKkq3P1U0YCwsk
         ysmLOdUALOlXoS8skezkaPkaMEfTqSFTH1s/nV0j/3aMg6xTizCb7LRtnt+aDuNppXM5
         F5QlomVLzZJh2eFqhh4ZafFzSeNISuayj7raX8WSfZ5WYFUbpIL4t6Lw129uZF4C9h5s
         tIP/EeRl6lu33PClT9u2RwNTL76khWdUPV1WSeP4H65wOgfi0rXKmGiY+QtSfpk0p+sL
         NVaF0CX+ok9oqKP+h8c7aeTs2wnDMhaIAin1qitGcZuPo1IvZq+lVvLGfCHi/9LRtrBG
         tFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZv3sdmBfwlCGMUeMQLVnKvFUzpHWQq95c57gR7HPZjivLfHvh1oeBKVucSk4Pa138/ejoRVYD10bR@vger.kernel.org
X-Gm-Message-State: AOJu0YyB4mqX6cFu/Qa/pmACdRhB09UFtdpiY8upE9lMA4Pz2QIuQmvs
	Ijh83qipMKxM/2JTNBP0rhWUYB7Y7fIYtMqiOZGMiHW2mrROSEsBBh4Z/kwRj/Tx/xU=
X-Gm-Gg: AeBDieudywRFisDOAo+K0Z7GUNQrflEBkeBr1o/l3pLZO1Qn74Rp3XtswF5v6mi/sqA
	3rieVaZzquYbhc37rdgWXuT0DTzjs5U/tUxQLbus4e0GyT0gdwlladM8MpKFNTXFs3gmqwwKgIR
	Ar/oWeLimhgMKNe3WIe7huFO9glLvnGuUbhX87L8HcAlKQ5/qIZ9SdLGmilRGom4NrhXgMJELu+
	1n7lJ2Ik+RGsf6b+z4KyRLfvgRR1s5yUF5oaMsbK/PlrqfxVr9mwgJWqykLjNQSSRd7P/HCytPc
	9vn/CBV84JnesokRrvdcdXGuW/o/ecOQPVrz8mDLfqRA+lotw+skYWbGJBhfNdJPGHzUfQIGdk1
	B8h0ZYCDoCjyF8cbhDqGEO2Y8rEAQcK/eyxGmw03/uk1BuDNt2H5/98moY5rhGF3OSFJfariLMW
	UIRNqG9A0dSE2MnOGz
X-Received: by 2002:a05:7022:48c:b0:128:d084:e921 with SMTP id a92af1059eb24-12bfb70dd27mr9063418c88.14.1775591946954;
        Tue, 07 Apr 2026 12:59:06 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c05a7beffsm10288281c88.15.2026.04.07.12.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 12:59:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in testcases/gcs_prot_none_fault
 (Makefile:31) [logspec:kbuild,kbu...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 07 Apr 2026 19:59:06 -0000
Message-ID: <177559194572.2512.15758446934555092532@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 in testcases/gcs_prot_none_fault (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:92d05402b9a3c69737356c89fcc9f803eb4cb3ad
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  f3e6330d7fe42b204af05a2dbc68b379e0ad179e
- tags: next-20260407

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d51d79dcae953c056f965f


#kernelci issue maestro:92d05402b9a3c69737356c89fcc9f803eb4cb3ad

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
