Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B3A3749E1
	for <linux-next@vger.kernel.org>; Thu, 30 Jul 2026 02:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378623; cv=none; b=VCTg/919ps6uXyLmofIrOUp6+uxs9hiPJ1GLwx4Jzj20NTzb4XI+H2UOtyl/vaJaYp8ZyBS7IF+dh03y9HjZqS/K/KIXOFxgOB6QZWLKL1+KSSrq9g7YfPvu100H+Xso14tNHqNvcnLyXhQiWuGj3Di+Z+cpM8NXlG4FMh8rnNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378623; c=relaxed/simple;
	bh=kzDVddCPJWewSMbtoiNLBkyu5xAGUISd5awGqbrHUSk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=iu8zL8In3wan+PXqaMSykSvuWeQm6LqHH1jtPTdS3XJ0ov2BubJDcK4M8TztlUFLOuApQw8OX+5TSyVn7N2W4QgDFIA6GKPbWG1f4inW5xbsv2zGXRRQWR/yfL7uBIxskUROBZjJJsG9F9uOk1ZEJAzqVVO4/e4IkJMmNdOR9pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=VioLOa7R; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="VioLOa7R"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1574954a91.0
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2026 19:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1785378620; x=1785983420; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XfuXpSGSTa5B2JnzEV/6SyjCvPHSgKfa6sJVW0lfhRI=;
        b=VioLOa7R7LWGfYq4NFHkdTVU/pFShZyMDJRCCIGykuoWOSkiF03S5mvO3IKU2RyK3e
         bixDzgJUKH8/OqZRvS/7MIuzeSbL+TuVE+QlOqT4XBROsgGWzQ8wn/+472G87E3Dvwma
         5bxIltGY9br8oA67n5jQxU1XgyYHOLNEsT0Z6de7xrkCkbYR/58xwhzgzQ4y/aWeBl7V
         c5A68WnwreyQIx9YfT4sjLoZZ4sV1AS1F0QWkwooj6FMOiHKiPQ24FM6NgaGMMFifEKH
         Pw5/rf73lwQW+PwWKX6RMY5FPJfsXwURV28ZDLQvAeYTpah/ocu1HyY7a1iJ339DWyI9
         HmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785378620; x=1785983420;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfuXpSGSTa5B2JnzEV/6SyjCvPHSgKfa6sJVW0lfhRI=;
        b=fPCsMLE/fCiX525H53j+uqZFyAwhxSvpnqYUVuWHCB9MOugHCqdqkUUpjkbMTOG8B3
         rE9U87WrXSVLBc2aQa2vCFYH9CnCJYfmLNJ3oxUD8TwsDVZYcIYGI4J5tosnsREr9Cdd
         8ceMIgHneEzpb+gMygf9kJuWmpeJcu1Xz4FNpiTfLgcC8XdwqY+bMNSFmGQUl9060zGy
         q7locSvPIZC04Hjh2ahLiS6m6z919yzgoGn3tGy0WpPj6yOi/FuZvQGNnFRGz+Ls0lzj
         1bOCztftcTux0rawYWbtpiaZGvn4d4T2fapfo2jty/wSSTGYg8OtVVxcFuwAINgwEHwm
         OFkQ==
X-Gm-Message-State: AOJu0YzIUOxwEGNwz+7FsLkwLvv/myhZZ8enSpUTK1SCt3QYfbJbSJW8
	42PPm/9InUp6SVht3VGY3caPnKzM9mzJGTS+hYbBejqxCiIjMTLpd5Odfee8G+/bPTLD+cHmEqM
	8CM06
