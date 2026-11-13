Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537031;
	b=TYU3Vao2whVn+xGRO+uJORP7Zh8TbEy6ncMvBIAZNeNwcF4HUwXLqIj5d2HGL+bU8L9L
	 Pt0pbYQ/XPFBu3xM5ajpcRHX4cOM+HUn5e/KMpSFdAcu+EUR4W4G/GCtogfDXEq3OegHu
	 jzQ3o/6rBeTLCoR2cpp+deusJMuimOzula8GxD7K0DS0k6WJyXmBY3R5tWBrCnsjtQ/t9
	 LgE/tHJHjFEE9LYeO6a7bnTDLSwOWwyiR8FEnnP+0Y6PpSd8Vh6WG0fBkdEkfUm7h4DLW
	 N0H/wnuModndmcpQ3ciJnuYp9wk/ZbGsWKZH2HBNQCxe4/nOWuwpSLOGUP2/P5FoOQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=oqS4M+XrD4uWiLntdM806ZwJfVhX8Bzg/K9KgUg/nqQ=;
	b=it4GiXtD6Mwn6ekXw6v2Fpu136aZskIXC1GkcVSOXHfgkR4r/gyL0tBsQZItl98CwSXR
	 vucIcNMJBG+WRI6sL9REyCiP3dshrjkrU9RAeW58xJO3lde6xhx+aR3XDDTaVqkKsQOtE
	 Cx6Dn55RX3eXJ2Gl+Jrd5WsKmG2rpTM9Gg8uLLNLK6yKnRhufycjd+gN23ZNt59ued3KZ
	 mGE4g2BIpOqNGZpbRSuPx/UKqKchoJXJMvb9PjP7kB74IvhiPPntD9pF+3JtjXKg2Rxtv
	 ebXEGptpvNgXhGSCpmTh3MfvwifNr9Pijd9BFlsuE6JCpX+cjx79W3Hd+6aeV6ntdvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=ihnMCwM5;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EC5606A31C
	for <linux-next@vger.kernel.org>; Fri, 13 Nov 2026 02:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53EC5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=ihnMCwM5
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2761c69fbso922995c88.0
        for <linux-next@vger.kernel.org>; Thu, 12 Nov 2026 18:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1794537029; x=1795141829; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oqS4M+XrD4uWiLntdM806ZwJfVhX8Bzg/K9KgUg/nqQ=;
        b=ihnMCwM5m+iOT35+DnBIsqd/pByIEzZZkJu/lzeQFLprihvLk/SHYsm8BjOR2GE2tz
         PX6IPQajmgBRMnjmYOh3mWLjOfYFjxIJeZzQ6sFKuzZRFm6eP64MjMP+uH9fsSbSBehA
         LDzuJF94FUqh9Inh55hxlhsjG0n79PL2zShjTNeOujHSq/EQpy+FYz1tmjNhXF2CFJlU
         LdxF6svaFrDqwReyoMBUARDt+fOURPLXB+XmEqUbfJ/Z+UqE5JHfK7p9cjaC24aoaogr
         0KRBkqB0ijlcWrwIiFdaQWhtn5n1iEjO/OsZDQQ/TT4zPxHdHAyiyOtZfRNUDlBlN8Mp
         FFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537029; x=1795141829;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqS4M+XrD4uWiLntdM806ZwJfVhX8Bzg/K9KgUg/nqQ=;
        b=BZkkzTROftHK3v1rYsufBXwWVPnE1Vx04Dmj5/tgdfpH8nsWeSpo1ESsxwCFXMeFCo
         fwRAB76oDjf0T3vq3rXaqy61N5tX6+StwbSTbaCabjoWeoGc/TfG01q0fAMgbcWQIbFd
         xG72qm3ibPMxgX8YC+YdF1CltttLpP36ARDkAC3vkwQgzDMq9PCGQK82h2ZKxjO8WQQf
         aiHgmHXNGq/qNUUujOflox7IqhGSTPxWyAN/6IiiAUG4VcVd4XdnZoz7AD4lYSwBJf+n
         Mm9hFIlavfClxdvJjeSD5MVIBH87zVBsxvhyd+D9NnXXv+FWqlJbka3ADnDFa5vpKx8M
         zQGg==
X-Gm-Message-State: APuU4Z+o5XDmsLwhDcoHthMEWVrwdsj97P/9hHmTT4/TRaMA60U0+hEZ
	Axey2zOAQX42tNqti0Cw6I84vWeR3dxFFyyHin1HECJ4riZOcTrXVKGA/+UXywanRm0uAkHQTGv
	TiA7A
X-Gm-Gg: AYBFou31m58DIuK0eOoGm1r/sR3EyknimNQNN3k67qEV0D0ztRtHak9BKfy9Cm0Or4Q
	k4PVyr0wIWq32RmQc5q282ymOeaAu98E9BPRZQtWzepJb/fTSFwoIzMigcE6cn86ECHUIM3DaGf
	Nyf48zQfKWNdGMXfc0MHZ8DnUqbudxxHHHmyycgIsIEvYka0Plbzd0/K74Sd4M2PR7Ei/MNzthJ
	9azhl+3XUh7NhBmquWlDHsUcvO8eWTUpq1iE+8NbY6IGVVkSVCnbGJ1yUZv+Ffu353u2zzUFxzE
	UWS2uNtBaeGB46xPmtxvCElSaiWymTEGHV0qq/Y8ovlXXw8R+LhSoEM9SMdUEim4qOQeS3lVJ2X
	T0hiyKohUvFpufJefV308FXRl47T7ut+pbL4ORCZxlHgGa7k0RyHtpym5UpfySYJ9XVZJA3DUXn
	MwXIyJmKNNo1Bw08TSvd5PrFXUpvdsGjmYurUxV+L91ghjnbHv3KhwAWvbvpOKwOh36SS1lLKWl
	Z14y8qn0K9cZYLkFTPObceZr2QOXSEfKpkvacBZccdyD5sO2XjJRLAb70oqVULqTIFOKkKbMtHA
	HkV4AyXq5FY6yRk3FLgW+w==
