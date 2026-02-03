Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE162581;
	Tue,  3 Feb 2026 23:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160433; cv=none; b=A7k6RvWf348dZOGvmibG4hMgISLSgIUcMct4DuVV8q6niYj9oHg2mZ/cjyZHzPOxhHKGqcjK3fV5IU+W+mcqHL5xPwgM7EZHoqv1fjf6qCR4q3NM5OZuEadwkxw/HzChpjgqfV5Oj0yeuGC7LvHmbQ4rv4S/U0vbAkpgLJwMDKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160433; c=relaxed/simple;
	bh=WFPGwx+T3B59LJ0oCXXVe4ZiB0wAII/WkbkatxKocUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VI7ySaQftIvDnzcT2dUhwf+4h3Ym/TTOf2iBR+5G+b4VZA3/FuA1wsPAliee0jxR7SFT2rN9v6mcq4axuB5smG4q3fW91rDY2YHTUvRfjo6KU8T4/iwsxETJdD6xghf/H3YEgpCP6Hj7IBd4C5EZmIt7Zc2iD3p9LlNxBWW3f/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dje0VNj+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dje0VNj+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43631C116D0;
	Tue,  3 Feb 2026 23:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770160433;
	bh=WFPGwx+T3B59LJ0oCXXVe4ZiB0wAII/WkbkatxKocUs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dje0VNj+2BdqTd1y7uyYmQXC6ou411ws50LPbdyKAZBO/fauz0kdal5WlWZx6Y0BV
	 NH+HG+YD5ngRami3ls37X2vH3jrkdei40FpWZwyQY29XObh6CfteXnt1DBU8YqCcEh
	 ADV4bSB/I8u5Z+XJdkLIJJzDAEY+A2u+IQDJepq/m3EKuhe089/eWTLKwjMnT2bJ8b
	 UP2r6JzWvgbhzoGRm0OqVi7WniFoqAiV/lIiiH5j/yP0EdNnmUQRRnq1tYoeiDFSAM
	 mRAMB6OvICI3RXvNEShL7wQLptShoVDoUEoDBWZiZ1V04HVKuROXnRV88ffPoPYkrL
	 n5T+FmJXn78zA==
Date: Tue, 3 Feb 2026 17:13:52 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>, Aksh Garg <a-garg7@ti.com>,
	Koichiro Den <den@valinux.co.jp>
Subject: Re: Fixes tags could use some work in the pci tree
Message-ID: <20260203231352.GA195886@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <484d687e-4ce1-442e-b8c1-9299631a7fe1@sirena.org.uk>

[+cc Mani (should be cc'd for all PCI emails like this), Aksh, Koichiro]

On Mon, Feb 02, 2026 at 11:48:44AM +0000, Mark Brown wrote:
> In commit
> 
>   b386d03d6aad2 ("PCI: dwc: ep: Add per-PF BAR and inbound ATU mapping support")
> 
> Fixes tag
> 
>   Fixes: cfbc98dbf44d ("PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match Mode iATU")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist

Thanks, Mark.

cfbc98dbf44d is now cc839bef7727 ("PCI: dwc: ep: Support BAR subrange
inbound mapping via Address Match Mode iATU") (same patch, different
SHA1) because I rewrapped a comment in the patch.

I updated the b386d03d6aad2 commit log to mention cc839bef7727
instead.

Both b386d03d6aad2 and cc839bef7727 are queued on pci/controller/dwc
for v6.20.  Ideally, I think they would be reordered so we don't add
something that's broken, and then have to fix it in the same merge
window.

But I guess it should be fixed enough to avoid this warning.

Bjorn
