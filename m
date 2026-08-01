Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81E139CCFB
	for <linux-next@vger.kernel.org>; Sat,  1 Aug 2026 02:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785551419; cv=none; b=UD5knmezcz+7TWJfp0rJ3Z6h9AoHL9tEosZ3wAkUCWlx1VXp3SsVnyoJW9JqZO1wGbDklHz2ESQCQEZtncO3eerYubFlX04Y8Et++F56VorfbN57TWc7qRlmGZ6bjz02fSl1yDIW/P34a0h2hw+ytX5WwOs17zHyYWtpeTPRytA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785551419; c=relaxed/simple;
	bh=l6w9991jLpajFgvNUPyjakQO5aJHmNiFkF+9sImlan4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=HAwxlOSj+NmJx3U4jRvFNIQ8u2jfNww14ml+5cKchfABBDWTyQDpstPqXgMSn/yvpgo3U7nYTVn0P7TS56muZ7tRbe/wDhqutC8miBnNsnk0e6aFcXJTD9doif96Yx2PQVmYqosUDxx7V/EsFcJoGVsrFX97mzzCCPRe7Z5XwwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=U1m4xEp0; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="U1m4xEp0"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1312379a91.0
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 19:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1785551416; x=1786156216; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fbHJIdsMuhjqsrX6YgI6RR4eSAxNLM+EnA1zlCxUhJE=;
        b=U1m4xEp0hL9UD1sag9nZbOamn0D7kWD1aG5oQS/H1wQVTDySj2wiWRYG/huTTAUjg1
         sLrJSz8vNYxg0PCrJvwS30rutfUtrgWJnkEukWPtocROqVwxKy263iuz3+jdCtgV9MQb
         QoTtXJpYp8EIIfD7zWwrMPGAL2C64DWt589TSpWV9gAibXEMlzSnkg1oaEPE7AMEn+8D
         7kE+xYZPsGXXsGHlXYsGiNNbyG0cyMFxLwA24xf6GxSSGKkAvG0SrWLVsG85Dj6zEkQ5
         o0EnxaljDj4Sel8qzcn1sbKxF0fRwVtK0gjV20j+tu2E8e0TD5wFXmCdL48n4YGsP6UX
         Fdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785551416; x=1786156216;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fbHJIdsMuhjqsrX6YgI6RR4eSAxNLM+EnA1zlCxUhJE=;
        b=G7HMCcL0G44fnfhwkInx1gQFpDpKRdfmpr85AM2NhQ4KbWfSkP5Dx+cgd0/I+T5YB1
         NPkAkoI6PgR4TJun4UNXOxIk1+fMaayK4fm4bFvhpMqnO63McRpwQTV4xvA7BxI0g/nw
         I+vxRGfK56Ul7vM/JdbPGaipxNf6/WjTkokJjpIqPLsSRQIvy6BtlhUF8Q9DXzXC0bUH
         VCIKU1XMg/MjKEKGqyjX6UcpW9hr7utq1hF8rux77jsMNJ+pZkNlVlh6QxtFQIXHQTNA
         OSFSvbWTnjvZyR4ahaD2382TXAMkq0V2WTlHDQzjHfozf/WCNNE8QF98811ruDYP88Um
         QwJw==
X-Gm-Message-State: AOJu0YyBeLKloQRGh5/yPdtfpyQE/gXFMttYsphZdpsWDjQBcRwhgfRo
	gjLmS22uKMuz+eO2/9kto3vK55L5a+8htfISkn+vdDtzBN7bP+VidT5d/sfrLeW064OEu1e5/7u
	D5YGm
X-Gm-Gg: AR+sD12wzgVxAb+tQ4j+6bEmXhCVMJdf8vMNqssBzbpodZW1v2Cin5AkAcXoenjL8FI
	ZmmttbPo2twlxQvzis3Ppn4axPwW4r2liTKY1I8U7uDmHpXRsnhBBpiQO/oUF6UNNU1Ssji0DPM
	DjjOj/zv1eSQASkgWvnz8VQC8xPp+6jYiaUmLOi/mhI+6sk6nzYym/u2S8okB5DBpuAoZLrJt2p
	+4B3mNMCigL3sn8utRBdOw3hnDo0xcB+1FmIGbtZJKv9HFKylREjR3PG1/8F/J4eIx/qj0j71br
	qp6falhVJ7/8MDC1+Y/1zw1MoDM66t2rF+d0rJDqPhHbvGn73t4SMzjkHRd9IFi5YXzm6B/kCjr
	pV4DsT0c9xwedrJAB+x1dQQLPmYFfSblx3dm/spQ2MFiDNORqOL5S5DSJf5JUyLh8soEYPqAe75
	3UGX6tYA5TiNQnc77en3KY2JbCh9byqi9w4+Is9y+cgKHr92p6ZUONNw==
