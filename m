Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154619;
	b=L4v5AO8shdWmpD9KgzF6pRkBDrycmQztV2cY5jxgnfGSjs2mbvPtficg6DZJogyg5jhS
	 l9JP2/xG8qAnIbW+s2CwMUXamTefcu9mXSOslu+hsQ0MtXMIJXuCzJji8pA7rKL4yzH+c
	 PWPVPC7a9SSmIms8B4yS+gaTvEZvLGuL/OVFeW3YPnDxCzEIuB3G1K4Dv5Lhr2yRDflHU
	 psghGZ6NCdWob+s/R5ie+9bryJnfgWdQKe0+UvfaAesFBiVx/Nrq6dZmQZrzly/wug7N4
	 ox1vcX7UwMK6v1WlyxDp063rLbbzfT1kYh9RwudLG7noHfk7q4udE63mf85t3gCLGVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=7N3X7LxHYC1VbPCqOnIa00UJj5se9PB0+1GTFi5xOEc=;
	b=L3jcNSnHrNSdZ1sR1dwPV8bt6/m2qOXjOKn+vtwxgQtmKSREEDyNCfHOiGJta+4jgbUf
	 ny4h+b5xckXR0DCTJy0cew0hIQNGQCdo6/tvtn+IVM3qFZO5zIwp47oGsK7x6BDmrGBy4
	 h99JLhO0O3k8+5wnmps0IYUgBFK8I8nvtgdcMuoYiFFrwrxNB/biNtt/It7pv82hzw805
	 3/v4GVjxhA+zG8VAIkTCOth5YIXi+f38/oHGhwabBKD8fEm2BlG+SkYi5U04mb/9tJxKf
	 oHkYOG2D1COPjDtFsBGYYRvz5/tiehMC9pF3se3fIo3UGRScW4ojOdZRwnBe7xxBSlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=OKwWSIBQ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA4D606A31A
	for <linux-next@vger.kernel.org>; Wed, 28 Oct 2026 02:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA4D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=OKwWSIBQ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso869720eec.0
        for <linux-next@vger.kernel.org>; Tue, 27 Oct 2026 19:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1793154617; x=1793759417; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7N3X7LxHYC1VbPCqOnIa00UJj5se9PB0+1GTFi5xOEc=;
        b=OKwWSIBQb+zH37WXLfiovJrsLREgqB1tebDqoaPM962/ph9wCjUscetzp7UNEBbAkQ
         cSEvRkmzpt5eX6+zBHVbI89yFyci0kmKHLM1vDZieOXYX3dXjZIvVDHrYNsYmHD52z+d
         cX6ku9JmY44cO8aSFmQdxP6wOcoPst+eDY9Ctlm0cnEbBMicMYHIJT/8o0NIPJKDxQps
         j7HvWiEoc/N5Vxi2urtVynuxZfQ91ZRvq7Y871l7uuKXo5qjnIHcsSYYpiZYgJcEw9gz
         dWzEy70XF6mrHMsaJ/Xnez6Pv7cxxLp3e9W3V2HBHrxJHKEDM3aZtf31Alu7/yJQjzb9
         ftdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154617; x=1793759417;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7N3X7LxHYC1VbPCqOnIa00UJj5se9PB0+1GTFi5xOEc=;
        b=FqxGCwTv1GS8+9Tbv+BdFd2eRYsgU5R5J1epmvl6wY8JEzMF5pwIx6tsNDbFONEwV6
         e7sfRZ5JySdEEBggXh1us27l7S+N7+HFzCx5ZN6Vs4DhfAx1X0W6+Q4i1kUJ+uEpE7ph
         QyJ8Q2AruT4zNDjvjaoJjy8KRLnCJ85eaRE0FCjDSCMlIftHsVBmjRTNwd5/v2NnhflN
         uLhZiSLkGfY+GIxTAMlkBPxcPnp66a9b7IoFmuugGG6IbkIOklIrFj+HOfKP/nrjqeyx
         7h7JDiLcWz5sx0/bb1d4iUv8uINZBe6GvyNMFAxRNUgDXmzbD/J0RJEK25AL+5wU/cXu
         m6BA==
X-Gm-Message-State: AFq9FYK1p3+odKuurkhJXtqP8/aDL8HKqDWSONq2aUB/U5MbN9GvDHv7
	EyABo+OxqboZ23E6a7CMKommzz4OIqR8JiEYfynDYbOt10NixN+/KSRF2MiySOd3uKRUYaQ39az
	2Z2Yl
X-Gm-Gg: AYBFou2t4UPHatg9q6QaB19w0uYu4rDunf0+AjFO0JGouAs9H7zT+FDQNonwHxe1gpR
	PHY7UpbRbS5MUb4Wc3giOF6CoQpGJLszWvY6TxSbv5DcnUZBhPankffsXmzUhxo6KfDxszdj/sr
	9hQU2VrF/nYdsXv+2h4yyNTY+d/bzu6AhtCF1I72/UlXXfjM5OuUY7+O9Ln6MaUA5XU0XRh8H7h
	S2xbxdd4Ly+Mee8Yjt/viOfNB/SrIKlXTraEbHHD3aBZjoWpZBiSJeYKbaVy4u+702O0f0R9yRX
	6tsxvtVZWJSocp/gA/SQ09UDI/Nw5I9jVW6tFaKaCSaVHCizx6JD7VZKuCNYUTeEPwuQpRUCulB
	uFHcSct8gAm+vSTMd/n1QEM0nO14sqRQvtNcmyD6U3KWwIBRPMd+zBislp6JCssgqnBjNSwUTDS
	TwVe7HoClnOJnt3oslUhtjRLnaYZ8dhEFg6vET0p8Dtc8kDhHKV5lyLMHOJHY+j7qgK0YE3dqLD
	2O2UTbKlH+Lc6vJrja02kb+88adokHvAN0cbb8q9hwXusAr2zg/c1PBgQVHIUssn1Egp6n49vTp
	VUB3j5D1GJimU/oNcrLF9w==
