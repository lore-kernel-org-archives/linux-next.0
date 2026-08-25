Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA1A312814
	for <linux-next@vger.kernel.org>; Tue, 25 Aug 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787625015; cv=none; b=ofG5VkdaeMuMt7pjpx3oeWxleKi2DT9+JziNRUNaJqs/DvclA+7p5Ku6WwbQQ6fvjR45FdffCZA1zUYmK+rbkWsk4QfuCzLZpGq5vjRC4qm37ODYMVzlr2NKr3izxTD+y1oY18NzNCgeRpt43ndFtXIgCS/NDt/e67ZmOnLelKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787625015; c=relaxed/simple;
	bh=8TBkO5Z66yjLLxufe7XC38bcdVDXWE+QnSyInMiBY2Q=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Kr/M3PFBY7Fema1XzdWWYtnKmJULv1dBUfrdB1XmbBTChzoJYWGw1YSf08kxEjjVo3s1Ap3Fb8heIF+DmbFE2t3TEnSRsMiTGTz6X2P/s2KCf410m8p601mxwAAvYJslRATrp2jzAOtoT2kT2ddC2e1ToroXDAtWEkmiuyIORC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=bzGyX4Aj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="bzGyX4Aj"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso3250847b3a.2
        for <linux-next@vger.kernel.org>; Mon, 24 Aug 2026 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787625012; x=1788229812; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x0PyWwfRndstsxU4m/gLt2GVNxcvZRoLPU1ZYhjieUY=;
        b=bzGyX4Aj5S1rCQE3offMnzy00EzBZ+sz/G8ExEtLA+GUxIp4tjy8MI968bjnaM93DA
         7QUT+bTHGYw8C9ink9hoRJMS6yNc5ZMY61YYroVvtcdV5WrU67RbxSt5ftIqWXD8V8AG
         hUsGzq0wC8dnLdzv4kW8Tsr3RATvkfQANWCQJhTKrVXtMaFOQBkm39198z9+5d2gJ9b+
         X7xsZO8qyTnwVRzOEMYRqNrtHo7Ifwgts3gWhkZz4DNhUHyg2INBNIvdAZSV6pPh7Ou5
         Ydof5oTn5aOYKV18P0wXhRa7oyxvc811y9gy3ZSamB5aWgb0JbGGDVvVWtH25Xks6RWZ
         bFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787625012; x=1788229812;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0PyWwfRndstsxU4m/gLt2GVNxcvZRoLPU1ZYhjieUY=;
        b=Oe24vra20/CbGs0auvweEy8/G6Znb5itykNdOndcUg7MXKn/E7Xf5hw8JHPWZVz/Bi
         eRifPSIfKIqsi6+pfhqH4U+xbgdZBIOLlQT65oVJ8XHBLKABM9WZStA7W7hF9UmT5Ix3
         L/i1cDmVFwfRFCn/mIhx4Ms1O9EAwvOHfqd+HeoXbVaBJxcA1XsM4Ru0Uhc01OUuEfV3
         ZTW+oB959laA2jQ8c0/+sSZeiUxKn933EqmngIu2/5Tab/zeDR7DVobLBOm7D6QpMX96
         o14gN8/VTC9k6wYmKN2hMYQUF1gDsa/yRjZgR8GCnv47ijsCKbu1sFbKUH+KNVT/ImOt
         NFng==
X-Gm-Message-State: AFuF++nYzC8m0HBK2GhBZKyjvJv2Pzm4cLrZrBI39rOEXiQvrhT/jcuS
	fMtktwCA4ip+jjShBApNyArxae/pVer7rOlRe73BIFyZdR/hadkXstU0UfT6vP/Jbp0zvjj4duQ
	hbX0q
X-Gm-Gg: AR+sD11vUGWS9kWHoYavn3bdOK7wo8oKeg/2NSA+lTth60+8Yd9S+7Lbe0Fk28lJCaQ
	X6ve7zWwKDfXs/3nHXm2LXdCsH7hEiD5KZKyk2KKio+cNyD4sxLyA95u9mPI5oKvz1o62Q215G4
	mFdIUyYgUdQ032q3gGqwLsXrbdWzp3266wjWhdMFtMIU90nlsu+baz+9vjkjeRvVtKoAkqbUUnf
	cqkUpLpzig/LjckguUTOHnU2VyHkhqUoNqog1s3dIulx7LibkBvlRg3j6zGjYHKqmaSQdUS6ReH
	lUNh/VuxDaEsjI5aQQ2bYZ1UjycqRU9qLPKdufJyY7cNinBzvS6xQkoOCN9MFR9tP41PuYE6XJK
	VJXoaY0aMNLu6u2QfEzkyIK3oEFCDl7fbjsQRKzH7UdEdwLCDbVVErFjOn2kI+QguzUjkWrxogj
	R7tJgfabH8wQ3UHe395KSzaMZEnwSqL+2pTBkysUoZPFL0Dc0vcn2enSU2xa6LfZk=
X-Received: by 2002:a05:6a21:a96:b0:3c3:954d:278d with SMTP id adf61e73a8af0-3cd3009cf0fmr28731710637.9.1787625012496;
        Mon, 24 Aug 2026 19:30:12 -0700 (PDT)
Received: from b455de3d9de8 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3280782f09fsm23293173eec.20.2026.08.24.19.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 19:30:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 4b18edbd8e70f7e6860d56370f13244896d0f95c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 25 Aug 2026 02:30:11 -0000
Message-ID: <178762501061.2879.3983482847181311187@b455de3d9de8>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/4b18edbd8e70f7e6860d56370f13244896d0f95c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 4b18edbd8e70f7e6860d56370f13244896d0f95c
origin: maestro
test start time: 2026-08-24 13:39:12.891000+00:00

Builds:	   71 ✅    3 ❌    0 ⚠️
Boots: 	  186 ✅    1 ❌    0 ⚠️
Tests: 	34738 ✅ 5320 ❌ 8172 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:6a8c56fa62f33761c00f0617
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a8c544b62f33761c00ec806
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_60
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f7597
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_63
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75ac
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_61
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75a3
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_62
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75aa
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_63
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75b1
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_64
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75b8
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_57
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f7586
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75e1
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75ef
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_73
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75f6
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_57
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f7584
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75d8
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75df
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75e6
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75ed
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_73
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75f4
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_57
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f7585
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75d9
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75e0
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75e7
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75ee
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_73
      last run: https://d.kernelci.org/test/maestro:6a8c5f5d62f33761c00f75f5
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a8c52d962f33761c00e7f4f
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
