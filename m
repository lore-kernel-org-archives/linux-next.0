Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573820;
	b=lzRO7C45t8ZhxnlsJrJhkFkD8rwXFw6/JtB0Ov1UMyxeJXQn84fCjeNf1gNXu6yXBOSa
	 b0xsEp9DgekRaX+eq9jYfeRhTC792lbR+lSDHno/xw2ZdRt23AN2fKfmtpZQPIS6CXnOc
	 KNuUZXVFISi0zxAZz6BBLo9PjVOC/85aKIWH2hxyoR12MRgXBPoCE1dsR5ESAdzrz3kok
	 GkHeckAH9ICEh2PP95iV+O7n5e+MKhk6/zrXe7T/cwmZr8DXNE5cg7es0mymt2ZIo+b0G
	 WzLB9kwZ1p1I8M0cGPzad8YbtoNO3XQrzug5XcAfzP58RDoRg3X9qK1KS96u8OfZ12Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=A5WnWTDzcqANS1dnGi1WKih+jnEwG9AbRq+ZtV8e2kM=;
	b=2tzS7b6ln+sjfbEAhwFTIBk1LIrQDss3UbtaLWEJZVOlVaocFgbpvrKMGdhCO6Uub2g9
	 aQ6lps0rBBxt6vh0dMLM3CQfF5/mB3ajPNHMTFsdFaz6tz0gvenyQmmCBxupUA2H+R7FQ
	 AZBpD8aJhO1H8J2TfmFR/nOtQnLPE/NOByPO8dGnwUme/wGtZzbUq+kMntPtRBnFZzWLG
	 NVEOrwjcwlvIBCCW8waITAoZOg641Piw49/nchs7swjynUjT7rzkuiJFORgzNtGN+Zghi
	 0FkuEx5M7T+a+oUsMPixiYuahtNGY3mpRIijkG4jEeQXaPGTHMINZzd81lhhx94doWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=NG3uD1Bf;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C43B606A31E
	for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 02:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C43B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=NG3uD1Bf
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b5786e099cso3364625c88.0
        for <linux-next@vger.kernel.org>; Tue, 24 Nov 2026 18:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795573818; x=1796178618; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A5WnWTDzcqANS1dnGi1WKih+jnEwG9AbRq+ZtV8e2kM=;
        b=NG3uD1BfL4QzmhY57Zj5Hd7qljBqBmtUKdE66+VyRXY8fcR2gfhM3EuPw6AVwFQkzw
         7svHJQOfsOOPCnHJ+R4xxgkkwltZUACS/X5oWsrzpduaHNfGjQz5TNRJbn2vCQb0Lbf+
         wI/szxvHR31jHfAqbSB+G3X2K9enx4EwoeHD7LFU2Fokeq3Iabd4fgqAuBO+NNXKgO0H
         as51MyNZvd4X8rfVxoAacyN9mWBD6seR1hAd34seWteREzBMP8tb+oiroqabE0cmGGjX
         npVKIQGdB03ozqxwJaElUYSx4io+ypL6St3pyZEDX0XG9PpajK912rgJc1NF9SaggoAg
         +9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573818; x=1796178618;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5WnWTDzcqANS1dnGi1WKih+jnEwG9AbRq+ZtV8e2kM=;
        b=IIvJr9frBKIIkEKeuzfTesA53iwPpp4eoz4kK5LE/GW+K7p3+KiIo0O+mwlQuF5zdo
         0y5OI8opgJ6KJ/E9Ns56sYu3STSOftmifzLKqImC8DJ7SlYYBWHYHy1zn1A6xduRCp4e
         ZBaEl7XYXUrjGybuMagt3YzJLwvKQYJC2xV1NrTFI99MBatZpR3rSwR59lnEy37rIVig
         6a+xo1cKOGoKtlGDVEDVoGaz6Gvk22e+8hDo2mvzCKGwiRqsLt168k/6j9LDPsgV8QbA
         yEfwwjYHVl51unEsh5M+xd6jXb8ETLbLwtArlKvTd54IQwotZFCnQ1LliwfrB6xG/a1a
         rOAg==
