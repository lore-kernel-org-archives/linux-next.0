Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD381A0BD0
	for <linux-next@vger.kernel.org>; Sat, 20 Jun 2026 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781922614; cv=none; b=YFb6rnNkhM2FX3wBKNi7fcHylZQaFJUs2lLASmFkcU0OHES5kcE5euskz+mqv6IgZMDn/xpOKcOZIk0i2WW4nEqRyz5jVyJbo44+l5EnuLupneNffnRRp88ycBLgZqckt12s0WrbfKCcPaTOBn2Da6i/iQafL8747AHZ5z/MTTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781922614; c=relaxed/simple;
	bh=tLoZlmMFgWyWQFdu4kQdb5bjeNXkUp+7wgMgq8W42Fk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=PORwUlArtUp7IIK5d8Y2z9wTFt2+Ehr8Y3dYSqD9/aWl0ha8BHmV5oobJFAF9JC2C6eGfPuD4bWrbVTO3FSFzFXTtYcKtkWRas0eFeJLxRPwhVl21GhiifXr5coZy86jHp1I7PpHkYZXKgcaX+qPB0kPGRRtkL+FYB+FXRtdXZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=jP/5EW5m; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="jP/5EW5m"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-139a5f4ca15so1135709c88.1
        for <linux-next@vger.kernel.org>; Fri, 19 Jun 2026 19:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781922612; x=1782527412; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKm6aXmkz4NHiqbzj3tf3jzz086uTd4OCt6mCcfzrX4=;
        b=jP/5EW5mHJb939iyweOpR+xUIZd2lviF21g/GdJRf1y7WwtfDMOinOleHPs14YNq/R
         Y62FOYhZhBvlsNtOS67ROFGb2j0hwu48A/6iM7AWHn05dUkm0A9ggBVmtTtN+95TGajC
         LEtszbsb7PMSq2RGxKBoGjojAXIpQJLXJca7tTAcu8TXrM8YD4H+0HwV+NA7cifDrSp7
         madCpgS1N3jr8HN1YTHxctJuZrLvR6vlJyUHcYRYrdKGdmhXEbzDhlJN81iFdz1MSSyj
         dPBsZmzvviW76rxx9bVN+nE1APzmIxbQpov9r5/o8EFQwkMZRBH8/YFSgY0yf6v3KIbg
         Y6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781922612; x=1782527412;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kKm6aXmkz4NHiqbzj3tf3jzz086uTd4OCt6mCcfzrX4=;
        b=ouHI8CgQffG3lUYImzukuL1YFbY6v9hDoT5YFRg/ou7BrzfVv+oociXK3NwkmAt2IV
         oxTR5Nb4oGZqwOMK0yH9LFHSTIuM1Yi4kukLvJ20Y7RvbXiwJ+6YBKk5/zTJAQTVwTfx
         cW+ebRHyT0AG2IRGEbNiDrzySODAQeI3Nbbytg8/rTq8BB00u+cFx0rh8Z2xrSIlhqvD
         CBI1xX/cub3s511LP0/ugfno1uzv8OgibLtzl6lMYm520hgXIXSxZIzScIda/B155zbc
         OnXDc1tPl4ysaS9Gud7sKWASxAk8zGRFSoDsBVH8V75tMrCFwk1xxWdo0hPisM1pk4Ef
         57ng==
X-Gm-Message-State: AOJu0YwHns7rp/mfDpJZbciIRcqr+99qB/BDkn/aXuFHXXu6+Z3GULwu
	8YQD0ezemOcBE8S81X00DGtqkc1lI5g8MPo4ISu1UOsdDgPHVMNzAqr83m49TuGLQD9EzkODknQ
	9mmdM
X-Gm-Gg: AfdE7cmPRWZxbl0idxmfdYl/D6xT+td7B3Zn0WEuHQw4CVjhZSnxxGWXh4ACOo5S4cR
	4BG7/zJ3caMEJDSrnGuUVnK74yPWyGxIXTJmHAIS1PLRlQ8zkYiY0RWf1Va6sYBdzJQrIwNC/i6
	dLG8r5/gor2W4PnWPg1ZJmXISk7RmON2dOvLQNpuC3B3M8rjLaNVwFdL25lX9Vv4Cj/gtFKhuPm
	YI8a1lf9GCxIA8Ln+oWrJxnWxJLC9q5CmhI5UB9w0cWhVAvJqBS8p9/Ynh/O58WwXOpC8W/1GKL
	CGMBaEi9h/aZ6DKWqQ5ItKzgFdmN7QukYsfMxMlYPszygH0LZHZKhP/ujiIbp6QHPE4xuOHMbrQ
	YLvS6bkXu7saf1J+OJp0fhNeRxbqxTRCsb+cZZQhTok2wg3ukVle6V8GVORQaP7fLxEmWMsq5to
	U8QgwGYA==
X-Received: by 2002:a05:7300:e8a5:b0:307:156f:268c with SMTP id 5a478bee46e88-30c06d6729bmr3680561eec.13.1781922612045;
        Fri, 19 Jun 2026 19:30:12 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be45a00sm1909320eec.25.2026.06.19.19.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 19:30:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 3ce97bd3c4f18608335e709c24d6a40e7036cab8
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 20 Jun 2026 02:30:11 -0000
Message-ID: <178192261119.17323.2609090936913331044@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3ce97bd3c4f18608335e709c24d6a40e7036cab8/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
origin: maestro
test start time: 2026-06-19 13:17:00.107000+00:00

Builds:	   66 ✅    2 ❌    0 ⚠️
Boots: 	  150 ✅    3 ❌    7 ⚠️
Tests: 	24411 ✅ 4705 ❌ 3189 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a355130ec8c023893a16cc9
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a35514eec8c023893a16d49
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a356841ec8c023893a1d6e1
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: kaanapali-mtp
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a354c25ec8c023893a1483b
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:6a355116ec8c023893a16c24
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a355123ec8c023893a16c75
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3550f4ec8c023893a16903
      history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a35470eec8c023893a092fd
      history:  > ✅  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3550f4ec8c023893a16907
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a3553dfec8c023893a178c8
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a3553dfec8c023893a178bf
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a35471cec8c023893a0933b
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a354a98ec8c023893a10816
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a354b52ec8c023893a114de
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:6a354b52ec8c023893a114db
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:6a354b52ec8c023893a114d3
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a354b52ec8c023893a114d2
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a354b52ec8c023893a114b6
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a354b52ec8c023893a114b5
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a354b52ec8c023893a114b4
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a354b52ec8c023893a114a9
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a354b52ec8c023893a114a8
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
