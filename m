Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792429016;
	b=bENAYFwhCPuEeK/GY1K3wcTYZ3O3p3p3GyIYkrQa/hNJuEF17WJ7G50s+oOCT2lfIeTW
	 Re+mEmXrq5sO9PBJgDbB3L9bvnb+NKC1mTNJFtqKvvgLGP79p2bZfIH5h1joFpgrqVIuL
	 58y8S/AWM73c4K2GlRzxfWSSVNJp3lk+liBXfCVI2UkG455Mc5m0UBZfb4PXsig38jJF8
	 R+GAiBByWQE9puQpPBmZw1qjTVNN+6wPloM7LpCDF271k13sVzTfJzgCeU8PpUhL/U0ju
	 t5wxcIuss8n9q4qshgiQf+sMfFYPJBkjv7avBxht+pxjPYBCl0BGlb4LcD3FVGXi6ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429016;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=93Mxke0ognMkCH1OvgVhoO05LeJUA+eXnVQ+rwQWPck=;
	b=jfSz3fTZb2q90oPPUHiBi+fOEY/EtSRryK6Ps4If6Q8bZ5OJ8lZ+jfZTChPRt0e2NnV9
	 e+ss72ZJ74dcKSW5nIB+nyJis5zLDIsnV6WdFF90NY8jbIp3kOj6Vnrn1kimtx+uIcalB
	 wYQSS8auN305+AkvCV2sxuBIJAz7WVqVo8qyIFc7ebvxigrW4wN0vdOA2KLebb830flQo
	 L/5HJPxC1mkMEyeIqwp0oNNsZT9rDGajfDMI+ZKtWoZGJ1f3A7uQioBBPDghSydVXNwVu
	 WklstZ1imo0I6yY4iPq4WJCCKnsd11lo4pkKdmOi9Dpd4pPrE3j4pjW6qgjb1Uf/9gA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gLnnaa9J;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=o0CKoNTJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38582606A31B
	for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 16:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38582606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gLnnaa9J;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=o0CKoNTJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792429015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=93Mxke0ognMkCH1OvgVhoO05LeJUA+eXnVQ+rwQWPck=;
	b=gLnnaa9JWYqEn44JVTPM5DO9ax4Bhw1s6mGajEX/SEA9HMHghHUqVADF4UIowZu7wvORmS
	jtxKAN3dlYo2OJXZBAknGz+ag3P+c4piJIqrTk3IwSRT9mfPDEQ+5Z9uN2WAteqw/abU3x
	IV7XVYTBnYdTXvjFb+2ijEUmHAJKky8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-BQizjpWHMVWtc7NUyQ7oUQ-1; Mon, 19 Oct 2026 16:56:53 +0000
X-MC-Unique: BQizjpWHMVWtc7NUyQ7oUQ-1
X-Mimecast-MFC-AGG-ID: BQizjpWHMVWtc7NUyQ7oUQ_1792429013
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c46582442so1509524f8f.0
        for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 09:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792429012; cv=none;
        d=google.com; s=arc-20260327;
        b=OJwFU9mSPgBxLPNRVoDsH0oi0SeCOOc78s9puzjNJuph6LfGExZ+bimsho9T1KutR8
         v9BV53TrvRXQl/ZgAgbE7H1tgaTlvf+LraLW8G60tUDFmEFcOetigzjyW39/C5Um6+EY
         T3q9J8YrF/2vchlkZQGwFmsYkSMcgJrqKuOBeVAVEuiQdw6F/Gx7VOyLa2a2TsUnRWpJ
         z4qNwQPT3mVcmWtNNo79wFxFIJbqCZepaz6WU+jIP5ad5R6G6McMMm3hZPHLswRt6KNN
         0clzc2wbAvpcZjMWnwBb+M277lD9OfiBj5HaQJ+MavfJazZpLPfs52cx1U0c7gFJI0xf
         NXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=93Mxke0ognMkCH1OvgVhoO05LeJUA+eXnVQ+rwQWPck=;
        fh=ALVUkF/LITbfws09IAVf2GXAX0olYZOWzdYW/LMXLEk=;
        b=Enx9nAWpEbeHMnCkT1kdZ2O6nOJpUEYG+jme3yy6kESwF6EcY//S7V9hhX3PqovTFK
         +ePOmtJYl0BHRSb/JQ4cOQz3Xnbm/GXdCxAN6m4LEU2dLyanDd/6iVSvC+Xf6cq350kR
         PqQGyevhQD8foxugSeDoYNutuIjCd0czwgi8tIBq3aD2hzn86ybjnk0pRHMDGq6f3E7A
         cVZKk8S1vz/ORm2MsWPOOnU9P/x4kba+1TC5VuMJPDZCdOqY4RnLcx88Jh5IHCjwiXWI
         BYRNbUSPvAUl506qQfFiGYyj+YkKZU7vI4XqymYrtHk/cukYG7fnVpNLVKeF90vvsMwE
         n2YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792429012; x=1793033812; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93Mxke0ognMkCH1OvgVhoO05LeJUA+eXnVQ+rwQWPck=;
        b=o0CKoNTJ9nq0iCDAq/bYcSJuBDOkV7XILTe+hrf2Tw7vlUrTQ8k9kPPDnxuNtN7qCE
         ibJYBkcHgUkNHPhZclxy5Ac53ja9kLoNNJY9XAMJD20bCpXEYVQ0evd4sTFO04QSLE6u
         aMjaScCeSDoMtHiE09BOhy7PChTSgXw03wrYvLl+drsFAGAxzDLbC7fflDp91+aRSmeM
         ZQnzrwfAN/5WNqpKm/KKLhDp7ilL3hSWcIbHRFt6gWNLKh8SVYduIpOb/NzoflgsmnRy
         OHv0AKFkebFPQ5dzEavMsaMx2BpsAkngXFs39e1DVGN9gISlon2zACSGTxzcj5CwyNv/
         8OCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429012; x=1793033812;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=93Mxke0ognMkCH1OvgVhoO05LeJUA+eXnVQ+rwQWPck=;
        b=Gn8L4yeXzy5o1RTDyNuCXyyz+TAwGW1et4lPazMd6zAAYliwK59/QYqvytwdglKRkh
         ybzpBllqbZnNY5nywAqhiWNwsLG0Tjfgvnut/0Y2/PgTgxw5wM0xyGn6RmrbNj3v0F1/
         zBVVhaIl6CGZFFL4sT9PzBeL3g5K44idxf6k25n6roWJbvjadUX/Nw7vepMgXqOC7Dau
         XMo0COGWlVaXUpdxgOEKxdeUVBTBJFSJcG4DpDm9ZIc0ztgp8NDtsnYvQXHwhnbHlugz
         /dW74RCxh2LUEVT+06NfRAGOiBci+fxDcE2WeZ7qUfc/FlO+MpnF5N9+kMbsOL+Iu96J
         T/ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFi6vrSCRk90UULr7np7zffWPzKLE6rT+uEcbC6vRKpb6d5viNgHkKQvIn9MV/m1LRyYujRd67mI0B@vger.kernel.org
