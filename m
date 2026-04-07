Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31F12E541F
	for <linux-next@vger.kernel.org>; Tue,  7 Apr 2026 02:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529011; cv=none; b=cO2fGciLzd+PJJKjDc9G+7e8Eo5imKW4G3IzA0Tui8wAn4b3MJEzkdEZFGxLUALXBv+ThyVwqQt6IY9eMVIKOHrlm96aHeaVD41FbVIJt6jMI5BGf0mQtHaw66iIPWAOOmSBEgIhZUbBjDxog3a1Mm1g7DrNAhReK3NaiXYTcqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529011; c=relaxed/simple;
	bh=WxaEDS/ADI1JUqGqJs0jvgnSZQ/941kWJ9EYvo/etJg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=QupbNxaGGEekMYNeU5WbbI/5Hk/zT45VnS8wOjBfO7zt4gQVCz5VSumZXELrI/tVHa4QLhhwWNJtybYjQJhCutI+ZoSFhIg2+NfaE1AAOKdpBwCTAT4J6KVGeX3+gfV1LqF2Grd7lby5fRJ8+gXdZlB0gE6ORl62SGJFwr5Ep0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=rrxtTHXi; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="rrxtTHXi"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c0f979c16so691388c88.0
        for <linux-next@vger.kernel.org>; Mon, 06 Apr 2026 19:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775529008; x=1776133808; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OSL28HZ4kBjyyL+8+BtLE+xgsSNIWU+vwvFTclJWNs=;
        b=rrxtTHXiKPljxtuGecDtY7eSUbVyAyPParkcrT1CNCmydQKWk2m88rcoc1gah+hxNw
         g66LWK+lgAfkgvPOBoBQ2AJw8MlTimkYGxFij4upMwZDgYDCTPYwdO5fj0uaq0JqvY+E
         3vpVlQtKIfVovPEnQX89Yjvo4vaR6v+cjhv0md9zSJG6x5DFBF5LnK5W4KekbhE0abt+
         /sPxuRL8779FakOt7IzDWHsS5eLOKu67vm+GE77KlPWs3xKDIFIvOjxnqpUaasueybjT
         BJft9W8HFANj20eYw4c9bz7fwMbcJHjiszom7kcJSaah6Pzv2OoFhF7ObufXFzbIz6Hd
         wDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775529008; x=1776133808;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OSL28HZ4kBjyyL+8+BtLE+xgsSNIWU+vwvFTclJWNs=;
        b=h38QzGaIQlpoy3Tkv/2idaqc01pxQrhweTj3H6ifCT1bzavCDFpIEDbpEORXYVfD9l
         nTJD9Co9uKR9KIY3ydEmcJ4DTBAamgl2LO6m3W6PCIrzeHtHweyJHHcVTNx39oHRxAyM
         0cnZ151gWIfTaKXUnLCaN6SXwZvWWD0oXFglDZBEfdWVyKegFsrGS6IhYD5M7HpV7XGQ
         O9PMezHShg/OYNZPXC6vgIoD5vCh7Hmdm9driZYWOccZHBhLWWelvBK/ebxMOEFBFE/N
         oTAwxyZDQmJ6gnE+9wG1oaCzxV5qy/z6oglTPryUmrziMcfi5wkU7OpompLaKgZDtcDr
         0xRw==
X-Gm-Message-State: AOJu0Yy5NKU6MGBqqa4RonfjVRtkGZYW3set3Wm2n8PudW6TJsYkiG4e
	SLBFzFzYrdVFO5tpLkSnx8Ltm7CyrCQumOpX3pselEXXq8CXux0as9buJFBmYCO7GztYVm1W+Bk
	xzQlm
X-Gm-Gg: AeBDieuU1HSeYaQ3KF+zGL75tOYmoUG8tGX3hCB96vhpakc5elf0AuUS4GnVLAIuYU7
	L32wEQTi5WYAREks7YYIAqIbBrl5drMUzOhy+r9wfYRiOXs6d2XLYMTNhyJGooSN5TavnYzBODN
	IR2RU+buY9EjnrI8i/0BqZz0PBGhtP6k/mYJ2gibGomTJk+xsmSPeD0zg2dcmpN+2VP2fPKzmkl
	jQUrZlf94EcFzYGHouulPUzFYlui6CJYCz3mV0w/v6auz24ODOkN2f6pqCCO+WhFQdW93uwvs65
	TivslxnBe5si0tAsDv8W4l6e46zdryvYEJHcqQsk8FAX+rSca9faQZKyTm3lLu7gTAG20rxwrgD
	Uds4e1YoMMPQ9VGn85I9PPGPX8/Z+pjcrCvBfkwJ+8JOLGou6T170eRHLK23AEYcGZSgxa6PQVO
	TOQlk8U7dsKxLENSQg
