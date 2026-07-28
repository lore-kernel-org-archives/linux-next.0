Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD83242D70
	for <linux-next@vger.kernel.org>; Tue, 28 Jul 2026 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785205819; cv=none; b=qPS4Z3WBHQkUto7qxnC0lG6EIgg+BHym2yt8LN62Qq/UG/qzyo3fidwLKqXcxIL0Rfpaav75D1iKOxuSNS/2aatYLj8p0l0kdckSV8Kxh5umU5fw8RP/dCVBY+mS2iEumOTRKBqKSql/ZCaZxP9YOUbJFTdskDFMhekVcMUWvDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785205819; c=relaxed/simple;
	bh=hoRBxv3HYvGB0/Ud6b3uffMPdcUSSOZFwnWuE1B2Rhw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=WmJdqGJLUz7oyAAkHNbhNqi0TO84bjVQZttmD+a9mzrDJZlFufss9V4GSKyr26A+j9xsrfpAffi/JsQMrTA8H4meh9F3kAYIzhbWcTLBMT29XozY4K8nWyaM2Oiy+4zBrTpJDdIfyEPRLLnD63SK/utzUTfnP9ViG8lR6oEPAwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Bakfu7nP; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Bakfu7nP"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso2408801a12.0
        for <linux-next@vger.kernel.org>; Mon, 27 Jul 2026 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1785205815; x=1785810615; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8520L1rkYH7P4sU56ibF/xsNG2OFS31+kzqfTjz543Q=;
        b=Bakfu7nP6RtJsyjQgsB27KFsuEHib5UJhv8AJi28vlS6QnR87+8teQ6LMemnX3AAyy
         sR8Tygc6E/65TCNiPauaXwJuZMeFsWRDzWeaJR/+FjOwYjG+dcOS94Mm9ctGATRsHz31
         0sLPVGQQ01qfDLuczr0MtGIoZMhEt/nGWm7w4p9eCL18RctIUOIDBF/bRfVMNH3lnGYB
         pbJTJI6OXnpAMPL7Yz8oWAq5pSnXRVCgB6aVYlofcML1EoDkF92VNdxdRHOsbZWR3sIh
         8uQLLDXI7oZgnyYSzKCfRetCQAO2N9JAMx4qVwOSZ28cHuH3pBJksrh5C+dsZqJlM3uK
         bxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785205815; x=1785810615;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8520L1rkYH7P4sU56ibF/xsNG2OFS31+kzqfTjz543Q=;
        b=i8jv58TPJE+wIk2dWEvNuveO2zprC6WLCrP2/qlymVQjfeMrr+q1tyiB5E2t7cHJsU
         0KRi0IdZgX8j0KLKuGofDo8WrUEnFJoMvEfQ2X30Zm07EOMcxjKUFLs5p3/yMzSx2kc6
         5CrSnGVSBFEDGd/V5oDCcsZ62PlhbFAJhS5QQD0REux6f3lWXGSzCxEkwK3RFgVNBM6M
         1aru2gyB/hKIOoxk4KYnttunxYnUEhpga8lrOc0o8tN2hsLUMZdd4Po9cXiX/JiSvD7/
         gj6FEFch+c5MIN9rK/REFa2OoyFcZILjqDA8c4ny80z/JFvJ9O1kU7jiZs19/FVQyj9b
         R+gg==
X-Gm-Message-State: AOJu0Yy6jNWfIpj/5pfg4jDjbHa31BDYxK2+yLu6zcx8XrTJnAvZqaAR
	JjvqIWywoclItMrunp4exW7NOB4I82wcdijfVPx5qeFlz2G+PjYDPn0koxgNDO1DAf5ROScOqeS
	+SrI1
X-Gm-Gg: AR+sD10pqtn8lqo6/Sb5ydSJ4FkkXs4suUvzw2LQ0qXybyyQQm5oA4giXO6JGU+SeS7
	0FJu6dqP//9zStsBoyvINcGzd7qlIBmVklEVfIuJSba+Lc3ZXkoVPO4SEZhbKnHzG5e7CVq5e4U
	IbfHO0o0Yg4XF68MCWqIkSeV13jhrjbcpNrQjCRDL55q6fCAtW+Cyd9/5dqbzcfCx9dcq1A+tjA
	ngH4LP3ylHQnQsZUYhVrVnNMkRAGjL5awlKVpccrZ42DUN5C9wgG1o5WgxIUPMSLaJ7et0IOWd0
	jLBHSV2MDFAKwA7oFjYqaZU4HfCNSaJjPQE1xAgemBrma0zcUxwAaSlOSV9NgK5EuBRR5VQF66+
	jxmr89ZiADWkeb1TYJuXT+99LvZFILNweNHEwA+qcgsBhD1wPB43F8SMvW6NTlARE/bEY7tM=
