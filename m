Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C4D36AB54
	for <linux-next@vger.kernel.org>; Tue, 11 Aug 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786415416; cv=none; b=lwZ+iO8S9zUcYLIhU0QmClWpo7oEWiEyW6zFY8HIwGdB7tD1jv25xbIGNApvoNxS0l5HwXjogWmpyhm6NKWkut8QN8v9WyEHDhgGgRibflQzQshsQpsouGCcNn4Bq2NzO6iYNKs3mQBUb5YNZtvpZcqoDaJanvW260In59sDCuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786415416; c=relaxed/simple;
	bh=C3xkU/AGV3V8iIJ4OdWRTtieuqXS5/3rutXU1aiE4BA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=a3SLTMGoh7/76q5sQXYfId6yvqq8xjQY0JBtmN0Wdvp9kU85mb8y1yyyjmgycuaiyaqslz29QmEKkg+i4Lt4kuoiHfAZ66vf4Xvhr0sGg0IuHE8IKigmlmW5EeaGEQrc1S+uAiuobYIr2T1x+uZBe8NrkTj1r0r7uNBPuVlszFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=dboGvX/d; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="dboGvX/d"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d0407aedd6so27646545ad.0
        for <linux-next@vger.kernel.org>; Mon, 10 Aug 2026 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1786415413; x=1787020213; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f242RSQX4junFs+x6o7HaztivuwMd2vEe/OvTGXKI5k=;
        b=dboGvX/dCjr9dfv2WVniayATGSHFpHvRES9JzFTxnTkL0vP/n4WARJf4c5UmCrrHYa
         Hlu+kVuRhKVMyy5cMHUH1Of0FFgewlg6fir6amsOYlm1lIvW5D09Vcmx4tEgSf+2+lEA
         qy9o45jAkBpUFCG3pAvP0TIe0Qw56dPBJ+Kedm3xfhkpBgqf6rEKT5VK4Bzstw8W0Hvt
         jr56ljdet1GQuD6mZlpufQs5y9KDLZwMMZ+ImQFrU0mcygpsNXxu3XikZi3MBYN5msA1
         n/AR2MyLJdsW8AOxtw+4/Gvpl547P2qj6r1dvuG6an32Qy5U7CEShSt8IKVEqKFyWhTe
         G18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415413; x=1787020213;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f242RSQX4junFs+x6o7HaztivuwMd2vEe/OvTGXKI5k=;
        b=bl5uLYM5OSCMyhKHapfto8WhiarEMJDke+FpN2wRFze8uEWp36scl2/ojtE7V7L1oz
         QAPeGYe4u9s1yUyYknQJSxP69EZFF/xAzvGCxtddQsnwsN1MBRZEilfGAFQyUUM8DV7B
         4Rnb12CFUbZQ4zG7Lt2p11IP0pIlwGcxjMAeUPJwTfzlqKJqZkcfePZLpAN/g9xJoGJh
         ZV2PUUYRQYx1EJtkZRqXgTQrr9oeuwjWZ2obQicntoDjcKegvvsAuG93E7vIt4qWMgr2
         0YhnEMVutwHhYIBlSaoPp3KWb2mErFuTkZt9NVzGL2QUeNy4aLSOFrH+YDAUKr+sHxPf
         mUoQ==
X-Gm-Message-State: AOJu0YywyYsFFqZIdEc51yCpNBWvwsEXkDcRf6Ycjg1aWRB5Fg0eea6C
	hqLNyLvaINaDxoh5GBmp1BoacB6F+EAsHSfvFa/2X2Hsn4HRTFeifbLputVFZY7EtQ25H3xwnj1
	U7q4E
X-Gm-Gg: AR+sD12VbpfXD9YC3UD/DjcXRySegMH76DqF3MUio9sD8NqNkBhXrOXuccHYQQ4WSIm
	T1wevIE28+H6NHJo37slXBOaZ2s3ToSVlm9PKT1hmkWh7hLDDtNjZnEtrdFSdQ7zOen4ym+C4+p
	G5RLr7ZjdmawCXK22HXJn7okl1pUH9H4mr4kEDsAR68+DbgHeH2c9jWHhaaViadxsR/toqZRGFx
	/6aHLXr3/JIXUpza/K5JC4BGobz3yu+KToMHLWENN694AAjh0y26aNvtklB0Hsp30YMezQ5KVCU
	Pre+4B3BgUP2r+ObleJjNJCpzp5X6qTDMZuscRvJelHrE52XPGWn0hHDcUtPvLRfd/4n8w03eD3
	IRlOuE1vJTLHyGS8+8L5sHg/390U0erzflrfRl338Q1+kxjG0ueG00i675nod1kWZp73YfBUfqP
	KgpIYqW//XmzslTQGViEipW0c9m+pzvo7IaZEQhp68wDv8JPMR5RrCf/1yD2JTmMbt
X-Received: by 2002:a17:902:ce11:b0:2cf:7bfe:6043 with SMTP id d9443c01a7336-2d317903ca0mr2157435ad.19.1786415412488;
        Mon, 10 Aug 2026 19:30:12 -0700 (PDT)
