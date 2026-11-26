Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660237;
	b=y1yzR5BAJhi40DI6VdS9kIjXvYyFk4BcJwjTPvRnhS+x0kPZ0dnqE4HOxpAPjocHjmPn
	 qR/1AIy1qLJew52OAzey1T3KXrxB0d5ijke11Z8YV37uC3rXuPaw8xKxkIvDmFsxlwNPp
	 Ls6FTTzxzCY0Ao/hO6L5S1zVYpvXWcDZQwDml1GkTuPFneY210ImsyTXLn0cVv5LwlFYF
	 MYRWCmcIq+Fkn6NqpkALbSDOxtm7VPse7zAtbrRCRvA7CVCCw4cLCCNXpCXaJzqC05DXG
	 MPBI2d/vxacne7M7983+c5XtmuI3zEArbuaVUQhvoK/nPo2wViY+V/4W1SAOUe/L2tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=KjVDEBC41XajvdSAZQgPRPC7PrvOGrz+Kkflz4JC1OU=;
	b=1DHeSwDWCa3SFURavgzJ+KS8y5tKyC70yc8JqYW3avRFmwlR0qrxf5tRgj1zcqCSroVw
	 xASx5sbrMinWNgOiA+LKeI2FnaRLzPDkhLabZYvtudhYTqmyy//sNC0jKgDk/q+Oeaex9
	 o8AHEbw6Ehp5kNzRxpt7d6Jy+HaHLCf/QZZvpxnfy4zP+EpkDXvSwxi25d8r+u1O0NN2H
	 BA7f4f7hS5TxS3SPy4zIYqFxsu7ugPWmVqvFnTyVsHaqllLoUmb7eFQ9DzqYWxHNz4CNZ
	 0jEkYxctEJf7MAW/6RhQqKHtl1gzWLGulkktMgRyPMZgtXezOkgwHhPFGfUrmvKTSdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=C3ceIN6w;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81782606A321
	for <linux-next@vger.kernel.org>; Thu, 26 Nov 2026 02:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81782606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=C3ceIN6w
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so9047608c88.1
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 18:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795660235; x=1796265035; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KjVDEBC41XajvdSAZQgPRPC7PrvOGrz+Kkflz4JC1OU=;
        b=C3ceIN6w2ALuP46Lv72cxbuSkuJl0azRsnsHhvLA30NgWr5UqWsabOHDoZBjjgJ9Ep
         I+6dsp8ZLBhXD12alRxpZDIZsbfjhH4LVJwBkVqxrcmLwvoShyfW0t5Jb9O7uCSuO5nl
         Gqzc+2SsD48d2RnDNdGuMo0BlqJTNoRWUdoRz/eur1AQNGsp4uUuuUTuNUQYpmApQIp2
         iCAPTZwi1+TGUDI+eqPO6KthcJt8TTZnMOKQIwVCizgTTa5GOUDGgJTkGY2Dmrg2nqiO
         EU/p42pf/Vzq1HI4ZTNXtyd/ZhMiD//BaprwgbZpGR7f1tvZAe66THhFwfV54MgLwNlY
         4PmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660235; x=1796265035;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KjVDEBC41XajvdSAZQgPRPC7PrvOGrz+Kkflz4JC1OU=;
        b=MzmMPUndSUB3w2rqvh9JT11gckXzF2UINObsWI+H0tPulssDK9o+xXDdmTyzD+cNM5
         btb/tR/1PegTjehHA6gps5R15p9BIgdHqyMl4XPSoVT6blejEk2/Z0dRbiqejhiW2Zcn
         1KNle485mcM/mkhS2h4N/r2hJXo4zv0+qVfXj7rvteNIT9e3z5k/dr1Pi7/WUXdAyHlc
         fk3XmdwlleVY6+pawmrxc7JQX52hSBUw0BBbVnfjUqcKyWEBvPevdBTw9Z3CmczkXF9Q
         fM4grtXHQmTmu0nRf0slVG7mefSPRc7xNon/IAhX/mXDFUTNnVuUXPjmEZYsOkGaxox1
         uDeQ==
