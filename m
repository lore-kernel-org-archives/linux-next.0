Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0202357CE0
	for <linux-next@vger.kernel.org>; Fri, 21 Aug 2026 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787279414; cv=none; b=i63LFP/7kdvDZH98dE0lfCVl4IWfS8dMJgdbVtu5Wh5xbAczFVqn4N6Hv/OP5k21O9q0BZ5iOMTJy/7be31bP7EY+riErL8NJkwkXjejs1MTCY8Ghf0oR7cFefNXblhmpB04DOX8M0yUVJ6S6k5TeSgWK6/byesiCdCgIe9Uhfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787279414; c=relaxed/simple;
	bh=LohUXukngQznpafHjRsMPCWvk0FZLz82+6WnMb+3qcE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=o2oWXwqk3TAtHYHA6w8ozLK3byKVKOWCPQB3tyUiJi91UaO0A4zdiK9A0vkR/0YuXCTz4K/jUDr7uMaTBn8krSfZ/6143QDqD3h8DjNil12VFqFjiqpSE7aQd5J4emOi8jdyoAVzZang+gwPi3wThLApH209t3Cl/9X5tvWYJVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=J7MKXlSL; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="J7MKXlSL"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso352967a91.1
        for <linux-next@vger.kernel.org>; Thu, 20 Aug 2026 19:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787279411; x=1787884211; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cmIfrmS9gVjFdlJI4xMnRrpZAapJMEbLFVTtV9O/nZQ=;
        b=J7MKXlSLREDgACk7u9h9m4iladZIN6I81tmeW8wbrJSpwkFB/wIQlDIrSnOVpfEp2K
         TRC8EB+hauGH48JOtbg0TCSt8YQFtl83DS8LPBk6OU7hEcx6UrIfEYNLPHCPkSOUnkwj
         FGSNuGQ9P+Rh2oVkljAFQX/pGq41bPseQJCctbf/w/33mfYly2l0Oo2uZOyB8lhMLcEi
         9uJUUsgx41UE3NactrQXzQFWwOUFE+NxaUwlCoFiiEP8dyiEgbG9cVhrHC5rWYUztS2G
         Xgew4stht/GsqnDq2SQiKei+H0AKLE5V58gyRUOgkECh9pvFRYQjuGNaRX5Z9Kc18Aop
         gMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787279411; x=1787884211;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmIfrmS9gVjFdlJI4xMnRrpZAapJMEbLFVTtV9O/nZQ=;
        b=kf98bpBuVMiRBFutGOteX7HrU140FHwYuPUyZwSeqxlFVYmVaj2aE4Hjvf2afM5R5Z
         EEQl27bHMyAWrfnng9zcgudBNFnnhof3pNdAuttG277iXTkY8iJcVmVNZm+lCQHd8e/r
         4TrzCHtHjv+c91FwBcTexGvHMdvoBjE5aMey+pvZCPMakvzQRdzOk1BrN2FpRSLfCcRv
         u6gTmFrBI5J1Jz04df1mPBSOwOyXMbNJHftytDX7B6rCnQuq5emYlfpv1Gg9qY8VziI8
         CnahAl1hTe6zCL4Dx/hc+jWOw8JRYeEc3MiQLESdLisJtc2Np+lBsRdebWJtMWwpHmu/
         QHmA==
X-Gm-Message-State: AFuF++nVyUxBzM6FJpyMmj4WF8Qp8AClZrmbsDThU42sSjhVRIhvhpR8
	tuv6qmyoLIn/Y5X6k/1cGSvTu6oby25VWixkEVCJOg1ZHQNqxwEn12lcYZr0nslo26NcMnqmUPd
	SqnAg
X-Gm-Gg: AR+sD13szXDqEUPBf1/0AbJDtcg7HQwQY7ys0tQ5d6w4YRJ7ghbREUyWY9KzEZ9UXBd
	9PTdMoqW5zVrh67i2z5NNlqkJKTLbIceCQCxjcC9K3G46cIx1/Yx5KRTf1nm1VruM5CLN1inUvZ
	224KfHSnAplZaSvYEq4kKNplkRKNJ1wYlfKklEeLaKUj4jwlmgsCfYHTHgSe2mV2EViEjTwFUrO
	+k4fZ2GEW1H4Jfx2CJ68MGoLnjQ5ySKxLsBldNrS5RN/9gGn6YGuXVLa4JWPF9iOHsGE7UNLs6i
	iUDkUfks4R1ufVoML6TvqdaNbrw6JBmyg59qOX/WSKciwA3gQcE/PQE7j0eYGPbZJLA8VT19UOe
	aueTnC/AvqD7bgvWp/49/imR66RaCxEHb6rnBFRtBTJvPgRQQj6tWtuhe24HdtvPVDTbl5x7cuc
	9+qK30/GFCHZfdswS5aT8yiJF+E3sjFjA3oPf35cN3pWC4hGBJLNmzT6xBEA==
X-Received: by 2002:a17:90b:4c11:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-395c3878304mr4453963a91.10.1787279411102;
        Thu, 20 Aug 2026 19:30:11 -0700 (PDT)
Received: from b455de3d9de8 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm21827116eec.24.2026.08.20.19.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 19:30:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 7079a12d7506b07fb53b54a664bfad5fa9b16d70
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 21 Aug 2026 02:30:09 -0000
Message-ID: <178727940926.1021.1272583136106176420@b455de3d9de8>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/7079a12d7506b07fb53b54a664bfad5fa9b16d70/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
origin: maestro
test start time: 2026-08-20 14:23:57.721000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  144 ✅    7 ❌    0 ⚠️
Tests: 	23062 ✅ 4533 ❌  777 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_memslot_perf_test
      last run: https://d.kernelci.org/test/maestro:6a87993a62f33761c0f83ba0
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_memslot_perf_test
      last run: https://d.kernelci.org/test/maestro:6a87b5bd62f33761c0f9c4ca
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:6a876cdb62f33761c0f52b4d
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
