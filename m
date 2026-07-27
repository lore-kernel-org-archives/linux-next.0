Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391773E9C03
	for <linux-next@vger.kernel.org>; Mon, 27 Jul 2026 11:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785152492; cv=pass; b=l7Qzh/lO2Llq/L8+soM8MCT1jHC03XIF2WtIQn/C6lKLoh8ue811oyml+a8tMsHzngu62Sy2cAaHIcga46DqH6yssTl6mhuKfr2fcX0hRCg3T/OkN0GEZ9kYMgKSYr5yCQPfxyx9hGEiOuv8GVF9NigY9COVmLUWfHYVrBbelHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785152492; c=relaxed/simple;
	bh=uank9vVr/75cVsUGZI7PAxbLG9oaKXDBQKp7gQIpKAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mL/bhwNAZk49LsS0fEyR8FSZUCfTsQvkrUg963GKEZSMtiStC6/7uRzeJgYTpB2r8FFJzwk5YgJmBed3VJkXY1CCaftb4LFzessCCVuAFZcLpTEd4+LTE9YU/G6/ggAoRxbQzoMQfIKXFcGdxKnXzOm4UfEOegqhXfUV4tcK2E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bD5Usduo; arc=pass smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bD5Usduo"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so1591628e0c.2
        for <linux-next@vger.kernel.org>; Mon, 27 Jul 2026 04:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785152490; cv=none;
        d=google.com; s=arc-20260327;
        b=TuZQjR3jzHfmjDNtEdahvO6TiecZ2FFsm4KaNMdMDzL7TsUlnFcG4YcxobNJ0Ejkem
         AtBkBSkZsUgy4+IkokAV0KVj/uTv/hpSXPR0HWsHKt9EpCRa2Pc+YVmyRG8O3SZRLQMC
         cWmqBKt7rCvVFy79CNYe783Kvvq3hHo9/YLt+CotMKkFGebGgE34VZGP4ZUr4P3FARKX
         4FDhVU65hrQEEY8jdYA6XbMfCXDHRjRGfjC2CK9TCMhDyEHUpUqUZqDZ43QmjTJklZHN
         /ezQM+p+pcW898Q7O41DJw/2I2/qpFc3mKlIVHT2FPLlX9CpBYdMAfl2D40EQjnFgjp3
         HPJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y/LR0zrh8UNz1JwhA0OKM6FBZrmfI7X2/HPk9/35pzw=;
        fh=GLtywfvnUhgpPextICWFc9zLusf/F/Y90CucMvOYPlY=;
        b=qfJgcwOkeUh5cIx55yydWIvEKsRt8AjLDtUWei9ugklFQ+GOOXzUaAwkZ+G+Zc370g
         4RLxd7jKbCyfOJSch/UvMjwTj0wpuhuXFgdy42DQtYhlgmvQ9Pnxioqrq+SJV1mbV+I2
         A0xmdKvfz1hC96rJgqPattRc7Dh6kw8VynGholLTjE9WWwMFl2H4IEhm5XsHaJ9tOszp
         3Uk8ed4mZipXjC+Ivfj5fElPqw7bn2ngAP3Z6TyqwEILXX/omucTsvQsIGKYjlpPmtfK
         QiRTcEypiJuHWrySy7nno/yzW+v6cIuL5uiONSGpAdzWLq57OEvrZcYKVK10jeYLVK8H
         eieA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785152490; x=1785757290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/LR0zrh8UNz1JwhA0OKM6FBZrmfI7X2/HPk9/35pzw=;
        b=bD5UsduogjfHbeyjdpKq6h5FWYvbpwo/FNwd9NQHoziAZxSvGvv15oVMviX9RIeS16
         cSI7pTEMBzvJn3phCFgk6M1/R8u2klt6r1qXtFw7cL0TZhRDVbBTGY4cgteOCasiimSp
         754aC5lxveerpCDvGQ6fig4vmnCmuOySS4mHLkOUKbcuFZFhjFjUZXfUAmvml+OjHvKR
         kzqfo8ZhL3S3y3l95pBpAWcxmZu7T9AjpliXmpyQx5IV+ZlOadyIyF7LAh1dGnfy54ub
         bHYNeJqwP2ySuuSFiSE+viHrPKImQ+WVTafemp2os/+fZCqg4cLjIixWhoChX8NiS/PX
         Phhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785152490; x=1785757290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/LR0zrh8UNz1JwhA0OKM6FBZrmfI7X2/HPk9/35pzw=;
        b=Uw/EHp+jggq5AAqaega2rrESFlaVqlybVVws94wzKSaslKcNxBkh02d+0csVImR4Cy
         ejg3lj4TIkdnDcX/mSR3+iJRp7MWHSHQFAy5mpywyEi1EOkITrpeBW4n7x3DDIq9jaRb
         2gyacp3UrGAMQxJjmRok+2hZrm0TqmecAV6SxxbK0RzlTBrU7CCvvryaJhvLOtHSkxE2
         GOgZIUStryKFC+Qi601a32cNuekao7vzy3UjxLs9hy2nkT5KU6cNVsrnaU0PUfwQtFWc
         4uqxOkXZJtROdHvJToVS/H6LQkXjDDQk6El26P0KprkDUj0F+jngHwsA7T0hALizf/JT
         Vn/w==
