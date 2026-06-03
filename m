Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D253385B6
	for <linux-next@vger.kernel.org>; Wed,  3 Jun 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497064; cv=none; b=X+F8PQEOHWr3v9xhDkwofmawhvbS277A+plez8BPyPT3/IGOpOqCsK5zWgOtEJil4+uqcJqDBrvs7y9oLVVjiEm9RjJNwMSUsmdQV+/Nhr76oepKGILHMPLYMdH+c7UeExq46SprcmVA+B6QM2vD2Ru6FWj/wW5XONxRFvt1RvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497064; c=relaxed/simple;
	bh=7SrM5e5PozG/IdY0KbANOeEovb1a1pxyhiit0SEKGXc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=fZJDqqle+zuI36tJSnRs6LsNYK7+AVjSwySW2R+RbQBUFNsUiobtizxFXy46LVYDHGYT5sY1UBANCji4R6BV8rTXlZUH8lG7d7vlTBfrt4zbKu9IZI9VJXN/cdT6SpyLxnQlUI2xtkkzVQLujRvxR4Xe3ZxqvVSIa06S4xL63kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=RXyiGeoQ; arc=none smtp.client-ip=195.121.94.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="RXyiGeoQ"
X-KPN-MessageId: d48e34be-5f58-11f1-afe2-005056994fde
Received: from mta.kpnmail.nl (unknown [10.31.161.191])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id d48e34be-5f58-11f1-afe2-005056994fde;
	Wed, 03 Jun 2026 16:30:55 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id d48cae91-5f58-11f1-83dd-00505699891e;
	Wed, 03 Jun 2026 16:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=H5oUn6Yqa8TT0fMnuuG1MVDtaF62o9HW8Jy3qi6NmCE=;
	b=RXyiGeoQnCg7Qozs34TXS9CbZmdDIsjri8H24foDHW8HY8QjE2Ta9zexklx+BGmnDQhgWg/ao/sSi
	 +b52xgqart32NZk089vQI3hiNgz5bNuP93Gd4m7XxKesUmHua9ukqHYlt1Y1cFPB1fWXmEMkLFoutW
	 SAPNdrRjjiEFkC3uNfsJ0XReSAX1dX0VUnZxyczDfrZiqWpXhH/kt2Y+FOpBvDgL/pm6qBbh0WAAHV
	 i2PQxQl2GFBatToasFKyEZVRtKJ/yqgdYTWigz6G45IqOkO4vY5KNDnJ+cP1jqO7MVjkkH/1cJ6yBp
	 5WX4IRixwJhjcVG8Co3BMzfidaMK6kw==
X-KPN-MID: 33|3AQueQoCnkdw8w+r/4RXnFo5jhQh8icdFQBOlpW7PK1C8cPaWwt9EtSGVw0nPeU
 l1nCq6UEvnFP6gwId4nvt3/iFItcA7kWy/dr4SgVXYhk=
X-CMASSUN: 33|bC7Mke2DltALXlaeph+IeQHvJ+dsXKDrWf4CrE+/g1TdDxPas9jQbr+1XVRLfZt
 A+VHWh8FSMI2ftGPPkYuNRA==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh07 (cpxoxapps-mh07.personalcloud.so.kpn.org [10.128.135.213])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id d4813e58-5f58-11f1-94b1-00505699eff2;
	Wed, 03 Jun 2026 16:30:55 +0200 (CEST)
Date: Wed, 3 Jun 2026 16:30:55 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: Aleksa Sarai <aleksa@amutable.com>, Mark Brown <broonie@kernel.org>,
	Dorjoy Chowdhury <dorjoychy111@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Christian Brauner <brauner@kernel.org>
Message-ID: <1923539284.396325.1780497055216@kpc.webmail.kpnmail.nl>
In-Reply-To: <2026-06-03-passive-wicked-stones-player-ciGFgM@cyphar.com>
References: <agruPPybCx8q2XcJ@sirena.org.uk>
 <c34d1f0e-0707-40cc-b0c7-7b2648ec1863@sirena.org.uk>
 <CAFfO_h5QdRG2ptyuGRQtqxrpndwan98aOsX92bvN4hyvpgLPMA@mail.gmail.com>
 <e221b631-00bf-44b5-865b-ac970e6cb11f@sirena.org.uk>
 <1286370201.1726989.1779131564699@kpc.webmail.kpnmail.nl>
 <4bd253fa-c363-43cb-adaa-0248ac707a0d@sirena.org.uk>
 <12198575.2129298.1779371885282@kpc.webmail.kpnmail.nl>
 <20260527-bordstein-reizt-gemindert-a76319be86a1@brauner>
 <2026-05-27-yapping-angled-spoof-tunic-AYfaAV@amutable.com>
 <1252517387.391165.1780495562312@kpc.webmail.kpnmail.nl>
 <2026-06-03-passive-wicked-stones-player-ciGFgM@cyphar.com>
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


> Op 03-06-2026 16:13 CEST schreef Aleksa Sarai <cyphar@cyphar.com>:
> 
>  
> On 2026-06-03, Jori Koolstra <jkoolstra@xs4all.nl> wrote:
> > 
> > > Op 27-05-2026 15:09 CEST schreef Aleksa Sarai <aleksa@amutable.com>:
> > > 
> > > If we could also get some comments in asm-generic that tell you which
> > > flag bits are "cursed", that would also be quite great. My impression is
> > > a fair number of people forget to check the arch-specific headers, so
> > > having a note in the generic one would let us avoid this issue in future
> > > (and IMHO will be more effective than just switching from octal).
> > > 
> > 
> > Just to be sure, what do you mean by cursed here? Maybe just a reminder that
> > there are arch-specific O_ flags? A list of all of them that may have an
> > arch specific redefinition is basically all of them...
> 
> I was mainly thinking of the ones that appear free but actually aren't
> -- so these are the ones where there are only arch-specific flags that
> take them.
> 
> Basically, I would prefer the list in the asm-generic header be
> something like:
> 
>  #define O_FOO 0x001
>  #define O_BAR 0x002
>  /* 0x004 must not be used -- it conflicts with flags on alpha and s390. */
>  #define O_BAZ 0x010
>  /* 0x020 must not be used -- it conflicts with flags on parisc. */
> 
> The fact that some flags have their order mixed up on different
> architectures is funny trivia but when allocating a new flag, the thing
> that trips most people up is that it looks like a flag is free in
> asm-generic but some architecture is using that flag and you'll only
> find out when someone compile-tests for that other architecture.
> 
> Depending on how many O_* flag bits we have, this might even allow us to
> enforce non-arch-specific O_* flags (like we did for syscall numbers a
> few years ago).
> 

Okay, that makes sense. But you can reuse those bits in asm-generic if you just
redefine the new O_ flag in the conflicting arch-specific fcntls, right? Maybe
we don't want that, but that leaves fewer bits in the O_ space.

> -- 
> Aleksa Sarai
> Founding Engineer at Amutable
> https://www.cyphar.com/
