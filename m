Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD489476058
	for <linux-next@vger.kernel.org>; Thu, 27 Aug 2026 14:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842477; cv=pass; b=ZYk1hKTIuK40t1wvGZlNYg9e2Db/YX2qsLX/Y7TdJz79+7J1hW5a14m+4hNGLRINNA8ndszQskxeRlOU/uI+c/kj6BQf18c6SUtLtr7H3SF3/S0BjqZvCgoMRqDSMhp3dpwjUbYcLThzkRnjs2WvFZ2C5G/86guINKQufKajEBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842477; c=relaxed/simple;
	bh=1SIOuhSKURyfBFcRwKanlIvA1e2WzgnUKZ5hYJTmwjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwz0l9SBLN8Ev87UXlQIVBOR8xmdtBgUtoXRiyEuV5FVqm3wwxMeGz55y29g5dl5IEopw4MtktWAXddcgcSYkZ8BzHWj2Z3dKmw48oWkYLPiy61IHKGGBkiavVonytxNp0YIUOLy6wWMbEehiiBLx9Zxs/ADBpgsuO75toNiktI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OH2aIfH0; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OH2aIfH0"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf9466867cso950512e0c.2
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2026 07:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842466; cv=none;
        d=google.com; s=arc-20260327;
        b=KkpNUbU/1/kaJZFMFtMUg4jL+AYDu+o+enAqnU0nVnSLsH2HVDb8nX7naVe1WKM440
         Rk9Do760/SsTPd0lWo1XylNMVl8QWUmqsvAJ0JEDRTeGUe77AwPucuWnlfwJuGyi3E/o
         5SLBCbdsvQzCt5BK+xCd2bkBTiugrPYPCQSlxDh3MAsD7Wej4AWiyhhj+Md6J27k/sHY
         ENzYEe5ofktELn5ZxJ9sLd2oUq9IZA5JDY1oX3D+a0EhYEAaKwUgju77C8rYL9+KJMPe
         /SzlXZfMUJkztPEAThM2szKVP3vK+YN9f+UavTBq77Dl1SPxUGR4Q2hJ54oj7Ayk9CBw
         fdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zbKY6MBOa0oB1ZoBMbPN3qx3VwVEsabbJ6U5jSNhb80=;
        fh=5DaYzsys++RzZSQNTFTwHh6LRVfBYhxEmloq8MYwUMY=;
        b=cBQrElNi3y0E/x3VtPFf90JdCsRYyLCDQk/hjvVhT3PkcPLl6/M07rfaL3XQLOgpJO
         ChoaN2qstw8/PZmNtEbG0dlgB7sHhjf74hcN+FSQ59981gWjCtX2mGXmvzBtW44mzYk9
         Gud4jy1UgVZ2dyvCfB7AOHJUbvE8UDTXYG7UcfMO0Er1FeWo06jxP2PLxHmAGNwOamuz
         wY53CHZ1/UOoXogRTbCqIby7RnvSTPiCCGJx7pKC+uOqC7Lpk7m8HdOqMqri8aO7BdD0
         ZxPoN8xUAUhj5YCr5wlqL3A3dzKbAB8DJfp9wtifZ+IWRsfe9sIKxmYH8YkLfdp9U5Zy
         TtUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842466; x=1788447266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zbKY6MBOa0oB1ZoBMbPN3qx3VwVEsabbJ6U5jSNhb80=;
        b=OH2aIfH0hPoiR7WU9m9K++nzmsKY9bKUp9T9aXADA97jmxC/C8LM5410tjYnauPR5P
         G1CyfJIGZUSgFUunF/xFBiJNhUHXP43Q7T4+8Uj50Cxn54LSpyb5uO0bBbmHCYHl9SyZ
         v3VF0sa6deHaoqcqcsSYJKo162nTBd2ikYZ9J4z/pF3lTnUr5dSpGNJdn2a25maVJeVl
         QyNe7/yVh0QlloT89XB37nq79xaImwMQ2BcXb3CPlseo+hRO1oxuY4nraih1Q80f1rdh
         YhKXgFENfwFUjemmeUUSq9qoDsgUt+hFpg5BDUCnrPgRLtKW4rFkPwHZzfX/DaGMHBJ0
         +K7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842466; x=1788447266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbKY6MBOa0oB1ZoBMbPN3qx3VwVEsabbJ6U5jSNhb80=;
        b=CzMyQtPlloGan8lRMF+9kS0BM9MEVNTAGxDyGTJjIUT+fq/CFldjFJFmIpRs0doIOe
         cl26DwhUGy0aQK8Ucsbjn0YuXwC9i1I31SX/hCQ98L8JlaixYTx/JZRFnkUy4/DBMvSm
         E8C0fm8gSa3BVzvPl163BByV+lbqLCOe25PPpPBNVDqPj4bQMrTPSruvdFJxztwQ9L9w
         O9KmThgCC7mHg9pWYdex3McCITMQhIWSKFzYXeK2NtzbFTFIHzlKlIsn9NJ/1bjstCR0
         /Ffc0fVezgxf8f3pht2w3t65QTDJ5grVct7EHq5mMVPW+J9sOR7sY24Pvu22xaSITho5
         qjCg==
