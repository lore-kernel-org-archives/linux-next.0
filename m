Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9173C344F;
	Fri, 13 Mar 2026 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417821; cv=none; b=RvCq/jpzT2pGFkLJlK1WGbV3/QAVJlrqnj1r8Qfe9AgdJrwlyxZ3cj1+a6zu7LNodnP5G9Q1pNJuj/IZYkR67jDndJXDN+4ByLlNnon2KbjYNwee7sgjUarGU+7zzCCOxpq70WRXTMmrN/aqJ0ldwbrPet7hzBBFWsTDiJ+KvRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417821; c=relaxed/simple;
	bh=rve1I9mVrv2LxFqTAcA4LMDtykZk+QZespY3reHTHfc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rbJ1wIds+OTzbtbZFRrrrKfs6aumFOrnEkjR+ganjAqnhFBTCmvOOxRL2/Pvtb6Lo3gV4oYMxNdYCKc0UU53jSpzxnui5xiYn58lOEJC9b15TULwg8c0DF86kqm0jJk/pd+o7JWnLdFqhxDF8C3DeUGLcYJyU+TdAhm6WUT/FHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QOtzNveZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QOtzNveZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2FCC19421;
	Fri, 13 Mar 2026 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773417821;
	bh=rve1I9mVrv2LxFqTAcA4LMDtykZk+QZespY3reHTHfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QOtzNveZfyUGRc956UN/bU6HCg7pjUs6nHpN/FhHFpeQg7RCiS9B+iDeE4GETX094
	 9E6nB722WxlP1w8GHuMoKT002jR4Ajs2y42aUERl9V4lZ3dWYdU9viXp4+6I13jMR9
	 8HpeeAbopfaARcCY5wF/CwYjKoUm/0HhkaUmhnd8=
Date: Fri, 13 Mar 2026 09:03:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Ran Xiaokai <ran.xiaokai@zte.com.cn>,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Fixes tags could use some work in the mm-unstable tree
Message-Id: <20260313090340.2c5654c8d42dbeae576ed5fa@linux-foundation.org>
In-Reply-To: <abQuBNBoT_AIfUV7@kernel.org>
References: <bd8f5814-c5c3-4090-bbc5-9005e2052d9a@sirena.org.uk>
	<abQuBNBoT_AIfUV7@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Mar 2026 17:32:20 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> Hi Mark,
> 
> On Fri, Mar 13, 2026 at 12:11:45PM +0000, Mark Brown wrote:
> > In commit
> > 
> >   5bea10633ca8b ("kho: fix child node parsing for debugfs in/sub_fdts")
> > 
> > Fixes tag
> > 
> >   Fixes: "kho: adopt radix tree for preserved memory tracking"
> > 
> > has these problem(s):
> > 
> >   - No SHA1 recognised
> 
> Right, sha's in mm-unstable are, well, unstable :(
> 
> Maybe Andrew's tooling updates those when the patches move to mm-stable...

I simply remove the hash, but that gets us emails from Mark.

I actually track the same info in the filename -
kho-adopt-radix-tree-for-preserved-memory-tracking-fix.patch fixes
kho-adopt-radix-tree-for-preserved-memory-tracking.patch, so I guess
it's best for me to just remove the Fixes: line.
