Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B511EEA49
	for <linux-next@vger.kernel.org>; Tue, 19 May 2026 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779157823; cv=none; b=W+yPjX3cNzrWH+MLmNzsjkqxeoxF0HK96mVU1Yl73F5k+QPcb4+CV185yWn6YCl+dEtJQc2ZvP1VK/7qAv6dVmzLkgIpxOXfYVjn8D5rOeUIQkHWzEOTJw3vndAQUb1pZILxMIdwxorU3XPrV5b6LFZMY9HWX9xYLRF/OldDO8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779157823; c=relaxed/simple;
	bh=6KydcwqCM/taaHtrVyGRo4YDzTh1/ekTTvuaHrlhAts=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=VLlrNBgjjWs6DReusvzkYcZwD7+fYSdBEbWfHxVcW34UUgKZHM2lFbBbUBR2je3fgJ9UuJ2lrhA4NsT1++Foo+cSnqr3u0+PnJiWK2iukZU5oEAbB1HnxoSjBjQIusy1+du8pKZmkSyet36jtYece8GPycLvg9ihNvujm/rhCYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=IK7r4TFf; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="IK7r4TFf"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3025d725a05so8554509eec.1
        for <linux-next@vger.kernel.org>; Mon, 18 May 2026 19:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779157820; x=1779762620; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZjWjWXRBq3gDbfCBpENsVYiXfI3KtaUT9toOvTI98U=;
        b=IK7r4TFfJ1RW9UH70+AEOvjNprDQQumEjx+BYC+WT8C1AomTFQfqjFuOOPvClcdjun
         5sYi4LwNuQkCtS1TwCl5W0EhN6H/yDfdNJAmhOL7MQxXd7mdRftzW79K+Y10Yh+lNYXW
         quhyofzwHdqDAwV/mGRTZJ7gJzEyrh3EDGvQuXK/nc8THZ1w79EqO+13vrbbBSooQ1UO
         1zoYDOhNzwVzqHJLz+adnja3rlMm5k04zb8NO5i6x9CyOyktTdXpBcyJDz16bfThwR8C
         fTZLAsmxF5ccaD/gPQkYg4CktO+kOfxDyN6Wrxh4Uo4HX1jWyAW5BAqh1CY9r1OJGjh1
         iMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779157820; x=1779762620;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ZjWjWXRBq3gDbfCBpENsVYiXfI3KtaUT9toOvTI98U=;
        b=idQ+S8IVcYNkAGQgMqFFI+zk7kdJmC68bQn3BTVgfwKE/eXRZwykndDNs+8hguoyR1
         YtOyKvGHCZcy4uaiFJLOA6gOVcO6AGvyiL8tT0X/jerfcsVUnADMYulUgJmBj8VyRWj8
         xl/RQmaOJWIqU9n6z0X/GtrWfH8+NA9u7r0sRoGk8SBqIZdQ58cmThILTS8Ao78Ff+iT
         U30EoVQTWqAQxMAMIfZzRdUJWII43a2d49vjdHssVhoizLloMy/fOXDvGebqzsjsqVVr
         GFf2WVLqzXaW08NB4+k0vAofdbWtAHhyAwM1PJyt60juNYI943u8/XyDiORBCUiWKkYk
         Phww==
X-Gm-Message-State: AOJu0Yw2Es5IoNpL06+d+9Pmxx4Z1XHfQVKMi38+m2l4QFMunLr7dVOe
	C7gKEU+6o3VQudETbA/Xrx5gVESb/VoCgZpUJZTukkAjyoDW6X7wY7Scdips9+/MWCRrLWa4fsX
	oBtyD
X-Gm-Gg: Acq92OH99SZyNjbRd0/hMPlDF6e7xQdFB3kI2KeOuNHG+HVFc4XsBS7NehLkzqzQF7D
	LL/3X+Q2pveQMDUjL1gffZ92w2ftqJzX0ZRQM+4a7WRWU1qaHCFUL27o4HvlRxtX52qpBe3e+c8
	o2EioNBBMHesnIDrwtYjdd5HDKsw40J2+p6/xvTCW3pY16r6ehFHLG4bAYxKyxR9HfY8/gEyEgm
	wZ7SQjUzKfqm23yu6lPRXeqy0OhHhgD4Zib9SGwQl9gT+XZoV6665AxhX0i//SoH0NsKZjSbOZZ
	vlNAXgP3RWhhTTsGdGXEtuW939duW8vDy6O4aSTHb/75R1Mw7yex1dk1FrMGsDOKyKY5Vxh6FrZ
	r1XgZfBdmPdNhhU2UEbXS7qd+7UQnNYdZ9hNA+CP9jc6voHClo9UCIDGwGN1RblOedJNmse++ld
	MoNFGpVRJkWh+0XDSx
X-Received: by 2002:a05:7301:2a0f:b0:2d9:6373:ad10 with SMTP id 5a478bee46e88-3039812a653mr7343647eec.7.1779157820453;
        Mon, 18 May 2026 19:30:20 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500726sm14354948eec.10.2026.05.18.19.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 19:30:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 80dd246accce631c328ea43294e53b2b2dd2aa32
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 19 May 2026 02:30:19 -0000
Message-ID: <177915781955.2611.9418192194275218797@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/80dd246accce631c328ea43294e53b2b2dd2aa32/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 80dd246accce631c328ea43294e53b2b2dd2aa32
origin: maestro
test start time: 2026-05-18 16:56:08.713000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  130 ✅   52 ❌    7 ⚠️
Tests: 	20715 ✅ 4160 ❌ 4876 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0b71cb744d1c1da01a32aa
      history:  > ⚠️  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0b52b1744d1c1da01985fb
      history:  > ✅  > ⚠️  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0b52b2744d1c1da01985fe
      history:  > ⚠️  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0b5534744d1c1da0198b6e
      history:  > ✅  > ⚠️  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
