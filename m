Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794882646;
	b=iMRx1IX61Rk9VB9I2IpWpbO0LNIHThQfQmv9uuGq9NfzhS3AQ6n0BJDcCYv3+SBJNy9z
	 e9+a1Cbe/nzV9FQEb+OVbh1TDwxcjPRjprrmIjk1mFqOsU0nJ9d9XcES+REGoe/OoItec
	 SMPxAckEefiYCkuqmAiKM6GRxD+gpt71zOM69VfWJDu5gevkkka6hKU9JvKmy6jnUfeEX
	 iEg0dYjrBKe7ZO8eTnQxySmpxz4ks7rUVxuy2m1oXpCkYiqtVuTq7XI5oIqNGzeV5aLWj
	 CwX8Ab6woyd9BN2qsf8ecnwz16OUx9QjW1I1xEBCL6650g36kZKrQG0/zCH1w/WAs8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=MDTsBMNL4005uf+LDkMV5ZTAH4JQ7d65Ke70SrzU6vQ=;
	b=neh2GmcjcSO2wIoUzeOcI7SjBtxW/cEGWDxercJB3ZbRsYOoT/aX741rNhvyHEY/DDod
	 clIOrKlMReX9NDcfc14J9JiqB1Xt8LrYk2nX9WHshkfTm5UcGCpyT0py6VDLRdYqQ/Vex
	 0/PrwFwPN6luMS8qAzfiXFqZXvhRCD3+QLNmP8IbVQYMhIrsvsygSGMgCbpZ3j0LcUgWg
	 9V0MgXkuUPV/+tD44VkzdUVBAihrYbkW8g6XxL4Pfia/NtHcajDMfAZEkSC/38rgf/aXj
	 K0kNEkWpKujAdW3arMvT0ymr8S4X8NjO7F03euPYO913nuMvut18k+o2QTnx7i2j8Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b="MX/WF38s";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BAD606A32A
	for <linux-next@vger.kernel.org>; Tue, 17 Nov 2026 02:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70BAD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=MX/WF38s
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so6483035c88.0
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 18:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1794882644; x=1795487444; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MDTsBMNL4005uf+LDkMV5ZTAH4JQ7d65Ke70SrzU6vQ=;
        b=MX/WF38sHnUpIbBsk0d4YRXGvgMQLuBgZfF543U18ci1a58OweNIHm5GcTu4EeiJpX
         2f5Ly/pNa/hhq/ZpwBHsM7oiG9jqu6ZfJNH8KngkBuq9vy0+EJlwuaK8ueYOv09LRbpw
         AxHpvZmQSZJHs0wEkEg+PXzznhhde28NeubU1JUNblrZ7qKxuX9eBU+bQpp+FmDIkOfD
         Ll4TzW4NBxfO7ydarn6QTpYUUh1Wd7MRzxlylUEH897ycuA87XKXujRIJ9t0e2U9EkAP
         upxePdV8RjireONK6ZvLDTPhRn6J8oxhjqMVQnJbPw0MKjAmTYYNb/JyAG/QpqytUuq7
         US1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794882644; x=1795487444;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDTsBMNL4005uf+LDkMV5ZTAH4JQ7d65Ke70SrzU6vQ=;
        b=KrvFfK6UpkikRMPK4GEzF05lLd7baKALwS6MV3n442z+aBX7qfZHR8HYgZrBlZxZBm
         6qM9LTULcaqfkgbJVgoVJ8cvkCVy7DPwjdVpjZQNVTnz23uDdIpLgGmoApJz0BMAXBcc
         wZsFzpTiQKMJ9Leosfrg6EuaVGbSYQePvqLA4bfzHKhuAL99k6ws1eFpQYSFUvWC6HZx
         P7wEqSDzGA2XaDe2lmjvoHM2iyNfBipVVt4hzgfOpmJHpfX4iGD8DdRHHm+aT4DHya9D
         qj4RJQ5+8jR/u+pDIkXPSP9v5Nkivjdj59CIGJKsrxlhgMBONUbeYJvWUk32RfgqZ7BZ
         zZRQ==
X-Gm-Message-State: APuU4Z+tsM6xlZeoWsfquAPrl2HFTEWNDNoyq2jW/uPaOnVTDEThDxAf
	jHQPa4EkAAc/4Y7MUjqwagSfw1nAK5zZ0tP/tmeb3uUePRXI1DmLV4Opk+0aSg7Ptno5DIK/b/4
	xUiFL
