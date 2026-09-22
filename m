Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9723911DC
	for <linux-next@vger.kernel.org>; Tue, 22 Sep 2026 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044214; cv=none; b=it2ZopxBHj+rWseDOzx5V8BLDzT/Ubh9/QfE3brQg3cUOHSBjFQMpTsShKInR34QtwL6ecaTpoeDY0ytyaM0NDEAumcpT1u52+0LOj+f4j69Yfd6JuJCJSenR/372oCGma2pIgRUyh99e/DvI7jIN8BR/QezV9DhUu5yK6+Fc1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044214; c=relaxed/simple;
	bh=gyke6xwINQIHEg/XPNPvQPzhI0dv7SQPLty9H/rqjh0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=pSFwa6nJOqs9aTxJfA0YipxFXxRO4MTyTnYFBFLZQ9YULfFdSqB+TMeOvk1ysKqqGGQnDMmNDX5dVh/3CUN2YfI2Cjje7VTLbH65zA8c8jo5RVZ2MlxzKmgSUMHqvPmCZVU9robN0Gls1fLkNYBdcUpafWB8fDcFEbLhgrySGSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=JGn6cYTX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="JGn6cYTX"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed1368so43181095ad.1
        for <linux-next@vger.kernel.org>; Mon, 21 Sep 2026 19:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790044211; x=1790649011; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5i1iLn5zXy34fexgJCkE8EpVJ2YaTM3DOWG4yeB3fvE=;
        b=JGn6cYTXqyDPyW7T7tBmgY5vmyxQTtuekBn1oqH1teWtwAC6nKTTTvWtC5PFDp9Xif
         UkNvak7at9W+Y6eEWFMVLEHW9zTv95MhUXrW3KCOUoKzJZuJPbDB7ft/Ejh4iuEdvsEF
         oJCu4uXV7XmsUIJ1XMWIKEcQYhc+QDUNw8Rqjt11nD5j+JzLnXOKfFsnxD4DesWCr8gC
         Q9fFwRZV75Qm1Pg3GQ8h8I4goL+20nasQfEHvbWnVBPWbsOsdsbrUzFEIdFznRrcIHUx
         wdLvpKdwgr+mDDUmRhjCm3jcK0cpNE9hu2kezo5OgYB/W0YIzVwrsD7tQCcwjJFKAsMF
         ggsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044211; x=1790649011;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i1iLn5zXy34fexgJCkE8EpVJ2YaTM3DOWG4yeB3fvE=;
        b=Hu0nMGiuaDGfa+b9MD5wulIi32JTRT4IIHuTTNTpnuhQ4nKCfkt2e5dvkehfG/T6fw
         Izl6O9c9j6bCxdrqibPp4cR0TMiqT1NA5IPJxWhwwJcCfCb6XlVv6etyHvQz4SQhjgar
         ftRgyBiRSQCb4OcYXJbTjy764UCs6qT4efZBUy1GLC3/c3lx6r5oN3QVQJBQ5wLDtxb/
         FHodSOCOAIa0CkLx9bTM7fg4QsS8ZCMd3NbPtKRYS+Alj1ZW3RXfJYYOoYQwV5IGVhoe
         S1sieLuIaDkItDCKGxU7xYYbkJffZsUiRhM9QbOuEwh3vLbPPUanP1i0xbefd5SBFsvI
         xkNQ==
X-Gm-Message-State: AFuF++kUPOBDHPHbqjmzs8YPC8cqIbprc1AXpDmbo1WamKeQvH+KcZE4
	YHJ7Ai+NNPeGY/TowtGubxcfM5Up0AY4CeO8iHwZ3anrdIhy1SJhDO07dy8AzjwhS1U=
X-Gm-Gg: AYBFou0tl+4hfHf4pBy+VeRFcrjHASS5yJWbkJaFqgTrc9w8/vvpu1LtqO9UjDqglwZ
	IznHDreICR29edlPy/UKY48NJKZs736SUbtozKtP3ADcui0isLxG969d32GgEWau2z3gsbKXerb
	tnjqgVJA+OKryFoZOoVG0zO7tRJZy44jlsYFRpBHAUJPylQshCenTTJBhLxJxc6lEEIsEomqkCH
	HWhT1PmEDgi0UyV3gE4tPOkwAbmq/K9sB5MZqszzilschhibuZD0hMcKyGkYsZcn5+uXI2hfUjn
	UnM/2AZ4J5ye/a5qygiYuwFIiEO5FVIS7xyIwJPPqqPhzMnuxqnBvdlG8a4Hkkwo85GVcaDdvvE
	s0zfmXHWngEe2Uglx0h5wObwpI3XzJdNVNX7tSkAnX+FQpEz26T1UGgQBLe6/49jue4gfWHqR8b
	49l/YNb+wS+yH0pXBfHSkiSYFAWJ+L0CyQNEOnXtzACywkWTOx1oIz4EbM3qA/elw=
X-Received: by 2002:a17:902:7607:b0:2dd:c100:b2c8 with SMTP id d9443c01a7336-2df5b3951cdmr7865305ad.51.1790044211208;
        Mon, 21 Sep 2026 19:30:11 -0700 (PDT)
Received: from ec7b70f3a45c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e613014aasm1076703eec.22.2026.09.21.19.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:30:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 5c4d4169604b335c38bbc79bc1fc03042981fc6f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 22 Sep 2026 02:30:10 -0000
Message-ID: <179004420954.383593.12258090951389986171@ec7b70f3a45c>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/5c4d4169604b335c38bbc79bc1fc03042981fc6f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
origin: maestro
test start time: 2026-09-21 14:45:10.617000+00:00

Builds:	   65 ✅    3 ❌    0 ⚠️
Boots: 	   29 ✅    4 ❌    0 ⚠️
Tests: 	25977 ✅ 1013 ❌  712 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6ab18025d96a8203de7b7fb2
      history:  > ✅  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6ab19001d96a8203de7c0766
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6ab15076d96a8203de7973d2
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42d8
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42d9
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42da
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_0_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42d7
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_0_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42db
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_0_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42dc
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42ea
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42eb
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42ed
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42e9
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42ee
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42ef
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42e4
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42e5
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42e6
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42e3
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42e7
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42e8
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42de
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42df
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42e0
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42dd
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42e1
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42e2
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_futex_requeue_pi_signal_restart
      last run: https://d.kernelci.org/test/maestro:6ab16180d96a8203de7a42f1
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ab18025d96a8203de7b7fac
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ab15077d96a8203de7973d5
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
