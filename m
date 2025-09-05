Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE466285C91;
	Fri,  5 Sep 2025 08:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757060701; cv=none; b=MNy+V2ltXyj+gRJy0OrDjhgymiNftHji59cvOj7UKg4Bi10jqcYrzt5eKf/TKwBE9QihBvZVUkGReLdEmxpoov480wbYBm1fRnodBXjD0kSw4UTslGdptgczbuuMOOiSctFrCsoAEdi3KlIHqsLlTRCEc01ezw1YiylXctXKOgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757060701; c=relaxed/simple;
	bh=q9ttgqaWGISBiMRTDV9DrIBQ/InWL0qLpZcw8vTSW1M=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=C2cWbWt/dhW0uS2sexAiOH8MIeOfzeDDexeIfYbZ0/BNdPlmF6zOzlrAz4HXzg6/EUIEtZbJOHUO/3zr5E+es26ahKOwbyGO/O2VFhDMo0asfWBuL4bFbkNoOVJYUg8rU2cXjKbO+YY3PyXHqZsknesPD7MwNc6+qbOqMMeRhTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGWj7lGI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGWj7lGI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5152DC4CEF1;
	Fri,  5 Sep 2025 08:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757060700;
	bh=q9ttgqaWGISBiMRTDV9DrIBQ/InWL0qLpZcw8vTSW1M=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=SGWj7lGI2ZNTMunIbp/yhYc395RFvpIovomlH2DeOIo5UHnTIk7cy6zpZkKYyRGai
	 3xkKg2RHznfFs58fMMHSoQsVeBIS8kfjPmIfZj+mnnrsxdT/VG9zVVE5aIhttO7rKe
	 7WQQCGwJIEThI0p1DaPnANjxnhn44TbilIbjBpWOLjKljtCEC82aGmXn3NShkCbQNp
	 yyxscoWTIB2qrPvt/yYrYK8dJQUKWXi8fGQtbrzIHxs5pBd85KVZ8UbshDuKf09b3m
	 QHGB5h29zA8rEQTyJmm7T52LiitygogDF+sBt6KFiveyHQxZ6/sgN7wlb0f5yFYnzM
	 wiYVMOHDzw8GA==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Sep 2025 10:24:57 +0200
Message-Id: <DCKQ198SF1ND.11RHS48BPS4DX@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: linux-next: manual merge of the drm-rust tree with the
 mm-unstable tree
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>, "Vitaly Wool" <vitaly.wool@konsulko.se>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
References: <20250905124634.68da9a1e@canb.auug.org.au>
In-Reply-To: <20250905124634.68da9a1e@canb.auug.org.au>

On Fri Sep 5, 2025 at 4:46 AM CEST, Stephen Rothwell wrote:
> diff --cc rust/kernel/alloc/kbox.rs
> index 1fef9beb57c8,b69ff4a1d748..000000000000
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@@ -3,8 -3,8 +3,8 @@@
>   //! Implementation of [`Box`].
>  =20
>   #[allow(unused_imports)] // Used in doc comments.
> - use super::allocator::{KVmalloc, Kmalloc, Vmalloc};
> + use super::allocator::{KVmalloc, Kmalloc, Vmalloc, VmallocPageIter};
>  -use super::{AllocError, Allocator, Flags};
>  +use super::{AllocError, Allocator, Flags, NumaNode};
>   use core::alloc::Layout;
>   use core::borrow::{Borrow, BorrowMut};
>   use core::fmt;

Looks good, thanks!
