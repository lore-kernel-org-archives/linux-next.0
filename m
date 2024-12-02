Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57119257D
	for <linux-next@vger.kernel.org>; Mon,  2 Dec 2024 01:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733103116; cv=none; b=Wnbg30L7fWbdukVzltQVV++h2I75WBbZGlmpUEX45O5SJdtKnXAVqs2CNeAojk+rF269mh4sLOXG7/tQ0BWN8UO5Tp9JtANvsKfvK1a2326cw9IpTv+V1TtnQ/ythnjDE2cXonWeO1AcNoATwXFmr0sHqRy6CTTMbddvTKWZpbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733103116; c=relaxed/simple;
	bh=rWvB4QzuUT5G/hjb40/6F18crPzRcYaNLoCybQttyZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BxS6gC0/7IWGJOvL4E701ywT1ed4HZEHFv4kN4qgK2Ah54TT1Ds5x6YOXAod7ox97MwuXZkW/BWaSOEz8GnCOe/oOxifa1/d7cnloQ3p/xRGSIaBSTw9wIuBqw9Yy7innIEhCn4RlcbeCbmXn41xZbLlS79pe0Ib2PQodbbdD9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDb7pR7q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDb7pR7q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF01C4CECF;
	Mon,  2 Dec 2024 01:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733103115;
	bh=rWvB4QzuUT5G/hjb40/6F18crPzRcYaNLoCybQttyZk=;
	h=Date:From:To:Cc:Subject:From;
	b=nDb7pR7q/NobhxIqOWPvOPLGfxhOT1toM7N70aCc/q+iSa50QPep6EPASqZoBOo9X
	 pA/Rdjl3UKbfPvBiGp4eiFntAZ4pNWjpaYqTc6hLFY5ne02kqYptC3VmMNbVBvHYEw
	 ya7vDAcTR0toKR/9fa3pZi/FqnSVMbivV7bmkydArsY+DAj3qqvreW0kYer/SIezcV
	 B5OZkenzjVa4N58m6KbFGAQgPMChDHgeVv153YZsYnCcVsn/hHpXkmsoUoNpSEc6lH
	 0BrOr9QiGBbApLBvmqHPIK/7lNjqrrj5ng90oPKDwFxxvWQyBPU0R6kEY4SFZxtC27
	 orpI9Pz3++6Pg==
Date: Sun, 1 Dec 2024 17:31:54 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: Add crc-next tree to linux-next
Message-ID: <20241202013154.GA25618@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

When you have a chance, can you please add the following to linux-next:

    Repo: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
    Branch: crc-next
    Contacts: Eric Biggers <ebiggers@kernel.org>

Thanks!

- Eric
