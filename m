Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B93A92E
	for <linux-next@vger.kernel.org>; Sun, 25 Jan 2026 02:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769308247; cv=none; b=ljP8HrcConucsn6xdVvVKdeJjaIDFEwF4BacAWieQ08uiQqs0OBS3nCDTWkeM3YDxIp7Bl7J5z7PK+IUOWgBip/tb1wluPYr8Y9Ft2AqIQYTqLwqKZnc0qo8PHLF2J9NP1klvyzYyQFoXWDjjIH84szK0tjIE7Mqsvj+DMeoaLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769308247; c=relaxed/simple;
	bh=feSefyAEIz0A+KB+JB3V40+MFYdXSKXLvaHDvUMByBk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=tEnJJVef3uzgdLaUchpwSZBnCQN2nl/lAdIrfa26DiHuEL/pQon+1o2s2mKeQiwvRLwN8sHbF48RjZo4Q4PCQsdDycYZDdWoMqNTEvlNYnp/FjVfhTaLG+d/oB9sj4/QVO00AA6BHi7hjDRaWaS6X5s0gNvR/uU1q+UmefaiN8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=e/wJNwHK; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="e/wJNwHK"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2b720e4dcb4so3364271eec.0
        for <linux-next@vger.kernel.org>; Sat, 24 Jan 2026 18:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769308245; x=1769913045; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HocXw8L31zfMca0uKu8WCx5a/jgCnKwwzl4D73o8TRA=;
        b=e/wJNwHKOeC8SEg910QvT+4kQslDfma1DC740JI/pUweqNoQvay6gOAsIDo1PqHjNA
         GRHbj8sfzHic7EwT0ZI4DjJjeURvIJgi/q0ILpF6AA5+jVs4yZpM2tZM1C7hwpaZA9Zy
         BegQvI6/KWRjcg8kTRbroPlQlravjoYSDCiWk1YAIZVLUvfNPcpuhClGYctvMacMRDRy
         a3O/miAJfCNIDo/2B5hohrj3XhMLNF37FwozOLhyuKczcpfnvQiSo/0+Zyluzg63RR5c
         y9HMQlcozDWyUYpX7LpDzZY/YNolHajEw17iO1rVblg0nVKBTJiOwK1lQbKKb6S2dJTG
         WSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769308245; x=1769913045;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HocXw8L31zfMca0uKu8WCx5a/jgCnKwwzl4D73o8TRA=;
        b=otp+0QE/koznQEdIaOMyoI6TIYHBvcfUUSm82dce5EODF/9z8fS/8pYgDMeS3ZWJer
         YciiiZUyOqvxekdsMKQQ8HTIHmLOdsozvMKLq6MHf0Niar6Kfcq1bVqepe/Xjc3MzJJD
         5sIkVr2ELYS4XM5Bl6RyFI1JB9bG9qti8xPjVHpK2KyoxIX/omlve9OH+naTmq4kdzGW
         rHelPWlFiUylnR0Q/ptXboccRRxUhIC7Sd0P4YuyMOqgqgkTnDkbkyLgdSF4Btu62jFK
         TdikOQ8srhCOqiqekMk0AUvvxPvMzWJrA6GkQhiQkPovEVT1rCfVdEIkLM0R8b+N/Xa3
         Dg1g==
X-Gm-Message-State: AOJu0YzUrbLZ+qYbFFhrS2wN4ts5qtBoSBC0EMSeeGuDoOYaAP2gXCYa
	7FMtURSxs8iu+Un0VLt06epmHbKaoIpt513uzQeMrkD3mGmtaJFFtdoUpfiuCq1LW18=
X-Gm-Gg: AZuq6aICbSdz8hDwI26ToQ2fWvs+H2u0c7jJZx5mlI4TX1RgeHtcjJM5wd0t8IR60Qz
	6DRy6xxXjHnuM0yWbP3+l0wy0wp3azCKGG5a2jBPWJlGbDPa65el1Hjg+kO1b7u1SMJJTH6Blkv
	5pBZjEn6OMaNoeh83tAZYaLxVhFEvEdV7hBMR7505adAx/RSBNYRL9bvytDvSOyyKLYQhiGC5FC
	iPF/Pe46JHMFht28F6AqMG+U+6pVX2Mmx8wB6dtc0IMFgAripYjSSEOrXWfsLthA3bw9YuevNjw
	FyT0PHjpfJDkw8mCHYOGtKwiFT0H7uB0RtoaoJI8F7JeT2x4bkQYhkGrmNKAR03hYbzT7xbYB7b
	KrDgIPc8F3d+9PAOBK28UxCiPpLfTN5Qz1dkUE8KivlPqN/ZchF/kQLbiaeyLJs3IKxVsQH3Wza
	TJD2m5G/J1XwENDII=
X-Received: by 2002:a05:7301:fa0e:b0:2b1:7486:3a06 with SMTP id 5a478bee46e88-2b764345c7bmr202473eec.18.1769308244754;
        Sat, 24 Jan 2026 18:30:44 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90cda6sm11184625c88.1.2026.01.24.18.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 18:30:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sun, 25 Jan 2026 02:30:44 -0000
Message-ID: <176930824377.2074.2111489973153786953@22d5995788c3>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
origin: maestro
test start time: 2026-01-24 00:19:05.175000+00:00

Builds:	   38 ✅   17 ❌    0 ⚠️
Boots: 	   43 ✅    3 ❌    0 ⚠️
Tests: 	 5523 ✅  534 ❌  316 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:697424621908a6300d9429b9
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:697426e41908a6300d944081
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            



This branch has 17 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
