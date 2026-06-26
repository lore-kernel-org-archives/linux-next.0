Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA330B535
	for <linux-next@vger.kernel.org>; Fri, 26 Jun 2026 02:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782441016; cv=none; b=Ekfqo29r87zpBL0yRYlODh2YdbX/2CEzu8RddMTFnjMYnLjCZvEdbi2bK4Lu38OBm8P+uLIY/TTJ6cl1uACDQR+qMmfbliL/HxJVKKoDm65XyNhdUq68TiOIvT4gjgq3CWsaMVkHfTRxWtt80fuiqTV5GuoP4Av0TBKF2TisxaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782441016; c=relaxed/simple;
	bh=+hQ9rS+pOA1GuWJLSodtjxrnw8cH0MiokWy4vrJ5g5Y=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=U6naZvZnwi5VFxh3poANAhvUAX6ifx/5Bs8w6AfTxS/6kcqNDByP/hH4+naoggIG+IujkIE4yNGLRV364+uk6AXw/qJg2zGwnnBt5GnPx+8b5yCDy4WbE7EV6lOxOHb3GEp+CQPQUsHC+rsXmcWiHxpFXo93wFLiXZgOx3eNQrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=M10rgMNj; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="M10rgMNj"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-13810b63a1aso1304705c88.1
        for <linux-next@vger.kernel.org>; Thu, 25 Jun 2026 19:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1782441013; x=1783045813; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPZBGRgLhKz+85RJqn4+lteSLwvQLLxrwcbmH5q2UHE=;
        b=M10rgMNjZUdd+JS5NrAgNe59eq6ZY32ANDFehvv07AH3ZBgivhyjZJ0ZU7NLi4Mw9w
         iJzRAqLE2wgzyX/5vO+TDZEDSJUmJDoy1SyriwEc+5X7AGMwpL7Pi4r1THw7OiYB1+Qv
         o9tP2aeP/89Z4HGO4FsFD91QI5z0I5ietOxyS850eDm0c+mutR9uBi0xYXJeAfg+m+/T
         zgIrQz7VDF9Q1xD0HtAoI9kHo4GkgnAcvzRyq9eA/VZYEdmiUnAXxglZhsIKoxRn9YSw
         aOaPbit9kllpRVpHEM/nzEpVACYkVPSlVr1BAxNy7UL07KCDK91JGnt7aPU2LqAa37cO
         GsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782441013; x=1783045813;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPZBGRgLhKz+85RJqn4+lteSLwvQLLxrwcbmH5q2UHE=;
        b=iWv6Myzpc7ktzYnB8rM7tmtkQz9vLSnifkGieYyGCsHdZf41cZfq+TnX5VJIIqnUT3
         FfMHh24ZKrbuT754+OJeopufOQRSI7T+lDtrTm4ThYaMmY+nmlflcOXbMHpmL/2CzPci
         u0+KHubfi6dKzXhSI7PfX7IAJ7s7PomF6iDOoRKjFlf0rUb0aOQ/yGf5ycAUMIG8exg/
         +oeZm78amB9Dycsehi17ljFMJe1+aY+N/cyRDNyo4j5c2Qtab1E1P1VdaEdVVCoacsgW
         avizly3Qu089h9wBUOKW5umiH2P0dscPJRHFSkEYf2TbbBQHKzooPmJTLCx7rSRacJYo
         KidQ==
X-Gm-Message-State: AOJu0YzJCnVs6tSwKzqmc7fJf7HG5V+P83K8oFN3rrOm4UP7RYBSYw/W
	upWP8vDboyADCIMC9soNUqlH56NZb8BEVDMoIecQitBUK/YLzKZp2r9vv2EFPokBXo6iW+XCQ4M
	wf0N6
