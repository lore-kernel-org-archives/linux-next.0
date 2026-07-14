Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03B747AF65;
	Tue, 14 Jul 2026 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038958; cv=none; b=Rf7DxALCwCBNJTENGyX0P5QfTad9Q2R3H4llr0rL0VfPEUVBdy0oXm5EqGlARqAoIKzbUA+BJgyL9saTylzd8FaTnBQb0+FOElQje1oSDnBzF8TDfWGdLxDOQKKxhAjdbYK1fFkUYiiRUaUwePV3IfATpVqtjHMEMbOBc13UW+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038958; c=relaxed/simple;
	bh=qV8vAgUSMD8603J34ErCtMISDQpEkFPKS5orqsadIAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+Z50qrU3ccsJ5ZV9Tuh8hR4gZYGJDuWnqCfkBZkRfHu5AeZ8H//BLMo3NzGB1u4a7LzSysvSA5WcVpRhXsnEr98SY59JPj3IRzVQ34QlhHCYUjZCpZA0mmHJUjdrEi6LpJbr+RY1eOYP4O9nJJbV8b+Gdu0nHZVV5lfrjqTtqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=JMqysRmb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Iid7EE9d; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="JMqysRmb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Iid7EE9d"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A54E27A017A;
	Tue, 14 Jul 2026 10:22:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 14 Jul 2026 10:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1784038955; x=1784125355; bh=WVvYV67LQw
	ZX4DuLa5Us2pBxUNeZNf+dMkJ8tbRjbG8=; b=JMqysRmbNNFaNSvas5GF0pvJ+M
	PufBFmo49bbpuKPVcgXQe0wSa7OsyO22oQ5TxCtZYzKL/gly9yJazG2b4o/5WdL6
	FAm6X6UhWss8JoAwgIoU2+4uTkiCgwfcMqm/nXjpP1NBrwRhYmH7YXq1ZgaezTv8
	zF+OWwpxrbuml2hDV0qbpCzUTlXS7CmtpB7XMDoaXpTCuTS6KaT5NsCziRftV0bR
	Ml7p0L7N9xf2QsHGZI5PivJgvm4FAsx3nLnsejkPQLmeiTGmJmE0rOyAu6u3Cpul
	banGHVOEmbDhCu5GI8Usi3jEMQnq32i9lE1i6TRPjEm9abCKmAG3o+0c4CSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784038955; x=1784125355; bh=WVvYV67LQwZX4DuLa5Us2pBxUNeZNf+dMkJ
	8tbRjbG8=; b=Iid7EE9dgQXxdVpFQUe6dTfQ3E34JWv3bi2JgKRb7joUapM/SAv
	mTzuWYy+rn2KI4id1ssTeYUB0LRlVlWlaC5g7Q/DJJswr0tDNIzrbX9RUJNAzYZq
	OUZcnsWn+SuzUtitykEzI1aFq1k6C+TT9/1+/ASy9y6dJ17lbI62hDORQYGxe4Ez
	X6DsjSQ8Ys39TXhk01zdRtcYYoH5CwJ7aFN37U+pTapwj5UKtw/PY6iKxzgfy5Cw
	wSZ6JEWcccbYyVKlPlIhoeidOkHa4Xe1/6oA6XTh72o9b/3QttQ0Y+xP+N8af3oq
	r+qtvr8CehfU+fEhJZnzxXRP3KJqLH1rd6g==
X-ME-Sender: <xms:K0ZWajnUJxANfyoi0WRHzAa9oSety-Wz3WgUJ0my8LApla3D5S8GWA>
    <xme:K0ZWam8j6P6QtC1q3z4amcl9V5AfCfsdU8w8zsbc7EEO-n5B0wfJhIWz9kqMYsvrJ
    bwCcdBviUEMisOJeA5rtkfrnneIZn2aITc-9svWRPCTwQIXLw>
X-ME-Received: <xmr:K0ZWahHlNYwedu9zxB782reSOPblOKAgBd0FZM4DJmnQSo8u1_tWwYfClf-cUWL3vvYHHC-PK9jyg2cqlyP-3dDFPg>
X-ME-Proxy-Cause: dmFkZTFKoHs1xB7hK7wLNB4J76LWz1+uVw51HWjbOLRrpyfr6x7n3BYCtX016e86MiMQIG
    eBe5U/5dfen2x+5uDIrlI8rni10R0IyqSanY1xxyKPcgbD1tljMKZCGFzrtwxbv48LqpV9
    1STOmIHF0zL5X4YSDwQD/uIxXZ+Adv8EfASVi2LMJ5U+vToDgKIQhPAUuqZwgBWIv4o2nQ
    JjCeL+t9CLgtxs5PWPI0ikx3epwJTrOAGtz0PO7erVKRr2juWuCWeOkh2gPBHvYKqwG+Ry
    hNc67nLMm0NF30rx1P6hh+wRbkkLSDleBpoz5oxheW3mv5k36Z3j+cDnk3NJKSbhtKpfjY
    hphjnkMO3DBZxm1mpIVE6My7ozRDFZJdeILUHXnAlds9yI0KXbAkdzUodMcmpfdv8UyqC5
    wS88fiBey7Wdi2K5/pr8Pv8Vy9SY1VzjW1ff3O8EwLgIugBKbxcKmDCDceVVkVAwWmRFbO
    moH3tqr8DCaUBaZdznJV+NzsFe3pJtsShf+LDMyr272HIs2+VypJFI6Gbr7sCa5Fq5lDYT
    m8MX2h30oGpISO3mP0V1Xu2jEcG4oFLZtkVXlhTfzESDCL4aTH21ceGmYLMjD0HdWBvqMY
    31Sqo4rU8M7JBukb1xXDtixW1erFs6f60noUYPWVQvxuCq3UPLnSM7J9tryw
X-ME-Proxy: <xmx:K0ZWaiJuMrUcAh8uHF86k3WevN4N6TqFIYPtXsYg1R3hmRQ3TZnzWg>
    <xmx:K0ZWapmUKpTXbX-rvTjlmmiayUw_8zUzKcEjkUwjmoJqe8KYha8zkg>
    <xmx:K0ZWajzA2ZYjSjd6pvnTFzhQ4KvVWKF1HQ8W9tDblzzKk9uHm6xXaA>
    <xmx:K0ZWars0Z1Akz3U1N3_-G1UaIVZYp9jDf5VvTeWxjLB91haLolJD2w>
    <xmx:K0ZWan4lNcph3FlMrgIZTCTa9LUp050WGN3T4Xwpkp16xk0gIJXYNZ1W>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 10:22:34 -0400 (EDT)
Date: Tue, 14 Jul 2026 16:22:30 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Keshav Verma <iganschel@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the origin
 tree
Message-ID: <2026071423-joyride-gainfully-f851@gregkh>
References: <alTxRkflyqvAaGc-@sirena.org.uk>
 <alYvsW4eRWsA46YU@google.com>
 <2026071439-magnify-submersed-b5c0@gregkh>
 <cc5e4243-d179-4224-a196-7337d1ac51f8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc5e4243-d179-4224-a196-7337d1ac51f8@sirena.org.uk>

On Tue, Jul 14, 2026 at 03:19:41PM +0100, Mark Brown wrote:
> On Tue, Jul 14, 2026 at 02:55:14PM +0200, Greg KH wrote:
> 
> > That's a diff between the two, can someone provide me with the diff I
> > should make now to the tree when I merge these branches together?
> 
> The resolution in -next today (when it's published, hopefully not too
> long) should have integrated Alice's patch.

Cool, I'll copy that, thanks!