X-Gm-Gg: AR+sD11/vMJ465CSuS2/RrUVA1dbCsFtvPPU6WL+dJ+L8uu2JyZkp6cCkX+AHw9Apq8
	HAYyI2GCv5CNylsJ5e5ur5uvPa+FZSuTPvlE1J0qgdPcx8lu+fGCjvt8NEmYC6a3yOFZqF2Excx
	t1eeV3CP+q4CCUPyx6Vh5VXJkyc+1ayGPRHKYkqUNur7XZdMJu5jcDuWMncQ5iH8RL6VhXUmiV3
	VKqZvZHeO+qpl5AzUx1VoUCdpzuS0SGQaM+ADERMwVGgjfhOrROqMF4qIVm3BozjiIBs9kTo3tK
	KD/+CEsfjvVBSbD7+QmvxIlRTaTv07DioqVttIUhFF/+pyWkauy99TZtTEfvt5dCStXMN6wSsVL
	A2zyrRJCH4IIpetYszfgRpXb0K59N35HcX5mALtg3jQoWhJb22KGgruDj7b4vzycEt9WRB/qeUU
	8O68V8+1NaSV3DDTOVI89LzKHCre7vXeueU8qRTCzZukBco0ZiMib2lQ==
X-Received: by 2002:a17:90b:3804:b0:38e:712a:be66 with SMTP id 98e67ed59e1d1-38f9c0ceb40mr664355a91.33.1785378617909;
        Wed, 29 Jul 2026 19:30:17 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d480c5sm24178552eec.25.2026.07.29.19.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 19:30:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 78bc8af4affb9a732504eb22eeac7d1e50883853
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 30 Jul 2026 02:30:13 -0000
Message-ID: <178537861323.3779.11817353470428662498@92650adf53de>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/78bc8af4affb9a732504eb22eeac7d1e50883853/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 78bc8af4affb9a732504eb22eeac7d1e50883853
origin: maestro
test start time: 2026-07-29 15:46:10.211000+00:00

Builds:	   70 ✅    2 ❌    0 ⚠️
Boots: 	  155 ✅    4 ❌    0 ⚠️
Tests: 	25892 ✅ 1917 ❌ 5246 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_61
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef881807
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_62
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef88180f
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_63
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef881816
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_64
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef88181d
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a6a3815798ea6c1ef881846
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a6a3815798ea6c1ef881854
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef8815cc
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a6a3487798ea6c1ef87ee39
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a6a3502798ea6c1ef87f459
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a6a2e66798ea6c1ef878524
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a6a2e91798ea6c1ef8786d9
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a6a3a11798ea6c1ef8837b7
      history:  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_59
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef8817f4
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_62
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef88180a
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a6a2e57798ea6c1ef8784c7
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: gs101-oriole
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a6a3311798ea6c1ef87b21d
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef88183d
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef881844
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a6a3815798ea6c1ef88184b
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a6a3815798ea6c1ef881852
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef88183e
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef881845
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a6a3815798ea6c1ef88184c
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a6a3815798ea6c1ef881853
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_pcm-test_default_time1_wm8960audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef8815d8
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time1_wm8960audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef8815d1
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time2_wm8960audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef8815d7
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time2_wm8960audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef8815d0
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time3_wm8960audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef8815d6
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time3_wm8960audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef8815cf
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time4_wm8960audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef8815d5
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time4_wm8960audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef8815ce
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time5_wm8960audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef8815d4
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time5_wm8960audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef8815cd
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time6_wm8960audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6a6a3814798ea6c1ef8815d3
      history:  > ⚠️  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a6a3a7b798ea6c1ef883ae8
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a6a3d1c798ea6c1ef885d27
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a6a2e2f798ea6c1ef8783cf
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a6a2f3f798ea6c1ef8790d5
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000
      last run: https://d.kernelci.org/test/maestro:6a6a3a13798ea6c1ef88388b
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_display-controller_9801000
      last run: https://d.kernelci.org/test/maestro:6a6a3a13798ea6c1ef88388a
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_dsi_9ac0000
      last run: https://d.kernelci.org/test/maestro:6a6a3a13798ea6c1ef883888
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_dsi_9ac0000_panel_0
      last run: https://d.kernelci.org/test/maestro:6a6a3a13798ea6c1ef883886
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_phy_9ac1000
      last run: https://d.kernelci.org/test/maestro:6a6a3a13798ea6c1ef883885
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a6a2e38798ea6c1ef878420
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a6a380b798ea6c1ef88152a
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a6a2e78798ea6c1ef8785a2
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a6a2edf798ea6c1ef878ae5
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6a6a2eed798ea6c1ef878b1e
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
