Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1EC373BFE
	for <linux-next@vger.kernel.org>; Thu, 12 Mar 2026 17:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773338291; cv=none; b=cvMZo2ovDAq0vIdUbRncJOEwtb/UvzjFWEFhICAuBOCN/A89cicWRUu5PS+0uJf3gUiv6wPLudagXLqGGOXE+OS4UFfiZ283URqhOSzu7abOZWT1V0JwrljxxbrRTssx5Zw3XNwq+beqs0GUI3oLjKXYwbxa7j0vkgv1dJCkTjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773338291; c=relaxed/simple;
	bh=dOHSQQIg/9hHQptwzcpIotUu2fe3VJhdwcXUK6JHars=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LzMXTUJTEcyS9dO3G5P4uKCvhIUlEB7k7+lf57KiYm7CLkkfd4mGIZhKP02SFvYfTzdjrr6HtxFZgOmJJP8956zkANP/Sd2IsB04q3cMDg2cmmQv+cyxecZ/frGAT/IIRG9gG4i0OUVFRBa3y7QcpJBcdQU0bsdIZ8f5d/+o/Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sj44bo2g; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sj44bo2g"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3594620fe97so8666212a91.1
        for <linux-next@vger.kernel.org>; Thu, 12 Mar 2026 10:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773338290; x=1773943090; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ur68GM2gu0Ysupw+pxq7u5spvFzrAWPlYnzgSbWi1PA=;
        b=Sj44bo2g0I9jBWRijdUIVzdsNWP1nzG1hYSdVGvw8uvGSA5ujW/MCLyQuYloqaiUaP
         iPFl8dpnIbQ30LgzOILN7vIwmmG4Z3nD0vSXzT9Q9MeXtLZK/KgwKOyN46dSTdjzUoek
         hP1ER4xoeySM07qXFVzyxLgbHNqxpjG5usJlyFusgz8DCLpsh76s1MlzPnqInBNd15fO
         6adZudC/277nbgY8tt3bbKxYlSGmLZbYu8c60325RhtyZxnpOxeNKDNu7ZrPzbHoH4xj
         zl++HcsFfcKlJjIFO59VKdHmgR2Z1gfWYNnRNfvrkhd2GqWtbl4EYFykVgkC9EqDYSID
         raOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773338290; x=1773943090;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ur68GM2gu0Ysupw+pxq7u5spvFzrAWPlYnzgSbWi1PA=;
        b=P2sr6n5XCZ2U3McyF/3jNTE8KYwDBkwNje1J/4pKeUWdYouiHAyO9y44oSjiB+oxo6
         bK3Ravdaw6srj1UBri9UA0dvUoaknUD3UOhywT2eQk8h0tOcRJCLP7ImEikg4LS9AcxV
         kQ93crt5DCBYWbjV8pGGVmWF6LC20m4ReGNxfGRrV76yjW5bszBTV3rka6MZoQltKH2g
         9m8fLEYfEQ6xtdXuJCTrHXGH7mYiSxE6q8tI7tOHGitRbpZymsJ14y8C5+3i3nk7sSfZ
         yk4CKhleWU2zwyJGQUzlKlLUBdicidZS0kA7N/aXvptdzynlI50zCbz+ep4HP2f48ESP
         GynA==
X-Forwarded-Encrypted: i=1; AJvYcCVRKnDxSJIKhomqplxx8eVhfkJWhEf1zAmYW1xwWLmxtPx6pzODj/YTOt5BRCfZpSlEOKG6mCWCM1cM@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNHB0qnYyOXG8vdHBhy9N+hPvKhV0OKU05Bod54dZM1TIhC3O
	IRvhLn1hKjn0PPiGdZ1e0gS8hDlE+qVhTc5Hc0T1Q8pB3KthHVZLC9lheLH43Leh3ypIP1fXnCK
	h889UZA==
X-Received: from pgac26.prod.google.com ([2002:a05:6a02:295a:b0:bd9:a349:949c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:da0d:b0:398:90e5:a9b9
 with SMTP id adf61e73a8af0-398ecac6150mr169948637.27.1773338289724; Thu, 12
 Mar 2026 10:58:09 -0700 (PDT)
Date: Thu, 12 Mar 2026 10:58:08 -0700
In-Reply-To: <a48b3130-54d6-4cf4-a059-e576f163ebcd@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <abL2MPhXKOn_Zdz9@sirena.org.uk> <a48b3130-54d6-4cf4-a059-e576f163ebcd@redhat.com>
Message-ID: <abL-sO9M_TaXYZUp@google.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the kvm-fixes tree
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Mar 12, 2026, Paolo Bonzini wrote:
> On 3/12/26 18:21, Mark Brown wrote:
> > diff --cc arch/x86/kvm/svm/svm.c
> > index e6477affac9a0,3407deac90bd6..0000000000000
> > --- a/arch/x86/kvm/svm/svm.c
> > +++ b/arch/x86/kvm/svm/svm.c
> > @@@ -4880,15 -5030,11 +5030,11 @@@ static int svm_leave_smm(struct kvm_vcp
> >    	vmcb12 = map.hva;
> >    	nested_copy_vmcb_control_to_cache(svm, &vmcb12->control);
> >    	nested_copy_vmcb_save_to_cache(svm, &vmcb12->save);
> >   -	ret = enter_svm_guest_mode(vcpu, smram64->svm_guest_vmcb_gpa, false);
> > - 	if (nested_svm_check_cached_vmcb12(vcpu) < 0)
> > - 		goto unmap_save;
> 
> The right resolution is to keep these two lines...
> 
> > -
> > - 	if (enter_svm_guest_mode(vcpu, smram64->svm_guest_vmcb_gpa,
> > - 				 vmcb12, false) != 0)
> >   -	if (ret)
> > ++	if (enter_svm_guest_mode(vcpu, smram64->svm_guest_vmcb_gpa, false) != 0)
> 
> ... while of course this part is okay.

I'm in the process of redoing kvm-x86/next on top of kvm/next, so I'll sort this
out on my end (and double check that I come up with the same resolution as Paolo).
