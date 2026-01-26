Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3622833970F
	for <linux-next@vger.kernel.org>; Mon, 26 Jan 2026 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434284; cv=pass; b=XKmuNTmA2A+t2wCkqEC2kONcIihrtchO7RhghIwOOiLrdD2XOUarjAznlOWzQDb051KzOwrQuaS/ECaEljeJ5a8Ee90t9gFXwz6PLPUn7M+jLKmq/buRgs4lg4+XmSP36gDsDR+eTkx/ubTslCwASATo1307/NN8Bi8k+4hfhLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434284; c=relaxed/simple;
	bh=qt7mlIklihLmjkDd8dY8YfWhhgYjyiAJSSlIjNdSFLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BbwXDoOs3xgkMn0bJnhpnE3VhkrZYKS/uVr9VxeOqmQGu05qMISgeog4EsqReySfDA6bU1fyXFfBEC04Mq34Bj6CSo8pKB7rOJbS9QFz6O62kDghslJi9TBfXqJjzJJPqb0vAjmLjzRXKLtfJxJcEH+g3v9mPUlDHurEFlHPn98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=amPjoFtA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dBsB2r63; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="amPjoFtA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dBsB2r63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769434282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dlb3MXXP18fpDwvU4AfALafX8e8k9Ge00v8//yPYZZU=;
	b=amPjoFtAozPTJp2xDNxGCK+n9qFtLWdby3e5NJE5ugUdbgqeGAku6d3VNSIM/2g2wyk+fq
	Y+G8NrLDnBrwNvzMBDdxoxe0MkWreUUP3quvnLfhbwyZ5LLQ4pgZrWucIl8JxD3axqZS28
	AzKu4fbDtUmbiRzhQmLUlfu7Ggag2is=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-Ivst-LKkNfGwe5vG2fpK4Q-1; Mon, 26 Jan 2026 08:31:21 -0500
X-MC-Unique: Ivst-LKkNfGwe5vG2fpK4Q-1
X-Mimecast-MFC-AGG-ID: Ivst-LKkNfGwe5vG2fpK4Q_1769434280
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-78e7aadfbbfso47427137b3.0
        for <linux-next@vger.kernel.org>; Mon, 26 Jan 2026 05:31:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769434280; cv=none;
        d=google.com; s=arc-20240605;
        b=FSAiHIll3A+Ai/7CrFV5wiYXJaKat/txnAaTUwWirHwZntQDS20mcvARHLu/QH3AXw
         o1lC7cCMxXL4syDueeKvHsimpgewTZffcd14vYXSfQ6M2u6v3NQ/zm1v2ojhPR3gWFVM
         4Vxr4sSL0P51lt32SKVj4sAfrNtRqP+syju3NwtQF+LI1AyQRkDZrgTmrk7UXxbJOTGI
         Z8EJaX4cj7MW2BSRGtuEd1wOPjzfyZpaYQB/lh3fO6X0FbtwipIWN2tbo8ON+dP+yAag
         1ZfOfq/exks+2DlhaMehQl4pKeXo3EYuoMloPY2zRp5uw6KexdYLl9UsjPQXWelzEIK8
         WGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dlb3MXXP18fpDwvU4AfALafX8e8k9Ge00v8//yPYZZU=;
        fh=D0WAnH3RYko0IysOZGtu5LLc1PgDxRm7aHEOQCb/ZLc=;
        b=QYAeyfzPWLXtIN4CAmcFfXiQMpS9g6gewTqMmm0/dNckMGvcbwHNep9s06Hc+rmr5P
         RUrDyADJXQlez/I/FKM/oXYYuILKmAl+v1Akif6XWvXWMOHXPbNFKOZP1pfWznvHGv6/
         +y75520PIATb7Ju+61iKQtmBzvX9ahpqSit/yAk98FvL/omVkcAvCh3BbxVfscQ1GFyt
         uDDVXFeRyrjxyrGN9OAtLUEW7WqjT5ZvMN5na31LELVWn8C69gMUxvrHDExg7atBa+wV
         121w7Ning3VtCYuPpz2U8uFH3QZSRqP+6niVEbHkWs4E1zYOR8WCrOZhTU2EW+5v3ahR
         VdXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769434280; x=1770039080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dlb3MXXP18fpDwvU4AfALafX8e8k9Ge00v8//yPYZZU=;
        b=dBsB2r63DgE30hV+OufnPcAQOAosZRGwcVjEPGKE4ryQEyAwrtQkKAKity8u18g1qG
         YkAEZ3H4B5Up54YZCynTjzaLOGXXUA84oCsq4w1ODiPk3tXOhgXJRrDkPN9gNKV/+KBr
         8qBqh//p3Z4jt/dtjY0X5UdBovhoEPMUsJWsykOZNArCUIkgFgIrjx9tK2ZKXnonaqtP
         oIUsZc4R8F+kBeZKYvD2h0tR7+YGgGYHi/9CInuUpml7L7Bho8PPwBN29mAHcrx+2jtO
         WAAkUdwgrkd1rJELhM05gTNlqipwFk5qdS4DXqJ0sS99v3y9KTeg5GNQSTSUyS3qaoWc
         /r8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769434280; x=1770039080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dlb3MXXP18fpDwvU4AfALafX8e8k9Ge00v8//yPYZZU=;
        b=Movick4t06WdrQMoaOCmTn9Au92B8bVsFixxfm5Gw/W6dj3b18+ygQrJuUj4lm8MMH
         PR8l8HaH89Y/SV9RzX90ZK6jC90XkcqpuCzvSLZbSVm2Z4IVXlK814d1KBj+UCHzsZjg
         h5iPEIKuAIKxvNke01jHEq0PsQSvouU5tGLw595eYcw95JlvtZJyGSzZpSiWYYL4C0H1
         s+SiS6KXd2evzLOil8zKlRn3/GU54LC7CV4JKX5MNqMp3nvS+GwQLIBX/DrWIy2wYyYf
         DULZ6HmvZxht5g6BN52k6Vbw4RxIJLvx2f720i9ipo5OvjHfISassHA2T67j4xJUWeRZ
         u6nA==
