Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752DF2AF00
	for <linux-next@vger.kernel.org>; Sat, 29 Aug 2026 02:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787970659; cv=none; b=B8q0Uv9aThazTSMeK2qYm+wz8/3sNVYDHiqVc9+hGLjYFK/giOptzsQ78wPgUzqQnlGQj5YaR1AePRhHHYU+2p772gqtzngal6GrP6AFqVgSuxy6CPLTgdFOGWaFo/gc1HWkKsjIiywidCRJFr8KKD58yhkZrZIzjSF1/Rsp5pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787970659; c=relaxed/simple;
	bh=I7ZDdibq7PDrBnA/UtlVW7keyoeDaOIbppHh+/ThbzE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=pX6N1rAiLjaM2nkq+fo2FHVjogIvdVngYOieAaed5hYucBlnltIiHhMvbfRf6joSZI7bpFQ5Y/hvpUBgJnFuapOuHLT5sZQVg5PoKJq41QtWrml/k1OHC4QBL2/WIQgpNyHC+Kd81g9q6vp9/FEjpm9sZLanB2fNp/XhMtEOrXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=anVsjL3r; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="anVsjL3r"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d71e253c90so15426835ad.0
        for <linux-next@vger.kernel.org>; Fri, 28 Aug 2026 19:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787970658; x=1788575458; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lskFnVsaB2GeD5X517YR9maszQLUoNbAbk/EmvG0MJ0=;
        b=anVsjL3ryry2GM0fQir1iF3yOqvBWekGncHMnkhKMyXsdvrG3xJFs4cVbNWfimAL7P
         gOETvdu4peBFk1Gh/gl9cf8OPQ9K3ScahyUsQgFPI3h6WBaz7QRCF8klvkITx3pnAQyM
         NjII0Yj7NG8fLWWPb/hK022i+Y7oN/HP2bA9so9ezTij+2wVdrxfXX00kQ0iD8/h+WdO
         4IXlj2Hwr4u6v4tv4q3SC7d+nbpG+H8b2xwlhcrM6iKVqExy5Oqr5yd+H7j3pmTA6bro
         OUEqH0PKPIopjpN49tReGYldKCC45rj8aDamVk09O1XlUHmDPtMgUZMQIuLc35/Qnz6O
         4lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787970658; x=1788575458;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lskFnVsaB2GeD5X517YR9maszQLUoNbAbk/EmvG0MJ0=;
        b=A1zOEnQH9UYFJrN2RffblAIq2dZAi9WUxsh8GQ6NGXULbiC3H6YnheNv21a7fP7mV8
         yeQAPdBgisY9fGZsYzgFTil9nyB51KORxF/y/a2TzG8tS1HuJLBRec2YdijFWgYgBRGV
         8wH/F1QE7143c/rubdpE2XPhazZ7x0ix9dU5uKkCJ+DT+rf9dcXHEEajS+4F9hyEqlVz
         hi8ivL1SY3sGNX2NTqDSK2ePueQ5MX/0ziEULL3mVTfLdfe8+frobzINoA6B5jllH4uf
         1p+bbArNvFPZLZ75f/chUUgla3vqP6FrfMA2PsTYGDY7SuCAXH0MQJznYZXh/zWF6Qli
         vETQ==
X-Gm-Message-State: AFuF++mlRSbCjICJlXoS5Hk4GMp5eFSITfaOHfVgQOJo9tgEe6xmR8WI
	IsqLNFBdOW2i95eIlZq5/R+kDz0/K/wT3HP0Nwzux4Zrg4iHduCwIPrmeOcx4E3Zf2o=
X-Gm-Gg: AR+sD12LnWZjxfoU/qPdrIpQq3KmAzo92lV6hDRHfqJ1UrJxDFdk53cHQLOW6wBYb/f
	dszHU1h6plYy29zFgc1WIM0SN7eTkztDzMqxUtyfr0y43RpJ6yrY0spoCiX4avXMcNocREzzVuL
	LJX8Y6jUFMX3126iLM1Pwi2Mazae7q8STeR6Ss+MmiqU0fOewxmvv7j8+Pg/8yA8qc6VmuuoVmM
	xXw+vRuzKF3tx8btXYqMxj/B+lOflPMNlCUwpkQ7vk6llfDRCOMkqJTG0slmD4LVf8VXOEicK/f
	/jB/VP76fLW+YMTUMDyTOfGYm2zQvHOMsAiIDtAiENmIBg025RwcMyvXHIzNCTo8J0ygGeBOt9R
	Ua2/iLFzRAafq0FCyjH01KFkAZd83ybP/5VwQlGwgpCnN4NCWNrORn4NS0s1sWVGc2j5P3H56Jv
	Rmqv0FpA8cXHkbYH+KLX/HBJTgIiF63clPxGhYluov1gMW7SY3U4D4
X-Received: by 2002:a17:902:ebcb:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2d74cfcdb1emr242930865ad.0.1787970657766;
        Fri, 28 Aug 2026 19:30:57 -0700 (PDT)
Received: from b455de3d9de8 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f99585csm9471973eec.21.2026.08.28.19.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 19:30:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - e30626823a406725ce29bc75cb8ec467d3e1e326
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 29 Aug 2026 02:30:57 -0000
Message-ID: <178797065666.6229.7754067742086305552@b455de3d9de8>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/e30626823a406725ce29bc75cb8ec467d3e1e326/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: e30626823a406725ce29bc75cb8ec467d3e1e326
origin: maestro
test start time: 2026-08-28 14:42:53.284000+00:00

Builds:	   68 ✅    2 ❌    0 ⚠️
Boots: 	  158 ✅    2 ❌    0 ⚠️
Tests: 	22645 ✅ 4137 ❌  700 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: gs101-oriole
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a91aa58c5867fba946c4a9b
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:6a91b556c5867fba946d0c14
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
