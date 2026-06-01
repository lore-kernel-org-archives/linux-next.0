Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D14368277;
	Mon,  1 Jun 2026 19:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340978; cv=none; b=ioVC4TtJXLc7daTsTT6yDYov43VhGIwScjANNDRg3ilN8eS3yItpVKDeFYHLhkZtYNquhEYeXC/23imZz7OkMItRG1/8PVjjkkum0CBDFgLefCw6nK/BuoGZvCqzYWBwR6kMCadEHHbV0kNvXqywqr1vc+H50VyLAzcBH3Mz4+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340978; c=relaxed/simple;
	bh=2W43OqPs77qEHte0z7zgnIjZ9wk48hsdTNAC/8npvBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQVVFwiIHOsFCHuxXNqZrQvy2ES7h5Aik4GLtoy2ZqIOk9kyedzp183bDlxjPTdC2Rtgbk7aVfIGfztI9nZtE52DnOqO2aNxt2CwMDOuXAaQtyu+COaKlFuj2MgV3lgghQpLuvpLhpP+HfXjXpzGGvXZ6tvU/cuNFG4awxzOLU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6uMDOlc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6uMDOlc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611C81F00893;
	Mon,  1 Jun 2026 19:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780340977;
	bh=WX6tzvlwtigESJzsLU9Mhn+QLWJKlghxqHjVhIvG8c8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L6uMDOlceb3kXT1PzQ53t3Pl610d1iZqfV5Ww5laY5bJHiUSTt/qs/9O1djf55UXU
	 8Q5/MoJ4lx6EVuDcYQHVcmO4jj+d2EKFXm/CEK9JcARp+lr3wyWA2har/XxRzSTay6
	 LaDQuqwUR07+IYH1sf4orvJQOxL6U27M40kdLrN4tHh2f9eYZChND6/UDQJ+R4GdIJ
	 nAJYun8B9u1o9P7+DwbfSq5V75bscxhwsOc/WhJVFNNtnGS5rJBxUgrt40D7ZuZJpi
	 J/IX69HdNZ7bh6UVtexD+3oc+O+Wcekx2Jm+c3+lPF1KRGpNLSfUZWjuGC2PETQlBw
	 S/1FOaFi8SV/Q==
Date: Mon, 1 Jun 2026 21:09:33 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the libata tree with the origin tree
Message-ID: <ah3Y7XlZsLRrhnZ3@ryzen>
References: <ah26aP3LlYp0gxP7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah26aP3LlYp0gxP7@sirena.org.uk>

On Mon, Jun 01, 2026 at 05:59:20PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the libata tree got a conflict in:
> 
>   drivers/ata/libata-scsi.c
> 
> between commits:
> 
>   759e8756da00a ("ata: libata-scsi: do not needlessly defer commands when using PMP with FBS")
>   360190bd965f9 ("ata: libata-scsi: improve readability of ata_scsi_qc_issue()")
> 
> from the origin tree and commit:
> 
>   374a9cb4bd6a0 ("ata: libata: Pass ap parameter directly to functions in the issuing path")
> 
> from the libata tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hello Mark,

Thank you for the heads-up!

Since we are about three weeks away from the merge window opening,
I decided to simply rebase our for-next branch.
(Instead of merging in the fixes branch to for-next.)

FWIW, your conflict resolution looks correct.
(But should not be needed for tomorrow's linux-next tag.)


Kind regards,
Niklas
