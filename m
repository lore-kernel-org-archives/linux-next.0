Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932246;
	b=LB3CBEJmhZ8Orsd2VPspCa+icvPtKfCff0lTagg7U877VNBkTBYXr9mXDVAixlpXbtAs
	 5OankWCuNGzRvwvSpMDGzgxNkI/Wy0DAUgoS9IT7Lkr0AwOeJdxj6nLjyXKZlF+zJPQrK
	 Wpd61OaPuHNVBIM0jC6lLUuj4IN1EOwfSc22Df8+DnGzRuwiVwBlmREpx6Tm3lJbSTJ1u
	 nKPHFhdXCknDMBLrP/hVtK6cGcJPewr5AhKWfn5nJ4rWmyBZNofA0ydbtChH2WIrhWd2l
	 jX+soNPmzme1IAVJklQRAyTTS8l1h6oIEwK2qqt8Y2OI8sYVdPoqVk5q4GgHJGo/PwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=0wv5pSye/rxGalN3VpDEdok2vPQoSinxVyk08ftcf3c=;
	b=nBVG/qcvIMtqxsQ/1RXNlo1pEan6zf5myFHAdj1yNt6KBloIErnHiE1VkLjB/GdBbB0L
	 6z3Zjj9z0SBWBPiZmJ5HLuXr3dYKqJtRvNrnt78vzsogJxBHl2HhqRJKy6rjS89EKW2/s
	 mZjMvm0u79gmKiY4fPG9gMSvxTt+wkUYk4yKWkzKM1j2H5rKhBlo0n+Qcyj5pw62Pqdis
	 iaf9A+F8N5EwvCYEUh1IR7v3eUWGaZLGT8n3ngqGVZpVuvFhwsQYVP6OZUtGIOUf1i88p
	 8ahDXaGkTgf9ZF0qu37bWpQHVaWxZI70HwKwyAkM+VkY8zSrRhacDJ7ZBePyvc4WYHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=OjnXYOgx;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F56606A31B
	for <linux-next@vger.kernel.org>; Fri,  6 Nov 2026 02:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80F56606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=OjnXYOgx
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so281864eec.0
        for <linux-next@vger.kernel.org>; Thu, 05 Nov 2026 18:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1793932244; x=1794537044; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0wv5pSye/rxGalN3VpDEdok2vPQoSinxVyk08ftcf3c=;
        b=OjnXYOgxm8FmjqJX+EEqmvfdRIpye3DVyElVQWqCLydv3w0YNTU/TBd5uPvOQMJzsJ
         +YjM6l/kH7mp8wGz10thZrMDcSbnSHzNEhe5Ryrx9UymzYkR1sxaXHwRj6yzjEom/AJb
         jvey6o4VrWbG0wTjk3X/7S8Cr/88mpYL3WZKV3MsZ0tdv5ZuMYEpWGUxq7BIPmJkzeCT
         JjEB7Q4YCfLJJ5kXdhOhgCtyn0GFoc8PZsMBtbb/bKCWxWOIaqvOkSkM/KKnkj82En8r
         dbRo7U861tnTXHWnR47kPUOvNkMqN570Hq188X6xGkvrKARlEiuvh66fG7JuZVF+sZ0j
         cpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932244; x=1794537044;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wv5pSye/rxGalN3VpDEdok2vPQoSinxVyk08ftcf3c=;
        b=lsIBZn7r0pJz82mgDTY84jkKwjkGd5wp7X5rAhMJbZaxHA/vfgHKb+ur34Dd4aHX8o
         AJeBnlDFp4rMRob+TlNWI7MGrW4dP/0s42uzxBuyS8P9sxgaRe43CMp/1NbAu5eqD9Dh
         YtXTysBMhkzVKAw6w55U2NHtjSw90mLIZYayjO1WtBL/romkeoFUeCPblYlTyv6Ld60f
         zydqK4o9GgbP1gJRd5cUeuN2588TMQtzQi+rKQ3V96HONZsjWt10uSE+gwfMSpHwMwgd
         t6Zy8pUZSGARG4JCspNXbaJCoNiH49dCAOsK2/nn0SzFWTVkWA7/x3IxakIDGLifPYOf
         yMgw==
X-Gm-Message-State: APuU4Z8jmnc09MBhxj0KMBFahIBjbIsgpUL06ceEfgeVPp2ELrXpYR70
	RSUlE1r2GAQMt/b9qVdhc77m2BETMdldRV2QMr1Nk8ZbunUftkTuYwABnLGySrLq+PYroHGRN3m
	aLy7o
