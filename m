Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5339730DEB2
	for <linux-next@vger.kernel.org>; Tue,  7 Jul 2026 02:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783391433; cv=none; b=p2t8WYH7aCkdtao3PoAyBtwgA7/vbZU1kwQEGCCOn4zIyXebMOHX9xxLKBGowe41w/RvH284pKEsnlPOF4bPxFM/qXG/oTOlCLqbvRY1HcVzUcR+bswVYnXKdYv9FVsLVlJzG4viuv6hJsmNrWVjDGSjMbsdDXAa9MmIW0Y9vJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783391433; c=relaxed/simple;
	bh=1lw2kk86uHvg/cEHmop2dpLJ6C5X5qA3/aC20ELoYns=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=tAptwgYgexZsg+ai5iCbkpWqVXEo36czwQ5XL82VUeIqlbDqn1FZSixHWZ8kdAHfJv/P8BrJjc5HTgn76EUsqesg8GYR0mTOYb1jnaUvc49Y9dAxtmQiBWTxnBaz61JVlBDUT0A4e+4WFpI1p/aThOT1OSHJ3IOyJEFMVUc4bXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=dBFJjEqd; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="dBFJjEqd"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso2012301a12.2
        for <linux-next@vger.kernel.org>; Mon, 06 Jul 2026 19:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783391428; x=1783996228; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4WFz6hyYusmvJzXT8BUTUCeB0tYf4Xx9XljIrGu7P4M=;
        b=dBFJjEqd0W6N5fFgW6fZGrRqYMbvwNBEGlRd9t57ijquf/Rny5VkIqIgEX+bxXVGsh
         IokwVcD5tZDLRww4Z+gA/h/fseFi7AoFMpZKdUyDTJ91Z3CZvwxMy/zlMGNvWYw0wuTV
         nQav2fKpZjgNan3iXcvtDYQGBikoCCZ5vRjWc7JZ/iSyM0p8PUjjYiM4Ifltv7VyhLmc
         DcaNsloACg+NzlhaY3nkJ4ByQRyn4razW0QPl8C1Jy4JtIJoCus5YEClA77f8xSzK/nO
         ZznL0KbkGvslv3zq5wWl2Bin08WgItEbe5K9xnk0La6mgF4PJZLvp4AQA//VE7nUMLIu
         pDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783391428; x=1783996228;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WFz6hyYusmvJzXT8BUTUCeB0tYf4Xx9XljIrGu7P4M=;
        b=F1v5iVYiK7ZfO1psz61uEKtaQfSHFP6SMh1PnG5WlQ658GbOwnP6izSdxGpJhCF2aX
         UI0fbrDRAjzP6n0xDo5PxRf5QcC9hIDIevxOFNFdS70OVuahIy/2GnQ0ibCb3MV3ruIo
         YNlpLhxINFNgNr2AQJFia2ea4a1NpKUSJR3n1zk8ZlOIwQ66rcNRSvyXMxxtAaGf/2Sk
         3vkGt0Pc1xCPxVzNjbjBdphR+vnPU8mINlnFb2JrRcIk+jBTZ1N7xHeUF5dWt4fldrfQ
         TRCmUpPC74tOcwJiaKZQk+6ZVSpuerDjwbvQx68m6KYFKVTiyGPmE0XMCHbnWV0khwYn
         vmZQ==
X-Gm-Message-State: AOJu0YzMboBr6PrnRxmcQbuhhnpsgk8xkFI3VoSxxJCAJkW92IuRHb7G
	zS+VnZXxGIk2yuN5/ANkDIPKXxersxQwuZm3h8rxLZ4gmd+DTafrSukX300sZIcWp/U=
X-Gm-Gg: AfdE7cld5upzuncKi+H8MQ98bxkvkEoJe/ruLlbkSqEOvYJe9UcorhNJRuGfodXmAS7
	lS0xgrT6sRkkAcEiX69A3F0NKBYBCJcMBKRhe/74nHOq2KwpOJkngdFuTIAXFWEeBDLmaYYXyGB
	1ffb+Nm5RdkxCxkM6Z/ORwKpDwF6OCCkUXFG2Wtp1wZd7vwXFx36Rlz54Kp2njdMouwDNNGckoF
	IjIj1rR9VDcJM3JyE5EnPBT1W1NVlestM5uQCrv0rO2VFZ3YKtLjoBXNVzr6Kfrmy2a8TVSXpSu
	fUIeIn1fK9wMVsBaorFeiEi1ku6n9Bx+74VUuitWbX2+iF8AOTUEtaGkwyYGt/MRBq45hDquWQy
	QR1n4X4JiqiqmOhP/38rA0fNYgLMaKohulMzWRiCDKb/AQX3qQTndslxx88uXXxJsWHN6YYYP3a
	PqhOCSs//KPvBJza1f
X-Received: by 2002:a05:6a21:689:b0:39c:235:c5ec with SMTP id adf61e73a8af0-3c08ee78247mr3636896637.34.1783391427977;
        Mon, 06 Jul 2026 19:30:27 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a5b26csm2308159eec.15.2026.07.06.19.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 19:30:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 8e9685d3c41c35dd1b37df70d854137abcb2fbac
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 07 Jul 2026 02:30:27 -0000
Message-ID: <178339142715.6448.17223763182328318008@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/8e9685d3c41c35dd1b37df70d854137abcb2fbac/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
origin: maestro
test start time: 2026-07-06 16:10:48.456000+00:00

Builds:	   66 ✅    2 ❌    0 ⚠️
Boots: 	  107 ✅    3 ❌    0 ⚠️
Tests: 	22586 ✅ 1379 ❌ 2817 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a4c06e106fecb7f4743b179
      history:  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-device-error-logs-ramdisk
      last run: https://d.kernelci.org/test/maestro:6a4c0a6d06fecb7f474434a0
      history:  > ✅  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a4c032506fecb7f47439772
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6a4c0c2f06fecb7f47443be5
      history:  > ✅  > ❌  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a4c034306fecb7f474397e1
      history:  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a4c107f06fecb7f474446a7
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a4c034b06fecb7f474397fc
      history:  > ❌  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a4c0fea06fecb7f47444506
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS

  No unstable tests observed.



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
