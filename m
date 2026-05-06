Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAF628686
	for <linux-next@vger.kernel.org>; Wed,  6 May 2026 02:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034622; cv=none; b=FRcMg8CHbYSU0InxPTQCt/jhRLEJncyMw/0s5jk4twDsmkz7DsbuAwWsQV3nFe+COrGt9uWzw9gWmtUZhFvidPCXqKfl9Rn5lIMNSwocb6+qH1chkNEyy02PxxXB19byxDCdcNk38+5RUt1dtcM9W2dOQCbjxA6fzqFSvsDPGzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034622; c=relaxed/simple;
	bh=uLI3YKxsLRdNcqL59myx9EAnqNFFAF88FXCUUt1Jb+I=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=n1tsFq0SDblv3PDwBZh1tRN6A/F/kkRizyXNbGHbwSzuv/edOdUZS5kYUTUnujj5eBbjQzdr45mI/JYFsH/IUzWHflE9WxyBqMLv+TWfy4BHsNt5RxpPNafaAVac3AtNfmRZ3RaJIu1NFoWuv1IxGf6MKy48Pcl2aK8Kwgdji9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=e5j3f+9O; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="e5j3f+9O"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso4331344eec.0
        for <linux-next@vger.kernel.org>; Tue, 05 May 2026 19:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1778034620; x=1778639420; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1MW2AziprEGExHRXw3wtVkR2LrBbR9Jj3CDhnoOCfc=;
        b=e5j3f+9OpybO9VO4p+aB0m1XkX+9m3EhZkq9RrfeqyQDlCdYhmlbiGzvGv90mmU6Em
         JaZLioF8TQtO2NWj5bXYoOE/A+dL3gJRWAXPTc84FSoTgRjtKBdQnfbc4y/YjKGbe/jT
         p3v0BAVDmjP01kftTbA4cBegEgmLIELxjPekUHi/3RARqlm0zE+ZIbUxv35Gu5mJJ+Uy
         LbLn0iEW9J6vZ5I5jAt5u/uNbi0ErXvmFpiJdmyh84CQp50DITBHDnu0iTIC022rs3Dr
         aH1rVugPrlEh3t8k0B2/6xN4H7yJEI2+6ul26iWcAEoSsrevB1E3UnpTGDQneM2/o0TD
         4oIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778034620; x=1778639420;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1MW2AziprEGExHRXw3wtVkR2LrBbR9Jj3CDhnoOCfc=;
        b=Fo1vnghpBQReSnWvlghQHWt07RQqb0zxTvpue8rrl8wsBStLXa2gmvBjnDNJHlvw9j
         dg/eN+udUnSW99OwYK0sUSb6tvjJByBw6LaTDpbJeMP19hA54GQRcRBxX9g1ht4VdGAB
         RKM1FRzthH2CzqlNaUXFTsdON+cgCTQWayrDwCR1wd6fxZQ0WeRLPcrYZkZ/J9DblaWM
         I6/7WRyV5qmps0TwTsSZmUGtj3PZX2huL6KLzu2zUe888q5C4y+hl3vlptSNoyGbTKjg
         fJmxPOfwunhrJczXo/g4J64ZdO9gdT6QVSsEffINzR1AAyxYjqznKEeJFRiPA2fMjgdr
         rtBA==
X-Gm-Message-State: AOJu0Yx9xxPaZH7kmSZbI79ZcnpW3j8fGueSdXsB7C+0DWozRm9Dlw3+
	s5ltUr0HqXwKDu4JVVp6jCiyDNIcua9BGngX7EyBj10g8EA1tWh1YlLt4+ilcA7/s6YDxC8IL0A
	KYbB4
X-Gm-Gg: AeBDievLUssIRNdOG341TwaJbSV0hRbVC/Hqv0176gB6g1sSV94too8JhMLWtviwVUK
	fI9AmUS3QrLAOuiQT8ILFUFWBot2/JTViyiYEZzH8FZGzBVIPA6YT7Ply6HvmorXQeqiUcaJln2
	k5vX17Xdk104ZhHuwz/+24uFOD1etsTjv+fAz2sXadKA5AlA84yrCo2utbYWokwnFbqz/+0vR4e
	V542Q8rKK58wDyxchfBCQwW7EhJMx3T68hB2rDNZ4SOmeNhIohAYad5tmspMKr2ETWwCmiKuT60
	s2fgRBtGyW6JmQh3WbUWhnrmb7MOiG0g359cLsxE5/jGse277Lkc4Q4svG5pwF/JNmvxVVG1+Ed
	68kdcJxJgXWH30GnIERWNYXQoUGX/GYhyDI08WKTpW0PRm6UjM+5LzYx2bmZDepae2/ftaoRXtL
	kt6iNlNVa87hAyppmAe6nuMAJGw3cPx9T775ReVw==
X-Received: by 2002:a05:7300:dc92:b0:2d1:9b35:4ed3 with SMTP id 5a478bee46e88-2f54b26a2f3mr868311eec.28.1778034620057;
        Tue, 05 May 2026 19:30:20 -0700 (PDT)
Received: from 997d03828cfd ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56f88f566sm1335597eec.16.2026.05.05.19.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 19:30:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 06 May 2026 02:30:19 -0000
Message-ID: <177803461906.3070.9142561718935789155@997d03828cfd>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/4cd074ae20bbcc293bbbce9163abe99d68ae6ae0/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
origin: maestro
test start time: 2026-05-05 13:16:18.899000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  175 ✅   10 ❌    0 ⚠️
Tests: 	22602 ✅ 3991 ❌ 6261 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69fa0e150e4ee292cbd8de7d
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69fa0e430e4ee292cbd8dfba
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: lenovo-hr330a-7x33cto1ww-emag
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69f9f8010e4ee292cbd76d91
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69fa0e440e4ee292cbd8dfc0
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.rseq.rseq_param_test_compare_twice
      last run: https://d.kernelci.org/test/maestro:69fa0d5c0e4ee292cbd8dc3f
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69f9fd2e0e4ee292cbd7cd61
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69f9feb30e4ee292cbd8075a
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69fa0e100e4ee292cbd8de3a
      history:  > ✅  > ❌  > ✅  > ❌  
            

### NEW BUILD ISSUES
- Issue: maestro:ed6f3327055b3d832c87e92ead3d68396560c4f5 | version: 1
  Build: maestro:69f9efc40e4ee292cbd73c6a
  Comment:  variable 'jack_state' is uninitialized when used here [-Werror,-Wuninitialized] in sound/soc/sdca/sdca_jack.o (sound/soc/sdca/sdca_jack.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-05-05 14:39:07.817529+00:00
  Culprit: code

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
