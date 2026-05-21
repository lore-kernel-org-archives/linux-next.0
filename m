Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1D52DE6E3
	for <linux-next@vger.kernel.org>; Thu, 21 May 2026 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371888; cv=none; b=ta8li0HhQWri4O+dvtInfLK8pYo56IkxszIV0GXROf2+E9GIEuo6qDrcKyiqgvzt/5UOVcvtC/XaMKd3Mx8FdcJU5kwSzejGNFyo9dSLxTQ5w6P4NVdsjjAqDfmNl1U845x9gn0BEBCUnAXEjeBW65tdZ9FCCuXwORiSlkVVWwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371888; c=relaxed/simple;
	bh=hO72YV0VNE8gvnRBKGt741B/UG83HuEK25KL+4h+QJQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=mc9HlrZgGb+xkGuvOMvVfk5DtgjRswca0BYqwNhXkxQQe4180CTMrdI0TQHQ63JbZl/kMcrSef2LBuxErLCQ+LtMztJ5+30nktNd6i3UAcbiRO0VK3rEfP7e3LW8FGqTsVR+48yFtGGOeMqIomjoSgyIQNXyV3WPHti7LPvXRt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=QzKO51yJ; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="QzKO51yJ"
X-KPN-MessageId: 1707d14c-551d-11f1-bea8-005056992ed3
Received: from mta.kpnmail.nl (unknown [10.31.161.191])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 1707d14c-551d-11f1-bea8-005056992ed3;
	Thu, 21 May 2026 15:58:05 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.190])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 170675de-551d-11f1-83d9-00505699891e;
	Thu, 21 May 2026 15:58:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=rt/+pazRkp9cgn9OOJy0OdEhNxBfkh0UOfm+VW1aUoI=;
	b=QzKO51yJ//38R3jnblcMXQ6x3UeMtWS2m52A4Cq0fFxOS0QYCqv/o8F8cRY6uRMhUY6xLxjuueF9l
	 n/PtSSsJaEVJlGilwlMqjIQccCy4HEF8nU3Ppkr9qpVuIL+l7vdPUPpw92e4m+B+kWLByF4ZgFcmTr
	 9xtR7a1loRY+2lw9vvJNF0Lica18IH8sBiDX8nuwU5uibe5is99xmbtQzxvrGHMgz+iFK173wBAbjw
	 eLVHwlkRicgGRnsc4jJZZj+xhhAnRuahG1CheWjYA4ZB3mZw85RooSrzERaHo9ZyRtsZH+Lrq/dxL+
	 GwfwLil1UWcdNOICaJBHkcT6ZDCbAJA==
X-KPN-MID: 33|N5DBCoXt0IafZ9nOP7k/KaJsS6rt82WMamDiH1eoCCi6x8Q2FlwWCQ5ZqU77kmt
 gMO9lABwoHi8Io8d7k6TnIwgPmTBNDbS7uAP1ALNRL4U=
X-CMASSUN: 33|VP35nPIIzk7IiwuYN3ZQxGp6urWcNppG1hqbT6tDJO1LFwkNzobU1UVKVQlH9pi
 w6bsnYQj2B4i+7Nysqf1rtA==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh02 (cpxoxapps-mh02.personalcloud.so.kpn.org [10.128.135.208])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 16f69902-551d-11f1-b8d7-005056995d6c;
	Thu, 21 May 2026 15:58:05 +0200 (CEST)
Date: Thu, 21 May 2026 15:58:05 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Mark Brown <broonie@kernel.org>
Cc: Dorjoy Chowdhury <dorjoychy111@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, Aleksa Sarai <aleksa@amutable.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <12198575.2129298.1779371885282@kpc.webmail.kpnmail.nl>
In-Reply-To: <4bd253fa-c363-43cb-adaa-0248ac707a0d@sirena.org.uk>
References: <agruPPybCx8q2XcJ@sirena.org.uk>
 <c34d1f0e-0707-40cc-b0c7-7b2648ec1863@sirena.org.uk>
 <CAFfO_h5QdRG2ptyuGRQtqxrpndwan98aOsX92bvN4hyvpgLPMA@mail.gmail.com>
 <e221b631-00bf-44b5-865b-ac970e6cb11f@sirena.org.uk>
 <1286370201.1726989.1779131564699@kpc.webmail.kpnmail.nl>
 <4bd253fa-c363-43cb-adaa-0248ac707a0d@sirena.org.uk>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal


> Op 19-05-2026 18:24 CEST schreef Mark Brown <broonie@kernel.org>:
> 
>  
> On Mon, May 18, 2026 at 09:12:44PM +0200, Jori Koolstra wrote:
> > > Op 18-05-2026 19:13 CEST schreef Mark Brown <broonie@kernel.org>:
> 
> > > Figured it'd be an arch specific version of a similar thing - I didn't
> > > audit them as you can see.
> 
> > These confusions with octal numbers in lists that aren't even ordered is
> > why I would prefer to use shifted values instead. I don't see any reason
> > actually why we should not just convert them all, apart from churning and
> > perhaps not doing it correctly (which would be bad). My rationale for mixing
> > was to use 1 << n at least for the remaining bits. If I remember correctly,
> > this is also what Aleksa preferred.
> 
> Yeah, shifted values do make sense to me as well - other than the
> inconsistent style the only issue I saw was that it's a bit less obvious
> that the values collide.

Yeah, that's unfortunate.

@Christian, can we get rid of these octal values? Or is that too much churn?