X-Received: by 2002:a17:90b:4b87:b0:38e:6ba9:5203 with SMTP id 98e67ed59e1d1-38fbc4bc14emr1714158a91.22.1785551415651;
        Fri, 31 Jul 2026 19:30:15 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab25227bsm7744585c88.7.2026.07.31.19.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 19:30:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 415606a7be939835db9b0d6b711887586646346d
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 01 Aug 2026 02:30:14 -0000
Message-ID: <178555141434.4752.6282888694802240766@92650adf53de>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/415606a7be939835db9b0d6b711887586646346d/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 415606a7be939835db9b0d6b711887586646346d
origin: maestro
test start time: 2026-07-31 16:24:32.848000+00:00

Builds:	   71 ✅    3 ❌    0 ⚠️
Boots: 	  181 ✅    3 ❌    0 ⚠️
Tests: 	32726 ✅ 5671 ❌ 6886 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_spi_888000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855013
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a6cf76454179f15da831c61
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a6cf76454179f15da831c6e
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a6cf15554179f15da828769
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6a6d0f2a54179f15da845f9e
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a6cf17454179f15da82895c
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a6d1e6254179f15da84f8ee
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_ac0000_i2c_a80000_touchscreen_38
      last run: https://d.kernelci.org/test/maestro:6a6d157054179f15da8471b3
      history:  > ❌  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a6cdbaa54179f15da815b46
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a6cdb8154179f15da815915
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da85503c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da85503a
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855039
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6a6d1d5254179f15da84ef6d
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a6d1d5254179f15da84ef6b
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6a6d1d5254179f15da84ef69
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_ac0000_i2c_a80000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a6d1d5254179f15da84ef40
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a600000
      last run: https://d.kernelci.org/test/maestro:6a6d1d5254179f15da84eeb1
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: gs101-oriole
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a6cd49354179f15da810686
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a6d25a054179f15da857474
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a6d2ad454179f15da85c314
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a6cf83d54179f15da831fb1
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a6cefb854179f15da8282e8
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000
      last run: https://d.kernelci.org/test/maestro:6a6cf37854179f15da828cf5
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_display-controller_9801000
      last run: https://d.kernelci.org/test/maestro:6a6cf37854179f15da828cf3
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_dsi_9ac0000
      last run: https://d.kernelci.org/test/maestro:6a6cf37854179f15da828cef
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_dsi_9ac0000_panel_0
      last run: https://d.kernelci.org/test/maestro:6a6cf37854179f15da828ceb
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_phy_9ac1000
      last run: https://d.kernelci.org/test/maestro:6a6cf37854179f15da828ce9
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a6cdb8254179f15da81591b
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a6d17ac54179f15da847a3e
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a6cdbc754179f15da815d76
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a6cdc2e54179f15da8162ef
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6a6cdc3d54179f15da81631b
      history:  > ✅  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_audio-codec-0
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855080
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_audio-codec-1
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da85507f
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_reboot-mode
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da85505a
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-usb0-vbus
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855058
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-usb1-vbus
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855057
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-vreg-sdc
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855054
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_abf0000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855047
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_ade0000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855046
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_af00000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855045
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec5a00
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855038
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855032
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_ethernet-phy_1c
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855030
      history:  > ✅  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da85501e
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da85501d
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_eeprom_50_nvmem-layout
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da85501c
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_gpio_38
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da85501b
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_gpio_39
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da85501a
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_gpio_3a
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855019
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_gpio_3b
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855018
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_serial_88c000_bluetooth
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855014
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_gpu_3d00000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da855008
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pmu_9091000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854fe5
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pmu_90b5400
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854fe3
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pmu_90b6400
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854fe1
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_regulator_891c000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854fdf
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_21c00000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854fd8
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854fd3
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_2a300000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854fc7
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_30000000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854fb8
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_rtc_6100
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854fab
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854faa
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_2_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854fa6
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_4_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854fa2
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_6_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854f9e
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_sram_c3f0000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854f9c
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_system-cache-controller_9200000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854f99
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a800000_hub_2
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854f7c
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_aa00000
      last run: https://d.kernelci.org/test/maestro:6a6d22a954179f15da854f7b
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a6cdbea54179f15da8160d7
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a6cdc0754179f15da8161c7
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.timers.timers_nanosleep
      last run: https://d.kernelci.org/test/maestro:6a6d236c54179f15da8555a5
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.timers.timers_nanosleep_CLOCK_BOOTTIME_ALARM
      last run: https://d.kernelci.org/test/maestro:6a6d236c54179f15da8555a8
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.timers.timers_nanosleep_CLOCK_REALTIME
      last run: https://d.kernelci.org/test/maestro:6a6d236c54179f15da8555b0
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.timers.timers_nanosleep_CLOCK_REALTIME_ALARM
      last run: https://d.kernelci.org/test/maestro:6a6d236c54179f15da8555a9
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.timers.timers_posix_timers
      last run: https://d.kernelci.org/test/maestro:6a6d236c54179f15da8555b1
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a6cdb8e54179f15da8159f4
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a6cebb954179f15da8217ba
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a6cdbcd54179f15da815ed0
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a6cdc3454179f15da8162fe
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6a6cdc4254179f15da8163cb
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a6cf17554179f15da828962
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
