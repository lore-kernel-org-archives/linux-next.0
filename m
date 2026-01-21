Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DB52D8DC8
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 02:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962633; cv=none; b=QzXq0ajzGfoRW7HsfhFNjZgZajdRVtAws0lLLagauKsrwG6cgqebkmPZ+f8/laaqPtn1hQURu9UC2RXojEm+YG971Iy5dzSMTs+MHk3qqJLa5AxKmRiqEK0BgRAKAEbwDOG5yZil3yHS1CLkosQSPNmq3U01+LOQE/zIRm13z3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962633; c=relaxed/simple;
	bh=y68dFfeXqWpw/wlqCvh3am3+C5txxS4MhpW1i/WBrVc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Ghzm9AS3je7ys0dye+PEoBEFOTaIWK0nvCG9h7HjSMwTVCyGhMZOJmC1dbLLTxLGv0ooVt+cDCZsrUCt334rDaOWpJqeFynHHQ5shnmQNGPr58+GpA/eip07xJ2EZ4q8Cbfbz1MJZD9eW6e3gNONrbwpCM3lmyWlbOHjasKn29E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=kEy7OPUD; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="kEy7OPUD"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2b4520f6b32so8408698eec.0
        for <linux-next@vger.kernel.org>; Tue, 20 Jan 2026 18:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1768962622; x=1769567422; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCRQYVhRkha8KQ+iQVYKCS+FPhbX+U8xYYeBtBlGe50=;
        b=kEy7OPUDaD4RpMSIR1qs3CKo2B78MpZd9lnowQUx0QCstQwPd+KtGGRbRkhjqdbh63
         HIs4/w6bWwZmA+oLacFapAeO+dlAKawDEP9z2FyUyxXEGOISKnyWLoIgDH2E0JQx4+WM
         CkbWQjub6beXc2fCZhqyeWkmgaD1CwS0TzTW9zZdeSkxYXxPh+f6j9pEOY4NYJVKrtLg
         QNVmo/PH0b5SjldCLcEfpBr6hxNi1qYBw7U5ty2GezWePp1YG2NI519oulForcBRm0aA
         8x/+6kYv/Ce8JkBnetmBRmRIwkFJaQe2F+lwJmTVGHbFF2nnzSuF64rQdAMujvAOPLfa
         pL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768962622; x=1769567422;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oCRQYVhRkha8KQ+iQVYKCS+FPhbX+U8xYYeBtBlGe50=;
        b=jEMqHh9k1cNJlTaddFG4V7uJFW0ZQ6vRgUopOW3/Ut+xc79b5xTgB1xYj3J1fuEfhu
         ikzF+vnK8+wyW+oERQxvs5X8+qHyQpDXymtnxajQjaxmi9r3wJJbbk92ZQR5J5wMvAX3
         3Kfb5akUjKTN+rXDWIlLUfNfTs35nB/tM+C5NRJPPYYMkf+iId5sBuxAJI0Y1aujteJJ
         2u9RJ2HDD22tNwn7uauyrb2uXDgyZx4U5pBuGGWFlvRLzRNq4767RanhXqu52xhAi0tR
         uNbTX6Lqx5PeFVIhBU1P4C9DafMoUptfoqUtYJlk21nImJr40651lIeyosfB8nGqyc1r
         RfMQ==
X-Gm-Message-State: AOJu0YwPETvOiCxH+mR0ZfTuqf6D+8ELtWbzNS9rxoz8amQvCHgCde0c
	iDEDXSrVOP6MBsIjad9oLaDVWaUdjKN/1nClXgFWxmdOXk3870LkiVxq0bB1bmc7f/XLy7EKW4f
	ue1pHqQg=
X-Gm-Gg: AZuq6aIOhFuThExMlNtaWFw+e1qNS5G6Y5dk1D7VcMXkdWFschvtVtildLCeuPAm8iV
	RiaI4ckeIevLP5jISMtBG5HG8ETUbJUHluz0xM2eWd78aWIimbl0cxkv9+wu38Z5BgrdGJA1jLi
	MsPUFbM/3/8T4oMmNLq6Ko4XIyhVU8vlKCz9EnJtk+EaAkvBiQkWTNdtheZygbK/1yy0VV7/DLv
	IoFku73dfTBP04v1Jl3EKm2fDjonl/Qep8Df/Q6lapxvNDdgZPTbaeChs0krRbDvfbSfqs0OpEt
	FTcxPXDCevJ3kkusV6SRtuKfnL40rwbx5hb2VAXiPEx26N5WWXpu1LDjt9S/BSyu3NKwJNPIR92
	C3ZLpUcW7lSKgD7dt5lFSwQD5UFLPdMW7rS37/pHwwWammhH3rqUdCPAmpVU/TGd7eBa/i90zAO
	clOwSu
