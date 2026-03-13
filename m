Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D028823BCEE;
	Fri, 13 Mar 2026 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418659; cv=none; b=qVYG0KxccT8qogGOuG/OM0dgVuflBJo3jkW3fIfyYLS3VbaxXAb/k5JXNYyq4ZKmli/w7jl7znfCxBTFjL8Fz7KTCVq3s0ET45hWH/rdjwVAf90pc1Q/vjaJc2/x/YdiPO4mOpYKFhHZHzoNM30EerGRxpPvFpoOzP8fJunVQn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418659; c=relaxed/simple;
	bh=AalTvI4xA1KqPeamm06etxD435uO9yfHQwXYiBM1sX0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Y7A56e+crfUXiym0D+cg5jWEctXvJX5vfRrLJcuh6QLl5X3L2/JuOyZDHmuig3upXCbEJjkzQH60XaoeJoepIcC+pyjx4H90R8r5mPoOK60Sm4My8Qmu+NZ3kV+7YWbrC0orEiu3a265f9DsX/FCTD2rxaauoSmK05tyZug4i58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LXjic/MS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LXjic/MS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3808CC19421;
	Fri, 13 Mar 2026 16:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773418659;
	bh=AalTvI4xA1KqPeamm06etxD435uO9yfHQwXYiBM1sX0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LXjic/MSGZy6o0qjmT2iGdRd5/2Dsb8/LV+Xt3IdpSjsGSDJx9rgMoOyR2Py2vRtu
	 /KRT/wsQaRpO8lHqdb0B6gN1YN1TnwyWI0em9Dj/4T2rJCeoctA2leeYx7lFcdzmS7
	 950KCBWXGb967LL4wHvBW9sJgsnagGOLfXHXR2XY=
Date: Fri, 13 Mar 2026 09:17:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Ran Xiaokai <ran.xiaokai@zte.com.cn>,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Fixes tags could use some work in the mm-unstable tree
Message-Id: <20260313091738.354244f6fb500bef3bad1fa1@linux-foundation.org>
In-Reply-To: <202116fe-2cf1-4399-8324-a028efe27064@sirena.org.uk>
References: <bd8f5814-c5c3-4090-bbc5-9005e2052d9a@sirena.org.uk>
	<abQuBNBoT_AIfUV7@kernel.org>
	<20260313090340.2c5654c8d42dbeae576ed5fa@linux-foundation.org>
	<202116fe-2cf1-4399-8324-a028efe27064@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Mar 2026 16:08:19 +0000 Mark Brown <broonie@kernel.org> wrote:

> On Fri, Mar 13, 2026 at 09:03:40AM -0700, Andrew Morton wrote:
> > On Fri, 13 Mar 2026 17:32:20 +0200 Mike Rapoport <rppt@kernel.org> wrote:
> > > On Fri, Mar 13, 2026 at 12:11:45PM +0000, Mark Brown wrote:
> 
> > > >   - No SHA1 recognised
> 
> > > Right, sha's in mm-unstable are, well, unstable :(
> 
> > > Maybe Andrew's tooling updates those when the patches move to mm-stable...
> 
> > I simply remove the hash, but that gets us emails from Mark.
> 
> > I actually track the same info in the filename -
> > kho-adopt-radix-tree-for-preserved-memory-tracking-fix.patch fixes
> > kho-adopt-radix-tree-for-preserved-memory-tracking.patch, so I guess
> > it's best for me to just remove the Fixes: line.
> 
> I'm guessing that given that it's a fix for a commit in a rebased branch
> it'll get squashed down into the patch it was fixing anyway?

yup, the quilt-level foo-fix.patch gets folded into foo.patch before I
move the patch into non-rebasing git.
