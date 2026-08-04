Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E76418A2D;
	Tue,  4 Aug 2026 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874449; cv=none; b=e2gko/icqyoqAClnJ0txB/+aWsoockigo9ydi/9RszH8XUEL9LD4sTgYSdDc03mfbYGUcco1XJJkFCjqMipVRqA5fXq4bkFd9MOl/xF2sBIesnbppPn7pmh4SCe+4EvyX0B7Ms0h+B1MR35Ie0bW7tgUDZ89Vnnoa9Tjfod2utI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874449; c=relaxed/simple;
	bh=Zm8/XK1K9gy8q22zD8Ub5RHzzSlCrMcHacGY6yok8tY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LXxmCyoUU5cpfR/jfDcEd/T/IJm4JJZX6xtday96stXzOokB7x/jkm0X1Hp7KVyc2PKUMWZb4QPltEie44Un4MHYA+px+4oNGN5p0rx/CgAhR9M/LSdfpPKbn1g21DEE6YzTnU9GmfFGYJTA0RplWy/YjY9/F27M7LajJRSvQcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TSt9gWWC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TSt9gWWC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356AB1F000E9;
	Tue,  4 Aug 2026 20:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785874448;
	bh=UqVyp9djctzqRCbglXqC+7pZykqhcnfOshqui1v5UOs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TSt9gWWCGyD4lHD80TB3896b76m9PCmKsEYbAq6+TEAEd5YjA+1dvS0+BeOP1qsHl
	 Y8lvin54O1wNnwISSrMAWicruGVlqTfWUdFUjBRk0hwlfF0yvOe3vxEWLhNKsHLJx7
	 dpCSPeguUsKm7+sUkh/hKmyG5U6iHrW0IoJSuW8U=
Date: Tue, 4 Aug 2026 13:14:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Joel Granados <joel.granados@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <kees@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-Id: <20260804131407.40a4c72c38c482718894dd9a@linux-foundation.org>
In-Reply-To: <ckrmakyl5pqqdileg6cuusekutpeuz5mtcpic64ml3zzgolwvj@2hnt7zcwqpvu>
References: <amjpZ1aYsps44ExZ@sirena.org.uk>
	<20260728134755.501c6ac650c7a3868ae00614@linux-foundation.org>
	<ntrhorleb6tok47d6nr2k7xrpqwkwwfk5cie4v7pc3feia6tmd@hxxgjkkcc2vu>
	<ckrmakyl5pqqdileg6cuusekutpeuz5mtcpic64ml3zzgolwvj@2hnt7zcwqpvu>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 4 Aug 2026 09:54:04 +0200 Joel Granados <joel.granados@kernel.org> wrote:

> > > 
> > > and
> > > 
> > > 	sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL
> > > 	https://lore.kernel.org/amdveg1m4E4uQlGv@redhat.com
> > I see that this one is already in next-20260803. probably went in
> > through mm tree.
> > 
> >   23a24c8a95c5 sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL  [Oleg Nesterov]
> 
> To avoid further conflicts in next I can also take this one into
> sysctl-next and handle every thing in my PR to Linus.
> 
> Let me know what you decide.

How about I remove

	sysctl: move the "cad_pid" entry from pid_table[] to kern_reboot_table[]
	https://lore.kernel.org/al4C572uhLdBvyzH@redhat.com

and

	sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL
	https://lore.kernel.org/amdveg1m4E4uQlGv@redhat.com

from mm.git then forget all about them ;)
