Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FEE3655F6
	for <linux-next@vger.kernel.org>; Tue,  2 Jun 2026 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780367419; cv=none; b=aYbgz37aNoFT+h3JY+B+YGfHOaEXaF6w5vTlqKARBshTn/DuN3lwvn9mQT/YHDsfNbJYJJ42Z2X7MkBqKhPfNJjRmzxHQV2qT4DHjRH/1/NTpGnqLeZsk8esN1CPMtwoh7NfsAENU1K51oyWhM+4FjzVu9hA0TDytWKMzzRMKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780367419; c=relaxed/simple;
	bh=Me1ptz/HkKW57GTsrEgS0HaeAI6YUPQllJHAGFDzdek=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=QhqtHPAoO0K/40lsOkaerQBo3hS5k9ODYIw2SguG0UE86QmLpMC93lpBJ3mr6qRT4YnZIKv1LhvnLthhybttNHcR+MHU7FmsNSu8Qplpq1a3ILCl3XxWexgt0dddT3Hhwl0GzOgs6szfvUJpmqYW/s0bCNp1c52s3zBjcw7cw2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=iQn82k0a; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="iQn82k0a"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-137ec563a95so1428964c88.0
        for <linux-next@vger.kernel.org>; Mon, 01 Jun 2026 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780367415; x=1780972215; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2LAQlei1EfTGqqSU4X9JQHNnFntbHOQNIPFAbO2La0=;
        b=iQn82k0aY0/X90sbdlI1s8pXQnOUYnwxT3L9WlMF01HuIrEYIYW0JvmSlnv8y8dlp9
         750grInxdzDMiZZHVCballnsAgq91KdIqJ16RpxtTuN7QOS45XnoneMEf7wKBVHVu/JZ
         LKKPlOWx3CM7tSVXDRS6TsHPtEYqe3gzS2DWt4JcySdPDeZgkBEvHjWj4PhMtGZpF1K+
         D3tEhdp46bNgKYdwg7LO/KfBxzfBym33Gy5dMWbMUVserYHzS/bUmtiJ/alKku2gQhJk
         rKmoiXFX8EGgB+42iv5u3/SrX1xUH8FDWg5aMm/nKpoC8G4ylR3oUK2XqZhdmI1EDCjc
         E41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780367415; x=1780972215;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+2LAQlei1EfTGqqSU4X9JQHNnFntbHOQNIPFAbO2La0=;
        b=E3bqSqBAOAlcJrXCI8hzwfU8rEDGPKUAYQdRxSL8phIrQB2yXOJGOt6KpzyaSK/3sK
         L+CT30V8WzK/wQkF4FNB6B0yjJuXiqR6cOTJ0vJS9O7AFR3I4bg5LsN/52uRY4tbuFCu
         6Bfinb5kCbDZlqR7e/+VgkUPOTSPbGuxYFpWB65JpQ0npBJtUGVhuGlvRheinFjo2n1a
         TeGoxEQsMYqaeWLdEvFkgJV4dBIPzL2Xw5jtWdCnJHk1W1f1FTHAfUKrWMRJodKqhdm+
         X3/c0DzeKsPSomE9s+Xaxyky7MGdxWqrnjJhsQTGc0Dqzwawhz++a2U7f1/vRhLiA28p
         9RqQ==
X-Gm-Message-State: AOJu0Yy4F2NyV7+IUGQTnY46LlYoe0330F00i24wwIuLrlPakiMko6XB
	jtNYKHDAvHc8bxj4/YLGzv8YO22WHNRhrWu/rscWTUqI8kYOCtJskB5GKiIvgzSRNsQk/lfBr9e
	xVxcc
X-Gm-Gg: Acq92OHUyzNaqWhgDjnnM8wLUrimTqyh0c0ZIrs6ljSjxvd4q97voiHle0j3nZh/jiB
	Fw4LEEnrRuCedAbvhVy1DhYCEQd/HGBKt6iIeXD0AuL4Xng9ePpCc94+q7i3oDmCYiv4FbGjDwG
	rFq+MoOvJ1KtOl6Gj/HCcN0YkQwHUA2v6+ZsWOwas3vZb+0IaRK63SpGnllqqC355Vwi14i11dh
	lFEl5O3ObWuKoSQ/hpLUpI5odWINde+O/xqtpVOtoJUXJvaYrsZCe+Ps17sdbmf1qvvcOdh46iB
	NZ2QM9585d1N1fnvnNR44UG9qsCjRCeUVSAkb+b9WeYhgRTwPoqMHYMDB1VrdAdh5DXu1wwruNZ
	ICJTDm+seQ9ku2oeIV/ci90fP0QZhFsKJtZGWodUPA+sCrXhQ3KzcUlBdDUMvLLaqty99D/BriY
	lULz2Yus7cTUwXb612r6THWZbcFrE=
X-Received: by 2002:a05:7022:60b:b0:137:ef27:e29d with SMTP id a92af1059eb24-137ef27e692mr682004c88.31.1780367414681;
        Mon, 01 Jun 2026 19:30:14 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm7562083c88.15.2026.06.01.19.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 19:30:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 08484c504b55a98bd100527fbe10a3caf55ff3ff
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 02 Jun 2026 02:30:13 -0000
Message-ID: <178036741335.9044.13066260456340942378@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/08484c504b55a98bd100527fbe10a3caf55ff3ff/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 08484c504b55a98bd100527fbe10a3caf55ff3ff
origin: maestro
test start time: 2026-06-01 17:37:18.084000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  159 ✅   51 ❌    6 ⚠️
Tests: 	18024 ✅ 2938 ❌ 3159 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a1dd5f42cc72b6e94ae6542
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a1e198e2cc72b6e94b037e1
      history:  > ✅  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rtla-osnoise
      last run: https://d.kernelci.org/test/maestro:6a1ddd1a2cc72b6e94ae8cfb
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a1ddd032cc72b6e94ae8c96
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a1ddd8a2cc72b6e94aeb18c
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_17030000
      last run: https://d.kernelci.org/test/maestro:6a1dccfa2cc72b6e94adea55
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_vcodec_17020000
      last run: https://d.kernelci.org/test/maestro:6a1dccfa2cc72b6e94adea12
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_16020000
      last run: https://d.kernelci.org/test/maestro:6a1dccfa2cc72b6e94adea11
      history:  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: aws-ec2-arm64
  > Config: defconfig+aws-ec2
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1dd23b2cc72b6e94ae51bc
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1dd5e52cc72b6e94ae64fe
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1dd4182cc72b6e94ae5afc
      history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1dd5862cc72b6e94ae60f0
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1dd4232cc72b6e94ae5b38
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a1e1c192cc72b6e94b047c6
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1dc9522cc72b6e94adc902
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_backlight_lcd0
      last run: https://d.kernelci.org/test/maestro:6a1dccfa2cc72b6e94adeaa5
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a1dccfa2cc72b6e94adea6c
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a1dccfa2cc72b6e94adea60
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a1dccfa2cc72b6e94adea44
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a1dccfa2cc72b6e94adea43
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a1dccfa2cc72b6e94adea42
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a1dccfa2cc72b6e94adea37
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a1dccfa2cc72b6e94adea36
      history:  > ❌  > ❌  > ✅  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
