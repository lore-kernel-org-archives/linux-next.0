Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51262701D9
	for <linux-next@vger.kernel.org>; Tue, 21 Apr 2026 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776738613; cv=none; b=Htf3j0MnBjRnzzJazkD4QIqBu1iUt+oVeOr2QUNx0ip0nEHa5ytAW1OcKzQYWR+qSUnXrKhJQ8n96fUd2cTemEiWyry4x9ck+SmKjFyjbiWSZw1JZLRi6svystd8dpb0NTGWbIu70YWlNT1+k6RmGnVk1pSTNXBRnuS76PmK0Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776738613; c=relaxed/simple;
	bh=SZqJYZ50UKaM/oObJcsRMB86CUPOP+YmfN576gFzcFM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=n7zFpc8A9BaMHGto6lNfR+lDA6mMaCRXZtTWywSHnaNrv4HftTgwv9hnMrQaNAXqDf0/mqCXmIc0JDDr2NQOLhj5BBzCXH++9S76BtWxSI2eOhOOO3OenMciKVkE//jKXoz6PaKT0zoWEX18wNawzWEzn8YXj6gFXuvZL/RhTU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=cB0o0YF2; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="cB0o0YF2"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c8cc7a77eso1126715c88.1
        for <linux-next@vger.kernel.org>; Mon, 20 Apr 2026 19:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776738611; x=1777343411; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1pDbYwBYPvBhA7KDANCwpL8/E2qcReLKQO36Jue5IY=;
        b=cB0o0YF2DLWxtMBk+C8GEH3m75z+4v85a5GXy78T8fa6nRAvRW2LS17yKxK8aSeE8c
         HKL97ZS6VENT/5gSOypkV9EuVCOdPGPzNBFf6dpNjZdDPDUAppV9p3pBWs71tJjh3aoA
         SliHXhHKKSd8AvDPOZlNSdyE+mXvdI+WQ27NWOu7QobxQxgXXEgdYzPHeA7bdX6LruPK
         qW4MMuHhm6bptt1VOF3vCmrBnOxaIWQRo1T+h2zMoBuIh7wvYI23YSkQBjXStq22VcYh
         7CW/QE200MQlY6dVQCLhlJVOWp2aMQrgualLPUYw/RSl9qgJp3/Imf3lOnLgwLscfUT+
         0Eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776738611; x=1777343411;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1pDbYwBYPvBhA7KDANCwpL8/E2qcReLKQO36Jue5IY=;
        b=c2KR712xvrcHS9l3OlkJjecouTIUXwizpOyvnmVAHWLRkMbykdC5jpzjsh69rIAvjP
         p7xIZyT6GAiLq7ObNvUMt243YEQTLWG2RNx+UTWLrNTMmw4FVGOdYtHQ5KlpyYemqWuh
         kT6z4td8fy+iPJydgDcUSABw/FXkbu+JEg/S4Jve5d/ytzNypvKR/1Fc72+kxVdACxpq
         YvQrd8Hq8WApCgntybUUP+LANXKncix6cduZMhCAlIyHx8BjnkeO+iXbxTNk12Jqq/JW
         WOfU9KBga/+Y3LjHOxszjiRRpnLp/WzI7pK1TdCOUPvBe6i0WO/VVJngheYBMs4sgDad
         /tyQ==
X-Gm-Message-State: AOJu0YzdCwEooMbatcjt0uYCUtdWEOkaS3S6Wzlmzm1/RLT6dAHFuWs3
	A/eyDKocq5JQs46gqqOGdtDKdMdap0M0nKjVNtNLzhD1UJuZNZCZOpe/v0FszUHCK2g=
