Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4A927732;
	Mon, 27 Jul 2026 05:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785130509; cv=none; b=dddHSj/5fcvskj5RHjxavvmLPI1LSAfneSPqXbKJ37m+lWAuMQwMvr4zWWn6v9KRkjXSg/e7q+s//KBN931/QPeODcF5csLE1MZ7WaMXF2xM91q4MkYmnrtGznYOk97nG0QXO00AY5SdGBQ8pziBmT9VVg/02M++t41L0UyNGH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785130509; c=relaxed/simple;
	bh=vAjfLD6Ybnhd2sI/z6gLZCpD7PB2l56huqo7CUC2e7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwvWGsV1IntzqHybKrYzYsgGU5K/rzTmWMvnhv3qVIq6vlXZtBD7/cGoQ0A9A7fHAIhttifUrRaO1WqhIKvEDhCiLZKFbtruAORmuc5cDjfThp/Vs1kI6O98kI+LxRGbvGgpcq6sYKQspBYS12Y+ZIxFlxRILaWTagTPPlTFMus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8OVm30Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8OVm30Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BBD1F000E9;
	Mon, 27 Jul 2026 05:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785130508;
	bh=OQcqVRuWQBgDF8VTWpuzvX973vjQNRbdJUsjchNiTAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h8OVm30QQew5hsLr6bDHqnad69sC+DmJ4RqZTqhhUbvvYqtwTJTCDA0ywdePvD9Or
	 6K5kmdcP59+ZVegnQH9B4JgMMwaDUT173HYQkawxv8T4XqrNNlklrUe8OOKzO42ZEr
	 MDrmjc8qYYmxvJDuI9YpgtJqOFt/mJ5rSq5ZjuipyiW2ZASgZ8P5+MevFSitJxDyAR
	 9YlQCs2LiGOJ8shlywDhzlIlmhq4PBEaKUnQz8AVkGRY/0Jca4BBXjudVwGStPdvoF
	 vBqy4MVGMsuViFgAy+CrXWMOmWri7nxERwUNEUzfsvwDcKF1WlHLzw5ACuLVnun1Hu
	 Pjs1qW8yDhDKg==
Date: Mon, 27 Jul 2026 08:35:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the liveupdate tree
Message-ID: <ambuBu0FrXL5eBJ7@kernel.org>
References: <amZ9TMnWRcvjlsOH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amZ9TMnWRcvjlsOH@sirena.org.uk>

On Sun, Jul 26, 2026 at 10:34:04PM +0100, Mark Brown wrote:
> Hi all,
> 
> The following commit is also in the liveupdate-fixes tree as a different
> commit (but the same patch):
> 
>   05cf3d87a0bf2 ("liveupdate: reject nonzero reserved value for SESSION_FINISH")
>   36882f3392395 ("liveupdate: Reference count outgoing FLB data")
>   5c4a03afcb217 ("liveupdate: Remember FLB retrieve() status")
>   797fe91e50d69 ("kho: align kho_scratch to MAX_ORDER_NR_PAGES pages")

Argh, looks like I forgot to push fixes after trailers update :/ 

-- 
Sincerely yours,
Mike.
