Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D78207DF7
	for <linux-next@vger.kernel.org>; Wed, 15 Jul 2026 02:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784082646; cv=none; b=NUzZRXzV+xbula7rCXzyBrQlRgaEZ5CyNZWguLJw6p+3lULLuEiGzvUjl92tM7meVdMlIHtf1QL1uVBsolz4BFKKO8/VGrhOTxUY/m908cz30GmUCBSoounLfQtFv/HAy0rhozz7dubYuW5U4lVbPNgAspWKa0HhfMfJZotDTlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784082646; c=relaxed/simple;
	bh=a0H1lpx/vuSzOFrzTQFVeLBYtPCazpWHHOlZWClhilQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=tJC58gD8msN/8URkepexmCQG8RotxNyxDF/kjeYGWVH17M8p6i4zVjXNtR4pNp6Ku8Mc9gIj4OuW/8uB6w+iwr8LL4JoTXNlB8WstbGkBPkUG2SkqcMPzfqjyOhMYdI2elsqexn5GL3ajisA5YBd/rdDTSZSgJrJyyt+FZwOvOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=gXggg4tC; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="gXggg4tC"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1016539a12.3
        for <linux-next@vger.kernel.org>; Tue, 14 Jul 2026 19:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1784082644; x=1784687444; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V9GaYZ0PGi1ob3jwAcIyuwO4F1JdEB1nQ0AM1L0jZvg=;
        b=gXggg4tC5igKKxkY9RS4QUWDtSnE/nO0KUmv3FW2sq6qY0XXJitptfqEhK+NfRknIh
         i2e6+9Qpq8plQN6PuWx8THqe5LaGhjqFgEjmnPe78WXKJV1nyFk+afDl5Rjq+cLSbR73
         kjgIDv+Y/5OYi1lwKq7pIXDfdaaWqlpzd8MKm/h3705AvNgRVDLlBqzdAGYTQGmvl05v
         Te5ZH0elMKyWPm5y+dIhRtWhqttZ4/3/FaRwTcV50MtmXX+8kftW/YYvXZhMlWea8mWf
         bSQnuq5baBPv+ILMnwqx0E5wPSBAgaR/OR97xqdQ3nU9F2FZeS2GSj3agr0P6shKadH9
         yqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784082644; x=1784687444;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9GaYZ0PGi1ob3jwAcIyuwO4F1JdEB1nQ0AM1L0jZvg=;
        b=U09WIfq2LADwb7B6CQPyXnj7N1PR7P/1gFIcXzgRn0ZximAmck28s2QgFbCn/R+oxB
         qjipowBm0NoqQMqp6Vgk4KntR23ZPfUaQD9J7WvdlviAypBBUOHSaoWUUoAzevgzyHtT
         jx0sVpCfmW05KOSK74tyOM03OqVtwTkbHjhr1vRkE+aKgRzDNoWyMCzPXNO1L9eept48
         VRsq63/Uk2WwoaEqlV+HeBMPutTrlAb69UuakeTLcaelfS9KJh2CZzBJH5VuWdP0BeIB
         WoOe69wRAiLwVHwE0LdjjQa/XOoUb7xPHyM35naaoicDnw7E9lgvY4s+03BsmEhyrgxX
         u+Ew==
X-Gm-Message-State: AOJu0YzHa/lF3y3c0jofxkM0SfukrjuzCG80/tyKDOyzWa042C1gaAjQ
	OySPCTJgHXouJa+xORCoDDCJ6x5Uo/wyhN1MK8X+rPCHMjkBhUF6xjUrXdtPNNbmLh0=
X-Gm-Gg: AfdE7clUJnhOjjoQkHxHXa5KeqLEhdMioCCq/ivFxcXW+ZDwhyNSck8g4Wxbk+eDCqT
	0+goEc4TWl22yUcMPGMJKtYr5TWjFcM77y06ioy2Oq1wMy+Rrrg0lpM8kCycmsiRag8I1nVg+C9
	Bmkhpx1CejQfu7jRoc95ZpiVnL3sbcebYkDrs2qwiyh+nhvggSBFljj7DeHM0gIERc+PasTBdFj
	/0VxChi6h4xagtT02JDVbQNHh3lozpdfZ2nLH1UkX4G5d18w0Kf4x+3n4E2gbOVFkaBpJlmigBO
	DtSj6KQvfPQ7oGhYs5gr4bwb92j5QvYWToAT+frIYBq/6QwKg7QFVJiJ1ynmutSGRAJmxCwZ+Hl
	Awu662UOTS2CS0eDlJ47FlI6fHISSSe/A+yAfOQt7gl3KgI+OT2+C9K6pYFNu3t+HbP1SULVUGI
	36MvxEOg==
X-Received: by 2002:a05:6a20:9595:b0:3b4:7eb0:47aa with SMTP id adf61e73a8af0-3c1108c1ef5mr17281582637.25.1784082643737;
        Tue, 14 Jul 2026 19:30:43 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm56379695eec.16.2026.07.14.19.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 19:30:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 15 Jul 2026 02:30:42 -0000
Message-ID: <178408264244.10740.10197980822689432541@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
origin: maestro
test start time: 2026-07-14 15:53:59.312000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  167 ✅    2 ❌    0 ⚠️
Tests: 	27164 ✅ 5168 ❌ 4602 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a567dae18a4add13544dd0d
      history:  > ✅  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a5666fe18a4add135431d6d
      history:  > ✅  > ❌  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a56671518a4add135431d89
      history:  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_4080000
      last run: https://d.kernelci.org/test/maestro:6a56643a18a4add13542f9ae
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a56693318a4add135432195
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a5672b018a4add135440499
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a566a4f18a4add13543302f
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a566a4f18a4add13543303d
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a566a4e18a4add135432e37
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a566cca18a4add13543580b
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a56645b18a4add135430035
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:6a56645b18a4add135430031
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:6a56645b18a4add135430029
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a56645b18a4add135430028
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a56645b18a4add13543000c
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a56645b18a4add13543000b
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a56645b18a4add13543000a
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a56645b18a4add13542ffff
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a56645b18a4add13542fffe
      history:  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
