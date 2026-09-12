Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3636C30ACF1
	for <linux-next@vger.kernel.org>; Sat, 12 Sep 2026 02:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789180213; cv=none; b=ReYGsFKGIJiCsPClfPQRJnufBiIl2HG06Bxj17f3Tl6Z7pLWFIDx076RBPWC95g/JRvOegs2+jhL3iQiC8Zu4Rx7MSMZfUG7IADTnyI7eg3b8BmSZ0Y9PVoU30EaWEE1WXVyDP1FVnxH+bWu7NGhwcSPfzgvO3KJAfO1Sq1ZJf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789180213; c=relaxed/simple;
	bh=bxKLoS23Y3tzsqWpx0EkJUbDRWHKg5qAsjBRcOMSWdc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=twsD3fJ5aig91wf6p9BcQwrVnLPoHJe26Hwn7S/XKTOu01akAwkWmpncIEDukZvA85+DnBQbA/SkOY2UYTPRVjymp7h5Yuap2xJB0K7Y0LaD3mq0wUoIDL62OrI/R6FZ2AxFzbS8IgwEEOOGtlubPQvfsQpcV+a5h8/GJ0A17fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=YgxZlfl+; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="YgxZlfl+"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2293128a91.2
        for <linux-next@vger.kernel.org>; Fri, 11 Sep 2026 19:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1789180209; x=1789785009; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w8A7mWI1MoFhw0R+6IcP9tb91XGY0l1FjDKkca4+Fxo=;
        b=YgxZlfl+ALfvMTByKMs5Zv3PoekQnlk0jXMOtIpuElrPgk84B8AcbRV/SbiOED7oah
         agPLJZTE6WTpOgIHH2jX3qN10EKT+CSYexMotuOxmqOEd3vlW/iDAlLRzN6aiiqd12Rt
         opZ/d1Oi/HafnqWFqBlkCy24z/34Bgu9YwcjxK0Xd963FZQJ4nkqYbXmfm0qufKCSser
         YRtIR6Mkm5yd9ROn8FIu3V6wKML+bBtXio0yxmmeyMo+Btzdj1nzhK37INz7lsUS5PZK
         KwNJvxPCYEny63TwMa+Q5ot6x+8egqjWiu+fHyZfIQld/PInHFqvo+urZn6y92S3VZUV
         6U4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789180209; x=1789785009;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8A7mWI1MoFhw0R+6IcP9tb91XGY0l1FjDKkca4+Fxo=;
        b=OqpqeV42bgqZm6eVTN/CYszzSa2uYjKHz85RlPLBUOgN8w41PLpoa+DzUG6HSfDuNR
         /sC/WZ5yhCgTNt9Jixvy7NCYulUEQdaNpgHYncGfgyPqPRJcswvVaGjaZawpp4IoOEP8
         ElHRe/dggHBMtkF8AZd2uMOdy9spSsY2xx0zwTi6VP4RYM+uYsT8WEEUku6fiir9Jf81
         i1HxMIMY5WcHpmmg5BuS8UYRsYuU88CBds2clYi16SkPgEJzzreYL2VRMINoXEKNWvtE
         UkX49YKmmW/EvY6WtXlhAqRAlJyEZKsULVKIoaKF+5blV9aztk70oTZ0MxLk7uZdnQwA
         UnCw==
X-Gm-Message-State: AFuF++lubAtKOUAGmS2AnjBCFWSEGf7Io7N3tsjQm0m2o2R07kPnv0MU
	xsXAQMnYTerVjrui1mreSwBh3oxXWqH08cd76zj7ckJ+MsEs8mgzz4PpEZXcyneY+jIJU5NR5wz
	hFnfg
X-Gm-Gg: AYBFou2o8nO4sxQdsJyROWTSFeQI6bbwkEc6sdZfFBm2Dlshkewrp551W05+KDk5cR+
	/WRcWuijCYy/Sor785wB9UK+oTsfDo8XDoFGHBBy9u5NoSAThFn6cGX2eHXNPChIJbCAhIMBr5G
	e4hlIh4SGOty6WibzEdnHWqZDy6QTEGs5GQZQYlKRYNztPBs0iOL+xaGvbXDbxtB6Xn8EAwe91b
	nkqBeoWgZSVWL/cAc/O0mQGgyTOG2pY80rJUO2nwuJ1XlsOuv32nwg7yQL4jvuCPbKFODEyBIdp
	ds62Lw6FtDIVMcoVl1GnS5TWimS3NGl0pgBAhiZVzvJz6EWTAC5Q04PgPOqPqloAOO32KmHLLKb
	v7woWHj2KZ+LJJP5zc+Mpaon5Wq8CDuLAQ9uYHNOQMTIyVqn1rRVnHRXE8no9kdvX2lj7HYRN5g
	wuKYL0Vg0YOipLughA8HGrov7oyOhIcak2MR9DXOjogTgn0C9bfFEJKIfRF974d1s=
