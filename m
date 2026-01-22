Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C2938B7AC
	for <linux-next@vger.kernel.org>; Thu, 22 Jan 2026 02:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769049059; cv=none; b=htr7TNnciDE8EFed/yC/NIdkly/JvFOrcfHFRdvTHwe7oyS70+Cy3FWNNlMKBqpXG/X9PyHAIB8mjPme+364kMMZztceFk9gNSGt2vproh7NVh4W5Prcj5Q4f2rLz4GSjcrz2BOgVbmFKW6Mt4tvlsEXzZ9U9Jr8kKGhXeYDyMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769049059; c=relaxed/simple;
	bh=VEw4cSRg3xWchANiBXNYRvhpAUTYqvdnWznh1FsIlF8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=EvqYPWjBz8wOcmLf92lWo2ISovytTj25WP48SsSQoITJWadTaoDgzOZTMnuedw5gPGvv6I0C9xAOeQty2qmXY4jS1blSbXQrzquwZ2emZ9sv3MquZ/zWwgTm/o9Kn+GUKcODazh5Jsz5K9Buyau1lFbGsCQ2JZdg/AR8a/1M2hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=zeJYJIwj; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zeJYJIwj"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2b4520f6b32so737325eec.0
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 18:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769049051; x=1769653851; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSaKzW5en2yLOGVZ3ZtE3YbwP6GccfY+TrhTPgzKCig=;
        b=zeJYJIwjc4uk8qWcaFjxHP383z94zlXQZQ0loepUxulkeyYVT8S0h/wpMP9SyDvoZa
         oIW18ktmNflIOAZmIBLDUrkor+zDlxyqpJZzywAYb5vXgxGXYtUE5IfaUXpBFZ/z+lAb
         aL3t7c06UaEgF5iMglnF5F5UpPhmpavrtZ2AVN5b8IqUajG3qcLFI0Y30VBZtC4zfwxa
         BxDYDp73Tby5OZF/DNA928aLFoHqdVKxMVaZtbfny/gm+YX1onw1qjqb0Y5XnshQ+Vlw
         BVmdhWbgiDNuYsvZpdAzCEcWzyPpb8A9C5gwQ/jy4S9IURsVcVWNVV9iBO298x9XWzlx
         H4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769049051; x=1769653851;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VSaKzW5en2yLOGVZ3ZtE3YbwP6GccfY+TrhTPgzKCig=;
        b=pRwA0Ga9eiE0DpZmpY5pZwNpuHojWWIj1PBfF9Xt/g2MXfRbX/saB5xuIpt2zYrUgg
         W9dxzgIKUTFnsNSNoGQFmMnvsZRWLTVSphd55ZoP+/H4iE+yvFp6XtbE4TPL107PN0Mc
         urSUcAYryvXCcq48AXH4iD7Uz3BV/8FO08vvKeWoJRCsaLIjpbLB7M8sjWFzO/ijxy1a
         PvSA9R27Pl8fXEBcH0UKpSJYMHYmXqxfOzy1a8e5wPyZatV4UE1cTpliBNsuXHxFwEt5
         FrfnY3jQ1nKYWZsrkwIQh8UErwMis44JBDuZlsLfQFjuvx93h+Tqw/DfYvvcmEEOUGOC
         uWAQ==
X-Gm-Message-State: AOJu0YysI/EbZkg8vYBH3Jsc/rZgSCaAUQEKPBp6ZzdASIJXRbx96IRk
	/XpNkY23qH2621uha2qD0jP/jGyghT8jRIN0YlvzAYoo4pCldnOlBQrMJzzZwXcpe3Y=
