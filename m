Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518F0274FEB
	for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 21:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769809846; cv=none; b=O8qyunhB2t1KGguR/I+IHzcsy7pi624xEOBJqLW8nJ2L4sBMuSq5aTw1rl0k8jIYRF6Ju6jeWVGbyIKebCsBlhvmfesZSvOdITfWEYB6RbGNjHcUdv52WOajpkuN0wmJcG5WMrtmW1v+x0v1LfRM7AlG6/dSQmuPUj6bcf7B4hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769809846; c=relaxed/simple;
	bh=TsMsJILKN5IZIFtagkN45eiTeHpsm035umuII9ApRJc=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=jRpj/GUKdMUzVBzo5oPp72CRFTD4ixw2lg7VIoB1mXlzUTvHJ63FIs7FORu6gVkxdvux1D4KFO9Z4NMQmDJ5ebh93jay3NmcH27QyrSJMeBQC40nGUBXyyi0Ws2NxY2Et1LPBHpGzU1JXw/g3JEfXM9S1HhvQRMSITDGa4KzUWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jx+o2dWZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jx+o2dWZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769809844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WOmEr/K5yvfEJ/3Svi7ggBB7bbWHsPKECBhFjeeSJg8=;
	b=Jx+o2dWZIe5Zno4srSfRdTC3tHSF0cIrTH3LjFPZAwxytjjNB7uMRCIrY8w0nkvL8jhG6Z
	plKT39CnSF8oz7xF/YWRKkB49T+3luQseDFp78lHwrLvdkOcNfoP3tjvW0I+Dv7mMyZN/h
	e/H3qwgvfa3iH6I1UIo1PLPYuz1lVRM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-59-JwHQvZ3NMd6kPHjC7n5edw-1; Fri,
 30 Jan 2026 16:50:41 -0500
X-MC-Unique: JwHQvZ3NMd6kPHjC7n5edw-1
X-Mimecast-MFC-AGG-ID: JwHQvZ3NMd6kPHjC7n5edw_1769809840
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D8D7A1800378;
	Fri, 30 Jan 2026 21:50:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.33.164])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1BFBC180097D;
	Fri, 30 Jan 2026 21:50:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <33417587-10b3-4cea-ad5f-595af16174fb@sirena.org.uk>
References: <33417587-10b3-4cea-ad5f-595af16174fb@sirena.org.uk> <aXzoSci8NPhIwDf-@sirena.org.uk> <CABCJKueCeHDpu+KMTT9z_iNP2Ljipt6r4KkJ-8h4ysoTRoCW4A@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: dhowells@redhat.com, Sami Tolvanen <samitolvanen@google.com>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    Linux Next Mailing List <linux-next@vger.kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: linux-next: manual merge of the keys-next tree with the modules tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2280989.1769809836.1@warthog.procyon.org.uk>
Date: Fri, 30 Jan 2026 21:50:36 +0000
Message-ID: <2280990.1769809836@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Mark Brown <broonie@kernel.org> wrote:

> > Thanks, Mark. David, I see the patches in keys-next were updated just
> > a few hours ago. Would it make sense for you to rebase them on top of
> > next-20260129? Petr's patch removed the use_signed_attrs variable, so
> > we should ensure it's still initialized correctly. Otherwise the
> > resolution looks trivial.
> 
> Please don't base anything on -next itself, that causes all kinds of
> problems and clearly isn't what you should be sending to Linus.

I was wondering if I should rebase on a merge between Eric's branch and Sami's
branch and "pre-handle" the conflict.

David

