Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5912BDC2F
	for <linux-next@vger.kernel.org>; Thu,  5 Feb 2026 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770258612; cv=none; b=czVwB1SEto93qt/GdoE59CAPCEtryt8Ksa+2ha7Yb/WFaPC3twe7/p7sxnfe6EkSGzHYAU1OJLMnDmzfs3Vpag8v12iNxga4snJ9NZ7ln394Gfuap0ndbAVxu7hxdyaD8VSv0j9CZGxfc9WwOAVr8v9X+h81+aW6+3YpyZfQkNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770258612; c=relaxed/simple;
	bh=p0hHMjEGslukK00fxLC2TVbUnXJMr9dgYxp1Y8lBurs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=qB+LYVGVNtMu6W1BTRt/HIyf4XDCR9SQ5gYzN6gMpESp+OMf60adYcjq8JjAGOD8d3ARUjxQ7X5mTg8RYsufF/T5cR0R4+JxqP6bokYxEyF+XTSMfwE34Ay2MByAQiqkHXEYxhq+iHGKPxPuQEaSSYjPCYZumiKKJm91bANdM7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ooi3bED2; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ooi3bED2"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-124566b6693so1482863c88.0
        for <linux-next@vger.kernel.org>; Wed, 04 Feb 2026 18:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1770258611; x=1770863411; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hna90pcKI661Wt9uYulVQ2PEHhqP3tlAKFAEzjRifQg=;
        b=ooi3bED2ApbsmWWJPaMAE2gS2z5PFgq0yVwr4xmRDGUlOQJ5hcR0Mf8oSBmkjQUXwJ
         dM3PphvBg7uax5hwmGi9YLVHqNbcqEq7yeNhPlN12WvGYyUkzhvPm3FWvSTM+f9fNXBg
         WKEPo6dls7IU1UmFK9Voc6aAXrVrMPu4vSiY3fjTKuu7s7vgYU9vLLHMsRvyQaMJQKQ8
         XrVbf+ae2l9rjzTP7brE+LaQn8yeMRu5DCug2vztf1hjfa+cfzOmYsLsc469Z2c+Z+Y2
         J8ifLoNovACzhLjgdvJnKxN3oQhflkP01D70SJl1YonrSNY2rQpDd9q6xmhic0/WQnI6
         hcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770258611; x=1770863411;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hna90pcKI661Wt9uYulVQ2PEHhqP3tlAKFAEzjRifQg=;
        b=SvWzTZboOAD0T96ghxpaR+vYtM8KRsFUzX64C4FzILYMksW0JBENfpOugPmHUs0bIn
         LQ7kaAlidDdnBY4INr2rv1bhfM6rbUzpAHyLIikBiojTg4LTHP0855LWdosz1qV79MT1
         DxZYMOuszEtdiwQqes+2pJA0KARqyvWw/zVr+qZDw/jUUQUPeaHLtSnA7zPWat/x2G8u
         dAVhc/nKnc34Ln8POrwRRdT7VEDkrBhDgdtn4Xt9WmnIqbA6Bi7bmImS6DSEhnhjovF/
         m/RnRITMpWVEudTX+iFGl0Fsol4UNAv5YT5n/+pNk+YJK4REV5+0p5a3oArykakVGvrq
         ig0A==
X-Gm-Message-State: AOJu0Yyg8YaFr0Z0+muuLqwHxEt2H0hJYj+9T2i17L5CeRVUYFD68qr3
	WvaMU8qj0DEuGUE/gVB5MCKzW7q0Jv14SbTbvHd0sdL3+ynhB/cG0CId/B7KRUKO2s+QJHxmGYU
	QpKpu54xzNQ==
X-Gm-Gg: AZuq6aK0iuVyPaXayMDfNr05gbW40UkWDLU0cVtD+piwSPtozzEfcyY2OSiqdB1Vco8
	wV2GOx3ZMzyvFOLnn5qqE8IecJqM8QKyEGIMkM1xrvRgmgJMhRm9U5p4M7au2NWPPnXZYmdjT6Q
	Snr6joG/CHsFjTzytb2t2HzUUDcv6nnTEu5YiMrjsemyIMFZJnJmquuQQF0gIwEJCLw+dPSb0lp
	qPupwhxsNn40VXfAMVL9+yUwcG7ZDJ/HEWRmjg1HfqMht2QxAz+Purta2/Z6IToiObbubTqZbU+
	Xj04NgTF7Q8W8DQOUB8I7h9zWsnRmTWSc2yPbFX9byF6wpGES5S/Nx28OGU8lemd5rFymZsk8in
	GaA1tSIOJ3uI54Zv16jtE5N935LL2mddJN3rV643mXGgRQdbv3rNEqn/3AsL0J9mvoAkG4DU0TA
	CczTbD
X-Received: by 2002:a05:7022:426:b0:11a:51f9:daf with SMTP id a92af1059eb24-126f478c6b4mr2071159c88.14.1770258611152;
        Wed, 04 Feb 2026 18:30:11 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f4e111efsm2950371c88.8.2026.02.04.18.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 18:30:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 0f8a890c4524d6e4013ff225e70de2aed7e6d726
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 05 Feb 2026 02:30:10 -0000
Message-ID: <177025860986.7167.3057853236503107933@22d5995788c3>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/0f8a890c4524d6e4013ff225e70de2aed7e6d726/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 0f8a890c4524d6e4013ff225e70de2aed7e6d726
origin: maestro
test start time: 2026-02-04 15:17:02.259000+00:00

Builds:	   48 ✅    7 ❌    0 ⚠️
Boots: 	  115 ✅    1 ❌    0 ⚠️
Tests: 	 7780 ✅ 1256 ❌  980 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:6983d087a1ae387ffbbff6ca
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2-Gst1-0.vp90-2-09-subpixel-00-ivf
      last run: https://d.kernelci.org/test/maestro:6983d24da1ae387ffbbffe5b
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_proc-net-dev-lseek
      last run: https://d.kernelci.org/test/maestro:698385eaa1ae387ffbbe9a00
      history:  > ✅  > ❌  
            
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:698385eaa1ae387ffbbe99f4
      history:  > ✅  > ❌  
            
      - kselftest.proc.proc_setns-dcache
      last run: https://d.kernelci.org/test/maestro:698385eaa1ae387ffbbe99f2
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:6983d045a1ae387ffbbff35b
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:6983cff9a1ae387ffbbff188
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_av1_chromium.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:6983cfbda1ae387ffbbfebc1
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:6983730ca1ae387ffbbe6a51
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69837318a1ae387ffbbe6a93
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            



This branch has 7 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
