Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623881;
	b=xrhdEdL52wsazLQKZoRjGXpSBgs0SzuRopn7tqv4Y9Q/kXLR15wZHsyv+q4VtAk7LTI8
	 QgBJfXRA0UIsjl9MMqfQqXUJZnTloXqjxFVqmC4YVP9CjZCXXA3s/S5RZ1xFvhipr08Yf
	 3o+hE/5L1NNTQZ/tWW7EezdpJDWe6pNvD1RHmXCFytj1n5LeKhr288B4+kIe1SS3hDh2l
	 kjsjxCMiI4j+tTRSHheobfou7yEkGf8723exRtCerl0D7ZEJcMZbvZ73TbGhkML9xHbRf
	 yADaWN2lVsSjrqDBYpt8V084sXQJejEqOIJjSllBmlM6Gnv8TWvf3MKbbtt25QElsOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tWTWibl/ge8Zvl1jOV/aQs16Gnuxj1CxwYu+4cEZa2M=;
	b=qJqBGUMWHwxgeE442Zrw/KIk8XYLTFh6pYnTq/gugWSukKqPSfg91X3GEwZ+GADX9rdN
	 d7OUjCzcFUrddmxVhHjGcEV2fN2vlfumchRgeIjVtBsVPztNIsTIn8YM0L3SGEmM1ZPw5
	 gaCJJGbHl1ksQayUQV/FsSbzy+H3rDXW4eJNuQduApayC0YYzYuk8mG9OMGMzC25E7N66
	 Npq/TpDUWsypkN8zBQCOAwx/YqG4iAGWBKrzdXTRP1QafXnilnjEIRxRuEKywzsC2gM4I
	 uycRfmYltcrF5AUcNDsyFsE4pplVwfoFr7siTA5goLRSstzMYSGv7W+3/VlUO/T6Vdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SqH1k478;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C9C606A321
	for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 16:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C9C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SqH1k478
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fffso2882913a12.3
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 08:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795623879; x=1796228679; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWTWibl/ge8Zvl1jOV/aQs16Gnuxj1CxwYu+4cEZa2M=;
        b=SqH1k478HpRZNEF3tXvNYVHkHLWd7V3IHd6koMnIQGjSp2pSLLMRFjpXOvl5t7AkdV
         rFA7btVR6eQIbdHlPt8hTs2Tluxdxp69bVgc3Otn+pcDswb+k7juWOW1XFOkW/FgMfS9
         ZNz+OVAS+mvDqQWnSHJyrFhvNdY8+5iuzWY3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623879; x=1796228679;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tWTWibl/ge8Zvl1jOV/aQs16Gnuxj1CxwYu+4cEZa2M=;
        b=QEo5wQR8u5xUXCuGb4XUPrzg8VexURePg0Dm8NjDPl5V7VK9pVrcoPslatfpdVPxLQ
         YbAXhBKCBjmEnsmcPoDOBoJuAtcbASp6MZcvf2Qg8xThZWDn8x3bIaSKMf1EY2x7nXmS
         e3crPKieB+OyomPgg7nF3orxqGOHnOIvY5DRap6FTWg2nALKZThVUrhxcxgMvkgGkQaQ
         28dRFKlVeoTj1f1t+jQIjPP+O22izepgBsoZEnPwh8TRZbgMVlInSx/CMKlWDeSN0FEw
         ELCQyNkHspXUDU93OJziImKlMlgieyzAxvYDRoU8VYtEiWuIUbKQG4VhYH3lnwyRP/uu
         FTRA==
X-Forwarded-Encrypted: i=1; AL+hErEzt5JUIEseKM76WbR33bwxPDg3z9/3TvnLsNLSWngwKiUyZpCfddyiH2Y1YI1NULwIVTHdVLWfX0h3@vger.kernel.org
X-Gm-Message-State: APuU4Z+GcMJMcRsKpsPXTCH5agSBUslE75pZHzRYSgUjXVO4bB+nSTsH
	K2N3OBsficHIPQif6v4UMBLPwJv1IlSNm8XN7PntpIFc3Qbuq/ePCeI2J1JvA8AhFTuDM06c1Vr
	Tb8KSktH43w==
