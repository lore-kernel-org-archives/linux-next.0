Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD07D221DB1
	for <linux-next@vger.kernel.org>; Wed, 28 Jan 2026 02:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567448; cv=none; b=Q67T/lF9Y/WICQq0tmPjoAp8JI3xFnZ7pwl7UDl87kl2ZinWrwPf0aeyFyrXaNzll7ie8+SJID2XP2gZgoHFbholoCWlwrH+R9BHnAMr/gbhc8dZTBBXOzniNMoYBV1CqEoR6sEGCIvSMm19HKuqz82RR+nQi4ruS4XxBwzAz78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567448; c=relaxed/simple;
	bh=YnMFELsICCwpVS9yCLDZ244GsfrEGLIbu1voEBEZd/E=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=iz3p0ybhPrsoJyiFJSrPCgbBQOltvlBLmZHeH+CeDQK8OX4g/japE7ofczWK/Io0hlddR0EmYQW3Bnjb5hOU2z3IvzgWaBKkkpVEsqLLfmPk9BGgh7NGIzLWQa1Teeb6uI9hG34di8EgXEpWi1DQJjj7OmNEJBsItpbhJy1ZIo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=3QmNVel4; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="3QmNVel4"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2b704f08e73so262322eec.1
        for <linux-next@vger.kernel.org>; Tue, 27 Jan 2026 18:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769567446; x=1770172246; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFf5wPcdqsQQs7a4ehkfYO5IFPm2ZzA3FzjQrIw6kkQ=;
        b=3QmNVel4H1IAa5CZ1QSsv2NOYYMR64Od3gLzMj2g/Wwfmcld3SqDwI2EcGBpKe4nz2
         LLMZiDuMoz3A20rlabvhCoNkCKDeV+T/7nkUf5S0ir9o89NBqwY2UFhPWnLbYj0fJiOl
         4mnA8HpqTMOupREwHpR55dF21RuusGIexInPjA1JqUIC1zmnuSaJBIk/pGe4RHbrW/rO
         0W+m49KZa0eY7yFCaaOHWhDaCgHY/j3+w9UJBK8dpB0nehnL+2j0/2uqcJ6BWryaZ+LH
         g8JtmyYTwBTP5ZIz1lden1IIU84mMbT8x+LlG0YFp3KCUVceHByzFD6tDqZ3lv4vuTtx
         MMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769567446; x=1770172246;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HFf5wPcdqsQQs7a4ehkfYO5IFPm2ZzA3FzjQrIw6kkQ=;
        b=bWamePKYFfw2CsNcZ/xAXZOFiUh5fHUJiN/FbckxbBFXs739ksNaV28s5VB/cwN0sJ
         TOGlCNiCGJxObeBs8qieUbltbjEC/z5up9OrUm1fjziOSPxqR0afJbRne0YWPRXnph5g
         kTpWnpx/h3hcCir3JzMkCn36diys194rKGfiohUjnwXt+vHCpEyLunLn6z2L0BSZuzP5
         LdjoFEbI7EovvL9QVJ+7BAaXtNSISRpMySaVnTKpsADz0jLnDyOTYZZ1RcATUKVpBU8D
         ZsbVmliunZtL6BLeLvn1bdFC7utsz0Xx+Q5j5SL4vPW/FWT8iwZbBBM+pYYv8IBN362j
         P3Pw==
X-Gm-Message-State: AOJu0YzRcEdEf1VlcLNDBSrLNF0OE8lYyaex4dQG/PZM7USecpjBfjkL
	jgz3S/H3llskeTNoMMf2vhYC4I5yYNvR+Dg5b3PoAYqbBLG0l/hQjQL0ITxNDMav57Y=
X-Gm-Gg: AZuq6aJPfWkHMphJRIkuMp+Wd0dE0CKyzOalVuXqVyjraB/G6VvTj2Lgwhc1B/si8x4
	9tFVC3p8G7bR87TXi6nIA0Lb4D7pkJii3IhTVU24GVLGCYe7J/vIgPjZEDzGBPKZmDcduNd/ODp
	lBv/lAfdo0DbZw+SRMxOxFI3R2XvQKiZqnAmgwz5Jfh8XYNWIn4gvyQb3okkdZWjyznIQuaMqfd
	IJFqyFQjBfixNoVYdFm3+7XS47L/4CR8DHXfF0YtZutqLV/3EpyqNCDSfq/2HpUa/10snMJxmsZ
	70V3Cd+NLq+9BUVk+llAmHBaLe3FDvckFxRIopKDEv9n2HXjn/wFHptCior3aja4z6yALT3Q/Md
	ft5bsl0ZRqLfP6mAGtgW19HFGzgMmSCqfyELSM+WVFkijob+4LEFK04nkqqguhoLRZCOKFyCW+a
	A+vWQY
