Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F3D29B20A
	for <linux-next@vger.kernel.org>; Thu,  7 May 2026 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778121013; cv=none; b=QauwOXrWhwIC7ykrzMMmu9T0ykpucSNtsLCKLjJla/mt5CZyBr9SZSJ5sIy7mr75gqoDIg5lzRmaQ75U3STtBKKOVIaj5qoTLIq5fdBTbBEV86u+PV4wW2TITdRru6CF3Cu2TTKvY7n9R8ypWYUzmc0s62D179FW+X2iqdykNmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778121013; c=relaxed/simple;
	bh=1/d9cUYSUpm2bz/0qfTBKcJJCj4mp0XhaTQDJEuVe9A=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=a5ir/Vr9g9ztkByzKbpfs7HfdWzvRUkpBJGDazOBFUJeub8IbO1lDs2a1dX7Kt0+8Pa4N41fdRbllStFL2i1FjlSaRw3o9w0eTWCvYm0MIBc/Onk/s0RKfaSEy2BuKuo3DU9p+SbL/nS7RLJv3eVJibMu5xiwEd4S8QAgz7sQNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=HBE46o9T; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="HBE46o9T"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c15849aa2cso447991eec.0
        for <linux-next@vger.kernel.org>; Wed, 06 May 2026 19:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1778121010; x=1778725810; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjT1c8zvmT8zja9tIJT1FDnTKdahvMuLIhwReGtWZxM=;
        b=HBE46o9TsBU6J+s2yaMTCXri2rNIE/GAT/HQoYLL34grnnKIMQdFZlO52FVN9Jl3RN
         hcv9tuSY4aW6iwCyktkbik5rxi9ywifCWJur5WJ29mvKP5iyoZ9opMW88UwvnmdJFNY+
         5j5riihHJgSP5SpqmQvqzC5vbtVUtv+pzrHYCmzueQeZBuOKynal8v/tlRacaTu9vIj6
         l5amwXBsKqDeDpIs+6ggZvL0gqM4OkpmFf6pQPE/iVGwMjmuRFwLCEyZAA6wM7JINg0b
         Pwy0C18lMO6CIpE4TCqSpULVkYgTLVMGRRzg6niFiIRSnQC4Ou4CPJn3iyryfMlgzIgZ
         MMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778121010; x=1778725810;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjT1c8zvmT8zja9tIJT1FDnTKdahvMuLIhwReGtWZxM=;
        b=T6i8AcSiA0VF7S6F03P1gVLu//LxM5gp0YUt9YYF+xEoAbMqvqnavo1mGtwXw1anhN
         a0f9pUdeBaB01BD/7KJ/+KsH7JHIvMfF2Epw/jgs2gF/C++iRfWSk0oPerRnZ2440WrT
         NUAG9wI5FNLuXxMwmB2IvROr9hvdbDDzeg3xUXqoc6snfeiF3TizvPkFcTFDPLb4lLXX
         c7nxGf0tq5exd7qk6ecMUN72MaQ1awUz/Qi51BcXWDQLzaujzFeDQW8XPGLThNjchLsB
         NFqT0xC45ZwfzcSfZYWnufjDc86/w7nA6AHHb2gM1UY1+9HGRd2/TOs+7Q2upKZgjUHD
         vM5w==
X-Gm-Message-State: AOJu0YynA/0Jjve8XaMjoXTtFm/IRaNgWQcppYllLcS5o1DzJzFEhZ42
	ywsOQyakb9HQxprmlkHM7gFqNPP9NAR/pXt9ECk8kwaCI302GGTSfKfuXFfsvtfVd8ur+e5Ng67
	3niF9
X-Gm-Gg: AeBDievKwZxsbdtbl+UKOjzjwYyAGcttHZYFJkw/q3QjPEITKU5iHdVJ1sRQi+fjrGU
	ajRwk2cF+Jtmol9JROk6S0+ohKblUStdQjn7CYJADrkhNX3ZsJTZ6VSbyuLdDoMDnziRJXvNxiv
	9B5XXztpUYrjOqfqTmimppYs1VHJkFdnox+c+8h3Yt3ejh6GrVYCJEkP43mLWrWBzkLr6UAiwHt
	11MebWeO/s6Md/nuDVsIAJN1ePDQEnhmMZmSgzpkqFpBuhS+aTtIFj2ZzRieCjMnxleT/8xYjFJ
	hRdnMa26jrqHS+zSrh/+2MDqJK4XBx0rf5mPBuIbDw+iomieOoF6YiKEMD2i1f72yXaKLM+89dm
	W1W6ZCaMcQSvXFTR6uqvsPvY7G7W1EMhyK/5D/fkekP4rtZ3R8Pt4hQxQyhbqlyUgrJXT4+ZzTU
	pXowbfv3AS1ZtVBFMmKYgJsoUDXEA=
X-Received: by 2002:a05:7300:e78d:b0:2d2:d7b7:5c61 with SMTP id 5a478bee46e88-2f548a99ad3mr2763222eec.14.1778121010094;
        Wed, 06 May 2026 19:30:10 -0700 (PDT)
Received: from 997d03828cfd ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f57038c644sm6774688eec.29.2026.05.06.19.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 19:30:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 735d2f48cadaa9a87e7c7601667878de70c771c5
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 07 May 2026 02:30:09 -0000
Message-ID: <177812100896.3535.17568536316680905487@997d03828cfd>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/735d2f48cadaa9a87e7c7601667878de70c771c5/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 735d2f48cadaa9a87e7c7601667878de70c771c5
origin: maestro
test start time: 2026-05-06 14:10:27.426000+00:00

Builds:	   54 ✅    1 ❌    0 ⚠️
Boots: 	  148 ✅   10 ❌    0 ⚠️
Tests: 	21323 ✅ 4265 ❌ 5831 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69fb5f220e4ee292cbdf9ac6
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69fb579a0e4ee292cbdee88f
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69fb57c80e4ee292cbdee9e4
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69fb57c90e4ee292cbdee9ee
      history:  > ❌  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69fb578f0e4ee292cbdee84f
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69fb782c0e4ee292cbe022bf
      history:  > ❌  > ✅  > ❌  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69fb587a0e4ee292cbdef785
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69fb59570e4ee292cbdf3c49
      history:  > ✅  > ❌  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
