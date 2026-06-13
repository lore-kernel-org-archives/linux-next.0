Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4AD2147E6
	for <linux-next@vger.kernel.org>; Sat, 13 Jun 2026 02:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781317846; cv=none; b=dq6IcXrLmKr5tS8O392EW6VsJtnNQW+4cTwt9YN1LKFWOU/Db3X7L6/voCJZU8gxUybwQAFSrBjjodXDYkRAEZE5VRnmqBtdIAJP0vUREoe7oXVgHASBujssZLhnQ7wZhPuOC+WXSovJKIOgE3tpHDjqdiLuwo9afZBxqf0fu3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781317846; c=relaxed/simple;
	bh=KTaDQ98++xq5Ornv6BA6Gt4GKgUBgFXy5MsQCq2kwtM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=saWLXntZgy+oWDOkCbfUV3T/1GM/YV1saA1GVPK/kuF1WBK3weTHOOkqR6bR4UyGVsFp4OzRa6BFDoev8YAPwRi/T8qZuwrLjx1A/3wVjXBGlQodMwV9Iw7hRq9ZKxKFrVBd9wkdIwoC24ljFhntYJ7McrSh4K4cQ6Gu3BYLsIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=ZLATvakp; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="ZLATvakp"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3075ce9c05aso3633982eec.1
        for <linux-next@vger.kernel.org>; Fri, 12 Jun 2026 19:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781317844; x=1781922644; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWcESMENmDrSfSV6p7Z38PXbKX0CcHCer56KR7pzJYY=;
        b=ZLATvakpPW16HpPIBq776YgeKlPJtjCAv6EoWYw6bXINnQ/IdJ6YnP2dKk7Hqg2wD8
         BBqP73rcvjlGI5zLg01Lunb20Yk2rYMyRlvnb9e+0nQO9RyzzAVO+0lraycDH/zzkCLZ
         BzxCm2l4RjH/ZJzVUNW3kiHvi13jFlr5aX9bOAbIdovzuTMxcNpYT0x2NZfXBQXS1yvy
         xHor1L8tva7O/sEw9GfAVQisuAX58xV2f+aDVPaWZCS0voKkJT2s63GzXXKHwXoDkFmV
         ghiMuFGKGRMkuFzbYpN71l1HKL6IblUy34TzmVh9e/7Ahvq8kNghkrVnOun+hgd8iRYa
         goCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781317844; x=1781922644;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MWcESMENmDrSfSV6p7Z38PXbKX0CcHCer56KR7pzJYY=;
        b=rav1N+8hdScMUgcfNhxxb1+uItoEmQp5Fhc+lln2y9rozG9OkSrgDiP0QsL4/RzkX4
         5oFWdb2u4LmyLxOIBYJpQYMGPV/3Lr6iFcoGb2p85Vd6AsdITXhEUln/Apm+BrHwmtGg
         n138i6M2D+GdZhl9fVxDYkvhKiv8bmPqsaCID+ogL7YzRNrjhZbCe1KFwx1+ICLI/ek+
         d/1IfxacEqyBd7ltHpcNPprrMZo66HTfPOC33X2RGlPUwyo2MVmwygK+/iJQuVUfbcZC
         qO895hoSZO3Ngc4oRPL1c4oJpjhjR1Z9WcbUtl4Eyw9Z9Wmzl/OG4zHD6du5M6As4NXU
         LY8g==
X-Gm-Message-State: AOJu0Yzug7kq+FyGq2Bj122oI8Gt62cqz+6rYXGqGquYO/QvqiAgmIk4
	AaA9/ppvwLnMxRe0oZIjFYvhp4rAPEqfbK9DtmuFzYGzB5mcFn3ZZeBzI19/XZiGNu+G2rOEYDH
	BxLb+
