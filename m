Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0252368946
	for <linux-next@vger.kernel.org>; Wed, 22 Apr 2026 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776825026; cv=none; b=EjbDtpO1h/tKYvlHEwu7NVEqPZihDsxQIyWZbGRqregTy8ikM0o7kq7Kx2MI49FrCO4H4hxGNOV/JZ5uF1F28FxIie0ZGVIbctjpzBkaPzTLRa/qODeBME8py8oaHGIL+YkcPi0kJ8HuVlsLHUyF6UASvo0VytLVyBZ0ULxcV0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776825026; c=relaxed/simple;
	bh=E+rUAP5nJSE/2RhpIWwMgyAiqG4C2xXED+5GAwLv45U=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=HhzvI8qVsHSQliVpsjucVfJNLqLs6+j4Jh+JnCwB51W0m6NhWJfNpF/ox79Hi06mKb57hngDOvkb8poMGS9LXPIkrBJo9tppejf+heWhxWxbrN2RPzbvgjwoxh4jVItay5BtjdYNEJ4ap+G9h6SxyGmFTsm1Xf4w4gs9cnDL/cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=QGOs5Xdb; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="QGOs5Xdb"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c8f9846c8so3752962c88.0
        for <linux-next@vger.kernel.org>; Tue, 21 Apr 2026 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776825016; x=1777429816; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vs+6zcaa1+84wSmSN0WFOlENm4n1K6ivnUUA6reLOs=;
        b=QGOs5XdbAbf02KXeLk+YXPtOoZaT3TRMCMFpUil3PibI31HAiFIWcOL8rkV8mQuoXj
         2onGv0v8JVRjWApYvyJCIHVAy98A6YjjT28L1xxI3Vh1K9Cv+5xI2mIccL3XyRy7U5i4
         i1Hdi016pdBjeu1ROka9X94jljaNBDE1fSyf4BtdZGPULxuxznv4SiIv2QTfyoAfQuR7
         dyXmOKShOTQLQU8yFIU7Y3e2YoMJUN4oV7U2+bWxxfF80UGo2C9gr9pnaipNFXG3pW2r
         fybbVER3/GbW9obXDvjWtxW+jV+3HjDStJhl4Kd+driD5fzxckz4CqY1ISaDi2dBn/y1
         xkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776825016; x=1777429816;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vs+6zcaa1+84wSmSN0WFOlENm4n1K6ivnUUA6reLOs=;
        b=cytW7Q/yXK2SWciLC3Kypbg5p5z2fsxLm3vWtdVGQWJu816hfPCMNjHJbx0shDE+XI
         B+S9RVyDpEIDfPCvVSlts8uwam8F1UaPE7mHL8uZXID5WKmejrFcmZevaGCV9MBiIVtW
         n/odcnx/Ff5vfeTjgdZgImfko6YR4Wt8XzuNj0mVjNgLF4NTG+Lv/IrwPgwEnxuLGgnH
         WcyS4Eyi5Cl4tNgVHeLJxBztSj2x81eZPRUPsr+xmFqkiJXUOYeHhIg+tkKpTnq2vavP
         R5YSzgXzQbE2+m9s+IJoPRMkvREAeryaVQ5V+xCFKk32sV/r7k+RCHRQV2jBDuLabDOb
         l/rg==
X-Gm-Message-State: AOJu0Yx3O+Gfs7uFFLW7ZFRiSZOlFVqOhHYI69pOrDjZuCti3SMKGKR3
	CMMwwXMZL0Dav2tybNfRmYTwYWXIzbqZ+WtiagMd9fT1E/0VQUuIYUOaqA4LMFBks8ik7UcX+m0
	+YjFy
X-Gm-Gg: AeBDiet/e4cr6FkzjzVbCHSL/KlWC/5LieURDzs8bCdi8j+Yooj+SKajHU1NABqHKhb
	zs9bK1XIAtYTL69PWkNKoQd+m2/42U8LCTREkPP6leB5DMrpdeiWiMlHus+VNkIogP6t5YxSsbM
	q9N/1Vbxu26OUX+IPjD1kiEohRDgzdGSCLAibajdUGEDrP27H3JQ5Slo6TShTKIDI2ztI5VV6KT
	yUIE0p8UYxHCylYWigfKYksqTNef2k0QGl2rDI3aYM3HU1eTyjR843U6xqa5jVBc+9RqkNDcs8V
	5K41K2zacthEby7f5eAfuuoZyOxUbhavwh5bi5bgS/rizbAlwX+nIbAF1VZPJWT7zveDbWyhnG8
	mET/GfqXBZ9AprWDy3mQjjYI161ltHnytc2aOKg2cl33Exk4ypgdXajdq/yrELpum4nDYC/7LJY
	N56nX774v0Vwbsjq1Qqq3Y0OLnDnFEXDKIf7teKQ==
