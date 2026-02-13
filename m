Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5023EBF1F
	for <linux-next@vger.kernel.org>; Fri, 13 Feb 2026 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770949838; cv=none; b=UAjXZCOdYvZkwb78yJsZ7p5iMfWpjHgjlzaFKje0bU+Dum9AjKgQkYxms2lPaGlZ0KodZ1RrF2mxmK2EwCvWjEZ/UzoZgJV7qPye9VUkKBhyZc8tFR/gNXyYVbpvyhmnkRO1N4LLfcA6+KR7cr/QgrTtQqarCwAiEGfc4LDWTC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770949838; c=relaxed/simple;
	bh=sxGEbUiz7ev2UoAuQsTkjoNph9E3N5MDu6goQWeVWTI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ltftG0fIENMEfr7or6nu2nfwkgWDSpGC7ZX/swgo0S1XEltPWZB4xEFouh5FFinC2yYm6XDLNAm1BtSu9dLJk6FLU1MCkkDenwSRDDQrLWhhNP1eZZ+WIq6murDGGj2cQuP+Z8k02vtMqV53zHcIUoAhNBu9Z+Z+AuppskK2fNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=LsZi/GEq; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="LsZi/GEq"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2b6b0500e06so528415eec.1
        for <linux-next@vger.kernel.org>; Thu, 12 Feb 2026 18:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1770949837; x=1771554637; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/4Z0U0jgPvhMEpCKI6Cc+r7ewjuXnttc+RLkLsnK60=;
        b=LsZi/GEquBLp8pYZ1FWpJfyKii/3HinJIEdPI5xxBfPalIXqVOE9r4VXSFOaJ0RwUW
         j1uxxp00jVtYwZwxoGtehxLTmAFteu0nMiOgLguARTB/swKQUzzMF2sTavyE/p5DOrM+
         fQXhALJ/iytEl0EnUyZxegCnJrPvmwwxxXnPoah5Bcdo9YNffrOc1tNQc0gC82fyZNxR
         G3LY8CofpbOk0jxjnsqYF13Nn1fH1i/f6/RW2OG+S6AvyQVNw149qgTG5fyBntpylt9X
         MSDE+MdGZgtb/z3EZBI68lHB6Z7UpauBcwbXsVLgtMVLLRzxObUQFTxsN+sw3eOycymL
         kr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770949837; x=1771554637;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/4Z0U0jgPvhMEpCKI6Cc+r7ewjuXnttc+RLkLsnK60=;
        b=EEkKBArsNmS1/dC3Yk4JgclRcCL2MoxBofBBJJq8PAV8ufl+naSOYp+Ag9IlCDBSVo
         0VWEBZSEyLOlO9hB9ys4x9poR5Oi9aprXelPWKgmc5ZLfK5hrrGchvyWpuJ2wAksIfP8
         V00T/qQaUvsjEyFCgxdQoFbqc5LnJ5j4UO2OZ/DQ8v2d/D21U4Xwoxr5U/5UzfeE7EAX
         u/tqf2fMmJ4zH6SbA5/Fn7lBbpawaKZerzITz8851tsr4e8Scy5wUhrI/HGk18fsPTXL
         RokO2cscRprHBw1XbVuGGQJzUpZiw/b8aH63XcH0g6MFBCaLko2kFwQBX4KUplgm9TJH
         cHUg==
X-Gm-Message-State: AOJu0YxI/Mj7v08nGAZ6AL+p8RCcMpaUMDzEDW4NdG0rBOqV97hrMN7p
	yFP2tkNjaccZ1iOY/2TCkZ6AxtKO6uG/qm0bpZlyeyeqVvJPAHQKMRE2g33aPkpv1EFgBsfF+RE
	HM7brpCk=
X-Gm-Gg: AZuq6aKS4keEANRrusPTq8YTqspGeqW9z0ajjgJs0nUllmdH15uL/OXxvetTYJ14lZ1
	8kM0h+9MAeC7XkFEzpjPuxS+CCvXXwE5N4YTcQ3+etibCAIJkGdEJWv95gWWlnllkjDiM0AFUuU
	IwBVwHfb7lI6aR6s9fviSpctNasiDTrwySBoajiVIsGcTt7pGnQvAYs5dHb6eY+HcJmt9Swln3A
	CjX+vVlOF/c2TaGzrckXQ1+U9sAW1zs3ZVnbsFb6x0IWYpQv0EoeCs5IYGUh2GA7uwz91zD8XDx
	Qs4gRcaaSsFqLmp8gCshml83QdUrG1GbVFqj0S2YOKJF+J2ghzAdDETtmNDy/8xt5CKMQrSZHpB
	tYG6HbFglKPzw1G7RqENiI9a2RLNSwHFOCUyt1beba4DmeJXmOtrEMhvbgdC+zUU+Q0tlyQKHRA
	gB0MnClKxu5+TKY+dq
X-Received: by 2002:a05:7300:e824:b0:2ba:37a2:4aff with SMTP id 5a478bee46e88-2baba04c9dcmr356885eec.14.1770949836514;
        Thu, 12 Feb 2026 18:30:36 -0800 (PST)
Received: from f55b40a4666e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dce80f9sm4577561eec.23.2026.02.12.18.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 18:30:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - af98e93c5c39e6d0b87b42f0a32dd3066f795718
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 13 Feb 2026 02:30:35 -0000
Message-ID: <177094983554.1089.8019327683842127067@f55b40a4666e>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/af98e93c5c39e6d0b87b42f0a32dd3066f795718/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: af98e93c5c39e6d0b87b42f0a32dd3066f795718
origin: maestro
test start time: 2026-02-12 15:29:13.600000+00:00

Builds:	   47 ✅    0 ❌    0 ⚠️
Boots: 	  165 ✅    3 ❌    0 ⚠️
Tests: 	10485 ✅  610 ❌ 5945 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:698e023ba1ae387ffbd1d191
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:698e0c50a1ae387ffbd21251
      history:  > ✅  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:698e2813a1ae387ffbd25af6
      history:  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:698e036ca1ae387ffbd1e5f0
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:698e01f8a1ae387ffbd1cc01
      history:  > ❌  > ✅  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
