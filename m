Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4E6492E5B
	for <linux-next@vger.kernel.org>; Wed,  9 Sep 2026 02:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788921026; cv=none; b=DCiVjPCUvq/BFZ9F9hGFGRFN7MuC3HUcH30Bo2aHUlV/hWCU2HtTQxLvmgZ/vIh1kALtt44IcvtNpF3X6BvAxqjJL6N23WJkemwD2zdp0WebdoQ+1iaHEq4/vzrBz4m5Bi+shKyAeBTmO/FWwHSCcq++cq+YohD7i0yJEoPRzWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788921026; c=relaxed/simple;
	bh=+R+7ZRVAERXr459/4WAXz4PHX7W8Yw+k9RPs/aI25Yo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=FcgyvvAvPQ0MjVuCI5jXBWtV9K37oJ6TUKhKEu2GzvtPXylWZr41WJgng0JZLVykUGdlj80JvyKpd7fqb+6BAH90MAmZhDg1sVSxlz1eJHF7IpyQhraaBUKDHpihXDAuZoNhW8JhwfwDdZW39lcjLfvqXOlmV3wEIm8QtWr5q04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=K4frxhEt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="K4frxhEt"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d5cad1a6baso49862885ad.3
        for <linux-next@vger.kernel.org>; Tue, 08 Sep 2026 19:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1788921024; x=1789525824; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yJ0SY0AMdyv/gsd8L7k11PC6kyjsjl8sKWcu+4omqCk=;
        b=K4frxhEtYl62268zIqJXt3aQlM+XHurJP9YB5CcqyKYKlkusbBqC7Baeg1VernxdB0
         ZymTe8WkSLkz4mJLpDYsRuEc7rvuIExZ1zuY8NtC/X3vmSDtn/njEBXytiXMlnXSzXAC
         X5pdDx630qFhlbU5D7Z2RVlb7wbVd9SbXcxC1D7/Yh9nLKgrlGaIIJA7zAz2HYE8BnYQ
         vHmJSUXAlevrJNvbJHk6hjxOvqQtVxWY+uYc33pUTMvAUplijAeoZgtVNSrGKkZ9X61K
         ACcgNikbiYke7/SHYduMpq7y0A9NkMSHoUVUsKiDGYom+Ow/fCYaOiVW13c63p6lZB3x
         PfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788921024; x=1789525824;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJ0SY0AMdyv/gsd8L7k11PC6kyjsjl8sKWcu+4omqCk=;
        b=ZPtHvXO4+6gj2mLmWFK5Bja+PT/APn1J2w4PTs1ms7gmqZhe5yi8Fg6NvAGEf3tmkk
         LXBjBadr7J2JEDxMIP4pTJjej0idLi6ello+NKE1SccdEjzT+sWbseUKL2KPIU1AQw8f
         V65ixsqk/u6rbzIew6rjV4lR2heapU5bAkyQl/9DiPkqJDsJ7vXJCI+C4Yu3Wg3FR1Aq
         gtJHUyxA6E509qjNfc6BOuw+kr+OPqWoPeRz7VoFxI/jg8l3u0v58/EhJt9MjdhloDeo
         qcCRh5s6SR9MyZza6GIdumNNCVl5O70LeCS560qKvxZ/Uzzh7g8GPB9ruItG/N3pnsaj
         65Kw==
X-Gm-Message-State: AFuF++lefwYBXZb9FkAoWR8agAY+2licM2LpC5JUgcikoQrGFdB04zmv
	MimIku4ZYKDAnxx2sa7pvARYCGah2mP2Vhk9oAKxgF3Jqp4+kpLc9wFIG5ka4h3KVss=
X-Gm-Gg: AYBFou1j2mWQ51yY9YHZfGbudaS7fBWl2hhmsv9n6q82KQC8EuCyaB9ccyfwXk8TO1b
	MU8yfPtCD3fDqNNP4hM6izQysXQGl7bo7ZD+mvRMsjYYn/O7TNCDbB2T/P+AQ4dKRKI4UowFeP+
	C7mKfslLKLmUGyH7XusQWKMc662ZwJXNlDf+AZIl5l2vcohhyirn2QHU4Kl98cMjn4U2Ine4Ym1
	xVISWkDVJdml+VWbZYIO+hnYoblFzkXfl9CD7PRViT2rbe0wHSxxFzX2AnfAZzY0PMqCNWyAdiX
	0Sbw7zuIo+zyKdOSu+OaLfD/LTkELcb9D0+Wx0Oj3jagn4wgRTG7+UO2xJsnY7MVfSsAXm1BlxB
	Edb5RYg3PBrKyGkkWJTXCEJnjVX3PWA1zE6nqsQUivXTOoypVhdOfisSzAler46ECdVdfoV7xOT
	00dQMjkH84q7gqSOs/WoF64lAbAMu6jbBAgFc3Zs38MZf4OyURE0b0hKOJ0kWInFY=
X-Received: by 2002:a17:90b:4b0c:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39b26121f6cmr48590782a91.2.1788921021265;
        Tue, 08 Sep 2026 19:30:21 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm53056219c88.2.2026.09.08.19.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:30:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - a9d7ced84989ec05be09b4b8428759ef60450a0f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 09 Sep 2026 02:30:20 -0000
Message-ID: <178892102030.3236.15825255948883568516@41049dfc76e5>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/a9d7ced84989ec05be09b4b8428759ef60450a0f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: a9d7ced84989ec05be09b4b8428759ef60450a0f
origin: maestro
test start time: 2026-09-08 21:16:21.868000+00:00

Builds:	   71 ✅    2 ❌    0 ⚠️
Boots: 	  165 ✅    3 ❌    0 ⚠️
Tests: 	29543 ✅ 5034 ❌ 4257 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6aa09f19e41d7f97d6185a91
      history:  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:6aa09a62e41d7f97d6183237
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aa09f19e41d7f97d6185a8e
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_firmware_coreboot
      last run: https://d.kernelci.org/test/maestro:6aa08af4e41d7f97d6173cb5
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6aa08510e41d7f97d616bdf6
      history:  > ❌  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6aa087b4e41d7f97d616d4b8
      history:  > ❌  > ✅  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
