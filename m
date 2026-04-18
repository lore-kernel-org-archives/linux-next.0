Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083433BB4A
	for <linux-next@vger.kernel.org>; Sat, 18 Apr 2026 02:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776479440; cv=none; b=o5hJL9ALbdb7M0kTOStMWHydj0J/l6yXsNTOXdPZqfP0Qo+RP8S/llBGCHe+ox89IQNoukopB3ScyTJvNh87SPYa4X/AvYf6R+cEo5+klkx8rm87u32xJnQoEYva3e9qGOkcXj/SqnvA5G7dUr/Wz7jIfXunpYtrW6q2rekZwgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776479440; c=relaxed/simple;
	bh=cGXn/W791mrEJZCwjSj0BqEMeoeRiRoprRvBB3Uc5qo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=dB/fjLN6snSLkJ5PqI9AN5EonjNUYVU+/tWN6oX9P2e2yFRQ7CzzRePkuHneA9/9BTN89aCvXnhQneMKrVen00tzb7mPHFiqMjhQLt221I7Ylc6AEvy/Ip2Si9OuC//2H0aKbZkE/C0StJ6IOju+/jX6VTeGOFbm/oUUbNnvuM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=BlYmqKUC; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="BlYmqKUC"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b6b0500e06so2550913eec.1
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2026 19:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776479438; x=1777084238; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/gTrBRO3MK6pZBwBmjZ4CFxtGHLj2eZDQwujszPOvE=;
        b=BlYmqKUCRp4PVZ4l7NXbmUaOhb5s6FFiotOldYyoATaE0ljbG/RqYqhPgKUN+v5GKA
         CQvEDKGY9Ht6B6/BXXeM02m5toInNVQTugE6xLrNk6OI9eklSFSlDdmsMVfaC/UGx87L
         4hhqqN8uL6yFBLDuoSLE0yViFiTxA6p2Iwpo7Wd5K2VRAcR+t5UZ5vZdkUmf8aVbtUS+
         /xs22FsG0hTy7J8AtjMo91Rc90ZW3IHJzlg9SfP+QAhjsek85/1wf02t0Zphkt1eVQTc
         G3XUdCVgdyq/9mheoaMJskEGFW3KffOPPUE8NRiGi4w/F0hTTfEiY+taAfh3Uq483kRG
         Q8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776479438; x=1777084238;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/gTrBRO3MK6pZBwBmjZ4CFxtGHLj2eZDQwujszPOvE=;
        b=d0tDXy7hxoPqoBtx5inzc/IR6HVCSVxwhogSILldZRmdxedBvRsuAjMJAMYtXd7kJ4
         3b2j0CItsyQ53gQ7okPGxNXiQlNUE0XF6ips3L7e+o6BNH4vX8DKXTDtdY4e6OemOyFC
         8K0BLr5xlDCg74KpjvLKDOM3b4y6U1qX1vY0H9NReyb4YOMmvq9KEaYkPVL4DfBUe0HF
         AipQHaFiv5RBoLZUfr8bdRcLivmg0hk/0B4MPmNCIPSDpfUK0Ij5gKp9PmgxFa5F+px2
         yxgnIDJPufPYVgLz0Spu7ONeAV1GuK2knhu/8sEJgoOUMVfknO9rrHC2dZXGe/EkgWHs
         IfpA==
X-Gm-Message-State: AOJu0Ywo7yDDF6isdN5VSLCloBRUimPlsfBCSlfI0u5a6i0FT/0ss0HT
	ykUyExtL/Rf+GJd8BFyCH+nfL9Vs4JwSpvRiK+xiWwfKQBMhn369kbRNJpY4G8r1lAEdjMssFX/
	f0ytH