X-Received: by 2002:a05:7022:3c01:b0:1b2:48db:23dd with SMTP id a92af1059eb24-1b50314c097mr1165133c88.16.1794537029074;
        Thu, 12 Nov 2026 18:30:29 -0800 (PST)
Received: from 8439c401ee69 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm2560661eec.29.2026.11.12.18.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:30:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 6d582d78fad9d828e575ca0cdcff8ea47a77220b
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 13 Nov 2026 02:30:27 -0000
Message-ID: <179453702683.10915.4496846779826623221@8439c401ee69>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/6d582d78fad9d828e575ca0cdcff8ea47a77220b/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
origin: maestro
test start time: 2026-11-12 16:59:11.836000+00:00

Builds:	   76 ✅    1 ❌    0 ⚠️
Boots: 	  145 ✅   18 ❌    0 ⚠️
Tests: 	46738 ✅ 2887 ❌ 6376 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6af612895b429d354e47d4c4
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_current_peak
      last run: https://d.kernelci.org/test/maestro:6af612895b429d354e47d4b5
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6af6352d5b429d354e49eb15
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_low
      last run: https://d.kernelci.org/test/maestro:6af6352d5b429d354e49eb08
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - ltp.clock_nanosleep02
      last run: https://d.kernelci.org/test/maestro:6af635325b429d354e49ecab
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6af635345b429d354e49ede6
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6af619575b429d354e4829a1
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af619575b429d354e482997
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: jetson-xavier-nx-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6af60d3d5b429d354e473e5f
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_time_migrate
      last run: https://d.kernelci.org/test/maestro:6af60d3d5b429d354e473e5b
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers.timers_nanosleep
      last run: https://d.kernelci.org/test/maestro:6af63cef5b429d354e4a2d73
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.timers.timers_nanosleep_CLOCK_TAI_remaining
      last run: https://d.kernelci.org/test/maestro:6af63cef5b429d354e4a2d74
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6af606805b429d354e46f9bc
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6af612895b429d354e47d4b3
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af612895b429d354e47d4ae
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6af601705b429d354e465513
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6af612905b429d354e47d85a
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6af635355b429d354e49eeb7
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.shmctl05
      last run: https://d.kernelci.org/test/maestro:6af635355b429d354e49eeb8
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6af600e15b429d354e4649a3
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_ae90000
      last run: https://d.kernelci.org/test/maestro:6af636b25b429d354e49f7ad
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6af636b25b429d354e49f770
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.timers.timers_mqueue-lat
      last run: https://d.kernelci.org/test/maestro:6af63cef5b429d354e4a2d6a
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.timers.timers_nsleep-lat
      last run: https://d.kernelci.org/test/maestro:6af63cef5b429d354e4a2d6c
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.timers.timers_posix_timers
      last run: https://d.kernelci.org/test/maestro:6af63cef5b429d354e4a2d80
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6af60d2d5b429d354e473c29
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6af60d2d5b429d354e473c28
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6af60d2d5b429d354e473c24
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_edp_aea0000
      last run: https://d.kernelci.org/test/maestro:6af60d2d5b429d354e473c22
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6af60d2d5b429d354e473c20
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6af60d2d5b429d354e473c1f
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6af60d2d5b429d354e473be9
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.JCT-VC-HEVC_V1-GStreamer-H-265-V4L2SL.MAXBINS_C_TI_5
      last run: https://d.kernelci.org/test/maestro:6af6048b5b429d354e46d907
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6af606bb5b429d354e46faf5
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-agx-xavier-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - tegra-tests.boot.devices
      last run: https://d.kernelci.org/test/maestro:6af614c65b429d354e47f4bf
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000
      last run: https://d.kernelci.org/test/maestro:6af60ae95b429d354e472b45
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6af60ae95b429d354e472b43
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6af60ae95b429d354e472b42
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000
      last run: https://d.kernelci.org/test/maestro:6af60ae95b429d354e472b41
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup
      last run: https://d.kernelci.org/test/maestro:6af6016f5b429d354e4654f3
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6af6129d5b429d354e47dd4f
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6af6129d5b429d354e47dd1f
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:6af601705b429d354e465510
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh
      last run: https://d.kernelci.org/test/maestro:6af6129b5b429d354e47dd01
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_sync_check
      last run: https://d.kernelci.org/test/maestro:6af6129b5b429d354e47dcf8
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6af612915b429d354e47d8e7
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6af635345b429d354e49ed6b
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - ltp.splice08
      last run: https://d.kernelci.org/test/maestro:6af635345b429d354e49ee3a
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6af61b375b429d354e483af8
      history:  > ❌  > ⚠️  > ⚠️  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_tn_111b8000
      last run: https://d.kernelci.org/test/maestro:6af612ae5b429d354e47dea4
      history:  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af619575b429d354e4829a6
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6af601595b429d354e465382
      history:  > ❌  > ✅  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio.gpio_gpio-aggregator_sh
      last run: https://d.kernelci.org/test/maestro:6af658e65b429d354e4b4931
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6af625da5b429d354e49616c
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6af625da5b429d354e49616b
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_ae90000
      last run: https://d.kernelci.org/test/maestro:6af625da5b429d354e496169
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6af625da5b429d354e496167
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6af625da5b429d354e496165
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6af618235b429d354e481c0a
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6af606395b429d354e46f375
      history:  > ❌  > ✅  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
