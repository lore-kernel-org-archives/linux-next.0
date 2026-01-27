Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EAE331233
	for <linux-next@vger.kernel.org>; Tue, 27 Jan 2026 21:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769551146; cv=none; b=fXAEXkOPivEZ/L5MeiWYTZ5xZYioeRzmbBk5RFfINoVaVcOS1MC1SFF8QuxdelB1a0iKq2xvhK6U0mtdbjqxDPd8eRESRRcV+bKu6IwF/HDejl/9Ifq6BzlNe6O48ZKN50BeOLdrRZ0p2VCEMwdYeyqmDUnlaznudIiNxnkOhb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769551146; c=relaxed/simple;
	bh=QdLu62pR2lusMO+0suqgRVty1ILKnCO6FuairQFnFfg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=p8YMuXm1ZAZgHAY+UX32jgSGNYqUwUUdqu3DcV7m4JtXFYfBvP0S3xfrZzsDYaXRqadiDqrUE2BMaaG2LmcaoJkqTWGN718zIvcWmBVfKv7VB9ysO9KvMKdZ6fYxzm1ZkVgHaq6iesNpSIzozKHv5Xw14SimRKxwgIPH0h0VG3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=m03Vi5gN; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="m03Vi5gN"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-124877d78a6so3911419c88.1
        for <linux-next@vger.kernel.org>; Tue, 27 Jan 2026 13:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769551144; x=1770155944; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZN9zZD5JHhq2eCRz3FpcJuHJS43qoJIvIxBY26o07o0=;
        b=m03Vi5gNT8+eOuNaILj37hx052X27GTHJgga3UcLlHNqvQEqEGKCD6F8sX4n9zCd0g
         otLVIxduD/cgrB9hZ+MvLZx9m6WYsQ30WTnWbQycuYpmyobm0jgzZvaTkVeBTewCtPJm
         SqPPxCAr39b31IR5u94SuKzwWS9n8E6qbESKHxpJQxK0LNpg1MjcD05HFANoqOnQ8ftI
         OR6H3AUZ5luCpTMQEZdhNPXJGWxRNXnGrvmZp+KIyhtJbjH8aNBglw7ctQDg3yKZQOfX
         azvk6j6xBvIQwqrjgpJodYDtR53l8T9jBHpN9vp7p7pCmcwJ+QuZohoLzyS0KTJ5rqi8
         YqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769551144; x=1770155944;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZN9zZD5JHhq2eCRz3FpcJuHJS43qoJIvIxBY26o07o0=;
        b=tlmOHbpcioQEmuN4B/ykCdkNyj/8lvl2hkXcc+bGdf1QzXgWvWXEh5TUDxS6cjEGnc
         d21HkqfoJKQQCe/08PNABXGWuy00BD9gp/fgLw7fuhe6/yzb8USLXmUdmyRJ42SFDxrg
         x5h0tgLA+Bm6v4gbZ88jqYj7yBE6kqZrcg3x/CIqybs5YKKJB3b2AFFMVlovPadVzvla
         lvQRJaILni9WTR+GGLsdrExOYzQya+Dmesrgc6EsF7eWgZxRD9PNCczUQJxNn6nNyQxb
         mlt4aZtcjUVTZ83C00PjcJ3p8ZEg7ipmExy+AV4DoEImvkhkjN0dqJrY/R6K/vyvnp2+
         iPkw==
X-Forwarded-Encrypted: i=1; AJvYcCWjapiRTiJ2c8kCICBMCulYQbY5ny5yDWxYyxvYFzeXq29yzcA2VHe0KENdRz+WIN+zI6EpdTL8eEUf@vger.kernel.org
X-Gm-Message-State: AOJu0YzjvKwOirf5PE3ka7tnXKhV5vQ53J3NUcZXQTpT+5FxvodC2WhJ
	6tUSoj51ABxMM7B+kzxVdTtA7kaUBjCvvdaRIFs/JdYSB218IgdJHQTDZfQjm2Mv0/0=
X-Gm-Gg: AZuq6aIn1HxDVC0ca55oADSjtTciFWzwX6T0bmh7P7zFGlv9OCQ/zGsOh1YW+WJycy+
	ILvLwn8POyRx3CAuC/uEBrfJvMBpMFDXQrjqiEPKVyBM18/PX9sKKXV160XsQ2wU5HEbSl4a57M
	ApSQM4CjRg+LcFQXFBj1AHMkk2QmBoSRQvQSD9H8zeJsWDb833vFzGeeAsvarzmUTErAJlfaWhF
	mbq3XtxCKgqXaG91VwP0xxRKEp+5oW4pPFcEWBIRCaXwMLSBV/jqjkRYILrBKsnX3f1bY5nhl1r
	ZB8BYSEbrBcbGgdOvJKcPKc59nREn0B8XZ2yno/uKc+2B7mgDMiK6iv7MJxPCF1smsCCKuU2RcJ
	tjiOyBECX5RaQ6J4oYezJtwpjMRlTnNXtntPDX3FxIVS54LmxiSh59usry8RWUB4Y2/2D/G2kJo
	D1a+bfBzwOzP1CG4w=
X-Received: by 2002:a05:7022:20c:b0:124:65f7:2c2e with SMTP id a92af1059eb24-124a00e8c1dmr1561128c88.43.1769551144265;
        Tue, 27 Jan 2026 13:59:04 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a7c979a0sm1229836c88.17.2026.01.27.13.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 13:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) drivers/hwmon/cros_ec_hwmon.o:
 warning:
 objtool: cros_ec_hwmon_rea...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 27 Jan 2026 21:59:03 -0000
Message-ID: <176955114271.3366.15377999788690065865@22d5995788c3>





Hello,

New build issue found on next/master:

---
 drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7c: can't find jump dest instruction at .text+0xcf0 in drivers/hwmon/cros_ec_hwmon.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.warning]
---

- dashboard: https://d.kernelci.org/i/maestro:afa9c68f088cdf27ef09179db83770ab9ade3741
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  4f938c7d3b25d87b356af4106c2682caf8c835a2
- tags: next-20260127

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7c: can't find jump dest instruction at .text+0xcf0

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.12/x86_64/chromeos-intel-pineview.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-chromeos-intel-697901a11908a6300d99fbd8/.config
- dashboard: https://d.kernelci.org/build/maestro:697901a11908a6300d99fbd8


#kernelci issue maestro:afa9c68f088cdf27ef09179db83770ab9ade3741

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