X-Gm-Message-State: APuU4Z+rOWWAJcLe58h5idIUoCxjRq7arxKEkh2GivdJneTNyqvH1XFC
	vQ/sluSnsDdn1cajJxPxB97hACfmNz6Jl93wstqEZBx68ipG2trjCMhcTHopMFEhCEy2+XJy+Pc
	W3y/0
X-Gm-Gg: AZFdTZfjJHae/n8MgaLIH1lTjmN1PppIoEGzSTZuHCgOfJVG4qmNi3OT/weBrZq7qrf
	DLtXkmHyx4FUdIH5h1HV7rBnD0byOIRoE0xddLQB3G1ANpmlKrXq8StWvFlQFZzF0uFVhUpot6o
	pu4dKd0afSxbiWNLtQFLZy4rlQtwSpvNPba4bLB31ekcoP/6+ra7J8myH96ZPRYkZd9dexQpvM2
	E+UTqdDS4EIDhJz3stuwED/Nsa+5sndXEGleTz2FrW7wg056AFfoOGmgVhpxuSwXcDNJ8wor+Cd
	XfN8RLbijsepxPV/UCTj7sE2mBu8juyQOwDF+vElNXTmKyNlEgbctcmm7bq7ofRtcr/00sm94IS
	cmVmuiZax0NXZUHQISO7R2fOB94ARLS0Rtm9ywD60mWfWYpZUckhEQj5uYanQG4SqiDXbMEXWKf
	VzNGwU6rR8bMlHL05O0QMNx01zRA4lw09UOnnIo87wmTaMWPDiBrDqdGF8LBDXFBM7vxwPbYjQb
	3mxFZorlOAMU177BfC2pJMoqvl9zmXJOxAUD+nz2eWuJbmYh2foiKU0YyMVkkMVZujcuNDBF9ea
	oai2KGsl1OVDApuZKPsUrqEfbHB7+QIMsPvGutzFXMY=
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr23059516eec.14.1795660235149;
        Wed, 25 Nov 2026 18:30:35 -0800 (PST)
Received: from 52d83ede7c60 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm30748441eec.18.2026.11.25.18.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:30:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 9437046953b2fb3bf55b36582450ea0267df82a7
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 26 Nov 2026 02:30:34 -0000
Message-ID: <179566023429.127422.17496285354923736178@52d83ede7c60>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/9437046953b2fb3bf55b36582450ea0267df82a7/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 9437046953b2fb3bf55b36582450ea0267df82a7
origin: maestro
test start time: 2026-11-25 16:12:07.194000+00:00

