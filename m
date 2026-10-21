Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549817;
	b=3eG+UZqbtH3k4Ws89cIEGDuySeSApo1xq5mjyLRFT6Z/4Zb25tql2/fUmKjLgcFr7eWd
	 W+cTADpt6+GltmpnreN2trHwK686U1QK2awFYBRTn0f/2FRm2WIszEZVillIWublodkkU
	 zANWRsegLf4NlMzHzBlHVivg/iDyvz1bizBd2d+o3hw3G0vW5WRbRH7EN8q61V1glDO1O
	 w5e0lp4mE2ZKVdC16IqLB8/cOaP2S5NOhV/e1QEzotV/Jhi/OwPssYO5uPdw7NenoQQ/t
	 XzNkTq04eK9gyO3PfrNSwrBdTNyjDmO5K9x5/4/YncCL4pkTf8BBAivnfY88HYuqFeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=RtukX/2ysY7x7vd+/cNR+kCC5luCdLJtTXyvk3nz13k=;
	b=4hW1Or+pk0+2KL3OJONCGoEY3lgZOEWToR6j1UkSBevskEGula1D6I+PtRJszTR5vF26
	 sbgiwp2VM+DGOtdD08rYqgH3kj4tE1I1J0t935aNdAZ8rvrxPmdujtxUgseJZQHbVzNY8
	 zW0Cyuhk43X2KpM0tpOg9wFz9Yg3G8QWvLPu8883Xzt8GpOBuxdCDwxRpgnBRvA8OGAxB
	 znulJcUr7UbumHO04DHHdefuN5YYI6GVnAvF6lKfHQITaTHt+KWSMWmTkXUyKQ7pZYEbK
	 DgK4tepwLkzL6B1fkw16QpcvpdD/t8NBi8N1g5CNUftHDtrbNSAPgKwf7Xrmwj6Esbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=ANVYq1Ac;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B749606A31B
	for <linux-next@vger.kernel.org>; Wed, 21 Oct 2026 02:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B749606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=ANVYq1Ac
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso431141eec.1
        for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 19:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792549816; x=1793154616; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RtukX/2ysY7x7vd+/cNR+kCC5luCdLJtTXyvk3nz13k=;
        b=ANVYq1AcMHQNk2nJxrbrkOdTRHhIFAzhRV2/B0A7yeWM0+R9HLr7ZVOSIaCWVuu8Yq
         EmPqKgAfaiMi5jWWhnwQmZZOT3Na8jUuXRnTNwx10j6/HcnVzakH8mpfRJnPVgRJbNJq
         nS29rvZF3iDBPnTai4Wi1gHejusZLwiKKQEMGUaBkOWGbNFz9lHZLjZtt/PMaVhJCRJP
         hBo8yuGmzkKyjwsT+GtjWN655ezexaeo8Gpw/YU0vrDYvVL3TWQnadlVekALK55MzhL0
         fPnwI9sI2ijFd5/LFT3ab//PK7V9Wpv72Ko7tRfAKXn+0iRLBbentel1tzFCJI94x/eE
         w4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549816; x=1793154616;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RtukX/2ysY7x7vd+/cNR+kCC5luCdLJtTXyvk3nz13k=;
        b=AnsiB1iLdJUIw+XX3yM1Qwj8JS+oMWQqYkN5BjhqFQK9irOT9m3Fswxm/4a9DVLBoK
         iWeJdx2+5/Y7UDvCikIPbJRuAreKlqZqbaId+UJXnL595VghYi6fd8W+8QpNTI4XoO95
         eb+kaxXBd5yT6q0iPPD/RNeRZm1TIPLlPCJ1+vKGL6z9Eb4BG1G2qdeqCwbTLM/Rts7/
         y6/ilzz1D3VU0fDYY5kKS/hGatxfoYsfpsuG13FDkxQXFJJ0yWhDzp8a7ap0b6N9amif
         MW+Kggn5usRZp3/BalnKEJwqaFXhi11D3AkDKVzCMuCKlpubZm8EdVK8QYclKgoxhrQd
         A/YA==
