Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96741A9F83
	for <linux-next@vger.kernel.org>; Thu, 26 Feb 2026 02:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772073025; cv=none; b=b9gvxfQEMqVv1vco7nFnSeLM0diDmvFmscZ05xpLqgGaBcG7rElunjVv34Op5gHd5gKyz25XXb/YB5tG0Cr5vqQoDdeGvd7t5QQ1f3q37bwij68VNADZarccglUaiN9Pzmula3bKVkAV3nkeTvBs3dsUTknsPuuJu73PZzLcKuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772073025; c=relaxed/simple;
	bh=pL87L5mBaYNbPnU4fVAmLhXiEpZSw8q/B6ti7x9OD6s=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=gw0Raz5ztMMrMzGQfHeUt+3OBQOFKr/GlbC9wLjq1C1HEvQzAdmoRLGlzk800HRKRLslYR7iT0BxVzQr0qM6oGP22SFhTKT1aR+VcQAAU40SANhgWE8QVFjOUhT522/G3S0tlGVpKthAyVdhIA9TZi4jEs9j6cpWm5EjKJDmuAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=2lBSJhU8; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2lBSJhU8"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso316005eec.1
        for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 18:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1772073023; x=1772677823; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGW+XpqD8DO9k88fnhO6JmRZ6Z7DpWbrchx87YluiDU=;
        b=2lBSJhU8GiLxWalWOsBtKGg1oDghvlRfIL19FT6q6wpMOS36rp7Wz2gU7y/SsDsC9Q
         DXAcrWecr5BGE8bKUvLeebHmCZWnGc7nuFDpJfflYbDXqVFKn8kmo3HGhL18touDy+Hs
         Cul18SAeknv7F4CfEy1gBVBTSjZkdMv9k3iALtcUwRWRwFWkU1pEnAa6YPBjmoU4sqwT
         rzUfWT1uylb3Vl/a89O9xH9ebg7QDujpK1cpp8NKwUKZx2pAp/kD7gn6UAKkI+ByLMMu
         n8aDFi+Nu2jRsCiaCXhxRq8+Q1PcYuaWeQmRQFt/91iLPT6fi3NkB/jr8D+O4+iYEVd6
         L7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772073023; x=1772677823;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGW+XpqD8DO9k88fnhO6JmRZ6Z7DpWbrchx87YluiDU=;
        b=Q0G26Srx6IQT4DapuE7CF0yNdfIEIIGwSj9OjCR6eZAnJfiB2dW865Ema5UebbnFDN
         lukvQ1bSSXT7Y9RH0KYpba8PDXH7XXTcmyoo4qMaij/cvK6Hsu30jatzv4EIxsNJf9na
         6XiT9W/S3fWBl5026VTKRFLAEzGDMa0MnVjYaO3918HfLGng+w4QfOV/4Hagj0o74LOM
         H+vIm3L3MUh9K9qlfDF/7nw0Y8sWPvp3wfmdX3OUv5P8I25LWMeeUwerX54AeE25dn6e
         7VxkZW8Yx9sRy6SOt4UWaFfFuSBeslC/Ptps5+RN/q1U4pG75KzgtM8dEseNxIvQR/fz
         ojYQ==
X-Gm-Message-State: AOJu0YycOv/qkGoIPdgmmD4PYHjxY6YlF1vbpjoUyp8EDZM6B4D4QPTR
	KE5T58sbhTf81FbuSgjPEKgQqcIcTEXGGf7w++hJxxvxEyxyBVwZkeLWrapFMFwPl/rR6lnVCrl
	IjC824OE=
X-Gm-Gg: ATEYQzxTYzsiufXTf/5JwEWEO49EgfR8uDxX79IWyA7n4fgHBEfO38x36zUVBRSJDfG
	MHDQSWcLkQkN7TuplGwxrdE0oKtdlUFDUQXGgP6pqiaIfKu4SOrREZmVAUdMyVKP1RZL+BF0jJo
	tHjn3kfNwsisyDB3AnSRx8BA2pVnofPzM6E6hEEOEaV+coLoG62T1jYg3yt/KfIU6AoK1SP2yUe
	3Yv2STi6aB7j14HNZmgISrgujrTjOf69rF/W3+by/Fq768G0DlFKaaF93gkz7Z7Cq/yAbuiO4mf
	CC6StO0MIEPyU62FXigspdjJfdRojW5Rh8heZ0+hrR8zugCHq1ctbn+1QPMMj6Mn5wLdD2dD39y
	1fEBM5I+4oqnGhkzdKiNUhnYfSD+N7dLa+8OSeov9ljDP4kKFMD1rbRWPtqnjzhIoeQ1zgdaXaj
	8EXo1SQcKURDUaBqz4
