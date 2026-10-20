Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463418;
	b=fEIHHxhEAh3RML0R0RQIYIPj2Z/AJM4jQFNkiGdaCyR91mLw2BdwvKsYXk9GdKZaiBMn
	 AApcJN+cTr+u267D83gayeWdrQV04EKfpB2f9+1GztTxSfgcbvWlkCyxhgz4Whkvavz1a
	 sbTWYCalM6L7Py662jZqm8b6cP6C8CD6r8isD9Q+LdtydauZYR5ADVDhjX/cntLJzo8bl
	 Kyc+a208Kd1fmcKjVp2rUqfQaVg5zW8UjA4qvErF1T9d3Vzm29uEOwVb8cTSKY2pct0aF
	 Hs2h7H7K/dsfYJqes9jczsCZQvN6T93v+r8tQFBBNAEYSvm6IEd7POZYsQDu6p6PMEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=on875nKZJBHk0SL2ZPNskSRQKtZcgoVismMJ2P49UNo=;
	b=Sq54rUm043dyybTmyc2vvO6K7y+n80YYYn0xC4a6YK6yfwcYnDHLHfRHX62uyrcT+d1Z
	 Uxh3lcDXRsE7xTrRd1vxk+7NVjt//qZJCdOnNEVWWBpBSmA73wmbu2YEqR3s/FOBgtCkO
	 LPOVeFKirr4w7w/kBEia8MXtKcK8uxFIEAlYM4E0kZaPlIQragDluxL4X/PmUKkI4viA/
	 y3w1djuPMLGUyQXbknFLstfzGo+VqBvQbK9MpmvQJNZLh7CPhvIRvdqAoh00EIMSlWOG8
	 4KIH7Pe+O27Gk59DDuJaymyqP0SGP9becNtiUVxk1OmmhQoLJIM5/4Hp5zS5rr0RTRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b="R02zK3w/";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016E3606A31A
	for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 02:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 016E3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=R02zK3w/
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so7241432eec.1
        for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792463417; x=1793068217; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=on875nKZJBHk0SL2ZPNskSRQKtZcgoVismMJ2P49UNo=;
        b=R02zK3w/RS2G/JgX+4XHJ7YBDew1Yr758dZeBYsSZ5+RQgXyn8jqbpX7218CaGQQI7
         yoxOjbV7TXBL8E15OUUQFEAAaeaQGJ7iX6siL2BN2Eqqypzz/bLFEDEne6qBMAFhZvh7
         to5EX4qkVUxRMKrcINvGHIQxLghs6C1++RZ9u2fzCD15E8zQuLz4gXuUp4lTXWHyfTPa
         8pLsOExxGRdjvN1l0wSPAKxRCW0T0BB/fSQhIHYkjSG1jZ3yg4QoirjUqVPUYMmkvWRc
         9x+7DEBqSV/EtdaNDpgjwJXBN6pNpwpJQCJtChV7IN4cTrqlbKg6E3skTCKsFtdHXLSO
         zUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792463417; x=1793068217;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=on875nKZJBHk0SL2ZPNskSRQKtZcgoVismMJ2P49UNo=;
        b=JEXyyRtFrEwWui5y7ISKOWhT/BMlN5WIGdwombEBgUf0n83fXdRk2ciGfpTVAENNWy
         9Vo/LsvR5THX6cRN7ju9ynU6oq/XeEpbf6BLdIsSIYb8CNobjsW9SpejFqKW2xtdPT3x
         BOI1jCwl7iZZ/IGi/DX+pbp495tdD4meZRS6L4Y2EhSWLtSQYMD8s7+Jpzsm/SaS4Toc
         w+dg5+ZiSOhgoCqGCxh4Fnvq4n0FQhFw7j7dsKX2A2S0FTXShfBIBAIfhrLO0LsRzqfk
         FCMX91cbtbWT/m0+0p+p3hll284VVpywlbr9uy8EtZgsUdsKImhLTquV/BPn4cuhEjac
         mwoA==
X-Gm-Message-State: AFq9FYJnQ4HzCvKLSF3cXH/4oWWFydtdugfcvoJVpltnWSxVZQiawo3A
	tUnhEqHSS2V0EDWNbsznkp3YRu6H2eWAdt9G0TgTWbrFP2CdLXDVZNHCipmBkAtyNEr2XgcSITF
	jH7pW
X-Gm-Gg: AYBFou1cwg9S4taWK1Up3kAvBhBrmwVQjJ84/pgUhEy242Kf3624Y/tTj4J6T7/hpe7
	YvwRdQwDvji0NtPTPMeTVfnWV5UhK1uFwhqeGf5mVyEnzepHrdJu82Cv8GOcmGQhifyTOFEMyDp
	ICT16AULDUVBDLfu77HeE59t8Fi+Vf6lFMFsuOZ3g5L38OLTGdMMLysVG2IOgnonO6mFWtsMzVU
	A3TSGu0hr0NfAsQWr37yg24CM3HvWJkZWknbGma3rEfGHhUUgHePTNqQz5GNmczJ5ytKYXl6Pb6
	ekguefOrkD/lkB9upfd3w41XHdyjclG3JpZMzikGiNOf5zS9zeRjOWKAWzLUJFmD9850Yr3Ivqb
	eO8/x+xjN3uIyQkq4YDbYHGFMsy7JMCIr3kwdsvx/dEfrrriHfmgQ4PsPZ39K4K5VIQxg+HiQab
	Umkk+EeWXTqn5trLzIZQ9c82i99I/cVkcN5NRfvAzX6EQ6/rXFQnFXLC9I0XOyvdM=