X-Gm-Gg: AYBFou1Hl9oivqbqKDSpHQN1uKPIYyyETxYCX69PxrPptTBA2DCXuSD65zvRJrT3md3
	Oy38e9tSN2UFbFpbHi00b5UJykvyh+rieE6w896IRnQMd1Y/bTtKYCBlUp5zF0C7yaQQkU+959j
	WMc6RKwQBldcfIvFjQ4yXZHV52+v7ia5uyvDzC4JzyyBMg3oLk8BkH6KZFr3Wl1ZejI7F9jOnjr
	++cr4ZZ7DTeCnJPhCWUDe1LyHx4ADi653y7SQGXSsHarPi7eHu8y/YdEDFmYmYhDkJlB9n1oQ4H
	qFsYtoDwMjGI2mQnv62OJ32WgqgHZRuHaZoSONr17ToseK4wFyPp4F5a4lcbtLaAxq+dlphzppk
	lzWVFbve7+Uft0OTt29MyHjbyHrJ/Dx/wFboDCm4S9XaIllw9nEhIvwZHdfwgQbewfrdgwcwSEJ
	UE8aDnhdj7bQINvBMGsB/rfUxuzf3jsAoFUDpQSmzUYDP9Ge7z1fa6RdhKB3a9nmRjvKEHpfZBa
	8dp8f7I1AHBjP2ZvMBMrPhU5hwUpZ2bdb6JxJJKFEroZ2n8C/7ihLFTcQNCJlg3VEnEHR5m3Jkr
	NjSi0O9Af30sCK0sVmbiY4bi/EXFtqNg5XuN2N7A7OU=
X-Received: by 2002:a05:7301:929:b0:369:ef63:ea95 with SMTP id 5a478bee46e88-36f76814c3bmr1291728eec.6.1793932244095;
        Thu, 05 Nov 2026 18:30:44 -0800 (PST)
Received: from 34406640b1f4 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm2570211eec.3.2026.11.05.18.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:30:41 -0800 (PST)
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
Subject: [STATUS] next/master - ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 06 Nov 2026 02:30:41 -0000
Message-ID: <179393224070.396342.304404098338735020@34406640b1f4>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
origin: maestro
test start time: 2026-11-05 14:54:38.226000+00:00

Builds:	   71 ✅    2 ❌    0 ⚠️
Boots: 	  227 ✅   18 ❌    0 ⚠️
Tests: 	52985 ✅ 3188 ❌ 9538 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6aecbcb95b429d354efa78c1
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: imx6q-sabrelite
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aec9ff45b429d354ef867e1
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.poll02
      last run: https://d.kernelci.org/test/maestro:6aece1c75b429d354efbe026
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aecae505b429d354ef9af6c
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aecae4f5b429d354ef9af5a
      history:  > ✅  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aecae4f5b429d354ef9af60
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: jetson-xavier-nx-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_ptrace
      last run: https://d.kernelci.org/test/maestro:6aecb5a85b429d354efa13c3
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6aeca8795b429d354ef8fbb5
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6aeca8795b429d354ef8fbb3
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6aeca8795b429d354ef8fbaf
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6aeca8795b429d354ef8fbae
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec5a00
      last run: https://d.kernelci.org/test/maestro:6aeca8795b429d354ef8fbad
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aecae505b429d354ef9af75
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aecae4f5b429d354ef9af66
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6aecee865b429d354efc6bff
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6aecee865b429d354efc6bfa
      history:  > ✅  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6aecee8c5b429d354efc6f18
      history:  > ✅  > ✅  > ❌  
            
Hardware: nvidia-p5042-gh200
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aecae505b429d354ef9af78
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers.timers_set-timer-lat
      last run: https://d.kernelci.org/test/maestro:6aecb3f85b429d354ef9dcf2
      history:  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6aeca9465b429d354ef905b1
      history:  > ✅  > ❌  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6aecaa7c5b429d354ef96499
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6aecaa7c5b429d354ef96498
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6aecaa7c5b429d354ef96494
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6aecaa7c5b429d354ef96492
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_888000_i2c-mux_77_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6aecaa7c5b429d354ef9647a
      history:  > ✅  > ❌  
            
