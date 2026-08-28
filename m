Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8484C22A4E1
	for <linux-next@vger.kernel.org>; Fri, 28 Aug 2026 02:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787884229; cv=none; b=S56yZ6M4SMaZYRP6XjCkClm9ObrM0qdcWefHnJLvKJnqu0alXcU+nQInh7XA1oxvZwoF1gPPN8lJ+zHxwC7weQ/4ChvkLqZYyEtSXVR26wFa0hpqMcdQYAznRuDdUMrM0gftd9XzcBzFHcoALUpuLna4jDFV4f+C1D2XHBfKnfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787884229; c=relaxed/simple;
	bh=0WAq93L1yJ6nvQjI6SF1goxwvC0/R1GwAbIczpAyjso=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=u11c0A1f8Hq2XwXVOQpbQfS/G8LDiagJqWoLumQacKytRZSuPRrwXIIVog4NbY9X/ZU5+CHqFlksVHvowpYGGTNx3zdw2r8CtwVrF8yO064Qf44UTMlLM+Yqs5FNPt/SrMx6iXr84GZiX/A927QM9KkmXW7apEUXDwPz2jiy054=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=AKcxOeDS; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="AKcxOeDS"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d71e253c90so5030475ad.0
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2026 19:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787884227; x=1788489027; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LPZADuznkIVXKOXjvi06WAWpMjqhmuuk9ADhicPBLiA=;
        b=AKcxOeDSb66WqlKUwd/SoxXu0VkpZe7U8fqh/7kZa/0MWbZWQAuNQKXEfDIgqsGFgH
         RXB9SmZa2aEvFrlsvC0byYd7s30DnVlJiLKPbXFwGBXfPdZi0yrTFyTmCPUr0IRugDaD
         2hLB4nT/04hw1UXRT+fTA/KwwXE5lUja3PFXzLC4g6VdN2JxyLNEqdYhOnter6Ogrmwx
         eEhMVAheII+FLXNwUkei5/slLk1AZl+hXE9i/J4q6A5n3xHf5EBqtTnFuEJRKO/hI2je
         /Qs8tmHwY6xVV4zFcgDzvijPVgkEXF3tRskpoaQFHRUUvieXlTjFiWszsZmE5uOs3kX8
         q67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787884227; x=1788489027;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LPZADuznkIVXKOXjvi06WAWpMjqhmuuk9ADhicPBLiA=;
        b=MLVRJwY2Rl73xhQx6JGCbzPvFJNyP21kMiYffznLJ1BF/CaXGPoymPRznn2LmreHEk
         Y7aA8er5EoisrN91IqIjuWM91Nls3Xqzmv3PTxoTH5cH7c9X+wJpoLtdlZIbKDCQCJEN
         t8DRC1IPIVCrNhCD7w95CFU/tvg1UNMjPt5VukIs2UR5xmMQ2oiF2VKVyKez4aBnhPOg
         LZOG52YppkvTkuc/BOQCnEexTRoUq9iQkQMKLAjeMtqoNuspz/PGd3XsgjC2lRpIdBuy
         ab5ppCfdd8bNpkwVoVNekciN1qkgR/L7X1tkecRSs5VE7AbLsSkw6N8b7tMsM4hDoXlU
         +3JQ==
X-Gm-Message-State: AFuF++n8TUPSQWhN3JFOMnED+/7e3otN65s06WpRV25y6KFwpdZJf3kz
	mJLRbRyOmMoE5J/J14Y0el/mxgP2KUfihVmNb49NRUBejQ8dZfjVcG1uio17AitMA1gue1TvFLs
	hblIv
X-Gm-Gg: AR+sD11UHbRmVa0YNI8YYYj1mnOfjoTVzIKS/Pnx4nNk0hqzSrgEY6bSlZi5btr96mv
	pCbdDtSScNu2svr1MUvf/XjSPCR7Cg8sx2ML8nwXJwU5QGKU3v3MAkHisrd2XV7v71qQ54AxjUH
	ajd4hzfcmF2wv6+yBNpLR7iTaGqZ7+LINawmU3sx8HagetEjIkhxZXhqLb3/Nl2zSsonWX/djuh
	pxe259fzCqfEjUAwwsiExb85/C9Q+CPixbEalojeJs2z9+BGeoVIJhxiBigMuc9MXFi6oMZz4nt
	kbTQFXmeV9ZwVpcK7/sLk32qVl4ShDYPb9HVpRax+8G4LOtg7owxGRJVYUJ0zLUnZdDHszqrA/3
	SUtaPSkuqB1DLhzw7ojIv/Qe/Qa4Ou6NxNZ9EVLFkscBtzpbYERWhqyMMM/eQlC518gILtEpXTl
	C5C0Prs1GE+4b7omwyKEnnhs9zJSLqeFlx/4s6n75dhj9UuSxViN70W6vB4olKS3M=
X-Received: by 2002:a17:903:15cf:b0:2d7:1aeb:739 with SMTP id d9443c01a7336-2d74e1295c2mr65707455ad.13.1787884226777;
        Thu, 27 Aug 2026 19:30:26 -0700 (PDT)
Received: from b455de3d9de8 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f783affsm798728eec.5.2026.08.27.19.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 19:30:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 3d83758432b5e6ed9507500a57efb0f3af41ee7d
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 28 Aug 2026 02:30:25 -0000
Message-ID: <178788422552.5582.1128667054354244495@b455de3d9de8>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3d83758432b5e6ed9507500a57efb0f3af41ee7d/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
origin: maestro
test start time: 2026-08-27 15:17:06.167000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  165 ✅    1 ❌    0 ⚠️
Tests: 	28639 ✅ 4429 ❌ 3947 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6a90a4b5c5867fba94683911
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a90a4b5c5867fba946838ca
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a906d43c5867fba946569e8
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a90d55ec5867fba94699e4d
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.timers.timers_set-timer-lat
      last run: https://d.kernelci.org/test/maestro:6a90e1bcc5867fba9469bab4
      history:  > ✅  > ✅  > ❌  
            
Hardware: gs101-oriole
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a908ee5c5867fba94672e1f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers.timers_set-timer-lat
      last run: https://d.kernelci.org/test/maestro:6a90c188c5867fba9468fe4d
      history:  > ❌  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a906ccdc5867fba94656402
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a906cd5c5867fba9465641a
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a906cf9c5867fba94656518
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a90a49bc5867fba946837d5
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6a90db43c5867fba9469b050
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6a90db43c5867fba9469b04f
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6a90db43c5867fba9469b04b
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6a90db43c5867fba9469b049
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a906cf7c5867fba9465650f
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6a90db76c5867fba9469b118
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a906d05c5867fba9465653d
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6a907c4cc5867fba94662fe8
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_3d64000
      last run: https://d.kernelci.org/test/maestro:6a90bbe3c5867fba9468d691
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a906d3fc5867fba946569ce
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a800000_hub_2
      last run: https://d.kernelci.org/test/maestro:6a90a4b5c5867fba94683841
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_ae90000
      last run: https://d.kernelci.org/test/maestro:6a90db43c5867fba9469b04d
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_888000_i2c-mux_77_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a90db43c5867fba9469b031
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:6a90808ac5867fba94666e9f
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a909dbdc5867fba94679887
      history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a906cf5c5867fba94656505
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a909e59c5867fba94679b41
      history:  > ❌  > ✅  > ❌  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