X-Received: by 2002:a05:7301:d1a:b0:2bd:b2c9:851c with SMTP id 5a478bee46e88-2bdcc070e66mr1469513eec.30.1772073022575;
        Wed, 25 Feb 2026 18:30:22 -0800 (PST)
Received: from d14e337afe00 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1bcdd95sm693120eec.6.2026.02.25.18.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 18:30:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 877552aa875839314afad7154b5a561889e87ea9
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 26 Feb 2026 02:30:21 -0000
Message-ID: <177207302161.3069.10903750596471671088@d14e337afe00>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/877552aa875839314afad7154b5a561889e87ea9/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 877552aa875839314afad7154b5a561889e87ea9
origin: maestro
test start time: 2026-02-25 17:42:44.214000+00:00

Builds:	   57 ✅    4 ❌    0 ⚠️
Boots: 	  174 ✅    9 ❌    0 ⚠️
Tests: 	17101 ✅ 2658 ❌ 4829 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_av1.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:699f62ef1f24bb69463b807a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:699f61841f24bb69463b6e3f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:699f40f51f24bb69463aae66
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig+kselftest
    - Architecture/compiler: arm/gcc-14
      - kselftest.ipc
      last run: https://d.kernelci.org/test/maestro:699f3d2e1f24bb69463aa59c
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264.JVT-AVC_V1-GStreamer-H-264-V4L2SL-Gst1-0.CANL1_TOSHIBA_G
      last run: https://d.kernelci.org/test/maestro:699f610d1f24bb69463b6044
      history:  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:699f40df1f24bb69463aad68
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ipc
      last run: https://d.kernelci.org/test/maestro:699f46501f24bb69463af3cf
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:699f40e41f24bb69463aadec
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig+kselftest
    - Architecture/compiler: arm/gcc-14
      - kselftest.ipc.ipc_msgque
      last run: https://d.kernelci.org/test/maestro:699f9b5a1f24bb69463cf85b
      history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:699f3d441f24bb69463aa5c7
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:699f9f931f24bb69463d09e0
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:699f9f931f24bb69463d09e1
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:699f571a1f24bb69463b25b0
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:699f56041f24bb69463b1fea
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:699f5a781f24bb69463b38bf
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-pcie
      last run: https://d.kernelci.org/test/maestro:699f888f1f24bb69463c7b0c
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-usb-hub
      last run: https://d.kernelci.org/test/maestro:699f888f1f24bb69463c7b0b
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:699f888f1f24bb69463c7ad5
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_33800000
      last run: https://d.kernelci.org/test/maestro:699f888f1f24bb69463c7aa3
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_1
      last run: https://d.kernelci.org/test/maestro:699f888f1f24bb69463c7a9c
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_2
      last run: https://d.kernelci.org/test/maestro:699f888f1f24bb69463c7a9b
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:699f610d1f24bb69463b604b
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ipc.ipc_msgque
      last run: https://d.kernelci.org/test/maestro:699f5ba81f24bb69463b3dde
      history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:699f44261f24bb69463ac628
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:699f46191f24bb69463aeb9d
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            

### NEW BUILD ISSUES
- Issue: maestro:acf8242e63eea4d9f840982fc65be8d739de5428 | version: 1
  Build: maestro:699f38261f24bb69463a9fd2
  Comment:  ./arch/arm64/include/asm/vdso/gettimeofday.h:89:44: error: initialization of ‘const struct vdso_time_data *’ from incompatible pointer type ‘struct vdso_time_data (*)[]’ [-Wincompatible-pointer-types] in arch/arm64/kernel/vdso/vgettimeofday.o (scripts/Makefile.build:289) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-02-25 18:08:25.114371+00:00
  Culprit: code
- Issue: maestro:dc8172b1090ab934a0e5bf70ede907ed6caaba80 | version: 1
  Build: maestro:699f38921f24bb69463aa0f4
  Comment:  undefined reference to `__udivmoddi4' in vmlinux.unstripped (drivers/gpu/drm/amd/ras/rascore/ras_core.c) [logspec:kbuild,kbuild.compiler.linker_error]
  First seen: 2026-02-25 20:06:39.065924+00:00
  Culprit: code


This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