X-Forwarded-Encrypted: i=1; AHgh+RrdolPNaKTq2QH7Hx8dBqL6UottQ7fBRenwlSU0ZhEz7Cmmv67DVyOONE7uZtZh9y57k+6ucqCyJ/DQ@vger.kernel.org
X-Gm-Message-State: AFuF++mnB7dHcq4ZCXDNcTCnv8OtbWOOxB8yjUzqlYY/2RHzAiIBl8p+
	g7Ly+waGFVHDUmJj2zidKFR2npfVzs5cLvx3xFz50/5RRhTSWfYRwSoWPrEVubGt4s5AJ6kdxZJ
	qnYP/JXgsRBXllyslrObWxZ9I3JUKE6juO6p4
X-Gm-Gg: AR+sD11eOn3lJ4M+DHv70axohILMUnAsw1h5iAdSt2pBhcLrZPMRE+j+T9MZ8ag5LBD
	miz2+hSGvd15qrsXWdhU2z8vVe568CbZdX/1J87QEB/gz4xhmf0rrVBIG5AhGuaakqdGBgrpcF7
	nArOszOKRhR4LO4z5knqXaJtUuioxCcmPIvIbfGJ6qhAqOF/c69J1kJuN1kVAChR9SWH6+dWoYK
	ny+GFEJHAcVMkhnVNNcI917dFFS1oPhTOAIS9MLw7znq7ifamQIkJ9lWRIB3S/l/cSOOI13NSk/
	+rXaokq9lfNrWqjjIZxnqUdca0oVNf1uYSkXd3amiqhTnaE7a6COpES0t3qECAMe6z7wWs8cv9J
	gzw==
X-Received: by 2002:a05:6102:3353:b0:781:210d:2897 with SMTP id
 ada2fe7eead31-782c1804fa7mr4610077137.9.1787842465075; Thu, 27 Aug 2026
 07:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apA3H9wjxmEywmk5@sirena.org.uk>
In-Reply-To: <apA3H9wjxmEywmk5@sirena.org.uk>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 27 Aug 2026 16:54:13 +0200
X-Gm-Features: AcwNN1VTVrVILAfVL-XGKdB48xP3TUs8HMKahRqiSE9q2tCaR-DEximXSKokc7o
Message-ID: <CAOi1vP9AcAJD+1KswJ-mGrK5NhTs0hKwD=ANxhtRk2LKmxmPpQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the ceph tree
To: Mark Brown <broonie@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Chao Yu <chao@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:09=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After merging the ceph tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/fs/ceph/addr.c:947:4: error: call to undeclared function =
'fscrypt_finalize_bounce_page'; ISO C99 and later do not support implicit f=
unction declarations [-Wimplicit-function-declaration]
>   947 |                         fscrypt_finalize_bounce_page(&osd_data->p=
ages[j]);
>       |                         ^
> /tmp/next/build/fs/ceph/addr.c:947:4: note: did you mean 'fscrypt_free_bo=
unce_page'?
> /tmp/next/build/include/linux/fscrypt.h:380:6: note: 'fscrypt_free_bounce=
_page' declared here
>   380 | void fscrypt_free_bounce_page(struct page *bounce_page);
>       |      ^
>
> Caused by commit
>
>    0137f53184252 (ceph: use fscrypt_finalize_bounce_page() for cleanup)

Hi Mark,

Sorry, this commit isn't there anymore.  It was a minor cleanup but
since fscrypt_finalize_bounce_page() got removed we will just continue
open-coding it as before -- it's just a few lines anyway.

Thanks,

                Ilya
