Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442D278F39
	for <linux-next@vger.kernel.org>; Sat, 27 Jun 2026 02:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782527450; cv=none; b=O7hYK1m69eEaroK7EHPZvM0hdTlB3AfzHpOJ0PmCZZ2H3jC03Hx5HbUlhLirbqw2ovhA6SL3CuddqgT2uFQmsadnJOCdZiuuNHAQcZ3rky1TZUn3wgCKhBMOd5azDL1mwQ0JtpdRxWxxGEbHpBOuZZ7dH7PQ+73u0TBL9X8o+38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782527450; c=relaxed/simple;
	bh=9Jl1u0rQaRbeKj+aE0sRNMxEe/ehbY5V4tDkqVVsh94=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=iEZwpQ7ZPJ3tYeT5RoshkixcQYHZBIPAcBL0bE7FSzJ30hKf7n4MEC4MZzjblVBy6dPUzrq6l/OSVrr87PVd0s/P4Qnlqjb/z09apKL/KlPPTdFWueUvruSjjhXi09ZyBHFQSD73n2HGb5R+xPxU6paxyJq3vdIBWyeZR3Hn3co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=iqzeqjo5; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="iqzeqjo5"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-13986d61b4fso2231689c88.0
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2026 19:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1782527447; x=1783132247; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZRtlgzid8yjbQ0vmwhQhYCHbkryAtypjwHSbZru5JE=;
        b=iqzeqjo5AhtvFqam7MSGgiMJoXEi0b2PYFB1h+IJUzpuzORl35Oxi4qcrKnPOX/zaF
         OExoOavGehe9XjejJstje29McmSqgVSjElIY39A4/gkt5FQ4sofXPNwI023WU0+cKwAW
         9dcaO+YHyh1B19tSawAp9iC+bY4My42Pls3bM27iEqqC2qPyjYFfYBuzDsF1mbimRmPN
         Wgvv2JgyAf6Vu08C4lo5mRyGWe7BXrckJmweJJD2rIoQHNYNYHyPzO6RLC3isW1XQ9Yc
         2YMVYeOEHqwpZZmZ6qdaiQfZiDi8ptosU95rRqI3xMaE/mkM8jIoQu4SgDbrZMquHZDR
         EwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782527447; x=1783132247;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZRtlgzid8yjbQ0vmwhQhYCHbkryAtypjwHSbZru5JE=;
        b=jH17nXwNOF0P++JjFFsQS3ouaaYrTCi0cZXI36MQGMk2ZlKgteFafFLhWnjh2BC/5c
         v6Bx/iZRuaWgE5hDuTjjutkz8BTy8Dt3V7Kpl4EJvOCffD/5sNp9/+gBv/D5SRbGaIJj
         aWqat9qCJ5YSZIWCk3VIZaHjcQDGNtAasoVFFjLcy+hG1uI2AEoYn7lUbQwuv2xBUYXx
         XCnnOVmWGCGEpW7LS3fmm2ngD8VzleTUeZyi//gn/WhCRApmbZz3gEX3wQaeHAINuzp4
         ds+MWgmy1TyFLdTHYeHr4zkQf/A1ZyY1gTQdhenL9irerXNf/0BWqgFDOjUYOU5DSG2V
         P3Uw==
X-Gm-Message-State: AOJu0YwA5mpSZ2FQWATRzUf/7BzoX5ym7vwnQfG12GeSGB8s8sgoZM/g
	SBzDj2i03lVx1WTocSOIRAl8hpH9K86od154I4bA8Ak9mjY+Urc3fkiM5FYMyZ6dj7E=
X-Gm-Gg: AfdE7cn3mwmSXyGRXgIteoLsTVOVrwlJt4W+qTrXnjVFSuJesCAnJlbGwramQWbgeaf
	TTe2YWrLcw6Mzxuft14Sp/fw5lc4Hq96gDTH7k2RKzqgic13LsYFJySP8GB7JyAuNMPpBKx//pp
	cPvQvgegh4oFChn2RPKYydSBmIacCD4uYxWxtG0nCqPDMLz95P+py6+9hEFmLc617+PmgHbiCuG
	5jYwrgcJRosA7SpolB6TSKYJVefaP1HLKS9JSaTwMCGi47wuuN0Tws715jjABZ/71ZsPdM97hVW
	561hsrUVhICaxDXgFoWXupf8CMaX1dOrprApVu77QgS9rHLOyHmVPqwA7mkGM8YG3PvWq8Z92jo
	sZTsidcGGsYhdQxP4Ui4Wj6Jl9hzDJ57piuBmjnetwxZr8sr5c/6SYffCEIiBMXi/bZ/QtJ+dVT
	rPiYPymg==
X-Received: by 2002:a05:7300:ad06:b0:30b:f3b8:3e7f with SMTP id 5a478bee46e88-30c84b7069fmr8427251eec.1.1782527447122;
        Fri, 26 Jun 2026 19:30:47 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca438ddsm22024246eec.23.2026.06.26.19.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 19:30:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 27 Jun 2026 02:30:46 -0000
Message-ID: <178252744610.390.1425086204998726279@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3d5670d672ae08b8c534b7beed6f57c8b44e7b43/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
origin: maestro
test start time: 2026-06-26 14:47:34.599000+00:00

Builds:	   66 ✅    2 ❌    0 ⚠️
Boots: 	  169 ✅    4 ❌    0 ⚠️
Tests: 	31254 ✅ 5370 ❌ 7026 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6a3e9bd36de4dcc0f449375e
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:6a3e9c646de4dcc0f4493ae1
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_gpu
      last run: https://d.kernelci.org/test/maestro:6a3e9c646de4dcc0f4493b18
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a3e9bb96de4dcc0f4493679
      history:  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a3e9e316de4dcc0f44987c8
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_gpu
      last run: https://d.kernelci.org/test/maestro:6a3e9fb06de4dcc0f4499b55
      history:  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f449056d
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f4490502
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f4490501
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f4490500
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904ff
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904fe
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904fd
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904fc
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904fb
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904fa
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904f9
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904f0
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904df
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904de
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904dd
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904dc
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904db
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904da
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904d9
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1c000000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904b0
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f44904a5
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f4490471
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f4490470
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f449046f
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f449046e
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:6a3e9a866de4dcc0f449046d
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000
      last run: https://d.kernelci.org/test/maestro:6a3ea83f6de4dcc0f44a2d19
      history:  > ✅  > ❌  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a3e9b646de4dcc0f449322b
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a3e9b8b6de4dcc0f44933c2
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a3ea4dd6de4dcc0f449e516
      history:  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6a3ea4dd6de4dcc0f449e4db
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a3e9bc66de4dcc0f44936ea
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a3eaaa36de4dcc0f44a4951
      history:  > ❌  > ✅  > ❌  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a3ebae86de4dcc0f44ab455
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a3e9d296de4dcc0f4495d9e
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a3e9d296de4dcc0f4495d95
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6a3e971f6de4dcc0f448cfb5
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6a3e98b06de4dcc0f448e99a
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3e9e406de4dcc0f44989e8
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a3e9de86de4dcc0f4497ddc
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a3e9de86de4dcc0f4497dd0
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a3e9de76de4dcc0f4497db4
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a3e9de76de4dcc0f4497db3
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a3e9de76de4dcc0f4497db2
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a3e9de76de4dcc0f4497da7
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a3e9de76de4dcc0f4497da6
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
