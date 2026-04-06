Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C658322068D
	for <linux-next@vger.kernel.org>; Mon,  6 Apr 2026 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481425; cv=pass; b=p7Py8pMIVYwSewXo/xsa4oVcHwkgOtATDY8zxIIgS/DlBvsetKeqg4xhjeJQ3jDnS6R7UTLnh484muzRLd2Pd/eOrTMRPlTllufTPnLvN3j1Clt5vOnCKPTivUJcf2kGv7I8OwH65aMrax14Qj+KD9hCuwIHQ6+jo0rfzihWARU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481425; c=relaxed/simple;
	bh=OFGeBR0mxVQk0cMbtkLzegoCZKqSQpTXqWH87cKvyIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYy/4vOa5fXDz3LoySLUgrx3s0S5s/OUGbVhGtRxxKtjUIum7n6i/sm7eEqbcps25YtHYgxSeOaw6h62vBqR08kkRz4Mdr1nh42+qPMzt3hCos2XYJqQi07X1XUFrAA2gGGApEX2JAlRkOWz+GyQ8V+o78jUZ9f1vXyedz+FufM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlTlVHTd; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlTlVHTd"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c6f5574d07so173397eec.0
        for <linux-next@vger.kernel.org>; Mon, 06 Apr 2026 06:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481424; cv=none;
        d=google.com; s=arc-20240605;
        b=Hyom1Dxctb8AeUKordmFiC8CVog1eigxpQfNEd+kgtc1FKHpNvZDhB1U+fZn8XENTw
         PO3Z7cGhbgP6wLSV3Le/7kyRFw5T4Zb6C8v5vUoQ7E/nfgmSYmGNahSUL1M8tJejCAgb
         NfJucXLzRmZqfXzqCchDU/Sirgygf2YAbFl1cY7EeCsH8OWxlyXY6+783pip5g4Txqvd
         JGvINcWZVq63BJu4i6HYJmaRzgWsm6KwUC06TpC945c59UO9/BbfpL2eMaNIHeE2ZD6+
         2S72fpClk9I2xfSX8TJF33gTp0HD17PUEXiGVpZyudTbJTc0G1wrM7fJgfZx/hwGiRaS
         Agxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFGeBR0mxVQk0cMbtkLzegoCZKqSQpTXqWH87cKvyIA=;
        fh=RoqsRO9aaMlevzPBK1Ci1PVT+JKah8EfgY1+aRDZ/gE=;
        b=U9hcLYDhgmeehDNSA835AKeNUcV1v9efUoSS+U7TlSgdSxPO0pQv8x5mTtwd2gazmq
         owkiovHg5kNz+LV//VFlWFhTz5p3rVjk5YIuvllU6Tby46BRlGHbBxZj2zANwAHjSW2t
         uLOJOPSf9t7Ycn15kcOakJQQvMFWdNbfNTOaVH+xHP8rh9WITwBAIdVrQKGU7EogvZVp
         HLI5DvIAe25U8LiNaE4Fef6IpROZHC6nN61OAPbER59nP++02URY4L5Yf5Cs9VxejvEG
         8Q+7C7j3U990qtu/oiWg6slJWZ82XaBB124VB8r2SECzzTL8XFJmibzqq7vbyQ56bRMa
         iJCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775481424; x=1776086224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFGeBR0mxVQk0cMbtkLzegoCZKqSQpTXqWH87cKvyIA=;
        b=VlTlVHTds7CA/OLTKsf3cHAuayJdip3al5zUbpa3EWf2kboS2Fgz3OyJXBim93D9A0
         EmKbWm5pPHrtf5fTu5WmKm6bdFQCnLG2SIF/mzZUAi5DNSr8uaQgZfb11fdoO91Pn0Fi
         mFyXjpXssuoGcBWFizVfQ7PNLj+1N/WRwxidoVzqKeJtCWamqpCVN90sfz5JjE5N43v3
         KbDGfNBMu0u+dEplCilNIRkOYkITmG4ol3vfPqXTIHKiijzxLh/IeRmjSRuNOwocyngO
         CVWr0tswTyvpk0OOlsIIANYOZgfyXdBELC+NCvcE7bMkSqv3O6WI0weGuV9xqYXTLqJj
         V75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481424; x=1776086224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OFGeBR0mxVQk0cMbtkLzegoCZKqSQpTXqWH87cKvyIA=;
        b=amakoonyeqHHoY+GDhiZCqQFmVBllA8M4BWTzsp4JFuvGGhkv8a0viQ+XDR6f+BnZV
         x2nWKNh0qfasKX/+rpy+LaZQKEqSrmLTw6b7hk39Z3QLQ4QIz6Dk3OLvR3fiTa/hyzRM
         O/lHjqY5YHEVmR7a1NJdpoLRnUoEZvRWqL5bUq/NYNkxnG+7wR5Youn1VQgHbLRR2mQv
         sVXYm0a2BW8AY+B3DEqvZMtLKN6d4efBiYxwSGkTr3sk3UGGPkfhDznxfZCE/LTEM7/b
         tfig59DZdxSA7jS9RAQSprYj5NMurgXbh1TxBzOEqAgs7VAsoTrRH1U+w2Y0FetmEhD4
         J9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXvc8RZgkkY5yiuJM34vSAcyRlr05bX24bsYdoNACSIzO/5BNEmYe10ET7BKbbhMjI6zjbftt8QOGeS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7fUoXne7dxPJOQ0h+kVKbbNavaXF1sTNLusu+D8mddn8niwHz
	0Q2ocZ5E/6UwvWKBWtCqBRJ1IHQi+F+eONgAFLHRTwEBSHvZy8HvqSQQGuappJHuKDoSJA2jLm1
	o+3GWIdFfJ1Yt9j3q0ZdFXI4uxco/pMaor5ugzYw=
