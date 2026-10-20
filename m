Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792501133;
	b=rLjf3YmH+SwJU6yVg7KgCPZ0R4Ea0exFaHETKT/3AP6hIiEq9bqpOq7OCP+jA4Kp3o3J
	 Z1Tz3UrWLIYlQnSZgViqJPHLqZbQjOClGEE62RaLmpH9iGoe9VML9iDB7VZN4uiNpL4nJ
	 DhLAeHvfAx+NAahseGLAF9KrmMkm0sxVJ0LavkaFwHEis/Kt41Hv+QmhDA87KJgq/i9Pz
	 zWMKIDFfqss8v290zFpVbQ6w4Oo5nBN0nMbEbo3Y+wYnCyrFk67riLMoIB18gNlrCJhUI
	 rdBCsOPc3FcbbwtOVqgBGUfoQH2dSM8cVrySQbIQbBhBOT2PPI0SmtnPNf9NAarA0AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501133;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=VUxthBqiZaOd+FFznks+MirJZVKuej0EZmOWkfi5vpk=;
	b=qT8UaXy0A5+DEVbPrkUDOAGxEchZJaSoarcEEuUTrfpHHf37sy691kkoIa7qnoXGEdw1
	 QpdRlul0oaA5MXA2gGJkNzbMECVdKAFYOCsD/ymGT7k35vsdW7jGGKZ+q+QoBzInBYZbe
	 uaNY7YaLLn19v+/zLJke75sBx0GiARD6RiKz8K4zveZPB2TWMzilWGbI8k1IarEveTW93
	 0ia3nqM2ouPpOZU0/g7HEQAr2XQevdSOj33phYyizfUX0Vkki0hwkS5+VYJZyUCZ7fSAZ
	 A+Veq39+3IMI1QuzI+MsQuI1hU1kat8mYmOx98j+xaGcXyZaelo6CSG+4uLRY3uEI9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GA5oeREv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Wg7p6buZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDD9606A31B
	for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 12:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EDD9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GA5oeREv;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Wg7p6buZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792501132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VUxthBqiZaOd+FFznks+MirJZVKuej0EZmOWkfi5vpk=;
	b=GA5oeREv5pINVVAEDQB1JeZS4rvjNXWDxum8IzuUhGqxjP4+Etqv+xKpTUhyCVW1lstdTC
	nVKqDUtHqfawx+jG9yGdzM3w5CqX2lIdri4pv1EWWqybKECrB3B1btXi7Lqg5CYwLclzzw
	2nygl0CevQpV6A+tXhRoWWB9HjijZgk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-La08yodDPs2EB91ATtvuww-1; Tue, 20 Oct 2026 12:58:50 +0000
X-MC-Unique: La08yodDPs2EB91ATtvuww-1
X-Mimecast-MFC-AGG-ID: La08yodDPs2EB91ATtvuww_1792501130
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48b027578a4so2843209f8f.3
        for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 05:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792501129; cv=none;
        d=google.com; s=arc-20260327;
        b=mNkzK4A6njBOAwB1Ug9GFZqu9KOlaOhDNiiGNSFFzrGXrsqSrkE2NHrfGmekiri2cS
         tmL49xbEFX6Pka6fPvXV5yJ0UBt9TqtfNbXCgsn59DmtbmhzPTObyOC9f4O3iwc+KIb3
         DFSVv5exp0eyEEhJebmSldN4k4hjjVRUp10LfsnKS++2a7HFdtTQlAxU+M7lKqjS7i33
         uzayvDbBeu7IEudo8esAcCTLIElyaPPa9E3UA5euCRVpj13fxJc+nL1vn+Ba5+zQ1KWg
         RFmEXXTU1r2PPZIOOFZGpXxYFNVYcCc4wU2IU6l++qc2HdYTC/XcFXJ/bCnF8RmWWXE/
         elFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VUxthBqiZaOd+FFznks+MirJZVKuej0EZmOWkfi5vpk=;
        fh=aWWzUr2w1ao5a+TXEUV2K+vRb+tYN6T0t8dCkvlwjOI=;
        b=Hdsm5cVwXs/SqzawWXIlLqgP6et5fA7ixhA7IYA0UdXfUNJ5qpWsmUqy45o7Y/60rG
         c3ikJtJhLUQMs79cqN0csv6rK0uXwNiwMYRkxSsU1aiEoSRyZDhmMWdAeu4P3IuFDoWq
         WqXT21U681o5PRgxy9e06tF8zEjB7nNxfNW9rqPsw64GjE/H0omazSQYX1KhAqJzxqR0
         zo7nyxpJlQSPQaVoorSCYLGL/tbkDHzg2Y+AUa1wnjs8VSbmYlSbl63Z1hzwwTRKw1wH
         7dlnmq76OkkXbqlG2TdeC+pjzcRlm7vsCGcE+lj2Z5LSzV9aRlDtEvgz12Ji14BcQJIT
         iiaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792501129; x=1793105929; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUxthBqiZaOd+FFznks+MirJZVKuej0EZmOWkfi5vpk=;
        b=Wg7p6buZuipxNpz0ZdaQxziAT1GrbeVjckzLhmLQDo1l2a/gL5BbVaxUHuLM0r6TMO
         RNZYYxsSb1i+ZA28kk8sMNdPWY7EFnRRbLUkjav0ea3idgcT8vSyK2vcxgUjomdUnQqG
         LBTw7mfTU9TXN5TUed1lmm9irUxsGt5/IP++bJBMnuTMdSvJ3gji6Vr46pa/RqRNFtOr
         tSgFBuprcnq62amlw4EeoSpryudQsEkWcUjPZ1Bi50kFRMSATC1PVdTXPmibog1A1qhj
         cTl3yqaTbLSS+9awdfTKNV+shJ5h/WI7lT7HYAJKn4+c9tEIFOke9N7mMj2QzkTIYbOw
         M8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501129; x=1793105929;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VUxthBqiZaOd+FFznks+MirJZVKuej0EZmOWkfi5vpk=;
        b=auW1Qb5/Oq9dVlvvTS4fjMu7l3r2XEB31F9+Pz2ZrL6iAT31+21qIAeKs8zukRW/I+
         DzgQt2KN1/6dNxysf8hm1NWdsNPcJ2kjb2w5QkwrC00plZhNncsNq0lhT66/HkOwCigo
         3CnopEyLYU3G4FEhV8Nn7Fx2nJPQnHs9tvYVTrPk25sCcddfsXFYOHBWIRYR9a55KxPz
         nI5q64Hn6emyEHOZXkY/7nYPwhde5Eh99MI2xXDJ+p7rzH5nESVtBuBOoMwa7JcNq1DK
         M34cfgqwQcRf+woUQI6hZ+OEp9FIEDAGR5yd9aYZSFlNqByyhSA0GMuAEFbS0YSD4ZX8
         0nUQ==
