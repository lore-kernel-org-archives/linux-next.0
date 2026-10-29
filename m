Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793241022;
	b=sjqFzFXlDkUOD2tiVDGFRuK299dtv5Bd4m19Dz7jgYVtFTd1Zv4QJyjpatXHN3nm/Wu6
	 3i5nttBmg3OmO7eIikkESuJZ0pl2htm8aaGq+oDjm+e9zN0tZStNWlKUXOrerzotZ2uHR
	 HYUQjmGyRVA4//etINZEG1TPKrAtjBJcHhR77wqb339qB3dAW6eoJIdZJzBPZrdtXSSii
	 xT/BE7VmjDxy8BJENlBsxENnaJbYqythUHrb7JQTZkJMSdGWqNVHKzjMeGeCzBtpgdMES
	 pQ2q2GJfDwAUW1Ty+FkpAbE4a/8SbFMF5wIyYt08/C/N3FBRWvcOQdhS5mUYAFZy30w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793241022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=lRURtPOaB+l/ED4YPsebjSOZGpJRBzkvJlTF5dwc38A=;
	b=BCSp48RXVhKp8xJzGyJb0S8CtHrRGu0WS7AYJ1tjko1ipQF2rjoZvtWy+AUbw5xovTXB
	 KG23o64eE8o8T62diEEqZYHEMy9BB/CkJMHGDM9NXZ3u6sRaZrG2WjkASi1MrXwzYqVa0
	 6dFXg67e58ZPqLs2lfQ7Vks+4nm751CgeRZ6PYX2jnxXOfgccybNxhOrcoI21mxwaoX3o
	 7LX4Q0ISLzbSRZPK1LJZWALNS+PaarS7mVoAIe3eN4OTxOrJz+o0TFcKwoG5GBSSUAiTw
	 u4wRPbLZFcM0VCF8v6tMMM0bv7qybPTOrJMbYgAL0tgOnxsIAPJCUwwawvwBUv0gfhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=RR8opcYp;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9FF606A31E
	for <linux-next@vger.kernel.org>; Thu, 29 Oct 2026 02:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B9FF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=RR8opcYp
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35c76e9614aso2356274eec.0
        for <linux-next@vger.kernel.org>; Wed, 28 Oct 2026 19:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1793241020; x=1793845820; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lRURtPOaB+l/ED4YPsebjSOZGpJRBzkvJlTF5dwc38A=;
        b=RR8opcYpNfUur+twtaTrvmGOqItw8HEPrGnn663fLVEyBDGEA8H3KXxF0SLQyA1Dmy
         AMq6VWSF7dL/i1flP42jA6t4QfqIQ5RUAFuVGL2WDl1rGBqWGLDh9bVys3rdYQaaU65Y
         HKClCC5uxIaoog2vmDbOCRxfW1v3kxjYKWg+KfuOMtWn7yQKCd96nSqBaH9QjTnz64ge
         r4jRwMK5iDCMOobfEku/NAY86uA64UQ2OdmFzEBQemQv90WgDMFbmtH/g5sQ5IxgwXE4
         9g/6yM38sWD9RJwKcCTWuDJLXm+tlsd3ciDCw/fpOOnpr19EP0DmwmEd3gPA/Ze2zrVJ
         vYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793241020; x=1793845820;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRURtPOaB+l/ED4YPsebjSOZGpJRBzkvJlTF5dwc38A=;
        b=fNcLV+S6V7bcXTwFVP1xRX8FIieDESG+9xQ0+Fk5Hv7D2VO1/TqiGuCTTIu6skWK5m
         Wvnb6QRqJxBv65afxJwziKlvcSveg7vdeR9eCydV+49PjSO7yZJglJxAie9TSt1iHhtP
         B/TaxuEJhkZ1TR1ACMgOX4Bx6CVVbe0k6kzyUQ7PsxU+tIZfi16QB2D0JMEGjSW6dF3/
         JORshTGDiKl0f7sWc+zlp3rKWuibfnxJZUVkDuh2hiPFh5R1Lf4w+LUB4owShhhhEPQt
         n6cBjTj5jf34ywlS8rLH2o//jIhYsQbHS2An8Fcj00ibFlCvjHGmk2FTYu4+SONvg3bZ
         k3pQ==
X-Gm-Message-State: AFq9FYIcs3e4Nws5D6eY09tcaYRlUOgWhFTNwKCJR3/fH88DrJoWOtjU
	qxQImxM6A4i4g9UCQ+WQRBZUJ+y75fY04T8SHbDTb0S21ATmOfUJcQx/l32/TdqwYZBddpGko7S
	5TTEL
X-Gm-Gg: AYBFou1vG0A2h7jnakNXymGrV7r3jlXAawnaAdlpnq9ZSq/lpmZ3bsvVYBrotdYMYIi
	uV6BVCUmdoMzU9CDIxDH+bh+r3JBf1vMuU7KitIuc3bxLC9oVHl+7oMeMuylAAH5qhCdhB+vmcT
	Jd9BPdGsx+UpnYp8pXO+/0KaSCCHK6bsbHWw0rvfj6Bjb6SyVRMdfN026i4Sv3nvNsB/oFnM3q1
	VPm2he1cA90bh5V3+Gqart9TL2u77bPGUJZV/pVvYjUtu096/eHA35RcEOE9+KzDwlZ/tYddO+C
	2b8AAnU8TktRf2VlmNqAaQAY6bN1TnFqNLz7Ucny2ENQSYo2EdwUDmaUX638B9FfGB6uTSSol/A
	ZEMUhFgDX/pPkUdn2aT9Z/TwWqqSrjD96GfeExGyTV68HbEc64gVmk3hdWBNUvMEJz9HdITpkXi
	+DUKXpz5uUkprk54iVsMBFht9HfNtajqRkQ7AAy9iEa4x8RFiBZOg9PHpqsIzb2Z2XrwvwLze8e
	zShyIPXQdlH8reGmjZGYj4EAnVg8GKFRWXrKe4AxRnJn9lkBCGUT1e03BQtEr0OCFr1Ycnhlqpu
	d+6/Qa0hmJYYyWWwQeeHhCQqTi6DEswknyLiDI1lldQ=
