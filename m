Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5272F84F
	for <linux-next@vger.kernel.org>; Wed, 26 Aug 2026 02:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787711438; cv=none; b=gXQieZCgZ2V4qTdIPahMCGSYnI4uR+ap/KWDHDW4q41lqvxDX4Y/c3FqL7ZmyLxzSrs9p35l1BpeUWk1kxQHVAmU9LzAOXEf8YFcuWt6H7lbdATwPby08A0e2uRCEUuazfKbx8+eNZc8kxlMmXBbSkgA40VdwJ9QnPO/Lk8Pd8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787711438; c=relaxed/simple;
	bh=nYbV30b4DLkITNljrWPbadI1MiZhVNG/zT6VavRiIic=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=CeErERIZp17VzBjd2MQJOdV0q8jo187Cyt8EHiCGih8yVRGzxGzX7oVjY6F5IeA+XQrYk5xDMuUDYiXGqc74UqMAqWwbk3/1GtfU80AAbpnLR4ZcjmsV7K9DvPcH/KO+1bmP4Vda6zgoeCELTwJ1NiCyoMOtpOtxxRaQpAtLSYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=eZvwohnH; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="eZvwohnH"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e041ea211so646731a91.0
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2026 19:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787711435; x=1788316235; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5QIMrafC4uUlxrwWEcnlSyGIzmNcOedoLpHqlw8/ai0=;
        b=eZvwohnHOhKkTeWFwFqtyYBmg9CV/Cy7nswKQfZlOMD3GKmKBjGKIKU2aQD6DD3f+K
         p0SHNC9Hma77QfWd9D0aA1wzoX7eQbe1H6jMhHrxPWIaWq6qRrUyBiunh0AAlC6lBRZE
         y6/DoRG/HO05nXaCNqXW82ceZDF/c/jhUM4D2fM7eLQeihFUOmeisLrfsHtzhrGd+8uJ
         jJ0SHbbGrdbv/KC6CCQv0ozYdcuR2Z762XrdPtG7CHKbw84wbOxV83ViH5cDSH/5oYVy
         WL9CMWpBY5zxTeOvVLoWOxJH9OMUiOYTjyyWT1oJv2Oef8stLqaDUPG7SGtbsIuUDQYb
         6HQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787711435; x=1788316235;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QIMrafC4uUlxrwWEcnlSyGIzmNcOedoLpHqlw8/ai0=;
        b=CUfBhzVunDMej/cdRHxJOF0zudNQgcNFhOzNJXBxs5E+7J751WcM+46hktWgb1kl1t
         C9mHYdi0cjzugw0HeinImQmd9W3vzoOlvDjA+dpXwZ1pSRf5vg6XuauSJtCfLKcIEfLg
         gjbOtR6j+xRx4+SJOWJzDxg05Y2pjfnGwDWGe9kIxVMZPTSuuv+BzhVaB/lciuKq6kPd
         TsaYmMLArg3hI5+gpJVW6Ueyzso0h2wvT1xCg8n/rNeZZCXQ4Ffe/fP+GpZEbR4Nh3KI
         lF41PLfPY/kwi38i/KvzaALO/qsM/LNLibIBCBALruYiCcW5aId8QSpB6/c2FbNOZrtP
         icog==
X-Gm-Message-State: AFuF++mIJNXrRfS1qIv6uE2q0G8W5vOkeT7Ku9EjYffRHq2QXvnk9YLl
	f1hkRMAvj079L3lq2u1ytaP4qEl4CFkoi22tjeUYh3VnMWKBTcEGjOZVI12H6C7oTu7unawhNWo
	RNH1+
X-Gm-Gg: AR+sD118aD6HmtnRoZBCZjC3fWZ99WDb8Ykj+FGAZLvncdVt8iVfXrYF4Y/Ro4+VbJk
	H4GT4GR7agd6HRgFiExWYIYZWywXf6mRL2RGD9KmZ4t74GF+JaU7+frGwhAufuHsncCmrpvKCZw
	N6rbTOPWPGUd1yDQGnZvvATa+gO4MwdU5mdE1Jt92d0l5Fn2YnYtRlBKsnN5ml4W4ip1nrveKBp
	wiqJSzH/ZQ46UNyvXdBx0EovYJ34P/7FZFlQks0wVzejUHr2sQNrR3S/won/31Zw7ik+d6HmY+3
	5Pf2yw4efgCMJCnBjoTySGiSeCKSyk5E24brkgHv6VjGVvAP3lFllcTOaL9Sz7gflIy+LXAVt+a
	Jc9rsI5BSeHEhD9reMB8WRJuVnCfqlqwrZEh73y9U+Hltu2a1BfwHhTginH2BAehZMGcV1i9Zcg
	OIrYaF/sLI5mKZiiIUMfPHCwIo+oOy8mox4XS3raMM6am4tWQOUZvqCCH/8F3NbRA=
X-Received: by 2002:a17:90b:4b04:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-3966d5f900dmr7035921a91.8.1787711435090;
        Tue, 25 Aug 2026 19:30:35 -0700 (PDT)
Received: from b455de3d9de8 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c291sm5386281eec.6.2026.08.25.19.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:30:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - a8406e6c0b793ce0788019683837c40855b55995
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 26 Aug 2026 02:30:34 -0000
Message-ID: <178771143404.3315.12996312992763552709@b455de3d9de8>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/a8406e6c0b793ce0788019683837c40855b55995/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: a8406e6c0b793ce0788019683837c40855b55995
origin: maestro
test start time: 2026-08-25 13:55:14.264000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  180 ✅    1 ❌    0 ⚠️
Tests: 	33020 ✅ 5193 ❌ 6808 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a8da78862f33761c016639d
      history:  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:6a8daa7562f33761c016b4a8
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a8da78362f33761c0166391
      history:  > ❌  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6a8dc3fe62f33761c017d51a
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6a8dc3fe62f33761c017d519
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_ae90000
      last run: https://d.kernelci.org/test/maestro:6a8dc3fe62f33761c017d517
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6a8dc3fe62f33761c017d515
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6a8dc3fe62f33761c017d513
      history:  > ❌  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a8da73c62f33761c0165ab9
      history:  > ❌  > ✅  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a8da74a62f33761c0165b86
      history:  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a8da73962f33761c0165aad
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a8db26562f33761c01701d2
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_60
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c01850ad
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_63
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c01850c2
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_61
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c01850b9
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_62
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c01850c0
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_63
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c01850c7
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_64
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c01850ce
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_57
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c018509c
      history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c01850f6
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a8dce4a62f33761c0185104
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_73
      last run: https://d.kernelci.org/test/maestro:6a8dce4a62f33761c018510b
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_57
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c018509a
      history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c01850ee
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c01850f4
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a8dce4a62f33761c01850fb
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a8dce4a62f33761c0185102
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_73
      last run: https://d.kernelci.org/test/maestro:6a8dce4a62f33761c0185109
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_57
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c018509b
      history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c01850ef
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a8dce4962f33761c01850f5
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a8dce4a62f33761c01850fc
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a8dce4a62f33761c0185103
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_73
      last run: https://d.kernelci.org/test/maestro:6a8dce4a62f33761c018510a
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a8dadc762f33761c016d423
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