X-Gm-Message-State: AFq9FYKZEVI1uPOenf6I0g9ihOxhLtmXlO+Xuij9Pa6rGzO+iMKnjSUP
	sB+dG49ifXBTB/hO2uZOxfUtEdR2m1wVmM4/gRyMyYHhRM9Wr4uLtB13rd57JAFjWIe7jUdVxB0
	T8HN68M65HfDkNPbhtLxYIylneUmUCrTRA3XSckH/xbvEKINSM6zbmdTYkarf8TEy67b66iZeER
	nqQg1Nly4DLgv1xjdZUoPCIj2smd5RSNacojt0BA==
X-Gm-Gg: AYBFou2Gyv/s7xJAcZc7BnBgndoO91vfBl04MXEZQs9YryGF0qkpubmMtQTMafYHq+Y
	UQL0uKhNIVYku+9KqCm0gwpv+HmnzC3B4daMIg6wBQGMbWDLD7/w9peR7Pk6RYy1OH67zXCZPiW
	tMIHpg0BBUo7RvSYsGQ8Y7Ilym78CY6VMZA5uzUlk0UK81xRMyjcz6exr74WGFbGRDTQ7WLgXEf
	h/gZYNi6Kw8JewPAGe3BI4ji0fyLkRBtvl1XR3InTa2zFPSjXJzsUC96ZByIw==
X-Received: by 2002:adf:ffc3:0:b0:48d:f3a4:a6aa with SMTP id ffacd0b85a97d-48e07bc36e1mr12549495f8f.35.1792429012735;
        Mon, 19 Oct 2026 09:56:52 -0700 (PDT)
X-Received: by 2002:adf:ffc3:0:b0:48d:f3a4:a6aa with SMTP id
 ffacd0b85a97d-48e07bc36e1mr12549457f8f.35.1792429012350; Mon, 19 Oct 2026
 09:56:52 -0700 (PDT)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atZJV1B79VsZoy8u@sirena.co.uk>
In-Reply-To: <atZJV1B79VsZoy8u@sirena.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 19 Oct 2026 18:56:39 +0200
X-Gm-Features: AclHuK8vumiua5SMjMCvMOThl3efjoSr2L_M6TnDtZ77TgU9w18ADr4xGbKM-sQ
Message-ID: <CABgObfYRYCrOj-rHDaDd3LSFMSd0ug-YoB2pD7jDA8ZgMR0sCA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the kvm tree
To: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
Content-Type: text/plain; charset="UTF-8"

Il lun 19 ott 2026, 18:46 Mark Brown <broonie@kernel.org> ha scritto:
>
> Hi all,
>
> Today's linux-next merge of the kvm-arm tree got a conflict in:
>
>   arch/arm64/kvm/mmu.c
>
> between commit:
>
>   dd0bc00e3e920 ("Merge branch kvm-arm64/cca-7.4 into kvmarm-master/next")
>
> from the kvm tree and commits:
>
>   b44a8c32f0116 ("KVM: arm64: Abstract out memory abort handling")
>   892c8a0bcc8e3 ("Merge branch kvm-arm64/cca-7.4 into kvmarm-master/next")
>
> from the kvm-arm tree.

Hi Marc/Oliver, is this something that will be fixed on your side by rebasing?

Paolo