X-Received: by 2002:a17:90b:270c:b0:39b:a8d8:985 with SMTP id 98e67ed59e1d1-39d9c0ad3edmr11950858a91.12.1789180209261;
        Fri, 11 Sep 2026 19:30:09 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm10654334eec.24.2026.09.11.19.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 19:30:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 68142f986ff04b2b70b31db00f719bf690f64a9a
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 12 Sep 2026 02:30:08 -0000
Message-ID: <178918020818.4637.11652384590982799377@41049dfc76e5>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/68142f986ff04b2b70b31db00f719bf690f64a9a/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 68142f986ff04b2b70b31db00f719bf690f64a9a
origin: maestro
test start time: 2026-09-11 16:03:51.189000+00:00

Builds:	   66 ✅    8 ❌    0 ⚠️
Boots: 	  135 ✅    2 ❌    0 ⚠️
Tests: 	24631 ✅ 2512 ❌ 2742 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6aa4413e20239ade902497a7
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d1a8
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d1a7
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d1a6
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d1a9
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d1a5
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d1a4
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d196
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d195
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d194
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d197
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d193
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d192
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d19c
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d19b
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d19a
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d19d
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d199
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d198
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d1a2
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d1a1
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d1a0
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d1a3
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d19f
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d19e
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_futex_requeue_pi_signal_restart
      last run: https://d.kernelci.org/test/maestro:6aa44f0720239ade9024d190
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6aa4414720239ade902497f2
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1c4
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1c3
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1c2
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1c5
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1c1
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1c0
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1b2
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1b1
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1b3
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1b0
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1af
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1b8
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1b7
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1b6
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1b9
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1b5
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1b4
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1be
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1bd
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1bc
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1bf
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1bb
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1ba
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_futex_requeue_pi_signal_restart
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1ad
      history:  > ✅  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ftrace
      last run: https://d.kernelci.org/test/maestro:6aa4481920239ade9024b7e0
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6aa4484520239ade9024b8ea
      history:  > ✅  > ❌  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6aa4414220239ade902497bb
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6af
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6ae
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6ad
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6b0
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6ac
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6ab
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b69e
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b69d
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b69c
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b69f
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b69b
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b69a
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6a3
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6b2
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6a2
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6a4
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6a1
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6a0
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6a9
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6a8
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6a7
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6aa
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6a6
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b6a5
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_futex_requeue_pi_signal_restart
      last run: https://d.kernelci.org/test/maestro:6aa48fad20239ade9026b698
      history:  > ✅  > ✅  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ftrace
      last run: https://d.kernelci.org/test/maestro:6aa4481520239ade9024b7c6
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6aa4411120239ade902496b5
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6aa4414820239ade90249825
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c37d
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c37c
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c37b
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c37e
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c380
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c370
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c36f
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c36e
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c371
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c36d
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c36c
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c376
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c375
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c374
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c377
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c373
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c372
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c37a
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c379
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c378
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_futex_requeue_pi_signal_restart
      last run: https://d.kernelci.org/test/maestro:6aa4956c20239ade9026c36a
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6aa496f620239ade9026c647
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:6aa496f620239ade9026c653
      history:  > ✅  > ✅  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_3d64000
      last run: https://d.kernelci.org/test/maestro:6aa463be20239ade9025131a
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6aa463be20239ade902512e8
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6aa4414620239ade902497ed
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade9025138c
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade9025138b
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade9025138a
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade9025138d
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251389
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_0_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251390
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade9025137b
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade9025137a
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251379
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade9025137c
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251378
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_2000000000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251377
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251381
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251380
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade9025137f
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251382
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade9025137e
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade9025137d
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251387
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251386
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251385
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251388
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251384
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251383
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_futex_requeue_pi_signal_restart
      last run: https://d.kernelci.org/test/maestro:6aa4647c20239ade90251375
      history:  > ✅  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6aa4501620239ade9024d539
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6aa4509220239ade9024d8cf
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6aa4335b20239ade9023f53b
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6aa4943620239ade9026bf1c
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6aa4943620239ade9026bed5
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_firmware_coreboot
      last run: https://d.kernelci.org/test/maestro:6aa42f0d20239ade90234cc3
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6aa455e020239ade9024f2f4
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa4548620239ade9024ec02
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio.gpio_gpio-aggregator_sh
      last run: https://d.kernelci.org/test/maestro:6aa46c8c20239ade902545e0
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.gpio.gpio_gpio-cdev-uaf_sh
      last run: https://d.kernelci.org/test/maestro:6aa46c8c20239ade902545df
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
      - kselftest.gpio.gpio_gpio-sim_sh
      last run: https://d.kernelci.org/test/maestro:6aa46c8c20239ade902545e1
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa44f9720239ade9024d304
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6aa44a4b20239ade9024c1a0
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.timers.timers_set-timer-lat
      last run: https://d.kernelci.org/test/maestro:6aa44d8920239ade9024cd0e
      history:  > ✅  > ❌  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ftrace.ftrace_ftracetest-ktap
      last run: https://d.kernelci.org/test/maestro:6aa4662a20239ade9025174d
      history:  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.gpio.gpio_gpio-aggregator_sh
      last run: https://d.kernelci.org/test/maestro:6aa464ff20239ade90251496
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.gpio.gpio_gpio-cdev-uaf_sh
      last run: https://d.kernelci.org/test/maestro:6aa464ff20239ade90251495
      history:  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.gpio.gpio_gpio-sim_sh
      last run: https://d.kernelci.org/test/maestro:6aa464ff20239ade90251497
      history:  > ⚠️  > ⚠️  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa496d920239ade9026c534
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ftrace.ftrace_ftracetest-ktap
      last run: https://d.kernelci.org/test/maestro:6aa4aee920239ade902732bb
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
      - kselftest.gpio.gpio_gpio-aggregator_sh
      last run: https://d.kernelci.org/test/maestro:6aa4ac2820239ade9027270d
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.gpio.gpio_gpio-cdev-uaf_sh
      last run: https://d.kernelci.org/test/maestro:6aa4ac2820239ade9027270c
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
      - kselftest.gpio.gpio_gpio-sim_sh
      last run: https://d.kernelci.org/test/maestro:6aa4ac2820239ade9027270e
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6aa4418b20239ade9024995f
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa49c4b20239ade9026da43
      history:  > ⚠️  > ✅  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dmabuf-heaps.dmabuf-heaps_dmabuf-heap
      last run: https://d.kernelci.org/test/maestro:6aa4694020239ade90252279
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio.gpio_gpio-aggregator_sh
      last run: https://d.kernelci.org/test/maestro:6aa4784920239ade9025d894
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.gpio.gpio_gpio-cdev-uaf_sh
      last run: https://d.kernelci.org/test/maestro:6aa4784920239ade9025d893
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
      - kselftest.gpio.gpio_gpio-sim_sh
      last run: https://d.kernelci.org/test/maestro:6aa4784920239ade9025d895
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            

