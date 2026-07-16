Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4EC3815D5;
	Thu, 16 Jul 2026 04:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784174632; cv=none; b=YTjvYxo0ZQCazbYNOx2cYy6xTEzcuCp19EZsTJEWhZVTk+pC64kHxn/tswfSlwycNjQ6Xy7kwASlkW/IJ7VlrwezsLWm+hUIEH8JlgPr+m+lXaDKLwskoExWhSxlXrToM1tOs4u/eYkJAzOE+SQmbbKvf6Ir4UrAYwsmN7/wcJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784174632; c=relaxed/simple;
	bh=gr9MNeDftFSMyTQjgnUqKZ/HRJ/MwAyvPS2aig+PDaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fA+hjSilVeC1sVmqhNq72A8PsAQytUJpPo1+XD7GNCvsTXhrRUjUOvGDalLlBve5okTPQ74+8pSv0sdofUnXVTmy2rleb7Vi/updLDVotaR43bWHh+KGUQw/V1UUWPf3H4zsgZiVPRPCqL5Dcb5hg5irDotAkqJUlTcetRFCb/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jb3omcRI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jb3omcRI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D991F000E9;
	Thu, 16 Jul 2026 04:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784174631;
	bh=iLD1QH6slOlV/T7f1lYVNaWmDnMUy0NDkw4UfOhmtl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jb3omcRIXz0PNlPdoPrMVIbDtlrZYPxIPkGV9tsQPXwB7Cz54t6dx4BlsR5Ov6nZz
	 hGq/ejeaBqf3doGHZp/mqhK42SCBjeRABe4tpVwYFItIHHjaPKmvnfqbExZnmy8Htq
	 281VBcbYxOPsMMeWwfmhQ2BE8aT5t/H2s4E6pimgZR5vvTk48okMD4OLNU8sVQscwv
	 P+DAuO5FNzmJD0zW8Y2haKl2wc3LS5gK+qhwC4pY04+wmxb9ho7eFy0759iV2gBIpS
	 pF6pWf44GsqA45bN+8N9OM1hfLT9RvIU90gIS2Y5Q0/lVoOocC03WvuQgRqQgONXKQ
	 SzagAY5NMiWPQ==
Date: Thu, 16 Jul 2026 00:03:47 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tty tree
Message-ID: <20260716040347.GA1744016@ax162>
References: <alT5UdRqcfFmadZT@sirena.org.uk>
 <12e1f767-d126-4f36-ab95-caf3252a5728@oss.qualcomm.com>
 <2026071417-fritter-mahogany-bb97@gregkh>
 <7fc86c5f-289c-4b77-b3f8-98dc30d89c28@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fc86c5f-289c-4b77-b3f8-98dc30d89c28@sirena.org.uk>

On Tue, Jul 14, 2026 at 11:26:02AM +0100, Mark Brown wrote:
> On Tue, Jul 14, 2026 at 08:45:54AM +0200, Greg KH wrote:
> > On Tue, Jul 14, 2026 at 11:36:44AM +0530, Praveen Talari wrote:
> 
> > > I don't see these errors in my local build. Is there any specific way to
> > > build to see these errors?
> 
> > Nope, I can't duplicate this either on my side just by building this
> > branch.  Is this coming from a change somewhere else that modifies
> > PM_RUNTIME_ACQUIRE_IF_ENABLED()?
> 
> It's something clang reports.

Right, this change is broken, as the cleanup function will be called
with an uninitialized pointer on any of the 'goto error' paths before
the PM_RUNTIME_ACQUIRE_IF_ENABLED(). This goes against the documentation
in include/linux/cleanup.h:

  Lastly, given that the benefit of cleanup helpers is removal of
  “goto”, and that the “goto” statement can jump between scopes, the
  expectation is that usage of “goto” and cleanup helpers is never mixed
  in the same function. I.e. for a given routine, convert all resources
  that need a “goto” cleanup to scope-based cleanup, or convert none of
  them.

-- 
Cheers,
Nathan
