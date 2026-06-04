Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8786038D017
	for <linux-next@vger.kernel.org>; Thu,  4 Jun 2026 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780540221; cv=none; b=ix0M3wOLQ+0vN0yV+S2o2x2OFNSRHLY8AvggIpfPrP0aEtHSXVV2jk09fmNOivClPTZUMjtFbfBzs6N4JV1xNY67zX6jkLaKwIs7VABr8qY84ELC61FANYK8UZ0ktfQw1AONYhVrfC8NyOlkWBBsYqEzA66ecdSRFrOzYM7StZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780540221; c=relaxed/simple;
	bh=NX2zfHciq4AbmcqHv1WPg+KKBSymsQzc2DQ5tVOO54E=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=t2TNVdoMutQ+onOoul7ChzT82QAYolGAayoJmwhj7bpyhrWnVKq30kqfeNuvIGkFhFgow5tFBT4n8m2960ZVKXIwg3ftek7IY2f69VqyY8YkOq23tHCqD1sqrTfTWnYzawDTCma+HvR/mWU5PetjS/LrWaybsFGRBIOrlaawbes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=ZD0iw0iO; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="ZD0iw0iO"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30749947917so399252eec.1
        for <linux-next@vger.kernel.org>; Wed, 03 Jun 2026 19:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780540219; x=1781145019; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfkkUxPxsfUKDlRfNum56OboV3psiAox4uvUCCSmgpY=;
        b=ZD0iw0iO0rt/TSOIWrKAd5UF3Fw/aJwZPAEbf29NMAmRtmVCfJS/lda3lLyhhDFfte
         ASOl4yupeh3DGqSmqWrkJQRC7XyfaPwPtMHNpn58d/4OyoJ046SMCOMg0fb32UhZ4yhu
         IJ9ob1OoTDQ2lcGx0YmIAOheSMAFa5nR+Opd66eVL+Mx3/EKi2VrDjKrtT0Qj9EPsXeX
         Sp1MzDqngdYXaQHtzAr2cx567X9hnKfaN1Csi6tYYFCcD/Ur3wNasnHQMRAN2ELOtYnR
         gR0HbQ5yWUhe9e06P1lsl7Fhjgjc7dJaWXjFERTbosiyCxeyxUKgqOfWpG+FIHFC0ov+
         Bi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780540219; x=1781145019;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NfkkUxPxsfUKDlRfNum56OboV3psiAox4uvUCCSmgpY=;
        b=h+YFEu5D/JHLQKNBej1Dq328kp2AwetLrmKdzY6PbOdqlt22cNmQIdVQ2DCjnAPGGT
         OH9n80l5lRTqhByfHrzyA4ZvUjHNifrNqgiMdyx1Tt9DxPvckNIasE5VBi+Bsgyh10iE
         KtO5y+VQCVJ4QIC8kmlbui/bz+2p0U0xb61CCGEz9RDqbmlSmPsAOGhcTlmkv6ZXth1p
         xyaYnpDv9ryVWka4IsebTfsfYWE9XXES/+eZoL30GdtmpZVNKLf+VetBXl64tgAv0rXm
         mHtIHklZ0hyIq5zOwjvsJFRDUXdo+EHo+L+dTdoU6+7PKAviXsLGr7li7s2N6rflrEBs
         0b3w==
X-Gm-Message-State: AOJu0YxhPBgAOX9AVkKxNXO3AYXTS/u5XFfyRhp/gsvYfyIW4uIZ+Tcw
	49pDNTilbOOB1X+sLqP334tMD+4gZ8jHIqT4O4GvlVEgiJAx2tcgWnrFoT5b8EZs6COUn+KmXs0
	0diTI
