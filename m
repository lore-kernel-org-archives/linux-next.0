Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602FE346769;
	Fri, 30 Jan 2026 17:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769795597; cv=none; b=Fs1HkTBkTgfDE43I7r2WLEjJs8Vsu9hv9KfYAErKOF2C65tNnmqmdeCQ+G4qyixdZCpI+Wff/6lgnpzsjeY85UOMIg3q+c1WmOzgVHak0/WaaB061mQNwchLIgRKUdPY5SCYCpi8goxyv2OI3he4hz+f2igskH6/pa2o8t4fAJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769795597; c=relaxed/simple;
	bh=Fvzjnm1BSzgie1uymrozaGAhgc1GaOmYdIyNREAsqCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZJDI7w4Wy3rVT+1WjdSr5KA1t1xtket8mHzzkX8JaNePvI/cw4JiUaanS5f05yliJCQZijKHiX7lzz3BpF22RbF2a3wJIPZ28nHLWE+cvTXEonzV9Xj1KARngpZd0U7OlPiJ+GYSEsRGvAq0iDFGWKatMSo1iruAZw7ATrSd/Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esjOSTqt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esjOSTqt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23962C4CEF7;
	Fri, 30 Jan 2026 17:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769795597;
	bh=Fvzjnm1BSzgie1uymrozaGAhgc1GaOmYdIyNREAsqCI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=esjOSTqt3nZQ1d2HC3LTdmG1kxvFJJzTGQiPzjpQDyFexpx7BmMfmVMqC1Sn6dtP3
	 T/ueqmn85RMJc2QFRjGAcS7104wLAh+edqKFIgaxX0v+W0mE9MXLHeqilPtHuTYpfS
	 a4l6B5rDgkygYE5MxI3R4lBxB4wa3Jry2aS3p0TmZSXF/RUUKyRe8fFbzhbJgQjDsl
	 QmGjufPWWhUp2i+HGcWze9vDY7642DD60vDA61jt0WIQ3nYzkvKUDRhYDNUw2PeFVE
	 ND/inEbG3+Via1VpFTfU6uJG1AcSTsOnMz4YSFfc9sTzscTTyulpYer2cG647yuL8l
	 3XC0yciN6iB9w==
Date: Fri, 30 Jan 2026 11:53:15 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Fixes tags need work in the pci tree
Message-ID: <20260130175315.GA541767@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXyjEAHpQaqRcUj0@sirena.org.uk>

On Fri, Jan 30, 2026 at 12:24:48PM +0000, Mark Brown wrote:
> In commit
> 
>   924385b745b5b ("PCI: Initialize RCB from pci_configure_device()")
> 
> Fixes tag
> 
>   Fixes: Commit e42010d8207f ("PCI: Set Read Completion Boundary to 128 iff Root Port supports it (_HPX)")
> 
> has these problem(s):
> 
>   - leading word 'Commit' unexpected

Fixed, thanks!
