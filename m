Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16544360EC3;
	Wed, 15 Jul 2026 16:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132433; cv=none; b=ZFdjADQS++zHhk5L483M5TD/qZTXFW4qaKfvK731DrZ8Z3xiizeEw3jo8MIOvpjaQjOy7i+PEFUD7xLPny16vfS2UB1tWmvmVodBoh0tdLFBmAyiTCBEas/oVIZrvsCdSfVNjuxG4axOOxbKQf3PbF2mDpo7T2aiOCi6gS4m8g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132433; c=relaxed/simple;
	bh=6lYpPgXIgtazrOYrxbcONqJbYnTQK42lKnO8sbhSDEY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=RYm3IHCJ80O4JP4T2qDYoGgFH0MrZMeyAgHEYRPADE3TxxjENt6XAx4NdrpioNTHn4cXFizj5X2W/onIrbuIaDNMBV80pj7ZWrBkK98H7vh1XdRlkzviMeGvYw3RSPR+OoNQ4tnBeBFIn4OTtDKAr4l4MuG9ByboCCGY5lt4s+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NpfTI93W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NpfTI93W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9C61F000E9;
	Wed, 15 Jul 2026 16:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784132430;
	bh=orK6uCcHEYzTFJvmV0pE5uQTu24YKSY75eu5IZwODlQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NpfTI93WmeoTSPEmjfSfYPEZlq6zInSma5n+SYBZ+s5QziXXQn9viOtUKkWAw1vaZ
	 2ug5aWlYzYs3X8OOuroJ+jm9Lg4l08ALMVVhBiCaD52/kMq8YIjqj+h4CnU0+47XsU
	 EiJuOGAh/fAQKlLOnH8fgRjb4HQqv/nc8U6AmWjA=
Date: Wed, 15 Jul 2026 09:20:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Manuel Ebner <manuelebner@mailbox.org>,
 Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: linux-next: manual merge of the jc_docs tree with the
 mm-unstable tree
Message-Id: <20260715092029.18a9334f73e3b1517f3d47b3@linux-foundation.org>
In-Reply-To: <alep4zhJYFTXqBe9@sirena.org.uk>
References: <alep4zhJYFTXqBe9@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 16:40:19 +0100 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the jc_docs tree got a conflict in:
> 
>   Documentation/mm/hmm.rst
> 
> between commits:
> 
>   3862d3b51eb1f ("mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support")
>   94e4afa33bac3 ("mm-hmm-add-hmm_range_fault_unlocked_timeout-for-mmap-lock-drop-support-fix")
> 
> from the mm-unstable tree and commit:
> 
>   e834ee8e571d5 ("docs/mm: Fix braces")
> 
> from the jc_docs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

There was no "see below".

Jon, that little patch is being a problem.  Maybe drop it and I can fix
it up and carry it in mm.git?
