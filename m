Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F0735AC03
	for <linux-next@vger.kernel.org>; Wed,  3 Jun 2026 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495571; cv=none; b=J2Iv5WMhU5ETSbKvaLAC6sD4b5D1g7U1Ql8WQ523dPiMOJgqyJZo+NGpREpzWTWVXMmVOgKCNHvmEF/s5oZKIRrqSZ8/1vy/lsG19480gZlfGNjJjDKdTiwemqFC/n/gVQQVBzkA93QRBAkyz76dOrhBMltJ9HHqWtK/HXc+dGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495571; c=relaxed/simple;
	bh=HjO7vddhYsPwChXKFBl3Y+JiBam2ih96zMTlfY++8f4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=XURfXZ8wHH8PkoA0ieB/vvOb60rBITsCJRrFuXKJKufUzcgqWAhUT6EIWnU9poE+BwtveKQmp53eJ0vm/S9JyKZf09IBtiLMIFRlOaw2itXnEYaOjpB0r/tPepzu96tA8NPPMHCgV6lx96+2agQCIsZ0BfWfCj9nab6rW4T5xac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=FNRf1YjM; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="FNRf1YjM"
X-KPN-MessageId: 5ab893e2-5f55-11f1-beaa-005056992ed3
Received: from mta.kpnmail.nl (unknown [10.31.161.189])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 5ab893e2-5f55-11f1-beaa-005056992ed3;
	Wed, 03 Jun 2026 16:06:02 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.190])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 5ab3b462-5f55-11f1-b5d4-0050569981f5;
	Wed, 03 Jun 2026 16:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=Ysd3Tr7sviCXhmLJMfXd0EITmdZ6zduNobhslfZZGwc=;
	b=FNRf1YjMbp7phTpZkc5jHi9Noz+R57Uz3f5BwvS9iGXd2JD6xbbn/hdYr91r+1htHJDc29nIruh0A
	 X6eBy2TeGCVwBJQnD/hc69pQqaHAWD3aUPe5CTN7gO07HsyNw7C33deTAxszaO83+jaDoGcJflij44
	 VQMDc2wckyclyxWkbOmNPSZ0+SUtGc9uKPM/1EVFMBbb90ERGddtvnqJM5MH3V+OYNuvnIv8H966yR
	 G6SR/+yxZm2L2VVhbFHLokAmESAqRcehQ0oHPiYqtgVW6AzjKZRVuxjj+OZvbmC7fbb4tiCkJeKgBD
	 u9UQqJzV9e50YcWkpXG1AOvXimoBaKA==
X-KPN-MID: 33|JyizkOMBhMDVskPHSlPsez2WkY84fL9+zIAaL6yaI4eUtnRB2Pd6B/TYJx+7Kt4
 krFLyXm8zdcmO6nOYHKrg7HE3U5LAzjpfhBuEh7MDB7M=
X-CMASSUN: 33|Qt6kn3OahuelUnGwYtgz6mhUKAqPvBSR7CQbMaXkG4XmXVLVoMFYMW9z30UVtsq
 XDiDkxC3xy2rZSS8cJu1/tw==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh07 (cpxoxapps-mh07.personalcloud.so.kpn.org [10.128.135.213])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 5aaa5059-5f55-11f1-b8d7-005056995d6c;
	Wed, 03 Jun 2026 16:06:02 +0200 (CEST)
Date: Wed, 3 Jun 2026 16:06:02 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Aleksa Sarai <aleksa@amutable.com>
Cc: Mark Brown <broonie@kernel.org>,
	Dorjoy Chowdhury <dorjoychy111@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Christian Brauner <brauner@kernel.org>
Message-ID: <1252517387.391165.1780495562312@kpc.webmail.kpnmail.nl>
In-Reply-To: <2026-05-27-yapping-angled-spoof-tunic-AYfaAV@amutable.com>
References: <agruPPybCx8q2XcJ@sirena.org.uk>
 <c34d1f0e-0707-40cc-b0c7-7b2648ec1863@sirena.org.uk>
 <CAFfO_h5QdRG2ptyuGRQtqxrpndwan98aOsX92bvN4hyvpgLPMA@mail.gmail.com>
 <e221b631-00bf-44b5-865b-ac970e6cb11f@sirena.org.uk>
 <1286370201.1726989.1779131564699@kpc.webmail.kpnmail.nl>
 <4bd253fa-c363-43cb-adaa-0248ac707a0d@sirena.org.uk>
 <12198575.2129298.1779371885282@kpc.webmail.kpnmail.nl>
 <20260527-bordstein-reizt-gemindert-a76319be86a1@brauner>
 <2026-05-27-yapping-angled-spoof-tunic-AYfaAV@amutable.com>
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


> Op 27-05-2026 15:09 CEST schreef Aleksa Sarai <aleksa@amutable.com>:
> 
> If we could also get some comments in asm-generic that tell you which
> flag bits are "cursed", that would also be quite great. My impression is
> a fair number of people forget to check the arch-specific headers, so
> having a note in the generic one would let us avoid this issue in future
> (and IMHO will be more effective than just switching from octal).
> 

Just to be sure, what do you mean by cursed here? Maybe just a reminder that
there are arch-specific O_ flags? A list of all of them that may have an
arch specific redefinition is basically all of them...

Best,
Jori.
