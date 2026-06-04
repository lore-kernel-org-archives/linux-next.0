Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF64E263F4A
	for <linux-next@vger.kernel.org>; Thu,  4 Jun 2026 23:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780615149; cv=none; b=aOBBtfFRuJNkrK1PjKl74x1yPQnwHhdGQRD1v0ZjlJq9VFVxmEPOP1YZfYlUzaQ2IKz0dz3/27Jr75E12KBRZXTnHNaRcsnNuvJnB1DZSrgbMFUIi2OyyIpbcP6gvOqPsO8HdL05Bst7PMM83mjm+Y5t5X4eWjRN6Jir+Te4Pro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780615149; c=relaxed/simple;
	bh=e+wiQFodefn4hcPnRr+g1nn8jYvYfVdxnZZL8PqQPNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyY1c7Nb9r8kYXmRosxmSj19JnsylbvnrMQ++ifd8rpiJzAivzvPtn3wvcusnEkmmVmh5Mbxjzk7ZV4CaheqRCnchNQfhHPp7Wji1L09dvLdD3u8oCSk5UdRN7Sb6Y2B+yQtICOnzX1UaNE6Ws7yzoFbtz1svuLLP2AIlSMXJjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ATUITxFo; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ATUITxFo"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so2278323a12.2
        for <linux-next@vger.kernel.org>; Thu, 04 Jun 2026 16:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1780615145; x=1781219945; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1t03YMole+ly6+fJzmqkdJokSNqVZigB4RGvlZCSlLc=;
        b=ATUITxFogD8HCV2O7l4LS+CCO4NC4YeesW/jNwP3qANKIrNJO1Es50W0a+jEuncpNY
         gVkhQ0oevCrsP+lvVYB75iVEqb5J5Raugr9WHWoQNaRRxgR7bcCNNflWsmapzR6+d05h
         uvaSAyHq+/80VHG25Kiu4MjEDm+Mbr10hPPT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780615145; x=1781219945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1t03YMole+ly6+fJzmqkdJokSNqVZigB4RGvlZCSlLc=;
        b=i6DxYSTgGOx4LSHlneNnyo8OPSQposZGyqX8aEQJH/dSA2A7dhseD6TnOp1Rffsow+
         CSFDfXccE8OrChzqxrWN7r4d2YEFJmJP4/tunR8bB0I3rh6H/hJOH706bmBTX75wrhDC
         VPuCx6DCsLcVmI4xXOHg2MHReZyDr5o9EAPowQ51hT5ZemhztnHqbDW5xnacg/5GZ/0j
         rj/ZYZXR9NS4YcrOl5at4xa1RmG8sCAotU+MbE5WGB9/L19glb0poVTvaKpi0UtbF8rS
         si1atYnuP3OUzsA4QCBPWaeRZzVanPpBYm5P9LeL09qieW7O1hs7ZB012htHJi4pgPa3
         vE0A==
X-Forwarded-Encrypted: i=1; AFNElJ+nSEfDOMST87KZO95xQxrD36J9H1yiky0D2msRYrUFHr3XFf2s8IfPDfDltF4ItE9JFA0wYuA43GXx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/myGQejmg+imaeDnzw2u7WZPoIK5dWV0pjjawTAa6XJakze2
	xMx3J3trwFWl5QDlB6xRsmafMiwKlE5P0uvgMvEQqLTitsfLogCvcXo2ojkHw5BsKmmSY/c9gdi
	mPZQLhPzDUA==
X-Gm-Gg: Acq92OEn4Y1IpfqMSltwfV3+oX+gUvfQf/iHXo35XTTTa7md692S0CP6jp+BQPVOnDz
	rZ+3TAwqY1bmJQjGieDESNWyM4GkeLoBSrhhlNQSPsfG7Cf80zYwaLFvD9wpqiPfZBZdhEypdHV
	wsuyYA/fkk2B5sGhHQUBdfKs278Ls4faP8bjfjTH23WUSmz84+T+lKF7e0k7JK/hYB/n98tzTat
	eWegWgWL1gBAFhpvXTJhVYhBagRV3sfZMRiB/3/g4yisPeKgPSwynh13MS5ccg32stfFZMfVFBi
	FdhlJGhfG4he7svqKnWAAAVAhtoq9hI73QCOLULuRs3thpO3wqjHAoDZKBBzwDGRQV2LBKzUiEO
	VAMNy4i4L6B2Znjn6Smt6IlKjJnGRo47cQeh5j3pG2W/UKLH+r3PzXjb+ooy7e72HE30atS8E/M
	Kdj7wY/HbUYZKVTQpcoFEliEV5jWYMKR2EcyjuJNvB1fapS3CSKuJ+r2+2bdJ+GubV2anPfNRfD
	/Rio57WWvc=
