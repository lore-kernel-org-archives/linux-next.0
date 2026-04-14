Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89143E6DDC
	for <linux-next@vger.kernel.org>; Tue, 14 Apr 2026 13:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776172363; cv=pass; b=kJfly8yr0pQeVhKi1pz3SY4LRHc4qFn/Sf88C4NoD3MlrnlBTHEe401b08qjFcFMpB8OrSqor9xPPb7v03wUZund5I0Q8rK1IcORgZ7OQqrGgcMeI2yUNhqeZNW4+sxYZUzGNdVUTvUZu3f60S1IuwXZOpBLMSHWbyF7jHV//3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776172363; c=relaxed/simple;
	bh=cJCyWhaQh+dfqiwdnSlBVQv4RVtGz2mIxk16V6nAUYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZFvWHqI0IS9GqFC8TO1FmfcKrpA071RnAD21CNfYtfTLJREEmdqF+Opr9pfSaHYwCpZ64G+D2nrMWOqtOK/7L9dIIAdlVe8ihyMPtF+fv6mS2sdLaKfuSm0SZfUFn1mb2DJFcMHNt2TpBVcnO/LIwK1h285Ea461N7qam6SHmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TltEbbFy; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TltEbbFy"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bda3b4318dso223520eec.1
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2026 06:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776172361; cv=none;
        d=google.com; s=arc-20240605;
        b=kg4JtWSEKJO13Cb75lMFTlEiWnNuVRfNZSQkFMWK7EaY44Ulh+qWEI74R3WeodZGiK
         ft8uhgOb3GfKMREJ6Xnm+AJO3sheYAZgjaxJN0kT0t+PWX+oZdGAmbBARlaR7qyi0VUE
         aoB1CHJuxi+TdXNW75XtDY+xwIpcOwZIuEaRYtLzN/QmtQLxjvapka7lTG5BtZTJwixN
         /ZUIanaLN7162xUM5BaYZvfGozt6IfUMkF1JM4fcu7GHSNUOyMPwnLJ9Ot+KE5dmtl6e
         W0qQbP3w7w+wK5TMj7PJj1XA5cmjM35YmdFG0ZfeDC8Z6mRSRlkdop2LCU9O6hm93PwD
         QLag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cJCyWhaQh+dfqiwdnSlBVQv4RVtGz2mIxk16V6nAUYk=;
        fh=AjiJrBM2HleJmUh0Fo6Vx4b4/DaCKrIn5iTTj2fZHdo=;
        b=Xs3frXendtSAN+mA60h6zQW+XLFhlqhGvTVSEOGvC4d/DewTWubdkx0w6HBSXeSFuD
         q/E0dHUTe8ezrrocJolYWHk0R3ybkIfHIQ/cVKWIE+x3Njy5O6BIpK1wEvqLVazmVS4H
         Y6EALejQw3WG1oVP+kwqVMG28MEtp9U0gUheUhpnVK6kxF+sqmukYAbqrnSrtTpPrDHg
         enr+3OejdyB6UW8wQ4pRcsUdO9gcZuBpCxLDfmwjzXUEBIQde+gpMz5hVJtPUBi0x3ao
         4/+55d3bXLDBRtRlqwpSTeb9DXhSqQTZmmp2fTqTKsYrgcwnde6Ikm3t8U1XWMxIM5RM
         A+ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776172361; x=1776777161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJCyWhaQh+dfqiwdnSlBVQv4RVtGz2mIxk16V6nAUYk=;
        b=TltEbbFyKG9mKBdv8DaACTFbo+R+MdsZU16lFeNAXbcNX55suPoivvDMtqxknbx3U5
         DkvJQJqCMXCG5GT+NlOphbo9L+/1ygnTJ+j3E6SoCV5E67lC6mdsrfiy9qu53WwB+9ec
         odhF0nb5eBfRToKj5PzjQ0qZecSXW+hm6PQR7EnDeL2WnnKHZtk3vS8tBvBOfnJxzx+T
         jA/T3P+sfOeC8D9IZ6lvk5vU1BkRljs2AngyECuvPIyf4+ShEexXebkqGJrcgDYXrchw
         rqc1qStbRC2+4bNfKjS2W7l13nEJhHzrUnHfRfGOnw6RwSJ9I5Wc6y3SdQ9khf9KrCE2
         f/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776172361; x=1776777161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cJCyWhaQh+dfqiwdnSlBVQv4RVtGz2mIxk16V6nAUYk=;
        b=mRT31ymmUQe/V7lLXktw1Xu374+R2bQLcJNSvvx1gFs/V18ffv+aYH0N4h7FaC/2ya
         wgTxJXTMo/4OdBA2RfHRnV7Usd/uOT5fDB3Et7bPJ9Gc5+jLzJZNwNusAvBZDoQt8sbT
         4H8uJnJqJ/tbzX9xwGLWVB2+Ji9zZ9RJ3qGkB7Hpl7sE95CvccDmr00916FRLtwZ4wfA
         qnNyaVlz6nQeTlyBuLAFRq/dsTx+G5+2YNGb6c4pXqc3u3AWlyqkHz6LcCybPxXOSEz3
         OT4YfwFjnBz03jmg0uYYebj8dMn2rxqqoNIbM3SoE9x32RsYfAlm2+y+sIU1AjehjIOU
         UDQA==
