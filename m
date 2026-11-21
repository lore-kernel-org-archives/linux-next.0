Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795228223;
	b=KNfdE6Z1Ddy2kwzM8qZc8xKWHWQC0AFJki2UnIKzjP56nDMtMpNvEZwmLQBEWNSMETng
	 yCzL/tydy4xPWFay2b2ePkucn1GUYlNT5qT+0KomgwkIF6xZNdrn2J/NB3+tnuZwBI17S
	 skYAT3TEnnWvR/pugBRCts7yMhcwKQxcIytUgV8tGtmMMrMDHmKGkZ3Mcck6/X7Yb4/On
	 PfQbuD/jG9GumyjgaMKc+snxyf3RQVT41wKXkAItVdgEPOSAAsOGltyqL3ZN9tmPtM73d
	 y3Te3u9B0sTlqtzSl6kxkf6XSXA+0OPapIw5gE2HC0PYEEu9vgXk+RxtA7U9vTBRIhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795228223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=3KdiOb/AHbMgMR7BkgA2DBeQKQZytmx3EjbMKNnINUo=;
	b=Ai0p7YohA7Hrch9AEtvq9dcQb0/I8eULfA8pw9YuCfPLbhEFXi0pE72c9DqdatwvHNtT
	 0Nfdouqgu4SWzQOQP1I+jfoXi2Gb1SxcpjpJHEHOCQcz+PZouQKAeXluaFFPaa3k5Dl+T
	 /IdJsvmmdwXTOId3NZQG/p5xh/3zihCss6kDSU/FOUiiBQ8Z5TKYN2fg8PUj2ScY+f85D
	 9SK7FuxLOTXtAYC35ut1TlFsDoDhrqeZP3I9oHsxNL3cIlcnlBenQDyDQ5ZexpdyW4NSS
	 W3LAYL19rl/NoJkWHIlaAd7cnaHcVXNN8WIKXPGZxlbX4zLuP0C0pngoazbaG8N/+BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=DZpU3OLE;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C43606A6A2
	for <linux-next@vger.kernel.org>; Sat, 21 Nov 2026 02:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C43606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=DZpU3OLE
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3acec6677so2262740c88.1
        for <linux-next@vger.kernel.org>; Fri, 20 Nov 2026 18:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795228221; x=1795833021; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3KdiOb/AHbMgMR7BkgA2DBeQKQZytmx3EjbMKNnINUo=;
        b=DZpU3OLEue0JuKYmHiyUN/t9i9WGx1aJegKa8PEvmOlVtf3SpnCO4vJCO40ZPEVBBC
         Nv34v3OobpMkGDa447HLG53Q8WjVPAaBr7DLv1rJVZa2T/PLGzNY1aH6/D/ZqRMkIfUd
         8WyKCe1Qt/zdfa988WHa0LsjCL3q89XVTf5xvIENHMTHlt71Cguq/yimmrwz5WADBRzL
         Vgt3ND8LDKLUrkE90N00HHOVbbvxOHXmyUvjh4wQb10L8zOfEh7XuPv1+PFYriNWJfTO
         ooxyYSlrPH0ZqtzTNk7PboAbZWQNuO6mnTYaD6bYcMX8A4QZe4IO0BRTqeLqt9xJ/5ho
         0WVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795228221; x=1795833021;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KdiOb/AHbMgMR7BkgA2DBeQKQZytmx3EjbMKNnINUo=;
        b=Zw5dLHc68JSFzR6B/gqRdKMNOJ8bj4d0ojxu7dQAnHqQjpjivGfgDfX4YiSGDvnIy8
         ffSb67BiwIftDG8BsTbGhpTMMVNDGlRkKG7+73DJ942uThHy78XkrxLpQ1t3wjbWd1eh
         SzsuWEH9naUf5Cud2xA1qVCl0oYyCe6CQcq0SYYDry1bTo4Y2LX+1gqpwxZQAQt167if
         c3zuS5xtCRqKZjrl0v1pRzLsYV7KIqZ+dqc7Sb9QW3J5lbkNR5pNSQsBu2vSoxEMPGnM
         DpW3Zo1/PnEkA9FVvTTbZL83+fJbUtVNhS6QYokPjm1BGjCCknz93svpy0reax/eFl5S
         51nw==