X-Gm-Gg: AeBDievOJHCxv3uEmOnbreb0AXkA/04yY1O0QBY0Ib9GfbkbwKrknBZmS7/dRkz/rUT
	XW3VknMUiBL+qg84tMFuke8CTOzech/rbTYje5TG+55jC2N+wEy+HknzmwRu+0KIWhEzqhZWw1q
	wLhzLGsXEtwy+u4/KGx4rwHhBGfkRt82hEPVOpKMQMhcLB1jGa/JRHVAkGqoluekj9tb8pyRtAx
	sU2EpUnYIbiCkLdx8ybH33n9lw5HN08WEQwcf9mmHoi7cyDY+uIDHqtOAHbPaCQ/DR/AP/irb5W
	ntWeNXegUwPHQyzYr1XN89k5MzwuK8kAtcW2obN5TONdqhgpX3QmCZAwMv9cjGq5Xp+pOdyIdHv
	dPOxmbBxqIZVrywEZJAqUNjFtYcjXNeCGry03aTYjNh9jae5HMyN2iG0UGCj/ArJMDDH/9gf/qO
	1/AV+bhN9sBwSCooscpJ0mFCIiiGI=
X-Received: by 2002:a05:7300:e60d:b0:2be:833c:149d with SMTP id 5a478bee46e88-2e479110f8fmr2972922eec.28.1776479437900;
        Fri, 17 Apr 2026 19:30:37 -0700 (PDT)
Received: from 062ea10430ee ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce440sm4679889eec.14.2026.04.17.19.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 19:30:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 18 Apr 2026 02:30:37 -0000
Message-ID: <177647943691.227.1252413583318353193@062ea10430ee>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/c7275b05bc428c7373d97aa2da02d3a7fa6b9f66/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
origin: maestro
test start time: 2026-04-17 12:51:07.974000+00:00

Builds:	   57 ✅    0 ❌    0 ⚠️
Boots: 	  191 ✅    3 ❌    0 ⚠️
Tests: 	13784 ✅ 4338 ❌ 6128 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e236809b5a968309e5540d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e236879b5a968309e554a6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e237fe9b5a968309e567a4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e2394a9b5a968309e572c5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e236919b5a968309e5550d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e2380e9b5a968309e569ec
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:69e236799b5a968309e55389
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.devices-probe.shardfile-devices_probe
      last run: https://d.kernelci.org/test/maestro:69e237de9b5a968309e56282
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e236989b5a968309e5559b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e237b19b5a968309e55bbf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e237e89b5a968309e56552
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e2369f9b5a968309e555fe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e238879b5a968309e56d44
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e238af9b5a968309e57136
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e236819b5a968309e55410
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e237b59b5a968309e55bcf
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e236929b5a968309e55510
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e238109b5a968309e569f4
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.devices-probe.shardfile-devices_probe
      last run: https://d.kernelci.org/test/maestro:69e237fb9b5a968309e56762
      history:  > ❌  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e236999b5a968309e555a2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e237bf9b5a968309e55bde
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e238449b5a968309e56b34
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e236a09b5a968309e55601
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e237fa9b5a968309e566ba
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e2367c9b5a968309e553ce
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e236839b5a968309e5541a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e237c79b5a968309e55d7a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e237d19b5a968309e561cb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e2368a9b5a968309e554af
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e237d79b5a968309e56270
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e236949b5a968309e55516
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e237d19b5a968309e56097
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e237cc9b5a968309e55fc8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e2369b9b5a968309e555a8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e237c09b5a968309e55ca2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e237ff9b5a968309e568a4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e2367d9b5a968309e553d1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e236849b5a968309e5541d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e2388e9b5a968309e57018
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e237c69b5a968309e55d73
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e2368c9b5a968309e554b2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e238b29b5a968309e57248
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e236959b5a968309e55526
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e239529b5a968309e572d5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:69e236759b5a968309e55347
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e237d19b5a968309e5615f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e2369c9b5a968309e555ce
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e239759b5a968309e574ec
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e23a329b5a968309e57768
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e2367e9b5a968309e553d6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e236869b5a968309e55454
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e237d29b5a968309e56268
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e237b39b5a968309e55bc7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e2368d9b5a968309e5550a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e237de9b5a968309e56278
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e236979b5a968309e55530
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e237b09b5a968309e55bb8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e2369e9b5a968309e555f7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e237cb9b5a968309e55e69
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e237e19b5a968309e562dd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS

  No unstable tests observed.


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
