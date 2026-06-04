Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B7E2BD59C
	for <linux-next@vger.kernel.org>; Thu,  4 Jun 2026 23:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780614355; cv=none; b=DS9WguapTY0lqzajOGG+xM4VSi0rLd6+I/VMr3b8lPbkCWfhlYu51KwsNMx17l1uk5J1oM17bWMlo5c90uAT79HTqwOLl+Cq7/aavh9tAaAsinmHeOkb+VGs8z306i60ed98wOg6hafAOkW+CdmRQV+UzI9yqAMJQYShjviSmJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780614355; c=relaxed/simple;
	bh=uIdtElV5SmbLZmHJPDJ7rmkCzj1v2CSVYgeVAWNCkPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmxtaWTYcZpwlaDdzW3GAgH+9VCjb4cetlDTYJLYB1TB47DNnqLdPy++mzxXMqedHiM4RsHmJo6Z7XWpemt8R+kSCQAeIPbUKhw+0VGFU2H35yb/ZCOwc2o8uuXJ9gfW+YpB2b9T4gsAJXirzw+tMESWSuA1xSK5b6ADLxB6ZZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IyxmXxsa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K53kFt+4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IyxmXxsa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K53kFt+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780614352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3xuVttDa/ePoOCg+osbAeIVl7fadBj8JC1EuaI1kX+U=;
	b=IyxmXxsa7Jdjn3sQdugc7hkEMddhWf7dLAxYTusniMaDF9RmEm2F/gNuQnl52V1g0XCzvr
	+nibOhu8DRaYCm+F1yWKMrhowoygYiNCpy9DzJwR05RlO4Ij9/IwVuDlciti06ck30Rr2V
	VGFTPaPMqLm9cQ/BI+b6QvwmkU0Q6LE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-uYW8NNQQOjmY63YQYFtGtg-1; Thu, 04 Jun 2026 19:05:51 -0400
X-MC-Unique: uYW8NNQQOjmY63YQYFtGtg-1
X-Mimecast-MFC-AGG-ID: uYW8NNQQOjmY63YQYFtGtg_1780614350
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4601102c30dso740696f8f.2
        for <linux-next@vger.kernel.org>; Thu, 04 Jun 2026 16:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780614350; x=1781219150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3xuVttDa/ePoOCg+osbAeIVl7fadBj8JC1EuaI1kX+U=;
        b=K53kFt+4h4A4FtQRwlawSEszbbSi75/x7aS5TcZRsP4hnWI4RxnRaY8LWsR9NF1XRj
         Z4nbrJ6vSt5Qex43MMrRztq4d8fKJVqHQ9SVh9CdPySzieFVnPqtRwUwPuf95oek2Azv
         EG6n5Phphl58ewXXat8HeDNETjNaJvnskClRgTNUsKgAof5z1kjC8gzUUSHVVMdORKfV
         NDU6u5CGJkOoQHY7mm42c8zTzyH+ktPzgc+EsXhYlPCO56WPJi6Ifz1Of3Jh4Oovb6FO
         7DxjmlJ4WvCjEP7pq52WpMYvlk/vj13pfLyTPNg9vLNoebRvQ8pld4XDt/XTeLL1Sd2Q
         +geQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780614350; x=1781219150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xuVttDa/ePoOCg+osbAeIVl7fadBj8JC1EuaI1kX+U=;
        b=CL3EiQbrAiT+1QUUh+5Ipmh/4y3CtU/9YVoiANmgSJgVJgniUnpdx+pHvKMZPdnpLP
         4z2Vzc+hIUtxbv+/wN1QsjslZg4swV7EiR6PJnCNmurmBJd05zan6Do/3YP1fwOyViRt
         O9wOUZZVa7m9WgbHvYNLePv++mFQnqJk1MJK3kRMKCEOjA3nYtIgZgg4Jj5is4d2CABV
         DMHNXLRfC0qjL6BIqycA3LWwt8iirD62O8ZGbisbpTtUTRp6eKT/pmbgeCPGhCBfFugJ
         4Tc5QSOzxOiTbKwsyFid+/oiO8knToRXaCVpaPmZS7o9Jk4DlFx5EFsuTlF+9k1sy6Zn
         dLXA==
X-Forwarded-Encrypted: i=1; AFNElJ9y1/a5StOSCDaa/Z7VZjysOXzjYx+hZQHISVRPnoe4/8jZe+sCfDbTjNF7fV+6TLXCDOhpMVTHqjcZ@vger.kernel.org
X-Gm-Message-State: AOJu0YynhfAqnOUR+KBn7oUn3K/Zzmfs1k0tANSxFZ97yqikgvohNooQ
	DbRGcVbyDlX3aNOEAEUVzrPGX7mJiNj5SWgiM1qBUH65ZwK2HwwmmFeuWWlG5vnYfCmaW6AC0HR
	cp/e6ujFWDLsMm6Acn+Da7zDkMypOF35DQK3xaAMgxLS6nrCMtrC9/gXxG7mkvP0=
