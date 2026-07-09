Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26D83382E1
	for <linux-next@vger.kernel.org>; Thu,  9 Jul 2026 02:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783564210; cv=none; b=ohkmvfm9AH+/ttM06GxSM5Zt6iYwIosMdrb5kEr91G4LGkkxUXlgFkueIq81/HTPuXCypghHMaNrZx/hxyf9HcqDM3Kwxq6++gs7p/uui+yETFOodf1ueGFlySn5Gr78+lwjjW1MnJkYpIQruuu1ak3HyQa7IeGHZg6vVaoiNcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783564210; c=relaxed/simple;
	bh=sv3oKW73dYhKm4OlU1smUOO5/h3HUW/2fhXRMpcdnrc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=bozYPOHQDd51VcTUrPsLw8adegty3WXeFIKPq8VwEKkogYeBnWiH19AN7vCpCsYsSTW8epzTvWOhARYxKTjDOp7TUcZW4/d+3nmVd7vln2uIAFy8KLGJH8k0JZGf4bNRVJopX/XARB9pqUm9Hn5akkm3JhwF0t3SzVnfgZnBSkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=PnjhK2Tn; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="PnjhK2Tn"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c88973b6965so322359a12.1
        for <linux-next@vger.kernel.org>; Wed, 08 Jul 2026 19:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783564208; x=1784169008; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nCGE/gXWzJDCsk9LfB1qTCInggsBaR6WkEpluLvXoFM=;
        b=PnjhK2TntyCNmUUJEk6WIKRiT9rv+iJ11TfboXdmD7bEMrDLub63G7XLYXObU66aaA
         lC3aygWzW97HlHkMSz4Uj6OnSc2RPlqx87sOdlNrljUJFtagfdgAxzbCnA/1kxhk0POy
         054R9v+0aUEbF4ScegHLrd783awsBom22Ft69dL9uDz6f9MoslndbGRUVjVNsv9fSgOU
         kmrjw7AJw+wTTP7HqrvR0D6+gvFqfSVgrnAJa9s4vkEHdBAeY9jnTqMOnNWa1QCgqiXx
         xya6Ux96A6W1Zj6C1l5Wi3S4BqNLS9souguwfYMphwxbTaSdX0qnHgG2ga9Nkly2mQBQ
         c0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783564208; x=1784169008;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCGE/gXWzJDCsk9LfB1qTCInggsBaR6WkEpluLvXoFM=;
        b=Dho1IfiGmcQhxHbK5Iz4hyhmLPlBeuXQn0+EflzUtez/kKc/4wleElxMiJwupXR2Dy
         JcPj51WqbunlAQvLrWrtzqFxmGSc1CV7Sk8ASK1g/1fvFzApxfCoCpYZJjAGOJrD0Ozw
         vz11929q4Yv9bw0e/DqflPrL9Wx3ZKksczIMobXXCwxuRRrNC+wZ3qfplbYUPVQAcOh5
         UPm5i6puHWLVwHYdWoqBE0mvZuXYV2GECZdxNN29jykCGgJX/jY7TBRaqqZfeJpveJBN
         6Ag7JCcalGWFeBHNVmFtWhHp3Fnup6rN7yeLLTAF1Wt+re3YEkJPFTYt5/fn87h7KEuJ
         Icxw==
X-Gm-Message-State: AOJu0YyjGzsPorOQ64Ns7Sx2tdH2gifYTE/Phv3TB/leoaE8WWCYV6Aa
	qeS1GYk9VQtarhdNiKSiMnJvHlUQ6yQHTnCrZGodb+c26LGmmL1Xbu0Zdru9PvUdV9w=
X-Gm-Gg: AfdE7ckotQQEDB7tw855mXIy6r0/kmNjkDnm7xmLcV8KiD4L0GEWeEEudAzxbVQBds2
	iZzi685uXBubrvG4bcXI58cQWO1eG3cIN5TFCW37hAg1xGeA0KjiojliySfxaradJH9uRSh0LIm
	D9/VAjPrAq/Xq9YKrilbhDtVTEmmB0Iwi/cx672jvZR1nK54RlzoQnII/B5XorDku7XAF6kyaVB
	YU5Ul+Js+3sQ6sGuIi3ZABzTvG56PB5SUP9UAxyUShmhO2vzfB6hTIwERHLPmyqrPbH4d6UNvTG
	oXmaDPfl1sv6OKtEeNWq4MQH6iT0jKxg/Jaq3/92DYPxYfwUmV7WZh3whTcM994AtFrbyrijQBx
	GZStGK7AIun1g31cTLks6BGVVjZnwfihAijGKGIPeCIB2QDBR13oAo/7j7po1VRNJTwVaEdvPkr
	9An8ncLg==
X-Received: by 2002:a05:6a21:6490:b0:3bf:9e85:b423 with SMTP id adf61e73a8af0-3c0d6c14ebamr1234953637.34.1783564207868;
        Wed, 08 Jul 2026 19:30:07 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5982sm27134689eec.5.2026.07.08.19.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 19:30:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - b9810cd75b9fb56a3425d391cba3f608502bd474
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 09 Jul 2026 02:30:07 -0000
Message-ID: <178356420682.7806.8693853589903017162@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/b9810cd75b9fb56a3425d391cba3f608502bd474/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: b9810cd75b9fb56a3425d391cba3f608502bd474
origin: maestro
test start time: 2026-07-08 14:17:25.846000+00:00

Builds:	   65 ✅    1 ❌    0 ⚠️
Boots: 	   67 ✅    3 ❌    0 ⚠️
Tests: 	15820 ✅  943 ❌  122 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a4e752306fecb7f474e57d7
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: qcs6490-rb3gen2
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a4e756406fecb7f474e589b
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a4e756606fecb7f474e589e
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6a4e758906fecb7f474e77c7
      history:  > ❌  > ❌  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
