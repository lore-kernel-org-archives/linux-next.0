Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59E1331213
	for <linux-next@vger.kernel.org>; Mon, 18 May 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109149; cv=none; b=o03WHZBPiQGCTZs9GfX+MoJjFxneKjhSqpIGlQNDGS5iAcHO/0CtyGtO6NxUpDkx1Lj7D54w6waAZDzKHNcb+o49UkykH73qkLvsCkhMetDYCvO2DWaaLBoITCZYf5l60OjnpyfjJuyzjJc9DYsWULZ3NadiANOBBgh0zaEBLh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109149; c=relaxed/simple;
	bh=xwenoXoBcKZbor0J9cma9ZCefU/PzDqWBJpa7npMX+M=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ePySjSXGUn/FmsJr11EZ60PxxAItQ3eM6vM7pppEqLq2MmHKExcqepwODiy0f2EZJu1MPQHxUpOuScabnJlqxzO+TbrrLGKJPsvY8VaDFy90HV5K43FgOZ09orZ/uq/Wn5BKX3WVS6Jbpik8RpaxxFt05yFmK4B7C1wSjZ8HOz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=TlHuJf22; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="TlHuJf22"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-132c338a537so2061495c88.0
        for <linux-next@vger.kernel.org>; Mon, 18 May 2026 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779109145; x=1779713945; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuTEZR64FKNuPtyRQsfSeTrHGtBZhqAWTR0BwH6z2gU=;
        b=TlHuJf22ezoMvc7jQLTueDXeQNMn+UJ1KS8r9eM/7FAMZ5IO7Fx25Z0jPYDFn5LQsp
         HDkYshC/fBftipc+U+NwHODamkToTFT5KKsCTTGOLg8llgdGgIO7pS9JCC8sOY+qk/YT
         4Nr7ZDTwHJBEwKiSTGaU7fWMLxEXSnp/U1MhaSJ+UEHsaKDRkFpZw/NLxvxmhvCRnhLW
         90D/CVa4pc5XfsB7rbOuDHgnKj43h3iX0il8resGVRjX7VwyZ29qIaj6GaHiRFez0xj1
         /Doo/gUO7pR4zLpxVvoQz8RiT9CDPQbTADUhcBGgAiZTTgTtpwStHIDcjYJABAU4+cMh
         6NIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109145; x=1779713945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OuTEZR64FKNuPtyRQsfSeTrHGtBZhqAWTR0BwH6z2gU=;
        b=Pnr2BnKE7EIx92YkmDzArvkJHb5DOI/iTrxqIHEuvmLNF93eOpbjtvuK+h0H3crK9Z
         wZ4W/qDs6mS33+B2NQhSayQoxN53fRxP+avUSqD/z0czRpR2JE+wwcLt2UpbJO68SltL
         ZsrrhvZJ2FCNRxhnUadbB46nVD1dXAmbX8/dX4aPDBD8uEV6LKCt9COln06bcrx6JDPb
         Xdz1qHDJj+YPe76Rp9zvfKnsf8ucj44VwR0PPZFdF4njhSTTgO+u8il9yEiud1Jg6On5
         jED/dFk1vWIH0w7nAnAmSOIH3eXnpthXbSQLl8tYoxF4S2AlmdTeGqVxuui5dobyR1E9
         sHtw==
X-Forwarded-Encrypted: i=1; AFNElJ/7Y1phmM14XNEW4jkOwdhHqv/foJaBhMUKoogPZi0qfL2w7dZ4+BJfA5eVXleVK2VLxesoZFVMSFgL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiobai1YFImqizzICUd8yu1ScRJRJUveOxiAGoQicLWEV21a1Y
	WTSiR0GfggRJQHd5JF4UCkektY1IKt0k7SC13zIhGoo7mQxfz4Yei+UrqM15OqYgZsd7LA9g+zD
	oMTeB
X-Gm-Gg: Acq92OEG/ejCIqzy50JPiXRXOngiRICaT9u7dWFz3r73gyzHmC+CumtcUeM9Xy+GTxk
	zlF0E2Z79YBxPztP7w37rkIr/N3jHcTmxYUcUSRwLKCbc5J8Kf7xT075fATnIJBXcInt9CGh+3x
	VWUxuRUq6Or/dolHX1v4dIPVMPPRydJ5QHQmNaycxzfdY8xJt6p0voB8iH4ZQTWxRZWL0W2em1o
	gx3woza8AOQfLl7mtNVqdV4OJnDX8FxHA2FkWXNBYVtTpuKs6sdB4ZLZUwHQlI+KB5ZEQCotRoL
	kRvG4cGcHCyZY/e4Hm3OW5YRQ5Ft6792CZfo8Iy/2+TumYSplmOVPFwiAhri5v7uKGNTtKmbSjh
	fx3adqaGLv+o8c4zBwBpqD0an5xaEEyc2rFwxjjQ0eVer51blELyyVoyMwz2UQyWgqZunZxJzRO
	rpusD1ndC18rfO6JEe
X-Received: by 2002:a05:7301:128f:b0:2ed:e16:6b39 with SMTP id 5a478bee46e88-303979efbeemr5948778eec.17.1779109144678;
        Mon, 18 May 2026 05:59:04 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2ea78sm13518841eec.6.2026.05.18.05.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_next/pending-fixes=3A_=28build=29_implicit_declar?=
 =?utf-8?q?ation_of_function_=E2=80=98=5F=5Fhuge=5Fpmd=5Funshare=E2=80=99=3B?=
 =?utf-8?q?_did_you_mea=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 18 May 2026 12:59:04 -0000
Message-ID: <177910914374.2347.13071319489279095550@330cfa3079ca>





Hello,

New build issue found on next/pending-fixes:

---
 implicit declaration of function ‘__huge_pmd_unshare’; did you mean ‘huge_pmd_unshare’? [-Wimplicit-function-declaration] in mm/hugetlb.o (mm/hugetlb.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:ea522c94f7a4928113e69e8165de6c30db45f5e4
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  298cc5aa5aae60cc009e3cd66ff730bb53e3e1ad


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
mm/hugetlb.c:7281:17: error: implicit declaration of function ‘__huge_pmd_unshare’; did you mean ‘huge_pmd_unshare’? [-Wimplicit-function-declaration]
 7281 |                 __huge_pmd_unshare(&tlb, vma, address, ptep, take_locks);
      |                 ^~~~~~~~~~~~~~~~~~
      |                 huge_pmd_unshare
  AS      arch/x86/kernel/irqflags.o

=====================================================


# Builds where the incident occurred:

## defconfig+kcidebug+x86-board on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-kcidebug-6a0b067ed06a47b7c8f841fe/.config
- dashboard: https://d.kernelci.org/build/maestro:6a0b067ed06a47b7c8f841fe

## i386_defconfig on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-i386-build-only-6a0b0654d06a47b7c8f841d9/.config
- dashboard: https://d.kernelci.org/build/maestro:6a0b0654d06a47b7c8f841d9

## i386_defconfig+kselftest on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-i386-kselftest-6a0b0658d06a47b7c8f841dc/.config
- dashboard: https://d.kernelci.org/build/maestro:6a0b0658d06a47b7c8f841dc


#kernelci issue maestro:ea522c94f7a4928113e69e8165de6c30db45f5e4

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
