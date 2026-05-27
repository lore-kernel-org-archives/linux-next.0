Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D8B425CEB
	for <linux-next@vger.kernel.org>; Wed, 27 May 2026 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779895990; cv=none; b=iBKGXawJgF85ePEEqp9VMnxJqVrcDPZVRY+szWa2FUx3J1GC24U1O0p7ElkmaVzKsW0WyGLIRh7zFe/F3jgdXofBwevC1t3gS4Ud0maEd/TQ4ZZGdBIJj9jovYTUYMhGBwnqasq8RBJO68BUzoMxdhc8liwHDMj6Z6leNX7dJ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779895990; c=relaxed/simple;
	bh=6o8NpCQzNMw5EY7ITgIhQp8eAxTrMx/4jN2nU4rLdhY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EZ4x+bWg8eHbYdBfmqU9MloiibywsCGOPi9W2ANQ7FzvAWEmorSH8T59kC0kADCL1xz28gveSwtel8NoVr/rt7opWpt8rCeILgmNnIsvVRrwmNBq165111Yxvi9IL2o669b4Zx6p6PcS7hYRoS5my9oO/NLZUP8f5MTt5wx4Xl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kLHNzG+8; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kLHNzG+8"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-368b68a33adso16648912a91.1
        for <linux-next@vger.kernel.org>; Wed, 27 May 2026 08:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779895984; x=1780500784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8K2cyJFJ0lvvr+wj6b9c4S19+R8ceeicSZWpSb5vw+M=;
        b=kLHNzG+8oAIWTbH4lQAPgCkqOLbkWv7lVH1QuTkEXerLa3XRsEkRjlqwPybv54/vUC
         tDPp05ZBRg+sJfilTz3f9aIvq6LyoIxuiPxPh9ZPbXCdJvZyqNawt81OvvZ1ZFaagB/Z
         DbwqIkTo4P/pOh+D04lt9we1a0CCsrbiANq137AXHrluo7eSJFvzskKEm7itTR+lhey5
         Un2uCXG5WNXXsGh3F2tShPtc/7h5guAWS9ODrbhNom1uMKLuRbfFWz5TXEPwnhOvdfzB
         B3qKUZ6NdwC97TRr9/9j+VRLEwxeHjL4yDehp9bZyhSArYdXK3u+tBNKb8nS1KhF7l8R
         qPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779895984; x=1780500784;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8K2cyJFJ0lvvr+wj6b9c4S19+R8ceeicSZWpSb5vw+M=;
        b=JYmkV1fefNKCT3d++w2E8UNZLpiydfCtDOsOYTLkGD5JX8uZVLkkn17GsHmB+c/4+l
         mx13B2RwQsBEYjWSXIzpzkOYZ972qqnF027NrZq+vr9l+k5BkVqNVLZWRs2j6esspNdf
         fOv7Ms2FJNNd3yMM8yuK+NZLLHX4GHEz7VNfPWkmahb010T+CsKLTSKt8wSrGSsNkcjB
         AnhnF9UcYeCVakFschbOMyzpVL5sXFgNRGlC3tjO8zSKscxQDtkVaY4UeDuy1sKHQskk
         Ps8NgDsudbikVzc6ii7BP+1gPGbu+VZNNRBp65aYmIOt0zR0mJuQ/S8dtud2IwjwKuzz
         1O/A==
X-Forwarded-Encrypted: i=1; AFNElJ/FI/0V3EkUNtOU0MelpzYbIVwavwC86vP8gkYubynjO8H4y3VpKYq/H+hdQ4Q3BWTKgtMxyazq1JSv@vger.kernel.org
X-Gm-Message-State: AOJu0YzvjlWJ4X8+JM80R5xiO8aZXl38jbRhkFo9rnDdFENF0p97Vfny
	HPvzsRQIcRq3wNWlYRY4TrSPJcJrtLFt1lgmYUItrvR16cSo6gxpiff9eA90VmSODAhumcm3p2G
	MHBKexQ==
X-Received: from pgtq7.prod.google.com ([2002:a65:6847:0:b0:c82:7761:9945])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:6cc9:20b0:3b3:bdf5:117f
 with SMTP id adf61e73a8af0-3b3bdf527f2mr4978919637.40.1779895984271; Wed, 27
 May 2026 08:33:04 -0700 (PDT)
Date: Wed, 27 May 2026 08:33:03 -0700
In-Reply-To: <ahVN8WXF5WRX-Y_1@monoceros>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ahSDZV9eR6zJ1pxG@sirena.org.uk> <ahVN8WXF5WRX-Y_1@monoceros>
Message-ID: <ahcOr_dZGhWspNG6@google.com>
Subject: Re: linux-next: Tree for May 25
From: Sean Christopherson <seanjc@google.com>
To: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026, Uwe Kleine-K=C3=B6nig wrote:
> Hello Mark,
>=20
> I got a build failure and I think this is due to a mis-merge in next:
>=20
> 	WARNING: modpost: vmlinux: section mismatch in reference: tdx_module_run=
_update.cold+0x8 (section: .text.unlikely) -> get_tdx_sys_info_version (sec=
tion: .init.text)
> 	ERROR: modpost: Section mismatches detected.
> 	Set CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy to allow them.
>=20
>=20
> Commit 6e49a980dea9 ("x86/virt/tdx: Refresh TDX module version after
> update") drops the __init annotation from get_tdx_sys_info_version() in
> arch/x86/virt/vmx/tdx/tdx_global_metadata.c
>=20
> In commit f2deea555964 ("Merge branch 'next' of
> https://github.com/kvm-x86/linux.git") the __init is readded however.
> When I try to merge the two parents of f2deea555964 to reproduce the
> issue, git gets it right for me without a merge conflict (in that file).

Build bots reported this as well[*], but next-20260527 looks correct so I a=
ssume
Mark already handled this?

[*] https://lore.kernel.org/all/202605272110.QiNGdptX-lkp@intel.com
