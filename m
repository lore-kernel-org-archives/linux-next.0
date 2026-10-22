Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792680735;
	b=3UV+9kHRDD7bO9ytnjNHoerJrAjP2Sq9KPEHoabHgum+iCnQGCifklf5lPTkIQgpcxKI
	 RC7jESH0WL8QINcDxu1SjpVHJwnjQyFN9YE/tFkaBHXpVYeyg2LbujIVSw/gUCw+PL0nV
	 QC35miYDFfXErxmR11Nk7voJM2+MtKHcd5kFHzQmJNNmsdyoDFfYLDI/g0cWJW/KCRpkF
	 CsjCedoXpDzOOL1KwMRcLui8j7dHtXTDS4EvE6IN/lT+OrggfGqJTmQXBr4BSq/ZUX8Sh
	 QK5kv61qVxMk3kDyNjl4Iny2g/Z2ucv0kf4nGnf7DgNxVlEhX8Wkkotj8ra7x75zYSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680735;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
	b=OUHY+8OxdaBKWUkbrM02fp2m76joJowuBgvs+5FXTUNQNDVbntmAZM2H+OEvSD/+jJ2W
	 DRigrX/mXMURba/KnyK5d1oM42Sum/nbwENamQlGCoahoycKSBU8BUQSaxHaGmee6l2QP
	 IzdAjpgSwqxjKAsHjHk8r89/TTkCA6RdfFBcuSXJj1k73N+4ZuAmPDj5A3cvZCAfwAIFb
	 9s6hHKMn/Fr1uGj5T75RP1P0c+9iUDeXq0HPs9AllgXuNl6gBTbCoOfYTOtBWV7yuCm+v
	 RCVSNdzZnEB08GyYFehjeTiK7YNGjG2vGEG+3YxPRSZ9VItDdsmtkmEYbM87W2Omrjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BB86Hx9V;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FWmexS4o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE82606A326
	for <linux-next@vger.kernel.org>; Thu, 22 Oct 2026 14:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFE82606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BB86Hx9V;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FWmexS4o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792680734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
	b=BB86Hx9V95LuaqLjeV9KfAIB/BTxzx+42wJfmhpj5Ct90/o9+K0ih8ct9VOZDpENi5pRka
	15U7DuAMA4kWp/nZaAHQp6hHIz38LOwiNb3ruXxFcub20EmULDTRan2+eNT+zYMmqJzDsv
	XN8SC1drt/Fqg3zfZ9Ym7ONEuWXHwcU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-7g6v4dDoMQuECyeg2DMwdA-1; Thu, 22 Oct 2026 10:52:09 -0400
X-MC-Unique: 7g6v4dDoMQuECyeg2DMwdA-1
X-Mimecast-MFC-AGG-ID: 7g6v4dDoMQuECyeg2DMwdA_1792680728
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48dea677afcso768901f8f.1
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2026 07:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792680728; cv=none;
        d=google.com; s=arc-20260327;
        b=r0YhGogRA7ZJQghvehnjVSG+bRp0aLDKQATsNFDmHRQ4VXWzz8CSVcLO5EVdIA9f+Q
         WlEG3LH530Y3ErZ+Ss2PtbZ6yRH/IiSyz4vDuSbN5MdPk+oPCj+prMC2gTKmIM7m9oNO
         nXPnRb9+24s2e0Zfsbbksr/HYoumeprv6f6MEGyk44uplkbmsNC5TGssUtvpK+QFUewz
         R3PJLt44gAPl7bVLYUbrygQTSmqZ0ezkftECHg2roIWA8th0adN2l5lbu9aYWUMlVOlp
         Loy+Yi3j5KUIbZnou8pPBxqQXDG7CX8+oT2TNL4O1lycAysHjtHbVe3kclHE8fHxOgBW
         T0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
        fh=OiIfyK9NCWWndpGxCVeQl5o37FAWyIx9NVOyQdZXxtU=;
        b=fITro7leSkoPN2cxZ66qAJ97217DU7YUQPHeMRFb1KbxjjH8cLSx2rVblCxlu6DIIS
         TuRJ1MaYKngVBSm44PPGVm63pusfg9kUMMnLXLqGVj/mjjCgfgq9olJ4Pn1/GQ0hdOyW
         rTH6QdcXB0lG2LFoSGdU00LZWwhj/NdiAGshfwQAGHw5v8KFFpNr5SFIhcM5py1RPHOV
         3vhHLjgepVjqQDjOrNR73gHe3lQSwD0RIIXN0dOiAE7SGSP7jJXV/0xWs8dZhTbLToNf
         T9WAVB1Zs0Da27ZOQq0blSL+wWZqX3ZiWRindjWeuAO9SnJIXvaE1nTqxfPtP1WRi7IM
         MYbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792680728; x=1793285528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
        b=FWmexS4oqL5psvnuSNji5MfojzfX6NMGbUcZ+DcJEmYL+GMrlw/XRcJljgzP00HjDj
         NUzB1fgTEq6kR1ViNKEHZ4pOCMxGMnqV3SWfxZnB6Z8QGunXcRZrOu1yow5Qwgw1p3MB
         Lyjn2vlmaYJ4bvj+d7heNlg7T8j0RBgVcaZ+Yx16dNj01foxFUJXtl9SwAkVHGs2x3TJ
         ljG8ryPgZT8v6yJeqar+8cOjFpMY4OhvGG91lPE2yy+QCZgRZMWrvoUxkJmWaemB8NID
         iMr8Rj261U7wrMNfBYq8U/CzaV8nX1Ds21KeFE4k0B1l06OfBh0bpmObk2UcZrywzUi9
         mVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680728; x=1793285528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
        b=EoByy0PhBOP27nsCRX0Kyyx3UuwZ1cl+pGRJ9jONJgbY+CHsZo/hzvo3dRMnFpiv7Q
         +02q8avVlIyVl+wHdnhWjaO5nmR5ETgsCCBb/668/Mku3IESm0PbKoj2FIZ4an1K+VH4
         HnKtpIj5tgGMnu44oTnSWrcM+73xLEwb0rHjmFqanZssA1evq/veb58IEdBI9BSI5mCV
         iyx7C0DThG70NZ/xbSCKey5e4dOD7zDjJ7qrLvIwixj/TIbS48k47sTKEzIb2Ay7sHG9
         2M0KIcXYNq2eRehfHcWgOId+/2ziIwzfc3zNfWuhKpHESMz7IhjNEEtvvQp0CyjPNnFT
         p8Mw==