X-Received: by 2002:a05:7300:559e:b0:369:ec31:8fd5 with SMTP id 5a478bee46e88-36a1ffc5706mr1710186eec.3.1793154616998;
        Tue, 27 Oct 2026 19:30:16 -0700 (PDT)
Received: from 4cb1f8191411 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908542sm1267504eec.10.2026.10.27.19.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:30:16 -0700 (PDT)
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
Subject: [STATUS] next/master - 151a134a4e6ec66f69db8750c66006f5207f7a9d
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 28 Oct 2026 02:30:16 -0000
Message-ID: <179315461581.9207.4008229768981540367@4cb1f8191411>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/151a134a4e6ec66f69db8750c66006f5207f7a9d/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 151a134a4e6ec66f69db8750c66006f5207f7a9d
origin: maestro
test start time: 2026-10-27 15:03:27.359000+00:00

Builds:	   72 ✅    1 ❌    0 ⚠️
Boots: 	  166 ✅   11 ❌    0 ⚠️
Tests: 	39059 ✅ 3294 ❌ 4625 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.acct
      last run: https://d.kernelci.org/test/maestro:6ae0c4a655fda50760954232
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ae0cbe355fda5076095d69e
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ae118a055fda507609879ff
      history:  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ae0c5c755fda50760954bfe
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ae0cbda55fda5076095d5eb
      history:  > ❌  > ❌  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.clock_nanosleep02
      last run: https://d.kernelci.org/test/maestro:6ae0f53055fda507609700a1
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.nanosleep01
      last run: https://d.kernelci.org/test/maestro:6ae0f53255fda507609701ae
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.select02
      last run: https://d.kernelci.org/test/maestro:6ae0f53255fda50760970286
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ae0e6c255fda507609687d6
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ae0d3dd55fda50760962399
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ae0d3dd55fda50760962394
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-tx1-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ae0d1c155fda5076096179d
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ae0d10d55fda50760961285
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ae0d41955fda5076096256c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ae0d41955fda50760962508
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_ptrace
      last run: https://d.kernelci.org/test/maestro:6ae0d41955fda507609624fd
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6ae0c80c55fda50760956b87
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6ae0d70f55fda50760963c46
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ae0d70555fda507609635e1
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ae0d70855fda5076096380d
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
      - ltp.statx07
      last run: https://d.kernelci.org/test/maestro:6ae0d70c55fda50760963bc7
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ae0c87d55fda50760956fd4
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test_default_time7_sun50ia64audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6ae0da9755fda50760964fad
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ae0cbe355fda5076095d6a0
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ae0cc8855fda5076095db6c
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ae0f52c55fda5076096ff7f
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ae0f53055fda5076096ffcb
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.copy_file_range01
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705ab
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.copy_file_range02
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705ac
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6ae0f53255fda5076097016b
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - ltp.io_uring01
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705b7
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.io_uring02
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705b8
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.io_uring03
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705b9
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.memfd_create03
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705aa
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.perf_event_open01
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705a9
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.poll02
      last run: https://d.kernelci.org/test/maestro:6ae0f53255fda507609701ea
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6ae0f53255fda507609701f1
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6ae0f53255fda507609701fd
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ae0f53255fda507609701f2
      history:  > ❌  > ❌  > ✅  > ❌  > ✅  
            
      - ltp.statx01
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705ad
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - ltp.statx04
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705ae
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - ltp.statx06
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705b0
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.statx08
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705b2
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.statx09
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705b3
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.statx10
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705b4
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.statx11
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705b5
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.statx12
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705b6
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.writev03
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705a6
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.writev05
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705a7
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.writev06
      last run: https://d.kernelci.org/test/maestro:6ae0f53655fda507609705a8
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ae0f83655fda507609718d3
      history:  > ❌  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ae0f83655fda507609718ce
      history:  > ❌  > ❌  > ✅  > ❌  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ae1133155fda50760984a60
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ae0d1c155fda507609616db
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ae0d1c155fda50760961703
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ae0d1c155fda507609616fe
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ae0d1c155fda50760961744
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh_test_cgcore_proc_migration
      last run: https://d.kernelci.org/test/maestro:6ae0d1c155fda50760961722
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6ae0cac955fda5076095c232
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ae0d1c455fda507609617c5
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ae0e6c255fda50760968783
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ae0e6c255fda5076096877e
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ae0d3dd55fda507609623ed
      history:  > ❌  > ⚠️  > ⚠️  > ❌  > ✅  
            
Hardware: jetson-tx2-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ae0d2ed55fda50760961f64
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ae0d10d55fda50760961352
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ae0d41955fda50760962518
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ae0d41955fda50760962513
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
