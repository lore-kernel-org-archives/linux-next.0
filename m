Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D6D1A9FBC
	for <linux-next@vger.kernel.org>; Fri, 12 Jun 2026 02:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781231441; cv=none; b=UXdmtNmJowgEnTSop3xg7rG9M2MpPactiEV4aLNrUkd/yJVa6Lr06FIovwW09F1N4b3cV97vkTrVZW5TtmK1aAQQN4Z0X0cpilPrdDzLVh3udjnfFj8o1OrWp3JqvQmhG4TYgS3jbKQTyFcFiPANA3UfWidLfiQ8pkNdDFLU4Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781231441; c=relaxed/simple;
	bh=/Y9G3xCyr+lnFhR0Xj/X5ykKCa8+PnHIFM1krnNED2A=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=BPQfJO8oSdPAnm21o/KZrRyPz+jmArj8nIxyDQyl+dCO2U8UacgsX9nCqMt6FKcfxckFUzDV+nE4Q2GkvwENaf8HnDwQVzQI6+uldO58GlJfwDFgXthkC5sO85y25zqf1VPqYppzWKhugJn5r57+fnHxhEtRvhEhkRptWzl8Nrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=jNp4qfFU; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="jNp4qfFU"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-307263ad0cbso851580eec.0
        for <linux-next@vger.kernel.org>; Thu, 11 Jun 2026 19:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781231439; x=1781836239; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub9pOEi4l64glliQqGTkFr77l28ufsVGI1iN6Datjck=;
        b=jNp4qfFUA4G86nY1/N96Q5w0RoF4kw+CrvwvsWSX/bQUCWlWnST6hkzkf1SeAovusY
         rhy+OuS3GGoWA5D7G0MAUjVDlHvfdA/zDwiNcfc6eYlHi8PypVsp5w5l+cVygnHq8iYP
         5ORCtVYJ4aeWdQrPqsuJeZ1EBy2Bj2GWRhyd+3AGKsxeVl/jMORaTCUve6Oj6qamZ1SY
         Ca427clBpDFo+6ol4sOx/JaJVVOGzNBBns/FLqXJ5PIpwz2Om77MjG/Xiq+shkX+ZcWl
         x1K1/xYY3ILUlDTji0dGozb4E1g5Cf0/8kPNkBWMLUrkWa/Jbf5CCbHxFUuwpZ21A5qh
         9CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781231439; x=1781836239;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ub9pOEi4l64glliQqGTkFr77l28ufsVGI1iN6Datjck=;
        b=Q9+ZP0l/dN3lYXg3Srbp0zTuJ6uyQ2pxhMw9fzO5VJKPuKeGc/yyIwtpntcz/HTc9H
         OMhiiQLXxBQfM241fkEUkv6Zbk9M5Sm7Hs7ccLMfEm7kS8I17uJZ8XcPqkqXRLrxrI/N
         vUYJRyH1I6WHGusfuR8rtePAs7jcik1q95KsL/4DOv4SSPVq/o/1ATV5bigRvsDbvH4n
         HT+BVfRAHHs1TETGBOB+Q99HQcPk3DVujgUZO/Zr6+br5jlzx91UfevRp3GuUKcmprzn
         I7SbMNtyYolhkAC56B3ZD2xVGPR4nG4YLmFlbZnbINu1EN1O9lyI7T4PiOqEoTnuc95J
         vhEg==
X-Gm-Message-State: AOJu0YzCookMtp6Y8Y9jT/9kRxqzEmtdQPRabH5Jl6bTXvLGGVK/vPfm
	AE1LDZp1sio3ILHgXgKPg7YZMi77p5dAJXG6ovo5WDJMSGqkaxhl8KuUvRfck8FJiVWXQhs0+6u
	aef7b
X-Gm-Gg: Acq92OGbUNWWpVP7OBjNBhAvYFxaSBfDIFQgzGbfUS2CNqInVQqPUtSflPiiknoo193
	hf9Qk59nojWQUlQj6Q+5UnNMj31pAW1Ttolf2TMtuOaeGPIkwwD2tlC7f8bethL3QMx+WSHhJD3
	8d6z6AOYG0jUayXIA8flarIGKMrqtXSoVKzEoa1zrCSgNPVk/EDOR0CRzarWOOeDoZo72Kat3eo
	B+Ag6JOsUgkATUL8J9vHgOrNeqi1UkEiIOuCdngGWk2dxBEFS4sN9oTBWnNy1CBR0/WZPQA3QoV
	EQqt5zs33BHaKUZh0sg+DliqITy6KnqWq7MuuTuNXN25NppTY0qSJiYx+GmLQTb0VeKb+JIo+KM
	HN7BqBikoVP20MA587/rudow1TIbgmyA94Q6fuEWHKJP4xp1wk3q5ZhiqzWj5bJ7aFuZ6xHbOHT
	OsI8vXw0a0mj4rPcgG
X-Received: by 2002:a05:7300:80ce:b0:2c7:3a7:c792 with SMTP id 5a478bee46e88-3082005a874mr587802eec.20.1781231438559;
        Thu, 11 Jun 2026 19:30:38 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5fefecsm1427770eec.13.2026.06.11.19.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 19:30:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 12 Jun 2026 02:30:37 -0000
Message-ID: <178123143744.13641.14210991816850347461@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/ec039126b7fac4e3af35ebccaa7c6f9b6875ba81/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
origin: maestro
test start time: 2026-06-11 15:11:17.364000+00:00

Builds:	   53 ✅    6 ❌    0 ⚠️
Boots: 	  157 ✅    3 ❌    4 ⚠️
Tests: 	26552 ✅ 2194 ❌ 6826 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a2ad945dabb8c619d4aad8b
      history:  > ✅  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2ae311dabb8c619d4b4ee2
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2ae30cdabb8c619d4b4ec8
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2ae30ddabb8c619d4b4ece
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a2ad8f3dabb8c619d4aaa61
      history:  > ✅  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2ae30edabb8c619d4b4ed3
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2ae30fdabb8c619d4b4ed7
      history:  > ✅  > ✅  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a2ad944dabb8c619d4aad83
      history:  > ✅  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2ae310dabb8c619d4b4edd
      history:  > ✅  > ✅  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a2ad948dabb8c619d4aad9f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2ae314dabb8c619d4b4ef2
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a2ad93edabb8c619d4aad56
      history:  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2ae30adabb8c619d4b4ebf
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a2adcdfdabb8c619d4b14fa
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a2ad95fdabb8c619d4aae69
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a2adae4dabb8c619d4adab0
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a2adae6dabb8c619d4adab3
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            



This branch has 6 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
