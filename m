Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264793F39C2
	for <linux-next@vger.kernel.org>; Thu, 28 May 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974628; cv=pass; b=YVvEDBog0vBNk0OC+97w8/j3tJaT6sTj4sXf/Lv3BUDyIL5ax9FmwRz0bj8rrFbmnjhKWQM2Pmc/OZsj76mDnxslGttvo29tlJiV1WthFAbIHgF11p3l8o44PXUBualk82MpJH8mzbCujW03fL/bV1ekEtN+zmNRHNHI4B7uG+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974628; c=relaxed/simple;
	bh=UkOFzSFECKhnU2YCO76iNNZZH6fL/SSbPNgksZclklg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQKb9L8Asw8c+moDkVFU7nHyBm0FMBIZoh0i4v6MBMwQGPiM6AUoz8NesntUxUSeTtwpl+5kpAqjEaonrEc3rzmeo8FAlhjqwOagaZ+pKMuAJqbeJiL/Z2TpIHaXvskM7hJomRAcR+3XR263SJ4ML7e9uQXYQgPvfvNCvOVKVPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgXMWsi4; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgXMWsi4"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30436e8f582so790754eec.3
        for <linux-next@vger.kernel.org>; Thu, 28 May 2026 06:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779974626; cv=none;
        d=google.com; s=arc-20240605;
        b=PDZ7FlCk2t6CdM0/sPdz93XpouiH2/U0RkqFzAyRDIBFGc0kaA6QlTOItFCn5M6u9V
         R7OVIrUpxgSmeHHYZskTh+gom7CmuaTmVlMwGgvjBsVKSL7GrL7Mk4PzZ9fL64RVcLgX
         UqcJzlAy98KOs295aNj5+5R6/qynXS+hkQvzCh4aOCpaI20JyIgB+W7nV55QfShrkIiz
         YwtUeHHMftxcumxg8OV7HNLEaZYhfm4Bxyl2vp8QwX9oLXLP9Z1ZJDbWEzlTEkrw7nB3
         kjft9LGbwNqt8FAfRlX4PvWjtJQhrVhGltR2NEb3drhZNRQevTAuKbs7ZZb0dNxwMjWh
         cPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NTjR17fCdCBNVqa5jkC2DzyOTsw1D4LA4/jAUz2HMCU=;
        fh=jU6gGgJmqmAvNTZx+oWMfqj48oYcVSRLxU7vIcFJaJo=;
        b=fpfH1NS8hqD9vxn7uDz+JgfGtoOeaGFDHetK4Btz2hJ6DsPz+PqIGuFwRnzzLqbLxK
         nuAfvXJN6UR/GhOQ2CMIxU8m5HtMQd9uzNixoAHYiFcjuf5vBN2FIvYuf3x/RX02prPc
         Z61UMWX3ermhooR5kbuusWX/nroNgG2rmd6LN8YSPqmCmzI/YJLEUW5TaVVxVyMhTrs6
         VAmpC64k6Mu2P6LEoOH4xmmbkKKvnrS0/l54kbPAOssAvDeve87CBpS03LBDICf2sCC9
         KYPb6A9GiHwnmozwEKYF4v3ZVjdRegh8ZWPVoMqQTcgn6a+SlPhzt4GnlgrfVDmT7FAm
         w+ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779974626; x=1780579426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTjR17fCdCBNVqa5jkC2DzyOTsw1D4LA4/jAUz2HMCU=;
        b=UgXMWsi4WRWJF+1drS5ntdbByedBTZevhNcXuzG88gucyV+autL5eI8/T+leLlNVBw
         yK5Ah1gKKH9V6M6i/f0PJvJM9wCpr2FcQX3ZyyYnTKAh+oMDWnBM2FpamoDUg6Jr1fXc
         EV/LJkG9SaYrykTpMNqiILpkR5KzdUAwZeIR3zO+r+srDQf/45VRKiS8of1s9wSiBRk0
         S2Q+dgXHXZ3+ftub2a/OuIdF8E9toizlO4Ox/t3TbifXylrLQNm/0RjEB2+Dugsrbj3p
         3ihfnFfW8QDpigGCWteJLHAQf9Py65I1OBuTMKoYa1omYz+XbA3a9w2sZBEipBlCCX2X
         B+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974626; x=1780579426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NTjR17fCdCBNVqa5jkC2DzyOTsw1D4LA4/jAUz2HMCU=;
        b=ovvlB/INxX3NE01nKjZ0QLQhV5v6JxNOo4Grg9h+WskaRuiE1di45veqh4CWCNlaZI
         GD6qHmSB7Z5NT8Yh90Tc3glxLKdiiFMjLQphxmMPAN/2wrlas+FWYwu6MsiIc2Tj5hpG
         IC/pRvAnoC/i11TqKe1MIDSmu3cby5ZegrJI/NRNoX766aNbWEcRN30taqtqpHzu/uNz
         tW07phtqb5OcNgFct7mXWDKWFuPKPHE/8GDzHwfBfC0Wa/CJhlnZ/NgKTZBS8Da2xDNt
         fBnCC+Iyz2Znh4mUtyScWtdw5rfgJPZGMPLdbAjS5cgGaCvhaQF5W9KRvEzL2OOYjtU6
         aRHw==
