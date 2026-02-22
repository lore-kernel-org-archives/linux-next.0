Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E873EBF08
	for <linux-next@vger.kernel.org>; Sun, 22 Feb 2026 02:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771727455; cv=none; b=STpOVKeknGaPmfj6gwZ5yiGCBni3wcKpHNe4eLLgwbeUxGOdVjk1MoU0kriPGt9WBW9mIc7J9UV4hoFZ+mUblY1/DB2X60lhNRz32JVlNJEm2QD1LbUMwa9QEm7ciYNoNoXr/ejiL+Le2EScN166ZzzAL7QJqO8+A7HbHfvFb+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771727455; c=relaxed/simple;
	bh=h3nLBtQoSB/d4OcGUac8n6SHGK7F6f7HX+h/q7JQRBc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=iQSCjMnB9WWw6ScPYGco4ntmC4X3JFyDKEUJtEIhV+37G0ueOhTdElSmVQcZeqfB3wAxR2s4krHZahh3qIxswHdYjRefZ6uW1j6yzfJO6bnmfcLNwQxFON+WX9qcgtSdB0kG1byhU0VrxVdnSEw2gaSnLPtt8MTscuL+bDuqd2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ZSoTBEdS; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ZSoTBEdS"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2b86ce04c5cso6504158eec.1
        for <linux-next@vger.kernel.org>; Sat, 21 Feb 2026 18:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1771727453; x=1772332253; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdeHNHxsEEGSGdH7+/IZ5DN7MUoj+CZHRvc9GHtcWIw=;
        b=ZSoTBEdSSpjBljmRhB1owCZLGXhtzD1WgG6+OxH5OHtnM2kPAzimpgnGF6l8+mVkyl
         dd5GvbHieBVQk+PzXVDf8g7yYkSpNlpDK16Z3KK68mEzKkhpa9jRtZTOqFzc6fTC5KDe
         CJbpUmhZyWeU8gJ1OgniazDJ6iBytuAz1QJBbsOdHKw3nIbxHS4oxFq2T8yLT3ylUfrx
         TGQ0njuIB8wLmWUWoBupy64pfi2Y8Rdbv/0WE6LLUp7I9TRkp05rBQQzgBgP9pKPutBy
         Sz5suQ83FtAKZO4tw2IBhyfMvQk3ZyzB8wkTjW/42NfYuoHzZiUYGwYPEcFqPjFeGW96
         YU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771727453; x=1772332253;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KdeHNHxsEEGSGdH7+/IZ5DN7MUoj+CZHRvc9GHtcWIw=;
        b=PcVNR9sZy5Fvrfj5clf2oqOhK7FEXUgTvpuFhCm9cIrjVFMEq+BYvWO19MJ9wnA+wK
         l1y2gogjJkfdNFknU0noy5Uwpv5dnR1N2+x0BGLN2eC8d7C4J6JGbXmr7mb3XW5odtz5
         5K4vYFJ5VUlOa95LG57ON5fRR2r5oqttdHE5N4gGsh/Bw35zQ2a9jqTWn0ZS9qF6gjJa
         k4Zxc1ZSPPYiccSYtYrxSoO+SO5NVDOyvwhrP0aEaCQYVbN8hnqOeqVODAplJTskHTEy
         khtDGq+iHLEmw2+f4sB4Tl/PuelHsT2EbAztIMxILwiAWEDcCbbKkliVj1dSHu0BiUIW
         A67A==
X-Gm-Message-State: AOJu0YzIqwLJRyPs84dF3lFwdbzkUqJaTjdAdmatOMhR26zc3QLnozVl
	scFh5Faaed2XAcEpre2OxoCyptXZ9Q+sHku+NUiv2Lc4YBuGjlSs47bCbVoP2OplYRg=
X-Gm-Gg: AZuq6aKQRFyj1wGU3YSWi6T4sNQb71nnaXajlEY99VBljpYG90BTXa+XmC+mb1mm/ZE
	h0iWHWpqGkhUb3a4CybuFsbIGV1O1kP709kZ32YRmG3Il3luOcI9KafWKc1bmMwXZu9Uj74VMMP
	DGL2X7yDJPSaExwsWvXoFXUkIZURAIwwbrVb7ARnuHGt/C86nm2rM/ht5CoU+xfzr6l51+fBN+p
	d9ama/l81MWrYu+ur99g4tBAvLB8kWuyFQWKIDIn6TbzMrURva+1uPT0WLsoPwxfaV24k7yqBfv
	K2cnuuiAHG52TKXmz134OJnAspvMYWQYpJlqPZNCM2GEuQbtdVyShpnAK+cea+etxz8KJC6Dz0v
	TB4rvK11urHq1H0B5fEeWUQbgQFM+kJGZ/qfJtANDorflanUlGfSZbZ10nwXa0y9uZT+hfZTJuz
	ohmFnV8XkGf9ZwCxam
X-Received: by 2002:a05:7301:3e09:b0:2a4:3593:645b with SMTP id 5a478bee46e88-2bd7bb4a5a3mr2011399eec.11.1771727452795;
        Sat, 21 Feb 2026 18:30:52 -0800 (PST)
Received: from d14e337afe00 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe8293sm2407819eec.16.2026.02.21.18.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 18:30:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - d4906ae14a5f136ceb671bb14cedbf13fa560da6
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sun, 22 Feb 2026 02:30:52 -0000
Message-ID: <177172745158.1226.13986312775204211059@d14e337afe00>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/d4906ae14a5f136ceb671bb14cedbf13fa560da6/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: d4906ae14a5f136ceb671bb14cedbf13fa560da6
origin: maestro
test start time: 2026-02-21 11:01:54.016000+00:00

Builds:	   61 ✅    0 ❌    0 ⚠️
Boots: 	   66 ✅    0 ❌    0 ⚠️
Tests: 	15170 ✅ 2941 ❌ 6058 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6999ad6e1f24bb69462a8eb8
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:6999c7f61f24bb69462b83b2
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_av1.AV1-TEST-VECTORS-GStreamer-AV1-V4L2SL-Gst1-0.av1-1-b8-00-quantizer-24
      last run: https://d.kernelci.org/test/maestro:6999ba681f24bb69462b363c
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_h264.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:6999bae61f24bb69462b38da
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6999e4141f24bb69462c82f0
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6999e5e61f24bb69462c98be
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:6999aaaa1f24bb69462a832b
      history:  > ❌  > ❌  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6999c6f91f24bb69462b7c58
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6999b3041f24bb69462adb8a
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:6999b7201f24bb69462b00f8
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6999adb51f24bb69462a90ca
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6999ad7a1f24bb69462a8eed
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.JCT-VC-HEVC_V1-GStreamer-H-265-V4L2SL-Gst1-0.MVDL1ZERO_A_docomo_4
      last run: https://d.kernelci.org/test/maestro:6999bb9b1f24bb69462b3e86
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6999ad971f24bb69462a9038
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6999af4d1f24bb69462aab85
      history:  > ✅  > ❌  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
