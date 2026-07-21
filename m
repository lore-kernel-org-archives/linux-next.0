Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEE83749E5;
	Tue, 21 Jul 2026 14:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642641; cv=none; b=IkDUMvDCIi9i0lJWlTvWuimqub0vM63ywyYkfa1zg1AIAys6Z9X0OmTI9M4FhI7KsnoPXXKRnK/Dl8yQIR6zMSZJGpJ7ICjFVOaMqaklL/pTK97kPUOENTChev03LLbdmkIF8VLFse+qvY7HMHSQaBMq2YEVkSMsPsQEjgrKlG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642641; c=relaxed/simple;
	bh=6nZsczli4p7abvIoJRfHqGza9jvFGRUey0MKu3w09fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CE8Hfrda8a+Pq3e85tRZqlBO2xEhxwriWv+5FwncUVtNzit2enG3j++B49brrDKpwiTPwAV4xVguThwzVoqn1JiDG87p+0BeQKJH9VXE9ZcwEtBM/LwxRZUkcpUPMfrTiq1BLbTnWmi8V3z5tnmcY5/PxV1GBXopezKws3t3V50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rz5npCop; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rz5npCop"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E451F00A3A;
	Tue, 21 Jul 2026 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642639;
	bh=76v2widEs4BgjKivyhUtC90KrnKgRTssA2kps1ekDLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rz5npCoppyyM90Wciu+ATlgKhsGgI4dr48/aL4O7viDIdpeYaE6ZysIpxu7XbYRHw
	 OistUPRbqoF/+O1Ype3J5XexA2DFfKbXunLZozojrKa3ZzA+MfK3KYlCSmibpbXj7o
	 tbAWwsedXaUbVYxL7ansToqCuTL4ZBLSzu5VwiVarwTl+IiP1qxTbw2gOpqTg2302V
	 MMpr8DpoDhriki1zfoMN5IkaXb4YG0fBJ2bYCfmkVYotOFDqZO0HBY3N3Ftfm4CpEH
	 gYGrmI5s5VIyWrakm3jSmTLBGqs2+RxdcqLF0WYDB0wLfwj6g+FNvPTAeRsJNdXNdR
	 t1Ry8V3VfXgXg==
Date: Tue, 21 Jul 2026 15:03:41 +0100
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
Message-ID: <al97bRuyGo2UpCv3@lucifer>
References: <6a5e53ed.f1649fcc.2a4208.0574.GAE@google.com>
 <20260721022448.GDal7YcN_64rndpnHI@fat_crate.local>
 <al9LYQPufAfqvMYT@kernel.org>
 <al9jHTONTrsImlVV@lucifer>
 <20260721135323.GAal9504VvxYHpcPtd@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721135323.GAal9504VvxYHpcPtd@fat_crate.local>

On Tue, Jul 21, 2026 at 06:53:23AM -0700, Borislav Petkov wrote:
> On Tue, Jul 21, 2026 at 01:39:45PM +0100, Lorenzo Stoakes (ARM) wrote:
> > OK so this is a screw up with merging.
> >
> > Two fixes are applied at once here and they are NOT compatible :)
> >
> > Denis's ([0]) holds a spin lock over the operation during which an older
> > revision of mine ([1] - current, probable next revision [2]) tries to take a
> > sleeping mmap lock, hence the report.
>
> Lemme guess: if those were merged by the same tree - tip - where arch/x86/
> changes belong, we would've caught it, right?
>
> Pff.

You mean the series that changes core mm and has strict dependencies on core mm
changes and solves issues elsewhere than x86 CPA, that one should have gone
through the x86 tree?

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

Thanks, Lorenzo