X-Received: by 2002:a05:7022:4585:b0:128:ce44:be90 with SMTP id a92af1059eb24-12bfb75c3c4mr6693096c88.28.1775529007511;
        Mon, 06 Apr 2026 19:30:07 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bf90973b6sm14114627c88.9.2026.04.06.19.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 19:30:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [STATUS] next/master - 816f193dd0d95246f208590924dd962b192def78
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 07 Apr 2026 02:30:06 -0000
Message-ID: <177552900608.2180.11160110679788517596@8692ffc4d55e>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/816f193dd0d95246f208590924dd962b192def=
78/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 816f193dd0d95246f208590924dd962b192def78
origin: maestro
test start time: 2026-04-06 15:09:24.369000+00:00

Builds:	   14 =E2=9C=85   43 =E2=9D=8C    0 =E2=9A=A0=EF=B8=8F
Boots: 	    6 =E2=9C=85    0 =E2=9D=8C    0 =E2=9A=A0=EF=B8=8F
Tests: 	  847 =E2=9C=85   71 =E2=9D=8C   67 =E2=9A=A0=EF=B8=8F

### POSSIBLE REGRESSIONS
   =20
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn=
+CONFIG_MODULE_COMPRESS_NONE=3Dy
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3eae1dcae953c056c7427
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3ebc2dcae953c056c79f7
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69d3eaf1dcae953c056c7457
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3ecc0dcae953c056c7de9
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:69d3eadadcae953c056c740d
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.devices-probe.shardfile-devices_probe
      last run: https://d.kernelci.org/test/maestro:69d3eca4dcae953c056c7d81
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69d3eaf9dcae953c056c7471
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69d3ede6dcae953c056cb0e7
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69d3ebd1dcae953c056c7a17
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69d3eb01dcae953c056c756b
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69d3ec46dcae953c056c7bfb
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69d3ec5cdcae953c056c7c4d
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn=
+CONFIG_MODULE_COMPRESS_NONE=3Dy
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69d3eaf2dcae953c056c745a
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3ec8edcae953c056c7d4b
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.devices-probe.shardfile-devices_probe
      last run: https://d.kernelci.org/test/maestro:69d3ec00dcae953c056c7adb
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69d3eafadcae953c056c7555
      history:  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69d3eba4dcae953c056c794c
      history:  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69d3eb91dcae953c056c78cb
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69d3eb03dcae953c056c7571
      history:  > =E2=9C=85  > =E2=9D=8C =20
           =20
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69d3eba2dcae953c056c7938
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn=
+CONFIG_MODULE_COMPRESS_NONE=3Dy
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3eadddcae953c056c741e
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69d3eae5dcae953c056c7434
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3eb80dcae953c056c7871
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3eba2dcae953c056c7937
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69d3eaeddcae953c056c744b
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3ebb6dcae953c056c79a6
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69d3eaf4dcae953c056c7460
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69d3eb93dcae953c056c78d4
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69d3ebc6dcae953c056c7a09
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69d3eafddcae953c056c7562
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69d3ebbadcae953c056c79eb
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69d3edd5dcae953c056cac05
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn=
+CONFIG_MODULE_COMPRESS_NONE=3Dy
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3eadfdcae953c056c7421
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69d3eae6dcae953c056c7437
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3ec31dcae953c056c7bac
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3ebacdcae953c056c7976
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69d3eaeedcae953c056c744e
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3ece2dcae953c056c7ea8
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69d3eaf6dcae953c056c746b
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69d3ed6edcae953c056c95fd
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:69d3ead7dcae953c056c7400
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69d3ec5edcae953c056c7c64
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69d3eafedcae953c056c7565
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69d3eddfdcae953c056cae70
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69d3ee30dcae953c056cb610
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn=
+CONFIG_MODULE_COMPRESS_NONE=3Dy
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3eae0dcae953c056c7424
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69d3eae8dcae953c056c743a
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3edb0dcae953c056ca416
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3eb99dcae953c056c7904
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69d3eaefdcae953c056c7451
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69d3ebb6dcae953c056c79e1
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69d3eaf8dcae953c056c746e
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69d3eba3dcae953c056c7943
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69d3eaffdcae953c056c7568
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69d3ebc5dcae953c056c7a03
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69d3ebbbdcae953c056c79f1
      history:  > =E2=9C=85  > =E2=9D=8C  > =E2=9D=8C =20
           =20


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS

  No unstable tests observed.

### NEW BUILD ISSUES
- Issue: maestro:914cbb905f3bdc6704f58e8fddef408bafdb622e | version: 1
  Build: maestro:69d3d6fedcae953c056c1a9f
  Comment:  ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not fou=