X-Received: by 2002:a05:6402:3492:b0:687:4f84:1c2b with SMTP id 4fb4d7f45d1cf-68fa503bbf4mr396961a12.12.1780615145163;
        Thu, 04 Jun 2026 16:19:05 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585185csm3026970a12.16.2026.06.04.16.19.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 16:19:03 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so2278279a12.2
        for <linux-next@vger.kernel.org>; Thu, 04 Jun 2026 16:19:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8yC4eYADQjEPywW2KaX0mNTFLzerLyHve9HzD1iHl4c61VD6saDK0XFYL7p+5o1/O0VVkPSUQsukxY@vger.kernel.org
X-Received: by 2002:a05:6402:40d2:b0:68b:5e48:750f with SMTP id
 4fb4d7f45d1cf-68fa525ad77mr439899a12.25.1780615143537; Thu, 04 Jun 2026
 16:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <83f77b2b-8c00-424d-b6f9-b044e7ea1ee7@sirena.org.uk>
 <CAHk-=wj6CtZS9hbwFjQcoNkPwQLoyKmk8czaBF6=bBOCYuXEUQ@mail.gmail.com>
 <CAHC9VhRX1=tx4+arzuH76kirYFFJozexa5L=41Bb2QbgWZXOkQ@mail.gmail.com>
 <CAHk-=wj_rtiufEEVudMCSbh86HYrnmEa9NhYfKeWHs1SOzJVnA@mail.gmail.com> <CAHC9VhRXW_kyWXgYBqW3K-jSr5yN9wp1EPos1c=BFmiebxLiUQ@mail.gmail.com>
In-Reply-To: <CAHC9VhRXW_kyWXgYBqW3K-jSr5yN9wp1EPos1c=BFmiebxLiUQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Jun 2026 16:18:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wij4nkMRcshzEGsxvjwP2RBQyaiQ4-vQrYTOqvQusxu9g@mail.gmail.com>
X-Gm-Features: AVVi8CcZbp6oblGDP2dwW15N5QHkOyIDDcZIe3k_o9LsAC_bkAWxdIwmjPOUXmo
Message-ID: <CAHk-=wij4nkMRcshzEGsxvjwP2RBQyaiQ4-vQrYTOqvQusxu9g@mail.gmail.com>
Subject: Re: -next status as at v7.1-rc6
To: Paul Moore <paul@paul-moore.com>
Cc: linux-security-module@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Blaise Boscaccy <bboscaccy@linux.microsoft.com>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 15:23, Paul Moore <paul@paul-moore.com> wrote:
>
> While you didn't reply to any of my comments explaining how Hornet
> works, specifically how it ties into the kernel, I'm assuming you've
> read the overview.  Can you help those of us in the LSM space
> understand why a BPF dev's NACK on code that lives strictly under
> security/ is sufficient grounds to reject an LSM patch?

Honestly, I'm not competent to make a judgment call between two
different models for hash chain verification, so I basically *have* to
go by maintainer opinions.

And the discussions I have been cc'd on have not been what I'd call
enlightening.

But people have pointed out that the LSM code mucks around with bpf
internals, and those NAK's have had reasons for them.

And honestly, I don't understand *why* Hornet does what it does - and
does it in ways that obviously annoy the bpf people. There is no
*reason* to look at the bpf maps that I can see, and from my
understanding of Alexei's arguments (which may be lacking), the fact
that Hornet does that is the main reason for the NAK.

But instead of working with the bpf people on coming up with some
model that does *not* do that, it all seems to have become a "we'll do
it anyway, despite maintainer complaints".

And I *did* see the bpf people pointing to "this would be an
acceptable alternative" with KP Singh outlining something that *had*
been discussed.

But I never actually saw anybody say "ok, we'll try that instead".

Maybe I missed it.

But from what I saw, it really looked like "I see NAK's from three
different bpf maintainers, with suggested alternate approaches". None
of which resulted in anything that looked like "ok, we'll try to
follow your guidance", only more of the same.

Why would *my* input then make any difference?

The bpf people's arguments resonated more with me. For example, the
whole "we need to know if it passed the bpf signature" seems to be
complate pointless silliness, and the bpf peoples responses to that
resonated with me. There's *no* point in any LSM check whether the
signature passed or not, since if it didn't pass, it's not getting
loaded.

So that's basically where I stand - I've seen disagreement, and I've
seen what looks to me like reasonable push-back, and I've not really
seen the LSM response as taking it into account.

           Linus
