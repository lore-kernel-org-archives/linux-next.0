Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48C122FE0E
	for <linux-next@vger.kernel.org>; Wed, 10 Jun 2026 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781058613; cv=none; b=YVkvhOAsENDpmaT4CV3MWi3EEOGUOXgCE8JBJdqnC7cahmBKnME88XpWiclAEyJziPw3eA6SL05/BUpMd87RMbgM3h7fyxPxnFrDP1WhkMISoj9X0PAi7uwQhV1D3gZ0VBWC3Uie1T44DtvkZDESymAEIvFPCdK6gfcj0vu5Rt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781058613; c=relaxed/simple;
	bh=7E+96kbkpbnd9p9+r4BhevPhKYL1x+4cAwsUI4UJSKM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=FR8Px+P1bh5eFlvCmHjzlIauz1785BDhJbgBvBPZpIDthpjbOyazm7dNnAHZhWUrJugnEdvcxlaKRXE7fOhz39oJ74+cbo/n/QaJTf6Fct3ZnfX+qWYIp/6W7ea3tMqYmOXlkIP/2lfiC2gyUrS4Dl2VcOIHPnKXprgg2gGq1C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=UFfOYviJ; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="UFfOYviJ"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304cf518c9dso7732369eec.1
        for <linux-next@vger.kernel.org>; Tue, 09 Jun 2026 19:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781058611; x=1781663411; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QporlrzfN09BDXcthlpIa9546DmgHywrCyqiRRUTkHY=;
        b=UFfOYviJisOYzccqIAqhtfYQ4jwFkLXB9fsJz31bWFnlBrUdkNfCrJleVo78YRwWlO
         bm7xr65DANKiLuPsnSfOUzVajMd7aRPdNDHrydEofXdzwFDswDxCsTFnOX/yn7gfQnb9
         53dZdeGfjJRM5yAjBDgMF2Smo/9yjK04aQJ021Wx2K2jLZth1ScAb6ygAMblwSjkVe3x
         6VgxGigvmmVF3YL9gJLv8p70ksUffo9UecaoHfAZNRJ0YdAQfBtZdl2kaZvj5NJT7Ya2
         gkiRBATAdro6/9qbXWMVaiZhbI/WAMULSVpBcwmCc7WJTH1u4FlvvkS7LXE0kQgoYhxt
         ZPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781058611; x=1781663411;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QporlrzfN09BDXcthlpIa9546DmgHywrCyqiRRUTkHY=;
        b=R0ylOSBDeqj2MV3/ks1ljB7+nf1Kyk56fGo2zFGjVnVDWHI06bz9c+7MacpOcWRtA/
         eGLVr3Ckxxdks4ds1jgFZ0aTiah0XhUPrkbpIUVoIOYrLIS98Vm9x26ZjQb6b9EbXxR9
         vtyQiwXJkd85uVXJswLfPEoL87rQUC9PLplXxRp99SNsOvMb6aPrw7v2qPO5sZNl+DRR
         j7HGuviYaf+ZFgMGtGJ/PzJIPcvjm6fgzhlWpxqTC99nXUcid0NKEmwD5WdMqf04oWhl
         OeNp9q8EEMY8MAvd7ZwsS0OTSOZHJJzOPYEKWjU4V/8wQWELDFfsJeXU15cSmFN4rLlS
         NKgA==
X-Gm-Message-State: AOJu0YyRVm3Dz4xgYToqviKrHpToRfZzzPkhVVIxtea/r+xwo3q+uMlf
	rjIKLaOS/EB3J53/1dWhr0fPZfXdcZODLJAWNCicrCKwqu5Qv6ZPb8ibrq7KKjdJo+E=
X-Gm-Gg: Acq92OFpsU8Sx/MeAQ+SKiMcPG3ko5ZjmGoQti/b8NO+9rzv9E1EqPUJhDk5XwmT7xZ
	UavHYXtP8PIV449itrsJg95NwvtqZg7kKgnQe74ClADvRQLlRKvOxg/dMfIHnbN0H+bUlVOPTJO
	gofePAQkDM5Mr5Sn6qGmT9zMX3HtIGDymWiFl8skb9Axg5JQZmpOySZKK/i3IsfcgQvvhDU66dh
	i+Jc1XFCrFvlMe/HuG9SL1zrjkZTlDzaRdYY91JRBcqup0SL2Bix/z/9GYpP6hpGLHbcQTmKMo1
	BqhgA672XBPfJOrz/nx449RUa/rbuyDzuEBipa4IPhBP35KeCMXi0EiQmaEc9W31wZ8HK+zRX4x
	Bu6/A72rV8bHQM39DFIV1rw2SzaSl0vv30dop2yAd+SsMV61e8pQFspWhNAUB3qWWxxTRFsf9PW
	vtKvmC7k+ih9ycBl7N9yLZyW0ltXE=
X-Received: by 2002:a05:7300:5710:b0:307:34f9:cc9 with SMTP id 5a478bee46e88-3077ae88144mr12917788eec.2.1781058608166;
        Tue, 09 Jun 2026 19:30:08 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea89easm25115495eec.14.2026.06.09.19.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 19:30:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 49e02880ec0a8c378e811bc9d85da188d7c6204c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 10 Jun 2026 02:30:07 -0000
Message-ID: <178105860735.12723.2697253482636314772@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/49e02880ec0a8c378e811bc9d85da188d7c6204c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 49e02880ec0a8c378e811bc9d85da188d7c6204c
origin: maestro
test start time: 2026-06-09 18:48:49.703000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	   72 ✅   73 ❌    5 ⚠️
Tests: 	12711 ✅ 3067 ❌  556 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a288224dabb8c619d3f0810
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: aws-ec2-arm64
  > Config: defconfig+aws-ec2
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a28690fdabb8c619d3e6aba
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: aws-ec2-x86_64
  > Config: x86_64_defconfig+aws-ec2
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a2864c3dabb8c619d3e3efe
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a286ed8dabb8c619d3ebf77
      history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a286e7adabb8c619d3ebb39
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a286ed8dabb8c619d3ebf7e
      history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a286e7bdabb8c619d3ebb3c
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a2865c0dabb8c619d3e44df
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
