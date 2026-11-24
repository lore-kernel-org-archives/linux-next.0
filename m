Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487423;
	b=Q7usH5K18hDoWXgi7FyBZNDyn4sAcZSP4Pn6j0dTNaEIHW5rw/6I5yOQkG+htmVX6wvm
	 28ejptAJM9cLT4Lws9nT/PNmpU9K4hAXOgVYM7G1Ro/eTE+51bguw7gJANGKyO/NJf2QR
	 4pKqCp7AYk84ita7VkR4XLYqUQpzAphgq4293FVANJ376ChfNmLOvq38NCthO7TOp+SrE
	 3saD3H09VPpSoAZrnVRz4fJgsJ7Ye7f0Yw2k2RSSbHxBZKoAVfMWi0Cj58BsJA8OMwQw2
	 GkMWVCIGUkTArLbRACLb3531G3IVQo1XSXu72NxwWGxeYjnjF4ioEDSlhYIuCopXg1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=I+XPjJ9Y7DcNDfN9Byn1CqvDoujkzO/GGlDmscaKSYU=;
	b=T1NVl2A5ynzhEahkXr6ZoORzt6PN2PsXxDK64/ri/n0h67ioZE6o9FHZ9+18pEmaSM1F
	 w75UkZmNsbCA2sK1QD8vuusI5YaOZZZiqq33d8ggVj94NeWhN5DvE9WTQyU6jI99wlV3F
	 EUBPuReEcK0ffUiNIWmLdJEtP0Ug7x+jB7ljoriF2fk2hePcf49eL0/tGG5E6TeKZWh4u
	 kQ10DlpPWk2wY6YOHYf1T4crWYF5CbJjkMS/fGw/bQtOyvXadpq2yNe+WJ+JZSfGhrcRS
	 vPpP79HFD1U/bBdOvWa71FJ9q0j+nT+Bp0kZ8NrnB0IH+CuU420vUTUTLOAdxqkQLvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=BC1oXN2k;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9C2606A31E
	for <linux-next@vger.kernel.org>; Tue, 24 Nov 2026 02:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D9C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=BC1oXN2k
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b546061d58so8973207c88.1
        for <linux-next@vger.kernel.org>; Mon, 23 Nov 2026 18:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795487422; x=1796092222; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I+XPjJ9Y7DcNDfN9Byn1CqvDoujkzO/GGlDmscaKSYU=;
        b=BC1oXN2kDz1BwuZ441hzGPEkq9SmD1t295cBOGmOJN1CvLwT27hIko4lYROeCq7z00
         lqblJDpSirNHUmiUK2ja/4GNyKXpNL8+NwAvvXTEeGepLhlY1PeU3Vp8qN0w+VlzcZGr
         y27KfZo2f3U6LXqlY2EA6tdWe6oUZ58s4EqJ3ARmJkhoNrFq1znlWWBWjO5+8iQt0LxD
         rifbs3rYzqxPJsaR5D+MQBDD9frXLKBvbuhFsijoUU1/HoS3pLBuseQGYg7fheH6hdjC
         8XkGrcB94XdBkoi5lJj0aK/wVX3+hrWYYOBPmeYGiDbC4ZbyisbIVfkbS8ujZi6Lm39Y
         TqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795487422; x=1796092222;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+XPjJ9Y7DcNDfN9Byn1CqvDoujkzO/GGlDmscaKSYU=;
        b=iUO1+ZDbflKvjFm+J0bCkHR17ZLVHaIr++3TJSFgTUbWZkkEznXndvdzFTB5Rf7Eeu
         mDNS6cJBpy0S+vup6Nzgm0FHXLhW/OlISL4M8uMIyGsR/vJPxBmqLhkqowQ4J+/NDjyw
         tYXgtpXCbotiUTjpjq8CLPH9SWUVWGm6efRhMiCQfK6T17i5jaiA1SdiFbE6li8yMhYV
         ELcuAdR7l9fWe5FXJ7ery3UZTRdF8z2aAuTgJpsLF3Czvk2qZFliOaBRY6gJemVjCEYT
         I+4XntytRqPw5J4YSbp4vNbjMwzwFDx+ABOcmcnt3DEe6NPDlEKseGqtCfL2rfMDgcE7
         jVvA==
X-Gm-Message-State: APuU4Z9yOA/DYA+OGt0AsTSqg+auv6GKhLoUwJkI2MxyvInkeiNMfx8Z
	bpfAJJONrcSV9pxmkIptXEl9YsgGy95Ypu7IuFxHA3MelY1zEB3TKGSGzV+g7OHMwKc=
X-Gm-Gg: AZFdTZfa7Wac51Sm9Rx6H5B3VYlbYneqqJLXeov4ZsMj2KXqDXXZBloz0OChWINGu9O
	lMC5zx6kaIZMmIvhhVILk2mrYuOzHBIgyWu7RuJcysi5PALT6hjqeSeTeYQtLuPZOhwUve3M6w4
	qfE0FOc8/LFsTniC+mAC2ddZkcXEsi6fi7qk5w8lxV7P0n+kxzJQkgje3Bz5RHy3adUyVn7ASYj
	dOrYNDoIPcfR/hg3XNui0SguIbjQzM8A8yEw7azbD9eP2axRnjrDtDkOwhhb/ekvECeyPGzIBUV
	S0T8eSlYKXB63XK03egSYm8Dz/C65r2dZ8R3Vn2s5MOOWGkdwOUVDIrjfHyhnryOaFvzh1EStmL
	r5XJSapUohWBsGFstUd03Xs7JyFieyOTKrPHMzpX6CTUGhwdVcDzf1DqPWz7WKs9nDsGlUW/3Ja
	50JFabhWE7M/wcYEHXEXZi9FeIvL7wdJEiQR8b1pv9/3Avk12cKMFlEDncPElLCMEGw56v3S/YM
	e2LHBW9J02EADBLIFJBhVRvDUOvdd0Er0B3aPFvCw0fMak56y7hvcKcddgJrQu04B0RFvQ3Hn9b
	8mAqx+HioiBty/+Zwx8Vxg==
X-Received: by 2002:a05:7022:1701:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b55feaa6a4mr10861183c88.15.1795487422019;
        Mon, 23 Nov 2026 18:30:22 -0800 (PST)
Received: from 52d83ede7c60 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm30611781c88.2.2026.11.23.18.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:30:21 -0800 (PST)
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
Subject: [STATUS] next/master - 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 24 Nov 2026 02:30:21 -0000
Message-ID: <179548742121.20463.14083979973277133578@52d83ede7c60>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3191063649dbf7c0d0b768e1f3655e4c5fc6edb5/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
origin: maestro
test start time: 2026-11-23 17:45:19.546000+00:00

Builds:	   76 ✅    1 ❌    0 ⚠️
Boots: 	  217 ✅   21 ❌    0 ⚠️
Tests: 	34078 ✅ 2017 ❌ 3121 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6b0493ac99c74e1a99b76f95
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6b0493ac99c74e1a99b76f98
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6b0493ab99c74e1a99b76f8f
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6b0494ec99c74e1a99b77598
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6b0489d699c74e1a99b717e7
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6b04a14f99c74e1a99b98905
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:6b0492e599c74e1a99b7679c
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000
      last run: https://d.kernelci.org/test/maestro:6b0494eb99c74e1a99b7754d
      history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6b0494eb99c74e1a99b7754b
      history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6b0494eb99c74e1a99b7754a
      history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6b04896199c74e1a99b71363
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6b04896399c74e1a99b7137b
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
