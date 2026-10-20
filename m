Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792487565;
	b=agQgU2lfD7NqOkBWlwdZImAcgxyaoJA3Cif0ozvo/DRrLMjgU1FDNQ9p0NmQXz7n6O1L
	 GPG32+P+auPP6e3I4TtHSup8DgEpRMHBb7feTZ5fg5VV74/WTgVE2UN7E8CFmLmAPgNj0
	 0FF+v6l3ZI2051RHShily7I5VYCnbFAEIGWOAfznAR4HdTx+3ZSljo9eUv9VBbYy/TRJv
	 Amy5DHCM8DGi+lrdFrAdeU9HWYopKEEyMc1XOUF4SHE0OE72t17zyKl2wmGWH4QH6wsj8
	 fjZGDyoKHEfVfmoyw09diYitbEvXO8aO3S0C9IYFLIrJ5hfV98x2CMOUz04+ME1fK7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487565;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ws/nAel3gKigB9xjBOx8xYnJzYDjiCbjwmjPbmNoQBg=;
	b=Cdp/ZsjERbFFrUTmhZTybRLYmhyNLhyuU50X+Hzc99cH/lRHILd/NFVF05p8sZAGAqOE
	 jpM8ZcxugW7xoHWcvSHktBjDQdDS7SWvB0ostL4eZmrdsp3upboOlV9wjETBa//sUK7c7
	 6LOvXjLJhkhGDTqaSOJ94yrjBG3xsbQA2Q+25wkB/2H703ergKQM9cHRwAoxdEQ0tm6ZL
	 XXVfkeGcOQoVDGSr8729RSqI9L6Ug1hg20mxYQBmbQkQdmtGdcb4UDw/D51ji5crmpxic
	 /B8OcXqqiBJLw8evOKx12jAb3u9otJ0Kmkn68pYEC4rQGIzvirurse4+POduVrulITQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c1Ae35cs;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RjpmwlSO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF52606A31A
	for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 09:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF52606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c1Ae35cs;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RjpmwlSO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792487563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ws/nAel3gKigB9xjBOx8xYnJzYDjiCbjwmjPbmNoQBg=;
	b=c1Ae35cs1ZYbh5DhIE+oo1+/+GRPUGxlpM9P04Swkwpk91/cIHfoN7vytXTqtBZtH3wctR
	D3YcA3ptXG/aUbNv67T+BWsKELGp5v+bomoes4lGfCYltw4zNfglG5S+V7zwpmNpl7QGXr
	u24JSWuKhZr+GivcUK/Fik5r+JYEkkU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-ei8WpkpYPfW89ig_UGRCKA-1; Tue, 20 Oct 2026 09:12:42 +0000
X-MC-Unique: ei8WpkpYPfW89ig_UGRCKA-1
X-Mimecast-MFC-AGG-ID: ei8WpkpYPfW89ig_UGRCKA_1792487561
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48dfdc0f491so1617107f8f.1
        for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 02:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792487561; cv=none;
        d=google.com; s=arc-20260327;
        b=ma782/jGa59w0AzfxjVDCx+pSKI3mSD+dXABa88WGKsvZ/EPT9j+xdByWdTIIimE7g
         l9vqsyglu6gPtakP5RTWRrdPnof9zRCm6wadbeRxORqo7jh+hBpVncsPH3dMJhsfHLER
         7mhr2AJIzYYJgm2LNeXGa9FVRUeNxV4wrqc6g2bAdmDx+7kzS6xja3xW9t7L4931Mirv
         xYIi6InevOKEbCV6qrJ0xtLcITpUeLdzcVirTbXieFMKCBEiaPN6KeAwFgjM7C0MJIMB
         MyUeXOIgPWiBCVSxxw9RZFahcpopePFSggRcHAeHX9ckepC6cJrA69sf55OUjFSjhLJn
         WXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ws/nAel3gKigB9xjBOx8xYnJzYDjiCbjwmjPbmNoQBg=;
        fh=GTDFJuF/ERbGfTAstKEBwJYuN/rGL4LWD1nCY8+Ofhk=;
        b=iRRaYXVRZsvhOOUJSUqIc6nXpbUAMtSAZANPBZBObUt8nes5ZvTI6Fsj2ueV+PeDpK
         o40ffHkTIfwCsW2/GeDAs8m1KMxTcRUdWfrXkouEwzxLsjRgL1jFR0asitGRX7jWJZ7d
         Whn2aukE4iYhB5wm+6wxJDzH8jhO2a4DqsgmYwHUnT5xLjL6t4MXGzyT9CgSG4jOVRmL
         xR9MqMnyalqOkrm1Xg3k1Oki8njbMiDNasp8+CabYGoXuRJIH2lBghhd7EEJXzsftAD/
         Dsf/NbHIjq7sSgMHgpa761bw/NxzmkXI5O4AtkFMzlHPstUrSx3b3gpQtzI3QrLu7G7o
         dVqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792487561; x=1793092361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ws/nAel3gKigB9xjBOx8xYnJzYDjiCbjwmjPbmNoQBg=;
        b=RjpmwlSO5deu6v74SbJFeC+/cs6rPQCcxOwX+77f1JeZA9FUx7TmEOYQ3GWV2/O1Ar
         ENJBEE4VhEMJgncIoI36mOfKZbYA6rnhiIynRSOn67MKm3rM3wl59yZPG1KOmRxbQfPo
         HmzNRMfIpvTnVxFcFENkgTTdMbNuTO4fRgeehP/p0DX8LwrUvzLLBWZwfw5soBpBs+pY
         3qSiD1P5XYAVD4zmRr9S0NylvmdMIsLf7QGVh4VfSENaDj2ZtfPJks1YFfHT2I+dkWH+
         8/EWntvDVjHooscn5wxLkMcLJ98hgkIVS5Zes3TWBqgsRobUmDmfNmWb0b/18vmYcsd2
         wNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487561; x=1793092361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ws/nAel3gKigB9xjBOx8xYnJzYDjiCbjwmjPbmNoQBg=;
        b=sHJs4iNwKmjE4lzHpbcTE8zfd0PtdH4LuWQ314I7+VggCRBP6jz8qumBunzqZHVwLj
         iZ2vk3rZVxfVxL7TH/6W3j69gMKx8lKbD+XWXOF1KXaocc/NsnHUlfSA411tBOhLmByO
         hpaW+lrNWyvhRch5UMgXskG80nuX0ftCqHTF83AfW9jERUf4FRv+Cpf2lE5PaDtF3itr
         WEVTPvC5VIH5YqRGjIE6yanj6M4TLgP66J/0Et1u80+1md18qGlx4tgV2gK/5a3AkqFE
         c3WsgJlU7YGgSnOxuJbbM5t32NkV0EHaaiKt5P1YWd/7Xk+zXJu4zpFUtgXqXj99+oT3
         gm3Q==
