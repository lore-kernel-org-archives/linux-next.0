Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EA2379991
	for <linux-next@vger.kernel.org>; Thu, 27 Aug 2026 02:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787797833; cv=none; b=HiJgq2IwptO6WVewN4Hxlm4K2mIVVCDWUv2sSMJGe+hjgDBe7oTNCRf+zBuUtcASwOLpkGez2MCILnj8a2Pn8P8E+2+q/bZkCI/U0vKiTY9hIf4rQw0FkaUqqWaztq6EUwPXQf5MX6DM3yu5FlHm3qDWN79UWBG461CfsYUGW1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787797833; c=relaxed/simple;
	bh=1uNZMnoHxESYgClrKIJodi2sfFeTZ8nqASS6PlxrumA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=iRzcoe/0iT2CD4vk5vpQsjWeNcC+vpi6GNJfyXW7fuT3Pjha8L+asJL83DoHNz6ym1zCa9zgsf148oNQOxb7SrD7rrmMnQmx4Af6oIGEnF3YmA0HciV8Zgr6Zl6V1taVPFqUSe8kD2FxSbZjKT7cPwkDj/4lo2nCSZGr617VN1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=AovOV2Ds; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="AovOV2Ds"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so315552a91.0
        for <linux-next@vger.kernel.org>; Wed, 26 Aug 2026 19:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787797829; x=1788402629; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FXyuJOXET9rHkCU7hHdyFSmIK9JKQYyh5AbP1RYq2Sg=;
        b=AovOV2Dskj9QrhIHPMRqaX1L6fQs3/yRTaVtCtnR6EuHBGWqS+Zr2sax00FI89I1Dn
         JkWj4NmvHt8S+lUVQ2U5RClxsM3HiQCWC6egJE1DbAfN791rV1Y4HMD9vg2/xt58xSKB
         1pSREmgGC8/3F3vo7oup1rIV/vclLX04vdZzUXFRv+rupPBgeT2ykSOglxYk0Unoe1pc
         w9/2TbWpn2cI3aLIIhZArqetILxuKITGBUrNSxAttR0h65crluRfQihiOXy9iZ8iwQ88
         HpK9tWk8t4sbRHxBSCSFP8/cb3kKv4lpRXA1mbI/uwpg384xR8LCTsL4MRXpZQJsYHZl
         KvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787797829; x=1788402629;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXyuJOXET9rHkCU7hHdyFSmIK9JKQYyh5AbP1RYq2Sg=;
        b=nnEnAHyAH4KdYybv0wUUQhPdtQg2+HwA/v51M2wlCxzMV7hj1EbA+WlhwUK1xF7LPC
         LiM5DOfEEBv8a57L+bCR0hwTO+lX0hSPV8KiggpEhu1B3pWEytBFDY6GcK+oLty8L/o4
         QAJLzN6+fkKpfxNXJFqAxMM3udvWH8g0OeUPjb06eieJqdwqkYV7rWhg7iH2mXh5MZV8
         tLOHHYSTnia8c5rXcikjJ4JSacSu0Vb18Yy/31CmtrlHWsxHwLrhgsPyv4a+DTZuV/ly
         iFpt4l6ZaG2G6Es3uM3LQxtLjtIdDVG2akvMSncB8eWfqQES+RpkG5PVCzg7VKqXc7T5
         J0zg==
X-Gm-Message-State: AFuF++kj9KNaqkKxdrmRVJU3HUWagihhA/bUTviMvqsMiIK7KFQEfx0H
	vtcmePNJcagDE94164xe5u/e+zCwUPJwdEWt2Tn2jFqOOzhWTuctu0cSXNJ5RAZgdakEsQxY0Ob
	EDs73
X-Gm-Gg: AR+sD10k97rntTb3Ao5HpxLbI3+n84QYXRSKvinrOTtbEzP1rlzEsznBI2ruAIxUF6o
	a3VV349N0cPx4vbLaC+nMyDSaPAJ1890fC1ezNk5+Zms2f9D0eLJZtlFYd6M8bmJGLhQrgVx/d/
	8zx+SdOCwM3MgmuFpF1/yijUvYRblq9KSMW247GRivEhbiGCyPvASXN01AO9o708y+OQSlxtDfX
	XXXyvgmIH+pKrTQVjz/TWZcpBR7ZsBnK4FminyDHJtVIthtvAw+czGU0qad5VzXDih6n9zkEv70
	8T6AF0+uIOso7YcBH6zUBzPFL7NFdfShNNPtEs93SS2tuEm5dPISbLvpreLqxM2VO0ql8IQohLf
	qXwl7hI0I9XQtNZ4E5orkXa4eOIf2B3d9GqHm99+lOiNaouQZK4i+5nGbLfcTLkxe1MkwEYzCJp
	Lt+e9QG4ObY94Y0jCI3I1hxO/bZteYYRxVpO79hQ8M8VH0SRGn49sS
X-Received: by 2002:a17:90b:17d1:b0:38e:8300:af51 with SMTP id 98e67ed59e1d1-3966d20b09fmr21300124a91.8.1787797829153;
        Wed, 26 Aug 2026 19:30:29 -0700 (PDT)
Received: from b455de3d9de8 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd98sm21464425c88.3.2026.08.26.19.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:30:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - f82a5da2f04960df9fb57489992d03dd5e64ec6f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 27 Aug 2026 02:30:28 -0000
Message-ID: <178779782818.4492.16919757052254969661@b455de3d9de8>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/f82a5da2f04960df9fb57489992d03dd5e64ec6f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: f82a5da2f04960df9fb57489992d03dd5e64ec6f
origin: maestro
test start time: 2026-08-26 14:06:28.558000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  198 ✅    1 ❌    0 ⚠️
Tests: 	30016 ✅ 4509 ❌ 4511 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a8efa8b62f33761c01e5a1e
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_3d64000
      last run: https://d.kernelci.org/test/maestro:6a8f184dc5867fba945e6559
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.timers.timers_set-timer-lat
      last run: https://d.kernelci.org/test/maestro:6a8f1dbec5867fba945e6e24
      history:  > ❌  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6a8f0494c5867fba945dd0c4
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6a8f0494c5867fba945dd0c3
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6a8f0494c5867fba945dd0bf
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6a8f0494c5867fba945dd0bd
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_888000_i2c-mux_77_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a8f0494c5867fba945dd0a5
      history:  > ❌  > ❌  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a8efa8f62f33761c01e5a43
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a8efa4162f33761c01e575c
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6a8f1a38c5867fba945e68b0
      history:  > ❌  > ✅  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a8efa5062f33761c01e578a
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a8efa8762f33761c01e59fb
      history:  > ❌  > ✅  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_ae90000
      last run: https://d.kernelci.org/test/maestro:6a8f0494c5867fba945dd0c1
      history:  > ❌  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a8f0688c5867fba945de29b
      history:  > ✅  > ✅  > ⚠️  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a8efa3f62f33761c01e5755
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a8f07a1c5867fba945deb2e
      history:  > ❌  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a8f0878c5867fba945def53
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:6a8effb9c5867fba945d8285
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