X-Gm-Gg: AeBDietsaUGQM5On0gVzWsbhkL1R2ZxbsIeqbnO20qytqCBCmi7GFaR+rIvakoFrltE
	ioE1FjFHb/sRtCQQ7JnETi1R/Jb2MX+9iBWQ3IXIzY2pbifiablMA2qcLEv+huNvf3i0UWbUbjp
	gt7z9dgjqXMS8zUsBfzoSnEym4SqBLK9Jjoxku8HS7PYRWC4yyd83cuyawFPY89lqPSK9lW5atk
	pgAj426vLStIWEuU7Q5G1cE/jHbFXCav52Ti48B7AMSFsen1oUZELTkeNin1zSf0t7/qmja9OI6
	2KGuZ4/sT39fkA5SEvI2GGmSOK4trD3CjqUglWd9VxMbNhUDYOxLPzd/NLFP/xjiqBsS7Aw3LKC
	nWhvAXdm75N8PZp+SUYVtRJM=
X-Received: by 2002:a05:693c:2b02:b0:2cb:6653:ea05 with SMTP id
 5a478bee46e88-2cbfcf5295fmr2694470eec.4.1775481423905; Mon, 06 Apr 2026
 06:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adOxmJeAu9XZWpUn@sirena.org.uk>
In-Reply-To: <adOxmJeAu9XZWpUn@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 15:16:50 +0200
X-Gm-Features: AQROBzDlFmr0tCXuXz2RAbGSitslUJQWVRgj0etTkhX_gSdWL28wn3l_C7dvkCA
Message-ID: <CANiq72k-Q9w2yL+XHOiobCpHmxQRv2B8dzXB62Tn+s=xRs1i5A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the jc_docs tree with the rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Manuel Ebner <manuelebner@mailbox.org>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 3:14=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> I fixed it up (see below) and can carry the fix as necessary.

Looks good, thanks!

Cheers,
Miguel
