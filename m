Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B974D38E8AB;
	Mon,  1 Jun 2026 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338060; cv=none; b=lSLi/4Q9p/+nPHOoRgHU0mN4OZ/xCYxoeJnwhkM+wk8l1GgVarJv4LnO52WzSvQ0RhVmKnzyLSkH5FS0LIJ4akr3ZK0jQ4LTmABWhDnrf6UKhJHODhs/IQVEe0WStH7ri1jgMgauRP0aUleV+74AEBc/hpWkba8RFyKgS5WxdyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338060; c=relaxed/simple;
	bh=TGboaD/jjoEtWzvXWRwfp0yLMbSxjQhbacZyp/tNvUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4fcC/e2i8yhzCpUN6fmAGrWgFGeQqLwKT6Gn6cSLq2DMLsaSoyV6dbVIfJR+HdFG9wFcCogW0G0DxPhF2ymZtdSwRDXqfWU60IX63LGRgzD2Sn83+MBhHWhxL7Hlf5ZhTkNYxXAteV0j3yL95qR6Dwuhu98irZRmshcgNEjlr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RI9XJ2Md; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RI9XJ2Md"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9F2D740E01B3;
	Mon,  1 Jun 2026 18:20:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hFHwC-zQuor3; Mon,  1 Jun 2026 18:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780338046; bh=V08tuJnkyT95tc0L1HbEF+Ig5QimXftKeqG9C0RPIgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RI9XJ2MdRDa9Df1VcBoZtj7VW4+c3I9AweGnk9xnG0ngOg5nVY7nOi1OgHfglcWWX
	 /XkheX8TqoQrDxpCRYBPJMo7fqRQcxDPf6kpe2D2bqB2trTRm5dvbvYPcZ6iolLFuw
	 rHsTJ/Dnge7fG5C0UFVj8On8rBilpi9LqzBVpnTg1hgEGgw3KH0cXU+lOi9qJaufgw
	 SN0ZQeUr8OHwWmrPOKHtQbVSQKyvMW3L2Z5n/bN2/xe87swseq+xE81mMJ+CZBLulB
	 bJcIb4Jajw/FEsJFpALwAm3ZmUSfA5Zow84jkNh/XzQUPW7Otgp0cOG9lJKakXxlWM
	 mJBTKHQKH+P+KVELprCKt2cPQ4wk/ErQZQi6zdIJ7EdUnkt8rw/eeZH2n/+tPmeA2i
	 FKGUSn3hwwU1INV9ZOkjGAsLHArifOWA0oNglEKF8TDatiNKHUvsUap/1i9e4huQRi
	 JKwMQJIkAZP4I7ty5s/3CBBFvGjBcMEUPJVFqnHx2jYPSTEJbY0c+9cuRfpUk3hvBA
	 rzH4vrwn6Vq7TvC3BxAX95GHLx8OC3NCU+wwZvnOovr9F4mLVm9/QbCt5Zu3lgwcFI
	 bP9HxSMHxI86pLbArAmEpcrZO4P4Vv5qbSL8HqdL/KfSmbChQp+5/Rq/GkYh8uJfiR
	 ZileigeaZJF/t+8E1oz1BJB0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2366840E0140;
	Mon,  1 Jun 2026 18:20:40 +0000 (UTC)
Date: Mon, 1 Jun 2026 11:20:32 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mark Brown <broonie@kernel.org>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the edac tree
Message-ID: <20260601182032.GCah3NcF_pFbCz-iiW@fat_crate.local>
References: <ahoL3l2gWBBS_e0_@sirena.org.uk>
 <SJ1PR11MB6083ECFA7AEBFC7D8EE11D59FC162@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <daedb22c-da5e-4949-8990-eaedba0c2725@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <daedb22c-da5e-4949-8990-eaedba0c2725@sirena.org.uk>

On Mon, Jun 01, 2026 at 07:14:39PM +0100, Mark Brown wrote:
> I'm still seeing the old merge in the history (8b3604b9e3eb47df), the
> new one is there too.  Probably fine but that's up to Linus.

That's fine. We merge the branches afresh before sending them to Linus so
he'll see the fixed variant.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
