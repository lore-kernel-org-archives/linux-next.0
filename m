Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251002C0298
	for <linux-next@vger.kernel.org>; Wed,  4 Feb 2026 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770172213; cv=none; b=t6VCUB7JE5RivB6ofGQKf2Nc+kYs/VImasS/1gFd7KQJ6FP7aUCGxny70hO8oZYhL/++bYhvX2bAZ4ricPvw6Eoli2G/KX6DRVrTi0I7wO70wXk0DjOfyqpcb4pL12VSpiTkvz4FG7XQd0i94UZ77razmjkSD7T9Zd57SjYpGsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770172213; c=relaxed/simple;
	bh=/HkkeCB1MXB/eJB217H++RZsgMn3J1XVzn249D6DRAw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=CVd6d7txd8NUfSBU0OIDG0UwjBs1uaPkYiEcQqvVWUzpCSpH9cIzKq5jTLt2zMe95DsaHL+RcR5c/hJTu0DGeB+ai9+B7eC93zottyoA7rHrokO8St019sPbYFC25T3Neh+b/ad6a5pdCf5AhmorFzizaWzstkTxh8bvW8wcnTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Mnf3WjJD; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Mnf3WjJD"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1233c155a42so10393416c88.1
        for <linux-next@vger.kernel.org>; Tue, 03 Feb 2026 18:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1770172211; x=1770777011; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxyD4pxDFfEc+iQJc0aK54xE4cgbhCAACTGzrXapLYI=;
        b=Mnf3WjJDV7K+PalVV+RAUsLeYnMlinUvrDsmFIEzhtjP5CLoKNirerlij7arIXsHLV
         MIyJYBXWX1njktfdpbfqOrssMVk5Y0LRA0k8n93f7CUdRqO/zsqcsyuoBcLDgpxz3jef
         ip5u0nXIgap2hFX9glMQXCow/A8piJd6cNnylmirCR9VhTfHsPQSxTFkI0vl0BDASwXB
         RKc9tbVFa/UrvpoMey544CxSHBXAOpIhHeRO+WGu2nqUWwKuoXGE7e3P9whGYTDlMQGb
         4+Ko8EOhtvA/5U+Vj80DLMDuySxt5Hb1tC56lJaVzGurjjHsgGjaZgxbnwByXgzgNUvA
         PYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770172211; x=1770777011;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RxyD4pxDFfEc+iQJc0aK54xE4cgbhCAACTGzrXapLYI=;
        b=pyxRf6b77DxNWNIEb5Tv1BvGtusWTENvWSKGV1HjziZJEO/ZZo0bB9j7pLeSTMonBD
         BOKQp3bw7XZMpMXD8RLS9OHLxFf6w32hEi5eYnET1hAadSqAhtteayUPKzkRcqCSpcVa
         Bn+/k1s73d1vSTW4oGOmZcOgkQ9xko4sLL2/xbBe2GJvyvA/UZfHKUK1RVDInvfdpL/h
         38zCHGeRpQetMjuj0Yd1orlAk5KrlIorOF+iXZAyaPDM3cQzGWwI6TdMlWuDtjgfsLDZ
         SSJLxlv9lHBNRenS4NKJvn3G3jLS2qjcxTP/ZAoivOzly65j6AbuxrXenVX4q27S52Zp
         w2wg==
X-Gm-Message-State: AOJu0YyG0536ATzQU7Gx1hcacaRZyCMu6I/ilr7EvfaFEnb94HG8pFTg
	w6sNrRP87bGvoQKJWFv+9PnZlWeEVCe0BDYYQTrtksdV1bmH9njhsG3Xtmy1qSA+otsNmcpzuHJ
	4/xZl2NHA8Q==
X-Gm-Gg: AZuq6aI9nLPDK8N4/FJ2bOhgbjRTJEDwH2OQRX6NzxLY5INsGFqSu8YZNOwU2Ly7oew
	qJZymZUIFo9/D7SXmLJMORmCl41LAMxfI205zXw6adGXUyDxc1LfyNiRpRT2F/xMQpeXmBJ328w
	O3/Rr1+4GLjlZVwEurV0v9Tfk5Sq5cbo1FIcGQPEVm2h6C4idJIWBhu52x5a8lA2z+wxSuhnDj2
	FFUaZUnOZwlOK4gUELs3eNo6Ycxm6uXia1OFgQpBmDfy3uCqTyJgfbzO29CTHB3yeUFY5GYlqJq
	tgSg0rOU8UE4Gqn7Kd2XztoCCO9KpKsqiia8wuOdPwixtNn0Yj0wELGx2uLyFBN9umMR0513/Ft
	xyjaOUTG7byTwLQb3MTiNr7wu4GDNRjYvibebBbhU0C4CdjDySjnzXfRh9WNp5C5FjoAQrnwEXJ
	HCgs5W
X-Received: by 2002:a05:7022:6b8a:b0:119:e56b:98b8 with SMTP id a92af1059eb24-126f47ccd9amr756327c88.31.1770172210939;
        Tue, 03 Feb 2026 18:30:10 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f503d0fbsm923134c88.13.2026.02.03.18.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:30:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 5c009020744fe129e4728e71c44a6c7816c9105e
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 04 Feb 2026 02:30:10 -0000
Message-ID: <177017220965.6682.12192039850899742364@22d5995788c3>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/5c009020744fe129e4728e71c44a6c7816c9105e/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 5c009020744fe129e4728e71c44a6c7816c9105e
origin: maestro
test start time: 2026-02-03 19:21:08.825000+00:00

Builds:	   47 ✅    7 ❌    0 ⚠️
Boots: 	  159 ✅    2 ❌    0 ⚠️
Tests: 	 6034 ✅  260 ❌ 1811 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.clone3.clone3_clone3
      last run: https://d.kernelci.org/test/maestro:69827f77a1ae387ffbbcd307
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.clone3.clone3_clone3_clone3_in_a_new_PID_NS
      last run: https://d.kernelci.org/test/maestro:69827f77a1ae387ffbbcd319
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.clone3.clone3_clone3_CLONE_ARGS_SIZE_VER0_in_a_new_PID_NS
      last run: https://d.kernelci.org/test/maestro:69827f77a1ae387ffbbcd30d
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.clone3.clone3_clone3_sizeof_struct_clone_args_8_in_a_new_PID_NS
      last run: https://d.kernelci.org/test/maestro:69827f77a1ae387ffbbcd30b
      history:  > ❌  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:69826417a1ae387ffbbc60e7
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.clone3.clone3_clone3_New_time_NS
      last run: https://d.kernelci.org/test/maestro:69827f77a1ae387ffbbcd309
      history:  > ⚠️  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:698294cca1ae387ffbbd0a21
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69829584a1ae387ffbbd1208
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:698297f0a1ae387ffbbd2b51
      history:  > ✅  > ❌  > ✅  
            



This branch has 7 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