Hardware: jetson-tx1-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aecae505b429d354ef9af6f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aecb9745b429d354efa4d7c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:6aecabe45b429d354ef99579
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh
      last run: https://d.kernelci.org/test/maestro:6aecbcb75b429d354efa7874
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_split_huge_page_test
      last run: https://d.kernelci.org/test/maestro:6aecbcb75b429d354efa7871
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.x86.x86_syscall_numbering_64
      last run: https://d.kernelci.org/test/maestro:6aecbcbb5b429d354efa7984
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.clone304
      last run: https://d.kernelci.org/test/maestro:6aecbcb25b429d354efa7518
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.fanotify17
      last run: https://d.kernelci.org/test/maestro:6aecbcb35b429d354efa75f4
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_ns06
      last run: https://d.kernelci.org/test/maestro:6aecbcb35b429d354efa75dd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd02
      last run: https://d.kernelci.org/test/maestro:6aecbcae5b429d354efa7349
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd03
      last run: https://d.kernelci.org/test/maestro:6aecbcae5b429d354efa734d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd04
      last run: https://d.kernelci.org/test/maestro:6aecbcae5b429d354efa72e0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd05
      last run: https://d.kernelci.org/test/maestro:6aecbcae5b429d354efa727f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd06
      last run: https://d.kernelci.org/test/maestro:6aecbcae5b429d354efa7350
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.keyctl05
      last run: https://d.kernelci.org/test/maestro:6aecbcb35b429d354efa7602
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.keyctl23
      last run: https://d.kernelci.org/test/maestro:6aecbcb35b429d354efa7604
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.keyctl29
      last run: https://d.kernelci.org/test/maestro:6aecbcb35b429d354efa7605
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.mount_setattr02
      last run: https://d.kernelci.org/test/maestro:6aecbcb35b429d354efa7658
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.pivot_root01
      last run: https://d.kernelci.org/test/maestro:6aecbcb45b429d354efa76ae
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.sendmsg03
      last run: https://d.kernelci.org/test/maestro:6aecbcb55b429d354efa7720
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.sendto03
      last run: https://d.kernelci.org/test/maestro:6aecbcb55b429d354efa7722
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt05
      last run: https://d.kernelci.org/test/maestro:6aecbcb55b429d354efa777a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt07
      last run: https://d.kernelci.org/test/maestro:6aecbcb55b429d354efa777b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt08
      last run: https://d.kernelci.org/test/maestro:6aecbcb55b429d354efa777c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt09
      last run: https://d.kernelci.org/test/maestro:6aecbcb55b429d354efa777d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.statmount03
      last run: https://d.kernelci.org/test/maestro:6aecbcb15b429d354efa73f1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.statx01
      last run: https://d.kernelci.org/test/maestro:6aecbcb55b429d354efa77ee
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:6aecae575b429d354ef9b019
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh
      last run: https://d.kernelci.org/test/maestro:6aece1cd5b429d354efbe485
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_split_huge_page_test
      last run: https://d.kernelci.org/test/maestro:6aece1cd5b429d354efbe482
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.clone304
      last run: https://d.kernelci.org/test/maestro:6aece1c85b429d354efbe139
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.fanotify17
      last run: https://d.kernelci.org/test/maestro:6aece1c95b429d354efbe215
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_ns06
      last run: https://d.kernelci.org/test/maestro:6aece1c95b429d354efbe1fe
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd02
      last run: https://d.kernelci.org/test/maestro:6aece1c55b429d354efbdf0b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd03
      last run: https://d.kernelci.org/test/maestro:6aece1c55b429d354efbdf0d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd04
      last run: https://d.kernelci.org/test/maestro:6aece1c55b429d354efbdf0e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd05
      last run: https://d.kernelci.org/test/maestro:6aece1c55b429d354efbdf0f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd06
      last run: https://d.kernelci.org/test/maestro:6aece1c55b429d354efbdf11
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.keyctl05
      last run: https://d.kernelci.org/test/maestro:6aece1c95b429d354efbe223
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.keyctl23
      last run: https://d.kernelci.org/test/maestro:6aece1c95b429d354efbe225
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.keyctl29
      last run: https://d.kernelci.org/test/maestro:6aece1c95b429d354efbe226
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.madvise11
      last run: https://d.kernelci.org/test/maestro:6aece1c95b429d354efbe2bd
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.mount_setattr02
      last run: https://d.kernelci.org/test/maestro:6aece1c95b429d354efbe27b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.nanosleep01
      last run: https://d.kernelci.org/test/maestro:6aece1c75b429d354efbdff5
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.pivot_root01
      last run: https://d.kernelci.org/test/maestro:6aece1ca5b429d354efbe2db
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.sendmsg03
      last run: https://d.kernelci.org/test/maestro:6aece1cb5b429d354efbe34e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.sendto03
      last run: https://d.kernelci.org/test/maestro:6aece1cb5b429d354efbe350
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt05
      last run: https://d.kernelci.org/test/maestro:6aece1cb5b429d354efbe3a8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt07
      last run: https://d.kernelci.org/test/maestro:6aece1cb5b429d354efbe3a9
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt08
      last run: https://d.kernelci.org/test/maestro:6aece1cb5b429d354efbe3aa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt09
      last run: https://d.kernelci.org/test/maestro:6aece1cb5b429d354efbe3ab
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.statmount03
      last run: https://d.kernelci.org/test/maestro:6aece1c75b429d354efbe0b7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.statx01
      last run: https://d.kernelci.org/test/maestro:6aece1cb5b429d354efbe41c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:6aecae585b429d354ef9b01c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh
      last run: https://d.kernelci.org/test/maestro:6aecc55d5b429d354efad9b5
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_split_huge_page_test
      last run: https://d.kernelci.org/test/maestro:6aecc55d5b429d354efad9b2
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.clone304
      last run: https://d.kernelci.org/test/maestro:6aecc5165b429d354efad233
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.fanotify17
      last run: https://d.kernelci.org/test/maestro:6aecc5195b429d354efad43c
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_ns06
      last run: https://d.kernelci.org/test/maestro:6aecc5185b429d354efad398
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd02
      last run: https://d.kernelci.org/test/maestro:6aecc5175b429d354efad33a
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd03
      last run: https://d.kernelci.org/test/maestro:6aecc5185b429d354efad3e9
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd04
      last run: https://d.kernelci.org/test/maestro:6aecc5195b429d354efad49f
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd05
      last run: https://d.kernelci.org/test/maestro:6aecc51c5b429d354efad69d
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd06
      last run: https://d.kernelci.org/test/maestro:6aecc51d5b429d354efad752
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.keyctl05
      last run: https://d.kernelci.org/test/maestro:6aecc51c5b429d354efad6f7
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.keyctl23
      last run: https://d.kernelci.org/test/maestro:6aecc5165b429d354efad24c
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.keyctl29
      last run: https://d.kernelci.org/test/maestro:6aecc51b5b429d354efad64d
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.madvise11
      last run: https://d.kernelci.org/test/maestro:6aecc5185b429d354efad3b1
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.mount_setattr02
      last run: https://d.kernelci.org/test/maestro:6aecc5185b429d354efad3ab
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.pivot_root01
      last run: https://d.kernelci.org/test/maestro:6aecc51c5b429d354efad70b
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.sendmsg03
      last run: https://d.kernelci.org/test/maestro:6aecc5185b429d354efad3c0
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.sendto03
      last run: https://d.kernelci.org/test/maestro:6aecc51c5b429d354efad717
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt05
      last run: https://d.kernelci.org/test/maestro:6aecc51b5b429d354efad5cf
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt07
      last run: https://d.kernelci.org/test/maestro:6aecc5165b429d354efad272
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt08
      last run: https://d.kernelci.org/test/maestro:6aecc51b5b429d354efad5d0
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt09
      last run: https://d.kernelci.org/test/maestro:6aecc5185b429d354efad3cb
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.statmount03
      last run: https://d.kernelci.org/test/maestro:6aecc5185b429d354efad368
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.statx01
      last run: https://d.kernelci.org/test/maestro:6aecc5175b429d354efad31f
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6aed05635b429d354efd2b12
      history:  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6aed05635b429d354efd2b0d
      history:  > ❌  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6aecb9595b429d354efa4be8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6aecb9595b429d354efa4be3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6aecadc75b429d354ef9ab0b
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6aecadc75b429d354ef9ab0c
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6aecee865b429d354efc6c53
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:6aecae585b429d354ef9b01f
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh
      last run: https://d.kernelci.org/test/maestro:6aecee935b429d354efc74f7
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_split_huge_page_test
      last run: https://d.kernelci.org/test/maestro:6aecee935b429d354efc74f4
      history:  > ❌  > ❌  > ✅  
            
      - ltp.clock_nanosleep02
      last run: https://d.kernelci.org/test/maestro:6aecee8a5b429d354efc6e24
      history:  > ❌  > ✅  > ✅  
            
      - ltp.clone304
      last run: https://d.kernelci.org/test/maestro:6aecee8e5b429d354efc6fbb
      history:  > ❌  > ❌  > ✅  
            
      - ltp.fanotify17
      last run: https://d.kernelci.org/test/maestro:6aecee8e5b429d354efc7097
      history:  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_ns06
      last run: https://d.kernelci.org/test/maestro:6aecee8e5b429d354efc7080
      history:  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd02
      last run: https://d.kernelci.org/test/maestro:6aecee8a5b429d354efc6d8e
      history:  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd03
      last run: https://d.kernelci.org/test/maestro:6aecee8a5b429d354efc6d58
      history:  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd04
      last run: https://d.kernelci.org/test/maestro:6aecee8a5b429d354efc6d8f
      history:  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd05
      last run: https://d.kernelci.org/test/maestro:6aecee8a5b429d354efc6d91
      history:  > ❌  > ❌  > ✅  
            
      - ltp.ioctl_pidfd06
      last run: https://d.kernelci.org/test/maestro:6aecee8a5b429d354efc6dc5
      history:  > ❌  > ❌  > ✅  
            
      - ltp.keyctl05
      last run: https://d.kernelci.org/test/maestro:6aecee8e5b429d354efc70a5
      history:  > ❌  > ❌  > ✅  
            
      - ltp.keyctl23
      last run: https://d.kernelci.org/test/maestro:6aecee8e5b429d354efc70a7
      history:  > ❌  > ❌  > ✅  
            
      - ltp.keyctl29
      last run: https://d.kernelci.org/test/maestro:6aecee8e5b429d354efc70a8
      history:  > ❌  > ❌  > ✅  
            
      - ltp.madvise11
      last run: https://d.kernelci.org/test/maestro:6aecee8e5b429d354efc713d
      history:  > ❌  > ❌  > ✅  
            
      - ltp.mount_setattr02
      last run: https://d.kernelci.org/test/maestro:6aecee8e5b429d354efc70fb
      history:  > ❌  > ❌  > ✅  
            
      - ltp.pivot_root01
      last run: https://d.kernelci.org/test/maestro:6aecee905b429d354efc7152
      history:  > ❌  > ❌  > ✅  
            
      - ltp.sendmsg03
      last run: https://d.kernelci.org/test/maestro:6aecee915b429d354efc71c4
      history:  > ❌  > ❌  > ✅  
            
      - ltp.sendto03
      last run: https://d.kernelci.org/test/maestro:6aecee915b429d354efc71c6
      history:  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt05
      last run: https://d.kernelci.org/test/maestro:6aecee915b429d354efc7224
      history:  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt07
      last run: https://d.kernelci.org/test/maestro:6aecee915b429d354efc7225
      history:  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt08
      last run: https://d.kernelci.org/test/maestro:6aecee915b429d354efc7226
      history:  > ❌  > ❌  > ✅  
            
      - ltp.setsockopt09
      last run: https://d.kernelci.org/test/maestro:6aecee915b429d354efc7227
      history:  > ❌  > ❌  > ✅  
            
      - ltp.statmount03
      last run: https://d.kernelci.org/test/maestro:6aecee8c5b429d354efc6f4d
      history:  > ❌  > ❌  > ✅  
            
      - ltp.statx01
      last run: https://d.kernelci.org/test/maestro:6aecee915b429d354efc7298
      history:  > ❌  > ❌  > ✅  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_ae90000
      last run: https://d.kernelci.org/test/maestro:6aecae1c5b429d354ef9ad7e
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_ae98000
      last run: https://d.kernelci.org/test/maestro:6aecae1c5b429d354ef9ad7c
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_ae9a000
      last run: https://d.kernelci.org/test/maestro:6aecae1c5b429d354ef9ad7b
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_phy_88e0000
      last run: https://d.kernelci.org/test/maestro:6aecae1c5b429d354ef9ad2d
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_phy_88e1000
      last run: https://d.kernelci.org/test/maestro:6aecae1c5b429d354ef9ad2c
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_phy_88e2000
      last run: https://d.kernelci.org/test/maestro:6aecae1c5b429d354ef9ad2b
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a200000
      last run: https://d.kernelci.org/test/maestro:6aecae1c5b429d354ef9acb2
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a400000
      last run: https://d.kernelci.org/test/maestro:6aecae1c5b429d354ef9acb1
      history:  > ❌  > ✅  
            
      - kselftest.timers.timers_nanosleep
      last run: https://d.kernelci.org/test/maestro:6aecb3f85b429d354ef9dcfa
      history:  > ❌  > ✅  
            
      - kselftest.timers.timers_nanosleep_CLOCK_BOOTTIME_remaining
      last run: https://d.kernelci.org/test/maestro:6aecb3f85b429d354ef9dcfe
      history:  > ❌  > ✅  
            
      - kselftest.timers.timers_nsleep-lat
      last run: https://d.kernelci.org/test/maestro:6aecb3f85b429d354ef9dcf3
      history:  > ❌  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6aeca53f5b429d354ef8c117
      history:  > ❌  > ❌  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6aecb59c5b429d354efa1250
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6aecb59c5b429d354efa124f
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6aecb59c5b429d354efa124b
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_edp_aea0000
      last run: https://d.kernelci.org/test/maestro:6aecb59c5b429d354efa1249
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6aecb59c5b429d354efa1247
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6aecb59c5b429d354efa1246
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6aecb4765b429d354ef9e07c
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6aecb4765b429d354ef9e07b
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6aecb4765b429d354ef9e079
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6aecb4765b429d354ef9e077
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6aecb4765b429d354ef9e076
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae96000
      last run: https://d.kernelci.org/test/maestro:6aecb4765b429d354ef9e074
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6aecb4765b429d354ef9e073
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae96400
      last run: https://d.kernelci.org/test/maestro:6aecb4765b429d354ef9e072
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6aecb4765b429d354ef9e071
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec5a00
      last run: https://d.kernelci.org/test/maestro:6aecb4765b429d354ef9e070
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6aecb4765b429d354ef9e054
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70_i2c_1_bridge_58
      last run: https://d.kernelci.org/test/maestro:6aecb4765b429d354ef9e053
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6aecbd385b429d354efa8269
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6aeca4a05b429d354ef8b627
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6aecabe45b429d354ef9957c
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6aecbcb95b429d354efa7891
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_gup_test_sh
      last run: https://d.kernelci.org/test/maestro:6aecbcb75b429d354efa7827
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_gup_test_sh_gup
      last run: https://d.kernelci.org/test/maestro:6aecbcb75b429d354efa7825
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh
      last run: https://d.kernelci.org/test/maestro:6aecbcb75b429d354efa7829
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh_test_hmm_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6aecbcb75b429d354efa7828
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh
      last run: https://d.kernelci.org/test/maestro:6aecbcb75b429d354efa784d
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh_memory-failure
      last run: https://d.kernelci.org/test/maestro:6aecbcb75b429d354efa784c
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_race
      last run: https://d.kernelci.org/test/maestro:6aecbcb75b429d354efa786c
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_sync_check
      last run: https://d.kernelci.org/test/maestro:6aecbcb75b429d354efa786b
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh
      last run: https://d.kernelci.org/test/maestro:6aecbcb75b429d354efa7880
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh_test_vmalloc_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6aecbcb75b429d354efa787f
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp.clock_nanosleep02
      last run: https://d.kernelci.org/test/maestro:6aecbcb15b429d354efa7401
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - ltp.epoll_wait02
      last run: https://d.kernelci.org/test/maestro:6aecbcb15b429d354efa7404
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6aecbcb15b429d354efa7470
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6aecbca65b429d354efa704e
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - ltp.poll02
      last run: https://d.kernelci.org/test/maestro:6aecbcb15b429d354efa73c5
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6aecbcb15b429d354efa7445
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6aecbcb15b429d354efa7447
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm.mm_ksft_gup_test_sh
      last run: https://d.kernelci.org/test/maestro:6aece1cd5b429d354efbe439
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_gup_test_sh_gup
      last run: https://d.kernelci.org/test/maestro:6aece1cd5b429d354efbe437
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh
      last run: https://d.kernelci.org/test/maestro:6aece1cd5b429d354efbe43b
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh_test_hmm_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6aece1cd5b429d354efbe43a
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh
      last run: https://d.kernelci.org/test/maestro:6aece1cd5b429d354efbe45f
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh_memory-failure
      last run: https://d.kernelci.org/test/maestro:6aece1cd5b429d354efbe45e
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_race
      last run: https://d.kernelci.org/test/maestro:6aece1cd5b429d354efbe47d
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_sync_check
      last run: https://d.kernelci.org/test/maestro:6aece1cd5b429d354efbe47c
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh
      last run: https://d.kernelci.org/test/maestro:6aece1cd5b429d354efbe491
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh_test_vmalloc_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6aece1cd5b429d354efbe490
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6aece1c75b429d354efbdfbe
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6aece1c75b429d354efbe0fe
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6aece1bf5b429d354efbdd04
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6aece1c75b429d354efbe03c
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6aece1c75b429d354efbe063
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - ltp.splice08
      last run: https://d.kernelci.org/test/maestro:6aece1c75b429d354efbe080
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6aecbe825b429d354efa91b4
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6aecbe815b429d354efa91af
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.mm.mm_ksft_gup_test_sh
      last run: https://d.kernelci.org/test/maestro:6aecc55c5b429d354efad969
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_gup_test_sh_gup
      last run: https://d.kernelci.org/test/maestro:6aecc55c5b429d354efad967
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh
      last run: https://d.kernelci.org/test/maestro:6aecc55c5b429d354efad96b
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh_test_hmm_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6aecc55c5b429d354efad96a
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh
      last run: https://d.kernelci.org/test/maestro:6aecc55d5b429d354efad98f
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh_memory-failure
      last run: https://d.kernelci.org/test/maestro:6aecc55d5b429d354efad98e
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_race
      last run: https://d.kernelci.org/test/maestro:6aecc55d5b429d354efad9ad
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_sync_check
      last run: https://d.kernelci.org/test/maestro:6aecc55d5b429d354efad9ac
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh
      last run: https://d.kernelci.org/test/maestro:6aecc55d5b429d354efad9c1
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh_test_vmalloc_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6aecc55d5b429d354efad9c0
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6aecbe805b429d354efa9171
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6aecb8695b429d354efa327d
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6aecb8695b429d354efa3278
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6aecb8675b429d354efa3243
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6aed05615b429d354efd2ad5
      history:  > ⚠️  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6aecb9595b429d354efa4c48
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6aecb9585b429d354efa4ba1
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: jetson-xavier-nx-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6aecb5a85b429d354efa13ce
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_vfork
      last run: https://d.kernelci.org/test/maestro:6aecb5a85b429d354efa13c6
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6aeca8795b429d354ef8fbb1
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a800000_hub_2
      last run: https://d.kernelci.org/test/maestro:6aeca8795b429d354ef8fad5
      history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6aecb9d15b429d354efa5138
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6aecb9d15b429d354efa50cb
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6aecb9d05b429d354efa508d
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6aecba0c5b429d354efa5423
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm.mm_ksft_gup_test_sh
      last run: https://d.kernelci.org/test/maestro:6aecee935b429d354efc74ab
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_gup_test_sh_gup
      last run: https://d.kernelci.org/test/maestro:6aecee935b429d354efc74a9
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh
      last run: https://d.kernelci.org/test/maestro:6aecee935b429d354efc74ad
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh_test_hmm_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6aecee935b429d354efc74ac
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh
      last run: https://d.kernelci.org/test/maestro:6aecee935b429d354efc74d1
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh_memory-failure
      last run: https://d.kernelci.org/test/maestro:6aecee935b429d354efc74d0
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_race
      last run: https://d.kernelci.org/test/maestro:6aecee935b429d354efc74ef
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_sync_check
      last run: https://d.kernelci.org/test/maestro:6aecee935b429d354efc74ee
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh
      last run: https://d.kernelci.org/test/maestro:6aecee935b429d354efc7503
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh_test_vmalloc_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6aecee935b429d354efc7502
      history:  > ⚠️  > ⚠️  > ✅  
            
      - ltp.epoll_wait02
      last run: https://d.kernelci.org/test/maestro:6aecee8c5b429d354efc6e6b
      history:  > ❌  > ✅  > ❌  
            
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6aecee845b429d354efc6bba
      history:  > ⚠️  > ⚠️  > ❌  
            
Hardware: nvidia-p5042-gh200
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6aecb7775b429d354efa2705
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6aeca5315b429d354ef8c0d8
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aecb9565b429d354efa4b90
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test_default_time7_sun50ia64audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6aecacbe5b429d354ef99b71
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6aecbeb95b429d354efa92ac
      history:  > ✅  > ❌  > ❌  > ✅  > ❌  
            
Hardware: jetson-tx1-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6aecb91c5b429d354efa415f
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
