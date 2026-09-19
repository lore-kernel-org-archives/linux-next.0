Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA653B2FDB
	for <linux-next@vger.kernel.org>; Sat, 19 Sep 2026 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789785014; cv=none; b=G5N+RC1Q6+eLtFsNf377shxsccU5UX8w3+eNIQLr6Sh6DnMCAwZ6wlSiNzsNDYgambIVFk77QDZL7E6NAagpW5idUZgjHQO1VyxAVGj8v8eFtCzteRtg566SK8SzE2PnXEUCK0UpEySiluVaUerR424u/rmleh76KqEOTVdthKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789785014; c=relaxed/simple;
	bh=BdQEhKgSXz8nawjzdwfuogvzRaL7vx6cSBqrRsrn518=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ZHSRWw2BAOUbnY+nB1h5EktP/UiiPPXI0QnUTGeSJn8L7mAidT5woAZJ2P3kv5IN9k1FMcid/KNk2GQzM4jaafXFyVNO6C3/vkbU0SI75qaICcOztLmljX4GxdbQSHlmijWm3yQnwxJxK3evpQM5qlvwLlqN3A0VoKqrXbZaxyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=aVRLZjUk; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="aVRLZjUk"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c6920so1274885a91.1
        for <linux-next@vger.kernel.org>; Fri, 18 Sep 2026 19:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1789785011; x=1790389811; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3sAbVrVsZ0/wgXnE44ceNUTb/OOI8vJaxW4xfZ3vvg4=;
        b=aVRLZjUkwlBTiT5yef3+Vrkphbpm1j3srKfuxNuQMMbORg53+Deux7jYvaBMpVtY5Q
         i9YQ8IUiQMFXRoHRTj86EDFLhqK1eIRANbvUw9vPyjfDHJpzvDCRTGEsV+kc4CKTImCY
         k5KR1QpoLUOfMFfPVhdkTiOsg3WuDj5Z7CWt8BR1sldTkXnwArAdT9jW2uJKjaiRUl2Q
         JmCZqLDyz/nrLVYa/fvdwfgIFkuV2AqGsM7yJSmeTVhxVxxbL0YuQ9cpRzb7rxXdfie9
         SwXB3th+iKEC0iohl7xrjaIPFWooXblnU8oBasxbsRyZm5re5DO3NVFmHIWBiFEbRcNn
         jwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789785011; x=1790389811;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sAbVrVsZ0/wgXnE44ceNUTb/OOI8vJaxW4xfZ3vvg4=;
        b=ZBvlHDz6KzSMWp9i7jouwLgSco2Zrng0tQfAbv2rtcgaZeZI+s9SbQdTv1XXSUSzXN
         sWVqAyeSyDT3YIsZCoOatxpRaq24Llumfh3UlIiHmuujt1aJi0+oHYFXyH5N8PXFikDt
         SqQOlryhT4aRK546YEWq3iqvgMz+pWPZ6XCq+mqF8zDU4Fc//Ch+hBpaE304dZm0xT9p
         bxCdWJUfHheVD7Ky0fsht6RdsK5emnLlrPmtTckpBlAf86A4C4n8XIRSprHjHxotGain
         uh2O2RP5mp1r0k5P3d8SAhyEhc6AptGV9EKB+j84m3D/wQyjqJGEqlvV5pz1itI4nHbS
         fThQ==
X-Gm-Message-State: AFuF++ndzDx4HXKutDrNMoG4LXMRH4oeLVADd4a+mIvTYTSVQKePEc6l
	bp7bsRJYbyrHT4wNRRXFV/ogW50nKoWndSzj3nuHN6r8onYNOigbPRZI4aGbDyedjY+JI4loPjt
	UvF9j
X-Gm-Gg: AYBFou1DAu//4+4fn9UCb5rhQuCdb3rUxMnTedP88otQE0RDLA+u8q3FrabqEqUD7Hz
	mei31rgdvtpcDLOPdqBbxjBsKMhSltgp7NWCtmXTLo/rqwmY+0+5byueUJgWOUERd2AnQCb4gdK
	La/v58PHeaW2yAqfz+Vy3uImQOwh4WJxm8GtjTWsdsjhy2VaNNAyfDTmsaaLEZn8ksjAov998/W
	76CSjUixQr7OF+XomFE6rMm4Z5urCh2f5EPsCWTqCv6qZEYqjX/vsmjBzLJ4L3kbbB4nJC46FTt
	icVfm2NEJBed+HTY1/odeamnQcjU5wKTKOUghQvyy9fKiu4O4iYGDnsO2BvS/7yBG1+YkQN+0OM
	KaY6w5R9v50209DB7kXIkDe1NfC0RVPk2s79dDYIT2sKTRKyR0AL6TnuC2bTIFIykoRWIloXu3N
	DaX/yUyjf9LQhzPCAz7ODn24Yss2IxaPO5vuT846iX3bXtrjKutsYo3GlVQGiOvR4yKNe9W/0ay
	w==
X-Received: by 2002:a17:90b:3e85:b0:39d:fe64:5725 with SMTP id 98e67ed59e1d1-39e54d37ademr8545339a91.5.1789785011227;
        Fri, 18 Sep 2026 19:30:11 -0700 (PDT)
Received: from ec7b70f3a45c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm2422518eec.14.2026.09.18.19.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 19:30:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 19 Sep 2026 02:30:10 -0000
Message-ID: <178978500951.225013.9856664262969196617@ec7b70f3a45c>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3f2425f5b5bbbdd991ca9cdfd5502e68d8895998/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
origin: maestro
test start time: 2026-09-18 14:35:51.280000+00:00

Builds:	   71 ✅    3 ❌    0 ⚠️
Boots: 	  109 ✅    7 ❌    0 ⚠️
Tests: 	33892 ✅ 1711 ❌ 5071 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aad6619d96a8203de67b3a3
      history:  > ✅  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_3d64000
      last run: https://d.kernelci.org/test/maestro:6aad80f5d96a8203de692063
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:6aad60bdd96a8203de67421c
      history:  > ❌  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6aad73a5d96a8203de68abb9
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f88
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f89
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f8a
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_0_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f87
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_0_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f8b
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_0_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f8c
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f9a
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f9b
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f9c
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f99
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f9d
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f9e
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f94
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f95
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f96
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f93
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f97
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f98
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f8e
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f8f
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f90
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f8d
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f91
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696f92
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_futex_requeue_pi_signal_restart
      last run: https://d.kernelci.org/test/maestro:6aad8698d96a8203de696fa0
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aad73a5d96a8203de68abbc
      history:  > ✅  > ❌  > ✅  > ❌  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
