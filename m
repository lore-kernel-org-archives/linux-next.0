Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F037BE9C
	for <linux-next@vger.kernel.org>; Thu, 20 Aug 2026 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787193020; cv=none; b=Rionmcs/cnOoC9r0FuIZSSPW65l+pB58PHp/H2nGbl1w+jfdNgegj0DajsDRwqLuP8gcvWrak4brCcxYP7l1wuk/fAJqy65qNHbN1TZ9+MdQ3ApQM7z9AbJQ7nBAkGkHtF9LjTd/WZwvJsMDU3Y5jnxm/fQhhsU6IETJIZAFJB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787193020; c=relaxed/simple;
	bh=GGeLJJLFqnS+pP/vWofeNz0m0RnzIwqzslpjtpLo390=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=JsZObtV90+Dwd31sFo9Xr2mMUjob9ICr3kEDHTpzE10pSKzObLRJLB/IcOuy7pTgFoQAdpub1ur7C6Upqd0T2/Ux6UTMlM5nDN8UpgXLGftM20eB2lEafM0NBuaNoyHgWLokiee5GizGFH6oqNoG2Ik2mWVhaVkyN7mtD3FMLZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=TrfeLsif; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="TrfeLsif"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf27856f9cso16385255ad.2
        for <linux-next@vger.kernel.org>; Wed, 19 Aug 2026 19:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787193018; x=1787797818; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vP5d65rDkfSsbVA1S3VmzwYSLouQcNZ2aO9gYuN1fzs=;
        b=TrfeLsifhqxF/F+Z+prmOL0x6oLlRUw1hY/HrgUn3SLq7SYGzMNRi3qUtXzhXNkmRA
         5ZeRlW9X6WI6+/Akujj+hDBmI3LkQvrLZfGlbDzULTxi1yHbdobDNuLQZRe6bS0pWs+2
         gfLQc1O0/Ggeu4ysLa+9r2ERg79X+ofwiGGhEdhHovgs1Oo28Ii9cxPF3XQDOBbcQ7I7
         QE09Rn+Txa5ydxMzsn0CKVHOTcGGeVm078Yd8nYiwHXzhRvO+3XoyNr3hA6vyBQHnLjj
         XGKDysGSzBXvA4QilQnycNCY/cqYgO/9r/eKpkEBKrGIIGFrS/Ysx1xdxbWOiHBNronb
         Slrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787193018; x=1787797818;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vP5d65rDkfSsbVA1S3VmzwYSLouQcNZ2aO9gYuN1fzs=;
        b=BlwbAZfJLEETAkgDSxUibTHuLjP6s+OmuGF/axSeuvvHLG2OVocsYWabPtMTpRricQ
         qf46/pLnAf8fqVHK/yd4BtHv2qkt+cXd0A6POQJamqKv9fTHj9uVeTQhJ7yk6XpBQ5zp
         bKwMhyaGNXycv04MpXfti2of7NtlAcYlA+apSdhIlaWSqCUFFF6pg977+g/JGRNq/LpE
         ZfLeDSTY5JKkxl+DqauNx+pGXLHk9EGuCF3QvOdiL9Uv2SHqE/yx2L5PMjqyKhMFl1gG
         bNchx+R587WjXPl2AJUKQjrZppFwagX7gRCZKUknft/UnViCvBU0/aSvZRs9DbS3IYiT
         BrGA==
X-Gm-Message-State: AFuF++mo3TLqRLf5NgATdY76qrwdTD6zyaZnOqCIwX6jixW9HCgZRsxl
	mDKzRTpvR+hAGZOURu2b9Nr6YSIngLRXrWh3zQnsfkSfhA0lOxrHQAe1XIEQ6rHvDWYGrLtLfr0
	8k16S
