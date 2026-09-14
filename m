Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DA149B5C1
	for <linux-next@vger.kernel.org>; Mon, 14 Sep 2026 17:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408746; cv=none; b=WjyfO6t6G8nncDqLox8EROOXEzVt/yBogZ+McxMI4eakJhrhAim0CGz7JDTEcUZXwlqshBSVNIPAEQdsoZvcgsB6me93qhMFMnNecjt9GXwxVfsWAuF+gpx47Z0xZ2OFGEhBuO7WaKMFx5XYuW2uWOU1+/Mg2gshtxIl5IEVPHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408746; c=relaxed/simple;
	bh=WzleuQKnB3OB7pki3mFoHDobbeyqCiA/ye/oWvO1CbU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=QqSw/AYG1GRKDuu65s9CEMypMVh8r+wLNmoFHMAS6GVJN1cMpWAiL0cPPYkuULy+XPd5q+VSlrVl6cFzcowDnmG5JADH/9Xla6/dpG7oNa3JU8PRpGnNQIfERIKL5LlRrA0wnyvVoSLHazX7z36i9g+Qzmt+OitVj9LjVvh74K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=g9kanPk9; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="g9kanPk9"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so1707382a12.1
        for <linux-next@vger.kernel.org>; Mon, 14 Sep 2026 10:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1789408744; x=1790013544; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oZap9/ymhT7fY0nhpoaZDLWxf8RD3Ap+R6zOXM0ESLg=;
        b=g9kanPk9Kc8smNci68mhWOEfKEkS1wzx6E2WsjSoshMgpXnmgR/4cfYUDyc8xGbmwg
         n0PzVQKDLOh8F8oyRjdkcAWjAhRgGk8/rAiBxBN7nynmIKpDPwUkBOisHWJOxQmDXlwS
         fP4T5cWFm0YZ+QtrgexNJSYsSpFxBg52g+GFXw7cMfNsseBsXNs8xK3g6snDeUTUuNPT
         HXS3NOFDAYTVttur14TQRyGazmmNGDhTYfvJTxKPAw8ggsC/Hc8MrNuSaK0ONwgrNhAe
         YD2aMZIGeMJ5Oc/N/xKqCB5g7YFq+ONtPgwRvBLxS1WI7OSN8GaLRBW2BiYGX4cIBkN2
         d6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789408744; x=1790013544;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZap9/ymhT7fY0nhpoaZDLWxf8RD3Ap+R6zOXM0ESLg=;
        b=Mg5Sun0ssfzBPyIFCtrZbAube9pjI9dsXpSk8ok59xgCznHgpDWY4pCHIwVj6iqbfD
         Rar4/lE6eh0g4AlPtBoLKhKRE1qyks1OM6gM0INu6XC/Y90YaPm5th8Wv+5rPptAFX4v
         /PuxY62wuh5swdTVH7uFrwIExcY2F+v5/Ulk9AtkysWfzf8m2jDIexZI2uGB7Qn4IM95
         nuzP8mDxSnYZ549Yz/8nd/7BT4y/+W000RbXvUPKSEuWFmKkFZpJq/8uujymO3+CSIBk
         LaGazzd31Ik2NAm1mRbchg2iiVhH0dvmoGa5qRzS/OOgYfaDRizwf+5cOnQs3g7InMhk
         EixQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWWgiLi7pocrhVHO/fBoR4L3nJxdmtC+1EwGZZCiqAiXBV+9bqNTpOroeKXPXvM5kGfVl6pXVNAifl@vger.kernel.org
X-Gm-Message-State: AFuF++nLG1RYl2cVgqGbiFyfrjLLJSbUC4qQCiycTzcRFbJD4SClqe/d
	qByD4kXMHTBVm/MmQtEx3FQK9hOotHJsvfYalrslnXNhSgccyuSvtqnd3wkiAiqD0Y6Ssq8q/PX
	DsoBl
X-Gm-Gg: AYBFou2X14HmzDyxNLL38MbXFbqqKtX0RdjQboGpWQv3lzV50rGPmde9GvinTTyeeP6
	7MmOBpRsHz8TPLTOayHNvkKRHppm6OXDcy55TlJG4DFNHLZarlHXNsrK73EbeJft3LMtx9zb+FV
	qstnUhILHHsAn4VIgdO8iAHowpcV48+w66m5CKvLia0hmNbJp9I43YrP4jNbOrQxiNE7Is378LW
	xWe8zzb/A3tWQt8ZARtZ9FsBFN3XChJsE7GaxefAapIigEq/Yeci4PL1DJayMGVl7Yb8JmRORHt
	sKOs4lcvaQBsx049tDJrt3VLKthM9VgteCg9jQWaWaI68c5mqXAyAkYNxlFaTnlLuRRVKOqiMpY
	21RhByv4IOrTivxw45XVnvjcajNVjJ4OH8od5hBlARgBjKCfxwb+fwn36AhZXIjiWg6j8uetzZY
	UGYoAF9RdFpRAYgIxAM05oEghpmZIfDf9aJxgutw+iNWRRshEm4LEjGZRkrpHTgY8=
X-Received: by 2002:a05:6a20:4323:b0:3d2:df:1854 with SMTP id adf61e73a8af0-3db4044754dmr6642371637.6.1789408743790;
        Mon, 14 Sep 2026 10:59:03 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a3casm26677436eec.12.2026.09.14.10.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 10:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQp4oCYdHBtX3Rpc19yZXN1?=
 =?utf-8?b?bWXigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbik7IGRpZCB5?=
 =?utf-8?b?b3UgbWVhbiAuLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 14 Sep 2026 17:59:03 -0000
Message-ID: <178940874287.1087.18054581149136757738@kernelci.org>

New build issue found on next/master:

---
‘tpm_tis_resume’ undeclared here (not in a function); did you mean ‘tpm_tis_remove’? in drivers/char/tpm/tpm_tis.o (drivers/char/tpm/tpm_tis.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/char/tpm/tpm_tis.c:249:61: error: ‘tpm_tis_resume’ undeclared here (not in a function); did you mean ‘tpm_tis_remove’?
  249 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
      |                                                             ^~~~~~~~~~~~~~
/tmp/kci/linux/include/linux/util_macros.h:136:44: note: in definition of macro ‘PTR_IF’
  136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
      |                                            ^~~
/tmp/kci/linux/include/linux/pm.h:316:19: note: in expansion of macro ‘pm_sleep_ptr’
  316 |         .resume = pm_sleep_ptr(resume_fn), \
      |                   ^~~~~~~~~~~~
/tmp/kci/linux/include/linux/pm.h:375:9: note: in expansion of macro ‘SYSTEM_SLEEP_PM_OPS’
  375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/kci/linux/include/linux/pm.h:417:9: note: in expansion of macro ‘_DEFINE_DEV_PM_OPS’
  417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
      |         ^~~~~~~~~~~~~~~~~~
/tmp/kci/linux/drivers/char/tpm/tpm_tis.c:249:8: note: in expansion of macro ‘DEFINE_SIMPLE_DEV_PM_OPS’
  249 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178940874287.1087.18054581149136757738@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:70dc580f14443e704913c358990be2bc69fa5c28
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
- tags: next-20260914

# Builds where the incident occurred:

## x86_64_defconfig+allnoconfig+x86-board on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6aa828c820239ade90355cb6

#regzbot introduced: 68142f986ff04b2b70b31db00f719bf690f64a9a..1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
#regzbot link: https://d.kernelci.org/i/maestro:70dc580f14443e704913c358990be2bc69fa5c28

#kernelci issue maestro:70dc580f14443e704913c358990be2bc69fa5c28

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
