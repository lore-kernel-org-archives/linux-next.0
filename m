Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A7438F629
	for <linux-next@vger.kernel.org>; Mon, 18 May 2026 19:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131575; cv=none; b=X+VxLVo1/rukkIro6mwl80xU9hwPIAhidYZFXP1XEuZCwCkPzbkCCJ6A2L1XlsoIGbj7/zYDlWgD5K7yyckPBtcaDSDdTGp3ky7Ogz+hH2oPiyz1+u0XsfzUTrwt6FOx+i7IGB2vZxhaJizyhEXbMWBW/42bRLbTzz00IBNvNFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131575; c=relaxed/simple;
	bh=OjncOBv0aB5MMU4aqfNFD8dEQqsU6pAgbvEJRb8uwcQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=e+whjLSZVQjec8qSU5FlScTcOTTvpfXmz0ySSiCJC86fkvN2k2o4CUsV8VO4JEXKm0qdw0fz4PIL8hndGeSYypCU1NKZkTbh56LgQpvMThFmJBJ/vQqetK7xKwSEnv5XkGCqCP/OzvpMX5g4i8eVU2me2JXDuuAlqNWWmVUjJdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=Y5c2fpYv; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="Y5c2fpYv"
X-KPN-MessageId: 8ccc8d4e-52ed-11f1-8ff5-005056999439
Received: from mta.kpnmail.nl (unknown [10.31.161.188])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 8ccc8d4e-52ed-11f1-8ff5-005056999439;
	Mon, 18 May 2026 21:12:44 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 8ccbad44-52ed-11f1-8100-00505699693e;
	Mon, 18 May 2026 21:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=adHY4CLlTuiLNPqIKKzgE6NNmBvgAxDPMlJpzq0YbKk=;
	b=Y5c2fpYvOj8scPPheYuVdcdnrAvrG1nQwxB8tUic3BNjtBQu8dhomsnVJ3oq5irhnXxP34kX666eX
	 Oz6OgnCHh+mjSx6p9e0v7s6snNJJOOBcCyySV0uWg/QInuFaHmzdmIt1T85fUpcaFQslu7kXB6LyHU
	 bGXIx2OiYsyOUfGj5+gn622sbKTKB6aIeXob/skKYG7IqYj4ADrI9+5xkhxiH87jcTU6PSTVg4VyyX
	 vcG3f71KEZ3DmkxDcYP+S6iMaFV3m4c+cXhjMjRo96sDLBzmhQTo0iZJ2Upfb3S0uF/AZ3AK96Rjg8
	 Fm38Iuwj7Mduheomd3owWvlVwYs8PZg==
X-KPN-MID: 33|aPr5lIFFR8FZFUz9enzXsOUEwuXlwKkPXE6ZDydomPV/UKV5eqeWJFr2Qc+3EFS
 HZsl6LFTPOytULr6nfQVpSwTvmsU/0Z3V0hrfo7L2KM4=
X-CMASSUN: 33|0TN+CHvQzNLjlKhT2m7MJzGdL4mM8wkiXm7gU/FEbD+MJndZsImj/HZPTMt5FJV
 D/N1j4mdEKUpBEHWrBfswKw==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh03 (cpxoxapps-mh03.personalcloud.so.kpn.org [10.128.135.209])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 8cbbe7ed-52ed-11f1-94b1-00505699eff2;
	Mon, 18 May 2026 21:12:44 +0200 (CEST)
Date: Mon, 18 May 2026 21:12:44 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Mark Brown <broonie@kernel.org>,
	Dorjoy Chowdhury <dorjoychy111@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>,
	Aleksa Sarai <aleksa@amutable.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <1286370201.1726989.1779131564699@kpc.webmail.kpnmail.nl>
In-Reply-To: <e221b631-00bf-44b5-865b-ac970e6cb11f@sirena.org.uk>
References: <agruPPybCx8q2XcJ@sirena.org.uk>
 <c34d1f0e-0707-40cc-b0c7-7b2648ec1863@sirena.org.uk>
 <CAFfO_h5QdRG2ptyuGRQtqxrpndwan98aOsX92bvN4hyvpgLPMA@mail.gmail.com>
 <e221b631-00bf-44b5-865b-ac970e6cb11f@sirena.org.uk>
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

> Op 18-05-2026 19:13 CEST schreef Mark Brown <broonie@kernel.org>:
> 
> Figured it'd be an arch specific version of a similar thing - I didn't
> audit them as you can see.
> 

These confusions with octal numbers in lists that aren't even ordered is
why I would prefer to use shifted values instead. I don't see any reason
actually why we should not just convert them all, apart from churning and
perhaps not doing it correctly (which would be bad). My rationale for mixing
was to use 1 << n at least for the remaining bits. If I remember correctly,
this is also what Aleksa preferred.

Thanks for looking into this,
Jori.
