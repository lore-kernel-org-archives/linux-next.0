Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786103ABD80
	for <linux-next@vger.kernel.org>; Tue,  4 Aug 2026 08:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831978; cv=none; b=N3VzusMTWE1KNSZpGKEYeEsL+ZDhmVyO6Ql5JozsWHNNCHsZDu/tO5/hAE3xz8vQBn5Z5X+YEyBJTmHWFvpYtN+nAc34PD4Osi8lDQOOiTPVOtNMpOG7iPM3jrMIe4YvItvMCWN1DRxQ+kF+uwXP7gQ6WWA6Z5Tw+lAxsrS3fdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831978; c=relaxed/simple;
	bh=J9Cht0yRH7rxT5ujSeWuU7p72gCgVFUxHAyVYpYEWw4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Lz1h0x+IrNxvqdrQmCwI7anebTS/Xkrpm72GTzd1eNMftmHDros0viElUyretS/kw3MalZSEoYh2g8BfZcONJ6OcXD+DbgKCDW8Y2hA+tfZQHpRHr0aLbpScgr11xgYRMrxugJIygEebTtEjMnKnR87FSSaHNnkrYY1taLKjXWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P7wZg3R0; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P7wZg3R0"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4957287363bso18685545e9.0
        for <linux-next@vger.kernel.org>; Tue, 04 Aug 2026 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785831972; x=1786436772; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lPOuC+cdb9P9bTryHSvHSPjFUa2kyhcweUAMjN3kNPk=;
        b=P7wZg3R0hy27BlB2rMXuJh4fmHtsiLC0DlwvfI8cAiXgCaFe4MY9vuKzYYVIN0MmIv
         zB/vYpPBLPIjRvNZOmPDD72BTc3/XywvNP+agwUJsI4yOAh0jg069Nzjx3A/irKAdFls
         NQRzweKu8qufzLmTX+bjMr1qfzGzd/18xkjWKPpB+tDwkkaNOhigF8VarItp9hlbHEJ7
         5NnhgQo8G1H0Poid1yoFPGvt4DZMB5NyBoAUIJwdhf3aY5gWgbzlDo3iHD8A4WCzpPDu
         DIZBumdDOL1UhFMJFBS484PyFLmzaFSBFX9AuiBwtkrjTntUT5Hfj8G/6cQwA43Cdrfk
         e5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785831972; x=1786436772;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPOuC+cdb9P9bTryHSvHSPjFUa2kyhcweUAMjN3kNPk=;
        b=QMLYzgZhQRVeTEoVhPVck3zwVRtf7HH1z0h7+z7cSC1XZLSI6a1NmqIE00UGw7hdQU
         TK8AIJUf7fEHcVQF9OTtHWu3XUaVWdNxxzA97YkCnANIW7IfOUveRCnIPiWbESsOOb3q
         dtfixWAn2KpE8aeOZONw1/E574A8W86JxgQakFZeMr9AIXNY6DtElNvnTAakoKInakEt
         qpYyafZh8Fo10o7VOJpJOhI6adDuW0FtvO+imCPNkuAqMwa/Bc+qJSWDSxRro4EaPt9C
         EI4zDpKjg0iAHrjevUhZYUaTEHkCPWZGBd5gn6Z40Ox52iTpAj2OfIyutHcfJZVAghAB
         1y7g==
X-Forwarded-Encrypted: i=1; AHgh+Rr5kxBNG9c0JM6NSz2vue3P9x59u6sZT/n5PumLisiRLT2+pbts85KbCTC5nNSthYkb8+ufcNC5IfXH@vger.kernel.org
X-Gm-Message-State: AOJu0YzsN/nMkP963tutYz05Q9yX+lslrCXwlCWyw0dFRT5XhAQtisss
	+hNUxV7VM2KRyUWfTieJPe1V87eK3vp+XgRBVvlesNNtF2rCyS0TwUxlLv1Ib3QSWQf/qNpK+j4
	J88zFYE1vkvtPst/SNA==
X-Received: from wmbhu8.prod.google.com ([2002:a05:600c:a288:b0:493:d884:f722])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:500d:b0:495:737a:7afe with SMTP id 5b1f17b1804b1-4980c6519d2mr330090645e9.15.1785831971266;
 Tue, 04 Aug 2026 01:26:11 -0700 (PDT)
Date: Tue, 4 Aug 2026 08:26:10 +0000
In-Reply-To: <20260731220137.GA3307698@ax162>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <amth-CMf3Xz5hR32@sirena.org.uk> <20260731075644.20215-1-ojeda@kernel.org>
 <am0AjzHc0m03CLVa@tardis.local> <CAH5fLggke1Yvv8btJSMFr5tEquydvKev8_7G4gSO5MvoAJUE3A@mail.gmail.com>
 <20260731220137.GA3307698@ax162>
Message-ID: <anGiIkvkDfYogBlu@google.com>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, 
	harry@kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	paulmck@kernel.org, puranjay@kernel.org, vbabka@kernel.org, vbabka@suse.cz, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bert Karwatzki <spasswolf@web.de>
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 31, 2026 at 03:01:37PM -0700, Nathan Chancellor wrote:
> On Fri, Jul 31, 2026 at 11:14:42PM +0200, Alice Ryhl wrote:
> > I like Nathan's fix as well.
> > 
> > Not sure if it needs to be done in the merge commit, or if we can
> > apply it as a patch to char-misc despite the unknown CFG_*?
> 
> It would need to be applied at the merge of the two trees because
> CONFIG_KVFREE_RCU_BATCHED was introduced back in 6.15 in commit
> c9f8f1242a4c ("slab: don't batch kvfree_rcu() with SLUB_TINY").

Is that required? Yes, the cfg(CONFIG_KVFREE_RCU_BATCHED) will fail in
Greg's tree because the CFG doesn't exist and is hence not enabled ...
but the cfg not applying is what we want.

The main risk I can think of is a warning about an unknown CFG being
used. Perhaps we could silence the warning?

Or I mean, we can also just fix it in the merge commit if that works for
everyone.

Alice