X-Gm-Gg: AZFdTZccgiDsU26jzxr+IjY4tAMYVR8u2n2O4eD7LBhTggHXCIL2GSiWVa4WzK4Cc6n
	RuGerGaYnjFF83pbmNERjTN7DrwJPv3XsljSNAMmQJ+CLJwPX2R5XFbCDSTM5QXWeAFhU9xLSOV
	34nMxxCYihwgo2bQ0yjW83iyHSiaye5ERIP58JmWc9FPs1yKdGRhLNO8obyBB6czG8QTYVBOiUC
	hvz6/Q3wmo/Nnr8UfKc7eaf71C3fucsx/4AycQZ3QMFZVG2ZUOjnOxlGzGEFM7X7mNOzwsvd7xZ
	IFTY+d/0PnbUT+LrEhVGrYvmSSt7KIMdrHa9EohV6Xva0a2QfeMFOUWfyIPNXsRe/a8z6dQSLYz
	Zuo2JxGKRMbXaoKvjZ0vvMGO18KDy3gz9Szu+GgPBxNhPACer3hIZSvevZw3zNF+m4rW5E23nks
	DEcO+nTulXGlb4SdTlBPL6xnF2gvYxcFk5ydadh++EGxefn8pXJasbB9Ii0hSc8Nl5bliXksqkV
	aoZCIDRqQSe2LA7D29m2FuavxWGeUHeaVbeYGJRIhPrS8R6uhVLY8PQ/pGdCHQuexST0HQQVzz9
	5RqcNNyp1iferH3BBJsR8Q==
X-Received: by 2002:a05:7300:546:b0:380:f8fd:d19c with SMTP id 5a478bee46e88-380f8fdd828mr2260645eec.35.1794882644267;
        Mon, 16 Nov 2026 18:30:44 -0800 (PST)
Received: from 8439c401ee69 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm3659510eec.24.2026.11.16.18.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:30:43 -0800 (PST)
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
Subject: [STATUS] next/master - 749a4de370409464cf8501ec5b2451df45c84eb4
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 17 Nov 2026 02:30:43 -0000
Message-ID: <179488264302.225234.10622001714172638985@8439c401ee69>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/749a4de370409464cf8501ec5b2451df45c84eb4/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 749a4de370409464cf8501ec5b2451df45c84eb4
origin: maestro
test start time: 2026-11-16 21:12:04.724000+00:00