X-Gm-Gg: AZFdTZcm/Nb50mNPmG4E691mMPUJbJyKQFXYQPvBOc7HfPWFYXlXO5nTZuANuZ9mnRQ
	L9t3Z2UhW+4pEoc8fR9t0AHpLY7qJq+IhXKytEcsa8mSkAAKgV8uG96YfIIAVR5+s93NFYr0i2B
	PKOOYqwraH/D4wYNhckuNemVuORmYuM/YbvNE0sdv9bKUL/BpHdnLGqACubXZKgFZggvUA5sz3s
	P5w2EirzDFE2+wy7qK6uuXGfEuip0khCzijBgNznaIBRPIqrCmy+vAN1Xe80MOO1aoMJ3pryzc4
	Jux/UPAMhz7E9k+Ixwmy+xExED57/EiB/Q5akJeEPHKiKl2F6JF7hSpVysr+EUl9EhjNkMJHX85
	NPazLiohaUj+epC9EpprTSAhTb07Mon4rpjQ6KwiHH6UPN2gLU5M2zuxbftUOSwAlLFMiKhiSlg
	e+8WITBv5OcQn+AH91IDnXt1PJvVciLxSdLO9VgAowVcsGzKcr+kF34aLp9/K1iTvJInLQwlTEt
	juI9Bj1a4f7SzlXF/ch+fPU06U/yLfiyuXCe+JVgEaH45NxmZb8hiwo8zgIfu9IMYPBT9gx2EG/
	pI0WV8GeSpPxAxiPAehbFPy19zsBiDZ3KH6CEc/+RGA4qkrzN4oyd2pFcuZ4qRpOTqEX2l0+tjO
	mYIY=
X-Received: by 2002:a05:6402:2812:b0:6bb:2a86:1a42 with SMTP id 4fb4d7f45d1cf-6bb2a861cc1mr2232813a12.42.1795623878913;
        Wed, 25 Nov 2026 08:24:38 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e79f2sm8784796a12.15.2026.11.25.08.24.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:24:38 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c5133831027so854757166b.2
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 08:24:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH7MJdkkVxbECsXf+fi+pKcmNa5+PEg0NW79ZLnXqgFZDOD+YalOUtHraIl3FxeuG1+kxOv6zcqHkwV@vger.kernel.org
X-Received: by 2002:a17:906:c114:b0:c51:baf0:f9a with SMTP id
 a640c23a62f3a-c51baf010eemr106603566b.15.1795623878197; Wed, 25 Nov 2026
 08:24:38 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awbpOaMZRkKXbq1H@sirena.org.uk>
In-Reply-To: <awbpOaMZRkKXbq1H@sirena.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Nov 2026 08:24:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgG7RgD-rMiXa9wgirV9ztTLtdg3nj7_X4smR0TEx83aA@mail.gmail.com>
X-Gm-Features: Aa3M54rd7iTQvFsCUx1md6xHhDjfLba_zVZmBSC0Vk8dcbzllZr6KQgYCqdGNds
Message-ID: <CAHk-=wgG7RgD-rMiXa9wgirV9ztTLtdg3nj7_X4smR0TEx83aA@mail.gmail.com>
Subject: Re: linux-next: test failure in the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 05:57, Mark Brown <broonie@kernel.org> wrote:
>
> This is happening repeatedly on actual hardware (ie, -accel kvm is
> operative).  This will have been caused by some aspect of the ext4 merge
> that's tip of tree, the new tests were added in 3ca8192f79504 (ext4:
> expand KUnit tests for fs/ext4/inode.c) but I'm not sure if they're
> identifying actual issues.  These were in -next yesterday and did not
> cause any issues there so it seems likely they're flagging a real issue
> that's fixed somewhere like the vfs-brauner fixes tree which would have
> been merged first.

Well, it could be me having messed up the merge itself. There were a
few conflicts - but I was being careful and they did look quite
straightforward despite my annoyance at the timing of seeing those
kinds of conflicts.

So I _think_ the merge is fine, and judging by the actual failure
reports (eg inode_test_write_and_sync_metadata()) it is because the
tests are testing things that were fixed by commit d25c14b2d79e
("ext4: use sb_find_get_block_nonatomic() in
ext4_get_inode_loc_noio()")

                  Linus
