Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5852A45D1A8;
	Thu, 23 Jul 2026 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822663; cv=none; b=A27GPN7tSTOsKfNK/b4UMUz+UDIUB8HqhmLKDkU9MnkN8l/4IbSGepLFcDhd21D7M7QMwHdHbudy7LEkr7AOOM/nIa/cQYB38urpyOp/W6bT+/KouBs3uJyRIIGkLNVT9Up7ek9+2iYyY8vsG1bOyBS2e/+XQ4z9vakVwHaz50g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822663; c=relaxed/simple;
	bh=BGM27PaEiqxc0zZNcfkViSNImBu1f0k575Fi3TdmnG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyQpjepe4gco8BzoFnrhiJl6HrmnqH2yLQ8rA1TtCRga/xsxfG9Z/1oD72zOwzXDgz0r/DRGzIWMqkwStPqVExM+GjbcSWvLkPeCSc8iabdzr1fhn+F3l+Xa10NFHgQN62xsfdP0ppg+/H0dlCQc0xccV/onyvrUJWnuSZd5zbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042121F000E9;
	Thu, 23 Jul 2026 16:04:22 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 211EBCE0AD8; Thu, 23 Jul 2026 09:04:21 -0700 (PDT)
Date: Thu, 23 Jul 2026 09:04:21 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the paulmck tree
Message-ID: <3a5859d9-f020-4030-8d94-757e1fe60485@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <amInUXBCvCX4vXUh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amInUXBCvCX4vXUh@sirena.org.uk>

On Thu, Jul 23, 2026 at 03:38:09PM +0100, Mark Brown wrote:
> Hi all,
> 
> The following commit is also in the tip-fixes tree as a different commit
> (but the same patch):
> 
>   fbced06c64fd6 ("smp: Avoid invalid per-CPU CSD lookup with CSD lock debug")

And I have dropped this one as well, thank you!

							Thanx, Paul