X-Forwarded-Encrypted: i=1; AJvYcCXi5TbnLjK9aOp+PWovJ1HZtmddRLqqFTP9HNOXdJhjOVv70ZraxILDXOqYIysi8AZ4tWI328RzJTUx@vger.kernel.org
X-Gm-Message-State: AOJu0YzwX2YrM74+tmyBRNJHG55qxLS5s2lIJh8Ad6RuKiUz2BM4de0a
	30Qt2lE4eFVb5M3HIvZT/3RmDkRKi4a0lOyZ2itaKZcXRXJ0PGZ4JvxEI430dpV/GCAhlmI8O5d
	fY+SQcptCZoYSQWorv6D/kr4F2ZfAV8q6ncIhHM7X/HYmCgiiz5emyiTL/26loAIDoTAEPLAXw0
	b+joHH06cEMiHzVJDDe7n48mDb8qSBQCPxH+3A1101HAJtYA==
X-Gm-Gg: AZuq6aJdruMf58HonSqFuyTem99C30BmiWi4QsQp5IiBUs9kexlPR2nHj8odr4/7Kw9
	s0NBgwTM/pkT0XMNzS8YOon3fpVQmMeuTsmpBZZSHDFMAs3ay4G9pLO9hRSF4Cu3Vz0NyKFiWSQ
	TazsGWVp9X5XrLdAzcfbl8KDMigsgHFU69o2XOWiowQ080FO2B0ce/bHPYhay++rc3K+dDPfs7H
	UaDFPuOFZquKTz1e9W1b0evIhlvFSltoCcseIPSBlX/5vOzT7ZOQw==
X-Received: by 2002:a05:690e:120e:b0:63e:1ee2:eb03 with SMTP id 956f58d0204a3-64970cad41emr3320852d50.45.1769434280398;
        Mon, 26 Jan 2026 05:31:20 -0800 (PST)
X-Received: by 2002:a05:690e:120e:b0:63e:1ee2:eb03 with SMTP id
 956f58d0204a3-64970cad41emr3320840d50.45.1769434280049; Mon, 26 Jan 2026
 05:31:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXdcYzuVogTFGWyf@sirena.org.uk>
In-Reply-To: <aXdcYzuVogTFGWyf@sirena.org.uk>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 26 Jan 2026 14:31:07 +0100
X-Gm-Features: AZwV_Qibe7YFWvz2LiMCRQSZ99I9A5DO5qKbpyaoD5sbifka9nP1MsK04YXYLLo
Message-ID: <CAHc6FU6y4S46nCKHMmxtRHo5rEdbTdMVsxyv_VTzHGCa1A8i6w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gfs2 tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Steven Whitehouse <swhiteho@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jan 26, 2026 at 1:31=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> Hi all,
>
> Today's linux-next merge of the gfs2 tree got a conflict in:
>
>   fs/gfs2/lops.c
>
> between commit:
>
>   469d71512d135 ("Revert "gfs2: Fix use of bio_chain"")
>
> from the origin tree and commits:
>
>   c0c8c960ab932 ("Revert "gfs2: Fix use of bio_chain"")
>   910869abc1ca8 ("gfs2: gfs2_chain_bio start sector fix")
>
> from the gfs2 tree.

I've updated gfs2's for-next branch to fix this.

Thanks,
Andreas

