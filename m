Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4FB2C11D5
	for <linux-next@vger.kernel.org>; Wed, 17 Jun 2026 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781663417; cv=none; b=BE9BfrDhgTstFR2wtgi1O0RSzirHNKuL2Wrbw3K3DFtNY29Gq7Vjy/3ykeE4enDpOf3QtFg5ir7XHSg97vYmsLz9Q7jnRJbH7R6MD0JYMvBfj2jNViE2ux1O9kav9+nkL8c7pNI6lPiBkNa6IM1lQJGkcT28HkSUg5gHwBXHJko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781663417; c=relaxed/simple;
	bh=3cYf34vfnZHahpNfgFdynpyPykZYEhkF64YYYgZVhAQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=GtrdNmTcHtW2gBOGeqOSvwnFa9MOy7+k4DPENdcc1GUfrwjx9R/FjJtM8/+lqhhrYTX3VuWqYY8GJkqOlTaLKzDSaMJ+Ki7QqoXedcPFSDYWMGoz1B/T5mamLZQDfl7sLurXePirfmbQcbZ69Xdw5LMzVxovsQxMa9uI95XPF8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=PO4L1Ylp; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="PO4L1Ylp"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3042a388168so276379eec.1
        for <linux-next@vger.kernel.org>; Tue, 16 Jun 2026 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781663414; x=1782268214; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJHX6Wg9dVMUoxdejPfuhBb+mnE6pCnsL5Y+BXlWtm4=;
        b=PO4L1YlpI2FESj+ne0AibIJzxfWx5y3nl12lu53vKApeQZ7gioSVqD53212U1+NFC6
         HZvGo9+ltNRzS1FQCZ4tmGqujAndSDWmgxYRhc6y4rEr31pdWPuiUdoubWVhKt0GVn2s
         QchhS0SHzBOfAdBTHGoR+u3OH2tanexab/O3NKvv0nZbWfhR+soL3DWmQdODkafnBmL3
         yoV62NjENJRTzxyObbMJ0yNNzvvUwRMpspkKG7bwVqFwIDqwz0LHilsS9f5ZwN91hZwg
         ysbXkDBRkIQoJOSMqpJS0yi03Qy0oLMsR9JeW73cxOv27z6v3E153CHWmVnmIfduPr9s
         faag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781663414; x=1782268214;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJHX6Wg9dVMUoxdejPfuhBb+mnE6pCnsL5Y+BXlWtm4=;
        b=onBcUzSDgbcj0LeHb4eb0Oeo0S/Wh2Kc//9C8oTSWxzRuNEugL7NXRqmTNEVXtGciB
         ygnsrxuNm13/zLvtN1J9ODmbM0Pkbmu2cuiamV5BhY61bTCboijM3cpZmjpPQcMOIqZK
         oPbUG/TeO8f4yctLdjFM4tG9Ck+21XnjdEigw0NLPNoYF/ydlq+xGOhXPB97FEAnKS/F
         lzGDd4o13d5kR45/wOiZ3zq+1F+ARkBo5MytWKhWTZysaTQYgsgqPeYZy74hxC1zOh+D
         DGV/KzigZaKBpF3U4XRLoDuLGaCRnWf1oOlwxwsRbLvBIiSIqjyswAVdUxz0dTOgLWcK
         r4VQ==
X-Gm-Message-State: AOJu0YyHpisNr8SU4XEDn+juTl9zqi/G9XMhHZPFEsQqpLY8sXjLvZdb
	HxCPeXw9u7pJYrn5fSkIbXXUnGRDvxr8cpu/8RpWMZK5EFcX57rf06kjI5eP4/AFI8M=
X-Gm-Gg: AfdE7ck4HHt+BhSlkmSHZ+gkZrPnp/3Mdr3TiwCGVBGpKZlbnCa16X/6RcNy8MzYnEu
	wTrenS0ikBFMyF4sve0iZNFK/MXJElYerQqu7ryaf/e3CLqSX8q2xU7nRDy1bmrw65eZfaXdQIi
	Mybjp9xyv5vgC2MAEm6y/wr+9K65D7JZlwKf+aSFIfsJqabZvWUCzu+utDFKaarP9GXBxNjTiLd
	piKk3Jn0mhXY87mGr88Tn0Y8pqQoLCRqMk8A78AxfxaRgSBOYwzXfed9Kg+1QTCgSkGWr6YvZ4e
	SN6oomjEu1+yH2GmNrr86FIVgYXK36EpaT79DhhhEG9+KfpfYCl5EKGblvRcKzpy1uT31BGzffq
	5/7ltsMiuVOVdyFrFSU3K+f7j7jIYZHbyX5dVoq7HXuMZeD9BHSwREbqYAHILQeC8x8Q4JZymZ0
	chuiLyrg==
X-Received: by 2002:a05:7300:6420:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30bcf5ff5abmr704963eec.9.1781663413720;
        Tue, 16 Jun 2026 19:30:13 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95342sm21529031eec.29.2026.06.16.19.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:30:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 17 Jun 2026 02:30:12 -0000
Message-ID: <178166341249.15945.1035724881660383073@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/4fa3f5fabb30bf00d7475d5a33459ea83d639bf9/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
origin: maestro
test start time: 2026-06-16 15:01:55.145000+00:00

Builds:	   65 ✅    2 ❌    0 ⚠️
Boots: 	  166 ✅    3 ❌    6 ⚠️
Tests: 	28233 ✅ 5047 ❌ 5132 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a3170eeec8c023893894be3
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a317ebeec8c02389389fc18
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:6a3170b1ec8c0238938947e7
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a31709bec8c023893894665
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a317ebbec8c02389389fc04
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a3170edec8c023893894bdf
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a317ebdec8c02389389fc13
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: glymur-crd
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a317eb7ec8c02389389fbf8
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a31ccbdec8c0238938dc693
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a317eb9ec8c02389389fbfe
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a3170f0ec8c023893894bff
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a3173d9ec8c023893897751
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:6a3173d9ec8c02389389774e
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:6a3173d9ec8c023893897746
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a3173d9ec8c023893897745
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a3173d9ec8c023893897729
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a3173d9ec8c023893897728
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a3173d9ec8c023893897727
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a3173d9ec8c02389389771c
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a3173d9ec8c02389389771b
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a3170ccec8c0238938948e4
      history:  > ❌  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a3170ebec8c023893894bac
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a3188b2ec8c0238938a454c
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a31710fec8c023893894cdc
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a316d2cec8c02389388cfb0
      history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: imx6dl-riotboard
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a316d2dec8c02389388cfbd
      history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a316d39ec8c02389388d01e
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a318777ec8c0238938a3c88
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
