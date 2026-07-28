Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60373191D3;
	Tue, 28 Jul 2026 20:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785271677; cv=none; b=A0JN7Ceqv249pHC9bs1x1VxsIhNeENIF8VI2ENaD7IDQcqZeIRWOT/evuzLVmbjbG5p6gD7j5GT5EbEj5SRXCy11RR9dAOS4Q/N1vtO5Y7YEizhYdtVsWg9VZ+PKHZ4VS5JiTeFI2kob3Zeak4BBz/LQslulifjruB5tsONi3Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785271677; c=relaxed/simple;
	bh=ylOtMPqhQhIgDXjDh0FjkiQkMOJn6XztVRPrlj4rmZc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=C7CtcDoAOoxFIn/2qhzSohq197Hflaf8Zs12Up+QZpPQiuAGDMxwFdj33x7sGZxF7a0k1BO5uCeB5PD7WuquhtdYncAjquoZwDPQ1YQTgdYorL3k8SWiXLaMf24qvCCsey+mNh4Z5xkehSoe0rPq88z6VaJ9X9vukROJwMAs1yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=tY47qqMT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="tY47qqMT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1010E1F000E9;
	Tue, 28 Jul 2026 20:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785271676;
	bh=Egwjf58/hwEWqCpZr3h5LOa3eD+9FPzQUyVXDN7bsJo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=tY47qqMT6beP6J76owu49gtHpeHfK8s+/f65x3Pg9RPyZkGJMgFuDTh24LqFuUewV
	 bqguqjUgtBuCJfXVPIrhzmJIL5FIutU4R3BgOA0PEC2AGW6AVADPLM1brpiUF7XdL/
	 N/yhFBe+HFYBcdPhRrqD/4OCEF2fqi46tKJCqSjY=
Date: Tue, 28 Jul 2026 13:47:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Joel
 Granados <joel.granados@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-Id: <20260728134755.501c6ac650c7a3868ae00614@linux-foundation.org>
In-Reply-To: <amjpZ1aYsps44ExZ@sirena.org.uk>
References: <amjpZ1aYsps44ExZ@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Jul 2026 18:39:51 +0100 Mark Brown <broonie@kernel.org> wrote:

> Today's linux-next merge of the sysctl tree got a conflict in:
> 
>   kernel/time/jiffies.c
> 
> between commit:
> 
>   842912dea6d51 ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL")
> 
> from the mm-nonmm-unstable tree and commit:
> 
>   a3c70a5a9f944 ("sysctl: Generate do_proc_doulongvec_minmax with do_proc_dotypevec macro")
> 
> from the sysctl tree.

Luis, can you please grab both

	sysctl: move the "cad_pid" entry from pid_table[] to kern_reboot_table[]
	https://lore.kernel.org/al4C572uhLdBvyzH@redhat.com

and

	sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL
	https://lore.kernel.org/amdveg1m4E4uQlGv@redhat.com


I'll email them at you...