X-Gm-Gg: AfdE7ckoa673YSxchAVbbfDmnSt4GiI+uCSfmx6ypFKLg0CGqD8qXZ+2okBzHMUSIHj
	ivxtXoT27M8bv2fA5enF55pYrgPxige83+IjwqqYktAKENM+5m+zWy2huqe3gpF57BF8quzbrJW
	kcPpeTY9wVPk6CTItSPTP1SAoUEqdMrXPVWkQBea4AXZhK+51e5+WL7P3qvDaHVwXnQIeR6NyoJ
	gc0b15Nhuc8mid9IQZW71fSIcMKgGATnzgWbr7Ge1HVDw3M7ALXEI3nkaHLbD8piTUegx0fWABw
	j+ILO097qlT/l+CJB2zV7ijaM4y3K03iuXNrRMeNOMhc54l2p6zCh29Vf4XPCs+3xFB+Z7AKeuh
	xgnZh+TP9A7THH6FXVH3NX/iQp/rgSLtbTYVlCrncOluBRfxqx7OWnKmVQouufZJ0J+/KlPbhOz
	+9qcwNoQ7XOPIyX/Bd
X-Received: by 2002:a05:7022:4a7:b0:138:48cf:14cf with SMTP id a92af1059eb24-139dbb654d3mr4434193c88.35.1782441012906;
        Thu, 25 Jun 2026 19:30:12 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d91006afsm15236818c88.12.2026.06.25.19.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 19:30:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 30ffa8de54e5cc80d93fd211ca134d1764a7011f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 26 Jun 2026 02:30:12 -0000
Message-ID: <178244101171.20080.7694860803603451369@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/30ffa8de54e5cc80d93fd211ca134d1764a7011f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 30ffa8de54e5cc80d93fd211ca134d1764a7011f
origin: maestro
test start time: 2026-06-25 17:02:20.204000+00:00

Builds:	   66 ✅    2 ❌    0 ⚠️
Boots: 	  163 ✅    4 ❌    0 ⚠️
Tests: 	26856 ✅ 4945 ❌ 3474 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000
      last run: https://d.kernelci.org/test/maestro:6a3d90366de4dcc0f4447c4d
      history:  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6a3da1f96de4dcc0f4454c20
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6a3d70626de4dcc0f44259cb
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:6a3d7b836de4dcc0f4439054
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_gpu
      last run: https://d.kernelci.org/test/maestro:6a3d7b836de4dcc0f4439088
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a3d6d7e6de4dcc0f4421d8a
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a3d6da46de4dcc0f4421f34
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a3da1f96de4dcc0f4454c5c
      history:  > ✅  > ⚠️  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a3d6de46de4dcc0f442235b
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a3d6b766de4dcc0f441d8f8
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3d702e6de4dcc0f44257a7
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3d6cf06de4dcc0f441e40b
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3d6fda6de4dcc0f44252db
      history:  > ⚠️  > ✅  > ✅  
            
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a3d6fd46de4dcc0f44252b3
      history:  > ⚠️  > ✅  > ❌  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a3d6fd36de4dcc0f44252aa
      history:  > ⚠️  > ✅  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6a3d71f66de4dcc0f44272bc
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6a3d73176de4dcc0f442aa73
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3d6fda6de4dcc0f44252de
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a3d6fdc6de4dcc0f4425376
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a3d6fdc6de4dcc0f4425379
      history:  > ⚠️  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a3d6fdb6de4dcc0f4425373
      history:  > ⚠️  > ✅  > ✅  
            
Hardware: imx6dl-riotboard
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3d6d0d6de4dcc0f441e8c1
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a3d84d26de4dcc0f44422f4
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a3d84d26de4dcc0f44422e8
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a3d84d26de4dcc0f44422cc
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a3d84d26de4dcc0f44422cb
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a3d84d26de4dcc0f44422ca
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a3d84d26de4dcc0f44422bf
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a3d84d26de4dcc0f44422be
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bdbf
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd5c
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd5b
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd5a
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd59
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd58
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd57
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd56
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd55
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd54
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd53
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd4a
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd39
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd38
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd37
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd36
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd35
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd34
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd33
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1c000000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bd0a
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bcff
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bde2
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bde1
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bde0
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bddf
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:6a3d73976de4dcc0f442bdde
      history:  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
