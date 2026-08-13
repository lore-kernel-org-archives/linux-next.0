Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090F0207DF7
	for <linux-next@vger.kernel.org>; Thu, 13 Aug 2026 02:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786588225; cv=none; b=MwfwHOu0Vj+MOu7bAml1XATfKzU1LbqcvS5ksNTb3uzuHWiveC4XASnaUH06fQ9LhEmnsYeWeX1pd+pjNJUoiUw66u19EVl936YfYRN+ckPZ0a6r/BDds0DGxOk3RpxolgHEGKPwrGB8tCdZm6SFhqqDXz6SteqhBpKabRzqz5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786588225; c=relaxed/simple;
	bh=RaA9xc0rFA9U9UTBLuo1HSUwO4EFV3K+PzfPVms0VWI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=U1IIn6LRH9vNEJzc0OwpP3HBqJdscLumpvrextmaBRYTLMZf2gbKVpuUOxuqHN7JhKwKTCZpO8Qbkf0Bj8vX2J1RjNErqU63tSYDyN4GV5sj/VQNUfQjB3eTwHkE38otPSMN0q4kdKyTiKLQEdCeywERSc0zilv75bLy8cp3jes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=F3/8/R0H; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="F3/8/R0H"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d004f135b1so24259665ad.3
        for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 19:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1786588222; x=1787193022; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GVXOlvRepqCeCP46MJc3o609GyTKCTOEgmpSDPdMnHI=;
        b=F3/8/R0H584dNLkLl3u+s0t6u2AerPFz+ytTOaJ4y51cmDTnaYCW71jiH47tps4QDE
         Wu6rWVL9X3tL0Nq6z9mZcavg0XRCAu+rWdaGpUQZrVt5Uy3ZkFNAqXjHnKcnwisUKQDL
         beN1nulmBftVUYlMoGuoHVkCI2iAsc9BsrYke3HdFkG0kczty+2JFvU3/ud/EbQ4alt1
         l181qi7Wl3siSkEHGfuFtd0N//N7OcFe576H3arSI0DijI/pNTZgcVoQlJor8CDfSKK+
         qJg9LFkxCJpocRSNwqfjfP0viHCliYohy9OSwUspcowHWeQhEnhHJ3N+OnZrKkKmkk+R
         Tj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786588222; x=1787193022;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVXOlvRepqCeCP46MJc3o609GyTKCTOEgmpSDPdMnHI=;
        b=eOoMPwtPm/ao37lx2BVCE+t/1QoLaJ4iC6pWUwP/t1+DCp3JE4FQXuYu07gMUDruRj
         TGcwnhucGXXlMF66iQjkQOKpR5w34P1MfCx1A+nNkP1H3vf19FZobu5hhBOJ4lrq3YT7
         xwWOSuxcEMQoWpBiDqCuR6rvAzGUF2RiFAnced05RaqY54g6URO0ugd5lyePlDrNW1lN
         Kw6WIdAnXh/HMttWWlxfjLjO32ACgouAUQXNQ8UdWZAkoSd8bQ+WqI/01HjygECqRhjY
         H/qDPRY+xK8qV18kmQWX6CyNlN411mQHKSTioxsL+wN1K6ERTfMnk/p4T4uFdVZysZVQ
         Vfsg==
X-Gm-Message-State: AOJu0YxVtjXijBfnOUCJsWw9xNRR5rkOJxpzYp2GT+QtkNEffc+o7nZ5
	CpCJ3WImhhQfibNkCGch/bYjoMfmQRVZK1fCKua+wT+T9jwdPrmbr2OwHqDR+77aQPNk1hbz7rf
	oNiVE
X-Gm-Gg: AR+sD10Q+AYteggw0VjcoBtE1Uz5DEr40u+kLz/yDOi/B3e7ee5z1MWRYmezk8MJzyo
	AqbxNhFhTHx4I1NcvFxjxCt90M9BDkzds11ydV7PNLBE33pQ9wZzi6pomazog//Mtv3hoQIvQTH
	GMty2ldCzIMasQKkELjAUrs1Sxnvlp/dOREGuXooONGmxD+/1v/JlTY4wUvPzbdTgir2ZEeeOJQ
	MD+ZJQ3g7Q3cq8M+SlZ+xwgLfslJP3OblYlmgltdne1btxkOwh+9mhG3enhBXEcP4mVVHz/fXrU
	pWb330f9SvbcBjz1GXqoRKMb4q/YWeUEcyXQfTtn18yi9LrQb9zJ6dbuZogGH3Uy6TncyFxi0jX
	Cx0+RLjwH8YMpBD/BBQfn7l3xaXO5Za3nrCKjUIvYSNBzUL7X1FY4yCdJOCpSINCH4QsHmJLIIu
	2YFknx+s/DESQdq1hcgHEm9pvK8CzxIZOogOS1Pe8tn52odtfr4S+9
X-Received: by 2002:a05:6a21:7002:b0:3cb:eca6:ce5 with SMTP id adf61e73a8af0-3cc5539af60mr3732749637.24.1786588221644;
        Wed, 12 Aug 2026 19:30:21 -0700 (PDT)
