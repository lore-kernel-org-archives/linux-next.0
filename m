Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E199C3BED27
	for <linux-next@vger.kernel.org>; Fri, 11 Sep 2026 02:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093833; cv=none; b=uPSB0FX4YSBNYylo1bkqyUFfATbwisXbZv0LKx8/eQDgpgtHtGaFYGEucVaa+o7lACEpA3H2oyu9QXy/uYrlc9v6Fm1H57zThRXOEGoEfo1OMg8HHBhbEsnLHFYXnW6tsjYvX7HRjgprZAKBJS1ZO+Mh9R9H7jDLWXKO1uBPT2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093833; c=relaxed/simple;
	bh=7VBFy/vMnQWkSl9eSSP7gPw5f1RNfKwsxxK4ft+O0c8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=FegwR8ppggn7EQ8DMa0qWkJAoQRrgO4Mibtd+/lwRU3lfsk0teEOhC/gGNp9Z8TLGId9tNpXQwo9Ol2y0SaOVALBwgThJt+zp4PegZzZX0QRyNWPUWMgrGX2m5T9a9I/XiZ/VFn7O6NIcIRMMSmANsCxSXVs0FF2Jg5RVFg2q1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=PrWSrRD9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="PrWSrRD9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2db710396ffso14157415ad.1
        for <linux-next@vger.kernel.org>; Thu, 10 Sep 2026 19:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1789093814; x=1789698614; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KOlSmLl8aqdiGkUf5tWbG4pShaQboHw3zj0oT2l6VPs=;
        b=PrWSrRD9WjaRB1hXd+NRA/XA7Xd7aDoqi8FrsNFi+4McMb1UTYtyWs1HQoLbY3GT9z
         othomSRbWjJP2c6dQXmjsjLnH005q+k0fvvkJbAEHESQ/jTq0eGsogBf1Je0cAcOd608
         eBWEcvLT2KGqlNpvIdlrywW/cGURZpjGD6Vicl/De7cryDYe5ZACaHGRk/+3RUp6VmIQ
         cGqRSgynoYhIzBQqGDURLHwFAcwH9uo7VUhoSNudfvTGYO473f3qopT9el1d8CSetWBh
         NV8uIrl0vxI4aftRzBSxIJQLnSMW2m7HDZuT+cLXM6bPn5neiwQVqVJ6kzDTPZmc8fyZ
         QeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789093814; x=1789698614;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOlSmLl8aqdiGkUf5tWbG4pShaQboHw3zj0oT2l6VPs=;
        b=TC0qeRTgwbMSxF6ot+W3j3+F1AKnqlyoD91hbzIfLazcq66Hf3hPteeDmOksvcpEQM
         k+fihRfoTlJb7rW8vPwsPU8Dk7kLZNTV+NGKXVBtcSoD0EcD1ZH2FVHOJK8sadQiO/fM
         FjGJxSnnqH4NijiqqkribqwPe/TM6ozqTAEo5qF7PnFc+7wYxSEk8Nz3jXztIRuW81JI
         56YXmy1ViVR62gKn9jKr+Y9uf4i6tMIMoTnS8ELseC6jbNsuhzY+uxfQtLGBYD0/lO0I
         RjbgYrKimvDKrS6+ETMMx1RJnp9+gi2LrNIkCgDey9KvY6HOI/sBnzejBnmjy1jArak/
         wutw==
X-Gm-Message-State: AFuF++l+jZfvSQ1Iy0bexUcUwMKSoVi/A7EhqTYyEfDH9GSocm84ZY7t
	7NPM8R6vYlVYllW8U1PhssJqhdLgqqPxTdZZDvWOfPEsF97mlibehzcCmdz2ywXb6cV1sM+anrO
	ui6QQ
X-Gm-Gg: AYBFou0yI7pgUltPmEiEDlpDaUiW3nek9x36QkNEvbrvE0qUVHuODJxNvTPcEym3Sos
	veY08WMtclwUoeVMpyOWtfcAlwJnVdLsX4w0K2TP4lERbudiact4zMJvBNxJQYM1CKZIFeeSFrm
	1ycPvwNK4NHCh91+Kt6p76U8Z+ZRmXw8B0orH5D7NlLopHaKoedZmsklfRtD4bylpqop3U/MJ50
	39hRm+krXwTS0ZmWKKOdgLlNfzDOTLIS+RxtWJpXDzvVqm8tgWGNZtALzgs//d0dhIciRKsuq3q
	P377ewZavo65FLQfNOWfbWxs21saPH+QwsP2lGKkiTLijaZH9bGy3dya9xjZEDRBx96hbDhKDCi
	nDtEgiqtW6SXK3N0q9CyGhpOhfH8j4S+aOeIKsieiuyhbbhK0NH7LtYcbhTq2KBrRvqSU0A+u9U
	cYQgbX9tGHzGrPKqlt1FY52zw1y6tXXABbPOt9Q629z2quf00Af7yEuRo1rmvqkSXynoA4RZQyu
	w==
