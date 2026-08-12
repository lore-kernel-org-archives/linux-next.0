Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A21B2D2487;
	Wed, 12 Aug 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563642; cv=none; b=mBtqaz/XAPCJNYEK6enV1abalG0ufuch6+ZQsmS861GfuEooOa9pKE5j1inSsQ9vo/gx5cEoVOdcbRTEtBIfWFXA/LcXe/OmFGono3GRVX/d06FuQvSYClftvCfIpxJs7CigSbzlBzi5zqEf1S5i2cGfgspAvzYn9KlhyMyANxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563642; c=relaxed/simple;
	bh=j0T5y5KtM0z087a+XNhIOPEc4qbJ0y0rXmGY+JOKOf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7b7Jo/Z4OrgZw5Ym7bD4sT30T4AiOpxo0hn/ggVPzEDGjCNGyeHTW7T7PbpvFuSbjg+Ls82sktCnRbVE7g6pNNBhxFjLoCWxg44bzTR9bNkeV5nDOZ++cqI4kjHO/jsxaHt7rnn9n+l35xOcfqrRikH1XvLWnQhADeQX0UfGw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwKapw4N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwKapw4N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2501F000E9;
	Wed, 12 Aug 2026 19:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786563641;
	bh=5HFnE/YCBPNfzRibEuoozrMxif+LAmaIGCa+vQ6ca18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SwKapw4NNrtEFQTb9KfcqlCQ9iuxwZxD6iIERnjl4dl6vGUMe1xN0FuOswRjdZm5p
	 8RmGEzjr9wrcQLQ3qACkfJxu9CVWb6+gvmUhylsGS8FXMJplPSWArZ8cQiMPl8yJdh
	 87IckTA09016iZRrffy/AvdqNTgh5WIh520flZnbbIbLFNcfQt5HxsVzjkfzVlNcZ6
	 TxOPOAiA0GSbuoF0lmsFnOo7vMSs3MwCxA1aahZAV88uJdM5UDzcMqAW9CzaR+68T2
	 kG3wJmu7ObOXVCfriQOXQMqiGVe+C8AVjtl3wUqd4Ot1egYtyXxkZLw8fpUVaJ9F5d
	 p5xNq+HVIHPUw==
Date: Wed, 12 Aug 2026 16:40:37 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Lee Jones <lee@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Breno Leitao <leitao@debian.org>, Mark Brown <broonie@kernel.org>,
	ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>,
	linux-next@vger.kernel.org
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <anzMNXw9_mRL-8-_@x1>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxaYg9XL7nD9w40@gmail.com>
 <20260812112723.643f9502@gandalf.local.home>
 <20260812155932.GV1072730@google.com>
 <5f25ba58-f62b-4cf0-bd82-682cc39c7b96@roeck-us.net>
 <anyp8V0kRWdrG57N@x1>
 <9e805a87-73f2-4d8c-ad55-cab432bfe387@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e805a87-73f2-4d8c-ad55-cab432bfe387@roeck-us.net>

On Wed, Aug 12, 2026 at 10:37:34AM -0700, Guenter Roeck wrote:
> On 8/12/26 10:14, Arnaldo Carvalho de Melo wrote:
> > On Wed, Aug 12, 2026 at 10:10:17AM -0700, Guenter Roeck wrote:
> > > On 8/12/26 08:59, Lee Jones wrote:
> > > > On Wed, 12 Aug 2026, Steven Rostedt wrote:
> > > > > On Wed, 12 Aug 2026 04:42:21 -0700
> > > > > Breno Leitao <leitao@debian.org> wrote:
> > > > > > On Tue, Aug 11, 2026 at 05:54:59PM +0100, Mark Brown wrote:
> > > > > > Would getting rid of these ephemeral commits make linux-next easier
> > > > > > to work with?
> > 
> > > > > This has come up at the Maintainers Summit in the past. I believe it is
> > > > > even in the article I posted earlier in another thread.
> > 
> > > > >      https://lwn.net/Articles/1050027/
> > 
> > > > > We are even discussing issues about this in that other thread as well:
> > 
> > > > >     https://lore.kernel.org/all/0a8c1e90-1de1-4a76-b0fa-e367a4bd4f55@sirena.org.uk/
> > 
> > > > > I try to keep my linux-next branch clean, but I do rebase to add tags. I do
> > > > > on occasion remove commits if they prove to be totally broken. That's rare
> > > > > but I rather have that then having to push something to Linus where a bunch
> > > > > of commits are simply reverted.
> > 
> > > > +1
> > 
> > > > FWIW, I have always reserved the right to rebase in order to remove,
> > > > move around, reword and otherwise fix-up commits and do so often.  To
> > > > that end my 'next' branches are not, have ever been, nor do I intend
> > > > them to ever be, stable.

> > > Same here.

> > I do it as a last resort, but its better to avoid having bug+fix things
> > hitting upstream, i.e. trying to help with upstream bisectability.
> 
> That, but mostly adding tags.

I do add committer notes while merging patches, that I don't do using
git merge (shame on me), but then downstreamers don't hand me git repos
to pull from.

But in my case since documentation on how to use new features is
difficult to get and I don't want to make that a requirement (shame on
me), I end up testing the new feature with a before and after, recording
precise set of instructions on how to use it so that at least I can go
back and check how to test that feature if something looks wrong
aftwerwards.

- Arnaldo