X-Received: by 2002:a05:701b:2319:b0:175:525c:90b4 with SMTP id a92af1059eb24-185125792bamr12532411c88.20.1792463416421;
        Mon, 19 Oct 2026 19:30:16 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37898085c88.0.2026.10.19.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:30:15 -0700 (PDT)
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
Subject: [STATUS] next/master - 3d229ce89862b8e82d71a9e11d6f840ca272a6d6
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 20 Oct 2026 02:30:15 -0000
Message-ID: <179246341515.172554.16750654420234694100@6e52bff8000c>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3d229ce89862b8e82d71a9e11d6f840ca272a6d6/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3d229ce89862b8e82d71a9e11d6f840ca272a6d6
origin: maestro
test start time: 2026-10-19 18:47:47.662000+00:00

Builds:	   59 ✅   17 ❌    0 ⚠️
Boots: 	   73 ✅    0 ❌    0 ⚠️
Tests: 	23037 ✅ 2418 ❌ 1472 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ad67b0755fda50760441be2
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ad67b0755fda50760441be1
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ad67bd655fda507604421a9
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad6785955fda5076043ec99
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ad68e8f55fda50760452e43
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1416
      last run: https://d.kernelci.org/test/maestro:6ad67b0755fda50760441be8
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.dirtyc0w_shmem
      last run: https://d.kernelci.org/test/maestro:6ad68e8e55fda50760452bc7
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6ad68e8f55fda50760452fd0
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.shmctl05
      last run: https://d.kernelci.org/test/maestro:6ad68e8f55fda50760452e0b
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_timer_10017000
      last run: https://d.kernelci.org/test/maestro:6ad679d955fda5076044049f
      history:  > ⚠️  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_timer_10017000
      last run: https://d.kernelci.org/test/maestro:6ad679be55fda5076043ff28
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ad67bcf55fda5076044212e
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ad67bcf55fda5076044212d
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ad67bcf55fda5076044212b
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ad67c0255fda5076044272d
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6ad67b0755fda50760441be7
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad67a2255fda50760440d75
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            

### NEW BUILD ISSUES
- Issue: maestro:071b2289158603096de587bfcd71b040198dd84e | version: 1
  Build: maestro:6ad6681855fda5076042c9b5
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5178:3: error: call to undeclared function 'scx_reenq_wait_dispatching'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration] in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 20:07:08.658486+00:00
  Culprit: code
- Issue: maestro:071b2289158603096de587bfcd71b040198dd84e | version: 1
  Build: maestro:6ad6682355fda5076042ca4a
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5178:3: error: call to undeclared function 'scx_reenq_wait_dispatching'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration] in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 20:07:08.658486+00:00
  Culprit: code
- Issue: maestro:73852e14f70c4fa20c57f8f41ccbe2bc6342d96b | version: 1
  Build: maestro:6ad6683655fda5076042cad6
  Comment: kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:41:17.560332+00:00
  Culprit: code
- Issue: maestro:ffbd67ed9d45c04ccbd3e5f32cf5904fb2ddb780 | version: 1
  Build: maestro:6ad6685855fda5076042cbc6
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:50:21.854570+00:00
  Culprit: code
- Issue: maestro:ffbd67ed9d45c04ccbd3e5f32cf5904fb2ddb780 | version: 1
  Build: maestro:6ad6685955fda5076042cbd0
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:50:21.854570+00:00
  Culprit: code
- Issue: maestro:ffbd67ed9d45c04ccbd3e5f32cf5904fb2ddb780 | version: 1
  Build: maestro:6ad6685c55fda5076042cbde
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:50:21.854570+00:00
  Culprit: code
- Issue: maestro:ffbd67ed9d45c04ccbd3e5f32cf5904fb2ddb780 | version: 1
  Build: maestro:6ad6685e55fda5076042cbe4
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:50:21.854570+00:00
  Culprit: code
- Issue: maestro:ffbd67ed9d45c04ccbd3e5f32cf5904fb2ddb780 | version: 1
  Build: maestro:6ad6685f55fda5076042cbe7
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:50:21.854570+00:00
  Culprit: code
- Issue: maestro:0b3c665aa5978c471800ab879201d48f07e28d7b | version: 1
  Build: maestro:6ad6684855fda5076042cb7d
  Comment: kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:29:57.288007+00:00
  Culprit: code
- Issue: maestro:7ed368722038f8a902f4a6da878dc48b8ba88c66 | version: 1
  Build: maestro:6ad6683155fda5076042caba
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:54:52.398199+00:00
  Culprit: code
- Issue: maestro:7ed368722038f8a902f4a6da878dc48b8ba88c66 | version: 1
  Build: maestro:6ad6683255fda5076042cabd
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:54:52.398199+00:00
  Culprit: code
- Issue: maestro:7ed368722038f8a902f4a6da878dc48b8ba88c66 | version: 1
  Build: maestro:6ad6683855fda5076042cb1e
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:54:52.398199+00:00
  Culprit: code
- Issue: maestro:7ed368722038f8a902f4a6da878dc48b8ba88c66 | version: 1
  Build: maestro:6ad6683d55fda5076042cb35
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:54:52.398199+00:00
  Culprit: code
- Issue: maestro:7ed368722038f8a902f4a6da878dc48b8ba88c66 | version: 1
  Build: maestro:6ad6683e55fda5076042cb38
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:54:52.398199+00:00
  Culprit: code
- Issue: maestro:7ed368722038f8a902f4a6da878dc48b8ba88c66 | version: 1
  Build: maestro:6ad6684155fda5076042cb41
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:54:52.398199+00:00
  Culprit: code
- Issue: maestro:7ed368722038f8a902f4a6da878dc48b8ba88c66 | version: 1
  Build: maestro:6ad6684255fda5076042cb62
  Comment: /tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-10-19 19:54:52.398199+00:00
  Culprit: code

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
