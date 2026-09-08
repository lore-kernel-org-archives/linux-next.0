Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5900145A1F
	for <linux-next@vger.kernel.org>; Tue,  8 Sep 2026 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788834620; cv=none; b=kCuOK0KxtD/sKudvN5/FbWRhihqpu5OmWTIN+NgytvSTRk55EvQ1SFDy2w0C9wBdrEo9O+hHva6/gnmY9WVMo6WlFlSH74EbLh16SOFblwsJoow/TdZZRSRmjQX/9cWrMCliyHYTVF+VqpNY6vP5RQsQOD+Wi9Q6O6nxCEV1yGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788834620; c=relaxed/simple;
	bh=2fpiP9X/XtqwOciH7RmpYd0q5FwEnkNWR3PBqxkQqEI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=VuQktgpDXHwgpZ18L2nKPDA1xNdv2MZ2FT8bI54GzS6Vf9M8BhxS3BMR2ahDuKbS/3qUW2IsFSZ7curPehb/iCGiuABW/IDy3Af+GwEfyxF+n/9O4dQOG7MZETkJAgLB73iZVVDWfj9ZWv+N+S6jw3MQBQCuBtrFXNBBZakjIKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Orh82ga3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Orh82ga3"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so3860606b3a.2
        for <linux-next@vger.kernel.org>; Mon, 07 Sep 2026 19:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1788834618; x=1789439418; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o5a+UrPZJaUJ5lluaXahAlvcAkOfVw4Vky7L62MfVw4=;
        b=Orh82ga35VCu1RCY1e5rA50HveJWzUUy+gIzE2g8qd/r4cS6dgRrcpVz4P3BnnRKFM
         YXQO4FxFB4CCMUM/zDz42tRxIjr5EGUnAqN8GTfkBoHtOBxZICSOP1wl5EMnaj/S/pdP
         ZH1cEdkiUfAPWJ/gr4ZMyTLSOui8zr505NSfHkwOCD7HjZnuRe5TohW2ZOymNRuZZSq6
         uVcKG50w5tX7i9fFonkCqBjdCO1GRtEhYoU5rq2FaOUnk1yEYUsbay01/KTEU0m1QAFC
         BkOrANToPDkMda/Z39OSYUPSsqdVjD4okJbr3mjUroIs6sRh7viXL/ZYsNj4+VEbFARZ
         8U6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788834618; x=1789439418;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5a+UrPZJaUJ5lluaXahAlvcAkOfVw4Vky7L62MfVw4=;
        b=cVmkqkpsWQIBeUAQCSMwc6C+I2cmG7KOLTDST21X24Zlt3TOB8YLzctOp9ENs9fTQI
         0pVA676pdfPn8kCj9GYd3hZWGvJWpssvOuQlOjhHIPWKP3uTxIKCshGZSFPfLSwSGJiS
         87zdxLqP4rfiwwfZZpXq0StImdtH4drTCMviPOzhyn8TuXGsnLK/JIXK1XrNXAaqBfJ7
         0wwjoS/XgRIN0+RWiXeP4f7WwSpygicnycDG8p+oJEz0eHqzapFxs+wLlPZ5VJMLAsst
         9kZIOHeHqiQRFJ6cIgzrAMhJ1XhbI4+bFJAdomcVXDDgiFnLRTtx/npEUNCQUUaupBz4
         J5zg==
X-Gm-Message-State: AFuF++naU2B2T2G4CLDMxqZ416cYc+Obhs4OvuuAZ81/Egk62kzirVd2
	3sN7J/Djfs+sbgOoPn0HThZw3n78i8kWK95F57YMijz8e7it0zbv38XO3F0cwe3jEhY=
X-Gm-Gg: AYBFou3Hfi1hrWQsN8tLrVHPunbJxLTEt6XmLM1mu15qpBJ5nj/4yVmWnldTQN6Eri8
	oHYnbVuZQvv0oDItqAbOymoihk7aLJ6xrdbST11pJV3XLRur/YQt1yB5cIS9AxdUANsEXHyVade
	0XhZjm5HqojE/HnFPOO4o2Ext5IfJJBYJqrg5roG1hsBYwcDVtkySYJwEKeVz7WcFY7IpW9UcsY
	XYAPO/cE8KyIrnNURX+uoyUlvH6wJKpZ9IVP79kr/IEdGVzjqxEBxLzCJXNe2mC7vFXntLFRMw4
	k0mFzkH8CEPI3xSZaSeEbQDdi/s3puYi2EMre+EHFkxEgL8L7B8JoiJVQIwZniTOnIrm392wdMt
	4IigYZigUOAOOOek3nXBqsPC8oPcXBcmNN/ZXmTr8eVV89j0YSqQ1Dmv3jfewfZOKO+oqEmiRIm
	Ljqav9iseEvJxJqEftZPazRxSCkc4v8WMvca3fyfDMPN37EMmdT/5J
X-Received: by 2002:a05:6a21:3995:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3da3a14794emr41376578637.24.1788834617934;
        Mon, 07 Sep 2026 19:30:17 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm26636508c88.6.2026.09.07.19.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 19:30:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 944a035ecca915ae947905dcfb03f2b9dc6d032c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 08 Sep 2026 02:30:17 -0000
Message-ID: <178883461673.2670.12302156553609126504@41049dfc76e5>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/944a035ecca915ae947905dcfb03f2b9dc6d032c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 944a035ecca915ae947905dcfb03f2b9dc6d032c
origin: maestro
test start time: 2026-09-07 14:59:50.550000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  162 ✅    1 ❌    0 ⚠️
Tests: 	24165 ✅ 4762 ❌  926 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:6a9eefcce41d7f97d60d7254
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a9ede9be41d7f97d60ccdbc
      history:  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a9edf21e41d7f97d60cd078
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS

  No unstable tests observed.



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
