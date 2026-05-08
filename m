Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196B727CCE0
	for <linux-next@vger.kernel.org>; Fri,  8 May 2026 02:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778207412; cv=none; b=nBTQ71EDQCICosDAXf+OXURox1fHmbqx+eM/Q1hM2uJaGLiab9NZMIA18xRhywjsypo1shP9jZL//0Gqt2/T/O9arZHL/GkzkeeVRwYB6UwaGzfAup3iad8qDmf97m9b6bDyD/jUaZowbX8L6A/8E1R92QEiG7J7CvZJJMXiREE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778207412; c=relaxed/simple;
	bh=iRurRU+i6aFIJl1PTqeAt+m5dVI2hd0O7/JAYLYNHo0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=FWJhSk5aDoZqK+ji+BavsPkK/itWBjSBK7oQaJosRdipquN+5X/b2birkW1BcsCS8DAsN2c9Sj2vyxq3YsZQ/nRkCxAZVKfb2HAYbvieR+JmqaCTvFBYLCADJL5dJkf9uQ5XMqMxj74W0yZKtIXAVHu0268pGOwQGeSTPsBEuuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=fCkbMY9U; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="fCkbMY9U"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso1511678eec.0
        for <linux-next@vger.kernel.org>; Thu, 07 May 2026 19:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1778207410; x=1778812210; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lFjQUZZGZOyToNhVu1vYETT0Af4m/FljEI7TxSTXgA=;
        b=fCkbMY9Uvr6XUWZAcRKBQOGwXL9iRrIojiFncxb0XUQKoDQ/faGSez9zhOoHUUbSAy
         lm7V7ek1QSfQqOt5ELsm1D4RQB1XnsXCjlt4K3RuPEXIhtiCmc7PHvfB0BeKGAmWljPs
         GocpeRz4Ih7t1G7YiGlKGVCwVlHklUxrknd2pkus5bttzumIV2AERI+azpH6GzglxbPH
         ItI5zj51ROMYMOtzXFiJcETAh+gd2vfdrwAqIMRVPsDE04omrwyPxKfXCnkxAYcoBvkS
         AwimCj6DwswS17VqQovqNMmiU4I8YWiOqGzfQpeCS5ZAt/P8BHtZzwwnGuL9qX7kZzKy
         IwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778207410; x=1778812210;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/lFjQUZZGZOyToNhVu1vYETT0Af4m/FljEI7TxSTXgA=;
        b=PBN1rUstvl5jNtSkfj7lViNwuRwRfYBqc7jc1a3y10UyvBE0K4iUv2esirisT6rssN
         GoqbNpYstn2Rhp5VoZydQDLJKz2yyXljTKg+4D4/azDNrFJhAcMsNGMvKAjxQCowl5yj
         HFsKfZhLGMyk0zMLEAAY+JocB15aeEDngrLDiLd4hvd5TwEfo6TceL56Ybf23QctR/QE
         asR7F/qqKjn5JG65HqC8HhShpRVn99ZS4FiqQ6r5IrL9dQH/ngN2q9xZfjUH39azUeNF
         mepFDlb/gQ4RD6mvbnDT7Nh1SaCrPyH/9VKTRKB6Xvar9Ab844466y0d0sAuLjqxO829
         Mb5Q==
X-Gm-Message-State: AOJu0YxCtkK/a3y7OottqpqZgZ4GKQ/yEyiJMN5RY3CKrbTh7KfdYrG3
	1AtCP3FOfR6jxa3mmdI5YVCe9j0Ma7v5qQw8/8gl0LisBVsVmDjFhsyvi8HIWTv2AKf/BErmfNa
	6h8bG
X-Gm-Gg: Acq92OG+OzLzTlsWuMtBolxd7y2cbRRXBmGdNJ/3tsu1ddPhMkWiwGu1wMlpqq8VBq6
	4melxqOfZpJbtYjmjTt05Z7dI1+871pjaKgQVPl+VciieQ5lqrjyIPGBJS1uPkDub9TJPXPDPn9
	WgU174oZj58CaoHhki7puSeTVTEyYZY+Goe6kxos5P54MC8jcuWTJ1DrbsyJwZROmEl4wU8lbyY
	D3EmN68ro7mUFdqnsGXSzics3ui1tww8DJZ9B/Xx9t3Q4XFLgrkBGwra/t+4g9wO9kyGZEwzF6g
	tbRh0SP4KVcuFOlelcCBlPmLv57qommkdK7bQ/F/UhS552lIbCKD0lhpjhvUDzy2jxEt4bx2mzo
	hnyCwEL7XA8sBVaeqDzXw2nCKncJ0OCUj4ZNMmenluidLmBzZr33ZU/TQgE+VlglMacvbzdDrhR
	Zx2rujirJlH88LTsWn
X-Received: by 2002:a05:7300:72d1:b0:2ea:ed7c:8064 with SMTP id 5a478bee46e88-2f548895145mr5277110eec.3.1778207409616;
        Thu, 07 May 2026 19:30:09 -0700 (PDT)
Received: from 997d03828cfd ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm411537eec.11.2026.05.07.19.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 19:30:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 17c7841d09ee7d33557fd075562d9289b6018c90
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 08 May 2026 02:30:08 -0000
Message-ID: <177820740818.3994.11638422324461181473@997d03828cfd>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/17c7841d09ee7d33557fd075562d9289b6018c90/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 17c7841d09ee7d33557fd075562d9289b6018c90
origin: maestro
test start time: 2026-05-07 11:55:28.451000+00:00

Builds:	   57 ✅    1 ❌    0 ⚠️
Boots: 	  176 ✅    9 ❌    0 ⚠️
Tests: 	23452 ✅ 4031 ❌ 5983 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69fc8bb90e4ee292cbe6f3cf
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:69fc8ba40e4ee292cbe6f34e
      history:  > ❌  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_steal_time
      last run: https://d.kernelci.org/test/maestro:69fc92880e4ee292cbe75696
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69fc84ac0e4ee292cbe6b9a6
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69fc86bc0e4ee292cbe6d9eb
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_steal_time
      last run: https://d.kernelci.org/test/maestro:69fc921c0e4ee292cbe7525e
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_steal_time
      last run: https://d.kernelci.org/test/maestro:69fc921d0e4ee292cbe75399
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_steal_time
      last run: https://d.kernelci.org/test/maestro:69fc902f0e4ee292cbe747ac
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_steal_time
      last run: https://d.kernelci.org/test/maestro:69fc922d0e4ee292cbe7550a
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69fc8bbe0e4ee292cbe6f3ed
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69fc8e150e4ee292cbe72bb6
      history:  > ✅  > ❌  > ✅  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69fc90ce0e4ee292cbe74d2c
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69fc8bc30e4ee292cbe6f424
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69fc8bef0e4ee292cbe6f576
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69fc8bee0e4ee292cbe6f557
      history:  > ❌  > ✅  > ❌  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