X-Forwarded-Encrypted: i=1; AKwUvBy0pgSI4fQ9kpRcFPgM6BCepnVvoItWeb75RffVfaJds66zkDnXTwzPx0gLt4Bg3rk36oFJAAXcDmZR@vger.kernel.org
X-Gm-Message-State: AFq9FYLMaBmmxSePq12Q+ie+TX5uLS1D4856eNXfiIWlkLu2vXQXXITt
	Ps5S+iqrtTECaN12xafapLS+LlVf4UCR1A03Wz5d7Dp3+AjwXVQM66Gx8A5wQgAP+qMtwlQvyhR
	TGxnc847IfLDFSl6ErqKjJ//YI3jsR7xK+0DMZ5Xwp8t57q3WsinZNoo75e81Z+sHN5wZFo4DzH
	mpd/Qvu9ZlLboQb+muxu66rRWBJ8dAuyDHWQCNvQ==
X-Gm-Gg: AYBFou1cq1o7nKNf8971OD+Yo2vmMhkZgUBlXg64CDxOGh8xfVnohxWI9O9KuEoNLKg
	t882jZms4u9svkQvEkhaR6n+4WJ9YUDpklNfpno5gNGxlfjMOLtJ3M5mY6WJE/IkR0j1FgFh8j0
	KADRYnFBQ0etNmnmvf5gCnmqXQVhkN4w8ZPzZ42lF7cEvwqixuOaXE9Kr67Y3HqJKNcX48y1fCc
	orAcDhM54z6B2yOrvktgQLVt1cSl903S0/hD/uDRCoASiVKrQ7bcDPXwZth1Q==
X-Received: by 2002:a5d:584e:0:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48e2d102cb0mr5941238f8f.7.1792680728054;
        Thu, 22 Oct 2026 07:52:08 -0700 (PDT)
X-Received: by 2002:a5d:584e:0:b0:488:8347:a110 with SMTP id
 ffacd0b85a97d-48e2d102cb0mr5941198f8f.7.1792680727670; Thu, 22 Oct 2026
 07:52:07 -0700 (PDT)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CABgObfaH4-Ud4VR=GC8giDmWGJWS-tvYSmPOs4TtWg2hm4ocqw@mail.gmail.com>
 <36adc119db9b30984c0df4d1846c0f29e4e46c07.1792679974.git.sashal@kernel.org>
In-Reply-To: <36adc119db9b30984c0df4d1846c0f29e4e46c07.1792679974.git.sashal@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 22 Oct 2026 16:51:55 +0200
X-Gm-Features: AclHuK_FNMnKU9XQXzMyqQJBnCAE8EKPJnl7xQPFMv72VXmRnTfH3i81qFyOj9g
Message-ID: <CABgObfYuP+jeOZhZYaUrUX2-z0zWMH2Ch=hdizkzmKHLB6KALw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Implement kvm_arch_pre_fault_allowed()
To: Sasha Levin <sashal@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, Jinyu Tang <jinyu.tang@linux.dev>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 4:42=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Commit caa63620f9e3 ("KVM: Allow architectures to disallow pre-fault")
> requires every architecture that selects KVM_GENERIC_PRE_FAULT_MEMORY to
> implement kvm_arch_pre_fault_allowed(), and there is no generic default.
>
> Commit e8b32e377951 ("KVM: riscv: Implement KVM_PRE_FAULT_MEMORY") was
> written before that hook existed, so it selects the option without
> implementing the hook. With both commits in the same tree, riscv builds
> with KVM enabled fail to link:
>
>   ld.lld: error: undefined symbol: kvm_arch_pre_fault_allowed
>   >>> referenced by kvm_main.c
>   >>>               virt/kvm/kvm_main.o:(kvm_vcpu_pre_fault_memory) in ar=
chive vmlinux.a
>
> The riscv implementation does not refuse pre-faulting in any state, so
> return 0 to keep its current behaviour.
>
> Fixes: e8b32e377951 ("KVM: riscv: Implement KVM_PRE_FAULT_MEMORY")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Paolo, this is needed when kvm-riscv-7.4-1 is merged into kvm/next.
> Feel free to squash it into the merge instead.

Yup, done. It will be in tomorrow's linux-next via kvm/next.

I'll send the RISC-V PR to Linus next week, so if he complains it will
be there in kvm/next ready for 7.5. :)

Paolo

