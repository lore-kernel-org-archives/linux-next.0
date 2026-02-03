Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6616486348
	for <linux-next@vger.kernel.org>; Tue,  3 Feb 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770085814; cv=none; b=C79S5eHeYm+lZ/bcqp7Lub941UCrOVXTlBCgXUACAU6ncr0DZsO5gZMMs36JT9x6NgKgpiWLEtUmwJbdShnL3pF52hPLDlMLzsPftw6dFFhVHNGnWbK1adJX5c0iWDlfUZ5yXkVPjF/JH+4Wl0R+jBhxLbAbSKWApA1q/2AbSUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770085814; c=relaxed/simple;
	bh=TFVwAUHaRCdbk2SBEMhLzkWxnEvVg3rEx23fgzmmewU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=DjRCqqSk+f7GMG/C4NfSsHpH+u2XzaZ/Uj+odmY0/gaNfYFQAdMmiMNtVJ9OaEyZ2ITRID5TDaVpfZIK6NdG92cv7ie7qMqWFKSgr5MqH6yDy5TtXQUCZup8457yY8FBgeeNGLEqs235+6S9BcbXWLntfE2zXr7YQxBWdZaECeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Hr3UvydR; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Hr3UvydR"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso1203276eec.0
        for <linux-next@vger.kernel.org>; Mon, 02 Feb 2026 18:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1770085812; x=1770690612; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+81R+8HYRj7w5xKwV4Zk6c96AwBeJ0nE7ENNs0eiBs=;
        b=Hr3UvydRCIHD7lGo9sUCwLjFWQ+Ss3ER86bQUT5e2WadHcjssVLp50pPw+l4EJ6zVR
         kEfu3WSwncoxXYVNvK3DiSLr1kMr9029HptSPuiU/B0aAz/AvoPci3O+Dx/YeM7uiBMm
         Ydpqwk/111NlGsAKlxWpiPkVhBTNe1GY8c7Cdu3GYK0yp6OnNf5mDSlk5KGEen4/cXZn
         XSlYxcXTOB/kTGBJydRnv27FM5glhf14cGj/lyFnvCYRlrV0gmv73UG9M9BoKzWqQGJg
         ryBcIUs5DMwZD9CZMVXRXxhTagJASwZbbKxNP7gtwGruchrcKbHQ+7UukPB9TpX+b5i/
         7c7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770085812; x=1770690612;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u+81R+8HYRj7w5xKwV4Zk6c96AwBeJ0nE7ENNs0eiBs=;
        b=sVfGvbb6FX7d3eyFFee7msDY8ONh3wlnbel7AGMDI9ytUFAm9RDiyiFe8Y+Dt7Vr+W
         tLqjjearmGrFeXi7u0dBvc/cyxE24k1/MIWoDi4PO0vcGpuVcb6pWRzTpNmyUjsSgeCg
         zwZdRq3R8t9q77MvHUYiJKxU0+whQBkgQ6PWSgSzzdoKKB1GqQ4Lm4I8cqmQ4FtAQhz0
         ku++95qGCBLfHgIfSZzkyBa6Xlb3XFkFhC1l7VUzBE4td99/CJljFGSMrN9MbUKjEzOu
         VDpl2P6OeK964xBpmYRRa4ysLJp0P5AW3FcghpuHK9QIfl7/h2AsXVwoqAdwoCzYI8aE
         9ZUQ==
X-Gm-Message-State: AOJu0YyNWYp25uGxyTUcGw7Tq5i1EEc2kjaSAVUxhh5IIymXkYTwNooc
	aEN1874pXZx+Q9PMSW/kiGMdb3VXJ6p/6giC/UzSy2XRMrQdyDoN5+XmdLVsgpqQ46rS2iaLshl
	X+pwycjwv6A==
X-Gm-Gg: AZuq6aLGns4h9ENC8y1cOTMESSvoob2xMJBze/B4Of+aHCDJXclA9aaK7dl8r3ICm20
	A0Xr1KyJjOaq4XNAbAEungoowwAvdAaRPMohaQMsmKfuSTMhGGeVWCQqiH/JyJpfWWqKy2GY/9v
	fTV89wqjsh3HRiFa/oUo0BRSGyW/UqlQYqADGtOErowUumYrJLaXa0incK7i4o+Z/JCffDGl4Lc
	MsKEMHxrG06LlUUC+DyAxJAssW6JpSpZ/6Vp2q9ijeK4p/uhxRCq9WbQ0JmBcBqnxyUmq/868d7
	fnHjpnI9ir1dUhnZhdpm+JIn3Ph3e4VbSHhOIgJ9N9lAlliAdseEdYWbrXgAKpC4OG/yydS4Cse
	OSzaHC60BJyj36Exn7eAREpiJ06Gcp6203Z1dNuSaxUmzqpGOB+P0RgLkhDTqMAYeRCuiA4j5Zp
	4pJQ2T
X-Received: by 2002:a05:7300:bc11:b0:2ae:5020:afe1 with SMTP id 5a478bee46e88-2b7c86506f1mr6007736eec.14.1770085812376;
        Mon, 02 Feb 2026 18:30:12 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a17083dasm25773082eec.14.2026.02.02.18.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 18:30:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 193579fe01389bc21aff0051d13f24e8ea95b47d
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 03 Feb 2026 02:30:11 -0000
Message-ID: <177008581094.6222.1777926422809833674@22d5995788c3>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/193579fe01389bc21aff0051d13f24e8ea95b47d/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 193579fe01389bc21aff0051d13f24e8ea95b47d
origin: maestro
test start time: 2026-02-02 17:09:41.951000+00:00

Builds:	   48 ✅    7 ❌    0 ⚠️
Boots: 	  156 ✅    1 ❌    0 ⚠️
Tests: 	11917 ✅ 1450 ❌ 3459 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6980f049a1ae387ffbb9b621
      history:  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6980f177a1ae387ffbb9bd70
      history:  > ✅  > ❌  
            
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6980f05da1ae387ffbb9b676
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6980f025a1ae387ffbb9b5a0
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6980f034a1ae387ffbb9b5de
      history:  > ❌  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264_frext.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69810e67a1ae387ffbb9f5ea
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - fluster.debian.v4l2.gstreamer_h264.JVT-AVC_V1-GStreamer-H-264-V4L2SL-Gst1-0.SL1_SVA_B
      last run: https://d.kernelci.org/test/maestro:69810ddea1ae387ffbb9f2ff
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69810f37a1ae387ffbb9fd7b
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_av1_chromium.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69810da6a1ae387ffbb9f1ff
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_h265.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69810f0aa1ae387ffbb9fc0e
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:6980ef91a1ae387ffbb9b23c
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6980efb0a1ae387ffbb9b308
      history:  > ✅  > ❌  > ✅  > ❌  
            



This branch has 7 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