X-Received: by 2002:a17:90a:d445:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-39d77962e7emr9134269a91.9.1789093812318;
        Thu, 10 Sep 2026 19:30:12 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm2046095eec.29.2026.09.10.19.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:30:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - f2bfbc3554ca6919484030729424b9dee2942d24
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 11 Sep 2026 02:30:11 -0000
Message-ID: <178909381058.4134.230204948713356562@41049dfc76e5>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/f2bfbc3554ca6919484030729424b9dee2942d24/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: f2bfbc3554ca6919484030729424b9dee2942d24
origin: maestro
test start time: 2026-09-10 17:09:18.113000+00:00

Builds:	   68 ✅    1 ❌    0 ⚠️
Boots: 	  138 ✅    3 ❌    0 ⚠️
Tests: 	31661 ✅ 2990 ❌ 3334 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6aa2fe2720239ade901e96b0
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaae
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaad
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaac
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaaf
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaab
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaaa
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901eba9c
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901eba9b
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901eba9a
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901eba9d
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901eba99
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901eba98
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaa2
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaa1
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaa0
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaa3
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901eba9f
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901eba9e
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaa8
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaa7
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaa6
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaa9
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaa5
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901ebaa4
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_futex_requeue_pi_signal_restart
      last run: https://d.kernelci.org/test/maestro:6aa304ce20239ade901eba96
      history:  > ✅  > ✅  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6aa3036820239ade901eb735
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6aa2fe3120239ade901e96e9
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba75
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba74
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba73
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba76
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba72
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba71
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba65
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba64
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba63
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba66
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba62
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba61
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba6b
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba6a
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba69
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba6c
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba68
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba67
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba6f
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba70
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba6e
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba6d
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_futex_requeue_pi_signal_restart
      last run: https://d.kernelci.org/test/maestro:6aa304b720239ade901eba5f
      history:  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6aa2fe2b20239ade901e96c7
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1254
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1253
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1252
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1255
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1251
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1250
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1242
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1241
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1240
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1243
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f123f
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f123e
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1248
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1247
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1246
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1249
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1245
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f1244
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f124e
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f124d
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f124c
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f124f
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f124b
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f124a
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_futex_requeue_pi_signal_restart
      last run: https://d.kernelci.org/test/maestro:6aa310cb20239ade901f123c
      history:  > ✅  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ftrace
      last run: https://d.kernelci.org/test/maestro:6aa30d4120239ade901f00b2
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6aa2fe0220239ade901e95a6
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e7d
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e7c
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e7b
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e7e
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e7a
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e79
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e6b
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e6a
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e69
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e6c
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e68
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e67
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e71
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e70
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e6f
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e72
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e6e
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e6d
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e77
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e76
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e75
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e78
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e74
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e73
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_futex_requeue_pi_signal_restart
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e65
      history:  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ftrace
      last run: https://d.kernelci.org/test/maestro:6aa30d4320239ade901f00cd
      history:  > ✅  > ✅  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6aa3055920239ade901ee450
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6aa2fe2f20239ade901e96e2
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeab5
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeab4
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaa7
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaa6
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaa5
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaa4
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaa3
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaac
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaab
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaaa
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaad
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaa9
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaa8
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeab2
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeab1
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeab0
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeab3
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaaf
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaae
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_futex_requeue_pi_signal_restart
      last run: https://d.kernelci.org/test/maestro:6aa3063720239ade901eeaa1
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: acer-cbv514-1h-34uz-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_change_process_account_mm_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb2d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_none_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb2f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_user_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb2e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_ex_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb37
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb39
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_length
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb38
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_has_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea51
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_no_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea52
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea8f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea92
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea8e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea8d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea90
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea91
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea77
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea7a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea76
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea75
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea78
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea79
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea9b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea9e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea9a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea99
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea9c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea9d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea89
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea8c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea88
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea87
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea8a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea8b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea95
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea98
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea94
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea93
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea96
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea97
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea83
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea86
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea82
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea81
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea84
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea85
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaa1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaa4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaa0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea9f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaa2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaa3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_global_options
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb36
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_info_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb32
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb02
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb01
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb00
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaff
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb0f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb0a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb06
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb08
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb05
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaf9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deafe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deafd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb0b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb0e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deafa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb0c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb0d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb11
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb10
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deafb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deafc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb04
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deada
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dead9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dead8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dead7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deae7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deae2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deade
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deae0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deadd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dead1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dead6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dead5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deae3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deae6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dead2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deae4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deae5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb3c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deae8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dead3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dead4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deadc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deadf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deae1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb07
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb09
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb1d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb1c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb1b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb1a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb2a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb25
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb21
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb23
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb20
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb14
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb19
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb18
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb26
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb29
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb15
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb27
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb28
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb2c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb2b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb16
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb17
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb1f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb22
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb24
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb48
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb47
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb46
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb45
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaf4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaef
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaeb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaed
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaea
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb3f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb44
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb43
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaf0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaf3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb40
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaf1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaf2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaf6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaf5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb41
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb42
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deae9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaec
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaee
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_map_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb33
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deacc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deacb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deac8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deace
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deab0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaaf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaac
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deab2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaa9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaa8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaa5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaab
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaa6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaaa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaa7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaad
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deab1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaae
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaba
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deabb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deabf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deabc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deac9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deacd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deaca
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deac5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deac4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deac1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deac7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deab3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deab4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deab8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deab5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deac2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deac6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deac3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_set_iommu_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb31
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb3a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_ioctls
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb35
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_unmap_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb34
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_vfio_ioas
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901deb30
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_hw_queue
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea54
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea56
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_cache
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea55
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_tombstone
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea53
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_nested_iopf
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea58
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea57
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea5a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea59
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea5e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea62
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea61
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea65
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_map
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea64
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea66
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea68
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea6c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_map
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea6b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea6d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ed8e20239ade901dea6e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_change_process_account_mm_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df46e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_none_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df470
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_user_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df46f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_ex_fail
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df478
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_fail
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df47a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_length
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df479
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_has_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df387
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_no_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df388
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3c3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3c7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3c2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3c1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3c4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3c5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3ab
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3ae
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3aa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3a9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3ac
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3ad
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3d0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3d3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3cf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3ce
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3d1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3d2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3bd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3c0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3bc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3bb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3be
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3bf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3ca
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3cd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3c9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3c8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3cb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3cc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3b7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3ba
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3b6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3b5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3b8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3b9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3d6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3d9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3d5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3d4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3d7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3d8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_global_options
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df477
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_info_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df473
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df443
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df442
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df441
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df440
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df450
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df44b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df447
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df449
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df446
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df43a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df43f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df43e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df44c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df44f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df43b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df44d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df44e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df452
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df451
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df43c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df43d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df445
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df47d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df40e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df40d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df40c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df41a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df415
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df411
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df413
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df410
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df406
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df40b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df40a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df416
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df419
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df407
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df417
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df418
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df41c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df41b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df408
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df409
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df40f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df412
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df414
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df448
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df44a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df45e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df45d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df45c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df45b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df46b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df466
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df462
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df464
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df461
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df455
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df45a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df459
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df467
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df46a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df456
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df468
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df469
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df46d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df46c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df457
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df458
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df460
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df463
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df465
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df428
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df427
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df426
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df425
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df435
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df430
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df42c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df42e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df42b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df41f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df424
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df423
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df431
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df434
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df420
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df432
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df433
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df437
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df436
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df421
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df422
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df42a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df42d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df42f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_map_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df474
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df401
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df400
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3fd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df403
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3e5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3e4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3e1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3e7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3de
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3dd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3da
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3e0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3db
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3df
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3dc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3e2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3e6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3e3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3ef
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3f0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3f4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3f1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3fe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df402
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3ff
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3fa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3f9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3f6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3fc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3e8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3e9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3ed
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3ea
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3f7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3fb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3f8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_set_iommu_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df472
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df47b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_ioctls
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df476
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_unmap_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df475
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_vfio_ioas
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df471
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_hw_queue
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df38a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df38c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_cache
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df38b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_tombstone
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df389
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_nested_iopf
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df38e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df38d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df390
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df38f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df394
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df398
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df397
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df39b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_map
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df39a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df39c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df39d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3a0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_map
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df39f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3a1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2edb920239ade901df3a2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_change_process_account_mm_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2e3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_none_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2e7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_user_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2e5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_ex_fail
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2f7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_fail
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2fc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_length
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2fa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_has_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df15e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_no_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df15f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df19a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df19d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df199
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df198
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df19b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df19c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df182
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df185
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df181
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df180
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df183
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df184
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1a6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1a9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1a5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1a4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1a7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1a8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df194
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df197
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df193
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df192
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df195
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df196
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1a0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1a3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df19f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df19e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1a1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1a2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df18e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df191
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df18d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df18c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df18f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df190
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1af
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1b5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1ad
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1ab
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1b1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1b3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_global_options
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2f5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_info_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2ed
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df28d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df28b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df289
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df287
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2a7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df29d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df295
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df299
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df293
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df27b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df285
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df283
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df29f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2a5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df27d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2a1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2a3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2ab
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2a9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df27f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df281
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df291
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df221
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df21f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df21d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df21b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df23b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df231
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df229
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df22d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df227
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df20f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df219
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df217
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df233
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df239
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df211
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df235
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df237
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df23f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df23d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df213
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df215
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df225
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df22b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df22f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df297
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df29b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2c3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2c1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2bf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2bd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2dd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2d3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2cb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2cf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2c9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2b1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2bb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2b9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2d5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2db
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2b3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2d7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2d9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2e1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2df
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2b5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2b7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2c7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2cd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2d1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df257
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df255
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df253
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df251
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df271
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df267
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df25f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df263
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df25d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df245
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df24f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df24d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df269
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df26f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df247
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df26b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df26d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df275
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df273
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df249
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df24b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df25b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df261
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df265
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_map_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2ef
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df205
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df203
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1fd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df209
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1cd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1cb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1c5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1d1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1bf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1bd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1b7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1c3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1b9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1c1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1bb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1c7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1cf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1c9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1e1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1e3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1eb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1e5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1ff
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df207
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df201
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1f7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1f5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1ef
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1fb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1d3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1d5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1dd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1d7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1f1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1f9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df1f3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_set_iommu_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2eb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2fe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_ioctls
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2f3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_unmap_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2f1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_vfio_ioas
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df2e9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_hw_queue
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df161
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df163
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_cache
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df162
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_tombstone
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df160
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_nested_iopf
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df165
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df164
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df167
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df166
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df16b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df16f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df16e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df172
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_map
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df171
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df173
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df174
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df177
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_map
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df176
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df178
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2edb720239ade901df179
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_change_process_account_mm_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe67
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_none_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe69
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_user_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe68
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_ex_fail
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe71
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_fail
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe73
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_length
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe72
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_has_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd80
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_no_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd81
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdbd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdc0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdbc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdbb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdbe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdbf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfda5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfda8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfda4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfda3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfda6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfda7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdc9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdcc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdc8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdc7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdca
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdcb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdb7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdba
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdb6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdb5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdb8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdb9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdc3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdc6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdc2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdc1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdc4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdc5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdb1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdb4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdb0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdaf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdb2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdb3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdcf
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdd2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdce
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdcd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdd0
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdd1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_global_options
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe70
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_info_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe6c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe39
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe37
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe35
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe33
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe49
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe44
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe40
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe42
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe3e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe2b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe31
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe2f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe45
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe48
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe2c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe46
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe47
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe4b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe4a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe2d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe2e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe3d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdfe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdfd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdfc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdfb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe0b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe06
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe02
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe04
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe01
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdf5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdfa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdf9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe07
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe0a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdf6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe08
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe09
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe0d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe0c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdf7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdf8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe00
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe03
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe05
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe41
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe43
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe57
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe56
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe55
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe54
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe64
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe5f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe5b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe5d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe5a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe4e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe53
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe52
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe60
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe63
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe4f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe61
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe62
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe66
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe65
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe50
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe51
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe59
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe5c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe5e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe19
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe18
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe17
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe16
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe26
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe21
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe1d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe1f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe1c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe10
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe15
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe14
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe22
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe25
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe11
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe23
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe24
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe28
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe27
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe12
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe13
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe1b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe1e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe20
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_map_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe6d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdf0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdef
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdec
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdf2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdde
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfddd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdda
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfde0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdd7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdd6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdd3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdd9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdd4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdd8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfdd5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfddb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfddf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfddc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe7d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe7e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfde3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe7f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfded
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdf1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdee
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfde9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfde8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfde5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_basic
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdeb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe76
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe77
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe7b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe78
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfde6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfdea
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfde7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_set_iommu_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe6b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe74
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_ioctls
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe6f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_unmap_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe6e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_vfio_ioas
      last run: https://d.kernelci.org/test/maestro:6aa2edea20239ade901dfe6a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_hw_queue
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd83
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd85
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_cache
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd84
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_tombstone
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd82
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_nested_iopf
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd87
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd86
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd89
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd88
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd8d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd92
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd91
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd95
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_map
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd94
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd96
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd97
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd9a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_map
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd99
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd9b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ede920239ade901dfd9c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-R721T-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_change_process_account_mm_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e140b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_none_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e140d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_user_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e140c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_ex_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e141b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e141d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_length
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e141c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_has_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e133d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_no_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e133e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1363
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1366
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1362
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1361
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1364
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1365
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e134b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e134e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e134a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1349
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e134c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e134d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e136f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1372
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e136e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e136d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1370
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1371
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e135d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1360
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e135c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e135b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e135e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e135f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1369
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e136c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1368
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1367
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e136a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e136b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1357
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e135a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1356
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1355
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1358
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1359
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1375
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1378
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1374
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1373
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1376
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1377
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_global_options
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e141a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_info_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1416
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13e0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13df
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13de
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13dd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13ed
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13e8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13e4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13e6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13e3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13d7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13dc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13db
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13e9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13ec
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13d8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13ea
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13eb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13ef
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13ee
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13d9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13da
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13e2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13a8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13a7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13a6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13a5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13b5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13b0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13ac
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13ae
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13ab
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e139f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13a4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13a3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13b1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13b4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13a0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13b2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13b3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13b7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13b6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13a1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13a2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13aa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13ad
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e13af
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13e5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13e7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13fb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13fa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13f9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13f8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1408
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1403
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13ff
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1401
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13fe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13f2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13f7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13f6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1404
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1407
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13f3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1405
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1406
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e140a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1409
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13f4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13f5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13fd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1400
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1402
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13c3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13c2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13c1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13c0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13d0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13cb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13c7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13c9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13c6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13ba
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13bf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13be
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13cc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13cf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13bb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13cd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13ce
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13d4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13d2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13bc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13bd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13c5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13c8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e13ca
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_map_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1417
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e139a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1399
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1396
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e139c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1384
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1383
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1380
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1386
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e137d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e137c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1379
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e137f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e137a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e137e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e137b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1381
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1385
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1382
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e138e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e138f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1393
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1390
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1397
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e139b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1398
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1413
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1412
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1395
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1415
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1387
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1388
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e138c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1389
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1410
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1414
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1411
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_set_iommu_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e140f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e141e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_ioctls
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1419
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_unmap_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1418
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_vfio_ioas
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e140e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_hw_queue
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1421
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1423
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_cache
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1422
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_tombstone
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1420
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_nested_iopf
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1425
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1424
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1427
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1426
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e142b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e142f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e142e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1432
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_map
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1431
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1433
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ee3220239ade901e1434
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1340
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_map
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e133f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1341
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ee3120239ade901e1342
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_change_process_account_mm_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b23
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_none_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b25
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_user_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b24
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_ex_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b2d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b38
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_length
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b2e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_has_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a43
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_no_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a44
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a7f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a82
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a7e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a7d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a80
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a81
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a67
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a6a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a66
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a65
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a68
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a69
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a8b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a8e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a8a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a89
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a8c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a8d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a79
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a7c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a78
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a77
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a7a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a7b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a85
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a88
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a84
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a83
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a86
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a87
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a73
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a76
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a72
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a71
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a74
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a75
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a91
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a94
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a90
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a8f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a92
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a93
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_global_options
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b2c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_info_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b28
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0af8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0af7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0af6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0af5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b05
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b00
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0afc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0afe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0afb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aef
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0af4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0af3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b01
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b04
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0af0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b02
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b03
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b07
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b06
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0af1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0af2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0afa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aca
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ac9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ac8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ac7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b31
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ad2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ace
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ad0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0acd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ac1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ac6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ac5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ad3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b30
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ac2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ad4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b2f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b33
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b32
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ac3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ac4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0acc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0acf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ad1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0afd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aff
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b13
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b12
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b11
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b10
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b20
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b1b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b17
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b19
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b16
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b0a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b0f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b0e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b1c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b1f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b0b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b1d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b1e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b22
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b21
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b0c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b0d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b15
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b18
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b1a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0add
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0adc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0adb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ada
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aea
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ae5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ae1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ae3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ae0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b36
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ad9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ad8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ae6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ae9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b37
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ae7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ae8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aec
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aeb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ad6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ad7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0adf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ae2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ae4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_map_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b29
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0abc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0abb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ab8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0abe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aa0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a9f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a9c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aa2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a99
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a98
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a95
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a9b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a96
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a9a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a97
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a9d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aa1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a9e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aaa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aab
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aaf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aac
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ab9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0abd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aba
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ab5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ab4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ab1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ab7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aa3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aa4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aa8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0aa5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ab2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ab6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0ab3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_set_iommu_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b27
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b39
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_ioctls
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b2b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_unmap_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b2a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_vfio_ioas
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0b26
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_hw_queue
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a46
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a48
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_cache
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a47
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_tombstone
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a45
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_nested_iopf
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a4a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a49
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a4c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a4b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a50
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a54
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a53
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a57
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_map
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a56
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a58
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a59
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a5c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_map
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a5b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a5d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ee2320239ade901e0a5e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_change_process_account_mm_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded60
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_none_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded62
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_user_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded61
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_ex_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded6a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded6c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_length
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded6b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_has_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec74
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_no_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec75
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decb0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decb3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decaf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decae
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decb1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decb2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec98
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec9b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec97
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec96
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec99
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec9a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decbc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decbf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decbb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decba
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decbd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decbe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decaa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decad
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deca9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deca8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decab
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decac
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decb6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decb9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decb5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decb4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decb7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decb8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deca4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deca7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deca3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deca2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deca5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deca6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decc2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decc5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decc1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decc0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decc3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decc4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_global_options
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded69
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_info_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded65
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded35
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded34
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded33
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded32
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded42
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded3d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded39
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded3b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded38
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded2c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded31
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded30
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded3e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded41
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded2d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded3f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded40
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded44
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded43
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded2e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded2f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded37
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decff
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decfe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decfd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decfc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded0c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded07
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded03
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded05
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded02
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decf6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decfb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decfa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded08
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded0b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decf7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded09
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded0a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded0e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded0d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decf8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decf9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded01
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded04
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded06
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded3a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded3c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded50
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded4f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded4e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded4d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded5d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded58
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded54
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded56
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded53
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded47
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded4c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded4b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded59
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded5c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded48
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded5a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded5b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded5f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded5e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded49
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded4a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded52
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded55
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded57
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded1a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded19
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded18
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded17
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded27
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded22
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded1e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded20
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded1d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded11
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded16
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded15
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded23
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded26
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded12
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded24
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded25
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded29
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded28
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded13
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded14
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded1c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded1f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded21
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_map_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded66
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decf1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decf0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deced
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decf3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decd1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decd0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deccd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decd4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decca
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decc9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decc6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deccc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decc7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deccb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decc8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decce
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decd2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deccf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decdf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dece0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dece4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dece1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decee
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decf2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decef
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decea
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dece9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dece6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decec
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decd6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decd8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decdd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901decda
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dece7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901deceb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dece8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_set_iommu_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded64
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded6d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_ioctls
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded68
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_unmap_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded67
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_vfio_ioas
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901ded63
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_hw_queue
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec77
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec79
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_cache
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec78
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_tombstone
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec76
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_nested_iopf
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec7b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec7a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec7d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec7c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec81
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec85
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec84
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec88
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_map
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec87
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec89
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec8a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec8d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_map
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec8c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec8e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ed9620239ade901dec8f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_change_process_account_mm_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0737
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_none_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0739
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_user_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0738
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_ex_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0741
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0743
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_length
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0742
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_has_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e066b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_no_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e066c
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e069d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06a0
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e069c
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e069b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e069e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e069f
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0686
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0689
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0685
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0684
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0687
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0688
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06a9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06ac
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06a8
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06a7
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06aa
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06ab
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0697
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e069a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0696
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0695
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0698
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0699
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06a3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06a6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06a2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06a1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06a4
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06a5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0691
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0694
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0690
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e068f
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0692
      history:  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0693
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06af
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06b2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06ae
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06ad
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06b0
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06b1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_global_options
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0740
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_info_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e073c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e071d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e071c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e071b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e071a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e074d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0748
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0721
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0723
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0720
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0714
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0719
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0718
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0749
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e074c
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0715
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e074a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e074b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e074f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e074e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0716
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0717
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e071f
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06e7
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06e6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06e5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06e4
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06f4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06ef
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06eb
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06ed
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06ea
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06df
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0746
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06e3
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06f0
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06f3
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06e0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06f1
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06f2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06f6
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06f5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06e1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06e2
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06e9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06ec
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06ee
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0722
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0747
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0727
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0726
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0725
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0724
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0734
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e072f
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e072b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e072d
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e072a
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0752
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0757
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0756
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0730
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0733
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0753
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0731
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0732
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0736
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0735
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0754
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0755
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0729
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e072c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e072e
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0702
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0701
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0700
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06ff
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e070f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e070a
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0706
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0708
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0705
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06f9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06fe
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06fd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e070b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e070e
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06fa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e070c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e070d
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0711
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0710
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06fb
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06fc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0704
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0707
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0709
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_map_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e073d
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06da
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06d9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06d6
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06dc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06be
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06bd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06ba
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06c0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06b7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06b6
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06b3
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06b9
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06b4
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06b8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06b5
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06bb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06bf
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06bc
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06c8
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06c9
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06cd
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06ca
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06d7
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06db
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06d8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06d3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06d2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06cf
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06d5
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06c1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06c2
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06c6
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06c3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06d0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06d4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e06d1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_set_iommu_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e073b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0744
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_ioctls
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e073f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_unmap_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e073e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_vfio_ioas
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e073a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_hw_queue
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e066e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0670
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_cache
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e066f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_tombstone
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e066d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_nested_iopf
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0672
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0671
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0674
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0673
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e0678
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e067c
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e067b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0758
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_map
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e067e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e0759
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e075a
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e075d
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_map
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e075c
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e075e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ee1720239ade901e075f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_change_process_account_mm_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e182f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_none_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1831
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_user_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1830
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_ex_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1839
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e183b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_length
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e183a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_has_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1747
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_no_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1748
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17dc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17df
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17db
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17da
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17dd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17de
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e176b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e176e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e176a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1769
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e176c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e176d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17e8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17eb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17e7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17e6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17e9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17ea
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17d6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17d9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17d5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e177b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17d7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17d8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17e2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17e5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17e1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17e0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17e3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17e4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1777
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e177a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1776
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1775
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1778
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1779
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e177c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e177f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17ed
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17ec
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e177d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e177e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_global_options
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1838
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_info_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1834
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1804
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1803
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1802
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1801
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1811
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e180c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1808
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e180a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1807
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17fb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1800
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17ff
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e180d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1810
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17fc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e180e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e180f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1813
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1812
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17fd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17fe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1806
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17b5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17b4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17b3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17b2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17c2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17bd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17b9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17bb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17b8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17ac
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17b1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17b0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17be
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17c1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17ad
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17bf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17c0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17c4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17c3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17ae
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17af
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17b7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17ba
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17bc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1809
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e180b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e181f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e181e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e181d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e181c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e182c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1827
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1823
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1825
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1822
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1816
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e181b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e181a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1828
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e182b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1817
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1829
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e182a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e182e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e182d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1818
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1819
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1821
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1824
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1826
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17d0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17cf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17ce
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17cd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17f6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17f1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17d4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17ef
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17d3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17c7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17cc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17cb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17f2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17f5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17c8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17f3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17f4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17f8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17f7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17c9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17ca
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17d2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17ee
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17f0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_map_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1835
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17a7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17a6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17a3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17a9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e178b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e178a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1787
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e178d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1784
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1783
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1780
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1786
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1781
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1785
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1782
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1788
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e178c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1789
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1795
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1796
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e179a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1797
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17a4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17a8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17a5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17a0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e179f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e179c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17a2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e178e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e178f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1793
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1790
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e179d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e17a1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e179e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_set_iommu_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1833
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e183c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_ioctls
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1837
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_unmap_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1836
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_vfio_ioas
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1832
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_hw_queue
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e174a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e174c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_cache
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e174b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_tombstone
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1749
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_nested_iopf
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e174e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e174d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1750
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e174f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1754
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1758
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1757
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e175b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_map
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e175a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e175c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e175d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1760
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_map
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e175f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1761
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ee3e20239ade901e1762
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6aa3065020239ade901eebfc
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6aa3065020239ade901eebb7
      history:  > ❌  > ✅  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_change_process_account_mm_basic
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3af5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_none_basic
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3af9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_user_basic
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3af7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_ex_fail
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3b09
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_fail
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ae3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_length
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ae1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_has_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3913
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_no_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3915
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3988
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e398e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3986
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3984
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e398a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e398c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3956
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e395c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3954
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3952
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3958
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e395a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39a0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39a6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e399e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e399c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39a2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39a4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e397c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3982
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e397a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3978
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e397e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3980
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3994
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e399a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3992
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3990
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3996
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3998
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e396e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3976
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e396c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e396a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3971
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3974
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39ac
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39b2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39aa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39a8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39ae
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39b0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_global_options
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3b07
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_info_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3aff
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a91
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a8f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a8d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a8b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3aab
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3aa1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a99
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a9d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a97
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a7f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a89
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a87
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3aa3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3aa9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a81
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3aa5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3aa7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3aaf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3aad
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a83
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a85
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a95
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a1f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a1c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a1a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a18
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a3f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a35
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a2b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a31
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a28
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a0c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a16
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a14
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a37
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a3d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a0e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a39
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a3b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a43
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a41
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a10
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a12
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a25
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a2e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a33
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a9b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a9f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ac7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ac5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ac3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ac1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3aef
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ad7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3acf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ad3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3acd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ab5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3abf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3abd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ad9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3adf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ab7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3adb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3add
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3af3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3af1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ab9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3abb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3acb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ad1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ad5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a5b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a59
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a57
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a55
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a75
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a6b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a63
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a67
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a61
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a49
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a53
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a51
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a6d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a73
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a4b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a6f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a71
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a79
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a77
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a4d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a4f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a5f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a65
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a69
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_map_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3b01
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a02
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a00
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39fa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_basic
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a06
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39ca
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39c8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39c2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_basic
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39ce
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39bc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39ba
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39b4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_basic
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39c0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39b6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39be
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39b8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_replace
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39c4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39cc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39c6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39de
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39e0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39e8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39e2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_replace
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39fc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3a04
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39fe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39f4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39f2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39ec
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_basic
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39f8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39d0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39d2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39da
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39d4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_replace
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39ee
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39f6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e39f0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_set_iommu_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3afd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3ae5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_ioctls
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3b05
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_unmap_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3b03
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_vfio_ioas
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3afb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_hw_queue
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3919
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e391d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_cache
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e391b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_tombstone
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3917
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_nested_iopf
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3921
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e391f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3925
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3923
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3aeb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e392f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e392d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3936
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_map
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3934
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3938
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e393a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3940
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_map
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e393e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3942
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2eea320239ade901e3944
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6aa313a420239ade901f5e58
      history:  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_change_process_account_mm_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbe3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_none_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbe5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_change_process_account_user_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbe4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_ex_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc0a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_fail
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc0c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_cmd_length
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc0b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_has_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc15
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_device_pasid_no_pasid_pasid_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb19
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb54
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb57
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb53
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb52
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb55
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb56
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb3c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb3f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb3b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb3a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb3d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty128M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb3e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb60
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb63
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb5f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb5e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb61
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty16k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb62
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb4e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb51
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb4d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb4c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb4f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty320k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb50
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb5a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb5d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb59
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb58
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb5b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb5c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb48
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb4b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb47
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb46
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb49
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty64M_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb4a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_device_dirty_capability
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb66
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_enforce_dirty
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb68
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb65
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_get_dirty_bitmap_no_clear
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb64
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_pasid_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb67
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_dirty_tracking_domain_dirty8k_set_dirty_tracking
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbe9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_global_options
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc09
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_info_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbe8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbb8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbb7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbb6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbb5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbc5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbc0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbbc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbbe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbbb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbaf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbb4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbb3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbc1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbc4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbb0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbc2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbc3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbc7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbc6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbb1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbb2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbba
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbee
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbed
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbec
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbeb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbfb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbf6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbf2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbf4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbf1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb95
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbea
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb99
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbf7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbfa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb96
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbf8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbf9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbfd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbfc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb97
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb98
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbf0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbf3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_limit_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbf5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbbd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbbf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbd3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbd2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbd1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbd0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbe0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbdb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbd7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbd9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbd6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbca
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbcf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbce
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbdc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbdf
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbcb
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbdd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbde
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbe2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbe1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbcc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbcd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbd5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbd8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_no_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbda
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb9d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_pin_unmap
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb9c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb9b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_access_rw_unaligned
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb9a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_alloc_hwpt_nested
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbaa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfba5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_allowed
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfba1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_area_auto_iova
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfba3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_area
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfba0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_copy_sweep
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc00
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_gone
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc05
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_fork_present
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc04
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_get_hw_info
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfba6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_hwpt_attach
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfba9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_align_change
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc01
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfba7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_area_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfba8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbac
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbab
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_iova_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc02
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_ioas_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc03
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_iova_ranges
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb9f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_reserved_overflow
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfba2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_ioas_two_mock_domain_unmap_fully_contained_areas
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfba4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_map_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc06
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb90
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb8f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb8c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb92
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb74
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb73
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb70
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb76
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb6d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb6c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb69
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb6f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb6a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb6e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb6b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb71
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb75
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_file_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb72
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb7e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb7f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb83
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb80
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb8d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb91
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_one_domain_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb8e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb89
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_all_aligns_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb88
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb85
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_basic
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb8b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_alloc_hwpt
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb77
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb78
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb7c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_hugepage_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb79
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_replace
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb86
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_ro_unshare
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb8a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_mock_domain_two_domains_user_copy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb87
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_set_iommu_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbe7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc0d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_simple_ioctls
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc08
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_unmap_cmd
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfc07
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_vfio_ioas
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfbe6
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_hw_queue
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb1b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb1d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_cache
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb1c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_vdevice_tombstone
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb1a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_nested_iopf
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb1f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb1e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb21
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb20
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_vdevice_alloc
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb25
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_auto_destroy
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb29
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_no_viommu_viommu_negative_tests
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb28
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb2c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_map
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb2b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb2d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v0_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb2e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_get_info
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb31
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_map
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb30
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_option_huge_pages
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb32
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.iommu.iommu_iommufd_vfio_compat_mock_domain_Ver1v2_simple_close
      last run: https://d.kernelci.org/test/maestro:6aa2ede120239ade901dfb33
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_firmware_coreboot
      last run: https://d.kernelci.org/test/maestro:6aa2ee7520239ade901e1b01
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_firmware_coreboot
      last run: https://d.kernelci.org/test/maestro:6aa2ee8320239ade901e1ce4
      history:  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-cbv514-1h-34uz-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa2edaa20239ade901def2d
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa2ede320239ade901dfc1b
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa2ede320239ade901dfc96
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa2edf120239ade901e01cb
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: acer-R721T-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa2ee0420239ade901e03fd
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa2eed220239ade901e5683
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa2ed8020239ade901de93d
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa2edec20239ade901e0148
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa309ca20239ade901ef5db
      history:  > ⚠️  > ⚠️  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio.gpio_gpio-aggregator_sh
      last run: https://d.kernelci.org/test/maestro:6aa3166220239ade901f63f4
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.gpio.gpio_gpio-cdev-uaf_sh
      last run: https://d.kernelci.org/test/maestro:6aa3166220239ade901f63f3
      history:  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.gpio.gpio_gpio-sim_sh
      last run: https://d.kernelci.org/test/maestro:6aa3166220239ade901f63f5
      history:  > ⚠️  > ⚠️  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa2ee1620239ade901e061d
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6aa30d3320239ade901f0064
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa30d0820239ade901eff24
      history:  > ⚠️  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa2edc120239ade901df7a9
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa31d3920239ade901f69e5
      history:  > ⚠️  > ⚠️  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ftrace.ftrace_ftracetest-ktap
      last run: https://d.kernelci.org/test/maestro:6aa33fac20239ade902040b7
      history:  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.gpio.gpio_gpio-aggregator_sh
      last run: https://d.kernelci.org/test/maestro:6aa3414120239ade90204824
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.gpio.gpio_gpio-cdev-uaf_sh
      last run: https://d.kernelci.org/test/maestro:6aa3414120239ade90204823
      history:  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.gpio.gpio_gpio-sim_sh
      last run: https://d.kernelci.org/test/maestro:6aa3414120239ade90204825
      history:  > ⚠️  > ⚠️  > ✅  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6aa3036320239ade901eb732
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa31eb020239ade901f6b37
      history:  > ⚠️  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ftrace.ftrace_ftracetest-ktap
      last run: https://d.kernelci.org/test/maestro:6aa33b6520239ade901ff7b1
      history:  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.gpio.gpio_gpio-aggregator_sh
      last run: https://d.kernelci.org/test/maestro:6aa33c8320239ade901ffd56
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.gpio.gpio_gpio-cdev-uaf_sh
      last run: https://d.kernelci.org/test/maestro:6aa33c8320239ade901ffd55
      history:  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.gpio.gpio_gpio-sim_sh
      last run: https://d.kernelci.org/test/maestro:6aa33c8320239ade901ffd57
      history:  > ⚠️  > ⚠️  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa30beb20239ade901efc33
      history:  > ⚠️  > ⚠️  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio.gpio_gpio-aggregator_sh
      last run: https://d.kernelci.org/test/maestro:6aa31d9520239ade901f6a19
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.gpio.gpio_gpio-cdev-uaf_sh
      last run: https://d.kernelci.org/test/maestro:6aa31d9520239ade901f6a18
      history:  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.gpio.gpio_gpio-sim_sh
      last run: https://d.kernelci.org/test/maestro:6aa31d9520239ade901f6a1a
      history:  > ⚠️  > ⚠️  > ✅  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa2eeb120239ade901e4dd8
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6aa2eefb20239ade901e5ca6
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6aa2ef6f20239ade901e6027
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
