Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFCE2FF657
	for <linux-next@vger.kernel.org>; Wed, 27 May 2026 02:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779849042; cv=none; b=C8HYXc6gwqxsRRBROGXz947aZkFPJ8ddgFlgy4ajVJ+nIcaES6Qt2LY5cQ/hlY4D4hRWp9MKs5+/bKrIE4qVDWF1Q4BhmY+mN0rAkMMgKIv0Ge7u2cZ6Sixr2Nt/WTBrsyBlXg0STK4SnnUinpaEKU/NXJLNrfi8+iGU3rNRx28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779849042; c=relaxed/simple;
	bh=CxHU/6V8TwjCb3Pixut/uM962o0UMZcw7VUTb4fadY4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=pJDOU7+o0WjSMsngbpP6xrtS3MNcxWJ0wUPKDApGKqX8Nuz2oHv6PhpqajO7QIVwQD2X3nS7/HwRaAoWubd2rZweq3PClhYREx/FbiW9lLF6Sjg5zqnQTlM3+R0/7ROG0Bgu4iNYDvi/Q/laf41PM9hH+itwTbPx4TBzArXhJpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=NDaAf6CT; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="NDaAf6CT"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso7947859eec.0
        for <linux-next@vger.kernel.org>; Tue, 26 May 2026 19:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779849040; x=1780453840; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5n7JwyWwPueBX2w5p98MeZsVLaRe/FbQXgmnj/nN+Y=;
        b=NDaAf6CT9yKCzQFijmRZDSJPOjuxKAsEu7nVh2yUEG43G0t5tXnSHay/zeMpxhqWNS
         YjxaZ1XPGKq3+SRyObhQjbVLBX5l+8yOQQZBoZpZ1XA+EddQdBmYpnuana5681cJtqIp
         dA8Hw1Jk5+he7hcDaB5GtuqABNzYFK7mSrGxJF8wWkVly3g0rSe5PTOs+JQ1E8SFbvZ3
         2OvP/CumLwSbWF5h0yeHcphH0dXSdhUaoTJKksDSY7wrL+uAPx8Fpp7XloGr4u8NbyVQ
         +zA62yptoYHSjUihbMQLbarACtxMrefWmy7zYwLfNQZKJuYEpEsMNvSv2P4MedESjuAn
         ujxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779849040; x=1780453840;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5n7JwyWwPueBX2w5p98MeZsVLaRe/FbQXgmnj/nN+Y=;
        b=hsaC+tKl0Uz/hGVwJPCW+s4di1PkK32bDNtXtYdALXq30uD05p7Tnndk8GQOb1/3eG
         gdUuTNjHOkuUMtpJHV8vpaYY0RxgXlawXml6TSatHZQBZU3DjNUIv2h3AoKVQ1zVQu1c
         4cobtckJcPaHsOWGuW3vdxCP2fYbWKuW517uOvQ2Lb6gSgqO338Y9PlFDcd38yqEXyWT
         8kSvG5WdtquAx1WYgLXTgWJ7UjBnGHx39p02oWelq5X56iBLD6cbjq8cltd0V69lf7lr
         nXg30ZYCm1o/ryUhCm2pBBH7k/GSwavcHOPdn46nfagZ4vC7htxKFa9SHquccg5FEPIH
         n7Vg==
X-Gm-Message-State: AOJu0YxS3zMUv/7248uZcrtZ1GMrHuCgaSaHAp94SthqEf2W+wzvuKOb
	nP6AA+UYZ8+CmM35O8rymEZs08bdv9J9iWfpNzoBzZKYwtkf7MG/JKU9xaYxGQI6eKUloRYrcl0
	3ghFg
X-Gm-Gg: Acq92OGrUAjU95uGQdbS1POoyv+7xT+w9gkaLQP1kO/xJ3w1b4uP0pUJsHr/Kp0mbVB
	SbxdHRwQOhT/JEBu5JgsPDmQ/n0gN8tIhDj4CZ/yDnMNZBpmXpZj6s6cOx9vYorjhohjU3Oh3RL
	NEEUtnAM8xvN73q7kSwWmrZfjSvo4uCYqqU5TCb9YFzJbrQo9goVuPoXQGpapesaQvK8MEOcaqB
	KQ4aYOhqsG8tdoLQakYa1qD5doQVcJb8oJHSUGIqeUdL+7QAkaJpcCYe3D80nHd3gEPD570rWsX
	WA/cwG5abvhqlA7fJWeat6FDn8Qhx+Ofe39+M00yd/5VG/O8PjN0uexPJJul09pvBHrCE1srQVJ
	nEyDivATzFH1obmBIEdflhle14K+rdODS5/DooCj99zGmRk1l6d9bj2nIX9ju4WsWmxVmPjatfa
	141Vx8bmrIjIurJNQI
X-Received: by 2002:a05:7300:ad30:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30470d05bc7mr5302101eec.6.1779849039887;
        Tue, 26 May 2026 19:30:39 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045223103bsm11609492eec.16.2026.05.26.19.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 19:30:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - e7e28506af98ce4e1059e5ec59334b335c00a246
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 27 May 2026 02:30:39 -0000
Message-ID: <177984903885.6285.14412528575583560576@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/e7e28506af98ce4e1059e5ec59334b335c00a246/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: e7e28506af98ce4e1059e5ec59334b335c00a246
origin: maestro
test start time: 2026-05-26 15:05:43.140000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	   78 ✅   49 ❌    6 ⚠️
Tests: 	14890 ✅ 2770 ❌ 2085 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: aws-ec2-arm64
  > Config: defconfig+aws-ec2
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a15c4ccee38c2a863d75103
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: aws-ec2-x86_64
  > Config: x86_64_defconfig+aws-ec2
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a15bc2eee38c2a863d6b9cd
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a15bf92ee38c2a863d71134
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a15bfeaee38c2a863d71322
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a15c581ee38c2a863d7528f
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a15c2d0ee38c2a863d743ec
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a15bf95ee38c2a863d71146
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a15e11cee38c2a863d89a4c
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a15c2d2ee38c2a863d743ef
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a15fc39ee38c2a863d96280
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a15bc27ee38c2a863d6b9b8
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
