Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADCD3A875D;
	Fri, 14 Aug 2026 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786727046; cv=none; b=BgIZs+6A4FH0o++YlWoaRRR1pKkk6lbkBfsIBNplegxVs+As7brsvRLRolnLKwNgLVu1kw+rka6QIGEUtwGLTPJcgIddo4FcpIa6qXOp2ELdQUfu741KwuN2VcwXqbX0tRUiDbIRxjcFovBOG4SdC3K/h9n28eQdu6O6LiuKENQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786727046; c=relaxed/simple;
	bh=OjBE2D9pUlUHODDaomVZh4XD0ODYN275WagDkEPljJk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ucoC6TZ4C5eFe9CQyza7YpemWj/1MMElsbKdrKy1fg0tRLzztxDqoLIOsUpEUmLsyCRApRsO/amWnYE7GydzHNyqg2W972NpakN26sKIaLFAZuhc2fl3NFITN+Ocq/izwkUXRwoePnEGBiNAHStUy/s9lRfe1Op5qJFVS9dAKWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pu6YM4nt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pu6YM4nt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F055C1F000E9;
	Fri, 14 Aug 2026 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786727044;
	bh=4Pp8s4B2T9IQ9eJkN9kBjdme+RhnxVC9qs6XRtDa230=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Pu6YM4ntzNwOqjDtVUKGkKhu1LyH2oMtpEW5N5p6/M8vY82XCe8WsT3KSfPdOMhAv
	 OkaWVCn6j+7TGzQza+1dXqcgoOVHcbyunNaqXL80OjcKolFU4P+C9f5O9HyK9D8HCk
	 MISHNIwnQTNE8mW9ttRrRIlRQHOtIEeMcAHFiBnP3JLPT3mJPoyJnSJFZxfLN14/Sm
	 5/sHtppq//1OPRVl5GXB/x5zYCuXVQkSHQGpbzquYKqqcnEXf5psmN9FTLyGVmPeJm
	 PPPRkgQl4DdbOku5REd9mWXqnNEi5702k2l3kRuCinUHzMXGo4DVRInfDHwD30XOfG
	 G/uVVNBH1BtiQ==
Date: Fri, 14 Aug 2026 11:04:00 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: Paul Walmsley <pjw@kernel.org>, Nam Cao <namcao@linutronix.de>, 
    Rui Qi <qirui.001@bytedance.com>, linux-riscv@lists.infradead.org, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
    Jingwei Wang <wangjingwei@iscas.ac.cn>, 
    open list <linux-kernel@vger.kernel.org>, 
    Linux-Next <linux-next@vger.kernel.org>
Subject: Re: [PATCH] riscv: hwprobe: Register unaligned probes before
 usermode
In-Reply-To: <CAMuHMdUu16GZ0WX3tfpzThfmP21kW-u4JTg8NBQ1HKUDvfXORQ@mail.gmail.com>
Message-ID: <1d36c93a-200e-3105-8ea2-36f20c382644@kernel.org>
References: <20260721150511.1607105-1-qirui.001@bytedance.com> <8884ef1b-9fd2-7300-d7f1-38d061cabf0c@kernel.org> <871pcaa2g6.fsf@yellow.woof> <5a181a44-4f25-6cff-fe17-ac1995da8ebb@kernel.org> <CAMuHMdV+nFbF6QW8MCX-T0wSygcR5bw2o5RrHe2j=SC=44XFWA@mail.gmail.com>
 <CAMuHMdUu16GZ0WX3tfpzThfmP21kW-u4JTg8NBQ1HKUDvfXORQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Geert,

On Fri, 14 Aug 2026, Geert Uytterhoeven wrote:

> On Tue, 11 Aug 2026 at 10:45, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sat, 8 Aug 2026 at 01:30, Paul Walmsley <pjw@kernel.org> wrote:
> > > On Fri, 7 Aug 2026, Nam Cao wrote:
> > > > Paul Walmsley <pjw@kernel.org> writes:
> > > > > Now that we've queued a patch to get rid of the async hwprobe
> > > > > infrastructure, is this patch still needed?
> > > >
> > > > Yes. Removing async probe only ensures probe is finished before the
> > > > kernel is done booting.
> > > >
> > > > But there are usermode helpers which run while the kernel is still booting.
> > > > This patch ensures probe is done before that.
> > >
> > > Okay, thanks for taking a look.
> > >
> > > Thanks Rui Qi for the patch; queued for v7.2-rc with a cc: to stable.
> >
> > This commit is now commit 994dad686e755477 in riscv/fixes.
> > However, riscv/for-next contains the similar but empty commit
> > acf3fcb5e9199cc9.  Presumably this is the result of a bad rebasing of
> > for-next on top of fixes?
> 
> The empty commit was rebased, and is now commit 4e864f1c3d8d147b.
> Please drop it (it breaks my scripting ;-).

Fixed!  Sorry about that,


- Paul
