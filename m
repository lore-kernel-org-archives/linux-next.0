Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E583DA5AC
	for <linux-next@vger.kernel.org>; Thu,  9 Apr 2026 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775757547; cv=none; b=VcKXkFyM9PISfUjPyhkgL3pM7v8jKTJ+/9BcJdALqUkPCtI6cZnAw2UUPLHAk9fTirwucTf6aeoJqqKXpn4QYjBwp9xph4Q1W0iaRbpOglan1N3HvxzVOCkAL8Ub81lfgbO7MR6mU2Ji4pXsXqiDDc+nx13diGVQPxi8C42mNdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775757547; c=relaxed/simple;
	bh=5bT8iQ83x4f61jVgp7+jbX7dMQomoQswiUTAqppeUfk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=joWDHkhMe8tdPGGxQUu7SAcdKcZK07KUWUPZgRhKUcushg39E/62MecgxUxxCEw6Ep6eKgAii8qFKMAOvxEsJItL5HlspxdBbKddIQ/iQDvDFBvP3eKMIkRZgonhZMdfGMeG++uSP2uSJogtAF6lxGuZ6ZqXL9Pz2YnFHSwilJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=bZQYCL0P; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="bZQYCL0P"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c156c4a9efso1732648eec.1
        for <linux-next@vger.kernel.org>; Thu, 09 Apr 2026 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775757545; x=1776362345; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj4f+XEQfXlciZ5DZoE30+GE6CPx+KcrDN6kKeQ8GTk=;
        b=bZQYCL0PC8sid/DSMpOdxGjD6ieT4Fs0+qqNiuyQeX5uNifsSVAiIJ1WvUWNGvDPSW
         BDy6JHYuOL1SPjuQTy4Q+u099huMPDc9/0ckl1Mc6I0yWr+yS46kmfWrXQFbgfX974RV
         nNwLW5CwSophqRjc+m2Xgy8r1J595PFf7m2jz+0GLJByg+qLmccU2YLzMEjDzOuimKzD
         yc8tUGD0o7benqrVzmTgUlFJSDCNO3p30OY3Zya9NexI79UGhKdJGN1BwafLd6qb5tIH
         bqYxGmboowHN6qqjtwZeEwBpcHpfTl2yqVd7ekn5D+YrAHVNu5M4JWCERI7L6QtndakY
         cQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775757545; x=1776362345;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uj4f+XEQfXlciZ5DZoE30+GE6CPx+KcrDN6kKeQ8GTk=;
        b=dJGNLfXTjKt6USKHKvlJQGggPz2THLDPGKBpGwnsoyg34/HpN1DRrCHWe6F6Pwfq2D
         Y4ftNcc6OvLzr/1nbdLj3EqpOBOquIx7bS042QUgXhB1p/H9r/jVGlerK/MlCJIZQw1g
         6czgdxdzU/lvGZtfGO7khHzgnZiamzN+E4ZhEtYfRA3Rw7Be3fxwjElL/gdKEtv/NgNt
         pMm4RVTn1O1quIaR1DqNlLTZAHKssC/W1qmHSoPiBbxszQ1nd8+bNQHQVlmNo+oODxA1
         wx8JktTwKIoGt7FX/iC5kr6lo32qFdk1mLkG2TJsmFMMUPbGDTK0Yp2FH5arHXofOoyV
         tO5g==
X-Forwarded-Encrypted: i=1; AJvYcCUQUuRvLJctZ1L8U/9/oMG/4naS8FP9zqVlPCMDPBYZHHuaWrIhC3F/KYEBHHy+oRRFWwW8A/3BJgto@vger.kernel.org
X-Gm-Message-State: AOJu0YwJj86Aeae72PkqfpLo7j4KPozwpWkDeGnBJ71II8+h2EFF9IiW
	MVuEXZj4zEy//wzkoxr1lIzgcL5Wa8WFcsN6MCHd4shFD0y50IE4FtHrlUZCrcE7vJY=
X-Gm-Gg: AeBDiet6ALx7ktZF+2n92mQLrSY0CUTeAQwxfUURwha9XOqJK2okI20rflKHTpco2Xj
	Q41j3IGP0XkorlJ8HM+Lv54GaTUwTXWqhZFiUSX2EHK2hTiivbbF9F1tbGbAlWeCGGfLQcZp5Bu
	N6gdWbdJEZsHkwTTZB3d0lL8CZ/24NSqmwsGDoVFld/qCyeaj3nBo4Zs5P8PqhxV5/F86WU12ad
	RinFBfIuctIrltMtW+fijQDdg3v6pc5S0jjpIppVcDpsxCc5y988/Jf6fovUtE/7L269Hc/nDtl
	zwYQXBoYcD1gdCBZEH+PYVIO+G5Bc4ubtIhKqcfnoARTIGXnyHOQ2O+/8UJnQaJR4gkKhpPYyok
	RqUKH9ovi8vztgr8QDtGf33phT4TYyk8yxnnpr9YEQF8pWxqkZ41fOVNBS8NCddgpNWkrZMyt/f
	dTYMcy4jFSjVnd4i4m
X-Received: by 2002:a05:7300:7c09:b0:2d4:532e:7e37 with SMTP id 5a478bee46e88-2d589a9850fmr28103eec.29.1775757544903;
        Thu, 09 Apr 2026 10:59:04 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2a4esm771098eec.16.2026.04.09.10.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in testcases/gcs_write_fault
 (Makefile:31)
 [logspec:kbuild,kbuild....
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 09 Apr 2026 17:59:03 -0000
Message-ID: <177575754349.3392.7097741727041803278@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 in testcases/gcs_write_fault (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:837688a95afbb9b44863d912ece5498d99b9fa72
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  3fa7d958829eb9bc3b469ed07f11de3d2804ef71
- tags: next-20260409

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+preempt_rt on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d7c39d86a2e63970e628c4


#kernelci issue maestro:837688a95afbb9b44863d912ece5498d99b9fa72

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
