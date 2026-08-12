Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF8925B0B9
	for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 02:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786501819; cv=none; b=i5kk/pmYSCrey9uqihi8KpIxNV6gcoIqPqVZXPCrU9Q86lg0INfQnSARkXUBWvEjfqurpT9nLcwITNhn+mosiMZvUdIrJK8swTtgm5LvrPw6QjPWObP4Ao6lpLwdPtuRrvRrPSpEorPAJcUvVdEDhkLjYLZnU2NlChIbgBdfymk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786501819; c=relaxed/simple;
	bh=8j160JfNt9r+3C2TQCWdv2R0Ru1VybbaiZcNdKQ1xwU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=LDZXtlJoV0QqACnZriNRbQwhj9QhUNg8sUvPg+CecngpFb3VoLVTVzHVEAOy7UtcYlSMNbyJKGRq98OgpOeHdXMN+F8KGDu2jWUofgepp7Gcs46yAHHdbEcXaGRCSYpunUZHadSN1l5zIhMHZGqpjocaFU0inmcVwpebgx8BEKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=H1Ot0I04; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="H1Ot0I04"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so546371a91.2
        for <linux-next@vger.kernel.org>; Tue, 11 Aug 2026 19:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1786501816; x=1787106616; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3WLVz0z1B4s+E8YEccCJRZTW3Wm2/4jVuP0cVZgVTIA=;
        b=H1Ot0I047iBsgBsiwUjQc0A46Gfexjn6LTyBbhAfthsCBvXHukR4Lj9QAt7kRs+l9I
         f2jhEWFoDPonhhBsxo7eeE51hZHoPITI/agYr84JVSDnszbZjx6iL+kXsVGpbPc72d6T
         Rlp5nO3DIVUYLRvm+8h5yT3IWMCFv3dOKwimndzSBMFmrq3IAWALA8QuCRx3XErqdjhu
         ssfX0OeZoK408IUCcmugpnXewkRbvTDtjkZ82iZPEbhmX/lmNaESvS2QrD/gUovcp4vP
         WPBhGIQmIVM0dzb1uf93gc5FekBnlyzPRFIGulZPmOrNAhoiP9qWdFklKZr/0XM9fZy1
         WS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786501816; x=1787106616;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WLVz0z1B4s+E8YEccCJRZTW3Wm2/4jVuP0cVZgVTIA=;
        b=a9R3lUJFwkn7vNVBncHFXf3Ho8Rp1Gb4G9ydjNAF8rZIem8OeAkKOdcgfj0SDk1/8w
         sCYE/IeF5m3/xc1sfYSfX/X2GRIi4F4MyfWCcuViOhioX5g2xJaO8j75EkacFcCKeXfE
         ns5rfkOdJn+4Ic2JrtkeRI1Ez5IW4HXfR+tvOvpXylh5Mw8c+vjEWSYJMgSeyEr6FjQ4
         Fx056pxyax6Euhsn06vDqMgQm7Xjfxh03CDevWJUav6lXOH7ARLbDxpHUctSuor7ysO1
         pEpswKik5vqVHVYkLBPOolr5ElAT/yQaGby2qapuTsFWzG4cz8uqy5DbpvUCiftNnwXf
         E89Q==
X-Gm-Message-State: AOJu0YwR1fxrgFU9tZOq9+NcNbRdbR7vhoI4gGwnZ10a49Fu+GB3dggp
	rSq9ZCazY4zSiURw1QPg513H4bwvW5p06RFzkUNUq45kBbxK9lZw+9IykEBkRLIzhpXZSoI4vlm
	w1v+t
X-Gm-Gg: AR+sD12WOmmQ+7/nEh68I0IGkKELwylxUzg0JC7t7bfd4eOQO65SEhfs3EpPbBJMHNE
	L8k2xl8xIp+Mox/99t4n80DzWP7Zo2aj4I7bdMk9YeBT5+GVD4i9XVtkdB7B4iMwusNB+Ywyf0L
	LohYco8YeiLTZqxxs4Ixnzcp9UdyIv4L4cq3nKHo31y/Wm6CZi/S3LUcYiQ5luemf66Ga80gfcO
	ZsBUNscDW3r8vIFfhAQ0VkDNtoe87pkUNVAsJLPAjkziXGus60jDDj2ak5H9ZdKtb16Pn5/izBj
	KChOlfB3GU/m9V92vJjp2XRAUkm9tEm+TZUYAQyqeBhVQD9KMvWZHx8dQJik3ZGeju+RUKjv6U4
	EkRDk2cm2lCtHW8lzo7RgKaS6zx9z5B9AZgchqT8jToNgsa6ay7hf2/C61SWh55qd5i3M8wYIuZ
	lm7zY11ACkrEnucH/bHjot6gLIgoYoUujGFyOhQNidnxe0A6oOc5X8IvpK0DgyBYp5
X-Received: by 2002:a17:90b:1b0d:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-3930123c6ecmr1549333a91.2.1786501816076;
        Tue, 11 Aug 2026 19:30:16 -0700 (PDT)
Received: from 9a65d8f5b626 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14124583ad0sm4221004c88.12.2026.08.11.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 19:30:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 5e6de6a2b522f659defacb1551d0465ba6ce13cf
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 12 Aug 2026 02:30:15 -0000
Message-ID: <178650181457.2225.9301009758188817916@9a65d8f5b626>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/5e6de6a2b522f659defacb1551d0465ba6ce13cf/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 5e6de6a2b522f659defacb1551d0465ba6ce13cf
origin: maestro
test start time: 2026-08-11 16:28:19.566000+00:00

