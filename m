Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367B1360EC9;
	Fri, 31 Jul 2026 22:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535303; cv=none; b=rstKVVTCT8Bc6KZ4pAI0j3d278QtAnpPMis4HnT+rhUtch0FhzRNhxdg8cOz6RkBJhOwAPC46buHu732RSquA0Amx5+MdeaJSjMo1RDGG5NyAx4+afAaoNrT4RNV4FgGUKM/m9husuKUmKaYcz5aWTqbtuJ8KJVZCP3I9nqBrlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535303; c=relaxed/simple;
	bh=LhOoqKAPfXPUrAtyH+yAo4At2Fq3oa1ZI8V3lBJQMsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fg37MTLB+W57cRqzXymEAUH0D2kNrLGK0di5GsaBOzQpfjZU8UdOxxS9jGzS49fvdNsCgwqWZ6T38RowBXG8OB3i51zUrXH/w4KNv1KbXqVIcfv9tsi5PQg8zdhGC8A5oLkWvNriuOdAPA3Ppxiey3LClOIvrW7Nd3P87/zsxx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoiuNgDD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoiuNgDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6091F00AC4;
	Fri, 31 Jul 2026 22:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535302;
	bh=4o8TxBG5obnChHSkcPaoq8uOJ2IwxWlPUO/u7vUwbas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AoiuNgDDpud/0oYJT2xZ3awbdAun6VW4DcJggStow8xsz0esTw1NdvnUafdkhIqWI
	 mDzMtbmLIZFqf/WfhbQh9BVJnuFibUqiRKatxf1suQ2GCmwUL+5qPMn9ka03TQeCMn
	 daD6VsmJ9N8rYQdzQgRy1mmFI5W6NJ5CyfGppfWvghHMoprgCYnajy4/VR1URoxhBu
	 gkwoiGAGb0Sj4k2YOhgjOHzmQ63ONJRsDtoCPhDN1BNK9UIPpJtDsLVLxBzdiUlrtR
	 csBFhmpR20shYfkfqvyFZCuHEPxHPC1bqnc/Jatz/5vALEVWEgKm6ZGBKoxz7TwmQJ
	 7ZqTsFgT1T4qA==
Date: Fri, 31 Jul 2026 15:01:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	broonie@kernel.org, harry@kernel.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, paulmck@kernel.org, puranjay@kernel.org,
	vbabka@kernel.org, vbabka@suse.cz,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bert Karwatzki <spasswolf@web.de>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
Message-ID: <20260731220137.GA3307698@ax162>
References: <amth-CMf3Xz5hR32@sirena.org.uk>
 <20260731075644.20215-1-ojeda@kernel.org>
 <am0AjzHc0m03CLVa@tardis.local>
 <CAH5fLggke1Yvv8btJSMFr5tEquydvKev8_7G4gSO5MvoAJUE3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLggke1Yvv8btJSMFr5tEquydvKev8_7G4gSO5MvoAJUE3A@mail.gmail.com>

On Fri, Jul 31, 2026 at 11:14:42PM +0200, Alice Ryhl wrote:
> I like Nathan's fix as well.
> 
> Not sure if it needs to be done in the merge commit, or if we can
> apply it as a patch to char-misc despite the unknown CFG_*?

It would need to be applied at the merge of the two trees because
CONFIG_KVFREE_RCU_BATCHED was introduced back in 6.15 in commit
c9f8f1242a4c ("slab: don't batch kvfree_rcu() with SLUB_TINY").

-- 
Cheers,
Nathan
