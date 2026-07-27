Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CB940D588;
	Mon, 27 Jul 2026 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157770; cv=none; b=E4IgWjZwn9cEjLmdt5fGQ5/lFtr531etMkFdAhCfGW4/MuvCTZLyJy65sFwNZxYGTLXjHxG2oRWviuAJ5WWoy7J/ck+MmWgS49upVpdUeqckxBJH10gnAULj0yIhCjPs7kR2WhJrhJ53GG1XBKFGTX6NvHKzWJHl5mYRpy9xNQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157770; c=relaxed/simple;
	bh=+BKMIr+Ot1NucHzCiSGNNmuatm/wNzLbvaTrpFipDRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmcqsXDF0pB4j31LHV/rmDfACxh+bCbovuXLXii+vd+4QFtOwDQc2xBZ+GwpEDCdCXR/0y/a7ObqjCVPG6VttgAYIS10wTgPwim5XwVdVhH2+VHyRzHsCtzBumxxnfyaJd/DaM2u86BB9IGYT0HvyjA/EhdXzvMk+1nrAb5/tXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwWYT2v+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwWYT2v+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14A81F000E9;
	Mon, 27 Jul 2026 13:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785157769;
	bh=Btkvv9pvA+9xpQMrSppDOcC/ioqv0Iea4bixa/SwP+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kwWYT2v+j7tbLMDqIrK/BI1Cj0qzZ0k+6cfF/K6CS0O9QvJ2EaxEv6w+UBrQSfE+l
	 jZkvkcTF2lA9YB/7JW+iTJsUuVHKFWFV3L4syZzY8ccWicO6D9koXk2yqkW1DYFuaT
	 Efx27jNegKLmLKsg1aKdUroyKZvMUaOlvn3NjkyYK08NHluFa/Zo84b7DvJbZ2riYL
	 uIgwgLHqyDXA6mnrslJK04dk2eeotLEEEA7M2ZbA8ErpqNVnCQWr3Ut9p0cEB+B4qB
	 JmuEY3aCzkGevOr7TCSBNcxnGjff+v26GYXXV6/CMiac5Zf4HM/icsxymutEMYbQgd
	 7B7meTRYOEexQ==
Date: Mon, 27 Jul 2026 16:09:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the
 mm-hotfixes-unstable tree
Message-ID: <amdYgmAmU4bVDd1X@kernel.org>
References: <amZ9QR_9NYqq6JMy@sirena.org.uk>
 <ambxL-NxiYZ3vmpu@kernel.org>
 <76ef8225-1d4a-49e4-a3b9-5e341ec6a057@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76ef8225-1d4a-49e4-a3b9-5e341ec6a057@sirena.org.uk>

On Mon, Jul 27, 2026 at 12:38:58PM +0100, Mark Brown wrote:
> On Mon, Jul 27, 2026 at 08:48:31AM +0300, Mike Rapoport wrote:
> > On Sun, Jul 26, 2026 at 10:33:53PM +0100, Mark Brown wrote:
> 
> > > from the mm-hotfixes-unstable tree and commit:
> 
> > >   5fce67641a3ed ("x86/mm/pat: Don't gate cpa_lock on debug_pagealloc_enabled()")
> 
> > > from the tip tree.
> 
> > > - 	if (!debug_pagealloc_enabled())
> > > - 		spin_unlock(&cpa_lock);
> > > + 	spin_unlock(&cpa_lock);
> > 
> > This should be
> 
> >  	if (!debug_pagealloc_enabled())
> >  		spin_unlock(&cpa_lock);
> 
> So essentially dropping the changes from the above commit from the tip
> tree? 

It's a bit more messy, but essentially yes :)

> Should that commit be there?

There is another commit Lorenzo mentioned that depends on that.

And the patches I have mentioned in reply to Lorenzo should take care of
it.

-- 
Sincerely yours,
Mike.
