Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40A02F9D82
	for <linux-next@vger.kernel.org>; Sat, 22 Aug 2026 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787365833; cv=none; b=GyWnJEIm4LBwdso82YgdkAkJcG2raqO+fNaqtumNlrbeqaViIO2PyYc4gHQvznzhFxbMtFoD0lUhpvAbYGMEt4A9xsMsCwOtgPJhSc/6MBD4dyD3tDVZz7s+0gBKQzJYv4thPbl90yQFzYEhr0OlK6XkaKHNEsMoHDCjY5DG9IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787365833; c=relaxed/simple;
	bh=VfTpDiFbp08CskmmmNqzkJPbDEhgm62pN0GWxMhfAaw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=p9qrd+3gWs/cz6FLK2MDGbOiMsUTK6ulWER6oRhToTOYQg7w2Tt36ujLO9C7qT2piIEy8SjxrpRyPIDTdwTUQe5pi4P6BQos/VTCkaC5qhgvyfeT8x0kb1mewtUHr/THaE398M4+ratkJpo4E4U03HovWczn+Abk67GHk5Hueog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=DvaXM5ce; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="DvaXM5ce"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1953910a91.2
        for <linux-next@vger.kernel.org>; Fri, 21 Aug 2026 19:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787365831; x=1787970631; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tIR4+7fUBkYfDrGPDUNyNym1MuaxJFT5HUWEDLpztk8=;
        b=DvaXM5cenLzdCt6WT0EUY1WwWDosbOYlaYQoboPVWYaLtWcbqZEntCQ+gPWkKrUAtm
         A6vApoxDApJFZTBjQ23FKcydLKjWwfE4hYKeSoVu+8NDhc8Vcxlh9weI+4dS3xGHc3Wp
         MO7kiaFQMSJrXUIG/aB3u/nAP5aE4Oo3+NTNa/9Gm2K7dEPlbS2xp4oqcI/Vlq24QFM9
         zbsfR5AxN1bx5rz0xP6b9x+Y+Q/BILQQUf0uYEpuPUxsJlHxcnvOVntBjl0qZ5neEh2S
         HCEpSBUebwMrKL1bg3RxFzRirgti3FVPad7r0zx+VntXQco1UTR/MmuGycLGwmpILhDD
         UMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787365831; x=1787970631;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tIR4+7fUBkYfDrGPDUNyNym1MuaxJFT5HUWEDLpztk8=;
        b=Ej5tKWnkLhTWHViVwBEmJMXT/NLVJdjqQgqPCJZ69DY0sDVHw2pLfheIj04+lSKnbo
         g8ya7DfiO9hsscVrLziF2KXD6Nzoo2SsgoAoGgBpsj7Ep25/pIPYaaZHD7VnMiUvBeMS
         FxMf+W6Z3Jese94JYJxLkkcNDGkj7cZODle4JRgOyFH+kkOyMkSn8sYgO5vd/3A9b8B0
         McT4EDECRADP2ku7cjmX95DBnjYdgy11IbuaXNK40DF2Q6i6bHSdmioHxlGcbEDPJJHF
         LDPPfHPrmUY4T3Bi1KMx7tK1jzrD+3hq+j1FMvu8OIk+t8O1NTZ/sm0LRBm1Fj2YUoAM
         QcaQ==
X-Gm-Message-State: AFuF++mWCIgGy3x0IyUE3gUQnHwJTE7X/TCmiQAiMaRPdSxmDHPnzsvO
	gBzuJMga+TFhEhqMlwZyG1AHylmu9Md60XT5YHGxPGGdP8vSHsDEtqW0sMKjXbNjX4LwgSpB189
	HAeRj
X-Gm-Gg: AR+sD12JxRgRx6mmU8teK3MMhPHeqh3czPH27uTf4m8jkRyAKT1WDEU6r+aNUfj1YcV
	rlBxkp+gGMMMDWLurbAXTFTBS8bcC0t2zM/mZfMPwar2BI9spY4RBYaFPh0m7MkZdNOUkz41chn
	xHv6o5yUCuBOPgWKyMOCu+jujBoyB+SIRgDggKS0mhNR3qxezMuJp++Drd0Ggyv8TPDzuYuSWIC
	gMcq8XiKoq/18h8tbcZ51pkNopN881DkJcfL+yVdTAHB6Q2nUxlb2qzuC/88NIGr/4V0pxon5BW
	rzh710mNzy3fidOXHuBOucoTUU4U7ubulZCFoA6TdlJCF5GFiZkrb6x6tSpBRyYcWef08BBVLKp
	1sbDrfIHJkWhoLDTItbZ1pYXjWb/ZKlBG3qHDr6rxlieZBDHtJTVaMWyUKaCMYNyhXIrFxt8kST
	trihhC390ZGJzVzMe409iPLQYPmoT+8NeCG473gx5emu+YLFadtrRS
X-Received: by 2002:a05:6a21:3a45:b0:3cc:fb7d:a9ab with SMTP id adf61e73a8af0-3cd4b9ea5famr5978041637.2.1787365830896;
        Fri, 21 Aug 2026 19:30:30 -0700 (PDT)
Received: from b455de3d9de8 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f922ac7bsm1113284eec.25.2026.08.21.19.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 19:30:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 903c1cf6dff9964e71eda98a39e2e5d442050472
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 22 Aug 2026 02:30:30 -0000
Message-ID: <178736582972.1496.3776941259981606054@b455de3d9de8>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/903c1cf6dff9964e71eda98a39e2e5d442050472/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 903c1cf6dff9964e71eda98a39e2e5d442050472
origin: maestro
test start time: 2026-08-21 15:24:40.384000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  148 ✅    7 ❌    0 ⚠️
Tests: 	23349 ✅ 4299 ❌ 1508 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_verdinwm8904_21
      last run: https://d.kernelci.org/test/maestro:6a88940d62f33761c0fe470c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_verdinwm8904_21
      last run: https://d.kernelci.org/test/maestro:6a88940d62f33761c0fe470b
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a88803862f33761c0fd8fa6
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:6a88936f62f33761c0fe417b
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
