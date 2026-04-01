Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90BF47CC68
	for <linux-next@vger.kernel.org>; Wed,  1 Apr 2026 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062750; cv=none; b=LnLn/P0Qydb1UIW9fDGBBYmukGa97qizBSih4SSItQVQfz1OIQVaqU6RRlXHhmOnaNlYMzwz/+AhtmHIrG5a+IeknAqTQ0Qyc1pt07k8FU9NyJn5x7B2uKXi0r/13jr0wnOrLZOD9TOyB8ezvlWgvLNxhcYTAj+AkSQG30FE1gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062750; c=relaxed/simple;
	bh=/+O2bH+o0CaeLJe7PaeMIxgBugooYIVOGdzTwOHVmms=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=qkFMUnKuEFsPe5IGoQKc3tX5WjqYlu0EJuzBtdBizTBIdJSnxoMjxEtQMgGRwuSe1c2vwSb8C1sehVbyjAgsadPwHeHeKjC99J8/v4jGGJ/jfHMQBK4svDGt9rAuvkv5aCJI6GGf2FuvS0U3fIZ9oHanw+Ua9MMxTm1wnDQV1oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ySrp/u6G; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ySrp/u6G"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1271195d2a7so92359c88.0
        for <linux-next@vger.kernel.org>; Wed, 01 Apr 2026 09:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1775062748; x=1775667548; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GH0Sx4cJ41/FacXkd5wKU71noTDGEHVM+jaNbc7jFpI=;
        b=ySrp/u6GMIiOwos4CF3Jtu8PfKVAqzI7KCzJwlmbLroENDf2EkxtC0GM3LLi2z9ZBG
         gC7zkITdD5/jl22q5RMtF59Fh5T8FzB572jFcmYGpFyH3x1zHxM3Om/C9gr4BTJ58/Dc
         fACd41RAQ9wRP/7WtCEn0iZj63+PNSj7rfSllFXBjKheAbUppX2Y4dSMFORjQLgaryL7
         +amKhy7rJJTLTEWblrHra2MJd1ki4dczO1KyEGz5kuRvZshyNgaHjVteLVma62oUloq+
         6XHfqVMABhz2yI6Xclxfr5PaSTE1aJqbOZ+pAkg3DfEDBr2B8Spy67gBIu56EG4l/mKM
         zkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062748; x=1775667548;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GH0Sx4cJ41/FacXkd5wKU71noTDGEHVM+jaNbc7jFpI=;
        b=nzOfCg7CnbHHTxQkrqr5/CeetEU5t2LV1U/bLLPoTzpTYHR7HvoV0mZ4IBSN4rGAOz
         X2+mPS9UHS38iEDulawR8K9UM+mBi0xt9rk6UjGQbzo+b3o+3FoOn3Ok0qgwkha1j0c5
         NvuaTyrankzInGy2ZGwqguQ3j6OD4kDjwdXsbfvwn6magW2jh9+QNTfPa7TKn7HTKiKd
         3/eEnq6ayxUcF2E/tKSeIib7HxZaoOgNKZMAKBdDBtdxOJH63hS+Q2DMcYJlA8A9my3I
         8+a0xnCklRGDZmRxCs47G5OJ3FAbuFISyIxvTBrP5/ltJn68/l72AmZ8mMSdv66gaE+o
         DwXA==
X-Forwarded-Encrypted: i=1; AJvYcCVSDjZpDyluAfINR3XGgs5dd4lTBniauJPDwjUIPx/OnmN1ZVrLcJvjPuqpP/ilxsoEPg2s/ptMjWlf@vger.kernel.org
X-Gm-Message-State: AOJu0YwOa67RG0B0r+k6tnbJzj3z78fSILGlNdpYsXKYTF9FIevgHogI
	Zsak0U/o8MOdwWwroi5KNSFFJrANS04VVvSg+zRhVAxEVNC6nTiuo7o0ubfsRoBpo5njhqyNEcp
	Cem+Z
X-Gm-Gg: ATEYQzzjGBWg/OVZJLcyV+Skvoq/IGwfG6qs6KvQylX3j8xKXfA4eNDj6+TecN33JCz
	JVcP4QvjMIpgXFDWTUYOm2R8ypf4McDhMjFVF3AxHGdc3y6aOJn948xgzwxW4sRpryPz7G27g4o
	VM/0KAGcsdi33RCo0iA7w868Ng3tY5ghyxehIViV1LVMH/KoCA2o30Em7F542PgXgdRtVeuUWTa
	L3AmbrG2fJ067D0DQnqn1mofSIbGsnQGz2Zuv4/hzjMojpBa7CdQc5G2zJGVMDQndcGNitmejJC
	x+9lwPe98RAIb0E3WIz8cVrM6FiJYdCSXx80MVXI5SKmLb1J06lpKkPiZNL/S8S4QcdMtwNIK4Y
	NG/6/z2YnXyBdWfrU/YLU59M2uMjYXeazPadjsVclb7QSlvSW/IQj9vk6wjqJhb2Q3HQ7REuUzI
	ejeVUBo6y0eN4wiiZK
X-Received: by 2002:a05:7022:4a3:b0:12a:8176:f3b1 with SMTP id a92af1059eb24-12be63fb96fmr2779039c88.6.1775062747927;
        Wed, 01 Apr 2026 09:59:07 -0700 (PDT)
Received: from 984b78e0ad75 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd70f18sm310806c88.6.2026.04.01.09.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:59:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in
 testcases/fake_sigreturn_bad_magic
 (Makefile:31) [logspec:kbuil...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 01 Apr 2026 16:59:07 -0000
Message-ID: <177506274695.1080.11153738493337774024@984b78e0ad75>





Hello,

New build issue found on next/master:

---
 in testcases/fake_sigreturn_bad_magic (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:5220c2e06a566676f041c198857665ab175b9ef8
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bd0f139e5fc11182777b81cefc3893ea508544ec
- tags: next-20260401

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69cd3871dcae953c056b53ca


#kernelci issue maestro:5220c2e06a566676f041c198857665ab175b9ef8

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
