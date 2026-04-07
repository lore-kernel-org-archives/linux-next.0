Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5C019CCF7
	for <linux-next@vger.kernel.org>; Tue,  7 Apr 2026 18:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588347; cv=none; b=E4gM+mplxjjdpkuXywQO4H6FyvjuDXZQuSW+AaVLZi0LPiHEFG/UFFHjceM/zd809fRsMielJ/R6rzHwcLSDWWN0zwj6/usR/Ac5eDghuNsJyYwhkx/vL+uIFM+EZdYcpB7r7id8x5MMua76mk6O4dbgLlISm1H6eNFDPSpYYJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588347; c=relaxed/simple;
	bh=ri3KVWEjWeqq7sVDPoXfzYBoBu5eYsbDcP2PX+rgTOE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Hunr61xF40z+eQrdmk7zrlu7K9sqHGJLDtkj0BfvvKZofwT2PUayUH/l8pdVHobGxFl1voVkQuPLsKw/94rHeiqWDWcwOtAfEmB24Y4RACYHvP+DA/6GgOTh0S1OnAsex7LyTVHZWGRFRYIp7g3sb6bv6Fo2UJk7TkrZfHsRsGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=vmqb3hMc; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="vmqb3hMc"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c20010f10so144294c88.0
        for <linux-next@vger.kernel.org>; Tue, 07 Apr 2026 11:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775588345; x=1776193145; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QL5cfqmnIwgU4uH/kEcSt49/BExY5TYAgpnnilZPUj0=;
        b=vmqb3hMc8iKNda+TFfAi2K5tBanqB1PLGXMnVPJSV6YiE9k+6MLEabY6uSUUS66FHh
         Gm+H6Z0qVcUzy4bt6BNaaExO10ZtiQb2rAzU/nl0SzI3VXw5oJLOZxWenN8RVDjX5tt5
         n0dKTTtpP9+CpEMmZVP/bXQtbSYX6CGTlBe2VHwHgR8rv5XDf1De/dttsiaPQJy7HLb+
         3eRg+O4JE8tcnNzGRQb5CZgkEFVIuBXUqGVvMUUrhGzleHnvhV+arodE4La2pkeQdF/r
         mQK7aGusXxM1t4tPWfTpHtxdVYJtom/JaBEFrq1UTlKjVKGHLNMZXiEXd6bLgmKTMir/
         HN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775588345; x=1776193145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QL5cfqmnIwgU4uH/kEcSt49/BExY5TYAgpnnilZPUj0=;
        b=hhfYFyNQTcuqXc06rS0N/iSu8cFGVfuMWe9qF6A0fZ8VrpjPZnkL8uvm3JYZLwdHiX
         8frhrlzVky+adUtRpHbl62WH8GvLuwaxy7GoLrOp59JCyKAN8M2W/oCOl5tBqtLRv17k
         Pp/vRYdRMVPn60AmrlyeGJSmtsjWf4OnEYLOsSZ32H1CuJdKIGeLCBH+dMQY0v7NH79V
         sOEfvucYxyZvgU276vHPz+D6DPUief0yd1vhCYiIdhh7ikxl2El8OYBbNMjCNUdS0STR
         XTO1TLIzY/3dL8w5yFOoWgMsBFY4VXRGzKAnX+q1PNdbuh5YoVAEY8a9PFemhgowiWSh
         jQbw==
X-Forwarded-Encrypted: i=1; AJvYcCUVDxrLYmahnluqmNw25uY+On6zu7r17JRkudj6Vsh94NK6lyGP2MJR8Luyva3P7XJ+QHFeUyl+n3rt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3rUzYadgokhY9V1T2GPQIOGxuCH0AvK3DNmme5bdx+HotC9V
	KgvUI3ScZ7AXq5aYJOt09dAnRRd4qEcdWPgw4Fg2kMw34WKclK0zoDpwrnwzzjLk1PY=
X-Gm-Gg: AeBDievMB7r/5MVFivSLOXxDtfXH4JofTfGO1r8rqf/GeXMfkiS1JK+kMOPBpICO/Sr
	/jtaJ7J7MUSiJqdcxhlJ+n6l9dg2WlVVRnvllc9ewQkovwgHdbULQHhhTOF8i420F+2MPxCcNdg
	HHvTSELxvRg8/RizsquG0C4/67bOhiP9MKGRaCtdaKGB0Kq5I5tsrj9Z5tN5XmUWv5yEp1sCxH2
	6sez4SQWELZeoBwVZxDB1Ls/oEwWJlTZc+f0IRkhSUhLsxUHFrV8VXjk8Ev/t4sR+WDRA0FUOfB
	fHeMPQjeIRFeX0HbKQzZTSJ5Kk/8lO1QwsuN2BkW1cioDSHshTEL3CgoXwtVSxh1GoNiA3wdL1z
	4RJPJH4jsV1dPAr7CqHrizvoKp3knhnW+BWgfumtcA9rrypkL3c4dLktzYm9s8AWYILRUWZWuJC
	zDGDp650lj6awz6DbF
X-Received: by 2002:a05:7022:260b:b0:12b:f9b0:21f4 with SMTP id a92af1059eb24-12bfb779426mr10364415c88.36.1775588344874;
        Tue, 07 Apr 2026 11:59:04 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm20739587c88.10.2026.04.07.11.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 11:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in testcases/gcs_exception_fault
 (Makefile:31) [logspec:kbuild,kbu...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 07 Apr 2026 18:59:03 -0000
Message-ID: <177558834361.2493.10021359695033804908@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 in testcases/gcs_exception_fault (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:50d72b703d41b945e32985c537b9838bb2aec986
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  f3e6330d7fe42b204af05a2dbc68b379e0ad179e
- tags: next-20260407

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_ARM64_16K_PAGES=y on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d51d57dcae953c056f963b


#kernelci issue maestro:50d72b703d41b945e32985c537b9838bb2aec986

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