X-Received: by 2002:a05:693c:415c:20b0:35f:2bc:82d3 with SMTP id 5a478bee46e88-36a203f17c6mr6199355eec.15.1793241019850;
        Wed, 28 Oct 2026 19:30:19 -0700 (PDT)
Received: from 4cb1f8191411 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm11684188eec.27.2026.10.28.19.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 19:30:19 -0700 (PDT)
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
Subject: [STATUS] next/master - 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 29 Oct 2026 02:30:19 -0000
Message-ID: <179324101869.62542.17101532952333251766@4cb1f8191411>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/6d0933ae9d46674a6ea63a87e9e9ab4e662670c9/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
origin: maestro
test start time: 2026-10-28 15:19:56.132000+00:00

Builds:	   72 ✅    1 ❌    0 ⚠️
Boots: 	  234 ✅   16 ❌    0 ⚠️
Tests: 	45354 ✅ 3709 ❌ 7516 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ae23afe5c0836a8c2f1daa0
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ae23afe5c0836a8c2f1da9b
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:6ae230e75c0836a8c2f0e484
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ae24ff56eff83db85beab40
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ae24ff56eff83db85beab3b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ae24ff56eff83db85beab9f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6ae24ffc6eff83db85beaef5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.nanosleep01
      last run: https://d.kernelci.org/test/maestro:6ae24ffc6eff83db85beae1c
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6ae24ffc6eff83db85beae6c
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - ltp.select02
      last run: https://d.kernelci.org/test/maestro:6ae24ffc6eff83db85beaef3
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6ae21d7a5c0836a8c2ef8476
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ae226f05c0836a8c2f0264c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ae23afe5c0836a8c2f1dae7
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ae227665c0836a8c2f02ec9
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ae227665c0836a8c2f02ec4
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ae227a25c0836a8c2f0363b
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ae21e4b5c0836a8c2ef8dbb
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ae21d915c0836a8c2ef8682
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ae21d915c0836a8c2ef8681
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ae21d915c0836a8c2ef8680
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6ae2348c5c0836a8c2f14a0d
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6ae21bc25c0836a8c2ef67c1
      history:  > ✅  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6ae22b055c0836a8c2f06ae3
      history:  > ✅  > ❌  > ❌  > ✅  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ae22afb5c0836a8c2f0648b
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ae22afd5c0836a8c2f066c7
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - ltp.statx07
      last run: https://d.kernelci.org/test/maestro:6ae22b025c0836a8c2f06a64
      history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ae24ff96eff83db85beac31
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.copy_file_range01
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb204
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.copy_file_range02
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb205
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6ae24ffc6eff83db85beadd6
      history:  > ✅  > ❌  > ❌  > ✅  > ❌  
            
      - ltp.io_uring01
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb210
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.io_uring02
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb211
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.io_uring03
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb212
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.memfd_create03
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb203
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.perf_event_open01
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb202
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.poll02
      last run: https://d.kernelci.org/test/maestro:6ae24ffc6eff83db85beae5f
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6ae24ffc6eff83db85beae6a
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ae24ffc6eff83db85beae5c
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
      - ltp.statx01
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb206
      history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
      - ltp.statx04
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb207
      history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
      - ltp.statx06
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb209
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.statx08
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb20b
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.statx09
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb20c
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.statx10
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb20d
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.statx11
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb20e
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.statx12
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb20f
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.writev03
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb1ff
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.writev05
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb200
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.writev06
      last run: https://d.kernelci.org/test/maestro:6ae250006eff83db85beb201
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ae236675c0836a8c2f18735
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ae236675c0836a8c2f18730
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ae239775c0836a8c2f1b648
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ae226ee5c0836a8c2f02570
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ae226ee5c0836a8c2f025bb
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ae226ee5c0836a8c2f025b3
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ae226ee5c0836a8c2f02613
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh_test_cgcore_proc_migration
      last run: https://d.kernelci.org/test/maestro:6ae226ee5c0836a8c2f025f1
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ae227665c0836a8c2f02f1d
      history:  > ⚠️  > ⚠️  > ❌  > ✅  > ⚠️  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ae227de5c0836a8c2f03bd3
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ae227a25c0836a8c2f035f3
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ae227a25c0836a8c2f035ee
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ae21f7c5c0836a8c2ef993b
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ae21e4b5c0836a8c2ef8dbe
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ae21d915c0836a8c2ef8683
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ae21e4c5c0836a8c2ef8e36
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: jetson-tx2-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ae2245a5c0836a8c2efc45b
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ae2529c6eff83db85bf0a03
      history:  > ❌  > ✅  > ✅  > ⚠️  > ⚠️  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