Builds:	   68 ✅    1 ❌    0 ⚠️
Boots: 	  140 ✅   17 ❌    0 ⚠️
Tests: 	39545 ✅ 2375 ❌ 5304 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6b073e63286e1965ecb86d41
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mahua-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6b072dd5286e1965ecb7c811
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6b072085286e1965ecb6ee16
      history:  > ✅  > ✅  > ❌  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6b0720d1286e1965ecb6f5ad
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6b072032286e1965ecb6ea42
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6b077d1a286e1965ecba0237
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mahua-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000
      last run: https://d.kernelci.org/test/maestro:6b072dd5286e1965ecb7c7e6
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6b072dd5286e1965ecb7c7e4
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp.AD002
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1ad
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp.AD004
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1ab
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp.AD006
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1a9
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp.AD008
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1a7
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp.AD010
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1a5
      history:  > ⚠️  > ✅  
            
      - ltp.AD012
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1a3
      history:  > ⚠️  > ✅  
            
      - ltp.AD014
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1a1
      history:  > ⚠️  > ✅  
            
      - ltp.AD016
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f19f
      history:  > ⚠️  > ✅  
            
      - ltp.AD018
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f19d
      history:  > ⚠️  > ✅  
            
      - ltp.AD020
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f19b
      history:  > ⚠️  > ✅  
            
      - ltp.AD022
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f199
      history:  > ⚠️  > ✅  
            
      - ltp.AD024
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f197
      history:  > ⚠️  > ✅  
            
      - ltp.AD026
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f195
      history:  > ⚠️  > ✅  
            
      - ltp.AD028
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1e5
      history:  > ⚠️  > ✅  
            
      - ltp.AD030
      last run: https://d.kernelci.org/test/maestro:6b077512286e1965ecb9f203
      history:  > ⚠️  > ✅  
            
      - ltp.AD032
      last run: https://d.kernelci.org/test/maestro:6b077512286e1965ecb9f201
      history:  > ⚠️  > ✅  
            
      - ltp.AD034
      last run: https://d.kernelci.org/test/maestro:6b077512286e1965ecb9f1ff
      history:  > ⚠️  > ✅  
            
      - ltp.AD036
      last run: https://d.kernelci.org/test/maestro:6b077512286e1965ecb9f1fd
      history:  > ⚠️  > ✅  
            
      - ltp.AD038
      last run: https://d.kernelci.org/test/maestro:6b077512286e1965ecb9f1fb
      history:  > ⚠️  > ✅  
            
      - ltp.AD040
      last run: https://d.kernelci.org/test/maestro:6b077512286e1965ecb9f1f9
      history:  > ⚠️  > ✅  
            
      - ltp.AD042
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1f7
      history:  > ⚠️  > ✅  
            
      - ltp.AD044
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1f5
      history:  > ⚠️  > ✅  
            
      - ltp.AD046
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1f3
      history:  > ⚠️  > ✅  
            
      - ltp.AD048
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1f1
      history:  > ⚠️  > ✅  
            
      - ltp.AD050
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1ef
      history:  > ⚠️  > ✅  
            
      - ltp.AD052
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1ed
      history:  > ⚠️  > ✅  
            
      - ltp.AD054
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1eb
      history:  > ⚠️  > ✅  
            
      - ltp.AD056
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1e9
      history:  > ⚠️  > ✅  
            
      - ltp.AD058
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1e7
      history:  > ⚠️  > ✅  
            
      - ltp.AD060
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f192
      history:  > ⚠️  > ✅  
            
      - ltp.AD062
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f190
      history:  > ⚠️  > ✅  
            
      - ltp.AD064
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f18e
      history:  > ⚠️  > ✅  
            
      - ltp.AD066
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f18c
      history:  > ⚠️  > ✅  
            
      - ltp.AD068
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f18a
      history:  > ⚠️  > ✅  
            
      - ltp.AD070
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f188
      history:  > ⚠️  > ✅  
            
      - ltp.AD072
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f186
      history:  > ⚠️  > ✅  
            
      - ltp.AD074
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f184
      history:  > ⚠️  > ✅  
            
      - ltp.AD076
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f182
      history:  > ⚠️  > ✅  
            
      - ltp.AD078
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f180
      history:  > ⚠️  > ✅  
            
      - ltp.AD080
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f17e
      history:  > ⚠️  > ✅  
            
      - ltp.AD082
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f17c
      history:  > ⚠️  > ✅  
            
      - ltp.AD084
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f17a
      history:  > ⚠️  > ✅  
            
      - ltp.AD086
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f178
      history:  > ⚠️  > ✅  
            
      - ltp.AD088
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f176
      history:  > ⚠️  > ✅  
            
      - ltp.AD090
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f174
      history:  > ⚠️  > ✅  
            
      - ltp.AD092
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f172
      history:  > ⚠️  > ✅  
            
      - ltp.AD094
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f170
      history:  > ⚠️  > ✅  
            
      - ltp.AD096
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f16e
      history:  > ⚠️  > ✅  
            
      - ltp.AD098
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f16c
      history:  > ⚠️  > ✅  
            
      - ltp.AD100
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f16a
      history:  > ⚠️  > ✅  
            
      - ltp.AD102
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f168
      history:  > ⚠️  > ✅  
            
      - ltp.AD104
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f166
      history:  > ⚠️  > ✅  
            
      - ltp.AD106
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f164
      history:  > ⚠️  > ✅  
            
      - ltp.AD108
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f162
      history:  > ⚠️  > ✅  
            
      - ltp.AD110
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f160
      history:  > ⚠️  > ✅  
            
      - ltp.AD112
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f15e
      history:  > ⚠️  > ✅  
            
      - ltp.AD114
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f15c
      history:  > ⚠️  > ✅  
            
      - ltp.AD116
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f15a
      history:  > ⚠️  > ✅  
            
      - ltp.AD118
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f158
      history:  > ⚠️  > ✅  
            
      - ltp.AD120
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f156
      history:  > ⚠️  > ✅  
            
      - ltp.AD122
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f154
      history:  > ⚠️  > ✅  
            
      - ltp.AD124
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f152
      history:  > ⚠️  > ✅  
            
      - ltp.AD126
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f150
      history:  > ⚠️  > ✅  
            
      - ltp.AD128
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f14e
      history:  > ⚠️  > ✅  
            
      - ltp.AD130
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f14c
      history:  > ⚠️  > ✅  
            
      - ltp.AD132
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f14a
      history:  > ⚠️  > ✅  
            
      - ltp.AD134
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f148
      history:  > ⚠️  > ✅  
            
      - ltp.AD136
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f146
      history:  > ⚠️  > ✅  
            
      - ltp.AD138
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f144
      history:  > ⚠️  > ✅  
            
      - ltp.AD140
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f142
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1000
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1e3
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1001
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1e2
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1002
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1e1
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1003
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1e0
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1004
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1df
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1005
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1de
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1006
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1dd
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1007
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1dc
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1008
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1db
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1009
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1da
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1010
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1d9
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1011
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1d8
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1012
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1d7
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1026
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1c9
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1027
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1c8
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1028
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1c7
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1029
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1c6
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1030
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1c5
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1031
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1c4
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1032
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1c3
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1033
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1c2
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1034
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1c1
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1035
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1c0
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1036
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1bf
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1037
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1be
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1038
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1bd
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1051
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1e6
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1052
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1b0
      history:  > ⚠️  > ✅  
            
      - ltp.ADS1053
      last run: https://d.kernelci.org/test/maestro:6b077511286e1965ecb9f1af
      history:  > ⚠️  > ✅  
            
      - ltp.aio01
      last run: https://d.kernelci.org/test/maestro:6b07729f286e1965ecb9e7fc
      history:  > ⚠️  > ✅  
            
      - ltp.aio02
      last run: https://d.kernelci.org/test/maestro:6b07729f286e1965ecb9e7fd
      history:  > ⚠️  > ✅  
            
      - ltp.ar_sh
      last run: https://d.kernelci.org/test/maestro:6b07749d286e1965ecb9f021
      history:  > ⚠️  > ✅  
            
      - ltp.cap_bounds
      last run: https://d.kernelci.org/test/maestro:6b07749d286e1965ecb9f026
      history:  > ⚠️  > ✅  
            
      - ltp.check_keepcaps01
      last run: https://d.kernelci.org/test/maestro:6b07749d286e1965ecb9f024
      history:  > ⚠️  > ✅  
            
      - ltp.check_keepcaps02
      last run: https://d.kernelci.org/test/maestro:6b07749d286e1965ecb9f023
      history:  > ⚠️  > ✅  
            
      - ltp.check_keepcaps03
      last run: https://d.kernelci.org/test/maestro:6b07749d286e1965ecb9f022
      history:  > ⚠️  > ✅  
            
      - ltp.file01_sh
      last run: https://d.kernelci.org/test/maestro:6b07749d286e1965ecb9f01d
      history:  > ⚠️  > ✅  
            
      - ltp.filecaps
      last run: https://d.kernelci.org/test/maestro:6b07749d286e1965ecb9f025
      history:  > ⚠️  > ✅  
            
      - ltp.ld01_sh
      last run: https://d.kernelci.org/test/maestro:6b07749d286e1965ecb9f020
      history:  > ⚠️  > ✅  
            
      - ltp.nm01_sh
      last run: https://d.kernelci.org/test/maestro:6b07749d286e1965ecb9f01e
      history:  > ⚠️  > ✅  
            
      - ltp.tar01_sh
      last run: https://d.kernelci.org/test/maestro:6b07749d286e1965ecb9f01c
      history:  > ⚠️  > ✅  
            
      - ltp.unzip01_sh
      last run: https://d.kernelci.org/test/maestro:6b07749d286e1965ecb9f01a
      history:  > ⚠️  > ✅  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6b0720d0286e1965ecb6f595
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6b072097286e1965ecb6eee3
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6b07423d286e1965ecb87f0a
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6b073e1e286e1965ecb86a65
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