X-Forwarded-Encrypted: i=1; AKwUvBz98V5Gs42CARj1p2lWPZwOElQn7RHkLBCTnJADM2qBl7uGWnzOBScqPUA52MtehkYt/ffFg42W8XqW@vger.kernel.org
X-Gm-Message-State: AFq9FYK/Pi6I/wB2UtCi3gebG+CsuNfKeoWru6HqZeLBXWsEdJvJxUyT
	L2GKBEhj+HpKbZaCI1oKM3VWkj36FBlEW9qZt5WEeYnJ7mTBbk0PsLJ2b7eqPuUGFLktyE/PSDf
	1MfYQB5DQ7ywMlJli9z4WN34+cjOE3Io9gVlW9iMqNPuy7WddX9TakbnpOfcAHvnBzVM1hV0Jt6
	VqItFUxDlnkGjCp49RrB8zn2y2Wxt9tBAmlWAd8A==
X-Gm-Gg: AYBFou2p3eO2nO2RvNjpDey6ErT7cDGbVtH/OnvnkcR5Yz6QTaq6QuQ07Sm1j4WFSEZ
	1OtI5t4zVCrZK9qiJ4ZjHsvwZVyGVZWkNQpmqmNOgaqS6cEmqTRd6Vlhi1qGI2WqhTR6DCroiks
	6CbPHqYM6rLzm8yhdvunm5ElBKtu90xtg1UeclSICzFW80CZo7lPGFq4bN3JQKHJhe7CIUeBnMd
	SBtahM8Pl6HbOhgDflkJxH/y8OQYjViFkNKbah7mRhu1wA8QkieOsfvai+UkA==
X-Received: by 2002:adf:e6c4:0:b0:48a:fe3b:64b7 with SMTP id ffacd0b85a97d-48e07fbbd81mr15612503f8f.53.1792487561021;
        Tue, 20 Oct 2026 02:12:41 -0700 (PDT)
X-Received: by 2002:adf:e6c4:0:b0:48a:fe3b:64b7 with SMTP id
 ffacd0b85a97d-48e07fbbd81mr15612464f8f.53.1792487560497; Tue, 20 Oct 2026
 02:12:40 -0700 (PDT)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atZJV1B79VsZoy8u@sirena.co.uk> <CABgObfYRYCrOj-rHDaDd3LSFMSd0ug-YoB2pD7jDA8ZgMR0sCA@mail.gmail.com>
 <86wlrczvyl.wl-maz@kernel.org>
In-Reply-To: <86wlrczvyl.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 20 Oct 2026 11:12:28 +0200
X-Gm-Features: AclHuK-CANssAdVajcJL7_fA2sG8dYMTVFsVqplrwOo8ywfc31IgZ0Xj8SjnqCI
Message-ID: <CABgObfboCa74iJg7SgGqP1emsETwd-oSZG57p9XARYv89tdScQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the kvm tree
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Oliver Upton <oupton@kernel.org>, KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 9:13=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
> > Hi Marc/Oliver, is this something that will be fixed on your side by re=
basing?
>
> Yes. As soon as you have a stable tag on your side, I'll remerge the
> fix branches on that, and all will be forgiven.

I have pushed both the next branch and tags/for-linus to kvm.git, so
you can go ahead.

Paolo

