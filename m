Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AEC43D4EE
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671149; cv=none; b=TY4J7CVJI+66UiZtOUgoPYcySMmM3veiSCLgdYO5B6FzLVcKlluHl01bzdhmDVbcxYiBuJ5eptkYzbSswVVx1U1ZdIcqHfuVtgpe8hZKbha2jSKEIrGzblgv9kI4RRyYXwF8BgrNnlj+aebpbNDS09IjwhxhsLhkAhoQn+UsHn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671149; c=relaxed/simple;
	bh=+CSJzWCektwp0qDxnnaIRAU7cRgqQ7Em/RxSSsREdq8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=O9wu2grrYdTWe/XO4XJSS0FW9IT76mr/btw6bBzF2OBSq6E8ITZ71bmQc+dwv04o+FK28BMuftnmBwSm8w+uW9pHtPCnluw402xgKLlTvNtMQRsxf329rs5I+I/10nTkZNEehZnP9XzjmR5ocCri4aErYtscd/TZxZ8uNJqAi/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=WvkpDwgG; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="WvkpDwgG"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3811f512167so11463087a91.3
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 14:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1784671147; x=1785275947; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BfGeGlENFxpuCxR7FjO+oWKfmw8fNbeR6VheNQhmhAk=;
        b=WvkpDwgGFrbB89+760mo9Yjdup1yl3sS/zPA7Ud/QS9UHks0aN8BfCgyoaFpb6oeys
         STnEJcB35vGAN8ztAAd00NvMdWKiVFYf+NGBHH/GbdsAIWEDJwZhQEQdVAOxVKSpyCVE
         EEb8WyriTROaoU7PnhRA5BvpkbEPj3bEO6cWhGSEBlhNgAvisvKzxPlHBcP2wrF3IQzZ
         ILzSRJjTkT0PXLZlx96TrnDOuIrVgtwwGeoeOX1aUBUFOnXG2tDFiUGUM3dyIUybG0Rd
         49aYpbxSp/qUlI5HG1ZroiVYN3k2+h0fDlSkDZ0f5ZpJZ2q/aW5fP1KYLh8Vw4S2vfyv
         p8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671147; x=1785275947;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfGeGlENFxpuCxR7FjO+oWKfmw8fNbeR6VheNQhmhAk=;
        b=eE0bbiQq4PlrA2G4gaNaBfzwLjVrtdibZQqcj5YYWylY2GlenjyKBgMvoO66LyP8Nu
         u9tfmM6E/+QXg4YMIZJuwp5dsjwbWCzRfkBxWWLGtKQG1q+EnFTOqZ3o7+kMBrlgzVpW
         0OlvgARTEAHXzp4yflUvooAVkpMOhXBoUkCbCvXLyMGaFrROtOAFL+S7XfMm3IXoX4zt
         xXTNkhAV15/h+ggHEi8dLB0OvdkjPbcafHLDvLQrN2EvATqmjZsm+1AilpNt7R27gsl9
         VRWhoM7lhtcl/oQwdYCoK1ofXMsxVOmm4bih6fE1TX/ryYluuxRbsZNpi3CzDIXbu102
         hvkA==
X-Forwarded-Encrypted: i=1; AHgh+RpKjbXM5Ou4VGJdvNEltKWm+yPvjxiik0oZSoDvVq48inoU8sa7Y8DuNueAGxcKmPVo/7B9bZpsFjkW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ejDkNpOjwcROQae8DMkwG/KDUT+HbZBT2LSx9Z8YU+MB/wUb
	buDrL+LdayMGMK9x7DvAzqjcEgFqO3xvfYtx6AB5zaVgBRCZ809c28fbZ6lWy5nc2/Ad+YDltg4
	TWe4d
X-Gm-Gg: AR+sD12JmzXlNdgX8RsKGzM02cVCMYBM1Z5VUsPKQyJCMzefBfi2VPqlo0Ek4EjVuwA
	luD3Q/Rb+ohQU1W1QOBmvgflgJxh98Cm+RJs99EyeFpfaUaR8GwlTTLsiBnCJcEv/Lod0FHmCs5
	yfWTMN3g423B2zW97lrLv0/NeGggENMYlXPJqTUuLZDTzeTJY6ZCqW3DmdGiePs+1PeXdom5EPX
	fdhZW9YoQUAsUYGFx4wkEfDLfLNwXetw610JHhj9Q1L6m6KhVzC4xEXZHk9NnO0Dkkmz5RoUHq3
	wD9Qk5lYezzbWgIjCiQyFncKvORjKamCifpjoClLG84zIjxnftLxLXV3wfibxX47TH2M6jKCFpX
	wj3tuAQB5ZvBPzVJ3wmwcWxkJlg/Cmlp4zJlVd9OGTz/Mx5R3tUW+c9T0xYZmfs37v4+S5fQ=
X-Received: by 2002:a17:90a:d2cb:b0:37f:ad36:8fc5 with SMTP id 98e67ed59e1d1-38e4b515bfamr20944909a91.23.1784671146655;
        Tue, 21 Jul 2026 14:59:06 -0700 (PDT)
Received: from 4104846f2ebf ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb7c5sm42923449c88.10.2026.07.21.14.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIGluIGV4cGFuc2lvbiBv?=
 =?utf-8?b?ZiBtYWNybyDigJh4ZnNfbG9nX3J0c2LigJkgaW4gZnMveGZzL2xpYnhmcy94ZnNf?=
 =?utf-8?b?c2IubyAoZnMuLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 21 Jul 2026 21:59:05 -0000
Message-ID: <178467114526.1316.13205923514031471873@kernelci.org>

New build issue found on next/master:

---
 in expansion of macro ‘xfs_log_rtsb’ in fs/xfs/libxfs/xfs_sb.o (fs/xfs/libxfs/xfs_sb.c) [logspec:kbuild,kbuild.compiler.note]
---

Log excerpt:
=====================================================
/tmp/kci/linux/fs/xfs/libxfs/xfs_sb.c:1483:17: note: in expansion of macro ‘xfs_log_rtsb’
 1483 |                 xfs_log_rtsb(tp, bp);
      |                 ^~~~~~~~~~~~
cc1: all warnings being treated as errors

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178467114526.1316.13205923514031471873@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:09e03f60e36b4243ba595281bf22987cb72d812d
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  290aaf24a551d5a0dce037e3fab30820f9113a10
- tags: next-20260721

# Builds where the incident occurred:

## x86_64_defconfig+aws-ec2 on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a5fae5b75cb84fb21705422

#regzbot introduced: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603..290aaf24a551d5a0dce037e3fab30820f9113a10
#regzbot link: https://d.kernelci.org/i/maestro:09e03f60e36b4243ba595281bf22987cb72d812d

#kernelci issue maestro:09e03f60e36b4243ba595281bf22987cb72d812d

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
