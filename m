Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52F623D7C2
	for <linux-next@vger.kernel.org>; Thu, 23 Apr 2026 02:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776911443; cv=none; b=e2NeQIB6UCkzkTkETUI492EKGGZw4Sc2sH/TE3bftLcYe87P4um7mWWgBAE4qU2i8c56GqIzTwGG6K0ub+Ni7siYZwDonkffj2twbR/BTI8Y67MerZz2aiWkDym7hcBmFW8cJmPCfnqBGF1SPeagVAlP1bvPpU/br8AZL6lUAUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776911443; c=relaxed/simple;
	bh=B3Wlhwa1sMqzNfeJm9ZFAhEpNqZZPOawdQHjmrMdfoY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=bYvO7Q5w6QE1+r+V2X3ukX4ismCahCWhatd96V3fs7cbVHqvlpTuy9W2ZiglL2xKGzUxkyi700F4aPnOzyCWoX/JHsDXDSZjXMd/5xqLtShXlTuvv5ZOWSBK0TpZ5jbRizW7KU6Y+famz9A+Q3aUsRypEMUYhoKXK9R6Lnm0mk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=IOkh6yih; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="IOkh6yih"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2e221a71e19so5948343eec.0
        for <linux-next@vger.kernel.org>; Wed, 22 Apr 2026 19:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776911441; x=1777516241; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9P6CUqYueG5tONnuk/mwQkx35Hk8nnLDYl7twtq3BA=;
        b=IOkh6yihMdWMOPGbv5MyD9qVPGrJC30Sut+NIpkdp0PunuEHFmnJLapLsqo6mQxUP7
         g28OK6ADzu8WpFn3Dul9rzyLza6HdQS8M9LgERQ7FQAAzNZ9GVtLNlRsiu/9KqwGfZ23
         eO4kh84XMPo6/kkEprDFNuaf4FiMHFta89gHtUAK8z+XgoDaWzC5hqRmGegR04Tf7IqM
         lo991fYnOPJQSW879Uq3P5YRamEMkRuI8b1sHly6rQpsK9qeK95aFUV4Cd8Er7S1zRbX
         lecaCTGqznLf9VQK8Ytl+IyebnejqxTSt9NlBESuXjsXV8ajMb6Yy233sMuQHq1gIn7M
         xFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776911441; x=1777516241;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9P6CUqYueG5tONnuk/mwQkx35Hk8nnLDYl7twtq3BA=;
        b=Z5932FNM1VlItgK8NAlU1xV1i8eK55pCMyyFgp9WGWDfv7LQ+qmozpmLIp3NbunVKb
         yn1ZV8KQE81ebK+hLYFcd8UDeTap4vp0WuNSNkOsWrRXutRN6eUWRPirSVDVf7kWF5t0
         rLzUrSikKMZXmXoHvqjEtXscX4FF1v0xPirv1Z3U/FfBzrOMNsU+ec5fIBB6PfrEB3I9
         kZIENWRA/ZXW9LtGVxuI80GPogvEPxDmqH3STlx1XY827dwQCdgKkPXiPv+t2Fs3Y82u
         +rdOnc2970NrExHQXPSkKq5/9icst+OOGIBVq/zdfEYlS+l6rizgtpDfjRhskSDAKvx5
         m4FA==
X-Gm-Message-State: AOJu0YzhgM68+p8/i1XnsVCkq5IYRD3s2dE6GsIil8BpjwF1BPc+dzMM
	tVuOyvw6NTiExsYYVluUqoX6iEvAQj9r3Hv4o7WG9W1OnlS0AefY5//acSKQK4UcYQelQHFLvK+
	kVWDu
X-Gm-Gg: AeBDieut/hChnsIJE4gEu3l6z9ddjsA5n9aBtMIiHxYcgcczArwKYLRC8402GPNCgne
	l777yoPu0C6k5LLr+LHCxmIxBsC+FIOH5MEuwE9U4mwvCeaNGDFhrlEmqjyTh1kYack2woGueAD
	xg8EjK3KUyS0JvU2Ae3H9N03pNSIdCGQLFkg3QWCgyY7RphmEN9pNHJLHpOUm+Ub/ffEOeSA4hq
	CBEHSe2FB9R1lQaBmO0Xwet+nf/zTgkvT7ZvbFscUSPe3ks8nvSN7AabagYTy4/4iHICM3LaJBg
	hLD8YQb5aAebYjrY5uuc9aUVm7bl8SXWdSBD0C6i3TvPI7XWi8EId01oCMkbgMNpFDoayCs03lz
	eZmMnAVzi3fEGkGpNmcNU9fz0ou+wYOUiQNUQwkta4SRGc3QX52RYqRFmozjeSlKatHpzCpHhut
	XL0ZJSpPEh0VbrL3x3y/UaD+vw/CE=
