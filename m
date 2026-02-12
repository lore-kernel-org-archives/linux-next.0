Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474D136672
	for <linux-next@vger.kernel.org>; Thu, 12 Feb 2026 15:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770909665; cv=none; b=Z1LyNvUBiSBNHY3ooLWRRZP2z6IlUCiN8tJVwVp78ylcSU2nS255SZd2rRsEzOPyg9WZIZ5o7FelQfAmwR5ZU0Z4TgrtfavFpgDNfTyMuWQnr8Vty8btD4cQB+4/m6Zltl7HNV06pgFi/wB6/Mpk2ksqjocMF6XJVoqD6+D3xlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770909665; c=relaxed/simple;
	bh=zQYMwoUuR9D4tz+mipTBZ8v7LNfQhGKkUErj4L7cs74=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BHOBu3z062pCoJzpqdTg5QN4Q0D44xUMGGgZiFQqWHy192/+JzLcqDMrqBNk92M+70x1EoHaQfi1ogGYUpc7oyFWwGTZDM0rbBr8wEXo7UBnGHwPg4edVCPOAjPPrXgXjrfSCwYw+OfHzl4eLiOglHTr+q2V/NnYcf7LhrAJfx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w+gaxzT6; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w+gaxzT6"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c5291b89733so1980258a12.0
        for <linux-next@vger.kernel.org>; Thu, 12 Feb 2026 07:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770909662; x=1771514462; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oVrUsLQlAckaCNk2C4sj42DJVtIN4Um6DekJOAfydLA=;
        b=w+gaxzT6tob8eD7+RlIc5iXluPMNS1DRMXVjN+w1aaVnUBBvqtKWwxMniEG8+ZtNRE
         z/cBxX+ahJ30xsbQtY6xDIkoD33r79lPGfXe2n7zSgc0wE6a+ROIhKOpapft6vg8tIpV
         ymTzCf537k3QFDmomWVzHmr+pQlTpJ/TkWzQF5LxcGC3IcYqo078CMAq0uQVg9jr5Syq
         R2Sd9XIRyhSpToW2Xe+e8TF5l6XqbYI91FeyqSQMmWViWpkmi6bJzfWbiEqtsA/jyqQV
         Cfs9TpyMTvNolklsnyCNEqdoXvUtsNCSldVGVQSAXQPkuqC8WYnsLIXtWUGx5AysgFgk
         0dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770909662; x=1771514462;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVrUsLQlAckaCNk2C4sj42DJVtIN4Um6DekJOAfydLA=;
        b=r1Zu/yo6l0weBjBUgxmuwlvKpd4/lpiVM4nZ0spet/cD1JZN0o883VpgBncFhp7xTn
         EjObj0Ppl80LOJ2uVifbUiohVBquOS/s0+g5crrvOXOaQsbayUaImiz9ohkED9nq3Aap
         6rIQaXOEwPM99aHxlraCkXz9mvSF5jw2MUFOXarpu2dOzlJTVvlkq3OBtPYad7emHb2g
         3b31/ZzFn2mAPKgUW23RJTA6aENwoL2H70rJkNGyUr7kW3BpXRE8eVDC/thFnEuOibD3
         NmkMphkQsmeCpIqeNvHHFTg44aK8u4+JyZvqH1cUPl5+dB1QCzrQTqjuHZKt0wtPWAsl
         cqdA==
X-Forwarded-Encrypted: i=1; AJvYcCX66/3O3Qyvk97pVc86jXEvk401PnmxjgJZjzLurJcwYKnQhOP3KBtEilutZTiXHq+90jBTo64fDSkh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx81n2FLlcZ21VKNw0xDdoh7Xm1qJz8V5MfYVZQPAL4z0FyXzCG
	iuDkzqM5uuZY4NCPDDLju+sg07EDhzQkEC0zClxODxOpLP8T36DKJZpWC2OzxqI4MqVYKNFRkq7
	Wgje7+g==
X-Received: from pgbdo14.prod.google.com ([2002:a05:6a02:e8e:b0:c63:59f0:d588])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7103:b0:35d:d477:a7ea
 with SMTP id adf61e73a8af0-3944ce47727mr2698982637.19.1770909662322; Thu, 12
 Feb 2026 07:21:02 -0800 (PST)
Date: Thu, 12 Feb 2026 07:21:00 -0800
In-Reply-To: <d68022c2-0c62-4acd-b287-8a409daa2c89@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aY3e0hIT1UDqLcvK@sirena.org.uk> <d68022c2-0c62-4acd-b287-8a409daa2c89@redhat.com>
Message-ID: <aY3v3BRx745P5d0y@google.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the kvm tree
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 12, 2026, Paolo Bonzini wrote:
> On 2/12/26 15:08, Mark Brown wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the kvm-x86 tree got conflicts in:
> > 
> >    arch/x86/kvm/svm/svm.c
> >    arch/x86/kvm/vmx/vmx.c
> > 
> > between commit:
> > 
> >    9e03b7caf4e65 ("Merge tag 'kvm-x86-misc-6.20' of https://github.com/kvm-x86/linux into HEAD")
> > 
> > from the kvm tree and commit:
> > 
> >    f8ade833b733a ("KVM: x86: Explicitly configure supported XSS from {svm,vmx}_set_cpu_caps()")
> > 
> > from the kvm-x86 tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Thanks, this is the tree that will go to Linus later today, so Sean will
> simply have to reset his tree to Linus's as usual.

Done (reset base to kvm/next).
