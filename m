Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5740149C7B
	for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 02:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787020242; cv=none; b=ZYBYY0pFtVUjizmGyGz2hfu7dZsTjWuXWKMW6GM9/3aaBZ6lIJBphJ37WTPHdaB9JQKhVwGgktjSrz/6RHx9g9jXtOy9sQT29p/5CHwjh0NsCJ2QG20SIkX6EVdQmF1SU294xVcq35wXsrHm8stGQfdBr/pfdacELcMOEM6yMdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787020242; c=relaxed/simple;
	bh=x6rjeamWHaDgPUpKYnoe/9ftXVOHdfLszFisYu8c38A=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Qhx3w1FsPstpgLjavGh8dCyK2J0omXuZQBrdyfdJA9JKiDTsuqEHSRyLPQ6SjJKRKoCCRQs+Ya2faU9pf43mIbYOxEgyQftG4e37SYXHsPvxBmoRwGPd3MRpXN2oFgFYQcFBTfzDYLOfAYwoexBs7akFzcEDTTlTKFyDB2wLpqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=FWDMKtKM; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="FWDMKtKM"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc891373e0so53505125ad.2
        for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 19:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787020240; x=1787625040; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nsvKti2sjx0sGDv9PLcX31fx6nDb09/hy3XkJC+Hwxg=;
        b=FWDMKtKMQp+0+1cxh1p1+LZwbve+lWdAa2Hb7E/9vVZmfPNqvNznl3l3RyGWSax8Pe
         caKfq0AEB/+V34YetG5PJUEqrkc27YbAiutkgIFJTFFioxpX4qOmpbT7b/w+cw8tdn0U
         LqZ3OyoDdYCh451FepKp5WT58BQbB1LGpmsWdbiCVdckCjKClhxOi6zHFSfWbxDZTWJI
         nX1goPF5rRW+DZXLNFPf3EJfeSqm83myqRCq8jTm+SdSq3JTXxrX6vjoe1NNlzRdBs4x
         mydTapccCYjvZhIveAknzhm6Qol9Mt9HJr5+77BdT/cwxmmb1hK39xQsijuzX9PHsEHb
         Zclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787020240; x=1787625040;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nsvKti2sjx0sGDv9PLcX31fx6nDb09/hy3XkJC+Hwxg=;
        b=r6rNK1GhWvSG3rDOsVjea/rUYmnIqwX1vfLkTbL2a0c4EZQLxpg7/mRyLpCetMDg0M
         LogqizA80DRwgU32LBPTZswrtLjmNjt9T9qSxzb0LqU0MEZL7tkW42guI2NHhSLqbv1P
         iWu4Q3m8C/xFuuHX1gWdu2m1fv7U3E54a7ZL/izJGFJa0U7hqTPipifBbms8fNxvfIox
         KZQv5E6jIw5v71k1HrXegPHrlfKkNdQqzF0sgJOEd+spfZaDPOdnQ3uLh7vPK/PTTBUW
         utNrseedX45wBTQlGtythAZUnb3UbOx1jnAqh551Wos8g9ehoOu5u8Fkv+FQfBUiwY0c
         g0+g==
X-Gm-Message-State: AOJu0YyfYxBE05hRCUhMo6230T6KvFZsDqhxsy6HeFfGvXoKSvnIJ1SN
	PmFPDcwo1L4Jb5wMW6mG8j2XMw2AgZyaj38d6MNRwIein43Nrx0uV6Y7B88f3FEdI4o=
X-Gm-Gg: AR+sD10QEAu9sqBRvGsfuAYxPXE1uKpqAMWzVoDY83ioMsslsw4f6omtTohgpFpHIWb
	rh/xOuznWRtUA53gI7q0PKrjpemyzxvwBfh2RAuecXQrJlgnqO0C4k1BmME5TXMUhcwIwtxKcG3
	BvwHsNYGjAo3XqTXvQhd3faUDBOICUuVRFd3L4CbHg5MQqYTXYRPV7xaycLFxw1wdQOyVEp6hbZ
	d2mEkEiFkg6GgR69n1v2ZoXtn5S5zzwW704cnuTHJdoASx55Jo/KRmXK41pzQn7H+wz/NetdoGx
	6XNfwiOWZo1Y7A6OwzWuHcd7xdtaio3EHv3TbbIaVMwMPkQSo1+Gk7Ca76c3OcLfbFCRRVMfDvr
	uDElVoBsVDfiXP8wtg30X//lMG3qABqpvWedOFFDFZOJbCSe8WNgwxcnXz+UsCREs212WEAQUa9
	5cyONZs5qEe1E8KUo0PKgNEdOMDj0zPM6wLyfqDTxkOOKRBOABVZYf
X-Received: by 2002:a17:903:3885:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d3b0d78794mr307398055ad.5.1787020235810;
        Mon, 17 Aug 2026 19:30:35 -0700 (PDT)
Received: from 9a65d8f5b626 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd22f7sm16481675eec.1.2026.08.17.19.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 19:30:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - e6664f2b33db9b6811eb4cec109f06cb2b4f458d
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 18 Aug 2026 02:30:34 -0000
Message-ID: <178702023411.5186.589971969136378158@9a65d8f5b626>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/e6664f2b33db9b6811eb4cec109f06cb2b4f458d/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
origin: maestro
test start time: 2026-08-17 17:29:29.666000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  169 ✅    2 ❌    0 ⚠️
Tests: 	25625 ✅ 4611 ❌ 2859 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_verdinwm8904_21
      last run: https://d.kernelci.org/test/maestro:6a8373b162f33761c0d5b0e5
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_verdinwm8904_21
      last run: https://d.kernelci.org/test/maestro:6a8373b162f33761c0d5b0e4
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11201000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a83616062f33761c0d55181
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_112a1000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a83616062f33761c0d5517c
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_112b1000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a83616062f33761c0d55179
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11201000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a83616562f33761c0d55380
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11290000
      last run: https://d.kernelci.org/test/maestro:6a83616562f33761c0d5537f
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_112a1000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a83616562f33761c0d5537d
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_112b1000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a83616562f33761c0d5537b
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_memslot_perf_test
      last run: https://d.kernelci.org/test/maestro:6a8370ec62f33761c0d5aac9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_memslot_perf_test
      last run: https://d.kernelci.org/test/maestro:6a8370ce62f33761c0d5a959
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_memslot_perf_test
      last run: https://d.kernelci.org/test/maestro:6a83832062f33761c0d6156d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11201000_usb_0_hub_1
      last run: https://d.kernelci.org/test/maestro:6a83616062f33761c0d55180
      history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11201000_usb_0_hub_2
      last run: https://d.kernelci.org/test/maestro:6a83616062f33761c0d5517f
      history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a8354a862f33761c0d4aefa
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