Received: from 9a65d8f5b626 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb87d3bsm51111209eec.14.2026.08.10.19.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:30:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 11 Aug 2026 02:30:11 -0000
Message-ID: <178641541079.1728.3911448664162047813@9a65d8f5b626>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3d08ff75a47a3e7e2ab45a3bcab6723b4d906422/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
origin: maestro
test start time: 2026-08-10 17:27:11.258000+00:00

Builds:	   69 ✅    2 ❌    0 ⚠️
Boots: 	  179 ✅    2 ❌    0 ⚠️
Tests: 	33127 ✅ 4968 ❌ 7993 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm.mm_ksft_hugetlb_sh_thuge-gen
      last run: https://d.kernelci.org/test/maestro:6a7a517662f33761c0abd85a
      history:  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_2000
      last run: https://d.kernelci.org/test/maestro:6a7a315562f33761c0ab025a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_2000
      last run: https://d.kernelci.org/test/maestro:6a7a2bb062f33761c0aaad75
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_3000
      last run: https://d.kernelci.org/test/maestro:6a7a2bb062f33761c0aaad74
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a7a1bc062f33761c0a9d049
      history:  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a7a151762f33761c0a9328a
      history:  > ✅  > ❌  
            
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:6a7a1cc262f33761c0a9d738
      history:  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a7a1abf62f33761c0a9c8c7
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7a14e462f33761c0a92c20
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7a422c62f33761c0abb3ad
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7a422c62f33761c0abb3a1
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a422c62f33761c0abb396
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a422c62f33761c0abb394
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7a422c62f33761c0abb39e
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7a422c62f33761c0abb398
      history:  > ❌  > ❌  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm.mm_ksft_madv_guard_sh
      last run: https://d.kernelci.org/test/maestro:6a7a517662f33761c0abd7dd
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_madv_guard_sh_guard-regions
      last run: https://d.kernelci.org/test/maestro:6a7a517662f33761c0abd7de
      history:  > ❌  > ❌  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7a14e562f33761c0a92c31
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7a166562f33761c0a951c9
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7a166562f33761c0a951bd
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a166562f33761c0a951b2
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a166562f33761c0a951b0
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7a166562f33761c0a951ba
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7a166562f33761c0a951b4
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a7a152462f33761c0a93380
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a7a24fc62f33761c0aa7946
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a7a24fc62f33761c0aa7945
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7a14e962f33761c0a92c40
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7a2fea62f33761c0aac7f2
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7a2fea62f33761c0aac7e6
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a2fea62f33761c0aac7db
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a2fea62f33761c0aac7d9
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7a2fea62f33761c0aac7e3
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7a2fea62f33761c0aac7dd
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7a14eb62f33761c0a92d0a
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7a21d662f33761c0aa612e
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7a21d662f33761c0aa6122
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a21d662f33761c0aa6117
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a21d662f33761c0aa6115
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7a21d662f33761c0aa611f
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7a21d662f33761c0aa6119
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7a14ec62f33761c0a92d10
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7a247762f33761c0aa734d
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7a247762f33761c0aa7341
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a247762f33761c0aa7336
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a247762f33761c0aa7334
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7a247762f33761c0aa733e
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7a247762f33761c0aa7338
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a7a152b62f33761c0a934f9
      history:  > ❌  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a7a24ff62f33761c0aa79aa
      history:  > ❌  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7a14ed62f33761c0a92d1d
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7a30bc62f33761c0aafba6
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7a30bc62f33761c0aafb9a
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a30bc62f33761c0aafb8f
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a30bc62f33761c0aafb8d
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7a30bc62f33761c0aafb97
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7a30bc62f33761c0aafb91
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7a14f062f33761c0a92d47
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7a1fe562f33761c0aa202f
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7a1fe562f33761c0aa2023
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a1fe562f33761c0aa2018
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a1fe562f33761c0aa2016
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7a1fe562f33761c0aa2020
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7a1fe562f33761c0aa201a
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7a14ef62f33761c0a92d28
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7a21c862f33761c0aa5a1e
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7a21c862f33761c0aa5931
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a21c862f33761c0aa5926
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7a21c862f33761c0aa5924
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7a21c862f33761c0aa592e
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7a21c862f33761c0aa5928
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a7a150462f33761c0a92dd2
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm.mm_ksft_hugetlb_sh
      last run: https://d.kernelci.org/test/maestro:6a7a517662f33761c0abd857
      history:  > ⚠️  > ⚠️  > ❌  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a7a14fb62f33761c0a92d84
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a7a14db62f33761c0a92bd4
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a7a2f0762f33761c0aab7c2
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a7a2f0762f33761c0aab7c8
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a7a2f0762f33761c0aab5bf
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_pcm-test_default_time1_wm8960audio_1_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6a7a2f0762f33761c0aab5c5
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time3_wm8960audio_1_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6a7a2f0762f33761c0aab5c3
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time5_wm8960audio_1_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6a7a2f0762f33761c0aab5c1
      history:  > ⚠️  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a7a315562f33761c0ab0206
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a7a2bb062f33761c0aaad65
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a7a1bf462f33761c0a9d2c5
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
