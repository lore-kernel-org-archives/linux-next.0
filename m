Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C2DDF76
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771986621; cv=none; b=obIk34IRLPQbrFSmOtOnAukARSWAVbEahg/HL2h9SMlOHLSd6IuuRZNHPy5PYEjFfZ0GcCbYWgAbKbGxJMEZynTOyZ7CGwTIZKicwRGTZni454IqD347iAg1NYxQGAVTBWlMEgTPYQ39uOwUQ4OTxeCdgOQLkIKS7H4G5AMsmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771986621; c=relaxed/simple;
	bh=Kg4yBmRfeMWIBVwRDWCy/n89y1d6jLMPdIR0BpNJRZY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=nZm3ua2fXEeT1/PL0U/+cM5F+d/G3A/exT73Z3fKmplJPnkXxyuHu45Y1pihTYgLgSbb6sv+evShIpKfKgs6UOJHKIKRcqPVq1zT7olgmzDFPwE/tFXRu2fysVNvxTLNBaueM9ieZF6+LFGvtVdbx7skJdg4hBbMYN5gI2j1taI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=lusK4kZq; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="lusK4kZq"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-127423bea4bso1424638c88.0
        for <linux-next@vger.kernel.org>; Tue, 24 Feb 2026 18:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1771986619; x=1772591419; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4C/oJbWDvgKfjfjb35gfrn+yLgRY6HzLsaJD/ysSdNw=;
        b=lusK4kZqrnXzzaRtfs4TagvEdqqnfJRuod1hw70+aB6zAdY2+2cAUv9Ghz4v9XBgxk
         HeBLpMAla0qiFeZJJtJT4N8goHi2B3J5bZtz+/yEd5KGrlAZFdbRFYa30nd0dpEI/0cZ
         CHbea7viKAhbUqmhb8jqBv+ytMsDha4RqWPYTOctcpSs5BizFSJhIXDb/NIykzq8RnoL
         4IthiH9eGNewzfezcTL+AavhJnbgIAq7hxgmsM0PUnvwVnA49K39lHRutpFl1Gh03P1P
         z1yWhgKI/DAQForrmP9g2vupHh1ar8h0KwUstegavVAK493uKf7ajmIZfNpghhh/qTEh
         f/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771986619; x=1772591419;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4C/oJbWDvgKfjfjb35gfrn+yLgRY6HzLsaJD/ysSdNw=;
        b=kL9TeeI0nHY430JXoydKuQ7enFdCY1mB6Bv0vGm8G1IzTM9FwPyzXMXFNm0hiN/glO
         uon79KOsjKCgPMRJaftB7aMZ3jb5IuVJOBjucoNgfUaxpn4Y7m3zM7IV+vSrgqXHT0oH
         sMEdp7Fdj0hD4QJD/3SeVRVUyafe3OWV67YFqZ0gC2w5o8323Iiub2VV/wI85p1t3wQv
         awvvUe8fNt27BH5tL57qmqnrXbe2wVNEDvMZuy2JtzstZ8CHm2YCAizkFmGsXPoMWBI+
         BGL3cbV03lHTf398cHJeMBGEuSOr0KOoMYBbegquoTYPg6TSQdEYYrI0QHEb9/+15767
         NoEg==
X-Gm-Message-State: AOJu0Yy54lP2ZbJOlwzHZDyf+/1zbBrCHIH1K8UpSYaeup+lD9J5vedj
	IgTAkl96IHHk+DhpTJUTgzgF5KOjbxRIpVeNVcyrPK6y3dWpF3GadLMkFaiyXQoD1ykxJ+ERuIf
	Z1O8rawc=
