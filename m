Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A255D31E848
	for <linux-next@vger.kernel.org>; Wed,  1 Apr 2026 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775010619; cv=none; b=emSA0vg8+9f1Vk8E2/pyJfyAt8lmw7RnkcweIvQcd/b4S2QVqeOOhfQ7oIaI+GwRNGufxg/y3AE+ht4I/pYqCWuUaAx82J8i5iVvxeB4onkJ9aJ5/p8fBtiRLFoQW7pE1hbz7ftw3RtlzYGsLFzY5KXuXvoG8NVAbGMuiw1wokk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775010619; c=relaxed/simple;
	bh=cxBtXsX1poCsq/41nL2+818N+c+kkbAHlBrCMjO4V24=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ecZIyQoxsq79z37wVoMuD6XNe06lFdJUUMpasBzDFsHD5/7+EG0q4E5VoaCDpg6dBNs1vvgfzw/OnkCvvh+ark3VTHRGT4ltxxkqGrM4oOdsfxVWTgUPig+EdDCj/lnybF3DF478gNTk7QfNU1pY+Mk55Po3te0ErhxZh6RL4O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YJUepoRO; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YJUepoRO"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c160cb021cso6572600eec.1
        for <linux-next@vger.kernel.org>; Tue, 31 Mar 2026 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1775010614; x=1775615414; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VsHARoDxHq3HVQbs4vy/RKEGHKBTO+ZV0Bdg56VSvU=;
        b=YJUepoROXilFb5CAO50sQg3PCtwE/SMjgrZc5ALUlSg0VvIL03VG+M6aD/SdeCla6E
         Cvh5L9FASKetAloQpeK5RW9MzSCOIUePkQC9817jRwgugdgO5vcOQM6jPHPWHutDfyx/
         YZXFdYHsvKwPfuGkPB73X/YD4VqKgFd2x3vqMdMRG6DrPZvhz3NvHtVO55C6kzE9qRe1
         1+zelzXIdFG5iZS9Ux81WMkr2HlDtnYEoZzRZllDRl0f/TG+N2lsXBqm43Fo5/MZ2FFK
         gspOaYbV9oCJfgaJRw7766v4FDeaed52r78tNhX6P29XhovUJYn0CKnbKOp36bhzVtqf
         B/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775010614; x=1775615414;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VsHARoDxHq3HVQbs4vy/RKEGHKBTO+ZV0Bdg56VSvU=;
        b=b9IGfAH15pWY3fety2TZ8Fb1eW3pBecfILIXHBnxEWgGXtpphfMzbkT3a4vFTWI+xO
         JBpNPVCI4rcbe9SwnM3uoueBoepZmHB7/tM6XZHdiVWVKEv93P8a9IZh9EBiEtXms7dJ
         u6RUalwp+8BKK85EzFtKe76/HBWH7ctNzz76+lqZf+kYsQMhDkpK4lvKuu9gec4QoB+Q
         YL9Lqeq/iLkN6HEeuOhO92gJRtoz1ftM26RDtPuIE7fr/ZEe/X0HpvEIqdPqfYLM0kNr
         9jlbhqrtU/71epIpHIM6PwPIf9Z1ixl1JZ6oF6/jXfFgxw5BTjFUe5tF2znKtM8Ji3Sg
         49yQ==
X-Gm-Message-State: AOJu0YyV8hIogmDcq3+5aSCURq8yo/IBZq94/3f+i3l3xuBesu6qikc/
	QfKstyWfItqPmLUT9QTlnilElf9JRrr/DVUxYcewqbypnsSwTuqEmmbfJFrFKDPNPZjjcNrvnL6
	sM8b/
X-Gm-Gg: ATEYQzwg6rUUFIS2RS8XW0JrX6dnPrs5ScW16z3Vh8v19TTBlW4pgbkPJcGJUJ/feED
	JDe3+rJ9a4SI111nfNmt4m+ItYwq01vvkzo9N3tdSXi/jUIsVMqJRDLTwUrLmpHoEkLUeB7jwNU
	ghId7Rs1OdaKEz2jk3Y8lU5dDU2pcnI4x5WIWMiX/DVCdY1Un8VNUUvZoacDgXyZsd+bCF/aAg3
	n3ympTxaa6d/B7KXUD1HH2GV9I+LgvSxsgnim1JxkYNoFVefA2YrDb1yBLNfigM2w6eMxd2lb+5
	FmePKy7CUuExabB7DAemR73kZ2z3LJfV+cwpLs9nOU5l8fGFFSkrX1DL6ZF/8cIhST9pncgvLDB
	/8r1wF5Qix44ioIQvawLZzhWlS+lSDEqaqvsht6/ZKe956mmAKgeLm0SNOLZH0+reuZTzTJmKVj
	VFdyrxn+nUasDLTazj
