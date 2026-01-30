Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C145364E86
	for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769795860; cv=none; b=nTwNvye+uzxw7vqueo9jg9UrAfO+LibVQsODLtbpluuoNBJgD9tHHnUhOVhdayxt7CnAx99hkYZr8r4ninqQWFQWg/PEJiKJuVqDH+6ZfQ3Tih4TB8Ryq+i5WOXvi/wQzsdwqUE8BvrRY3BLWAFJb9EiwVOkwH84hjg4FS4cHB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769795860; c=relaxed/simple;
	bh=V6i2FAXLo919/Gr5GBykceNTPZvT2DyLExxMrSsp8Y0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=eS/54AEDLKSERuhXAq0d4w24tzbS/jkdYH21FqQjE84Gbyb51U9w+fvDJa0qEbOq7HQAXSGgL4YY1VJT9T3WsCrk3shrlvgvxtnjwEvPu7sElgWvesYm88shLI89QGc11ZoFdrrm9pga0Bcw5NQGohgLIA5M7CL8VITcO0Ud5pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LnOAU2Kg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LnOAU2Kg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769795858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V6i2FAXLo919/Gr5GBykceNTPZvT2DyLExxMrSsp8Y0=;
	b=LnOAU2KgwiIzrgeDrvxt1uYIqIa2zLRSEqH1grZFM44nuORjSbI4WcMv3Ukmt1JLjFzkek
	rxS8isc3Cq63tKcB+uWc14WAFwls9nrv0yqu43umBN4R2s9sRewBR2jozivspJ1fTPZKKi
	1dn6b29y8UcWFZjOrfe/K99y5jskBYQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-OifsVORoPCK4ig1QJ8mwgA-1; Fri,
 30 Jan 2026 12:57:35 -0500
X-MC-Unique: OifsVORoPCK4ig1QJ8mwgA-1
X-Mimecast-MFC-AGG-ID: OifsVORoPCK4ig1QJ8mwgA_1769795853
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B7AA1954B0C;
	Fri, 30 Jan 2026 17:57:33 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.33.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9FFE73000218;
	Fri, 30 Jan 2026 17:57:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CABCJKueCeHDpu+KMTT9z_iNP2Ljipt6r4KkJ-8h4ysoTRoCW4A@mail.gmail.com>
References: <CABCJKueCeHDpu+KMTT9z_iNP2Ljipt6r4KkJ-8h4ysoTRoCW4A@mail.gmail.com> <aXzoSci8NPhIwDf-@sirena.org.uk>
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
Content-ID: <2274418.1769795849.1@warthog.procyon.org.uk>
Date: Fri, 30 Jan 2026 17:57:29 +0000
Message-ID: <2274419.1769795849@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Sami Tolvanen <samitolvanen@google.com> wrote:

> Thanks, Mark. David, I see the patches in keys-next were updated just
> a few hours ago. Would it make sense for you to rebase them on top of
> next-20260129? Petr's patch removed the use_signed_attrs variable, so
> we should ensure it's still initialized correctly. Otherwise the
> resolution looks trivial.

Wouldn't that mean having to rebase before sending to Linus?

What's your branch that is being taken into linux-next?

David

