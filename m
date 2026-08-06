Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B955D377AAF
	for <linux-next@vger.kernel.org>; Thu,  6 Aug 2026 18:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786039480; cv=none; b=nuZRxNklg8ttOHXqgNN9Utvis+fKI2fccYXBJN3oAzFs7d7LEOaqircBeGZI/4yvF8om2sZPSMJFvTvWjw2F3XeOMBk8Tnf95A20hbVTIMmyh2WhFEYGITE3scvYLgxh90xtXliZlJkaD7In8ov3S91O4ZXivyjCpHdvFTPS93E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786039480; c=relaxed/simple;
	bh=vPvaHwcu6FAmQu9hdrB/0LcbG0V+Nli8cg+nIZTKTD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pu42YOd2DY0Lm07f06mfhbuSldrUOtH9biFRGabYCcolTMFv6wO/NiobGFgAm4xg4p8oolLmH+YbMenT63axhS/G+6hKz+SXhi3iAkdC3V0UV2nfD+b9KaSpOuEFd8APks9deHFtFVht99hmtuQqX5LNLIbw9Yl6FJ7DUERDOAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b8UTpaC3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b8UTpaC3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786039477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UdWNLqxBTwuE6w10Ve999INMwLQmIiCcOtzwbxqd7dc=;
	b=b8UTpaC3g5Knhu38d1nOJGRNFuXXReljug75yPyCQAoNvKvoKqdJLBGgvu1n8++2q9Ep9A
	VB5h8cYtMXuHiugN4llqsN3/V/o7lUcn+4y88TvBRC6DVc8HC6Lg7yeYWbCdRm/f+agxG3
	MUFwrJ+IMEnH3yRePeFn/nAzf4UsAlc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-216-0fYC2DPjNy2QV6YK08rhMA-1; Thu,
 06 Aug 2026 14:04:34 -0400
X-MC-Unique: 0fYC2DPjNy2QV6YK08rhMA-1
X-Mimecast-MFC-AGG-ID: 0fYC2DPjNy2QV6YK08rhMA_1786039473
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C7E791956096;
	Thu,  6 Aug 2026 18:04:32 +0000 (UTC)
Received: from fedora (unknown [10.44.32.54])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 21D20180034C;
	Thu,  6 Aug 2026 18:04:29 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu,  6 Aug 2026 20:04:32 +0200 (CEST)
Date: Thu, 6 Aug 2026 20:04:28 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-ID: <anTMrBYXYKCpmoCX@redhat.com>
References: <amjpZ1aYsps44ExZ@sirena.org.uk>
 <20260728134755.501c6ac650c7a3868ae00614@linux-foundation.org>
 <ntrhorleb6tok47d6nr2k7xrpqwkwwfk5cie4v7pc3feia6tmd@hxxgjkkcc2vu>
 <ckrmakyl5pqqdileg6cuusekutpeuz5mtcpic64ml3zzgolwvj@2hnt7zcwqpvu>
 <20260804131407.40a4c72c38c482718894dd9a@linux-foundation.org>
 <kmpimojpjnn53b3mlezkmokoxk5ugtikrupxtobnsl25uhg7kl@xjwnvn577wsa>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kmpimojpjnn53b3mlezkmokoxk5ugtikrupxtobnsl25uhg7kl@xjwnvn577wsa>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Joel, et al,

First of all, sorry for the hassle caused by my patches ;)

On 08/05, Joel Granados wrote:
>
> On Tue, Aug 04, 2026 at 01:14:07PM -0700, Andrew Morton wrote:
> >
> > How about I remove
> >
> > 	sysctl: move the "cad_pid" entry from pid_table[] to kern_reboot_table[]
> > 	https://lore.kernel.org/al4C572uhLdBvyzH@redhat.com
> >
> > and
> >
> > 	sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL
> > 	https://lore.kernel.org/amdveg1m4E4uQlGv@redhat.com
> >
> > from mm.git then forget all about them ;)
>
> Works for me. I had already picked up the first, I'll add the second to
> sysctl-next and they will go upstream through the sysctl tree.

From [PATCH -mm v2 0/1] sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL

	If this patch is accepted, I'll send a couple of followup cleanups:

		kernel/sysctl.c:
			collapse the now-identical CONFIG_SYSCTL nesting

		drivers/parport/procfs.c, fs/dcache.c, and fs/file_table.c:
			drop the CONFIG_PROC_FS checks, now it is clear that
			CONFIG_SYSCTL depends on it

Now that I see both patches in
https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git/log/?h=jag/sysctl
let me ask..

Can I send these (minor) cleanups based on sysctl-next to you right now
(before I forget it ;) ?

Or it would be better to do this later, after they go upstream?

Oleg.

