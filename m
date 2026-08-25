Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCE8453A44;
	Tue, 25 Aug 2026 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663365; cv=none; b=lsdGb93xKhKk8zxZ5WbTyCi2WYG3GVHwi5sM8C8QW1v/1vuUMLJgwqXVGR1jeDbEEUcOraWt2sJs3xvAoUQ/mQ3XjRmddSyUKW6w/iDf5rWlwVOaoOSDBAkIqz31W+xfDMpIrUXoAA/E0RSyHxCg+NgM7DdYSiFeg32LFjP/hW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663365; c=relaxed/simple;
	bh=0ct0xENWv8IFBM1et+OEsBovZiymeMWiGIqyPuNn9ew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVtjll0HwM6KxsSHsruGI1RZsz0Wv4jf45E/nmiA6nyGY5FAyqByqdYyojYnluJPC7lVQhjcoKMLi8S8ItoXvFXDbMS63kYBYTbI5jkfK0mnySiJqFrapCatqqB89D2F5wbq9CNdDtMCU5ZbFarLPw19hfP4ZbccU2rbCQowg1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V48ZtEJT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V48ZtEJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEC51F000E9;
	Tue, 25 Aug 2026 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787663360;
	bh=M9cx4ZuY+8BKm/4LSfrNbfC1OSBlAAeZYvfdWTjRQBY=;
	h=Date:From:To:Cc:Subject;
	b=V48ZtEJT1V2Jxj+8wNGIZMHGD1osWABbrXErkUPWns+SOLdXZN4ZYbbP2l9wQJtHb
	 mw741LCIB/yXrFAuBoD2twfL4BQe0hbROg8PbXAhsEZ8QLrbtcdfJhnJ+7oEZQ0fCu
	 0OBWzWpuvarEpd82ez+eu+axyUX/pUFhMLmX4AwHwJMsnxAOOvARicTGSgKYRYGJoA
	 sb20Lz2Amb/JC6qR1ZOKl7ibzuL/xUKDmVymiS19H17raPlKWXOvF3+NrvXbyVt0Pe
	 ZJ+Ily9tvDHk+D4h2M22uVAJa/NZLnvVemDYAhP5cMtSgmNOuANLMaO419qi+E9T9b
	 lgvwFOazZWBhA==
Date: Tue, 25 Aug 2026 14:09:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound tree
Message-ID: <ao2T_Bh6MmCIPQYA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the sound tree, today's linux-next build
(arm64 defconfig) failed like this:

ERROR: modpost: sound/core/snd-rawmidi.ko: local symbol 'snd_rawmidi_kernel_release' was exported 

Caused by commit

   ab21bde6b13cd (ALSA: rawmidi: Another workaround for false-positive mutex lockdep warning)

I have used the version from next-20260824 instead.
