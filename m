Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF511E32D6
	for <linux-next@vger.kernel.org>; Thu, 16 Jul 2026 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784169019; cv=none; b=oIFV0tzOxJz8/7Zs68WxUcXG/TTzh82TkZPXjsuBR1dRawHs3CdxjqCAuDz4YrN5jOK5VJHjNXVv6n//YvqpqA/YvMN3ntvssTsIVewCcO5Pk8rbawtJQKoHb3hrLEZ9vmr+0ssyHUmiJgdwAfUVpOI/GHQFEVQollbSODHzAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784169019; c=relaxed/simple;
	bh=CeBgzF9W/pIPoBDfums8tWzFzLrHqAGSHYO3csH7DJQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=VDcu/i7AoipdcGs2t5RQXDcbWwk62EBO7hdi3h076sZ46dGP4eI+c7KdxT/ohypvy8QmTx5kmxpSmKmq0N/EKjHZbe3WTLFh9womrZTh5AXWUKnlsZOMbQlkFcplj3zCD8tfJM24f1kcd+so9qpRNxYkasSTTCQLDGKoDMvIFVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=eZfnZLce; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="eZfnZLce"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cad4170e8eso77190955ad.3
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2026 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1784169017; x=1784773817; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SLJmZyQBdKjFr0e5FA22dJ9eZHx4x0uAVW1IWVEaCO8=;
        b=eZfnZLcepJqebznkX3yrQCnL0PuQsGxO2f6wUxhGW6PMKFwrfn7lJrYjqKZyWvM6v0
         EwaY01+ttTQ4mK2IhdVM6e0Y+MZVXu5DMWWzWtSq4+4b1aSuuMi/LxF9RwyHXjygqPJ2
         Jvz4uvSdn5/ckC2sLS+QrqoNwCWvvoa/rJQoQlQ04u242GzYo/G2TmO1gmH5K7mZOO0Z
         oRTq+O672NhbN/Hub3rtEB5HOFrKNWKmUUxQ9dZxx39wmbRCcayPhjzG3LHueeAzEBwi
         QizZGzh3juJeosrs/riKBv3XpKIeg0ysm7AUSDehQr1bFptPrvkP2gR7Z+UogiMbv3sq
         1Wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784169017; x=1784773817;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLJmZyQBdKjFr0e5FA22dJ9eZHx4x0uAVW1IWVEaCO8=;
        b=OWokuBqhfymAf9nC0d+my8fbO826ylzjCbhpvxZuI/N+bGvPlxXkhtCbk0qgShHQhY
         liu2nbEVQ1quzgP7tDyuI/HIdBurfKVLGBTruziJ+T7cnMhDoQHyuCb59plGlV2M0H3g
         rHCTu49ltd4hwk8D6cOq7C0VqAwKKq3mxzdIdzW+9LZZqh0iG5mDC3li4rdcq/nCLhhW
         K8J5jPtKMlG4MDJkne5pf3wOLpZXz72LfMzlOHxKUFW6NcZ2tyMctSpUh1Dta8ra8dCT
         DHppOgH+nv2MZ5Pxg+tqDlLol0TDzWVA/6es6qsngo+RTY1YP8+7R+1kHL5FIR4yrSgZ
         UT4Q==
X-Gm-Message-State: AOJu0YyNaMjx8mnG2K8OlefydVlJZEC4OfPAIcRYuP64s33orsaqHxL+
	4/Ad5LSGoB27Krwux80wr9v1hSvNRy0OHrfxLbkQnL8JWwPfMj+J7yrmmhkT4REtyCHko61v30w
	IuKbD
X-Gm-Gg: AfdE7ckUhDY8CXz3qY5B1jDBoc4SJuQCfSmmsF6kXqVtonEnVs/LsHoa7VXb8xRoSLT
	gwmWCbGEQs7DeCCPkE/xxg8cfH3xN+HHgNy+wHWtWhAvpWSB3Vrb1T7MgBdWsFE5JtnDVRc8nBE
	Je3NIrTFDVKyI7KOKXAAO5/rXPWrbCg5O39q6RPssOlrjdhD82+XhN5jR59+ZTztRPYRL6wjQbF
	jEYDyPpR1ciIZjxyCkuFq9S9BAZUOH/65tr6jcw24eDiLHFO4BvovQ4Ftl+K5KJgQs9YQEPPru/
	LwL8G3Ch01dMDEVvIu8TK873PXyHVieA/FKi9op7k2cwBnVTPacCcsA44Oidh70hXaIzpGGMLrc
	kOtoSPuN3mIfySwS+bIxSnnXOtSTAjuIgxnoxJYk76xhNENwle3uxCpa2rij+oksB68IaCNw=
X-Received: by 2002:a05:6a21:8cc9:b0:3c0:9c18:d5a6 with SMTP id adf61e73a8af0-3c35729077fmr12119512637.67.1784169017010;
        Wed, 15 Jul 2026 19:30:17 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd426ad8csm5166078c88.3.2026.07.15.19.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 19:30:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 16 Jul 2026 02:30:16 -0000
Message-ID: <178416901568.11227.10566849558948616860@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/b8809969e1d7a591e0f49dd464a5d04b3cf02ab1/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
origin: maestro
test start time: 2026-07-15 15:43:28.290000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  163 ✅    3 ❌    0 ⚠️
Tests: 	27829 ✅ 5184 ❌ 4978 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a57bd6318a4add1354c2218
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a57b78e18a4add1354bd381
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a57b67418a4add1354b983f
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_4080000
      last run: https://d.kernelci.org/test/maestro:6a57b64918a4add1354b912e
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a57bc4a18a4add1354c157d
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a57c0bc18a4add1354c5672
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a57b61318a4add1354b9008
      history:  > ❌  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a57b61218a4add1354b8fff
      history:  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a57bd5118a4add1354c1b84
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a57bd5118a4add1354c1b92
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a57bd5018a4add1354c198c
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a57bfdb18a4add1354c4e9e
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a57b74118a4add1354bd12f
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:6a57b74118a4add1354bd12b
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:6a57b74118a4add1354bd123
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a57b74118a4add1354bd122
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a57b74118a4add1354bd106
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a57b74118a4add1354bd105
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a57b74118a4add1354bd104
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a57b74018a4add1354bd0f9
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a57b74018a4add1354bd0f8
      history:  > ✅  > ❌  > ✅  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