X-Forwarded-Encrypted: i=1; AFNElJ8H6l+ho3vh9dyN/AG4iOLQdhqSuh6G/o4oEOVW+khbTOkcQILB3Mxou7MBwpwT93epXTKNm1WEGvMk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+N6KkrOD50YXL3/dFlEoCfj0sGrhuoptTi25q0VfJ8d1aoitJ
	IAzbVCWaUbNbMKPsuFyxr9xInLHCVqV63K8vQ7XM5bUBxVVCt0UY9gluktfZ65xoAtW5b3YB8Mn
	/ZIr3IYgjTAHLpMunOcnjA6z/h7Gbj+P/4GIoRLA=
X-Gm-Gg: AeBDievLODDFnxsdu1X+pryv0qJIiELJE5hSzLlPCG3DxeE6mJeIqa1UCHHg/NciVvo
	tZbVaqo+2SHccStOgCi7E2M0TQ39fSF4Mrm8ddlzV4QjyWefRP5XFzuOi8CUom+ste7USgLgnan
	rx3ncafWc3fw+hjM3iFbpU4A0xI671H+Td8ODk+5caefYeGu1JanTdlJOqdOKA0vaDjgNgOYKid
	9MzaSfvjESim3IMLjzJYEtkzlJN2DbeV7Ltj5qo/kAe/B4F9Oq8UqvzT26V1EFPMv55aY2XN/e9
	nwd2lBV2HUh1gSzEb3/29zfuWufVg+rFyWYVLiJx68FLQDqLhI4sVHuw4BpDgfBOVg90MLmx6dX
	AWUPDUMXFeuVtjVj3hZUBKYg=
X-Received: by 2002:a05:693c:2c11:b0:2c5:704f:7157 with SMTP id
 5a478bee46e88-2d5c1a338bamr3845752eec.2.1776172360757; Tue, 14 Apr 2026
 06:12:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ad48Pf2DA23y3c4W@sirena.org.uk>
In-Reply-To: <ad48Pf2DA23y3c4W@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Apr 2026 15:12:28 +0200
X-Gm-Features: AQROBzB964S541knBoTBpwId0xFwqsKuV9v54QthQj8L_G5grI3JHKNqIkVHJ3k
Message-ID: <CANiq72n3vcEnQFiDbobz2nXT6h4DTNecTqLuphwJG+EAt9zhhQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, Danilo Krummrich <dakr@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 3:08=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I fixed it up (see below) and can carry the fix as necessary.

Looks fine, thanks!

Cheers,
Miguel
