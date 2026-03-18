Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CEE1F192E;
	Wed, 18 Mar 2026 18:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773858002; cv=none; b=GSX/2IGjSNZxn2GU4gx8LYIgYvqc2+SNEsa5oOztJwTM5s36xmF8l5NdY1QlWK8RxUFUofHIOJ2mcOJu7sPDdg8UvMGONMMc+O6gKJf6+VqR4/nQUc8b0sKbllfAmW49gRq/4xyywL57wZCr8y8E0BZxOMrM3Sz4912dr9xJ48Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773858002; c=relaxed/simple;
	bh=nAfgr/dPQQiWm6fZTzBvAndw3PuCiaKqXHaMkQu5TJ4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KvGh5+CpTunTL94SrdIRlfV1XA7Lr7obvweDpI5T6/+PbMBnxVWpdGGXd8ExNBrtSskbsVVLSAySgBsaDuVkaaSB+d1GKzroU6oJETPIxy2sspRcXFtF6+av+90jzgh8CIezCij5+8qWJaEvBRRT9WclxshogiAnZ2qwAPp6bYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VIzZ1nW7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VIzZ1nW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EB7C2BC87;
	Wed, 18 Mar 2026 18:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773858001;
	bh=nAfgr/dPQQiWm6fZTzBvAndw3PuCiaKqXHaMkQu5TJ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VIzZ1nW7c9O8h/Be8mQPB/b3hyD4C1txhgSDjvF0jUTa3rfeY/ft53Dn2CvLQ+xHz
	 Z29VGwCQVB0+KAz5HfA1Xybe+n1MNKGeLPnkX5M1YgLuNtaxL1NQ+VHzr3JBzqMjPO
	 OLiikU8TfG/p5hf9TzBVRcvXIayA8i0cs5je30h8=
Date: Wed, 18 Mar 2026 11:20:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-unstable tree
Message-Id: <20260318112001.d67d0e84a4d69b991f0f97f4@linux-foundation.org>
In-Reply-To: <abqtxbX0eW1Ljdhx@sirena.org.uk>
References: <abqtxbX0eW1Ljdhx@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Mar 2026 13:51:01 +0000 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> After merging the mm-unstable tree, today's linux-next build
> (x86_64 allmodconfig rustfmtcheck) failed like this:
> 
> Diff in /tmp/next/build/drivers/android/binder/page_range.rs:762:
>      if let Some(unchecked_vma) = mmap_read.vma_lookup(vma_addr) {
>          if let Some(vma) = check_vma(unchecked_vma, range_ptr) {
>              let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
> -        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
> +            vma.zap_vma_range(user_page_addr, PAGE_SIZE);
>          }
>      }
>  
> Diff in /tmp/next/build/drivers/android/binder/page_range.rs:762:
>      if let Some(unchecked_vma) = mmap_read.vma_lookup(vma_addr) {
>          if let Some(vma) = check_vma(unchecked_vma, range_ptr) {
>              let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
> -        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
> +            vma.zap_vma_range(user_page_addr, PAGE_SIZE);
>          }
>      }
>  
> 
> Caused by commit
> 
>   320e410f0294b (mm: rename zap_page_range_single() to zap_vma_range())
> 
> I have used the tree from next-20260317 instead.

huh, is this python?

--- a/drivers/android/binder/page_range.rs~mm-rename-zap_page_range_single-to-zap_vma_range-fix
+++ a/drivers/android/binder/page_range.rs
@@ -762,7 +762,7 @@ unsafe extern "C" fn rust_shrink_free_pa
     if let Some(unchecked_vma) = mmap_read.vma_lookup(vma_addr) {
         if let Some(vma) = check_vma(unchecked_vma, range_ptr) {
             let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
-        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
+            vma.zap_vma_range(user_page_addr, PAGE_SIZE);
         }
     }
 
_

