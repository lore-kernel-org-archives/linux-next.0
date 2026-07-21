Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C9D46D55F;
	Tue, 21 Jul 2026 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648746; cv=none; b=iVJOPVycc7ASSwB908Z2uSTTAO4R7g85L5pSojo20P0HGl/WqwMATmR5LPwUpjAzK2+HDPcHoQBPUeACe5pgpsk8HaxmmcomsJUD5jGvpJBGwYJAPpnGXbs3fFqED9DaIRHL2TBAhiWZHsbFGq/culDeVVYzCYgF4V6xIZ46SBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648746; c=relaxed/simple;
	bh=mxAMh/FFHyFSd4cM68J78Viti8kVq3lqTWH9Rmc0uuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FayAVyqL48K8KyobOWVELpt34+G0Nba49OX3Y25VLtuMTr2AIpk5tHljVVHpHDqzf4fxAAvq56ZM8a93H3D9X1DFYbzzNqvek/4wX/cgeBkT6XU1I0avNCNiDmBnyikUYEglt85N+oOAig0Ee8RhiscvlvSNhhtWTOnFJ53Zfik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2Esy/jz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2Esy/jz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B18F1F00A3D;
	Tue, 21 Jul 2026 15:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784648745;
	bh=yyWruNCx2Q2vR1ya32pgSJPslYg9u0BpPqmkeLwZZOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L2Esy/jz1FDaRWWyZ6MCAfBuoVHbNudmjo5Ws9jL9jaCM8JyNADfPrYsbVf/CnKUA
	 40YJPNa+Bae/YpJ7q7z646RMV5KXzm9EWndrF0bhtRAxxt4j5iEdZp0VpJCUZqogkf
	 cocCX3C0AO+gV3hTtlOwNP8TB3L+XC5lFkiaMdeNoUJXfelmnC99VkqnWxf4aA3LXn
	 w8H9CeA1B95Oj8s0svqxUJhYifyq4wvZIm15pYMleFttDhb1O2vOWObq03hvrk6AyS
	 MA2PitE/95I0UiOVYXhhUwdugBS9hngoQBVly4OY+RR+Haazxuar/r6hZqBzN6mcEd
	 VfqosUvBYlbLw==
Date: Tue, 21 Jul 2026 16:45:26 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Mike Rapoport <rppt@kernel.org>, 
	syzbot <syzbot+ee7ecfcd0e3f185e835a@syzkaller.appspotmail.com>, "Denis V. Lunev" <den@openvz.org>, 
	Vishal Moola <vishal.moola@gmail.com>, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, luto@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com, 
	tglx@kernel.org, x86@kernel.org
Subject: Re: [syzbot] [kernel?] linux-next test error: WARNING: locking bug
 in change_page_attr_set_clr
Message-ID: <al-QA7L9qFcDr-TR@lucifer>
References: <6a5e53ed.f1649fcc.2a4208.0574.GAE@google.com>
 <20260721022448.GDal7YcN_64rndpnHI@fat_crate.local>
 <al9LYQPufAfqvMYT@kernel.org>
 <al9jHTONTrsImlVV@lucifer>
 <20260721135323.GAal9504VvxYHpcPtd@fat_crate.local>
 <al97bRuyGo2UpCv3@lucifer>
 <20260721150547.GCal-Ky_X99ULTLK2Q@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721150547.GCal-Ky_X99ULTLK2Q@fat_crate.local>

On Tue, Jul 21, 2026 at 08:05:47AM -0700, Borislav Petkov wrote:
> On Tue, Jul 21, 2026 at 03:03:41PM +0100, Lorenzo Stoakes (ARM) wrote:
> > You mean the series that changes core mm and has strict dependencies on core mm
> > changes and solves issues elsewhere than x86 CPA, that one should have gone
> > through the x86 tree?
>
> We do immutable branches for things like that. For example.

Coming soon to mm :)

>
> Bottom line is, there needs to be synchronization across trees when they touch
> the same file.

Yeah completely agreed as discussed off list :) comms is key.

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

Cheers, Lorenzo
