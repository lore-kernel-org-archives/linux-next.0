Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CB529A9C3
	for <linux-next@vger.kernel.org>; Sat, 31 Jan 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769826614; cv=none; b=djLP2ltK4Yg5jdaQ4n6rhwm4ukx+oNbzCi3/CqJKSeZDYPIt/4/Vc/LH91AfSjnxmNilaTqH5nOL/9PRg4gfVAxgjxkpLcjI8PrjN9ktp8k8O+4UcmX4Ri4i6dhlFvSOlQsbW8Gs/DAtZttthC2QNV0K3/IiL97lIjm7Hxj9Qv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769826614; c=relaxed/simple;
	bh=+Y5lzP1zLp5kLL9zuZl/o9H4MVICgqhb/Bx1JAx1dbM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Od+gWWmf3N354ZpvD1vxOcbCyLj0gEeDhtJXJb9VHYFSGZWGX/6j91mnhps2pL28LyrqVhD4fjSuoJ/nxMArE5AGmaIAnab3aNMCJZrW0AEI1W6cSlkZJiVXHMLAg8wtOURlWVy3cNboDq3aq+TnCZGlPemgmuWcAby0mS6DiZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=pf3PCRxU; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="pf3PCRxU"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2b785801c93so7235821eec.0
        for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 18:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769826612; x=1770431412; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypnTLkGUN4tWe0aXXkwgGARm1dZaiVoQXeL15i628Rs=;
        b=pf3PCRxU95JIMcUW/cvwv9umgtI2Lcc7Y4zL2eGIAOYCKd7+KCWzZBLHGcqBiw1cW2
         MK0danflQfHCfLmJFBQX5YCBGyjRcy3O5fwOgfakJ+h0Me+eLGjUtLGb/Kdfh4Sz+r66
         l1ye6G4eEz6jkgKpo4szNJJ6gN7NKo3mIf8flx8nkaWGIB0LcaD0NBumWeZ0jjcsVrWU
         +cEzltfCeUiCa6cgstU4Fq3DPbvXZRnuzmzUCuP/kZP9Z01K957LO3B6JX4ftsyxb2ky
         ApTGIn7b1Dab9vu6wonh3NZ9CmGmsp+xaEyono8SlOpDjZwv0bu+IiWcW7fjscS9UsUn
         EpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769826612; x=1770431412;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ypnTLkGUN4tWe0aXXkwgGARm1dZaiVoQXeL15i628Rs=;
        b=o84V2+TVRiHydDTClBm2qQHf9zXrwGMeXHV/Y1pdim4JsvGq7KoRTTUQS7RY1rkK/h
         yiS7tA6C+rzcLcBM47qKEurhpQVnwcEr2IwpCYDJOEVMGbt/MI2EwWrhR23MDdPa4krs
         RMeX2L2s1E6JBVSH0eLYFjsjcJZ7RDPHgev2c+FGu07orcLuMVfIXaHMeRckiQpYsg3C
         T/yYa4YkgqrIGsNQVTJR4SXh/jtJ3ewMxsZgkHgom+4liDdNC4O+rAq7HKx19jPO4WNx
         JoRB/EgU3dprSrEiI5de1mHTBd2TBaLacUb7XE9p3q8R84U09ZXVuUr06ZSmijK1ek4O
         qJVA==
X-Gm-Message-State: AOJu0YwSgicOuXcf0NfKbMqPVCkW9xJMdLRNIK0tgtizbY/lWtBT0dfG
	a7wYFZC0kMRLFgJBdE+nMAh7EtSfo4eZbbQo1wuks+nnEFsqIRI94F5KCQt92Y6nOeqr/OvwwOw
	Q2T0KBQ5BvQ==
X-Gm-Gg: AZuq6aKjAwZsgEVUJ6RZkIct+y9a1E17Xi3+xVtf3ZhkQ8tM+SPZLsBCFJAJXf5iBMv
	uoWkBAgV8Req/y5IglTm1HpgHzQ72uTj/GmtHqig93bQmsTG7JrCRZzTvSUZmXcVzOLwoAGuMYZ
	1mp7t3h5jRsphNcI+LAcOyl9fPEliFAKDJ5KnNe1Sy3KoBoi2e0+TNgLXEcNBTp3SS9iYE9L44Z
	tYabC0daoDKPiRi9OZKmni7dhZIcqc8f9ETraDh4DXhtyFHkkY/XSOUUgEuBWzT4ablnjYllemW
	wH8kArjCnMEOOlRGjzqM77lO9DgkzanygDWvWbWAhYD6SlOUPanfdAKS4+bMeWcWoczHoU7ibFr
	p4OPYMM9zs+oqgVjK5GGk021gjsFbzR0iR82HJqHzfELKfxtXKhZSDZHGn9WuUuOaeoN8i9akXB
	SwNlk6
X-Received: by 2002:a05:7300:f193:b0:2b7:3955:f50a with SMTP id 5a478bee46e88-2b7c895230emr2609068eec.41.1769826612291;
        Fri, 30 Jan 2026 18:30:12 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8d6sm13598091eec.3.2026.01.30.18.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 18:30:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 31 Jan 2026 02:30:11 -0000
Message-ID: <176982661109.4838.12056236115563281283@22d5995788c3>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/4c87cdd0328495759f6e9f9f4e1e53ef8032a76f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
origin: maestro
test start time: 2026-01-30 19:01:31.263000+00:00

Builds:	   48 ✅    6 ❌    0 ⚠️
Boots: 	  112 ✅    3 ❌    0 ⚠️
Tests: 	 8139 ✅ 1297 ❌ 1863 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:697d0f0ea1ae387ffbb6fb01
      history:  > ✅  > ❌  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_av1_chromium.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:697d19daa1ae387ffbb72317
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:697d1a34a1ae387ffbb72722
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:697d0e98a1ae387ffbb6fabe
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:697d1625a1ae387ffbb714de
      history:  > ❌  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264_frext.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:697d19d6a1ae387ffbb72311
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - fluster.debian.v4l2.gstreamer_h264.JVT-AVC_V1-GStreamer-H-264-V4L2SL-Gst1-0.SL1_SVA_B
      last run: https://d.kernelci.org/test/maestro:697d1983a1ae387ffbb71fcc
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - fluster.debian.v4l2.gstreamer_h265.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:697d1a00a1ae387ffbb72508
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:697d0ef6a1ae387ffbb6faf0
      history:  > ✅  > ❌  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.signaltest
      last run: https://d.kernelci.org/test/maestro:697d114fa1ae387ffbb708f5
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            



This branch has 6 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