X-Gm-Gg: AZuq6aIq5Ydqi+RRTHCp3RhfkhZ6gpgBSi1MHuBySpnWHWmhyGru/YaU/ypmwv9uGO2
	ApjAthmzzdWm6c1ddPqVoEe5+uFLgmoDiA1zfKfY2AdLnHVWBMx8EHgmXET6ZSATnH/ktl4lLAZ
	e1Qa1g94984jF4gd/lRd4BOsCeIkT0WMddA+coMM6JWr1fU4hEm43lnc8rgvcwZPf6TXGouUqnv
	jZZE3+AJP8prgzPGR6tF8vVfSvVN9i72yK7aIqEKDtboAi6Jr7zegevh2kSK7tSNVkd+57ijiqp
	+PbrGLiRMwyGjP/aEzPaYbuvb+G8nZxyCfI3x0rvTpriHm4HPR8MeYpKxlKw/hdNAtNKq0d8CCx
	nAZ5L2c6TSG+KQIj4ELrPpcUo01Z2DF5Bn51ZB+AlFQIZuOeWoxkRp+U+qQ9m4Y9J7qbQi2guEj
	nN7r2V
X-Received: by 2002:a05:7301:6087:b0:2ac:1506:c781 with SMTP id 5a478bee46e88-2b6fd607bdemr3208921eec.10.1769049051162;
        Wed, 21 Jan 2026 18:30:51 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af108absm26457009c88.13.2026.01.21.18.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:30:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 22 Jan 2026 02:30:50 -0000
Message-ID: <176904904989.692.1331364697473840286@22d5995788c3>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/e3b32dcb9f23e3c3927ef3eec6a5842a988fb574/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
origin: maestro
test start time: 2026-01-21 18:05:37.723000+00:00

Builds:	   53 ✅    2 ❌    0 ⚠️
Boots: 	  142 ✅    4 ❌    0 ⚠️
Tests: 	14175 ✅ 1491 ❌ 3913 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_av1_chromium.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:697134eeb2a19cc73abfa9a3
      history:  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:697133bbb2a19cc73abfa2bc
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6971413ab2a19cc73ac006c3
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:697141deb2a19cc73ac00e26
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072aa
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_emmc2-bus_fe000000_mmc_7e340000
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072e3
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_leds
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072e0
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-cam1
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072dd
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-sd-io-1v8
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072dc
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-sd-vcc
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072db
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_scb-bus_fc000000_gpu_7ec00000
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072d5
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdmi_7ef00700
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072c8
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdmi_7ef05700
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072c7
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hvs_7e400000
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072c6
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mailbox_7e00b840
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072be
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_7e300000
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072bc
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_serial_7e201000_bluetooth
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072b2
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_watchdog_7e100000
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072ad
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072ab
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:69713306b2a19cc73abfa089
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:69713507b2a19cc73abfab2e
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:697141cab2a19cc73ac00ceb
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:69714317b2a19cc73ac0169e
      history:  > ❌  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+arm64-chromebook+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69712bfeb2a19cc73abf7e2c
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69711d78b2a19cc73abf29ac
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:69714172b2a19cc73ac00bfd
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_7e980000
      last run: https://d.kernelci.org/test/maestro:697154bbb2a19cc73ac072ae
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:697166a6b2a19cc73ac0cb1d
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6971672bb2a19cc73ac0ccdc
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+arm64-chromebook+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.cyclicdeadline
      last run: https://d.kernelci.org/test/maestro:69712b77b2a19cc73abf7ce9
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:69712ff6b2a19cc73abf8eaf
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:69712ff6b2a19cc73abf8eac
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:69712ff6b2a19cc73abf8ea4
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:69712ff6b2a19cc73abf8ea3
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:69712ff6b2a19cc73abf8e87
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:69712ff6b2a19cc73abf8e86
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:69712ff6b2a19cc73abf8e85
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:69712ff6b2a19cc73abf8f05
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:69712ff6b2a19cc73abf8f04
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69711e63b2a19cc73abf3e0e
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69711e63b2a19cc73abf3e0f
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69711e72b2a19cc73abf403b
      history:  > ✅  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69711edfb2a19cc73abf41c6
      history:  > ✅  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69711fb5b2a19cc73abf43e2
      history:  > ✅  > ✅  > ⚠️  > ✅  > ⚠️  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