X-Gm-Gg: Acq92OHEW1BujL+OhqvmqxWwRPaGBE16yLau/KNqqYuDR35pNOh3zVZBDKkTtc5xHtQ
	Ov4w/ZVSRJ+9Bs3G9o3P1wxi6763ep4ewpRYXfDatUWg8KdQqI8E4pazf+hesFGUMN0+DthGAKG
	Hn3OezqLVSgRJ8BNCqHF8igeYDVZyBxzxYzqNzs7gVnGPQ0DPmiwDZ12WOsjXtSutLYVbmK70bA
	PBsDqO66O2g2KONlwJTkj9UdPjS9aKPyl95HUwwOjN1gtZCqEgMOJs6v84z441K3TKyAGJ2wQho
	/DkoIgEgOeppHG2w9gJTZXqPcOQ4JdQqSGE9oDtYFgBVehTsSMdY+Pj9UOveUbqbxbv86ibvuYm
	5mc7fcAnW5Dm9TbzKCPer+8jJNyys65uLiSuYGGqaftucB6Zgai32tHVmw/L0iAv/t2ide5ctYm
	Lx3m+yR/wapONSvB7MQ1thSKCgSbA=
X-Received: by 2002:a05:7300:ec01:b0:304:c651:bdfe with SMTP id 5a478bee46e88-3074fbbc0cbmr3201381eec.17.1780540218541;
        Wed, 03 Jun 2026 19:30:18 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85e10sm3870566eec.7.2026.06.03.19.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 19:30:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - a225caacc36546a09586e3ece36c0313146e7da9
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 04 Jun 2026 02:30:17 -0000
Message-ID: <178054021766.9965.7786284060042634257@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/a225caacc36546a09586e3ece36c0313146e7da9/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: a225caacc36546a09586e3ece36c0313146e7da9
origin: maestro
test start time: 2026-06-03 20:05:57.204000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  157 ✅    9 ❌    6 ⚠️
Tests: 	18385 ✅ 2712 ❌ 4183 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a2099da2cc72b6e94bb7850
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:6a20a1772cc72b6e94bc385b
      history:  > ✅  > ✅  > ❌  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kernelci_sleep
      last run: https://d.kernelci.org/test/maestro:6a208ff32cc72b6e94bb150e
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-1
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b42
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-10
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b39
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-2
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b41
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-3
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b40
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-4
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b3f
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-5
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b3e
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-6
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b3d
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-7
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b3c
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-8
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b3b
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-9
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b3a
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-1
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b4c
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-10
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b43
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-2
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b4b
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-3
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b4a
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-4
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b49
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-5
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b48
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-6
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b47
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-7
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b46
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-8
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b45
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-9
      last run: https://d.kernelci.org/test/maestro:6a2094c42cc72b6e94bb2b44
      history:  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a2099b12cc72b6e94bb7762
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.clone3.clone3_clone3_cap_checkpoint_restore
      last run: https://d.kernelci.org/test/maestro:6a209cb12cc72b6e94bbd94b
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.clone3.clone3_clone3_cap_checkpoint_restore_global_clone3_cap_checkpoint_restore
      last run: https://d.kernelci.org/test/maestro:6a209cb12cc72b6e94bbd94c
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_17030000
      last run: https://d.kernelci.org/test/maestro:6a2097d32cc72b6e94bb3c43
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_vcodec_17020000
      last run: https://d.kernelci.org/test/maestro:6a2097d32cc72b6e94bb3bf9
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_16020000
      last run: https://d.kernelci.org/test/maestro:6a2097d32cc72b6e94bb3bf8
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a20998c2cc72b6e94bb74ad
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a2099b52cc72b6e94bb777f
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a209cf82cc72b6e94bbdba7
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a20953b2cc72b6e94bb2c5b
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a20953c2cc72b6e94bb2c5e
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a2099922cc72b6e94bb74ce
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a209a972cc72b6e94bb7e89
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a209ec62cc72b6e94bc2e5d
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rtla-osnoise
      last run: https://d.kernelci.org/test/maestro:6a2093712cc72b6e94bb26e4
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a208fee2cc72b6e94bb14fc
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a2093592cc72b6e94bb269e
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a2093e02cc72b6e94bb28ab
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_backlight_lcd0
      last run: https://d.kernelci.org/test/maestro:6a2097d32cc72b6e94bb3c93
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a2097d32cc72b6e94bb3c5a
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a2097d32cc72b6e94bb3c4e
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a2097d32cc72b6e94bb3c32
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a2097d32cc72b6e94bb3c31
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a2097d32cc72b6e94bb3c30
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a2097d32cc72b6e94bb3c25
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a2097d32cc72b6e94bb3c24
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
