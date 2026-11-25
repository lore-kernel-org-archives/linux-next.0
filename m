Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629576;
	b=KppAZcBY/ZI6f0R6mxKIgrRAHSrqkQDeAv866XVTDPQxmQ5Lts5K7zqPYuittRsTUtuD
	 GhyRy4QQvQSuDJVGbq4bdiUxUPHG7jxl21k6mbRlBKvikKU4QcLsFPZ0Cezl2LcBHhP7x
	 YJDGG0plMiIJFoz9w36WCF9+efzcZ/K4f/Wf8Yn52pc9tJ0rPyY6J94Ui9co0FWn1YxtQ
	 AahBOiIAuWYKnKlZIvCRn3TKIn1tPnUvxm8RQN1DG7Tx/EjBuBPgjo4yaTA0dQ9ZoMLdw
	 +lOt0UGZJIXu0auh+WLjGQorDOc2I7yWVZcLf4TAzVwfqpVLXjsH+Kff23t4iFKm1tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=90/s0j/8y+3kJDj7DR6pgcTmblldR4C2m7/voM9qoFg=;
	b=h4EyxSNQssbv4ZaiainC3kNe+dREDwjJf+j/HAG/QPPKIDaX582+mFjlunHxImHvvSdz
	 B2UltwaZjWSsmUclbdYhapLsYq0ZqEF9AIyZhhLTGd0VoA0L210iCUkvlc5rS+WZ4Z1vI
	 iIbXNrV6chSp2UDP3h31WtOYYjHPfJ4mN/JDCoxZCGYFAiPGl2bkrf1qmwAdZBvBlHPrL
	 RHfZU/zpO97IbutLyHJ4WYsR6rYU8qDOOt2TUgegwQxDUTUlx7D8qQe5NBdiElxBFohAv
	 DES8t5R2ZYTY6Y5LyUWsy8817CMgxVIiNnalb5XdLtyuWLC5TK371/RhHX84Fb4NteA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=bUUcARBz;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B733606A327
	for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 17:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B733606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=bUUcARBz
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4395d31228so1031514766b.1
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 09:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795629573; x=1796234373; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90/s0j/8y+3kJDj7DR6pgcTmblldR4C2m7/voM9qoFg=;
        b=bUUcARBzIEzz1MTc6U8hbaJeNIUMZIJ3/5qMgsk9kCcTpPi4KOdfWlUuPW94YazrZS
         hMOPu96DIb1CMcRt5FnniVu7qER3szg7EKKgOIUlzT42DjUZ5whJYRRtHKe1LcQwlQeu
         oB9+BkTE0w1id1F7GP61l6uC2yCGOO8zFmWqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629573; x=1796234373;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=90/s0j/8y+3kJDj7DR6pgcTmblldR4C2m7/voM9qoFg=;
        b=HDvNLSkBIxjUKMixbsh8Vv7IHBS4o+XX0X6wz+L4Wie4lHctH4a+M1Qx8LtlwI8x+n
         viZ0fPO15ULvCKS03lH5pojM+mPN7I0sWL0Vqm1mr9Bs2+acUaU7pxVWHaUmqT1HQGy8
         78UcgBWc7/S06j8pRdW5gFiNhUHB3Y7jZ9xcQhU+DTEjZw7Yn2V0xfY+jJ91qwALiXD2
         AJzPB8HqcWQC731hgJeR4ABh7Wn7BkrUft+eFrJUouGTNxqmH47h2DbIijt1NoWFM7yN
         RmmVebN4Q0xW+ePBiXGQHsHcVX7KLw+fL/kQ2VS2p58395OZ62CvaxaCzGKzoW8vB+Cv
         ZVig==
X-Forwarded-Encrypted: i=1; AL+hErHk82quynrcHXi/QQ4sY8BUXyKzJdPOdlSX3wpAom+6EVCcd1MSmJ/ZtbdqX0l64LZUiefvdk2DVty1@vger.kernel.org
X-Gm-Message-State: APuU4Z8NIPFJ7v8G/cAcyIQvSWrgNQYXQPYGWaAFWRIyR8jkQgSXfcaJ
	baicixzpiheVsCsrNIl3wBJBsqdafD+idfHqYd6d+UuvDrlW3mzrub6YqXRC/bDzuN+PfuJYCFU
	RNN46u0K6Mw==
