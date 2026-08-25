Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D19B47CC8F
	for <linux-next@vger.kernel.org>; Tue, 25 Aug 2026 14:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668024; cv=none; b=Nl3vPX3UQLo8mfzktOFANtr2uXvltOWN9FZjEoutQYbWCD2s2vA8iy6EmSbZIZsJsW6NBoGvcg7Q7JuYNgCg/XIIcelUDD4SHLkP1x+obEW1+zmiOHs8s7aSgyeZZmbhxfwKvdyfqsMKTHCYfFNNEbIdm6EKvEa7qNpm2JKbhQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668024; c=relaxed/simple;
	bh=iggwS5qNk0O6dpFnEPch1q6f2uoYHUpDTK99QoQUsmk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xo8J6agvf1RU1rUedQfSMphq1WEQMxxFMlwTrsPdey3cwzDOMwlwh/zxk6DWC9wbB5LPxvQeQpZT10tQ2XG8fSJbSz1qFG9tgz5wzVUx4W85EaBSLpSZGdZf/JprkoxAvWUgOQCvyBW+IIGQ8FnYfaHuR+B/uGMd/aWK3xfG2KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UlTmcQtE; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UlTmcQtE"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so8301494a91.1
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2026 07:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787668022; x=1788272822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p7z5jNTdUBIQty4rQGf4wGM+0E3saDplq3UPpEgCikk=;
        b=UlTmcQtESf/RPBr8k5uCo9KWdaXSpyVK8dpGxRDmKYu+q+2oqkxhfUnEOU6dUiBfHg
         a1OyUccp/+luY39pgn7jg6TVUFJsA9kCd8wlurlxuz2yP27j7jl3g/ViF+wbIZNvYsPU
         xzIp+nRT0F6kbJuD5jtnFdyvF9ePSUMez5MArdBYNB7wAlkgHTmJXsG/qBshYPoZYhwc
         Dl7w/Q7dvx9FVVt6I0PeUH4QyFOoBfsaT70Gz/w35wkBdLMDiw/scHO6fIaZIfkjruwa
         3q2WG6wcDD8vOpRvyjzqMmn7xPxtmchgEArOm7deAfLlg/FAYwf41gmqEplRJbMyKLqN
         CMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668022; x=1788272822;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7z5jNTdUBIQty4rQGf4wGM+0E3saDplq3UPpEgCikk=;
        b=rBxz/lHE64yc5u9DP8wNNMln0weeyuUZxbE2DU/Xn3ShJzmSQC+7Fml68S7m8zIbA7
         D3acI7mdShk+9K+Mor4eA11bgwwxqpK0WOZIy2ig6EkZF1f1qYG/D70cEmwgtmv1SpcV
         0bSTJltXxc8QwSOmYjcC/uVD7BWq6MiUjlLXC0DARMdct+RC+IJUZZ8ZStVdbTs+fvHn
         AZEFJ8WSIXJgfIhhxzfmp0xtNqou2JRwtkayQhx07SyZUXNqLVguq4RNQ6FqGduN/2CV
         0pId98vvHymtbtHBHXL7Q0g5t/zGrvXVknIGIrDNUTWntQEPjTCrraXLOO22cd+rmYLR
         rDsg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6lm8LGTEXVSIhSPLJsENMIR/m7XdNTViBT4H+LVCWpdZu12meSIcVT1vCwVB0ptIK4QdyXniZyD96@vger.kernel.org
X-Gm-Message-State: AFuF++nDxctZkAROuJQ1lRG5Ndl6gslf/l/CZDme7btPFOPTun01lg1O
	Y/VhsNApaBWyr3HZH30VAkSJrzAivwqFIy/NFgPhVRiXO58m7Dr6Nx0fYv4pkYu8yaX1A2WRyFK
	Z9p0RNg==
X-Received: from pgec18.prod.google.com ([2002:a63:9612:0:b0:c86:61a1:3390])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5867:b0:395:4de4:92c8
 with SMTP id 98e67ed59e1d1-395df4dcdbcmr55013906a91.15.1787668022148; Tue, 25
 Aug 2026 07:27:02 -0700 (PDT)
Date: Tue, 25 Aug 2026 07:27:01 -0700
In-Reply-To: <CABgObfa3xML+PJK0242GiHs1warwSrf4ikN4wTTtwOUdFazhRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ao2ZkNr2eHlUD2RH@sirena.org.uk> <CABgObfa3xML+PJK0242GiHs1warwSrf4ikN4wTTtwOUdFazhRw@mail.gmail.com>
Message-ID: <ao2mNbsvmROAna2V@google.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the kvm tree
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026, Paolo Bonzini wrote:
> On Tue, Aug 25, 2026 at 3:33=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the kvm-x86 tree got a conflict in:
> >
> >   tools/testing/selftests/kvm/steal_time.c
> >
> > between commit:
> >
> >   15a9a2ba0c546 ("Merge tag 'kvm-x86-selftests2-7.3' of https://github.=
com/kvm-x86/linux into HEAD")
> >
> > from the kvm tree and commit:
> >
> >   12c2a7f18f579 ("Merge branch 'selftests2'")
> >
> > from the kvm-x86 tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
>=20
> Thanks, this is just a small difference in how I fixed the conflict
> between multiple kvm-x86 pull requests. Either version is fine, and
> Sean will force-push to Linus's tree at some point anyway.

I force-pushed using kvm/next, so this should go away.  Thanks!