X-Forwarded-Encrypted: i=1; AFNElJ+Hbx19ePKVLk4cO34/uHgtHZD/f0seMYsQ/e0JyMHOeBcIHgkU1FhRuhTw6U4N8jsdDJrGB+P9CBG9@vger.kernel.org
X-Gm-Message-State: AOJu0YxaFtlmPvaJLMhV3PGDhTaFawr2jiDlbO5HTFIq3oiHFHe88aNZ
	Hs2y4MeqyUlGrK2OoAcOIejfJbUdIdBvcD7QFhUIoNAjSIxZNKM1X8IGFakhmDtdC76+wNebyBg
	NgneMnhCTzeeOymKw1sgObzTkTna1LsM=
X-Gm-Gg: Acq92OFklLK0ply7e1vTlnjat+KEqcuapa0yk8OdCJNLKOUIEklzcmh5+Dh9fAS8gtA
	CGlXBxFwm9FHev3QCkHS4mPSmTP/c1+OR9eOfMVVP9qHmf0kTGXIGsFz4Meb3j1d+IWHkoeQ760
	21pBasbMbQX8FQ6QMuRtK+bLj9NL53TyM9+Z7cSxrnPyRAp09s/Tm/W8zX9A4HjJ3wcvve6lp54
	6wZ3jTRo3FEWeVpU9ybkuSfuqH5MnPN+7j+Yrmw6lJpfbD8cNjlu7xVx2t3S9kUNNgP3jHFpy7u
	mPF3IhuAQ0G7I+WrIr3u6lFjzQlX+txsHQsxCLgAPJlVsjr8QZauY31FdvJUSkkdIm03Ep8RckP
	Y4/ClXF/Z5NT9MCe+HVs1CCyA+O1ENykPKMgWv/01F2WF
X-Received: by 2002:a05:7300:d518:b0:2dc:e799:934f with SMTP id
 5a478bee46e88-304d2eac541mr642269eec.3.1779974626152; Thu, 28 May 2026
 06:23:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ahg4XDoVOR7LD63p@sirena.org.uk>
In-Reply-To: <ahg4XDoVOR7LD63p@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 15:23:33 +0200
X-Gm-Features: AVHnY4KBny_eYsGJBX5AlgtWDSoezCQvFruw3k_VvBdYnSDDmQZZTbj9slTJ29U
Message-ID: <CANiq72kJ=iFeTCo_D1WdXhyirhOE1Rayz_DP673H_ijSCNp+Fw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 2:43=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I didn't diagnose which commit started triggering this, it's a known
> kallsyms random error AIUI.  I'm running the build with:

Yeah, we did hit that some years ago too (in a way that not even an
extra pass would make it converge) and it also went away.

Which is the hash that you used? Is it `rustc` and LLVM and `bindgen`
from Debian Stable?

Thanks!

Cheers,
Miguel