Received: from 9a65d8f5b626 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebf731f95sm1949622eec.15.2026.08.12.19.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 19:30:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 28d012efb4327f9c75d5e042a7c91e9a542efa98
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 13 Aug 2026 02:30:20 -0000
Message-ID: <178658821974.2675.17217948949744569100@9a65d8f5b626>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/28d012efb4327f9c75d5e042a7c91e9a542efa98/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 28d012efb4327f9c75d5e042a7c91e9a542efa98
origin: maestro
test start time: 2026-08-12 18:30:08.329000+00:00

Builds:	   65 ✅    1 ❌    0 ⚠️
Boots: 	  150 ✅    1 ❌    0 ⚠️
Tests: 	33110 ✅ 5534 ❌ 7711 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a7cd5b862f33761c0b884ca
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_2000
      last run: https://d.kernelci.org/test/maestro:6a7cd80962f33761c0b8c25f
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_2000
      last run: https://d.kernelci.org/test/maestro:6a7cd83262f33761c0b8c3cc
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_3000
      last run: https://d.kernelci.org/test/maestro:6a7cd83262f33761c0b8c3cb
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_3d64000
      last run: https://d.kernelci.org/test/maestro:6a7cdcab62f33761c0b8d4c9
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70_i2c_1_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a7ce02f62f33761c0b8ec64
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a7ce02f62f33761c0b8ec89
      history:  > ✅  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a7cc4c862f33761c0b81ba6
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm.mm_ksft_hugetlb_sh_thuge-gen
      last run: https://d.kernelci.org/test/maestro:6a7cde8d62f33761c0b8e14a
      history:  > ❌  > ✅  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7cd4a862f33761c0b878f7
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7cd63362f33761c0b89bc1
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7cd63362f33761c0b89bb5
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd63362f33761c0b89baa
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd63362f33761c0b89ba8
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7cd63362f33761c0b89bb2
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7cd63362f33761c0b89bac
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a7cd4bd62f33761c0b879a1
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a7cd72862f33761c0b8be93
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a7cd4e962f33761c0b87b05
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a7cdbc162f33761c0b8cf1e
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a7cdbc162f33761c0b8cf1d
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a7cd5b862f33761c0b884c3
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a7cd5b762f33761c0b882cb
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7cd4ab62f33761c0b8791f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7cd69962f33761c0b8b001
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7cd69962f33761c0b8aff5
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd69962f33761c0b8afea
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd69962f33761c0b8afe8
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7cd69962f33761c0b8aff2
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7cd69962f33761c0b8afec
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7cd4ac62f33761c0b87928
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7cd6c062f33761c0b8b4dc
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7cd6c062f33761c0b8b4d0
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd6c062f33761c0b8b4c5
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd6c062f33761c0b8b4c3
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7cd6c062f33761c0b8b4cd
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7cd6c062f33761c0b8b4c7
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a7cd83262f33761c0b8c3bc
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7cd4ae62f33761c0b87930
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7cd5dc62f33761c0b8896c
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7cd5dc62f33761c0b88960
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd5dc62f33761c0b88955
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd5dc62f33761c0b88953
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7cd5dc62f33761c0b8895d
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7cd5dc62f33761c0b88957
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7cd4af62f33761c0b87936
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7cd63562f33761c0b8a034
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7cd63562f33761c0b8a028
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd63562f33761c0b8a01d
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd63562f33761c0b8a01b
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7cd63562f33761c0b8a025
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7cd63562f33761c0b8a01f
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7cd4b162f33761c0b8793f
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7cd72662f33761c0b8ba3e
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7cd72662f33761c0b8ba32
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd72662f33761c0b8ba28
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd72662f33761c0b8ba26
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7cd72662f33761c0b8ba2f
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7cd72662f33761c0b8ba72
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7cd4b262f33761c0b87943
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7cd60662f33761c0b8971b
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7cd60662f33761c0b8970f
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd60662f33761c0b89704
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7cd60662f33761c0b89702
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7cd60662f33761c0b8970c
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7cd60662f33761c0b89706
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm.mm_ksft_hugetlb_sh
      last run: https://d.kernelci.org/test/maestro:6a7cde8d62f33761c0b8e147
      history:  > ❌  > ⚠️  > ⚠️  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a7cd49e62f33761c0b878bb
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a7cd80962f33761c0b8c20b
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a7cd4cf62f33761c0b87a25
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a7ce43162f33761c0b8f0e8
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a7cd47062f33761c0b87757
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_displayport-controller_2215c000
      last run: https://d.kernelci.org/test/maestro:6a7ce02f62f33761c0b8ec91
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a7cd4ad62f33761c0b8792e
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a7ce2ed62f33761c0b8ee8c
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a7cd47362f33761c0b87769
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a7cd4af62f33761c0b87934
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a7cd4c762f33761c0b879f0
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a7ce50062f33761c0b8f38e
      history:  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a7ce50062f33761c0b8f357
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000
      last run: https://d.kernelci.org/test/maestro:6a7ce50062f33761c0b8f355
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a7cd4ac62f33761c0b8792a
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a7ce52662f33761c0b8f602
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a7cd4bc62f33761c0b8797c
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:6a7ce61962f33761c0b8f909
      history:  > ✅  > ❌  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