X-Gm-Gg: AR+sD11m9VPoHr2VQlboSwQQOqQLAskXxc6cKnTQ0N5wxk4fgR6ne+hGPbE0UH8L2Zz
	UOL6bIwJp/xBlKYmzF9hlXOCFgnpugA9k8lgFmLCtMmOveROqIWovRfHPhOlWg5w3+UmEdGyLVO
	bkmya0fvHqH0uQbsL7atJnwfIb/m4QYumg97CnHlAmco/zR6jH7oJRojZX3APjnMrvwzq396LjU
	c8S/q11RBotovLL4/veGGK7MXlG26GtY6ehAGX7vR5RbZCwfQuvDCfUa9FlXX94j3ZK3UlEry+U
	XttA7V9kKy5c01yUVZ3MJQYjMA/O3HPlRhiDd75vUvGdTw3uE1q+adcpoXget7T2IeC1rsPAqRN
	5iNdSZadHVzUz8nWkILq0EgS+6fb/YzuPuyMRY276LI12VB79UB0SDybOBzB3x5ug2rJSouNv1/
	9NXxUkFk1TjJ9FkmHjT5BT4UdlrLaITRXOef9Ilp8t62nlSG4v3mY5RQ==
X-Received: by 2002:a17:903:1987:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2d5fd7130edmr160937815ad.1.1787193017863;
        Wed, 19 Aug 2026 19:30:17 -0700 (PDT)
Received: from b455de3d9de8 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77bfcsm10165736eec.9.2026.08.19.19.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 19:30:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 6a746cd265aed59107ebdaa9ce039bb832922969
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 20 Aug 2026 02:30:16 -0000
Message-ID: <178719301658.432.9329576900133218908@b455de3d9de8>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/6a746cd265aed59107ebdaa9ce039bb832922969/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 6a746cd265aed59107ebdaa9ce039bb832922969
origin: maestro
test start time: 2026-08-19 13:20:20.643000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  146 ✅   14 ❌    0 ⚠️
Tests: 	27177 ✅ 4178 ❌ 3698 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_76
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59bbd
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_79
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59bd2
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11201000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a85bd6e62f33761c0e4e6a1
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_112a1000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a85bd6e62f33761c0e4e69c
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_112b1000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a85bd6e62f33761c0e4e699
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11201000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a85bd9d62f33761c0e4eaa2
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11290000
      last run: https://d.kernelci.org/test/maestro:6a85bd9d62f33761c0e4eaa1
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_112a1000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a85bd9d62f33761c0e4ea9f
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_112b1000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a85bd9d62f33761c0e4ea9d
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_memslot_perf_test
      last run: https://d.kernelci.org/test/maestro:6a85d20d62f33761c0e615e2
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_75
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59bb6
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_78
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59bcb
      history:  > ❌  > ✅  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_memslot_perf_test
      last run: https://d.kernelci.org/test/maestro:6a85c63b62f33761c0e58cfd
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_memslot_perf_test
      last run: https://d.kernelci.org/test/maestro:6a85c01162f33761c0e5111e
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_memslot_perf_test
      last run: https://d.kernelci.org/test/maestro:6a85c0fb62f33761c0e530e6
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_memslot_perf_test
      last run: https://d.kernelci.org/test/maestro:6a85becd62f33761c0e4fea9
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_60
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b4d
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_63
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b62
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_61
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b59
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_62
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b60
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_63
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b67
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_64
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b6e
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_57
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b3c
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b97
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59ba5
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_73
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59bac
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_57
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b3a
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b8e
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b95
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b9c
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59ba3
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_73
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59baa
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_57
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b3b
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b8f
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b96
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59b9d
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59ba4
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_73
      last run: https://d.kernelci.org/test/maestro:6a85c85762f33761c0e59bab
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_verdinwm8904_21
      last run: https://d.kernelci.org/test/maestro:6a85c23062f33761c0e563a7
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_verdinwm8904_21
      last run: https://d.kernelci.org/test/maestro:6a85c23062f33761c0e563a6
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a85b76962f33761c0e49b37
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11201000_usb_0_hub_1
      last run: https://d.kernelci.org/test/maestro:6a85bd6e62f33761c0e4e6a0
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11201000_usb_0_hub_2
      last run: https://d.kernelci.org/test/maestro:6a85bd6e62f33761c0e4e69f
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:6a85bd9d62f33761c0e4eabb
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