X-Gm-Gg: ATEYQzzLkX1CjxkkqR9l8YrZvBL6HEFFfzAEbBmQJcZqXOq5nmmEYwijtPpCxTcEPDZ
	Hp4VcygO+ClS/WtAPVu8iOXNYMUbLc3+6MwH5F1UiYTdfBiMuC721TYj10rIiCY2dbO08w7jphD
	2Kt/vwNdXelLVj6tdY5lEDOViAnsvaVeGIcPnC5SdEmtSCMOpSTgVOQ29uhgkcW6p8BUJoYZOHA
	evQs0JvA7VEsKkAIctYAcGP9DionYgZhZk+G4EieLOLRhs6R3cRN8+NYk5/cOLTcKIiP7ee5vwf
	R9pOkwLQ+58IFq7LXbDa2VkF2BL9cRNc2AwI7JWR/8kpmu4co0QZKkmcV2u3sIRe+hnAvUNhs2u
	wIdprBrGXT84hI8Zj/QOwf9cCDwYRtqk73nwjre+CpqEnCOCXozNZlw52aoMnKR10urYeq+sb47
	qWTh26APAPq+/p9JBW
X-Received: by 2002:a05:7022:6291:b0:123:3407:1066 with SMTP id a92af1059eb24-1276ad525f9mr5835232c88.43.1771986618857;
        Tue, 24 Feb 2026 18:30:18 -0800 (PST)
Received: from d14e337afe00 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af2edd7sm12980320c88.8.2026.02.24.18.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 18:30:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 25 Feb 2026 02:30:18 -0000
Message-ID: <177198661762.2609.10025494411620900125@d14e337afe00>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3ef088b0c5772a6f75634e54aa34f5fc0a2c041c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
origin: maestro
test start time: 2026-02-24 15:28:41.012000+00:00

Builds:	   61 ✅    0 ❌    0 ⚠️
Boots: 	  191 ✅    7 ❌    0 ⚠️
Tests: 	18227 ✅ 3255 ❌ 4913 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:699ddd981f24bb694636e1ab
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:699dcefb1f24bb69463698d6
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-pcie
      last run: https://d.kernelci.org/test/maestro:699e08001f24bb6946373f4b
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-usb-hub
      last run: https://d.kernelci.org/test/maestro:699e08001f24bb6946373f4a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:699e08001f24bb6946373f14
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_33800000
      last run: https://d.kernelci.org/test/maestro:699e08001f24bb6946373ee2
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:699ddd5b1f24bb694636e061
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:699ddd521f24bb694636e011
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:699ddf621f24bb694636e774
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:699ddd481f24bb694636dfd4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig+kselftest
    - Architecture/compiler: arm/gcc-14
      - kselftest.ipc
      last run: https://d.kernelci.org/test/maestro:699dd28e1f24bb694636ac4a
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:699dd2a21f24bb694636af32
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:699e0fce1f24bb69463749b8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:699e0fce1f24bb69463749b9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.JCT-VC-HEVC_V1-GStreamer-H-265-V4L2SL-Gst1-0.MVDL1ZERO_A_docomo_4
      last run: https://d.kernelci.org/test/maestro:699dd2ef1f24bb694636bc5b
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:699dd5371f24bb694636d4ed
      history:  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ipc
      last run: https://d.kernelci.org/test/maestro:699dd4051f24bb694636d016
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:699dd4191f24bb694636d092
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig+kselftest
    - Architecture/compiler: arm/gcc-14
      - kselftest.ipc.ipc_msgque
      last run: https://d.kernelci.org/test/maestro:699e0bfa1f24bb694637424b
      history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:699dc92f1f24bb6946366112
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:699dcf371f24bb6946369d5a
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_1
      last run: https://d.kernelci.org/test/maestro:699e08001f24bb6946373edb
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_2
      last run: https://d.kernelci.org/test/maestro:699e08001f24bb6946373eda
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_av1.AV1-TEST-VECTORS-GStreamer-AV1-V4L2SL-Gst1-0.av1-1-b8-00-quantizer-24
      last run: https://d.kernelci.org/test/maestro:699dd2551f24bb694636a81f
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - fluster.debian.v4l2.gstreamer_h264.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:699dd2d91f24bb694636ba93
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ipc.ipc_msgque
      last run: https://d.kernelci.org/test/maestro:699dd5281f24bb694636d451
      history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:699dcb7c1f24bb6946366a87
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:699dcdcf1f24bb6946368ea6
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
