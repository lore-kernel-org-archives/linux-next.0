Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E131E492D
	for <linux-next@vger.kernel.org>; Thu, 12 Feb 2026 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770863420; cv=none; b=LUqsvK5k5tSaekzkUcadCB5S4OlGznRJ9zr0I6SAELdAcYJYUG+HwCbOFwbJdsBC9fVYdf0iH6DWZ1cbHYBYNd3KMWCvdOXfZzt8EjP7exlJm6EaujXySStLEoW2DRU0LyafuhdUgyWy5BTB07TH7k16m5BZCPFucC5MS8kj2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770863420; c=relaxed/simple;
	bh=VFGcoFeSXyTzaSTNlmqAfBQ1xu5unCzPpFgrNzWuPUA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=AhFUw04baR5m7BVinEVrCIusQ3TdkzZigYWmzG/X85S3MjV+wZvLgHlGBVBss5fnb9GRlvUp0KSGw7dhgQWUBy4YSdQqwhppwYuCtfa5hXgLKaKH7cvzPU581PHSJ02mv9Ks7sAeDfdMjX+V8Ht0c8sXoC9QhROFBQCzXYIRepU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=knYhpwhQ; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="knYhpwhQ"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1270ac5d3efso5270833c88.1
        for <linux-next@vger.kernel.org>; Wed, 11 Feb 2026 18:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1770863418; x=1771468218; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE2pwaNrm4zQIpL7qHAbMXtOWy25LrNRQz7aGZYiojg=;
        b=knYhpwhQTya5wr9oM14MAk5FQQoBW/H3F1hFjW7GU3dE2KEiPCVKnj5aOjgWSdZvT9
         WRSxlwjxglZq4qllZC1BFIwofb0qJtGSffGHqOIbyJX91n0WDtzOFXWL1WSATTl580m6
         hCzVRFYkKGgQtI3rR8olpSVw3vsKsTorIrpXg0ukGiMc++7cJrIZfZ2R0JY6krjvRhmZ
         dGQ25xgmQ2GAXSXl6dPnMxST/dBBAsnr82n/TbMd4ELDDcfEOPXfkwrAOlnilxweIk9Y
         gW9gL1nIMX89Vf0+xcWzdoEMbB/ebl85Y0snepSKAxIhmtoNEEMXXZOZuirkxWn9U3YQ
         GYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770863418; x=1771468218;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gE2pwaNrm4zQIpL7qHAbMXtOWy25LrNRQz7aGZYiojg=;
        b=kOYCdGfvU0F+AQWMUXAQACbG6K2ul+77yTwSj14OdK0Kr2I703EpkME+GCO/xfu9/k
         CMfkR0WqPGbnt7PrT4McnWKns5T8TESU2Jltchqt/q7U/91J+Zmq7dK6vvAEZf4+KdpV
         rqKxnmOF3ayhTunp5G5I+RHHpmmMLeBpcZ8B6NI8e9fo7Cec/AhZ7EnonHCHOuX5nbVA
         ZZQYIMIsvCIEsmK5koRKCuNjn10FrJIoTimD2ISLcLb/I2EyG3+YOXGj8DPvj8IrXOJP
         sXIQSnEGZsHFyMOjFy4mC69mjN4t7xOqdIFMrfVH0AHmWLDYyeSbdyJzfERV5bKf9TNa
         nydg==
X-Gm-Message-State: AOJu0YwzSHFcTtaS/r1OtmG2YWC+eVYmAUMVwKVYGAZlKNoMStKah2Wg
	Bl9vyNI4M1wU8U2efJjJXQPdJO8ikkGokly7pNT3NdRGmj3vnebeJiYe79v+sx+UcEM=
X-Gm-Gg: AZuq6aKgEcul6MbCMR+BesSXLXZ94GZp4wxkMMflZjoEUXbMwp5VqWMgDxR37asH7St
	l1tKt/YzM4X+w3A59fQbwr/FYkVEJVbQU3zS7awS4QDdeioYFwgYGHMcYUeLz9eRtPwadZDUlB7
	uun89RNWyrKKkf80QqMqqJr+fTjk2HOPa/6ZovXp92KH+VMdYBJlUtHchLbTnPbT6NUrKuBj+XQ
	V1JkqDNjSdL4hQJiKhjDZHh16FurkyK+BrK0J580VOKEnqdR77JGsJ7tas3sMzvaIHY5fKaDjZ6
	SOJA5JC/Tl/HxphGWwZWLPR6QNGD9J6CFl3vklJ1q1KZbBsMHlbPc766CMKUbHEMxfezQ/oYXSn
	CggAJF5OgltTmfnPfgsDsB4s68L7ZWZoEz3gGvVd2vUHcoR/Y0pUm6v/1ADsjQp9cXcVmVeThq/
	1PW7/jxfwxc1X3yrPb
X-Received: by 2002:a05:7022:6610:b0:123:35a4:e8be with SMTP id a92af1059eb24-1272f74eca9mr711995c88.13.1770863418063;
        Wed, 11 Feb 2026 18:30:18 -0800 (PST)
Received: from f55b40a4666e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a6e9966sm4464958c88.10.2026.02.11.18.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 18:30:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 9152bc8cebcb14dc16b03ec81f2377ee8ce12268
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 12 Feb 2026 02:30:17 -0000
Message-ID: <177086341711.629.14396387548019836973@f55b40a4666e>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/9152bc8cebcb14dc16b03ec81f2377ee8ce12268/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 9152bc8cebcb14dc16b03ec81f2377ee8ce12268
origin: maestro
test start time: 2026-02-11 15:21:00.698000+00:00

Builds:	   55 ✅    0 ❌    0 ⚠️
Boots: 	  165 ✅    4 ❌    0 ⚠️
Tests: 	12469 ✅ 1073 ❌ 5623 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:698caeeca1ae387ffbcc68ea
      history:  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:698caf8ca1ae387ffbcc7149
      history:  > ✅  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:698cb064a1ae387ffbcc73a5
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:698cbe96a1ae387ffbcc8e81
      history:  > ❌  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:698ca8e1a1ae387ffbcc4aa3
      history:  > ❌  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:698cb49ea1ae387ffbcc7b33
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:698cbeb3a1ae387ffbcc8ebf
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.svsematest
      last run: https://d.kernelci.org/test/maestro:698cb017a1ae387ffbcc7314
      history:  > ✅  > ⚠️  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