X-Gm-Gg: Acq92OEg8VQuQeSFWPOUzMunXeOBnFXrABoNriBbEBjgWk88McqbB1J/zePbjg6aZRl
	pB21xbq+nQQpiG0HMjLpgc8Avhq8N7Lmg4LSAJYIC+kFIwMtKACTwWxNZ9TURK0OqjaIHRnEtcY
	jFPtGt9c6E/dVSujxh5dOsceqibWtgtKP9iDw88vtVvb2kNA8dLzuEE8bOIJnt3tUtiETcJcQS8
	XMMbm2+aKBrcLr4Fq3Disfo+AC9vDw6DuVX6WwsI4TxgLBUo9gV1NTT1rUijPXpdXm1b2/0laz4
	DfTMsVXZAJ+hcUaAMElyvM83EM8aILtGXJPbw+dlNzsks13M11TyzzsnIcKSOEY1mNTmXim3qvF
	5rUwHddPgssNGU95pVSZYnR68sdM4jkwKJUabJmmo1NwXppZ4Y7USP62NDC5xSwcgiSaGrU6OYQ
	BnHLrL5F1PTdh7CIAi
X-Received: by 2002:a05:7300:7304:b0:304:bc25:3d19 with SMTP id 5a478bee46e88-308200db7c9mr3245620eec.32.1781317844067;
        Fri, 12 Jun 2026 19:30:44 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ddaf69asm6263450eec.0.2026.06.12.19.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 19:30:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - c425609d6ac4012c8bbf01ec2e10e801b1923a7b
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 13 Jun 2026 02:30:43 -0000
Message-ID: <178131784307.14101.11797776271953391401@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/c425609d6ac4012c8bbf01ec2e10e801b1923a7b/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
origin: maestro
test start time: 2026-06-12 19:04:01.109000+00:00

Builds:	   57 ✅    1 ❌    0 ⚠️
Boots: 	  168 ✅    6 ❌    5 ⚠️
Tests: 	28180 ✅ 4684 ❌ 5623 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a2c63ccdabb8c619d54d802
      history:  > ✅  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2c640ddabb8c619d54dcc8
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a2c63d3dabb8c619d54d846
      history:  > ✅  > ✅  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2c6414dabb8c619d54dcec
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a2c637fdabb8c619d54d414
      history:  > ✅  > ✅  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2c6411dabb8c619d54dcde
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a2c63d2dabb8c619d54d841
      history:  > ✅  > ✅  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2c6413dabb8c619d54dce8
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a2c63d6dabb8c619d54d853
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2c6417dabb8c619d54dd00
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6a2c6408dabb8c619d54dcaa
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:6a2c68bedabb8c619d55466f
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_gpu
      last run: https://d.kernelci.org/test/maestro:6a2c68bedabb8c619d5546a3
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a2c638adabb8c619d54d4d5
      history:  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a2c6410dabb8c619d54dcd5
      history:  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a2c85a7dabb8c619d571043
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kernelci_sleep
      last run: https://d.kernelci.org/test/maestro:6a2c6086dabb8c619d5461c7
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-1
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d549604
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-10
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d5495f8
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-2
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d549606
      history:  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-3
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d549608
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-4
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d549602
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-5
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d54960c
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-6
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d549600
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-7
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d5495fe
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-8
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d5495fa
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-freeze-9
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d5495fc
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-mem-1
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d54961e
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-mem-10
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d54960a
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-mem-2
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d54961c
      history:  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-mem-3
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d54961a
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-mem-4
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d549616
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-mem-5
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d549618
      history:  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-mem-6
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d549612
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-mem-7
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d54960e
      history:  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-mem-8
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d549614
      history:  > ❌  > ❌  > ✅  
            
      - kernelci_sleep.rtcwake-mem-9
      last run: https://d.kernelci.org/test/maestro:6a2c61cedabb8c619d549610
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a2c63bfdabb8c619d54d791
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a2c6b75dabb8c619d558c18
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a2c6b76dabb8c619d558c1b
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a2c6082dabb8c619d546196
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