X-Received: by 2002:a05:6300:2288:b0:3c3:bfd3:4715 with SMTP id adf61e73a8af0-3c8ba649c71mr586021637.74.1785205814587;
        Mon, 27 Jul 2026 19:30:14 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2eb01aa0sm50360651c88.3.2026.07.27.19.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:30:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 28 Jul 2026 02:30:13 -0000
Message-ID: <178520581282.2826.2473657637363568103@92650adf53de>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/0d33d21e47d9dc66f91e44da3fc9220c74d93df7/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
origin: maestro
test start time: 2026-07-27 16:09:04.096000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  160 ✅    3 ❌    0 ⚠️
Tests: 	28872 ✅ 2453 ❌ 6648 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a679a3b798ea6c1ef7855cd
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a67a86d798ea6c1ef78c67c
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a67a86d798ea6c1ef78c67b
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a679f58798ea6c1ef78ad4d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a67a089798ea6c1ef78b426
      history:  > ✅  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6a679a2c798ea6c1ef78554c
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a6799c1798ea6c1ef785261
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a679ae4798ea6c1ef786484
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a6799d1798ea6c1ef7852e0
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a679a38798ea6c1ef7855bb
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a67a02b798ea6c1ef78b047
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a67a02b798ea6c1ef78b046
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a679a39798ea6c1ef7855c1
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a67a2db798ea6c1ef78bcc2
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a67a2db798ea6c1ef78bcc1
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a679a32798ea6c1ef785579
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a67a489798ea6c1ef78c134
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a67a489798ea6c1ef78c133
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a679a0c798ea6c1ef785453
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a679a33798ea6c1ef78557e
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a67a1f7798ea6c1ef78b9df
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a67a1f7798ea6c1ef78b9de
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a679a0e798ea6c1ef78545b
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a679a35798ea6c1ef785589
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a67a1ba798ea6c1ef78b9b5
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a67a1ba798ea6c1ef78b9b4
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_reboot-mode
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc6d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_abf0000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc61
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_ade0000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc7d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_af00000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc60
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc5a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_display-controller_22001000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc59
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc54
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc53
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc4e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae96000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc4c
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc4b
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae96400
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc4a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23000000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc45
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc44
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc2f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_gpio_74
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc2e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc2d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc2c
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70_i2c_1_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc2b
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_serial_88c000_bluetooth
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc29
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_ac0000_i2c_a90000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc26
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_gpu_3d00000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc21
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc0a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc09
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc08
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_20c00000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbf5
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_21c00000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbf0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbeb
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_2a300000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbdf
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_30000000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbd0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7100
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbb6
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1200
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbb5
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1200_pwrkey
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbb4
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1200_resin
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbb3
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_rtc_6100
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbb2
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbb1
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_2_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbae
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_4_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbab
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_6_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bba8
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_sram_c3f0000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bba5
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_system-cache-controller_9200000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bba2
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_aa00000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bb86
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wcn6855-pmu
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bb7a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a679a36798ea6c1ef78558f
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a67a504798ea6c1ef78c28a
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a67a504798ea6c1ef78c289
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a679a37798ea6c1ef7855b5
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a679f31798ea6c1ef78acbb
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a679f31798ea6c1ef78acba
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_spi_888000
      last run: https://d.kernelci.org/test/maestro:6a67a1a6798ea6c1ef78b8e9
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a679a24798ea6c1ef785525
      history:  > ❌  > ✅  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a679ca8798ea6c1ef789cf7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6a679d11798ea6c1ef78a4d8
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b604
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b5fd
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b5fc
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_9c0000_serial_988000_bluetooth
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b5dc
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_gpu_3d00000
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b5d3
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_20c00000
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b5a8
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_aa00000
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b549
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6a679a84798ea6c1ef785705
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:6a679aa3798ea6c1ef78581e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_59
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788ae8
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_62
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788afd
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_61
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788afb
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_62
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788b02
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_63
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788b09
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_64
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788b10
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788b39
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788b47
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788b30
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788b37
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788b3e
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788b45
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788b31
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788b38
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788b3f
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a679be2798ea6c1ef788b46
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a6799c3798ea6c1ef785267
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a679c08798ea6c1ef789616
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a679a6e798ea6c1ef7856bf
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6a679a7d798ea6c1ef7856f3
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a67a1a6798ea6c1ef78b913
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6a67a1a6798ea6c1ef78b911
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6a67a1a6798ea6c1ef78b910
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec5a00
      last run: https://d.kernelci.org/test/maestro:6a67a1a6798ea6c1ef78b90f
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000
      last run: https://d.kernelci.org/test/maestro:6a67a1a6798ea6c1ef78b909
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_ethernet-phy_1c
      last run: https://d.kernelci.org/test/maestro:6a67a1a6798ea6c1ef78b907
      history:  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a67a1a6798ea6c1ef78b8f3
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_eeprom_50_nvmem-layout
      last run: https://d.kernelci.org/test/maestro:6a67a1a6798ea6c1ef78b8f2
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_serial_88c000_bluetooth
      last run: https://d.kernelci.org/test/maestro:6a67a1a6798ea6c1ef78b8ea
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a800000_hub_2
      last run: https://d.kernelci.org/test/maestro:6a67a1a6798ea6c1ef78b844
      history:  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_aa00000
      last run: https://d.kernelci.org/test/maestro:6a67a1a6798ea6c1ef78b843
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.timers.timers_inconsistency-check_CLOCK_BOOTTIME_ALARM
      last run: https://d.kernelci.org/test/maestro:6a67a4ec798ea6c1ef78c22e
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.timers.timers_inconsistency-check_CLOCK_REALTIME_ALARM
      last run: https://d.kernelci.org/test/maestro:6a67a4ec798ea6c1ef78c22f
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.timers.timers_nanosleep_CLOCK_BOOTTIME_ALARM
      last run: https://d.kernelci.org/test/maestro:6a67a4ec798ea6c1ef78c247
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.timers.timers_nanosleep_CLOCK_REALTIME_ALARM
      last run: https://d.kernelci.org/test/maestro:6a67a4ec798ea6c1ef78c248
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.timers.timers_nsleep-lat_CLOCK_BOOTTIME_ALARM
      last run: https://d.kernelci.org/test/maestro:6a67a4ec798ea6c1ef78c23c
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.timers.timers_nsleep-lat_CLOCK_REALTIME_ALARM
      last run: https://d.kernelci.org/test/maestro:6a67a4ec798ea6c1ef78c23d
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a67aa6d798ea6c1ef78cb13
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a67ab14798ea6c1ef78cd86
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a6799bc798ea6c1ef785243
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a679bf4798ea6c1ef789123
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a6799cb798ea6c1ef7852b1
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a679d31798ea6c1ef78a6eb
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a67a389798ea6c1ef78bd4a
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a6799f9798ea6c1ef7853cb
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_reboot-mode
      last run: https://d.kernelci.org/test/maestro:6a67a01d798ea6c1ef78b003
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_edp_aea0000
      last run: https://d.kernelci.org/test/maestro:6a67a01d798ea6c1ef78afdc
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6a67a01d798ea6c1ef78afd9
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_9c0000_serial_99c000_bluetooth
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78afbb
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_phy_88e8000
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af97
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_adc_3100
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af62
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_adc-tm_3400
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af63
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7000
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af60
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7100
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af5f
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7400
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af5e
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7c00
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af5d
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7d00
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af5c
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_8400
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af5b
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_8500
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af5a
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_8600
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af59
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_9800
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af58
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_9d00
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af57
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1300
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af56
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1300_pwrkey
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af55
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1300_resin
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af54
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_rtc_6100
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af53
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_1_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af50
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_2_pwm
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af4d
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_2_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af4c
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_8_adc_3100
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af4a
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_8_temp-alarm_2400
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af48
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a600000
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af27
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_aa00000
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af26
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wcn6750-pmu
      last run: https://d.kernelci.org/test/maestro:6a67a01c798ea6c1ef78af21
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a679ce6798ea6c1ef789f4a
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a6799eb798ea6c1ef78538e
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a6799fa798ea6c1ef7853d7
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a679a74798ea6c1ef7856d7
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b603
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b601
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b5ff
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b5f7
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_ac0000_i2c_a80000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b5d6
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b5bd
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a600000
      last run: https://d.kernelci.org/test/maestro:6a67a0a4798ea6c1ef78b54a
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a679a26798ea6c1ef785531
      history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6a679d1a798ea6c1ef78a507
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a6799bf798ea6c1ef785256
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a679bff798ea6c1ef7893b4
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_cti_4b13000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc5b
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_displayport-controller_22154000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc58
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_displayport-controller_2215c000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc57
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_phy_220c2a00
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc56
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_phy_220c5a00
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc55
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc51
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc4f
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc49
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec5a00
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc48
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc42
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_a
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc41
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_4041000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc38
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_4042000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc37
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_4045000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc36
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_4ad4000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc35
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_4b04000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc34
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_4b83000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc33
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_6800000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc32
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_6810000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bc31
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_replicator_4046000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbc5
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_replicator_404e000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbc4
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_replicator_4b06000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bbc3
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_stm_4002000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bba4
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_tmc_4048000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bb9c
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_tmc_404f000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bb9b
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_tmc_4b05000
      last run: https://d.kernelci.org/test/maestro:6a67a279798ea6c1ef78bb9a
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a679cad798ea6c1ef789d0f
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6a679d1d798ea6c1ef78a50a
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