X-Gm-Gg: Acq92OF+u0S+0lUHvnl2UhIMZ4B8fXIunbolECGNVIOi9XDnQ8mINIR3thishzz3ePC
	kISWQbs/y9wYXovzr+ws3KxOmAxYTc9JCAlO336SllQ+NcvQ7hYXi8gh4kK9TMoUkY3vqPyNNIN
	W+mZLrNV5jaAEWZEys6neyPuQ74mSAlVQr48NdMOrGbiZgfudx7HIOX5xglvnMp1aBCBDCdz6Sz
	5qXtlSi2j5ZBPlisY7YW0uCA+TX080dCvhGu2yMMew+bey4Lx9UKjlP2F1L+GmzAadybhKop93M
	pRgFXJBvitwU/PlKKTNDKolZbpPjPzZfna2rajdmNR634AkhHaQI78Sr0tx+si01eemty9o9Ykn
	tY6+LC5b9BZIWunS0A4tKGnAPC/vJtlfezTmaeaJzMsO0MyTaf8zBj1Q=
X-Received: by 2002:a05:600c:4708:b0:490:bde3:d112 with SMTP id 5b1f17b1804b1-490c26038e1mr8614355e9.30.1780614349938;
        Thu, 04 Jun 2026 16:05:49 -0700 (PDT)
X-Received: by 2002:a05:600c:4708:b0:490:bde3:d112 with SMTP id 5b1f17b1804b1-490c26038e1mr8614035e9.30.1780614349509;
        Thu, 04 Jun 2026 16:05:49 -0700 (PDT)
Received: from redhat.com (ppp-94-66-118-61.home.otenet.gr. [94.66.118.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fd33sm22019539f8f.35.2026.06.04.16.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 16:05:48 -0700 (PDT)
Date: Thu, 4 Jun 2026 19:05:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>, david@kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: BUG: mm: VM_BUG_ON_PAGE in post_alloc_hook() via
 __ClearPagePrezeroed() on compound pages
Message-ID: <20260604190521-mutt-send-email-mst@kernel.org>
References: <aiFZeSKzb4HLfjFm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiFZeSKzb4HLfjFm@gmail.com>

On Thu, Jun 04, 2026 at 03:59:06AM -0700, Breno Leitao wrote:
> Hi Michael,
> 
> Booting next-20260603 (a225caacc365) on arm64 with CONFIG_DEBUG_VM=y
> panics in start_kernel() during kmem_cache_init():

it's my bad i pushed a wrong branch to next. Sorry.

>   page dumped because: VM_BUG_ON_PAGE(1 && PageCompound(page))
>   kernel BUG at ./include/linux/page-flags.h:682!
>   Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
>   CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.1.0-rc6-next-20260603
>   Hardware name: linux,dummy-virt (DT)
>   pc : post_alloc_hook+0x224/0x2b8
>   Call trace:
>    post_alloc_hook+0x224/0x2b8 (P)
>    get_page_from_freelist+0x18a4/0x1b18
>    __alloc_frozen_pages_noprof+0x1b0/0x2068
>    __alloc_pages_mpol+0x130/0x2d0
>    alloc_frozen_pages_noprof+0x64/0xe8
>    alloc_slab_page+0x88/0x140
>    new_slab+0x11c/0x680
>    ___slab_alloc+0x18c/0x7f0
>    __kmalloc_noprof+0x534/0x938
>    do_kmem_cache_create+0x724/0x890
>    create_boot_cache+0xc8/0x148
>    create_kmalloc_cache+0x5c/0xc8
>    new_kmalloc_cache+0x274/0x438
>    create_kmalloc_caches+0x2c/0x88
>    kmem_cache_init+0x228/0x2e0
>    mm_core_init+0x74/0xa0
>    start_kernel+0x1cc/0x4d0
> 
> Bisected (by inspection) to:
> 
>   504f40f6bda6 ("mm: page_reporting: skip redundant zeroing of host-zeroed
>                  reported pages")
> 
> Reproducer:
>   - linux-next 20260603, arm64 defconfig + DEBUG_VM=y (any debug-heavy
>     config will do; mine also has PROVE_LOCKING/DEBUG_LOCK_ALLOC, but
>     those are not required to trip the BUG once an order>0 __GFP_COMP
>     allocation hits prep_new_page).
>   - Boot under qemu-system-aarch64 -M virt with earlycon enabled.
> 
> I've tested something like the following and  I was able to boot the host:
> 
>   --- a/include/linux/page-flags.h
>   +++ b/include/linux/page-flags.h
>   @@ -679,7 +679,7 @@ FOLIO_FLAG_FALSE(idle)
>     * PagePrezeroed() tracks pages known to be zero.  The allocator
>     * uses this to skip redundant zeroing in post_alloc_hook().
>     */
>   -__PAGEFLAG(Prezeroed, prezeroed, PF_NO_COMPOUND)
>   +__PAGEFLAG(Prezeroed, prezeroed, PF_ANY)
> 
> With that change the lockdep+DEBUG_VM kernel boots all the way through
> SMP init and hands off to PID 1 on arm64.
> 
> Happy to test a follow-up patch if you'd prefer a different shape.
> 
> Thanks,
> --breno