X-Received: by 2002:a05:7300:d517:b0:2a4:4884:e03d with SMTP id 5a478bee46e88-2b6fd607c0cmr2616564eec.11.1768962622021;
        Tue, 20 Jan 2026 18:30:22 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3503a30sm21257957eec.13.2026.01.20.18.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 18:30:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 053966c344dbd346e71305f530e91ea77916189f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 21 Jan 2026 02:30:21 -0000
Message-ID: <176896262095.232.16147055163684987320@22d5995788c3>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/053966c344dbd346e71305f530e91ea77916189f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 053966c344dbd346e71305f530e91ea77916189f
origin: maestro
test start time: 2026-01-20 16:58:20+00:00

Builds:	   53 ✅    2 ❌    0 ⚠️
Boots: 	  114 ✅    2 ❌    0 ⚠️
Tests: 	10114 ✅  991 ❌ 1352 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+arm64-chromebook+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.cyclicdeadline
      last run: https://d.kernelci.org/test/maestro:696fd437b2a19cc73abca230
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69701079b2a19cc73abd21ea
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69701114b2a19cc73abd22e3
      history:  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.vdso.vDSO_vdso_test_abi
      last run: https://d.kernelci.org/test/maestro:696fdd32b2a19cc73abcb024
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696fda65b2a19cc73abcacad
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696fe30eb2a19cc73abcc9d9
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69700e8bb2a19cc73abd0a40
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700ef7b2a19cc73abd10f1
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f01b2a19cc73abd128e
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700efeb2a19cc73abd11c4
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700ed5b2a19cc73abd0e7e
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f06b2a19cc73abd1360
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f46b2a19cc73abd18a1
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-n20q11-r856ltn-p1s2-nissa
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f24b2a19cc73abd1476
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-R721T-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f24b2a19cc73abd152f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: asus-C433TA-AJ0005-rammus
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700ebbb2a19cc73abd0b6c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: asus-C436FA-Flip-hatch
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f2ab2a19cc73abd160e
      history:  > ❌  > ✅  > ✅  
            
Hardware: asus-C523NA-A20057-coral
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f6cb2a19cc73abd1db5
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700ee6b2a19cc73abd0fe5
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f4db2a19cc73abd1a44
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5300-8145U-arcada
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700eceb2a19cc73abd0dbd
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f7bb2a19cc73abd1ed2
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f69b2a19cc73abd1cf3
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-14b-na0052xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f7cb2a19cc73abd1faf
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-14-db0003na-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f36b2a19cc73abd17c4
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f5cb2a19cc73abd1bee
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f2eb2a19cc73abd16e9
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-14-G1-sona
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f4bb2a19cc73abd1985
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700f55b2a19cc73abd1b0e
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8192-asurada-spherion-r0
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696fd970b2a19cc73abca9d3
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:696fd87db2a19cc73abca7ff
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
  > Config: defconfig+arm64-chromebook+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:696fd38bb2a19cc73abca08d
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69700fa9b2a19cc73abd20ba
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_BOOTTIME
      last run: https://d.kernelci.org/test/maestro:696fdd32b2a19cc73abcb043
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_MONOTONIC
      last run: https://d.kernelci.org/test/maestro:696fdd32b2a19cc73abcb037
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_MONOTONIC_COARSE
      last run: https://d.kernelci.org/test/maestro:696fdd32b2a19cc73abcb02f
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_MONOTONIC_RAW
      last run: https://d.kernelci.org/test/maestro:696fdd32b2a19cc73abcb033
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_PROCESS_CPUTIME_ID
      last run: https://d.kernelci.org/test/maestro:696fdd32b2a19cc73abcb02b
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_REALTIME
      last run: https://d.kernelci.org/test/maestro:696fdd32b2a19cc73abcb047
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_REALTIME_COARSE
      last run: https://d.kernelci.org/test/maestro:696fdd32b2a19cc73abcb03b
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_TAI
      last run: https://d.kernelci.org/test/maestro:696fdd32b2a19cc73abcb03f
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_THREAD_CPUTIME_ID
      last run: https://d.kernelci.org/test/maestro:696fdd32b2a19cc73abcb027
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:696fe3d0b2a19cc73abcceda
      history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:696fcd1cb2a19cc73abc93e6
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:696fd8a9b2a19cc73abca88c
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:696fd8a9b2a19cc73abca889
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:696fd8a9b2a19cc73abca881
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:696fd8a9b2a19cc73abca880
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:696fd8a9b2a19cc73abca86c
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:696fd8a9b2a19cc73abca86b
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:696fd8a9b2a19cc73abca86a
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:696fd8a9b2a19cc73abca85f
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:696fd8a9b2a19cc73abca85e
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69700d48b2a19cc73abd0756
      history:  > ✅  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69700f7cb2a19cc73abd1f21
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:696fd1b5b2a19cc73abc9be9
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:696fd172b2a19cc73abc9bd3
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:696fd130b2a19cc73abc99e7
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69700ec2b2a19cc73abd0bad
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
