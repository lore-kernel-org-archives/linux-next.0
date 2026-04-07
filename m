Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B7537418F;
	Tue,  7 Apr 2026 03:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533153; cv=none; b=sBelyLOJtzupnym0q7N8ZF9Y6Ij553dB4TdQ9O0cHwnLHaaKNxjEOieivcXv9rBlPlz+AHYX7YVb8d9+L4Y102+fCk3KDODSmPwYWflmGTgcnZONP3eUwgDa+wopfrDzrHXqYSdZF0awxpcoR/FWytylCMFknr0oBZfWTGgWAGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533153; c=relaxed/simple;
	bh=EvcPBPwx/vcsz/jA7IUAvD5qKrvzVLoUvLXfmij7b/g=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mndKkBa5wWnU4/q8blwsrBpx4no/TUfjx14vJj27ciUJZmu022mAumaUTvgnEPXotiIlQDFu/xKqVp7CDf0oxMbtNA8FQL7pakj0CPMBqAK6Bk80rBaJVIqMaNEQsDjmDqlcn12oqeh4SJdtQ/F99Obe4X4ccyVCmRxAeiNqe+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Rs+RLJLC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Rs+RLJLC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF02C116C6;
	Tue,  7 Apr 2026 03:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775533153;
	bh=EvcPBPwx/vcsz/jA7IUAvD5qKrvzVLoUvLXfmij7b/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Rs+RLJLCmju+UdoteQVgGhc28rT8w6LXWTPdtGQ1spcHkGDAR/jk5CRXCXBkcEF+C
	 za1RXjvkYAfYcjsiAxtKlkodVWjxoc/fUrJngAOt3fiu8VyCi7Ecey2gdbFsqwzSAn
	 Wt2x+JtOwo0unm9c90AH7VisbO5nVJgbpMLFyMU4=
Date: Mon, 6 Apr 2026 20:39:11 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Mark Brown <broonie@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the
 mm-nonmm-unstable tree
Message-Id: <20260406203911.12084f57acd2784ec7ae2c4a@linux-foundation.org>
In-Reply-To: <b96ce2ef-cf9c-4f21-9058-d1791305d5b5@linux.alibaba.com>
References: <adOxjbi2byrIet3y@sirena.org.uk>
	<20260406092553.8737d1e3834fe6fdeeaaa8fb@linux-foundation.org>
	<b96ce2ef-cf9c-4f21-9058-d1791305d5b5@linux.alibaba.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 7 Apr 2026 10:19:59 +0800 Joseph Qi <joseph.qi@linux.alibaba.com> wrote:

> 
> 
> On 4/7/26 12:25 AM, Andrew Morton wrote:
> > On Mon, 6 Apr 2026 14:13:49 +0100 Mark Brown <broonie@kernel.org> wrote:
> > 
> >> Today's linux-next merge of the fs-next tree got a conflict in:
> >>
> >>   fs/ocfs2/dir.c
> >>
> >> between commits:
> >>
> >>   bdff37e327275 ("ocfs2: validate dx_root extent list fields during block read")
> >>   28c33de101792 ("ocfs2: remove empty extent list check in ocfs2_dx_dir_lookup_rec()")
> >>
> >> from the mm-nonmm-unstable tree and commit:
> >>
> >>   0b2600f81cefc ("treewide: change inode->i_ino from unsigned long to u64")
> >>
> >> from the fs-next tree.
> > 
> > Thanks.  That's a nasty-looking conflict due to the applying order.  The
> > 0b2600f81cefc change is actually small, below.
> > 
> > Hopefully Linus can figure it out ;)
> > 
> > 
> Should I resend the series base on the latest linux-next?

It should be OK - the resolution is straightforward and Linus is good at
these things.


