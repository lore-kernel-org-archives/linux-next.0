Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B5C368D75;
	Fri,  5 Jun 2026 06:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780639394; cv=none; b=mxQwtTyBosinDTKMTidBbKlHVZ8JZxYDC2QQ+AHPqeqigp//HPLNMJStGHnGN46Tphvpi/pbDPoHNc5x9bm0wZquWxxufUMubLQtwgfdGNb6F1Yh+NPh5cOprVx3ci509CYgo2YOYV+4VCM7aesqpYbmSOyd7wABAA5TwJAep8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780639394; c=relaxed/simple;
	bh=17yvayCiyKZEl0J527Cq9XmyBEu1Tk3jXoqwO9FiG5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZhfGgokTva5zxg2WrqgeVy7j7oQmVk+KlQWF7IelK1ERCuypn1Y8sYo/foZxI6JfZU3/NALEd8LOwyLBMeDvvMMj5NAUS1zPGxVCgX2AyurQoE82ecetYn2ktuOLjZ3Ge68ss5hyA6gJFJIB+LJzPdNYr1sEnhW5rI7ySbmzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5uNzCaJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5uNzCaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182451F00893;
	Fri,  5 Jun 2026 06:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780639392;
	bh=BOJ4cyyhHDJVJfq4ruH8NdaGZ6OyMV+PbqSG2RBNB0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y5uNzCaJ87Pvppb5dI1wW5kymM88zEvjpiHF7aGJkxxfObq4KlwlzXSc960Z5RSWu
	 LdDWZX3hXp8mR9qRjmwecjNtMbSObuWk6xw4mJbgiscIaKgc3wZWGlr15J4ABi0f/f
	 Cy7V2hSKxdNdu3EiBOyxcWM8wQs45A66NzuteIfVWgY3470V40Hc4pxgcenC07nmJp
	 uIE5D3e55oXHd28zCmfJLhgdj8qUNKT1i1B/RKpXXGml7RuEMQAgrZmFd0qq8AuV4j
	 4tnDt/SwcVq1MmqWQ5AQJDK7ha7nsAS8zaHwyVCw8ONBH+f73UGbyILPH4IUQlfJy3
	 feYcmzDN4x2CQ==
Date: Thu, 4 Jun 2026 23:03:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	DRM XE List <intel-xe@lists.freedesktop.org>,
	Gustavo Sousa <gustavo.sousa@intel.com>,
	Violet Monti <violet.monti@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <20260605060308.GA249502@ax162>
References: <aiAz4DmtngY0r6Cx@sirena.org.uk>
 <bfb0dee8-b243-47ba-a89d-71472b0d51c5@sirena.org.uk>
 <f9094757b2aab617feb8fc3f8a66f46595e0ae27.camel@linux.intel.com>
 <551d384f-d151-4d1e-bcb8-a1cde0860a30@sirena.org.uk>
 <8c4d38f10b1941687314bc43cc4de40097b84b78.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c4d38f10b1941687314bc43cc4de40097b84b78.camel@linux.intel.com>

On Thu, Jun 04, 2026 at 07:23:40PM +0200, Thomas Hellström wrote:
> On Thu, 2026-06-04 at 15:50 +0100, Mark Brown wrote:
> > On Thu, Jun 04, 2026 at 04:43:17PM +0200, Thomas Hellström wrote:
> > > On Thu, 2026-06-04 at 15:35 +0100, Mark Brown wrote:
> > 
> > > > /tmp/next/build/include/linux/compiler.h:200:84: note: expanded
> > > > from
> > > > macro '__BUILD_BUG_ON_ZERO_MSG'
> > > >   200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...)
> > > > ((int)sizeof(struct {_Static_assert(!(e), msg);}))
> > 
> > > Funny, I see no build errors with drm-xe-next allmodconfig. What
> > > compiler is being used? Any sha1 of the drm-xe-next top commit
> > > you're
> > > testing?
> > 
> > This is after merging the tree into -next, that'd be on top of
> > 09b893db4d9e68c2679e76624d420f438f8d3e98 for today (not published
> > yet).
> > It's possible it's some interaction with other trees (like the main
> > drm
> > tree) and works as a standalone thing, it wasn't obviously that from
> > a
> > quick investigation.  The toolchain is gcc from Debian stable.
> 
> So I merged drm-xe-next into next-20260603, and no build errors neither
> with gcc nor clang.
> 
> AI says it's confident that the error report is from clang, based on
> -fmacro-backtrace-limit suggestion and the "2 errors generated."
> summary, and suggests this might be an older clang version limitation?

Yeah, this is certainly clang. The kernel test robot also reported this:

  https://lore.kernel.org/202606041255.dGo9lFkh-lkp@intel.com/

It looks like this was only fixed in clang-21 with:

  https://github.com/llvm/llvm-project/commit/977d8a4bcd83797217433709201922b9deb97ae2

according to my reverse bisect of clang. I am not really sure how to
work around this at the moment, trying to read the preprocessed source
is nearly impossible because of what REG_FIELD_PREP() expands to.

-- 
Cheers,
Nathan