X-Received: by 2002:a05:7300:5b83:b0:2c8:717:7ec7 with SMTP id 5a478bee46e88-2c9325b021cmr894901eec.20.1775010613994;
        Tue, 31 Mar 2026 19:30:13 -0700 (PDT)
Received: from 984b78e0ad75 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c8d8776daasm1767981eec.1.2026.03.31.19.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 19:30:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 36ece9697e89016181e5ae87510e40fb31d86f2b
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 01 Apr 2026 02:30:13 -0000
Message-ID: <177501061268.804.8860548414110680684@984b78e0ad75>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/36ece9697e89016181e5ae87510e40fb31d86f2b/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 36ece9697e89016181e5ae87510e40fb31d86f2b
origin: maestro
test start time: 2026-03-31 14:29:44.736000+00:00

Builds:	   57 ✅    0 ❌    0 ⚠️
Boots: 	  179 ✅    6 ❌    0 ⚠️
Tests: 	10347 ✅ 4061 ❌  986 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:69cbe91fdcae953c05670128
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.shardfile-arm64
      last run: https://d.kernelci.org/test/maestro:69cbed12dcae953c056736e5
      history:  > ✅  > ✅  > ❌  
            
Hardware: juno-uboot
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:69cbe921dcae953c05670158
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.shardfile-arm64
      last run: https://d.kernelci.org/test/maestro:69cbefe1dcae953c05674e4c
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64.shardfile-arm64
      last run: https://d.kernelci.org/test/maestro:69cbfd87dcae953c05679ded
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64.shardfile-arm64
      last run: https://d.kernelci.org/test/maestro:69cbed2adcae953c056737fc
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64.shardfile-arm64
      last run: https://d.kernelci.org/test/maestro:69cbeb9adcae953c0567271c
      history:  > ✅  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:69cbe927dcae953c0567017a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.shardfile-arm64
      last run: https://d.kernelci.org/test/maestro:69cc0a75dcae953c0567e430
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:69cbe928dcae953c05670180
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.shardfile-arm64
      last run: https://d.kernelci.org/test/maestro:69cbeae2dcae953c05672193
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64.shardfile-arm64
      last run: https://d.kernelci.org/test/maestro:69cbf0e3dcae953c056752c5
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_utimer-test
      last run: https://d.kernelci.org/test/maestro:69cbec37dcae953c05672e8f
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_proc-net-dev-lseek
      last run: https://d.kernelci.org/test/maestro:69cbf1b4dcae953c05675833
      history:  > ❌  > ✅  
            
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69cbf1b4dcae953c0567583f
      history:  > ❌  > ✅  
            
      - kselftest.proc.proc_setns-dcache
      last run: https://d.kernelci.org/test/maestro:69cbf1b4dcae953c0567583d
      history:  > ❌  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_utimer-test
      last run: https://d.kernelci.org/test/maestro:69cc099bdcae953c0567e000
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69cbe917dcae953c05670119
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_utimer-test
      last run: https://d.kernelci.org/test/maestro:69cbea80dcae953c05671c53
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:69cbff9bdcae953c0567a412
      history:  > ❌  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69cbe72edcae953c0566e117
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69cbdf5fdcae953c0566bc51
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69cbe763dcae953c0566e39c
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69cbf415dcae953c05678e87
      history:  > ✅  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:69cbe97ddcae953c05670ff7
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:69cbe97ddcae953c05670ff0
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:69cbe97ddcae953c05670fe0
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:69cbe97ddcae953c05670fde
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:69cbe97ddcae953c05670fa5
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:69cbe97ddcae953c05670fa3
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:69cbe97ddcae953c05670fa1
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:69cbe97ddcae953c05670f8b
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:69cbe97ddcae953c05670f89
      history:  > ✅  > ❌  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
