Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CE2368D79
	for <linux-next@vger.kernel.org>; Thu,  1 Oct 2026 02:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821842; cv=none; b=EqdPqWybrNKQbPnxUwJrCyFPCyclGmDh/9q54O1uaqJSBoW5Ga9C0/Q6hCxLxAvRkFCE18CHJt37EgjDCshVXjh4nX6fm99rmdXlS1UhNHeBhEXZTBavpN58KbdyzDDW6Twpm3hHQ1SXxHzlVyfjDiCQTafizeVdePy74IUQsTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821842; c=relaxed/simple;
	bh=PDKzQe2JKLrQr9Zu9ULJdis4klB8Tok2Zw4Kt5hHMxI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=tSETl+A6DotFqcgZiCyy1w5XcMXP1m7XSZzetQ9V8yIzc0kyoMgd/c+qxdWTJvBqh+OZzdDYDCCM2WslGHkIgqRm1YsU4QoCksZ7gp5PEFDCYIfKXXNJvUdR+GwpOGVJhiBn4TJXrWZwMMpkSw/QXWY4x0qXr57PsfgaNDaGnbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=YOgGE4YL; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="YOgGE4YL"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c24422d4dso7216412eec.2
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2026 19:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790821839; x=1791426639; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XK7VfXB43IGl+CbRftUYbA6biX3moS7HS/I/4b7ukHc=;
        b=YOgGE4YLH0LX/objICPguy7zu0akHxhlrRG3UVjwecqDPfG0mshfKd1k8HShZAOYWa
         F8hd+BOTqsftukWBbQCc71I77dlTaxJJjQBN5nFdIQdv1ynZN54muy0NyAW60Po49v3i
         YXwTetE7SqxV/uD3sq1YwHebxn6S0+dqxDZH967xVGl0r/TARhpcAkao/Y0w6RlqpXX3
         iAj2tfU9R4zUCDh5d4r7jQxB8aMHIwprcod9jSKkw5J9ESiu73WCtDSFJebDXd25Bpqo
         2Y4W3LRULz3hoIyv1DKfvMUyPAg+UEGAVKFqS5O3ua8wUHR6Akgtmxfcra1n+Gk309I8
         fsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821839; x=1791426639;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XK7VfXB43IGl+CbRftUYbA6biX3moS7HS/I/4b7ukHc=;
        b=MD/rQEeiTLh7Jz2a6YBCZNzWSIsELqfwyRCH9ExYae87bq5Y2EWLoZcXpcka6GDYny
         AJeaMx1FuCalfhV4+cpAw4ZAkVJYoNc2rzFbAMM6Ooc6mk2lSskCvFRv/pCWgH31lx4E
         FW5t188+VazwkDAHWIs5q03VzYoUwW01x7jDaaoHFSz/YHKfe7cKKIilHDwp5I/+fsQo
         Dd5ca0p+6NkuGpyoH7F4q37ZUgDbIYORJHUmzlLiXjTvafyn1s9f4DqO11C3tVCwx64e
         u8H+eLN1bN/qiVRTBOOyasY+1mlvFRZbUphPFvXoNI+upOL+NNZyQmipeUTAlwkT+M4O
         tqjg==
X-Gm-Message-State: AFq9FYJaM3WiVK2eP382PVLV/91yCWtkVIhLTeRprjRVslNRPiNW/g20
	6YBC+LcUMe8J318eGDi0Yyc9FLfDYWG2P1WcfXNbqvadFzknaOdjUKi5/fw717hjnvk=
X-Gm-Gg: AYBFou3dPKtwS2cEbn3vAg4R5kARYfDT7xlHo15mUz8hQ0gsPOmpMEAorW5/vRyWsUp
	8MpQjA3nrD8QiYj3x5buBW4jydSag6kl4H1oyv+PgyAOvGCa1r6kBMRJ5GYp59SQkFd1yH6ubfW
	k1CavQn4S+wDe3iY2SyDbQdgY8SLZc+DCxDZWVPYBXcDqTLsAEsUuIG3CyOZkvav4ETwk738Aq5
	/rDY6K53OdHlVSLoUhY2joHjxTZP+tCsyUR5+CiPF188CLWJljUoORCHItPFhzoWDF/ajgbOhdv
	vDIALdjHe1PLUYr/ajQrTHrBI2d5pcYehgwJhCirgcjdFbcExkp4YLJtdong3pFFt3vxexeaW4o
	LAJHjcxE/WDiwNZo6Pv6S1KzSs9q+a4xcHMVLqnWg3qSDPH0lKQwbQJ2n7FuP5ZpSN36rTyv+93
	VNi6shWOoZkvWi0/vCReQ1vMcAkk9Cs2Lbmx54We1kp/towxSBrdLozifnZTNjF9cTONHd+SxGS
	Q==
X-Received: by 2002:a05:7300:2a95:b0:34b:e2cf:43b6 with SMTP id 5a478bee46e88-34cdd0a96f7mr3213518eec.2.1790821839251;
        Wed, 30 Sep 2026 19:30:39 -0700 (PDT)
Received: from 5a6d9a2c18a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db0c8e76esm3149702eec.4.2026.09.30.19.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:30:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 6c2cb8b8b843d216ab549b678a0d8831c43153e0
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 01 Oct 2026 02:30:38 -0000
Message-ID: <179082183826.126550.11918371055523663787@5a6d9a2c18a2>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/6c2cb8b8b843d216ab549b678a0d8831c43153e0/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
origin: maestro
test start time: 2026-09-30 14:22:31.225000+00:00

Builds:	   59 ✅    2 ❌    0 ⚠️
Boots: 	   90 ✅   13 ❌    0 ⚠️
Tests: 	31742 ✅ 3208 ❌ 3320 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6abd2f205ec73975aa095be5
      history:  > ✅  > ❌  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6abd2fb15ec73975aa095de5
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6abd581b5ec73975aa0b6e8e
      history:  > ✅  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6abd581a5ec73975aa0b6d27
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6abd2fc15ec73975aa095e0f
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6abd35af5ec73975aa09e61a
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6abd6da414cd2ca558e82389
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6abd5f1c5ec73975aa0b9dbf
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6abd2a0e5ec73975aa092d34
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.dirtyc0w_shmem
      last run: https://d.kernelci.org/test/maestro:6abd58185ec73975aa0b6ab2
      history:  > ✅  > ⚠️  > ⚠️  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6abd36c55ec73975aa09f53e
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6abd35915ec73975aa09e571
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6abd35915ec73975aa09e570
      history:  > ❌  > ✅  > ✅  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