nd in testcases/fake_sigreturn_misaligned_sp (testcases/fake_sigreturn_misa=
ligned_sp.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-04-06 21:48:18.468827+00:00
  Culprit: code
- Issue: maestro:c905629d4de8f0d67e3bbceb3629696219daacc5 | version: 1
  Build: maestro:69d3d7cedcae953c056c1b52
  Comment:  in testcases/fpmr_siginfo (Makefile:31) [logspec:kbuild,kbuild.=
other]
  First seen: 2026-04-06 23:07:01.605540+00:00
  Culprit: code
- Issue: maestro:e24f671632032692e8b0e5683b5da5aec1a14bb0 | version: 1
  Build: maestro:69d3d704dcae953c056c1aa2
  Comment:  ./test_signals_utils.h./test_signals_utils.h::::: 15: 15./test_=
signals.h14:1514fatal error: :fatal error: :'asm/hwcap.h' file not found10:=
 :  fatal error: 101515fatal error: fatal error: 'asm/hwcap.h' file not fou=
nd:'asm/hwcap.h' file not found :: 1010fatal error: ::'asm/hwcap.h' file no=
t found  fatal error:  fatal error: 'asm/hwcap.h' file not found'asm/hwcap.=
h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file n=
ot found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found =
./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_si=
gnals.h:15:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:1=
5:10: fatal error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fat=
al error: 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error:=
 'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwc=
ap.h' file not found ./test_signals.h:15:10: test_signals_utils.cfatal erro=
r: :'asm/hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/=
hwcap.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' =
file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not =
found ./test_signals.h./test_signals.h::1515::1010: fatal error: 'asm/hwcap=
.h' file not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file =
not found ./test_signals.h:15:10: fatal error: 'asm/hwcap.h' file not found=
 /usr/include/x86_64-linux-gnu/asm/sigcontext.h:40:8: error: redefinition o=
f '_fpx_sw_bytes' s/usr/include/x86_64-linux-gnu/asm/sigcontext.htr:u40c:t8=
 :_ ferror: pIn file included from In file included from xredefinition of '=
_fpx_sw_bytes'testcases/testcases.c_testcases/testcases.c /usr/include/x86_=
64-linux-gnu/asm/sigcontext.h/usr/include/x86_64-linux-gnu/asm/sigcontext.h=
In file included from ::testcases/testcases.c4040:::88::  7error: error: : =
/usr/include/x86_64-linux-gnu/asm/sigcontext.hIn file included from :40test=
cases/testcases.cIn file included from :testcases/testcases.c:8:: error: re=
definition of '_fpx_sw_bytes'77 40 | st   40    | str::    _r31uu 840:f  | =
error: sccerror:  | redefinition of '_fpx_sw_bytes'ttrtu credefinition of '=
_fpx_sw_bytes'ts error: redefinition of '_fpreg'    c/usr/include/x86_64-li=
nux-gnu/asm/sigcontext.ht: 85:_8f: pIn file included from error: rtestcases=
/testcases.credefinition of '_fpreg'e: s:In file included from 8ttestcases/=
testcases.h:r :uerror: 15c: g sIn file included from  error: ttestcases/tes=
tcases.h{rredefinition of '_fpreg':u15 :f |  pserror: trredefinition of '_f=
preg'/usr/include/x86_64-linux-gnu/bits/sigcontext.he:r /usr/include/x86_64=
-linux-gnu/bits/sigcontext.htestcases/testcases.c_ :    :error: :40f{7p40re=
definition of '_fpxreg'7 redefinition of '_fpreg'      previous definition =
is here p_error: xredefinition of '_fpreg' error: In file included from   :=
 error: 407 | 40      s   redefinition of '_fpxreg'| : 8      :| pcx      |=
 |         ^       ^tr        ^error:  error: :         | x       ^t 46:r8 =
:: /usr/include/x86_64-linux-gnu/bits/sigcontext.h91 | e   _gerror:  8 | : =
   redefinition of '_xmmreg'error:  /usr/include/x86_64-linux-gnu/asm/sigco=
ntext.h:98:8: error: redefinition of '_xmmreg' merror:        ^e       {r /=
usr/include/x86_64-linux-gnu/asm/sigcontext.h:180:8: error: redefinition of=
 '_ymmh_state' ::180/usr/include/x86_64-linux-gnu/asm/sigcontext.h :error: =
8:redefinition of '_xstate':180 : 8error: :redefinition of '_ymmh_state'  e=
rror:   redefinition of '_ymmh_state'192 8   :error: 189   redefinition of =
'_ymmh_state'184note:  |  ::/usr/include/x86_64-linux-gnu/asm/sigcontext.h1=
80184:::8180In file included from 8::testcases/testcases.c: 8In file includ=
ed from : error: :note: testcases/testcases.c7:redefinition of '_ymmh_state=
' previous definition is here: error: In file included from  cct  terror:  =
/usr/include/x86_64-linux-gnu/asm/sigcontext.herror: t:_ yredefinition of '=
_ymmh_state'mredefinition of '_xstate' 8  :yhh  180  | ms_m_192error:  | ts=
hsredefinition of '_xstate't herror: previous definition is hereredefinitio=
n of '_xstate'_ :In file included from ttestcases/testcases.h:error: 7189: =
:s:x  8189t8s:t:a  | error: rredefinition of '_xstate' tseu error: tredefin=
ition of '_xstate'  /usr/include/x86_64-linux-gnu/asm/sigcontext.h:317:8: e=
rror: redefinition of 'sigcontext' ru/usr/include/x86_64-linux-gnu/asm/sigc=
ontext.hc:t317 :s8i:g cerror: oredefinition of 'sigcontext'n /usr/include/x=
86_64-linux-gnu/asm/sigcontext.h:317:8: error: redefinition of 'sigcontext'=
 /usr/include/x86_64-linux-gnu/asm/sigcontext.h:317  :1398 | :s terror: rre=
definition of 'sigcontext'u t:e/usr/include/x86_64-linux-gnu/asm/sigcontext=
.h :xerror: 317t:redefinition of 'sigcontext'8  testcases/testcases.h:101:2=
5: error: invalid application of 'sizeof' to an incomplete type 'struct _aa=
rch64_ctx' atestcases/testcases.htestcases/testcases.hd:: 101101|::|2525 ::=
r  eerror: error: sinvalid application of 'sizeof' to an incomplete type 's=
truct _aarch64_ctx'invalid application of 'sizeof' to an incomplete type 's=
truct _aarch64_ctx'v eecttestcases/testcases.httestcases/testcases.ht_:hx:_=
101e 101h::a*25de25h::  eerror: raederror: einvalid application of 'sizeof'=
 to an incomplete type 'struct _aarch64_ctx'invalid application of 'sizeof'=
 to an incomplete type 'struct _aarch64_ctx' add   :testcases/testcases.h10=
1,:r101|:|u:i net25 :25 uerror: s3vr:eisinvalid application of 'sizeof' to =
an incomplete type 'struct _aarch64_ctx'2 _ snzv __serror: ztinvalid applic=
ation of 'sizeof' to an incomplete type 'struct _aarch64_ctx'3<2t_ t   101 =
:error:   dtestcases/testcases.hinvalid application of 'sizeof' to an incom=
plete type 'struct _aarch64_ctx':note:  xw h4i104   | __al**        caweg e=
g(teorhcth_xtfif6hs  _le4a*<hed_ h=3D(eecoe ara(tdfedrsxr f*,et(ssh eusites=
tcases/testcases.hvr ta<n=3D: _udrt104r3esc,ut: 2szv  -c27t___tsu iH:  aerr=
or:  invalid application of 'sizeof' to an incomplete type 'struct _aarch64=
_ctx'm &terror: &incomplete definition of type 'struct _aarch64_ctx'i : h |=
 r         105/usr/include/x86_64-linux-gnu/asm/sigcontext.h1056e4s_ ::: 40=
13sic13 :::8vtz_   h:exeserror: error:  a)ozfincomplete definition of type =
'struct _aarch64_ctx'incomplete definition of type 'struct _aarch64_ctx' er=
ror: d :m:_95eu a8a | rcerror: g:iincomplete definition of type 'struct _aa=
rch64_ctx'cas(t s rt error: u      redefinition of '_fpreg'c|  _ | a       =
 4i85_ | cstruca105r:ca ctt13hr   ixn l:6testcases/testcases.h4c:_h 6   hea=
d _ifn 105c4-_*cpte: 37error: :t >error: mgaxr s*incomplete definition of t=
ype 'struct _aarch64_ctx'hx herror: :105mincomplete definition of type 'str=
uct _aarch64_ctx' | a 9195      i| c   i!13::8               ~~~~^:  uerror=
: ni=3Dn:22 im3error: 2:incomplete definition of type 'struct _aarch64_ctx'=
95 dne a   g-s_ a13te95ncltg:/usr/include/x86_64-linux-gnu/bits/sigcontext.=
h_a:i c: h_d22error:  46e:a-:>incomplete definition of type 'struct _aarch6=
4_ctx'!a8a mnote: a t/usr/include/x86_64-linux-gnu/asm/sigcontext.h 3m2a__t=
t smt: adgai ta_a98t:i-cac_ag8i:> m error: r,redefinition of '_xmmreg'a _te=
stcases/testcases.hh105extestcases/testcases.he:a:e:arm(am95a:r10637:d:,s d=
r22ecg15  tu,:h :{error: riu c6u4note:   incomplete definition of type 'str=
uct _aarch64_ctx'nti _forward declaration of 'struct _aarch64_ctx'error:   =
     itnritngdriutestcases/testcases.h3l2-ucctestcases/testcases.h::_106it>=
cst  t_105: niez! =3Dx :15m:a gerror: iincomplete definition of type 'struc=
t _aarch64_ctx'c raarg:ie106      g | u        c herror: c|  t37crh>g | :iu=
6   s95si cc4t |  t_zaerror: )_scataerincomplete definition of type 'struct=
 _aarch64_ctx'c t{t a hientl_iheader(sttc180 t_g e_nratestcases/testcases.h=
::8aiaedua105r::cahc esc t37rru6c 4r&(error: t:c ht_&cstredefinition of '_y=
mmh_state'x  error: 6incomplete definition of type 'struct _aarch64_ctx'  :=
4      95:si10:_15| :                     ^: tcerror: :incomplete definitio=
n of type 'struct _aarch64_ctx'c  error:       note: xforward declaration o=
f 'struct _aarch64_ctx'incomplete definition of type 'struct _aarch64_ctx'e=
incomplete definition of type 'struct _aarch64_ctx'|   arSe/usr/include/x86=
_64-linux-gnu/asm/sigcontext.hdu-aV>:cstestcases/testcases.hdi_:192t-107:zN=
:>810eREsX T::_ ;aerror: Eiredefinition of '_xstate'_  error: aSzV scxtestc=
ases/testcases.httestcases/testcases.hat:x    :t85i c*85106 | :* )i:       =
 4315g(ent:( :s( _lnote: tcerror: hiincomplete definition of type 'struct _=
aarch64_ctx'expanded from macro 'GET_RESV_NEXT_HEAD'hrenu 107a:tntil:ir10_c=
nh  icn:eeerror: hredefinition of 'sigcontext'l T      sc,10t:_| Rtt x_u i =
      ^error: Eincomplete definition of type 'struct _aarch64_ctx'Sr hn * )=
((h(ec   haa85dr | -         >*(m)sa(tghri)ucc  t+=3D  =3D(_ ham)aartestcas=
es/testcases.hc-g:h>109i6stestcases/testcases.h:4c10_i:): c tzx109{e:error:=
 10 : *       )incomplete definition of type 'struct _aarch64_ctx')error:  =
a(derror: -aincomplete definition of type 'struct _aarch64_ctx'h>   d _xara=
 aaur*crtc)c h(h_66a4(a4r__ccccthhxt6ax 4r*  _**hc)htex(etestcases/testcase=
s.haa h:dd*),109,:h10 e  :u+ aui nIn file included from terror: di(testcase=
s/testcases.c3incomplete definition of type 'struct _aarch64_ctx',n -merror=
:  acg      >invalid application of 'sizeof' to an incomplete type 'struct =
_aarch64_ctx'm,aig| imc 95r | testcases/testcases.hestestcases/testcases.h:=
s109t:v:95a10:t_:s 22zerror: i:  incomplete definition of type 'struct _aar=
ch64_ctx'note: c htoe fa_(dastestcases/testcases.h   e95atr:r | (rsct129suh=
r:tca6tu7t4 c:ti c__c error:  aitn_xaincomplete definition of type 'struct =
_aarch64_ctx'aarlr c :error: rincomplete definition of type 'struct _aarch6=
4_ctx': (note:  c_error: ah ceha6d4,_ cutixn   t 95*3 | htestcases/testcase=
s.h2es_:at130dt:a7, : tm uiierror: anincomplete definition of type 'struct =
_aarch64_ctx'gcit :e:t 129  testcases/testcases.h=3Derror: ::130_7 invalid =
application of 'sizeof' to an incomplete type 'struct _aarch64_ctx':0 7 r  =
    error: c:testcases/testcases.h :|   incomplete definition of type 'stru=
ct _aarch64_ctx'herror: 1306:                ~~~~^104 7 | _testcases/testca=
ses.h:        c :werror:   incomplete definition of type 'struct _aarch64_c=
tx't95hx  130 ct testcases/testcases.h_:130:7: error: incomplete definition=
 of type 'struct _aarch64_ctx' c inline st   r95u | cstt a_taiacr cihn6lci4=
h_n6ec 4stt_rxtestcases/testcases.hu:cc t*x129gt e*: 7t:g __eerror: ahtinco=
mplete definition of type 'struct _aarch64_ctx'a r4c_hc6t4x_ c*tgxtestcases=
/testcases.he :t*_106hge:e15at:d_ eherror: reincomplete definition of type =
'struct _aarch64_ctx'(a testcases/testcases.h   :95130 | :s7t:a terror: iin=
complete definition of type 'struct _aarch64_ctx'c gtestcases/testcases.he:=
testcases/testcases.ht105:_:95h13e::a22 d:error: e incomplete definition of=
 type 'struct _aarch64_ctx'rnote:  truct _atestcases/testcases.ha:r107c:h10=
6:4 _error: ctincomplete definition of type 'struct _aarch64_ctx'x 4_ctx *g=
et_header(struct _aarch64_ctx *head, uinttestcases/testcases.h3:1092:_10:t =
 error: incomplete definition of type 'struct _aarch64_ctx'm testcases/test=
cases.h:106   :9515 | s:t aterror: iincomplete definition of type 'struct _=
aarch64_ctx'c  testcases/testcases.h:107:10: error: incomplete definition o=
f type 'struct _aarch64_ctx' testcases/testcases.h:130:7: error: incomplete=
 definition of type 'struct _aarch64_ctx' eoerror: rnincomplete definition =
of type 'struct _aarch64_ctx'rt testcases/testcases.h:130:7: error: incompl=
ete definition of type 'struct _aarch64_ctx' testcases/testcases.c:18:testc=
ases/testcases.c34::9 :error: 36incomplete definition of type 'struct extra=
_context': HtEeA   xD18t( | (&            set9te | testcases/testcases.cx:r=
trb18ouorlma:c  v-34t:=3D aerror: testcases/testcases.ctestcases/testcases.=
c:> h elincomplete definition of type 'struct extra_context': 18e:xGaEi1834=
dta   d18T | _:R:ErSat_)e        _34e Verror: cincomplete definition of typ=
e 'struct extra_context'; Xeerror: rn      T|    rincomplete definition of =
type 'struct extra_context'mat_                                   ~~~~~^18 =
*ntt:rceoe18xat,testcases/testcases.cxn:(t :c9t:3436:s:ehxra t rtuar, error=
: *note: * ec tincomplete definition of type 'struct extra_context' forward=
 declaration of 'struct extra_context' c34hVx:a_trNr a E_testcases/testcase=
s.cerror: *Xc:incomplete definition of type 'struct extra_context'*To18n De=
rror: (incomplete definition of type 'struct extra_context' |  E=3DTa_18R:A=
34      :  _EcDS(| &Gerror: oV                                   ~~~~~^eExi=
ncomplete definition of type 'struct extra_context'Tn_t _eErRXxtestcases/te=
stcases.caE:Tt   -18S9V_testcases/testcases.cH E>A | :        _t:e*18r:m34 =
:=3D  hD36Neerror: GeE(T:_E xincomplete definition of type 'struct extra_co=
ntext'a&dR)XEnote: tforward declaration of 'struct extra_context'r v19     =
       :_19c:a| l                                   ~~~~~^i| dH            =
                       ~~~~~^o     error:  rcutestcases/testcases.c:hca    =
:919rt19 | :  *:_b19o19:*ao: ealr error: r ctestcases/testcases.crverror: i=
ncomplete definition of type 'struct _aarch64_ctx':h,a ic:c fatal error: | =
  |9595  testcases/testcases.citoo many errors emitted, stopping now [-ferr=
or-limit=3D] | : t:ns22tea19l:irt: 19n:m inote: error: e-cforward declarati=
on of 'struct _aarch64_ctx'incomplete definition of type 'struct _aarch64_c=
tx'  ac rt*cxfatal error: hh too many errors emitted, stopping now [-ferror=
-limit=3D]6 e*4agfatal error: _detoo many errors emitted, stopping now [-fe=
rror-limit=3D],t _ctx *hcead, uitntx3 2*_tfatal error: g too many errors em=
itted, stopping now [-ferror-limit=3D]em (struct _aarch64_ctx *head,fatal e=
rror:  too many errors emitted, stopping now [-ferror-limit=3D]u fatal erro=
r: too many errors emitted, stopping now [-ferror-limit=3D] testcases/testc=
ases.c:18:34: error: incomplete definition of type 'struct extra_context' t=
estcases/testcases.c:18:34: error: incomplete definition of type 'struct ex=
tra_context' testcases/testcases.c:19:19: error: incomplete definition of t=
ype 'struct _aarch64_ctx' fatal error: too many errors emitted, stopping no=
w [-ferror-limit=3D] testcases/testcases.c:18:34: error: incomplete definit=
ion of type 'struct extra_context' testcases/testcases.c:19:19: error: inco=
mplete definition of type 'struct _aarch64_ctx' fatal error: too many error=
s emitted, stopping now [-ferror-limit=3D] signals.Ssignals.S:16:19: error:=
 expected ']' in brackets expression 19 :  error:  expected ']' in brackets=
 expression  signals.Ssignals.S:16:19: error: expected ']' in brackets expr=
ession :  error:  expected ']' in brackets expression  signals.Ssignals.S:1=
6:19: error: expected ']' in brackets expression 16 : 19 :   error:  expect=
ed ']' in brackets expression  signals.S:16:19: error: expected ']' in brac=
kets expression signals.S:16:19: error: expected ']' in brackets expression=
 signals.S:17:2: error: unknown use of instruction mnemonic without a size =
suffix signals.S:17:2: error: unknown use of instruction mnemonic without a=
 size suffix signals.S:19:2: error: unknown use of instruction mnemonic wit=
hout a size suffix signals.S:20signals.S::2: 19error: :unknown use of instr=
uction mnemonic without a size suffix2 :  mov x21, x1error:  signals.S:21:2=
: signals.Serror: :unknown use of instruction mnemonic without a size suffi=
x20 :  error: ^unknown use of instruction mnemonic without a size suffix si=
gnals.S:21:2: error: unknown use of instruction mnemonic without a size suf=
fix signals.Ssignals.S::1724::22: : error: error: unknown use of instructio=
n mnemonic without a size suffixunknown use of instruction mnemonic without=
 a size suffix error: signals.Sunknown use of instruction mnemonic without =
a size suffixsignals.S 14: 217: :error: : signals.Ssignals.Serror: :unknown=
 token in expression2unknown use of instruction mnemonic without a size suf=
fixerror:  2error: : mov x29, sp14 error: ^ 17:2: error: unknown use of ins=
truction mnemonic without a size suffix ::signals.S262::: signals.S19:error=
: 14:26unknown use of instruction mnemonic without a size suffix: 2: error:=
 signals.S:  mov x21, x1error:  14unknown token in expression: :signals.S19=
unknown use of instruction mnemonic without a size suffix: 19^error:  :  er=
ror: ^unknown use of instruction mnemonic without a size suffix signals.S:2=
0:2: signals.S:20:2: error: unknown use of instruction mnemonic without a s=
ize suffix : error:   signals.S 2 unknown use of instruction mnemonic witho=
ut a size suffix:  error:  mov x21, x1unknown use of instruction mnemonic w=
ithout a size suffixsignals.S error:   unknown use of instruction mnemonic =
without a size suffix 2:  20  error:  unknown use of instruction mnemonic w=
ithout a size suffix20signals.S:22 ^^ : mov x22, x2: : error: ^error:  erro=
r:  signals.Sunknown use of instruction mnemonic without a size suffix^: si=
gnals.S2 :: ^21error:  :  add x0, x21, x22error: signals.Ssignals.S: : erro=
r:  : ^error: unknown use of instruction mnemonic without a size suffixunkn=
own use of instruction mnemonic without a size suffixsignals.S error: signa=
ls.Ssignals.Sunknown use of instruction mnemonic without a size suffix :: e=
rror: error:  error: 24unknown use of instruction mnemonic without a size s=
uffixsignals.Sunknown token in expressionunknown use of instruction mnemoni=
c without a size suffix::signals.S : :error: 2error: :  unknown use of inst=
ruction mnemonic without a size suffix error: unknown token in expressionsi=
gnals.S  error:   error: 26 ::  unknown token in expression   1426: : 14 : =
  ldr x0, =3Dcall_fmtsignals.Serror: ^unknown token in expression  error:  =
bic x0, x0, #15  :  error: 26     : signals.Serror:  unknown token in expre=
ssion ^  : ^::  bic x0, x0, #15error: 32 error:  :  error:  unknown use of =
instruction mnemonic without a size suffix^  signals.S:28:2: error: unknown=
 use of instruction mnemonic without a size suffix     :2732signals.S:2::22=
: signals.S: : 30error: error: unknown use of instruction mnemonic without =
a size suffix: error:  mov x2, x23:unknown use of instruction mnemonic with=
out a size suffixunknown use of instruction mnemonic without a size suffix3=
3 :  signals.Serror: ^ signals.S: : 27: ldr x0, =3Dcall_fmterror: :^22 erro=
r:  unknown use of instruction mnemonic without a size suffixsignals.Ssigna=
ls.S:error:  bl printf  : :error: ^^:   ^2 error: ^:  invalid instruction m=
nemonic 'bl'error:  error: :unknown use of instruction mnemonic without a s=
ize suffix2836: signals.S^ :: 10error:  : ^2error: : unknown use of instruc=
tion mnemonic without a size suffixsignals.S : unknown use of instruction m=
nemonic without a size suffixerror: error:  : : error: 2unknown use of inst=
ruction mnemonic without a size suffix: signals.S : error: 10unknown token =
in expression signals.Serror:  mov x0, x23::37 :   : mov x2, x232error: :  =
ldr x0, =3Dcall_fmt  ^error:  ldr x0, =3Dcall_fmt  unknown use of instructi=
on mnemonic without a size suffix signals.S :   error:   :33:2: error: inva=
lid instruction mnemonic 'bl' 2 :  ldr x0, =3Dcall_fmt: ^  signals.Serror: =
: 36error: : :2 2::  : 31error: error: unknown use of instruction mnemonic =
without a size suffix signals.Ssignals.S::signals.S2:unknown use of instruc=
tion mnemonic without a size suffix :error: 2: : 2 error:  mov x1, x21 39: =
error: signals.S::392^:unknown use of instruction mnemonic without a size s=
uffixsignals.S32: signals.S2 error: :error: 3332invalid instruction mnemoni=
c 'bl'signals.S 2:invalid instruction mnemonic 'bl':  : ^38error:  bl memcp=
y2 invalid instruction mnemonic 'bl': error: ^^ signals.S^ error: unknown u=
se of instruction mnemonic without a size suffix~~: :: :error: : error:  si=
gnals.S: :error: error: invalid instruction mnemonic 'ldr'invalid instructi=
on mnemonic 'ldr' ^error: 33unknown use of instruction mnemonic without a s=
ize suffixsignals.S::invalid instruction mnemonic 'bl' error:  invalid inst=
ruction mnemonic 'bl'^ ~error:  : 33^^ bl printf~ error:  signals.Sinvalid =
instruction mnemonic 'bl'^ :signals.S:372signals.S: 52:error:  unknown use =
of instruction mnemonic without a size suffix: 2: : error: :error:  unknown=
 use of instruction mnemonic without a size suffixerror: : unknown use of i=
nstruction mnemonic without a size suffix2signals.S^ error:  :  str x23, [x=
0]error:  :signals.S2error: signals.S : :error:  error: signals.Sunknown us=
e of instruction mnemonic without a size suffixsignals.S:37:2: error: unkno=
wn use of instruction mnemonic without a size suffix 2error: : error: unkno=
wn use of instruction mnemonic without a size suffixerror: unknown token in=
 expressionunknown use of instruction mnemonic without a size suffix 238 54=
 :102: :error: ^2 : :  unknown use of instruction mnemonic without a size s=
uffix : signals.S error: error:  mov x2, x21error: : unknown use of instruc=
tion mnemonic without a size suffixunknown token in expression ^ signals.Si=
nvalid instruction mnemonic 'bl'error: signals.S ^10:: :error: error:  inva=
lid instruction mnemonic 'bl'~39unknown token in expression2  2 :error: sig=
nals.S error:  invalid instruction mnemonic 'bl'~ : signals.Serror: 51: svc=
 #0  :signals.S:: 51  64::error: :^^signals.S~~572invalid instruction mnemo=
nic 'ldr'2:~~: error:  error: ^:invalid instruction mnemonic 'b'2 52error: =
: 2error: :  error: unknown use of instruction mnemonic without a size suff=
ix 525454:signals.S2:254::2:: : signals.Serror: invalid instruction mnemoni=
c 'b' 2: 2: : error: error: :unknown use of instruction mnemonic without a =
size suffixerror:  error:  mov sp, x23unknown use of instruction mnemonic w=
ithout a size suffix : ^ signals.S^error:  ::561054signals.S: b .2:: : :err=
or:  unknown use of instruction mnemonic without a size suffix10error: 56un=
known token in expression  :  error: ^ mov x8, #15 unknown token in express=
ion : error: :invalid instruction mnemonic 'svc'error: 2invalid instruction=
 mnemonic 'svc' error:  svc #0invalid instruction mnemonic 'svc': ^: ~~erro=
r:  64::6464:22:: : 2error: error: signals.S: invalid instruction mnemonic =
'b'invalid instruction mnemonic 'b': error:  signals.S:17:2: error: unknown=
 use of instruction mnemonic without a size suffix signals.S:19:2: error: u=
nknown use of instruction mnemonic without a size suffix signals.S:20:2: er=
ror: unknown use of instruction mnemonic without a size suffix signals.S:21=
:2: error: unknown use of instruction mnemonic without a size suffix signal=
s.S:24:2: error: unknown use of instruction mnemonic without a size suffix =
signals.S:25:14: error: unknown token in expression signals.S:26:14: error:=
 unknown token in expression signals.S:27:2: error: unknown use of instruct=
ion mnemonic without a size suffix signals.S:28:2: error: unknown use of in=
struction mnemonic without a size suffix signals.S:30:10: error: unknown to=
ken in expression signals.S:31:2: error: unknown use of instruction mnemoni=
c without a size suffix signals.S:32:2: error: unknown use of instruction m=
nemonic without a size suffix signals.S:33:2: error: invalid instruction mn=
emonic 'bl' signals.S:36:2: error: unknown use of instruction mnemonic with=
out a size suffix signals.S:37:2: error: unknown use of instruction mnemoni=
c without a size suffix signals.S:38:2: error: unknown use of instruction m=
nemonic without a size suffix signals.S:39:2: error: invalid instruction mn=
emonic 'bl' signals.S:51:2: error: invalid instruction mnemonic 'ldr' signa=
ls.S:52:2: error: unknown use of instruction mnemonic without a size suffix=
 signals.S:54:2: error: unknown use of instruction mnemonic without a size =
suffix signals.S:56:10: error: unknown token in expression signals.S:57:2: =
error: invalid instruction mnemonic 'svc' signals.S:64:2: error: invalid in=
struction mnemonic 'b' sve_helpers.c:13:18: error: use of undeclared identi=
fier 'SVE_VQ_MAX' sve_helpers.c:25:12: error: use of undeclared identifier =
'SVE_VQ_MAX' sve_helpers.c:41:12: error: call to undeclared function 'sve_v=
q_from_vl'; ISO C99 and later do not support implicit function declarations=
 [-Wimplicit-function-declaration] sve_helpers.c:sve_helpers.c13:18: error:=
 use of undeclared identifier 'SVE_VQ_MAX' :13:18: error: use of undeclared=
 identifier 'SVE_VQ_MAX' :18: error: use of undeclared identifier 'SVE_VQ_M=
AX' sve_helpers.c:13:18: error: use of undeclared identifier 'SVE_VQ_MAX' s=
ve_helpers.c:25:12: error: use of undeclared identifier 'SVE_VQ_MAX' sve_he=
lpers.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99=
 and later do not support implicit function declarations [-Wimplicit-functi=
on-declaration] sve_helpers.c:25:12: error: use of undeclared identifier 'S=
VE_VQ_MAX' :12: error: use of undeclared identifier 'SVE_VQ_MAX' sve_helper=
s.c:41:12: error: call to undeclared function 'sve_vq_from_vl'; ISO C99 and=
 later do not support implicit function declarations [-Wimplicit-function-d=
eclaration] sve_helpers.c:41:12: error: call to undeclared function 'sve_vq=
_from_vl'; ISO C99 and later do not support implicit function declarations =
[-Wimplicit-function-declaration] sve_helpers.c:41:12: error: call to undec=
lared function 'sve_vq_from_vl'; ISO C99 and later do not support implicit =
function declarations [-Wimplicit-function-declaration] sve_helpers.c:13:18=
: error: use of undeclared identifier 'SVE_VQ_MAX' in testcases/fake_sigret=
urn_bad_magic (Makefile:31) [logspec:kbuild,kbuild.other]
  First seen: 2026-04-06 23:07:07.155763+00:00
  Culprit: code


This branch has 40 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: =E2=9C=85 PASS   =E2=9D=8C FAIL  =E2=9A=A0=EF=B8=8F INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