X-Gm-Gg: AeBDievQA/It1FspIKQEgcaynIwlXS86kBSpKW/jVfqBGEIcuSO0EBKwWTAyOMvxDd6
	g9aJqo9L8CbAhginEMF8elCZ7oE22iAQu8OqLik/XxHFpqWZboD5d0gd6YBpbW5qmV1JvXRxTZE
	+EBh878aYFUj475SYYLQgzrh7tHObl0x80ERf+Vk2svD0GK+tWNy7/NXJJ6/mh2bfWTIt+Oh1Pf
	Y2ACG41YDytnmNPY3zMU8XHNlZZiDFrmKcDNgG6Olt+/QWToJHCgb1hktG8vxmigfMumjYCy3nc
	6igu1GPrwTAK/3+0V1WowBoH0t5EkETl2us63/YtnpLPUnuYFohyhXlJpWPDTLRmGLzfsR6kaPC
	dn7/xUcK5MVk1cl07Cm4SwNdghEqajBC2+cpLwqewCqLU0yLxJZWCY2blc9GmsPXtXq8Y+s05fL
	3GtN/ZcxZYCYPQt0UBwxPfjctqb7I=
X-Received: by 2002:a05:7022:6b93:b0:128:d396:f2ea with SMTP id a92af1059eb24-12c73b05f8emr7294686c88.11.1776738610721;
        Mon, 20 Apr 2026 19:30:10 -0700 (PDT)
Received: from ab39070dab57 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c837f7feasm15543964c88.0.2026.04.20.19.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 19:30:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 97e797263a5e963da3d1e66e743fd518567dfe37
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 21 Apr 2026 02:30:09 -0000
Message-ID: <177673860953.246.13875932041803386156@ab39070dab57>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/97e797263a5e963da3d1e66e743fd518567dfe37/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 97e797263a5e963da3d1e66e743fd518567dfe37
origin: maestro
test start time: 2026-04-20 13:06:36.529000+00:00

Builds:	   57 ✅    0 ❌    0 ⚠️
Boots: 	  183 ✅    5 ❌    0 ⚠️
Tests: 	14520 ✅ 4102 ❌ 6095 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69e63d2c9b5a968309e85a74
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e62f739b5a968309e7f14a
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e62f7a9b5a968309e7f170
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e633bd9b5a968309e815ac
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e630a89b5a968309e7fad0
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e62f819b5a968309e7f183
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e630c09b5a968309e801ca
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:69e62f6d9b5a968309e7f138
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.devices-probe.shardfile-devices_probe
      last run: https://d.kernelci.org/test/maestro:69e630c09b5a968309e801d4
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e62f889b5a968309e7f195
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e630aa9b5a968309e7fc2a
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e630b09b5a968309e7fd48
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e62f8f9b5a968309e7f1aa
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e631589b5a968309e80519
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e631869b5a968309e80769
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e62f759b5a968309e7f161
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e62f7b9b5a968309e7f173
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e630629b5a968309e7f3f5
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e6309f9b5a968309e7f748
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e62f829b5a968309e7f186
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e630a69b5a968309e7f8ca
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e62f919b5a968309e7f1ad
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e630889b5a968309e7f66c
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e62f709b5a968309e7f141
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e62f769b5a968309e7f167
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e630769b5a968309e7f3ff
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e630a39b5a968309e7f758
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e62f7d9b5a968309e7f17a
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e630839b5a968309e7f5a8
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e62f849b5a968309e7f18c
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e630b09b5a968309e7fcfe
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e6307e9b5a968309e7f4b3
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e62f8b9b5a968309e7f1a0
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e630a89b5a968309e7fb5b
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e630bf9b5a968309e800c5
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e62f719b5a968309e7f144
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e62f789b5a968309e7f16a
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e6316a9b5a968309e80614
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e630a09b5a968309e7f750
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e62f7e9b5a968309e7f17d
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e631989b5a968309e808c6
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e62f859b5a968309e7f18f
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e632259b5a968309e80d61
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:69e62f6a9b5a968309e7f135
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e630b19b5a968309e7fed1
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e62f8d9b5a968309e7f1a3
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e632789b5a968309e81145
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e632de9b5a968309e8131b
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e62f729b5a968309e7f147
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e62f799b5a968309e7f16d
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e630a89b5a968309e7fadd
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e630b19b5a968309e7fe18
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e62f809b5a968309e7f180
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e630ad9b5a968309e7fc96
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e62f879b5a968309e7f192
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e630889b5a968309e7f73b
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e62f8e9b5a968309e7f1a6
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e630a79b5a968309e7f9aa
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e632559b5a968309e80f5a
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS

  No unstable tests observed.


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
