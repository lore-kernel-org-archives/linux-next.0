Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDF238BF9F
	for <linux-next@vger.kernel.org>; Fri,  6 Mar 2026 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807919; cv=none; b=jBkXwKvCjQVr595Pi51eL9bCSWbDnkbtXkm52Ghp0a0a09aekgUABR+4KMzyBEKlnWO2onJwxx279lKhsIjhTrS7lgsS95WSU0Tl3M1v9WMZEP7dxS+Ye4pGP97JDFMqkvW3qen+GiybOhwtnYBqMtOXJNsSlKAHe3zI6jj3ffw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807919; c=relaxed/simple;
	bh=q1mdQxP70RrQv0FYyXGyehwbnlfa4Xr6GVJQJYVFteM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t5vaCW300FLWTf26thrFUK9DR195RdD7mwWWmjtillQUZSRNvQVW2rJUJGoyste0GCl1kvscuTO9xa9c57oSx/iuiPDNvtl8bv/oCuoAiMpC5mdYyMpL5sjXQDSlIBDAPjk8rd551FS9Jt0k60uv1WpxjCfNuJkd8vdGadNYj/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XJ0+eZA3; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XJ0+eZA3"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-661420734b7so3110442a12.1
        for <linux-next@vger.kernel.org>; Fri, 06 Mar 2026 06:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807916; x=1773412716; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KbSWWVhxILTIKnFJVXIh92bVPsvqoeNRzf6Hu2YgsRw=;
        b=XJ0+eZA3bj5Iy8NBPSOiAY9w2Q61/+6AHuOEggYR8x7RNXg04gEfLnU25CxdvfMghD
         ab9Ai4H6ifcIZ0zwo/HG9RD/EOFzstZfmdcr+60zPhTSGA6hUSip/SYoKSBllKt/RUSx
         QzjujN+NN88/n5cOL1LbJM2MWuNB3RQAwRViXhRqjLGT2pV0FPXdE1nL+0HENJNLqRGC
         UpX74ekiIOwnv7uIi1Z7EVcWDPr5/51wYAxctjKa0vN/Yl+pmYGJoBHV+SuyHRrIolm6
         XCnjWO2VEizeNfDuHHr9pX2RFt864kyKDZDkiF/rfwfbBiNwC9UWu5AcMjRSiHty/QH1
         ie+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807916; x=1773412716;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbSWWVhxILTIKnFJVXIh92bVPsvqoeNRzf6Hu2YgsRw=;
        b=AZqWtmzrZ1Ik+hnRr81VfschveGjkdny159FhxtowE7mFsy9UIyK0TAbpoMUEYmxww
         FnWIDUIzJymHYGd3NHJyIp97wvQmXDID00Z8xf1RZKdPXKT00838UzBU/qAyYFZMPCbC
         eVc0SDtFICz+XX0o2hL6eD4Jexm3JTi/+GL2J32vnN5x9rKPQTP01MIJ+IpAS92axiQ3
         tANZXbUa2hOI2ELjhQSzBVnK22UYimvt/HmNp8CcyawO/d6BYyWqcSnKTYrGCgyhRBUu
         wi47DJpqWTNBuSYzKP83Cf3+Arx8l1VKOYlOhmPXR/sVHED0KxC1pyQfDpyCim0SvSPP
         Pp4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBB4/v/fxICTBNiumxtRpqHLf85k48RIAJd7DyTVXLsoCISfIbNZkC61AnKCVXnehHmoc8LrlK7mXG@vger.kernel.org
X-Gm-Message-State: AOJu0Yygux/1xZCvjFIfpsThXK1Zw8aCOVHasSXWq1KZ0OpidvFUKeoy
	2p3Kv+v0F6rcKqVK3CVUm+PvhzGBrtfbbVquQKbcTriY684Plh8mDjYeZEoqP0MIhBKO2yNUPij
	fnFLSq4kq/u6ArWYnIQ==
X-Received: from ejdbv13.prod.google.com ([2002:a17:907:fd0d:b0:b93:391a:d36c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d10:b0:b8f:8660:3caf with SMTP id a640c23a62f3a-b942da2ac30mr135285766b.5.1772807915784;
 Fri, 06 Mar 2026 06:38:35 -0800 (PST)
Date: Fri, 6 Mar 2026 14:38:34 +0000
In-Reply-To: <aarPg_AVR3TN9frW@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aarPg_AVR3TN9frW@sirena.org.uk>
Message-ID: <aarm6urW8_v25Nj3@google.com>
Subject: Re: linux-next: manual merge of the mm-unstable tree with the
 char-misc.current tree
From: Alice Ryhl <aliceryhl@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, Mar 06, 2026 at 12:58:43PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the mm-unstable tree got a conflict in:
> 
>   drivers/android/binder/page_range.rs
> 
> between commit:
> 
>   8ef2c15aeae07 ("rust_binder: check ownership before using vma")
> 
> from the char-misc.current tree and commit:
> 
>   3c9b6aa5c9119 ("mm: rename zap_page_range_single() to zap_vma_range()")
> 
> from the mm-unstable tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/android/binder/page_range.rs
> index 9dfc154e5dd4e,2fddd4ed8d4c4..0000000000000
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@@ -759,11 -717,9 +759,11 @@@ unsafe extern "C" fn rust_shrink_free_p
>       // SAFETY: The lru lock is locked when this method is called.
>       unsafe { bindings::spin_unlock(&raw mut (*lru).lock) };
>   
>  -    if let Some(vma) = mmap_read.vma_lookup(vma_addr) {
>  -        let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
>  -        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
>  +    if let Some(unchecked_vma) = mmap_read.vma_lookup(vma_addr) {
>  +        if let Some(vma) = check_vma(unchecked_vma, range_ptr) {
>  +            let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
> -             vma.zap_page_range_single(user_page_addr, PAGE_SIZE);
> ++            vma.zap_vma_range(user_page_addr, PAGE_SIZE);
>  +        }
>       }

LGTM thanks!
