Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215AA33A9E8;
	Tue, 19 May 2026 18:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779215144; cv=none; b=YhzTKZAXLwcbtWowcIsZlTgf9wQFdOj5IIbNOrBp4o5jdSf7xkRirOMmhi0mVUmwm6DPg2yEGZtDu1pgbCzFSIzbwwqpP+VmgMMrCcqxripCyT0aT2qz9S9d2shfG4qG95LWvxLOsXJFCwSZcOk+zKeZldBDuEL1xg3QvLrl3s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779215144; c=relaxed/simple;
	bh=1YhLNqTUtq1iNk3/BBoawa9GvYcohDP5Enh2C4f4jgE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nsZiLr4ycuW+SnGVrOipdO1mkTxCB+E8qvl6EooBcGddQC1FBmJF4DCAgsL//rKlbwZeutzktHfBqt2raOZHHb4DDiA2dyp9CBFdTuNGKQb/AXK3sGG5wBPdn3rU0AKqm5+5+XzYC/oAObOFm+olOK9NiQfV+zMafHMd42MQA3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iZUFHybZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iZUFHybZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4ADC2BCB8;
	Tue, 19 May 2026 18:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1779215143;
	bh=1YhLNqTUtq1iNk3/BBoawa9GvYcohDP5Enh2C4f4jgE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iZUFHybZBhPIz2QgR58RPdqT5cR+hyJKvzFXwpTrCFPuBJh/ECUiRK/ixX2xjoL+l
	 3Ly/ISNBHQFLuL2dKe4Hq7GixxZc/1GgVGUsIsU3NSA5fcHb+CsGSzxng/u/xojU3R
	 n/ZRIN6mhVEOL08JKwjODxQXzBUXTNZHYMCbjsYA=
Date: Tue, 19 May 2026 11:25:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Sang-Heon Jeon
 <ekffu200098@gmail.com>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 origin tree
Message-Id: <20260519112543.bcb64b65bd264dc0eebac362@linux-foundation.org>
In-Reply-To: <agwuKp3CtmlA8t4n@sirena.org.uk>
References: <agwuKp3CtmlA8t4n@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 May 2026 10:32:26 +0100 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:
> 
>   mm/hugetlb_cma.c
> 
> between commits:
> 
>   8f5ce56b76303 ("mm/hugetlb_cma: round up per_node before logging it")
>   4d33b7a0c04bf ("mm/hugetlb_cma: restrict hugetlb_cma parameter to gigantic-page alignment")
> 
> from the origin tree

Actually these are in mm.git.

The first was in mm-hotfixes-stable and is now in mainline.

The second remains in mm-unstable.

> and commit:
> 
>   2638c879e1082 ("mm/hugetlb_cma: round up per_node before logging it")
> 
> from the mm-nonmm-unstable tree.

This duplicate was in mm-hotfixes-stable, now upstream;

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Or something like that ;)  I guess there's a timing issue here, it should all
come good soon.

