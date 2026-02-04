Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5E37F11F;
	Wed,  4 Feb 2026 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770207856; cv=none; b=nZBpvZheJlK3fRbIIs9DcGl2i9gtFh0zAkNDpADwa3zq9OVNjMiLsxkaEzSRiLcut+8D7vGrmmC/cE+FINhqEe1J4iTLHLO7b649yf8gVMtG0kbYZrnlbx4ppQM8nRNo965FdMC6HTZ2HgBNNlKpl/219Q4fzeRqjWzBcmFW6q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770207856; c=relaxed/simple;
	bh=4mTAcpN54BRYAEB6n5t65MGP2POYKzr1SfYv+hzkotc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rI3C6+g+oGKjANyHlkpvSIDaWyTawes9iIGR4IqFq5TPA3bxotqfMfnMRGDzHy4cLhlB6C0NI0gDPZ5QDLsYfI4DppH8fG3TkpURS/0nDiSpefFd0b6T5VmXQ0c8s4F9MgEMuc+kSi3Johv/klrum6FYy0fptdkSnrSVAeZNgTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVvTdLdR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVvTdLdR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6782C4CEF7;
	Wed,  4 Feb 2026 12:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770207855;
	bh=4mTAcpN54BRYAEB6n5t65MGP2POYKzr1SfYv+hzkotc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVvTdLdRz6Oy6pydnWDwXM0MEHQgRC6rGL93wVw6HTCfluu7QxzCB0J1t1EfLHUFi
	 M6p4q1Me4HtJIPNgyd8Vm5jlebRYj9Eex3eeART9dsoucecauHcgbOvNhHp98Q6hcA
	 qhpL9IX2yAmcibgicElK2q9dNjtNZTzBqFbPWgagX6onvb0PUljXnqIEl2TvN79h/Q
	 v4LXq/SbuDhQNK0jXgIOVROraW8z87f2eqwfOEEyrBjow8ziDUqB1RTiNN8NGk9hbW
	 OXIfooVOv9eykGboA6qkKwAX2BufNbymR05k9MBoW84vmah1jOozuesOa5wLxXuZRU
	 q0N7GCyH6Qt8A==
Date: Wed, 4 Feb 2026 17:54:04 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Aksh Garg <a-garg7@ti.com>, Koichiro Den <den@valinux.co.jp>
Subject: Re: Fixes tags could use some work in the pci tree
Message-ID: <imn5t7cmr7wxunaowyknhe3kavvja3uqmjwnr2q2jt4wviyklm@qb75ya7o2tgf>
References: <484d687e-4ce1-442e-b8c1-9299631a7fe1@sirena.org.uk>
 <20260203231352.GA195886@bhelgaas>
 <3232b98d-a091-49be-ab81-28bfb41b148e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3232b98d-a091-49be-ab81-28bfb41b148e@sirena.org.uk>

On Wed, Feb 04, 2026 at 11:58:05AM +0000, Mark Brown wrote:
> On Tue, Feb 03, 2026 at 05:13:52PM -0600, Bjorn Helgaas wrote:
> > [+cc Mani (should be cc'd for all PCI emails like this), Aksh, Koichiro]
> 
> I've added him as a contact for pci and pci-current, note that -next has
> a separately maintained list of contacts for each tree so if something
> changes with who should be emailed please let me know.

Mark, I'd like to get added to the -next contact list.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