X-Gm-Gg: AZFdTZcYybmexKLa+z8nbfUwZr3drx/+08ooiY8wFY+40GqwQvwidt5BXn7nj46z9Ur
	sIDMoZO4rwfSE/k4f7u5nwJgEcunFen/BL6v4u2Xfiqb9hxTIfp5YDXgfRivuu/lfB6btyeu9iH
	4X60uJ3MeGAjYQK6sR0UT7eYQIKPqjEBFQIWzup8k9MjoOccgjIPFepofipjT9UjQwN49WRaaNd
	/s3fbP6/1KNiKtyMiIXmW215wzOPhZq/saY8pn/oG9wIbe0Q0DDk37yrQPFhXOsiFvf8fIu13h7
	CftB9tidITAZe7eDSf+eXaaft1+eF7NQaITkbi+JFgurFe0Lb514OqQs544aorGRyiwRB6BpeRw
	xZ4N3nTNb5eJVBKqvgas8N/hYo+TIWZstxrDxrQh4dPY9buvugtvAIR2lChbKROk+r7jNQ+O+ww
	kx7kGSokitjaNTvrKMv3jQHGEmWzWVXIioHJiTSRRiMMM0FRDRPJPQh/z64eu9Yf06CWpPS5I2t
	5MHFUFbgVkn4+087r6goJt7zBD/uFc3Hszo5ec8fmJHWvXiA2iHvqmd8B+sopOHbcMoeem13Jcx
	7RpeLX4RaZkJFBbnfm3X8X4f2MDLnTD4jcegkLXHL10jtyf/IfmbX/PGZSif7A4QsDcRvYzFWfK
	HEjoObqAe1ETEFffQyvHj7VLa
X-Received: by 2002:a17:906:2419:b0:c50:750a:6a1b with SMTP id a640c23a62f3a-c513a878473mr1237557266b.29.1795629573437;
        Wed, 25 Nov 2026 09:59:33 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm675306266b.40.2026.11.25.09.59.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:59:33 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4395d31228so1031511966b.1
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 09:59:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGWgtgpky5DmizpfJayUXn2WgggGHvnwxvnz1213gmMeowe3xcetDGIB2B7o6zbx/2cGtCp/RvAS5S/@vger.kernel.org
X-Received: by 2002:a17:907:940a:b0:c50:94be:22ab with SMTP id
 a640c23a62f3a-c513a805245mr1756514466b.18.1795629572725; Wed, 25 Nov 2026
 09:59:32 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awbpOaMZRkKXbq1H@sirena.org.uk> <CAHk-=wgG7RgD-rMiXa9wgirV9ztTLtdg3nj7_X4smR0TEx83aA@mail.gmail.com>
 <674edd30-0087-4341-8a13-3c306583705b@sirena.org.uk> <15549465-a429-4243-af9c-8a26ba497891@sirena.org.uk>
In-Reply-To: <15549465-a429-4243-af9c-8a26ba497891@sirena.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Nov 2026 09:59:16 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9sFHw4pKpMzUaNDAUdtX+xdQU=dmO+AqgSgrRMZf5PQ@mail.gmail.com>
X-Gm-Features: Aa3M54qFsXlpd-VlkrAWP94OJscFHQNa8dj4dknRWf6xdMLThXVEkICQrcNFbiQ
Message-ID: <CAHk-=wj9sFHw4pKpMzUaNDAUdtX+xdQU=dmO+AqgSgrRMZf5PQ@mail.gmail.com>
Subject: Re: linux-next: test failure in the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 09:53, Mark Brown <broonie@kernel.org> wrote:
>
> Inspecting the diffs with the various versions and testing quickly I
> think you need:

That looks right.  Except I think the pattern there is that it should
create a nonatomic stub, and activate *that*, and then call that
generic stub from there.

At least going by inode_test_sb_getblk_unmovable_stub()..

But I'll leave this for Ted, since I'm not actually *running* the
tests, so I'll stop making fixes based on what I think the pattern
matching should be.

Ted?

                   Linus
