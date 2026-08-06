Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCB0328B62;
	Thu,  6 Aug 2026 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040945; cv=none; b=fL9ZRKyXd0p4BMFyHEZ6UzEHZ3CiJYsMIYWZA0WFI3FvkXm1f7ytDYQalFR+qRhWcJZxlju1QHYEumKecR3T3lU4NmEbPhin5o0ATN4XhyIjLKF2Lkl959zvwwKdLnOPiuUc7HASxuNXu5pbNHhekU2nt8ehIPN78SieJXSiJaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040945; c=relaxed/simple;
	bh=2N6tRAndozwfX4qs2lmaVnR9g05qd+AthB44ayXOpZ0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lgtFxsr50nkK1I6b14uG8sdTam+ogjORoslhnVHGZBIW8mPI/L5/lgqsw00vhuzS8ksg+uG3bpOZ9/oV5bYqTrjNC58RF4vgiQ4lhJsRhYREDILvSfTrl5uQgVmlTmHU/XbUYojVkCZZH3SSZm9ZRi1XveIxbnqlHETtUahIsFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OYzChIbV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OYzChIbV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605A01F000E9;
	Thu,  6 Aug 2026 18:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786040943;
	bh=nf2bRou74W+0XYeWUYZCwTDVseUisF6d/FnGC0/1/DY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OYzChIbV62icXdKwmLZaDSuRMletSRILwKr0g90k39blraEkF/2T/mQ3ANELWI4l1
	 YOmagDRvosamOFvDzqqq1nHw3GuLpKRrH1BvBrbYDgG4tYdrSLU8brwOfOCbpbUxXt
	 odL+5LUKdLIxY62PaN9Ckf94b3Z/woMhJufE4Zr4=
Date: Thu, 6 Aug 2026 11:29:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Brendan Jackman
 <brendan.jackman@linux.dev>, Brendan Jackman <jackmanb@google.com>, Dimitri
 Sivanich <sivanich@hpe.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 mm-stable tree
Message-Id: <20260806112902.22351f23796e442af0c3181f@linux-foundation.org>
In-Reply-To: <anSSANY5zZu4kytE@sirena.org.uk>
References: <anSSANY5zZu4kytE@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 6 Aug 2026 14:54:08 +0100 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/misc/sgi-xp/xpc_uv.c
> 
> between commit:
> 
>   579c6de3def20 ("sgi-xp: use higher-level allocator API")
> 
> from the mm-stable tree and commit:
> 
>   dbf69afe320eb ("misc: sgi-xp: Remove SGI XP drivers")
> 
> from the char-misc tree.
> 
> ...
> 
> [The file is deleted.]

Ah, OK, thansk.  I'd rather not rebase mm-stable for this - I'll
include it in notes-for-Linus.
