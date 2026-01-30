Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC72A344D8C
	for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 21:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769810230; cv=none; b=EXxhmGnsodLpkCZSB1YSEFDjf+gj7r1sX/Dtm1vmN02XJXqyolBCQCyIRUWqU0N/IfQdldIXnvPrNj7Xz47F1C3ptRG2qnk3jeUK1s3qAJernPv1SX59tSZ/pt63awx8HzKR1jlfniNg7xWh45pghi/kCEvRi1vYFjFQxuH6tDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769810230; c=relaxed/simple;
	bh=M6/5o4+JGea55KW7ZMzXhfR/yhFL4omJuIMlv4sdcn0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=B62qRPlMwWPfbfjcF5PepwD0xMGkV47iINBGvyHyU8/mtsOqjOgjadiC+kCzg78wM97w3USinOwRy9PoTf1BpPxa2yFHko18u65HIEd2O8rb96pLI2wmUNii4vs0c9SpVRTDd4BCNKbpSjNTRzZs1xrtW26ZfvXslWH9GzNOddo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tm/UzEio; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tm/UzEio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769810227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iSoEaRWTcTvxMBESK8unAv3qC2lHv1zUGYHPHFjrwyI=;
	b=Tm/UzEioEPJB+upElpKjdw3Y9zNGvcUe5ACe6pAfbZ6qkzksi3F3Gu4pLQuBwprCSY0xI4
	xTfDTW3AFtH9tGyUpIaD7sP0q5PKH4kIwqtKg7qvXsP9vytWDVWLd04ZGkc0VsChy2ye0i
	kUsH1XTesoNKFqO+J5edKvdJCbBCfIc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-GTgToD_qPrGk6-0wvTNeaw-1; Fri,
 30 Jan 2026 16:57:04 -0500
X-MC-Unique: GTgToD_qPrGk6-0wvTNeaw-1
X-Mimecast-MFC-AGG-ID: GTgToD_qPrGk6-0wvTNeaw_1769810223
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B26B195605B;
	Fri, 30 Jan 2026 21:57:03 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.33.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2C8911956056;
	Fri, 30 Jan 2026 21:57:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CABCJKuf10mJnunp0gt0r-5Jnumss5LS1VjN51WQmJgnggE+BGA@mail.gmail.com>
References: <CABCJKuf10mJnunp0gt0r-5Jnumss5LS1VjN51WQmJgnggE+BGA@mail.gmail.com> <aXzoSci8NPhIwDf-@sirena.org.uk> <CABCJKueCeHDpu+KMTT9z_iNP2Ljipt6r4KkJ-8h4ysoTRoCW4A@mail.gmail.com> <2274419.1769795849@warthog.procyon.org.uk>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: dhowells@redhat.com, Mark Brown <broonie@kernel.org>,
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
Content-ID: <2281243.1769810219.1@warthog.procyon.org.uk>
Date: Fri, 30 Jan 2026 21:56:59 +0000
Message-ID: <2281244.1769810219@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Sami Tolvanen <samitolvanen@google.com> wrote:

> > Wouldn't that mean having to rebase before sending to Linus?
> 
> Do you plan to send these to Linus for 7.0-rc1?

Yes, hopefully.

> The patches already depend on libcrypto-next landing first, right?

Yes - if that was the only thing, I'd just ask Linus to pull them after that.

> If the patches were last rebased 6h ago, I'm not sure if rebasing them on
> top of modules-next would significantly affect the linux-next soak time, but
> I'm fine either way.

Rebasing on modules-next wouldn't work unless modules-next has Eric's branch
merged in for the ML-DSA bits.  I could maybe merge the two and rebase on
that, but I think Linus isn't keen on that.

David