X-Gm-Message-State: APuU4Z+8HpTMZ1yhInAytDS95VdNEV8/NEIumadC/n1kvBolHlGzhD52
	/HQyxnqF6VnuUGrXzKi7WWYc8/P7xFK+z2fT74BoGGiLmoiwLFwv3tFo+Elt3F7IPOC82Bc+3c8
	S12aL
X-Gm-Gg: AZFdTZde3lOAWQQhx9c5up4BGZ6BeNGjz0uEoPoYfqkrl+QaIWrm6shcRQvqmRNyo0M
	YJRZ6nRs94mLnhoTB3cHgNidUiY/abidrCiZaMqlQ+LpyTp2gnDUBazb1XuvN7HaQaqaX0VfhYm
	G0LpDHLWV9c2St2CSXzexk0Gl5CVM+9aJzlBHRyb/HdYFKbQMpiRDg+83Njdw1JnJXk7JGyFHw4
	0Sp+cA//VoioBSdm9W8Ldvl4K4NU4FF3G107ryNa7cMnRwjSt/BTJsjviy9BL1VbDTXUqi/062H
	mT3CSp81UI0BT231p8KyFGmVvYODaH7DCGcTvKl2FiYnZI43TZrQHfw2/LWftSaYwpQ1d7unyLP
	p+JyKrcehmmOD2HHX/jg7AmZL9U7812rjBodqqgXDGQG+qPXN7t4GthnR5St+Zqe76RA3Ag8/mx
	BZIz6TzVF4mzxPKYw7SxX8ia49EUQeBB+ESvWIDTWiIl+QjySSRjzAdWmjAKFRjaeUrUd/XQFNG
	ON+5OdGZJurZN9r73eX+KULMNamZPQWMz/5bzR5WjAglQWMHTVFJL8PnnqHKbfI1nkIx9Hy2Dm/
	DBiPFr6HrzKSaRm81ObV1Q==
X-Received: by 2002:a05:701b:4306:20b0:1b2:4c54:d976 with SMTP id a92af1059eb24-1b55ff0e104mr14057295c88.31.1795573818182;
        Tue, 24 Nov 2026 18:30:18 -0800 (PST)
Received: from 52d83ede7c60 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm43549946c88.13.2026.11.24.18.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:30:16 -0800 (PST)
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
Subject: [STATUS] next/master - 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 25 Nov 2026 02:30:16 -0000
Message-ID: <179557381611.73801.12576648939463775141@52d83ede7c60>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3dd8c790a7b7027abdd568e36db5e82ffaea7c77/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
origin: maestro
test start time: 2026-11-24 19:41:44.815000+00:00

Builds:	   76 ✅    1 ❌    0 ⚠️
Boots: 	  218 ✅   21 ❌    0 ⚠️
Tests: 	36664 ✅ 2111 ❌ 4174 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hamoa-crd
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ftrace.ftrace_ftracetest-ktap_event_trigger___test_poll_wait_on_histogram
      last run: https://d.kernelci.org/test/maestro:6b0630a399c74e1a99c7c0ac
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6b05fe1399c74e1a99c65e07
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6b05fe1399c74e1a99c65e0a
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6b05fe1399c74e1a99c65e01
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6b06147599c74e1a99c732fb
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6b06208c99c74e1a99c773dc
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6b061d3199c74e1a99c76df9
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6b0608bc99c74e1a99c6d5a1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6b0621ad99c74e1a99c774be
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mahua-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000
      last run: https://d.kernelci.org/test/maestro:6b06451699c74e1a99c81d04
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6b06451699c74e1a99c81d02
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:6b05f42599c74e1a99c5ac63
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6b061b7499c74e1a99c766fb
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000
      last run: https://d.kernelci.org/test/maestro:6b06147499c74e1a99c732b6
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6b06147499c74e1a99c732b4
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6b06147499c74e1a99c732b3
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6b06087799c74e1a99c6cda7
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6b0608e999c74e1a99c6d668
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6b0608ea99c74e1a99c6d66c
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6b061b0799c74e1a99c76442
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
