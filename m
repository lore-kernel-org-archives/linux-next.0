Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EB436923B
	for <linux-next@vger.kernel.org>; Wed, 30 Sep 2026 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790735417; cv=none; b=dPm/l5z74zmM5WuSQ2hi5RKC0XN9HEvGau9InoCKPtP+dC2pIO+MooAu03RiB5LLtFSi1FERBIJ51fAau9Nc3QXtjV5nODBN/OAwIXYN1N6vkNOGnDSIm2RAs7lCP3F1ReNno6N9+dq+DkPx1ZgwxOYJ0w1CdJp81LeC9E5aOLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790735417; c=relaxed/simple;
	bh=wUQgEhv0yHS3yrOUd1caqAta3LVSGKwxEFiF42yoa5w=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Gcpk0dbufCTSrkR882Wn/jgywe+E3o2Ia9lrUuWovJjqja3UCSYCJ7ZfSfqiUJdVCjeuqFqWFMyP5IKD83W6TzhM1Ei1XKgT/IJfddVjE8QV+tESdG2orwDw4gODl28ttbvi9FIWb1RQAof/dIkWWxb0vn2dgMRAKrhdZh2SG00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=HffTC1md; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="HffTC1md"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1460bcc512eso2820782c88.1
        for <linux-next@vger.kernel.org>; Tue, 29 Sep 2026 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790735414; x=1791340214; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tlH3hmeCRdhPF+rPtZHyMfi5tQutMhz6Vi44JdQZjDo=;
        b=HffTC1mdh6oENS3JYNl7my8syffG95xJbyFPLglE8A44oumqizXKNAHirzxciCTRqF
         +dK+drKwoH52DPG2w+To8d2G/QTlK08Zvf3gyi2mLlYPD65arnxB4eZuDSq7K9B+4dgD
         kSJHiH8FfZ+Al9M3Rj6F8Iqr1NB3kaEwblcOVSLBJ8YY5plNt9tWrsRcr4ipkTiQg0+g
         8fTNJ9KL81Saup7Z4WeeA9XbLehgmITcsgj8g/sJje2EXgQVDD5TMZvGxMbJMTQtyHzU
         RYiN33PfF4dXoLC2kCgBvc2M+HT/JyQCajpm332iFxeQsvK6K3yZwCyWxUS7OFra38Xe
         8i2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790735414; x=1791340214;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlH3hmeCRdhPF+rPtZHyMfi5tQutMhz6Vi44JdQZjDo=;
        b=QCgJL9PYRinTGsgb209TbAAkN9WoCzWWB6OhbGW3fad9otKMLdNnvFkrzQFq4oVGod
         gmRm75dQ72t61+BoBshaph4qY+U2T4sUcYjRZd7X5/w3btwnm2v2i+z1wJHA2Pgzs9ta
         gf4AfudSNSF68bTRt9Tfe8PK5RdbBBynCzAfOq+6RidPbY+Gviy+FouG9tDT/FkJyini
         VTLADYs99dFVyg8/gJIuWkEfQo8HnuoPpamfjlxfl0ZSh2GRrX5r7Gv1JcLB2RLi3ljK
         EnpwRxpMwURFX/kof7u1R3Hyo/a42haPNzvClDH9Vk492M6dAVW88JbWIGqZnKcKx3qD
         kgww==
X-Gm-Message-State: AFuF++nsSVv/qkyDMSmLE+uDJDj8U3WrGZ7HEiyWUv9mDqfY0jyhajwn
	5s1aFbon4Gj/4DYIKYQjZbKGjUcl1lUOyHdxBEn3ngEl0hvDLmm74Di+ZBl29TwgTK/6wztFWud
	vOxin
X-Gm-Gg: AYBFou2c69qIJLSltclrBxWkK7d18wHPyZHXYjicyUG7EdnBRhZie+nujiFnenNeq7Q
	v6exjROw95dQad7NHOL40vfDa5NGbSr0B3rfFc8XkugvsE1kxePeLTPfbthy7XE1WT3MFpXq93E
	P7QcBNPx+pmYSuo1Rms/iH9FUF5PoiHsSwcDruQLcTcxiPyUjY/cLtuXAEgRmeuEPI95Yh2euy7
	4gmUwOeDvCvS6GEnkXBFztKnRumYVuAyPf99K9NWhIHHVcNhpQkq7K3P/2ScN+MsPWsQFOJCXOs
	FfOQsg8By4ghoJxAER5Ke2R+GtH83ElqTJkAmWVKI7lQBHSO/Bx5JQX7fzywcwGh/H1nxXUo2FA
	G7i1dClIjvBre94kiEoIN7yHPKPAhAjjX6tKkzJzbAks+85najwok1C9Rp2Q4cZ0DQC5SU/pMq/
	kbr6xzdu52P+BO5Qr3gB86a4bdlETRi+5sDa0MQf75+48w5bc9MRx4CPXsaL6Si2c=
X-Received: by 2002:a05:701b:4248:10b0:14a:d8fe:3396 with SMTP id a92af1059eb24-14c9f2184afmr1304779c88.27.1790735414291;
        Tue, 29 Sep 2026 19:30:14 -0700 (PDT)
Received: from 5a6d9a2c18a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d088e049csm123224c88.8.2026.09.29.19.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 19:30:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 6474fa070f2b8013b4b87350b775b8c3be6e8aac
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 30 Sep 2026 02:30:13 -0000
Message-ID: <179073541290.74017.12520750697527521315@5a6d9a2c18a2>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/6474fa070f2b8013b4b87350b775b8c3be6e8aac/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
origin: maestro
test start time: 2026-09-29 15:27:36.830000+00:00

Builds:	   52 ✅    2 ❌    0 ⚠️
Boots: 	   95 ✅   18 ❌    0 ⚠️
Tests: 	17228 ✅ 2837 ❌ 1455 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6abc21465ec73975aa0196bc
      history:  > ✅  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6abc21e75ec73975aa019829
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6abc34b35ec73975aa02a57e
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6abc21f75ec73975aa01987a
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6abc1a2e5ec73975aa0184ad
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged
      last run: https://d.kernelci.org/test/maestro:6abc1a2c5ec73975aa018489
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_-s_2
      last run: https://d.kernelci.org/test/maestro:6abc1a2c5ec73975aa01848a
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6abc2cfa5ec73975aa01e673
      history:  > ❌  > ✅  > ✅  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6abc0d0e5ec73975aa0155c0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6abc0d0e5ec73975aa0155c3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6abc0d0e5ec73975aa0155ba
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm.mm_ksft_thp_sh_khugepaged
      last run: https://d.kernelci.org/test/maestro:6abc387f5ec73975aa02ead5
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_-s_2
      last run: https://d.kernelci.org/test/maestro:6abc387f5ec73975aa02ead6
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6abc0a025ec73975aa014a55
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.dirtyc0w_shmem
      last run: https://d.kernelci.org/test/maestro:6abc34b25ec73975aa02a187
      history:  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6abc2d075ec73975aa01e740
      history:  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6abc2cfa5ec73975aa01e674
      history:  > ❌  > ✅  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6abc0d105ec73975aa0155de
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