X-Gm-Message-State: AFq9FYLd5hwpTQgTEFhs7mkfmnN9EKrOHikD2IxpTPcYrZwp+y/UjxuM
	qL3BYI2K2E2fswQblQ6owwYN1agZDUyjtF+79mXw8wwZwdlTfpQStZL4NL8GkpzO6L+GkUVskd9
	7K4dU
X-Gm-Gg: AYBFou1Yd+5JUXE+9O7nYDsQlMdmtD4/P7nn+O0tgbX4duBV0MAwDIAbZGxX2TbOLea
	Gws+zpoxCE/unGvdc6H4V6pSZ2fKtG/dCBZvoqd790XnC9J7tPDkS8I+VERhU1aF6wb++MIoKUa
	LjX6hcdvVuPIQhxTdM84bSS9jHEYkLplJoagDM7t2DfUXt1NBlcBztCRZoEMh0BPZQh7STfZK4H
	oZL3GSvk9nYpDg0zMDzeIEKALAi4tMB42wZK7a9Y4m0ATawN6fya4anneW+/sVNLoujCSAp17FF
	qG3xyfHac+aZRNf7Cy7DBaVvKDpcip0OGY/q9EK+bhNw0NVy9W+/Jd9enFPvUZn9rJjAK40uvhE
	EOp0ItcMuCJa+2Y0Gk6dIUiJWk2GaPjNCnScBHkZovWb2eAi3tbsXF034jPsRznjtK1qmir4uO7
	+uH+w++3LEHIcn8NrvphNHaMSau5FgPDt2aFFFqA63UFdmKWPZpsYmNrORND17a1vf9azC2IfLU
	u5vnA2BFtZ6HJO99yv4ZDdVCRk7QuSuqsIDH0TQBucHho7/fg==
X-Received: by 2002:a05:7300:2d07:b0:351:1aac:31c0 with SMTP id 5a478bee46e88-3674db58848mr2078202eec.17.1792549816133;
        Tue, 20 Oct 2026 19:30:16 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed295sm2862304eec.9.2026.10.20.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:30:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 21 Oct 2026 02:30:15 -0000
Message-ID: <179254981528.223829.16687349607186202501@6e52bff8000c>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/8f7df005a7564bd7ffa75da9c3085d5b996f1e16/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
origin: maestro
test start time: 2026-10-20 14:29:48.939000+00:00

Builds:	   46 ✅    1 ❌    0 ⚠️
Boots: 	   88 ✅    1 ❌    0 ⚠️
Tests: 	26426 ✅ 2853 ❌ 4414 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6ad78a3955fda507604d7434
      history:  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6ad794f255fda507604dd7f3
      history:  > ✅  > ❌  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6ad78a3b55fda507604d743c
      history:  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6ad7a11e55fda507604e4101
      history:  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ad787d155fda507604d4f26
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6ad7809955fda507604cf911
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6ad789e755fda507604d71f0
      history:  > ❌  > ✅  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ad794d355fda507604dcb06
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ad7874155fda507604d4485
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6ad7835855fda507604d0d90
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad7818f55fda507604cff6e
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6ad78fff55fda507604da9b0
      history:  > ✅  > ⚠️  
            
Hardware: mahua-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6ad795da55fda507604dedd0
      history:  > ✅  > ⚠️  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6ad794d355fda507604dcc7d
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - ltp.shmctl05
      last run: https://d.kernelci.org/test/maestro:6ad794d355fda507604dcaf4
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_timer_10017000
      last run: https://d.kernelci.org/test/maestro:6ad785c955fda507604d29d4
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ad787d155fda507604d4f29
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ad787d155fda507604d4f28
      history:  > ✅  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ad7887155fda507604d627a
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1416
      last run: https://d.kernelci.org/test/maestro:6ad7874355fda507604d46ef
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6ad7874355fda507604d46ee
      history:  > ✅  > ❌  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
