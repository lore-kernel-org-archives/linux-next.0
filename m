Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34751A2C0B
	for <linux-next@vger.kernel.org>; Tue, 26 May 2026 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762619; cv=none; b=XkTFXmGvoNxxBryCdb7ICbvYGwAeIpvHWXkT2ZaDwscnXch9KA9ph1qMB9ZWeLfelueRGPYsf22yymkTAxpjkHHj/3JF8s9exF3HhPr9aQoJnM3lEZYK7pmVTfYrYsxqzFjiOOvoVmbpNQC4jH445382XtMaNVnRdcoqmbxTnLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762619; c=relaxed/simple;
	bh=pIG3K26mNiQVUUQxdeRiLD3osxr8767uBD1zQqNogCc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=kGVTUN7OfmP7Wbl04pwFkAbST+XRpH8nL6IVwfhlaEmKV6zdPe2SOF8Xj6HBvjYSb+Fs0HN7y/tnXr+uNWmrAFdS17P++Xk0bfl/4ykR7orKD9mCCwhoaGiMdfNxlX1SUzJ71oe0Fh+n1xqllUIlwwJ4ajPDFquwyj0CAmMfH0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=C6DpagVo; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="C6DpagVo"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30455f77e0eso6615561eec.0
        for <linux-next@vger.kernel.org>; Mon, 25 May 2026 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779762617; x=1780367417; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXNccu4RaH9r0MBBT5pwfHMhk5Jy0IquBVRxyQ/AI7g=;
        b=C6DpagVoaFB1JOo/p5gp8xQT+vK8lcVCefrqp7Siupw5D8mW+DKgQMITIP/P7cgwg6
         ww3f14Je48HyCNoWiF0nYhEIN/571c73T9H0KhYgFTovCVD7DVLRdFdcEPwiFRYwn1/Z
         OVi4FCyvA1+7k7ytf5Rrc+pegMJFWP/LfKjbIqDDoDcfRT4KNiLR6WJO6qQCPw8guWI5
         zyJhL4HfHH/NnGLJd+fp/K0dC3a9sS8wWbSJojdHOC5v3F6yPp2htnMUt5oWNPf5MXCw
         t2DO58mm1Ro0mjw3KnU5JMuFbb74R7DVmAwqpcIbYCmQ1k84zgXx23XmxQcXHyH7nwic
         7FTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779762617; x=1780367417;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UXNccu4RaH9r0MBBT5pwfHMhk5Jy0IquBVRxyQ/AI7g=;
        b=csIqVgSGs0lDDE734NGPetNfYmKW3D4w6Jbfd+mZXqavs8VhQydUVvgCByMb2nwVV2
         fY5zhJjvu/S6b/o9siY4cinYEMLB3Xgp4bO3/N7iJjm/yTkbE9M1mML+IWkqWAiZ7b+T
         rr4WjpI/cybT4yXPrixQ16B5lr5r0Leh9Wx/Q3zws5DL2VrmoKSHlL+B5M16PCfM9gIE
         54DdNJ2pJUilfizmPIbH7wj/F+h01wX2/4E5jjxmWaXPIe1Q53+vM/OehEOVifHt+Yz9
         Cg+NUdJ2CzT7b88Kb6OPjLQu77P4VJ2dfzMapWhDOWECbtyxK98YdvEozCge3AA0TWp7
         UA6Q==
X-Gm-Message-State: AOJu0YzfuIB/Eeh0Nc+IFeAbCViqI3p2Z2Gccdb0UmzDxdv2eDBUqrhC
	n26OmhXsktrhyiD9Q1BLVjCPIGhvPabwbUZ2kxfWThDT2bspYpwY7GG6JheN4UHIOwU=
X-Gm-Gg: Acq92OGxEJqUqYCjtsL0k+wtjA1tTgPgqBCcFikbkORdhBIzhTOTlFhgb8cqYfzcMWI
	bXSpBnt3vmpDzmyhGTtHReTkDQIw6gIh0vGRKjx+I7Mn5i78yBHRFPK1Y1WqUtNSbq3j51ey019
	fgNBPOYlPwlMDJhcuJUJl+oi6AiWwKst+N4q5ZNuQg+gZDcunHjDy9E9qrJdQharoGmGaFIyiKO
	avGM80X7MzfbXYDD/UdsdxP08Qryqyf/Tv11VmmUdavzIuOwVzXn3uEQOoKAhnL61B8a/J2bwiF
	I/ITGOAFbqJ3qdf2WR+lEX98fHr7SPMcpvV5B1xlE9f1HRcAn2IJmDSwasbIIck5gbjSGo9qhKE
	sNhn2Jngluf8zcs1QSkwl2498u4GtZbtXwh3UG1rQRlg/VH5OWxaDYgsBPdlw+oAeUFyhc7FVgL
	OZxkFjud+hCahFZEiftGZLvEqOwgc=
X-Received: by 2002:a05:7300:bc97:b0:2dd:6937:79bc with SMTP id 5a478bee46e88-3044901ffb6mr6968888eec.6.1779762616794;
        Mon, 25 May 2026 19:30:16 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452255234sm11675232eec.20.2026.05.25.19.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 19:30:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - d387b06f7c15b4639244ad66b4b0900c6a02b430
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 26 May 2026 02:30:16 -0000
Message-ID: <177976261587.5826.13662140795547368606@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/d387b06f7c15b4639244ad66b4b0900c6a02b430/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: d387b06f7c15b4639244ad66b4b0900c6a02b430
origin: maestro
test start time: 2026-05-25 16:25:53.287000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  118 ✅   51 ❌    6 ⚠️
Tests: 	15240 ✅ 2798 ❌ 1759 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: aws-ec2-arm64
  > Config: defconfig+aws-ec2
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a148a81ee38c2a863d3b180
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: aws-ec2-x86_64
  > Config: x86_64_defconfig+aws-ec2
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a148240ee38c2a863d39aca
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a148c76ee38c2a863d3b722
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a148c9dee38c2a863d3b82b
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a149869ee38c2a863d3fa4f
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a14857eee38c2a863d3a6e1
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a148c5bee38c2a863d3b66a
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a149692ee38c2a863d3ce36
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a14857fee38c2a863d3a6e4
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a148c7cee38c2a863d3b74e
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a148fd7ee38c2a863d3bbd8
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a1499edee38c2a863d3fc6e
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a147df1ee38c2a863d34439
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