X-Forwarded-Encrypted: i=1; AHgh+Rpz+c0X7YSQfh6+thvYpCnW2oButVikVxPmXsQXtUhBSep/YfTgJQr6qZeua7Z/ax9nk+XTmgMUHN6S@vger.kernel.org
X-Gm-Message-State: AOJu0YzjydQ3PL4Q365UFkxSWm0Exzjw+pAAkxFAoW+zRoo+oejBIyi7
	h7rkqthpc2MkGs5SRDqGmeuiXevrk9NjIo6ezyIxSHmAlL/Na0svuQNMKWurqZIdV/tZwvCuGdt
	WteFh/Ssciv9PMcRNaQClmXgyqbtwLzs=
X-Gm-Gg: AR+sD12lO90EXRoOp37NPcDdEMHMu6h5hbDjNJ6uitslgH6/5iQkmC/3uzopKdIuOUE
	yykjNCqSOUSSW79lLp4SD4jUh8WOfZnHby+OLNjnAw7Csv2cSysBSgvdHKAJ6s+zxSQ1ClY6CuW
	26HE63CE6NxZgxbRZx0llUERnWzJMV8aPo/TqX3uLA08ahw6iOfLNe5nnstiKoTU/03e7TPsWds
	erIUzh0ukhl7KXTCRufG+3H3axfO9JRFA24O8s4HO0LfQjs6F4lzIwx5jyeAQjM4GNTS3fGLoIm
	6h4VbUo8W94GgB+IZio=
X-Received: by 2002:a05:6102:5684:b0:737:4cac:52f7 with SMTP id
 ada2fe7eead31-750407b72eamr3632698137.19.1785152490023; Mon, 27 Jul 2026
 04:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amdA9Kuh6idkytKa@sirena.org.uk>
In-Reply-To: <amdA9Kuh6idkytKa@sirena.org.uk>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 27 Jul 2026 13:41:18 +0200
X-Gm-Features: AUfX_mxQMueelpcFmQFw1ImtGlq8MzaoiXUT1SMDdEN5QiwDIZ2mJrkWHgHlE38
Message-ID: <CAOi1vP9ew9gnO0iiPBxggpt=GrBSmz-gr5+GutHr=_sBOD6dHg@mail.gmail.com>
Subject: Re: Fixes tags need work in the ceph tree
To: Mark Brown <broonie@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 1:28=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> In commit
>
>   591569339cb56 ("ceph: fix MDS random selection readiness predicate")
>
> Fixes tag
>
>   Fixes: b38c9eb4757d ("ceph: allow choose random mds")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format=3D'Fixes: %h ("%s")'

Hi Mark,

Sorry, the patch was taken from the list and I didn't verify the Fixes
tag.  I'll fix it and get into habit of double checking these going
forward.

Thanks,

                Ilya