X-Gm-Message-State: APuU4Z8+3uv57edaKs2kZ2YoGF5cneA1kyfU/qjxauWAmX7+T76XUmKb
	/vYZXItNZDuCGfsQ3a4pDWn1FjNn1OIypMMZNDuvWXg64r98rWeJAdtOOpU0WRolTF0LCl27Z7Z
	aeJCg
X-Gm-Gg: AYBFou2V3h+gErFpEyRQdpoxnjLQhmRFJy1sChW62gVL/ypDhXbTUnqr8c14DESijBW
	couzQleMG8HYNhR1Nb9yAq6mRYYFUPgNSCREcXJMrbiYZC2qewuIHfL3VKvYlm084c2RrBEV5Qf
	BlQAsMTrJDmcjF1iSgtosFTCApNEKxASIErNqTwcnlWCHlkydN2g8yOOUVYWQKNKNp/aDK/iQZl
	5U4OAWLHq70Lx3PciEYOcHuEeWeIxYwpxFRQqUABvLJuSztrbPT1d811XVUTQX7TyWXTcM3e+bG
	O709lj0P3hGcSs2CKjgqW2rs9uozsMAMqpFD3Y0ifttXlIPw7iUrnUznJqlYqhhDRJ89k+I0m2e
	mzlhNNExp0KvZprsgDSvyVCKPDUhWSg+De45K/rNlABpLkwPI6Qdia00CWxaXY/rNb/rB/muikb
	An+b+gTkznR2eEnCjNGw3fTvpvaHhPem5MadkpJ2eIe2rfu1RvwberOs2ClRJDIk4L8YpqcfvBK
	OGd/aWw1jf0f/oDpoZj6glXeDTpS2No66otDhSUTECI9wsZX8dgy5wl1uTj2qrPZg6zMgANBeBE
	Ek0t0QK/GZ/AfFCVkz+k1cW9i3Jtp/dPzd+ws6mmXUI=
X-Received: by 2002:a05:701b:4555:20b0:1b5:2988:eba7 with SMTP id a92af1059eb24-1b556947286mr5126083c88.41.1795228220955;
        Fri, 20 Nov 2026 18:30:20 -0800 (PST)
Received: from ccc7006dfe57 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm3321728c88.11.2026.11.20.18.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 18:30:20 -0800 (PST)
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
Subject: [STATUS] next/master - 909ef7a9a30fa139e69e555e3606680f5cca7726
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 21 Nov 2026 02:30:19 -0000
Message-ID: <179522821956.71642.14968454540875002518@ccc7006dfe57>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/909ef7a9a30fa139e69e555e3606680f5cca7726/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 909ef7a9a30fa139e69e555e3606680f5cca7726
origin: maestro
test start time: 2026-11-20 17:25:17.411000+00:00

Builds:	   76 ✅    1 ❌    0 ⚠️
Boots: 	  211 ✅   21 ❌    0 ⚠️
Tests: 	34116 ✅ 2161 ❌ 2953 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6b009ed699c74e1a999e95df
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6b00c58e99c74e1a999fa6e6
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6b00c58e99c74e1a999fa6e9
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6b00c58e99c74e1a999fa6e0
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6b009f6f99c74e1a999e9e4a
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000
      last run: https://d.kernelci.org/test/maestro:6b009f6f99c74e1a999e9e05
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6b009f6f99c74e1a999e9e03
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6b009f6f99c74e1a999e9e02
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6b0098c099c74e1a999e485b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6b00afd699c74e1a999f4514
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:6b009e5599c74e1a999e8fb9
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6b0096e799c74e1a999e2572
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264.JVT-AVC_V1-GStreamer-H-264-V4L2SL.BA3_SVA_C
      last run: https://d.kernelci.org/test/maestro:6b00970399c74e1a999e2816
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