X-Forwarded-Encrypted: i=1; AKwUvBziY4qU9ZrIrjG2RjhkVCyuQIkGKbgOmHm8UUuTyG/vdXEY1cYlGlWG3q544PD2ZWeesV4pRrfScZuK@vger.kernel.org
X-Gm-Message-State: AFq9FYKSouPG5sewUv0ky8n+26fvix+s5VYmIvRr34rY7U7f/F2Ta/QT
	kbE+bArRL07z/3evMgzrwehVXgsj6iGwcT8RSxG4gYOWH4th2/5FxN0269b3ZPLHpMOcANkZqPb
	KB2ytThPlyWgmP+pfd+OAbwt7TYjw2I3AUSpaIUL5LyIjFS3Hn6GZvxtikNqWXu3WB/xezOW0Nx
	DkGcYySx+whR9h1cp8iOphEM8lVMNFQnPOjE/0iA==
X-Gm-Gg: AYBFou3abVhNtngPdxkIR5s3exeFmC8oinPh8viRFD69E3eB9F8AbgdgYSxamjicJPq
	ShLIwPfjnDSBR32HUMJ0D8SMUL4ndOJJcdMCBxxdKe5Ynrbo0CJiMQJ0UlQyF+iFVM5Hm8hBTvg
	8r3MI5YI781eJaXHfM8xwIA2xKqmSlgK93AjDM/jz48hnEVq5+q/wMKrmk0CCx7r7UkecWCl1fp
	IXCu6GwLSyP+sEY4V1rjfDvsOhkZP9mf1nAEEP7I/edAw+2zpzQlhap7Lhr0g==
X-Received: by 2002:a05:6000:24c5:b0:488:7b66:140c with SMTP id ffacd0b85a97d-48e07bc17f7mr19463052f8f.28.1792501129586;
        Tue, 20 Oct 2026 05:58:49 -0700 (PDT)
X-Received: by 2002:a05:6000:24c5:b0:488:7b66:140c with SMTP id
 ffacd0b85a97d-48e07bc17f7mr19463023f8f.28.1792501129183; Tue, 20 Oct 2026
 05:58:49 -0700 (PDT)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atdeLNa8rtifVnaV@sirena.co.uk>
In-Reply-To: <atdeLNa8rtifVnaV@sirena.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 20 Oct 2026 14:58:35 +0200
X-Gm-Features: AclHuK_EyXz6S57-dKvlnTp-wiyLvlM_cIx0foL-YU26mYTOQGN3J0P1sUFgOR4
Message-ID: <CABgObfZJJ8WF4cYm-cqYY0OOBs2zJCBV54+c3YVjCaBv_CiAmQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the kvm tree
To: Mark Brown <broonie@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Il mar 20 ott 2026, 14:27 Mark Brown <broonie@kernel.org> ha scritto:
>
> Hi all,
>
> Today's linux-next merge of the kvm-x86 tree got a conflict in:
>
>   tools/testing/selftests/kvm/x86/nested_x2apic_test.c
>
> between commit:
>
>   994489f04ebbb ("Merge tag 'kvm-x86-selftests-7.4' of https://github.com/kvm-x86/linux into HEAD")
>
> from the kvm tree and commit:
>
>   8b0aa41839602 ("Merge branch 'selftests'")
>
> from the kvm-x86 tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Oops, my (harmless) mistake in solving the conflict. I will add a
fixup patch to kvm/next.

Paolo