Builds:	   75 ✅    1 ❌    0 ⚠️
Boots: 	  125 ✅   17 ❌    0 ⚠️
Tests: 	41658 ✅ 2496 ❌ 4162 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6afb846699c74e1a99661d9f
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_ptrace
      last run: https://d.kernelci.org/test/maestro:6afb846699c74e1a99661d94
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6afb81c499c74e1a9965fd00
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6afb85e199c74e1a99665bf5
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6afb9ef299c74e1a9967feb8
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:6afb7cd799c74e1a9965980a
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh
      last run: https://d.kernelci.org/test/maestro:6afb9eeb99c74e1a9967fe6a
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_sync_check
      last run: https://d.kernelci.org/test/maestro:6afb9eeb99c74e1a9967fe61
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.epoll_wait02
      last run: https://d.kernelci.org/test/maestro:6afb9ebc99c74e1a9967f945
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mahua-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688cae
      history:  > ❌  > ❌  > ✅  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers.timers_nsleep-lat
      last run: https://d.kernelci.org/test/maestro:6afb9ee999c74e1a9967fde3
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6afb7d5e99c74e1a9965a44a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6afb85e199c74e1a99665bf3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-agx-xavier-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - tegra-tests.boot.devices
      last run: https://d.kernelci.org/test/maestro:6afb97ef99c74e1a9967c4f1
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6afb7c4f99c74e1a996592e3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6afb7cc899c74e1a996595c0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup
      last run: https://d.kernelci.org/test/maestro:6afb7cd799c74e1a996597ec
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6afb9ea899c74e1a9967f5ba
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_current_peak
      last run: https://d.kernelci.org/test/maestro:6afb9ea899c74e1a9967f5ab
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6afb7cd799c74e1a9965980d
      history:  > ❌  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6afb9ef299c74e1a9967fe88
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6afb9ebd99c74e1a9967fa81
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6afb9ebd99c74e1a9967f9f0
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6afb9ebd99c74e1a9967f9fb
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_time_migrate
      last run: https://d.kernelci.org/test/maestro:6afb846699c74e1a99661d9b
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6afb846699c74e1a99661db4
      history:  > ✅  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6afb846699c74e1a99661daa
      history:  > ✅  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6afb7cf099c74e1a99659d27
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6afb846899c74e1a99661e05
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: jetson-xavier-nx-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6afb8ea799c74e1a9966e547
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_time_migrate
      last run: https://d.kernelci.org/test/maestro:6afb8ea799c74e1a9966e543
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000_glink-edge_fastrpc_compute-cb_1
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de1f
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000_glink-edge_fastrpc_compute-cb_12
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de1e
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000_glink-edge_fastrpc_compute-cb_13
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de1d
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000_glink-edge_fastrpc_compute-cb_2
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de1c
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000_glink-edge_fastrpc_compute-cb_3
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de1b
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000_glink-edge_fastrpc_compute-cb_4
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de1a
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000_glink-edge_fastrpc_compute-cb_5
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de19
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000_glink-edge_fastrpc_compute-cb_6
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de18
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000_glink-edge_fastrpc_compute-cb_7
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de17
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000_glink-edge_fastrpc_compute-cb_8
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de16
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_3
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de13
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_4
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de12
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_5
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de11
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_6
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de10
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_7
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966de0f
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_tn_111b8000
      last run: https://d.kernelci.org/test/maestro:6afb8dd499c74e1a9966ddd5
      history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: mahua-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_1
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c96
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_2
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c95
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_3
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c94
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_4
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c93
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_5
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c92
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_6
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c91
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_7
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c90
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_8
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c8f
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_c
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c8e
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_d
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c8d
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_e
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c8c
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_3
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c89
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_4
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c88
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_5
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c87
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_6
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c86
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_7
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c85
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_8
      last run: https://d.kernelci.org/test/maestro:6afbaca999c74e1a99688c84
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6afb837699c74e1a99661573
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6afb818a99c74e1a9965faaa
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6afb81fb99c74e1a99660371
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_1
      last run: https://d.kernelci.org/test/maestro:6afb9bf799c74e1a9967ea3a
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_10
      last run: https://d.kernelci.org/test/maestro:6afb9bf799c74e1a9967ea39
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_11
      last run: https://d.kernelci.org/test/maestro:6afb9bf799c74e1a9967ea38
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_12
      last run: https://d.kernelci.org/test/maestro:6afb9bf799c74e1a9967ea37
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_13
      last run: https://d.kernelci.org/test/maestro:6afb9bf699c74e1a9967ea36
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_2
      last run: https://d.kernelci.org/test/maestro:6afb9bf699c74e1a9967ea35
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_3
      last run: https://d.kernelci.org/test/maestro:6afb9bf699c74e1a9967ea34
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_4
      last run: https://d.kernelci.org/test/maestro:6afb9bf699c74e1a9967ea33
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_5
      last run: https://d.kernelci.org/test/maestro:6afb9bf699c74e1a9967ea32
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_6
      last run: https://d.kernelci.org/test/maestro:6afb9bf699c74e1a9967ea31
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_7
      last run: https://d.kernelci.org/test/maestro:6afb9bf699c74e1a9967ea30
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_8
      last run: https://d.kernelci.org/test/maestro:6afb9bf699c74e1a9967ea2f
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_3
      last run: https://d.kernelci.org/test/maestro:6afb9bf699c74e1a9967ea2c
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_4
      last run: https://d.kernelci.org/test/maestro:6afb9bf699c74e1a9967ea2b
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_5
      last run: https://d.kernelci.org/test/maestro:6afb9bf699c74e1a9967ea2a
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_6
      last run: https://d.kernelci.org/test/maestro:6afb9bf699c74e1a9967ea29
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_7
      last run: https://d.kernelci.org/test/maestro:6afb9bf699c74e1a9967ea28
      history:  > ❌  > ❌  > ❌  > ⚠️  
            
      - kselftest.timers.timers_nanosleep
      last run: https://d.kernelci.org/test/maestro:6afb9ee999c74e1a9967fdea
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.timers.timers_nanosleep_CLOCK_TAI_remaining
      last run: https://d.kernelci.org/test/maestro:6afb9ee999c74e1a9967fdeb
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio.gpio_gpio-aggregator_sh
      last run: https://d.kernelci.org/test/maestro:6afb8d1099c74e1a9966c7db
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6afb85cb99c74e1a99665892
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6afb854699c74e1a9966555c
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6afb85d799c74e1a9966597b
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: jetson-tx1-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6afb7cf099c74e1a99659d2b
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6afb851c99c74e1a99665121
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6afb8fac99c74e1a9966f3c1
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6afb913699c74e1a9967352e
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