Builds:	   63 ✅    2 ❌    0 ⚠️
Boots: 	  180 ✅    3 ❌    0 ⚠️
Tests: 	31331 ✅ 2818 ❌ 8436 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a7b5ce762f33761c0b084b0
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_2000
      last run: https://d.kernelci.org/test/maestro:6a7b697162f33761c0b121b2
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_2000
      last run: https://d.kernelci.org/test/maestro:6a7b672a62f33761c0b0e1b5
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_3000
      last run: https://d.kernelci.org/test/maestro:6a7b672a62f33761c0b0e1b4
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a7b6e4362f33761c0b1474d
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a7b8b4a62f33761c0b30546
      history:  > ✅  > ❌  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a7b568662f33761c0b03983
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a7bb03d62f33761c0b3a40b
      history:  > ✅  > ✅  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a7b74a962f33761c0b19b5c
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a7b789a62f33761c0b1ff82
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a7b579262f33761c0b049ab
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7b565462f33761c0b037b9
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7b787c62f33761c0b1faf2
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7b787c62f33761c0b1fae6
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b787c62f33761c0b1fadc
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b787c62f33761c0b1fada
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7b787d62f33761c0b1fd1b
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7b787c62f33761c0b1fade
      history:  > ❌  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm.mm_ksft_madv_guard_sh
      last run: https://d.kernelci.org/test/maestro:6a7b811162f33761c0b26c3e
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_madv_guard_sh_guard-regions
      last run: https://d.kernelci.org/test/maestro:6a7b811162f33761c0b26c3f
      history:  > ❌  > ✅  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7b565662f33761c0b037c5
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7b68b062f33761c0b1189a
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7b68b062f33761c0b1188e
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b68b062f33761c0b11883
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b68b062f33761c0b11881
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7b68b062f33761c0b1188b
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7b68b062f33761c0b11885
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a7b569762f33761c0b03eac
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a7b6efd62f33761c0b14cb1
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a7b6efd62f33761c0b14cb0
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a7b5ce762f33761c0b084a9
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7b565962f33761c0b037d0
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7b67f662f33761c0b109c5
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7b67f662f33761c0b109a5
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b67f662f33761c0b109a3
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b67f662f33761c0b1098b
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7b67f662f33761c0b1099d
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7b67f662f33761c0b10991
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7b565a62f33761c0b037d8
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7b5f7e62f33761c0b0ad23
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7b5f7e62f33761c0b0ad17
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b5f7e62f33761c0b0ad0c
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b5f7e62f33761c0b0ad0a
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7b5f7e62f33761c0b0ad14
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7b5f7e62f33761c0b0ad0e
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7b565b62f33761c0b037de
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7b5dcd62f33761c0b09def
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7b5dcd62f33761c0b09de3
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b5dcd62f33761c0b09dd8
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b5dcd62f33761c0b09dd6
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7b5dcd62f33761c0b09de0
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7b5dcd62f33761c0b09dda
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7b565d62f33761c0b037fe
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7b65ab62f33761c0b0d9ed
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7b65ab62f33761c0b0d9e1
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b65ab62f33761c0b0d9d6
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b65ab62f33761c0b0d9d4
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7b65ab62f33761c0b0d9de
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7b65ab62f33761c0b0d9d8
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7b565f62f33761c0b03842
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7b5c4b62f33761c0b07a81
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7b5c4b62f33761c0b07a76
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b5c4b62f33761c0b07a6b
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b5c4b62f33761c0b07a69
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7b5c4b62f33761c0b07a73
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7b5c4b62f33761c0b07a6d
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7b566062f33761c0b0384c
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7b5da862f33761c0b098d3
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7b5da862f33761c0b098c7
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ptrace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b5da862f33761c0b098bc
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_seccomp_ret_trace_x0_bypass
      last run: https://d.kernelci.org/test/maestro:6a7b5da862f33761c0b098ba
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7b5da862f33761c0b098c4
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7b5da862f33761c0b098be
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_ac0000_i2c_a80000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a7b82a362f33761c0b2a06e
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a7b82a362f33761c0b2a057
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000
      last run: https://d.kernelci.org/test/maestro:6a7b82a362f33761c0b2a055
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a7b568562f33761c0b0397d
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a7b82de62f33761c0b2a0f3
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm.mm_ksft_hugetlb_sh
      last run: https://d.kernelci.org/test/maestro:6a7b811162f33761c0b26cba
      history:  > ⚠️  > ❌  > ⚠️  
            
      - kselftest.mm.mm_ksft_hugetlb_sh_thuge-gen
      last run: https://d.kernelci.org/test/maestro:6a7b811162f33761c0b26cbd
      history:  > ✅  > ❌  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a7b566b62f33761c0b038ae
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a7b69cd62f33761c0b12853
      history:  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a7b564e62f33761c0b036f8
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a7b5ce762f33761c0b082b1
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a7b697162f33761c0b1215e
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a7b672a62f33761c0b0e1a5
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a7b56a762f33761c0b03f1d
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a7b72eb62f33761c0b16e12
      history:  > ❌  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a7b5c0d62f33761c0b07875
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a7b567562f33761c0b038f3
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a7b82a362f33761c0b2a08f
      history:  > ✅  > ✅  > ⚠️  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a7b569462f33761c0b03e9e
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:6a7b83c262f33761c0b2cd37
      history:  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