X-Received: by 2002:a05:7301:d1a:b0:2b6:e793:caf7 with SMTP id 5a478bee46e88-2b78e867146mr2023426eec.18.1769567445089;
        Tue, 27 Jan 2026 18:30:45 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abe92dsm757702eec.17.2026.01.27.18.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 18:30:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 4f938c7d3b25d87b356af4106c2682caf8c835a2
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 28 Jan 2026 02:30:44 -0000
Message-ID: <176956744409.3456.1035229692691131889@22d5995788c3>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/4f938c7d3b25d87b356af4106c2682caf8c835a2/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 4f938c7d3b25d87b356af4106c2682caf8c835a2
origin: maestro
test start time: 2026-01-27 18:11:20.427000+00:00

Builds:	   48 ✅    7 ❌    0 ⚠️
Boots: 	  150 ✅    2 ❌    0 ⚠️
Tests: 	 9004 ✅  961 ❌ 3029 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:697914971908a6300d9a1d79
      history:  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:697916021908a6300d9a275b
      history:  > ✅  > ❌  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264_frext.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:697915481908a6300d9a2358
      history:  > ✅  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_h264.JVT-AVC_V1-GStreamer-H-264-V4L2SL-Gst1-0.SL1_SVA_B
      last run: https://d.kernelci.org/test/maestro:697914de1908a6300d9a1eb1
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:69790c071908a6300d9a01a2
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_av1_chromium.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:697914911908a6300d9a1d65
      history:  > ❌  > ✅  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp9.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:697915781908a6300d9a2550
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: qemu-arm64
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.signaltest
      last run: https://d.kernelci.org/test/maestro:697914db1908a6300d9a1ea1
      history:  > ✅  > ✅  > ⚠️  > ✅  
            

### NEW BUILD ISSUES
- Issue: maestro:6655b8550c87523fb99005c0e12cae13e112bffd | version: 1
  Build: maestro:697901681908a6300d99fba5
  Comment:  drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7b: can't find jump dest instruction at .text+0xcbf in drivers/hwmon/cros_ec_hwmon.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.warning]
  First seen: 2026-01-27 18:39:11.736109+00:00
  Culprit: code
- Issue: maestro:6655b8550c87523fb99005c0e12cae13e112bffd | version: 1
  Build: maestro:697901771908a6300d99fbb8
  Comment:  drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7b: can't find jump dest instruction at .text+0xcbf in drivers/hwmon/cros_ec_hwmon.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.warning]
  First seen: 2026-01-27 18:39:11.736109+00:00
  Culprit: code
- Issue: maestro:6655b8550c87523fb99005c0e12cae13e112bffd | version: 1
  Build: maestro:697901871908a6300d99fbc2
  Comment:  drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7b: can't find jump dest instruction at .text+0xcbf in drivers/hwmon/cros_ec_hwmon.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.warning]
  First seen: 2026-01-27 18:39:11.736109+00:00
  Culprit: code
- Issue: maestro:9be47da80cfd017764d8a2750178c200bba3ef54 | version: 1
  Build: maestro:6979019c1908a6300d99fbd5
  Comment:  drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7c: can't find jump dest instruction at .text+0xc40 in drivers/hwmon/cros_ec_hwmon.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.warning]
  First seen: 2026-01-27 18:55:11.753580+00:00
  Culprit: code
- Issue: maestro:afa9c68f088cdf27ef09179db83770ab9ade3741 | version: 1
  Build: maestro:697901a11908a6300d99fbd8
  Comment:  drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7c: can't find jump dest instruction at .text+0xcf0 in drivers/hwmon/cros_ec_hwmon.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.warning]
  First seen: 2026-01-27 21:56:59.041915+00:00
  Culprit: code


This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
