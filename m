Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5494CB5B
	for <linux-next@vger.kernel.org>; Wed, 18 Feb 2026 02:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771381823; cv=none; b=GKM/iYLrUyDj/QwsJdC268YgXQBMeGhdcjRUmMNTAvhp6kBqeO0Nnuh5APF0o8UupZgjLWYyGtFWp5Hj2d0cdnMD70hDVZJQ2XOgq8NJmPEfZyWcVJaojSQXL/f8NKx/uPG+RSjpd/1BjOgTGWBwqIY4bU6B40RswWVP1SfIb7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771381823; c=relaxed/simple;
	bh=QmalsR4xVptG5dkRSm5bA0Ye44wgngG4OlTc/qHUmqc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ALKZwjNCI032N07tlVTNcqeEVpWfJ6R9v9F5DZTEMBdAHxKLxPiQjl3Da/JH0lX71nNRJcW3kdMrtqowkdccMNUF967aCZKfyqJFKbuXXxiZd18alQBwUVFrpA7GErPubCeCafveEmwaKy2BEv4MSIk9B2CR5FIUmyVGMHStMGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=kcGoK9Do; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="kcGoK9Do"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2baa098ffc6so4119454eec.0
        for <linux-next@vger.kernel.org>; Tue, 17 Feb 2026 18:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1771381821; x=1771986621; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fc007As0Ixun7ND5t+dNpxdrjEo19u3i+2UY3CcojUc=;
        b=kcGoK9DojhcK4EbUgvYgJFl6nW0oSldUubjmM1t/Uiji7orQdAEojxY/iiSCOlDlmX
         s0w07ZBgMp2xNJWT1spuXJsfSrTAP1aNeGAn93IFZXFabNJgiRw8dnC6JKMCOe+XjtLr
         gqOFf7/BuAkelNIDRYbNNZUPPkf0OGgapANe3/BPZ9qKKYACGKs4MdS1nODmLIXHNk5E
         FwHzMw/Qn9Xy7mRRHZjrSqpaPc/uKazJqhkeKuBgXYvFYhKC8jf1lF5CP65ct8PuRzgi
         jDTHCSYUKI5Ur/6N+GAeMbaWILdHYz3EX0KRFEy7WQr/mTngMtchYvlfXsK+gQor0JQj
         UnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771381821; x=1771986621;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fc007As0Ixun7ND5t+dNpxdrjEo19u3i+2UY3CcojUc=;
        b=W0tFB1bkzBBM836/fBa1LqjVdt9IZc+xaV85e1ncUelaxNPsxDVayAjrlcADcBCuNk
         QRwIQwNKtewKP1evEX5bJY5kbRgz0JU6zRa5TTmQ/9FcRM9EaEhux1QaYHKpmGkMAG0f
         tOw4FpzSc8BzMjsIupb0lYFgxDrIOwSWoZmUp8gMTbGBjE7Lrr5S/h+4eDn8vJifORx4
         zMmDkSmmFJGRzHKivhGnWiqCeA2GNn6e4Im4wgjVFl1kYeq9t9QGJ/I4hhTLCAOYiq9Y
         hsKcV0oHr5vFadeGYrwmO4zDfMBqT79Bu+TpEVHe+bYsQUdFdP8HPNICIfNqq2QPJnj2
         YhXQ==
X-Gm-Message-State: AOJu0YwrrGTmE4qgs1W0T1pTSEoIISdNMHS6yVaUsoBZXkgbCTjMAAJp
	2Hp37Mz1T35X+cau/Wkw0bRRTdMAZyQHHfyikHgrXIOtyKQda79R3kVaQ6KHm3VES1Mj3J/ytPF
	3pHLK1H8=
X-Gm-Gg: AZuq6aLMqy0TxsvVw4NCsLgCQqhJgVuzni8WXcveT/RMMcpbZBX5l+KYRKntT9Jrukx
	OWAbmuDHOLNcb6JNzwfusDs/LRyTq+UgDBDVOThxiP5EI6a5ISaH4xiGkKmwPS+rPF0E+9QvxxY
	/X9hJM1XWELyrW76CiEyr8REyxLLuij2fQTt8r+gUu3sBiSEWVQFo1ntCjUghH8PASV4Rwo4RyP
	ZTxR9ez8iYRNprA00k23UMJKk1o7y3+mPY88y1cW+SwbHyPdZI0sXJ5CYHst8CuOJBpGXwvL0rW
	FaCZh7xom7MwC8vij5gU+7EmRMBAs8Sf0m/CGkNwjK/YV+Z8mQatHwgzyMac933b0ziD1SXC+CA
	1/JmjstPpe532EZxDT4a1jnD8us60y+gC9BjcRow/FMJ6jkcmAcz2N+EZez6DJiH3v5Y4Ujm4tj
	L99EfmlRVaywHqCruy
X-Received: by 2002:a05:7300:1348:b0:2b8:30b8:58c0 with SMTP id 5a478bee46e88-2baba01159amr6299559eec.6.1771381821322;
        Tue, 17 Feb 2026 18:30:21 -0800 (PST)
Received: from f55b40a4666e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb5575b3sm15492954eec.9.2026.02.17.18.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 18:30:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - fe9e3edb6a215515d1148d32a5c445c5bdd7916f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 18 Feb 2026 02:30:20 -0000
Message-ID: <177138182014.3393.3030416504892816271@f55b40a4666e>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/fe9e3edb6a215515d1148d32a5c445c5bdd7916f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
origin: maestro
test start time: 2026-02-17 16:13:42.312000+00:00

Builds:	   55 ✅    0 ❌    0 ⚠️
Boots: 	   52 ✅    0 ❌    0 ⚠️
Tests: 	 3265 ✅  181 ❌ 2452 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6994b2e7a1ae387ffbdf43b2
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6994b2e4a1ae387ffbdf43a0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6994b405a1ae387ffbdf4e21
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6994b2b0a1ae387ffbdf416c
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6994b2bfa1ae387ffbdf42c6
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