X-Received: by 2002:a05:7022:baa:b0:12a:6fb7:8801 with SMTP id a92af1059eb24-12c73f7f791mr10610265c88.14.1776825016179;
        Tue, 21 Apr 2026 19:30:16 -0700 (PDT)
Received: from ab39070dab57 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a2ac32sm22126203c88.15.2026.04.21.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 19:30:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - bee6ea30c48788e18348309f891ed8afbf7702ac
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 22 Apr 2026 02:30:14 -0000
Message-ID: <177682501452.705.6170841899518762240@ab39070dab57>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/bee6ea30c48788e18348309f891ed8afbf7702ac/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: bee6ea30c48788e18348309f891ed8afbf7702ac
origin: maestro
test start time: 2026-04-21 14:57:38.889000+00:00

Builds:	   57 ✅    0 ❌    0 ⚠️
Boots: 	  186 ✅    5 ❌    0 ⚠️
Tests: 	24864 ✅ 4105 ❌ 6875 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69e7a2e29b5a968309ee97b9
      history:  > ✅  > ❌  > ❌  
            
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:69e7b3049b5a968309ef3358
      history:  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:69e7a3a09b5a968309ee9f19
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.tmpfs
      last run: https://d.kernelci.org/test/maestro:69e7a2fa9b5a968309ee9839
      history:  > ❌  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:69e7a9519b5a968309eee9af
      history:  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e799fb9b5a968309ede68b
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e79a039b5a968309ede6a1
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79b649b5a968309ee086d
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79b589b5a968309ee07fa
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e79a0a9b5a968309ede6b8
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79b769b5a968309ee091c
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:69e799f39b5a968309ede66a
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.devices-probe.shardfile-devices_probe
      last run: https://d.kernelci.org/test/maestro:69e79b3f9b5a968309ee02b5
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e79a119b5a968309ede6d2
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e79b629b5a968309ee084f
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e79b4c9b5a968309ee0566
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e79a1a9b5a968309ede71f
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e79c519b5a968309ee1197
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e79cb69b5a968309ee24c1
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e799fd9b5a968309ede692
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e79a049b5a968309ede6a8
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79b3a9b5a968309ee029f
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79b329b5a968309ee0239
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e79a0b9b5a968309ede6bc
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79b629b5a968309ee0833
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.devices-probe.shardfile-devices_probe
      last run: https://d.kernelci.org/test/maestro:69e79b559b5a968309ee065f
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e79a129b5a968309ede6d5
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e79b6b9b5a968309ee08ee
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e79b2e9b5a968309ee012b
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e79a1b9b5a968309ede723
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e79b559b5a968309ee06e2
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e799f79b5a968309ede678
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e799ff9b5a968309ede698
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79b579b5a968309ee07bf
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79b4b9b5a968309ee04b5
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e79a069b5a968309ede6af
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79b419b5a968309ee02d5
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e79a0d9b5a968309ede6c5
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e79b4a9b5a968309ee04ac
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e79b489b5a968309ee03d7
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e79a149b5a968309ede6f4
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e79bc29b5a968309ee0b83
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e79c869b5a968309ee1af4
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e799f99b5a968309ede67f
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e79a009b5a968309ede69b
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79c129b5a968309ee0d52
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79b559b5a968309ee069b
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e79a079b5a968309ede6b2
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79caa9b5a968309ee1fbf
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e79a0e9b5a968309ede6c8
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e79cec9b5a968309ee3958
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:69e799f09b5a968309ede667
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e79b269b5a968309edff2e
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e79a169b5a968309ede6f7
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e79d329b5a968309ee4262
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e79db99b5a968309ee4f88
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e799fa9b5a968309ede688
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e79a019b5a968309ede69e
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79ca99b5a968309ee1fb7
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79b639b5a968309ee085a
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e79a089b5a968309ede6b5
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e79d449b5a968309ee435b
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e79a189b5a968309ede71c
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e79d839b5a968309ee446f
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e79d8f9b5a968309ee4c28
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS

  No unstable tests observed.


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
