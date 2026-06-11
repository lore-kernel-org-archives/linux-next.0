Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1BD48B37F
	for <linux-next@vger.kernel.org>; Thu, 11 Jun 2026 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203163; cv=none; b=i+uxSCtwbk1N7QDICpOcy1a304nlg15ci2gKdjpRK1fktTH0ytxi/SoX4t3lwk2Z9u7CLPBIMC6B+xDejbMLwyygWSsdo+TD7f+k9GGE5pkL7GVquyPNQcwHKE45qMG0bN3Tpd7CJkUKEPtZ8RckCuNzZ7PkOzME76RiQX+zyio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203163; c=relaxed/simple;
	bh=SEblk0WX3ZYBWDX3iyLgIGZysHoKHDvlBsL4Agbkq0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esw6RRAI8jG26H9XgvcuA7hntidfahZD271exIEXXUs/Q8uf+9Ef1+AqeQBicI4yQbNZ4KxI3DHXVXYARPQcJQxINRHo/NrYixIuR04eqkcBYTF7Q+6uAiar+1NNZyMbcOX0o2iZPO0bcbfZMRkwZ8OcQpJt+HGWNjRYtLzondA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q/sSu8tK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q/sSu8tK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA211F000E9;
	Thu, 11 Jun 2026 18:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781203161;
	bh=kuvl22ccDDR3WLwN8wS5yLNk/u4YNQlgwdYa0KjatvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q/sSu8tKyUx1U1OBXiV+c2mkX2c0YdnvuxL/mXo7cw0lX/G18IDTUNIQcZsONH0hD
	 3q/k0dCKerZelVpa32ITEolMVKdVop5Y+0J7o7+h2HdDqG7UTlguSZWcLunent9QjS
	 8Jn+UAEPXPc6GKMHK8YPu6CFZHPJ3ZSBod7kwUYM=
Date: Thu, 11 Jun 2026 14:39:19 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, helpdesk@kernel.org
Subject: Re: linux-next: Tree for Jun 10
Message-ID: <20260611-invincible-whale-of-progress-69ffd1@meerkat>
References: <aimIc7ciEUrhXV23@sirena.co.uk>
 <608ff135-c113-4bda-9812-26ee8f8cdf7f@infradead.org>
 <ac803cb5-37c8-4e41-af3b-1c15955cb219@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac803cb5-37c8-4e41-af3b-1c15955cb219@infradead.org>

On Thu, Jun 11, 2026 at 11:24:50AM -0700, Randy Dunlap wrote:
> >> Changes since 20260609:
> > 
> >> ----------------------------------------------------------------------------
> >>
> >> I have created today's linux-next tree at
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >> (patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
> > 
> > linux-next-202606{09,10} are *not* available at www.kernel.org/pub/linux/kernel/next/.
> > The last one there is linux-next-20260608.
> 
> linux-next-20260611 is also not present.
> 

Not anything on our end, afaict -- the latest upload I see is from 20260608:

2026-06-01.17:27:56	3037912		write_allowed,/pub/linux/kernel/next/patch-v7.1-rc6-next-20260601.gz
2026-06-02.16:57:34	4107511		write_allowed,/pub/linux/kernel/next/patch-v7.1-rc6-next-20260602.gz
2026-06-03.19:14:59	1096610		write_allowed,/pub/linux/kernel/next/patch-v7.1-rc6-next-20260603.gz
2026-06-04.16:19:49	2121815		write_allowed,/pub/linux/kernel/next/patch-v7.1-rc6-next-20260604.gz
2026-06-05.13:36:22	3088815		write_allowed,/pub/linux/kernel/next/patch-v7.1-rc6-next-20260605.gz
2026-06-08.14:34:58	2243345		write_allowed,/pub/linux/kernel/next/patch-v7.1-rc7-next-20260608.gz

-K
