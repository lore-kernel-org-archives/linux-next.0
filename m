Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495622FD1AA
	for <linux-next@vger.kernel.org>; Wed,  1 Apr 2026 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775066349; cv=none; b=kItd+nghbmKgCGMQDifqzDMOgJagThUkwDtthLpBkXPFnK8Qjg1aXf3ONVustIQfmoCNgrBPEOz229OtzC2Ci+3V29Bdacadq+y7CUTpYGDlTSKBqQHa0ffe67zPbcefmDi0NrrQEYtfffeZkYMHZQYksgGZqcszPOrPDGYsslM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775066349; c=relaxed/simple;
	bh=PMimV6IRAsexYz+Az0EiPykh6H8AahKSick+vi1orGU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=qDzM3Usz1LDKiyfZ2e6LCF9MHMvZE31iCL3dYOrlh056NtfIMDO1okciWLMeH2Ahz+inDb+IWMpvl06vUaY93woLIUeJIkYvvPfw3uCPJt+d26lI/rQUh7gHlCnOMAtwz0CLLlTSQptD7Px977ymsMA68Ic7Ehkihia4iFvH9Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dCDm/esi; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dCDm/esi"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-128e4d0cc48so94408c88.1
        for <linux-next@vger.kernel.org>; Wed, 01 Apr 2026 10:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1775066347; x=1775671147; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yP2iiD9aKCDLJNZ1U9tRTu4eZhu623OFxYrwrWWUaXM=;
        b=dCDm/esiaOW2aqkIFVL69j/ECr8TkAmDUbJ6zi7M+x64tJzM//madh11RKWCUqnmFO
         LrOTIK8aj3mb03JoMlsR1NcsFk7r2ZBk5+AWIrZHrJpvlY5b3fYf1ZOlMW2Aj+Q30NAw
         VWArwk8w78jGQncuEJuCZ3BBsZndbbtxbroVkXOZx4CmfhnQxuLQgAGWvxFLQM3l98y8
         dCth0R/awVfELNr6dWY9UnRiUiHE03WOyeergBGL1wPdxgzsaermBPdCX+NXlMcNFDlm
         TFQi1WYF6jqtLSNSLK0NIRbj3bR2tHjymuXD7qKS/qiiIZkXMiMBV02pq4uzq1XfTjak
         pUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775066347; x=1775671147;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yP2iiD9aKCDLJNZ1U9tRTu4eZhu623OFxYrwrWWUaXM=;
        b=PATGy+kO5ZYRR9PLHe9tvlyzQZ/Hb0Y29gnWCht8aHlO5/0V3IZmNbUwAkUQyzHP3Y
         nUCs49YZTn6U160KAdu5wpkI8z04l90aN2eLdE4CzZ9n8n6IDGfqeJVXMvgQoiFpk8Uz
         1kH5vqwfB4SomT59CuhBL0usILYuYtq4KlchkU89iDHM7W8sCBr4eM0sA5MHqSwhW2pu
         wiYG2sx9p+FSRbZF8W6xREfeJBGqOXPu6eI2+g9s/MHHf3XnG5+y7tc5tB7VpXuagO//
         p0sVQiMlW10ojc/1a61XuYcyPm9cTojUaSzbpcvZn/KOHFcYEsxbR2rfpsLt/TXh0ZPD
         4JwA==
X-Forwarded-Encrypted: i=1; AJvYcCXCeBDEYoeTYAQOXfqS+l8DEIzkUseittTQvr6GSaAQyw/AqC/Sp7uaDYG53eECbaAfwJrqUqglhkUA@vger.kernel.org
X-Gm-Message-State: AOJu0YytoAUcYeQbp7Xkjuz0jBaabEtvKm+xN5d7nsNZvY93U7NLxo3d
	5Ouzbnj2kuLS/yzCkMSLUifxnyyS1vJpLpmG+vKtqegKQgV+c0BnU9gcXL4+fNe7vS0=
X-Gm-Gg: ATEYQzzau+eTKJZEh+/YdojKTZCNN9qMyUKsXrgMnXEanmEROUobhN/RbMGsI1mYuFT
	+wY/3aCHBQof7gVQAk06XlPxap/VGe+a9VXvOGzBafuEGBH/lib/W1bthMak/pSVJf4rbYLkLAw
	ZAsOHyJzGqvHmLLJoLW8dXvUqzK69OmoJ/c1ehTN4YWk2FVKGg0njPH9g/bInLwBoYaZyaU6RLz
	pO+P8dgGsCpI6BIb63KtQc2k9J+Z9yQXrIjDPM7w6XseZgzpOWcWzlcjc81arECRe0wc3B1WdEX
	pHxaSEwhrNGFzElZh4v/54w3fJcQHmzapMYnUca8jJgvJjAZHBYN7NB9VnBycmNc0a5S5Ne8ijf
	BTn+pcGgtL8GDcYSDpeQ15JxjeEKApv86ILeh455NdsFPr7/nNbsACO8ij9KKn5PzzIDRjkqBY5
	Q3zOJ+DmEH/fUscXxc
X-Received: by 2002:a05:7022:2523:b0:128:d6c3:9b25 with SMTP id a92af1059eb24-12be64bd618mr2507191c88.24.1775066347309;
        Wed, 01 Apr 2026 10:59:07 -0700 (PDT)
Received: from 984b78e0ad75 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede5a225sm752775c88.9.2026.04.01.10.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 10:59:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in
 testcases/fake_sigreturn_sve_change_vl
 (Makefile:31) [logspec:k...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 01 Apr 2026 17:59:06 -0000
Message-ID: <177506634606.1099.546089884145130192@984b78e0ad75>





Hello,

New build issue found on next/master:

---
 in testcases/fake_sigreturn_sve_change_vl (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:813995b419d351e54e42e134b324abd91da5cf11
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bd0f139e5fc11182777b81cefc3893ea508544ec
- tags: next-20260401

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+lab-setup+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69cd386ddcae953c056b53c7


#kernelci issue maestro:813995b419d351e54e42e134b324abd91da5cf11

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
