Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3799A2BF3DB;
	Fri, 23 Jan 2026 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769170860; cv=none; b=rf/MvBInovyMeyJyFs6bOReG9FomhVTXScOWfOFgK418xLdFHYziBmkr+yVuOy4P4cRsbAo6OJHN0gt7Uoz1lP1NSLh74kFs4WxFIFFTLG9gHIXI5eST9SoE91ayhTDVIsG5jiAuw9yW+zzQd+IKQWtY+kpxvhb0H4cZbdkSo2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769170860; c=relaxed/simple;
	bh=L481mRek9bTxPD4eI/zV9P7mvmuytcQj3dcrOpaexvM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ph9LKZflEf6fxc/+vzBX3u42LL8rpAAGkbDC2sWYIUOrIDTIpyN/xDVdiDUpvpFzEh0tc9oVJDyFK6EEz6QXIdZRkNvc0JowsBAl86PvbjtZfBvLeETPiSpO0LoH5vIBBhOcADVu2XWElmKC8cOBVwnsL5WukI3e3DJS2GKPrck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrMx8yxB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrMx8yxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489B3C4CEF1;
	Fri, 23 Jan 2026 12:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769170859;
	bh=L481mRek9bTxPD4eI/zV9P7mvmuytcQj3dcrOpaexvM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PrMx8yxBlz0/MvM23Qcg2lPpTwZBbjPHo4sx7Aiqzk7gUSXCBcvk2hDrWJdTtmdZj
	 JH5TYWR0Xd/rFnerTdbzQDA+enGtSQSIJRoTvxiLsFQvR+E/Wim6Kklx5zBZOmGBGX
	 mrShl0oOI0ZI/XKlOzkm3JBeWDOm4e2StUjc51HXvwWSniPUACgiyfl8/ZtzaoR8ef
	 yAbvhRI1Xr+mqZH8BGQ8qF1s1Xo+AtAAIMNZ7hTwe642Dfm0zyF6UAKJnqnlQeRvt+
	 wuJfU6/XYyFyfJOzvs7cZV4yTKN3xfgSKE2V9qaGpWJVUVWonY+uERE+LktAZXqt+m
	 qrjefenwiir+A==
Date: Fri, 23 Jan 2026 13:20:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Marco Elver
 <elver@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Subject: Re: linux-next: [DOCS] build warning after merge of the tip tree
Message-ID: <20260123132054.2d46fb97@foz.lan>
In-Reply-To: <20260123112856.GS166857@noisy.programming.kicks-ass.net>
References: <20260107161548.45530e1c@canb.auug.org.au>
	<20260107215409.GB694817@noisy.programming.kicks-ass.net>
	<803d1946-6935-452d-953a-90f6e73d53a2@infradead.org>
	<91c5386a-2c1b-476a-b189-86d80c0d9e96@infradead.org>
	<20260123081126.3f0f152c@foz.lan>
	<20260123112856.GS166857@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Peter,

On Fri, 23 Jan 2026 12:28:56 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Jan 23, 2026 at 08:11:26AM +0100, Mauro Carvalho Chehab wrote:
> 
> > >  tools/lib/python/kdoc/kdoc_parser.py |    1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > --- a/tools/lib/python/kdoc/kdoc_parser.py
> > > +++ b/tools/lib/python/kdoc/kdoc_parser.py
> > > @@ -186,6 +186,7 @@ function_xforms  = [
> > >      (KernRe(r"__sched +"), ""),
> > >      (KernRe(r"_noprof"), ""),
> > >      (KernRe(r"__always_unused *"), ""),
> > > +    (KernRe(r"__cond_acquires\s*\(.*\)"), ""),  
> > 
> > Regex here is too broad, as it is greedy: it may drop more
> > than expected. Perhaps:
> > 
> >     (KernRe(r"__cond_acquires\s*\([^\)]*\)"), ""),  
> 
> I have of course no idea what so ever how any of this works, but it
> occurs to me that __acquires() and __releases() are not in that same
> list, what happens to them?

You mean in functions like those, for instance:

	int device_links_read_lock(void) __acquires(&device_links_srcu)
	{
	        return srcu_read_lock(&device_links_srcu);
	}

	void device_links_read_unlock(int idx) __releases(&device_links_srcu)
	{
	        srcu_read_unlock(&device_links_srcu, idx);
	}

Yeah, we need to add something for those as well.

> 
> Also, there will 'soon' be an equivalent: __cond_releases():
> 
>   https://lkml.kernel.org/r/20260121111213.634625032@infradead.org

The table "function_xforms" is a set of regular expressions to replace 
macros into something that will be a pure C function declaration.
It should be able to handle most macros (*).

Each line in the table has two arguments:

	- a regex
	- a replace expression

In this specific case, if we remove __cond_acquires(.*) from the
function prototype, the remaining function will be a pure C 
prototype.

So, I'd say we need to have all 4 macros there:

	(KernRe(r"__cond_acquires\s*\([^\)]*\)"), ""),
	(KernRe(r"__cond_releases\s*\([^\)]*\)"), ""),
	(KernRe(r"__acquires\s*\([^\)]*\)"), ""),
	(KernRe(r"__releases\s*\([^\)]*\)"), ""),

to avoid any warnings related to such annotations.

(*) there is a variant for very complex macros - currently used
    only for struct_group_*.

Thanks,
Mauro