### NEW BUILD ISSUES
- Issue: maestro:062b6b4e2382aba3e97943acd24e9dea1debfc26 | version: 1
  Build: maestro:6aa427ec20239ade902331e9
  Comment: ‘parse_edid_cea’ defined but not used [-Werror=unused-function] in drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.o (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-09-11 16:27:13.488196+00:00
  Culprit: code
- Issue: maestro:062b6b4e2382aba3e97943acd24e9dea1debfc26 | version: 1
  Build: maestro:6aa427f020239ade902331ed
  Comment: ‘parse_edid_cea’ defined but not used [-Werror=unused-function] in drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.o (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-09-11 16:27:13.488196+00:00
  Culprit: code
- Issue: maestro:062b6b4e2382aba3e97943acd24e9dea1debfc26 | version: 1
  Build: maestro:6aa4280120239ade90233200
  Comment: ‘parse_edid_cea’ defined but not used [-Werror=unused-function] in drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.o (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-09-11 16:27:13.488196+00:00
  Culprit: code
- Issue: maestro:062b6b4e2382aba3e97943acd24e9dea1debfc26 | version: 1
  Build: maestro:6aa4280520239ade90233203
  Comment: ‘parse_edid_cea’ defined but not used [-Werror=unused-function] in drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.o (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-09-11 16:27:13.488196+00:00
  Culprit: code
- Issue: maestro:062b6b4e2382aba3e97943acd24e9dea1debfc26 | version: 1
  Build: maestro:6aa4280920239ade90233281
  Comment: ‘parse_edid_cea’ defined but not used [-Werror=unused-function] in drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.o (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-09-11 16:27:13.488196+00:00
  Culprit: code
- Issue: maestro:062b6b4e2382aba3e97943acd24e9dea1debfc26 | version: 1
  Build: maestro:6aa4281720239ade9023328b
  Comment: ‘parse_edid_cea’ defined but not used [-Werror=unused-function] in drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.o (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-09-11 16:27:13.488196+00:00
  Culprit: code
- Issue: maestro:2cd0ade6ddcd35907ea4715e9aedcfbb461a8dc5 | version: 1
  Build: maestro:6aa4271720239ade90232fa2
  Comment: unused function 'parse_edid_cea' [-Werror,-Wunused-function] in drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.o (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-09-11 16:48:02.637286+00:00
  Culprit: code

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