X-Received: by 2002:a05:7300:f193:b0:2de:aafb:feff with SMTP id 5a478bee46e88-2e466044d19mr12107573eec.2.1776911440534;
        Wed, 22 Apr 2026 19:30:40 -0700 (PDT)
Received: from ab39070dab57 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2ce98csm24907715eec.20.2026.04.22.19.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 19:30:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 70c8a7ec6715b5fb14e501731b5b9210a16684f7
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 23 Apr 2026 02:30:39 -0000
Message-ID: <177691143954.1164.17172096894007242638@ab39070dab57>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/70c8a7ec6715b5fb14e501731b5b9210a16684f7/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
origin: maestro
test start time: 2026-04-22 13:42:50.430000+00:00

Builds:	   57 ✅    0 ❌    0 ⚠️
Boots: 	  176 ✅    3 ❌    0 ⚠️
Tests: 	19533 ✅ 4140 ❌ 2834 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69e91de59b5a968309f52616
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: lenovo-hr330a-7x33cto1ww-emag
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69e8d9f79b5a968309f41ae6
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:69e8e9899b5a968309f4cc28
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8dfa99b5a968309f49ffd
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e8dfaf9b5a968309f4a033
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e0de9b5a968309f4a9ea
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e1989b5a968309f4b8ec
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e8dfb69b5a968309f4a045
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e1329b5a968309f4b599
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:69e8dfa39b5a968309f49fe1
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.devices-probe.shardfile-devices_probe
      last run: https://d.kernelci.org/test/maestro:69e8e1149b5a968309f4b227
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e8dfbc9b5a968309f4a072
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e8e18a9b5a968309f4b8aa
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e8e0cf9b5a968309f4a721
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e8dfc39b5a968309f4a09a
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e8e1b79b5a968309f4b9f7
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e8e2ac9b5a968309f4c0e2
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8dfa59b5a968309f49fea
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e8dfac9b5a968309f4a007
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e0da9b5a968309f4a7d4
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e10c9b5a968309f4b1d0
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e0ec9b5a968309f4ad1d
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e8dfb99b5a968309f4a069
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e8e1049b5a968309f4b158
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e8e0e89b5a968309f4ac3f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e8dfbf9b5a968309f4a088
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e8e0e69b5a968309f4aaa8
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e8e0da9b5a968309f4a8b9
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8dfa69b5a968309f49fed
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e8dfad9b5a968309f4a02d
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e2a09b5a968309f4bde2
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e1d09b5a968309f4bace
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e8dfb39b5a968309f4a03f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e3729b5a968309f4c326
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e8dfba9b5a968309f4a06c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e8e38d9b5a968309f4c340
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:69e8dfa09b5a968309f49fde
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.shardfile-dt
      last run: https://d.kernelci.org/test/maestro:69e8e0ed9b5a968309f4ade5
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e8dfc09b5a968309f4a08f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e8e4599b5a968309f4c44c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e8e4809b5a968309f4c617
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8dfa79b5a968309f49ff0
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e8dfae9b5a968309f4a030
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e2939b5a968309f4bdcd
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e0fb9b5a968309f4aedd
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e8dfb59b5a968309f4a042
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e1199b5a968309f4b28c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e8dfbb9b5a968309f4a06f
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e8e1d29b5a968309f4bad5
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.exec
      last run: https://d.kernelci.org/test/maestro:69e8dfc19b5a968309f4a097
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.exec.shardfile-exec
      last run: https://d.kernelci.org/test/maestro:69e8e1f49b5a968309f4bbfa
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.iommu.shardfile-iommu
      last run: https://d.kernelci.org/test/maestro:69e8e2a89b5a968309f4bee8
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:69e8dfb19b5a968309f4a036
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e0e89b5a968309f4ac46
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69e8dfb79b5a968309f4a061
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.shardfile-cpufreq
      last run: https://d.kernelci.org/test/maestro:69e8e1259b5a968309f4b35d
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.devices-probe.shardfile-devices_probe
      last run: https://d.kernelci.org/test/maestro:69e8e0db9b5a968309f4a9de
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dmabuf-heaps.shardfile-dmabuf-heaps
      last run: https://d.kernelci.org/test/maestro:69e8e0eb9b5a968309f4ad15
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:69e8ea309b5a968309f4cf91
      history:  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
