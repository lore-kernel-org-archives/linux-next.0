Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50AC1D89EF;
	Sat,  1 Aug 2026 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785588089; cv=none; b=KYcZoUcPGFgKbuCgfDim3CBqg+IFd6wKvTSa9WqSPKk6ZB/ijbL+MJCsOoODWD66th3FgFqCZThg8x3vWL73chQB72mNvUEdBlNXHhofCU7ZCV0yFT9ZAgKK4QKtc/UurfeiXlLD4mPxuKMUFcldu0wI3VUcUVsDDCJicawsLFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785588089; c=relaxed/simple;
	bh=lfb9lEX2BUVniNjhObiEvb3SHUwijKCR4K5QqS4nOts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryBqNsXvuQmEjNu3iJzyZ13MyHoQ66Dydk29q0Cgec52FJlPvJzyeqqWtGEUnR/IDTGAMK7J3I+qvpv2Cgxgg3Zr97kgE2jwDBorP7X3X7+iiOqYJqMkr1lH65S8S8dY7xQ56PCNWvYYGrTtAVEPxu1SOCUoYQn05qbRY7/by+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9ssLiBX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9ssLiBX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5601F00AC4;
	Sat,  1 Aug 2026 12:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785588088;
	bh=4AFzhrH+CN+tOi/EiGdGef6iiQWvGQY42BhzvNczVcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a9ssLiBX//uwTFUx9SeXnzbOEK5tAqQfL06uYPCSxR4XpzrX5ltN1gKH/vwvDVa+a
	 ZcgG8YdLjHjtL96vRStkjEGkNtKSpGgXDwUk0r5hsduLVDyO2bOp0O6vCWbRBF+h47
	 mvF7vQhjM7g4eWaTNUyBZDnXkYpAfSc+amG3ktq8YIoOMaIed3EzkmYfcNg8ieQNDI
	 16XTviTtx8Ji0VDqfhFqU9Apa0ePFdEDzOzxRHIYGmNDn/lfA+IduDA3t3qGesnzd8
	 fk8BabYC/6vNv4xpgHJKFOeDuHKbaRMwbDVVHOoltl278o81qzTm2QJvSJdJiV7wTb
	 pRvQoYyX5VI/Q==
Date: Sat, 1 Aug 2026 12:41:26 +0000
From: Harry Yoo <harry@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Vlastimil Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
Message-ID: <am3pO11Yshf_bgp-@dev>
References: <amth-CMf3Xz5hR32@sirena.org.uk>
 <cdc6cf4f-57b2-475d-b9d3-23c4693ed871@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdc6cf4f-57b2-475d-b9d3-23c4693ed871@paulmck-laptop>

On Thu, Jul 30, 2026 at 10:31:53AM -0700, Paul E. McKenney wrote:
> On Thu, Jul 30, 2026 at 03:38:48PM +0100, Mark Brown wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the slab tree got a conflict in:
> > 
> >   mm/slab_common.c
> > 
> > between commit:
> > 
> >   736084507faa3 ("rcu: Rename struct rcu_gp_oldstate to rcu_gp_seq")
> > 
> > from the rcu tree and commit:
> > 
> >   bdd0cc9f0ffc3 ("mm/slab: introduce struct kvfree_rcu_head for kvfree_rcu batching")
> > 
> > from the slab tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> This resolution looks good to me, thank you!
> 
> 							Thanx, Paul
> 

Looks good to me too, thanks!

-- 
Cheers,
Harry / Hyeonggon
