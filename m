Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B8F346769
	for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 17:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769795627; cv=pass; b=FQtQr6lkxq/csNfr1eGyNbePrgIfmKxk2Rw1btYjpNEJTURHy7wqFf/gLBSC486HOQ6WW5IOUq1hkddlwBcZzTpkpMqkPAXiCRWgEG2GSjRt812+aFmvkUyCXat9x9a6Qr+IrHG9yDF2w5mFLnShXFxChgXohYjXFtOIlboCl4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769795627; c=relaxed/simple;
	bh=7HReTOTvaNNL1IncC/m4Wpe7RUebMUq+X5LCDrwDzEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NY/CvG8NY2YZK4kgBItmbhwgq4SyzDyHA51lOg79X1AeYHpibbS8SeXsEcqMuhbjgifDFOIxYMHHy7oxcM9O2lThG4Up5B/X1c2h9t7oFAtFvDtLgaSWsf+rKqazpqO4xsl/N5hG619Uk8Lv8YPFTbY/EESIifeEtdctx55RoJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wc4C5hdd; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wc4C5hdd"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6581551aa88so271a12.0
        for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 09:53:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769795625; cv=none;
        d=google.com; s=arc-20240605;
        b=WdWtr51wFrMBZCI4P6b+YJ8d1tWXxO8zEmPXVm04YBAnP5+imaD89aRkaYKE1KxjXT
         jzm/hoJ+OorClt2nmhJk1PjBqgCSYXTvC0bA8pmiJIEFnsZKVzwyOm6pYxUNeDNklzOV
         /BBsOxPqic1i+5mhs6aOa8Deek7+dXZXyro7n1XoMB97GGtUGO6ZFsS4UyWzbmjgW0mY
         NVxKX5EudlbEhZrjLrdjML/dCKA8B9X9tmHz88ADYJpgoV3PdMMJ6fPnNhaxh/pZ5bLt
         T/x7XWCAAJLrsF9e22A3GnAjy2fqwxdsUxbCUgTkK7FpnjdC1RZsH5vZiu8VQvQ4ol3W
         6HXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CzAbyksTrYX/PqTEqj/jDHSoU4HFb/Pd6NhUG0Oyk7M=;
        fh=qgYybQ/SrbIChl8WDkrg+vIWl/BZQ+Aa92r7V1Vy2AA=;
        b=iOkKLcMA8BcJPqdJxD/yN7b3FCh+x2kO8YtrS184+mtoi6t6g1KO4D7HPzwmaejPbM
         eM2bbhoy6Il+vAwJQ7/V1iYHEIMMQJUnjEIXs6YxjM7O4jLP0Xd3o42wH07aBhm2WuFC
         koPEb5qEoEzDPJ6jZfbfKQaTSmSz75MG4+lI/vJ1NvadHNCG80vq4SfCKaGL/rCz1CGM
         1T7YQdnFCH7zFmdWdQuzlkeQNwSRq15GGTpdM662me4N6KYLN2i0BDtdT2m3qWP+E1lT
         y9PwTZXMU50u4Ds0QY+1ZGgwD2Nogfsha36UjxO+x+QHB5LeOEyakA1oMpRFy4VY8/qE
         pyNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769795625; x=1770400425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzAbyksTrYX/PqTEqj/jDHSoU4HFb/Pd6NhUG0Oyk7M=;
        b=Wc4C5hddXcPyBweWguf5OnUK3tPLPI94d2xU65N0VCOr6ejqgAm1tUnpzhYwDUytm5
         dLYqFrj/uasO7PmNE9nVBr+DyeN+b1MxkN9JjKnUns03GZchwNQgxQIkzVxf4I19RPms
         BXVQ+ik3zkBWplQAEeWP1JGw1cct3Q8Fug07gaXdyarPDvuLlR0aumfOzKLQtpoXaMhK
         u2KnAQg3vy9Ln6d9p0RoWPYAs94aVgpOAXq73o3sRkT389suyEYuTfA7ll42zaw0kNl2
         qL3+Hrf4VOWZ3UKqkVVACgZPf/A9pHigMS/lYsijvWXOVYXnsLgzHvwBZOivUuYghcPq
         yF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769795625; x=1770400425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CzAbyksTrYX/PqTEqj/jDHSoU4HFb/Pd6NhUG0Oyk7M=;
        b=tB/NeH9NFh5uJDA5XTgBQ1DKUWjM2fIDbCgo6rRTqu4XSO7P0H1VatGhzIyNzUt7Za
         J2tm8Mq2cimEme/qtQUEY8cMVHg2CLU/wVU1KevmcBnvjYJ4ZJNJkS5NbeG+Q6lbn5ZT
         osxojUwmsl9Wthrd5xUpXNFjHUglJ+Td6IsBrA6pU26ZtM0Y6HIHWQj4SMoYpzqd0eOR
         Q07rtqS4Gp1EE+edRz8wwcEFVWXz/gyyOlquI22X6YbvrOdYVGI5oAbLGY4XZAx/5jYo
         p861Migy9Z1RhBEbNwYGh6bZ4MZxeXVL3ik+yIo61owwtYETYpz7t9JTO87X6Iwf+vfw
         YgPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpHqj5qQ2AnniKz7cH+So+kNOmP1l89uGi7VVnF1QYaf3ZOpChqhkwEiXonmiwq30I5KdNhuVo0WKH@vger.kernel.org
X-Gm-Message-State: AOJu0YyxVby2rp8MW2dWjhh3Wb/O4pR9YTs/3YuV+bovgqqndaMdvXIC
	wqGRQ2BsK++w2RSItZreVZP1OhZ/DdEXR8W2RxAhNJV8+CGieR1gX8BeULK/Tbf4ZaFf6MLYjti
	xlcUuUMm9y/NxLcgVck1fV+hFqLtRgCcVtam8Fptr
X-Gm-Gg: AZuq6aK69KcMGWN+Olk56XKC9/MCFHVhIs9QIGgVOhJGvQVJSWhjPmXgHq/F9mrjURe
	5JkjedqZFzNXyBfGwJbxhihLkCcKmo0aezg4Zrn3KlJZmy9ZVJaNKlgAUoop3PywM77o/qhS85g
	5FMSz0htRMcSKgFhblOnEO37MvJQD5LfxwMn2MyJZaMAxMaX8f/W3ybV9xizTHAiwKdxBjh11Mg
	vofsUOJZIp1/Luyas6L/PUUxXu8De0QSyzr/njMaGGPWxcNeiimV0NpwQyQWt4YixD4
X-Received: by 2002:aa7:c413:0:b0:658:eee:f21a with SMTP id
 4fb4d7f45d1cf-658e2ed5847mr40524a12.10.1769795624601; Fri, 30 Jan 2026
 09:53:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXzoSci8NPhIwDf-@sirena.org.uk>
In-Reply-To: <aXzoSci8NPhIwDf-@sirena.org.uk>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 30 Jan 2026 09:53:07 -0800
X-Gm-Features: AZwV_QhKB--6bYtBG6s-tcRW8UjGDxto2jkLNPPkFsHw08XPEvdR3-0MvE1JIj0
Message-ID: <CABCJKueCeHDpu+KMTT9z_iNP2Ljipt6r4KkJ-8h4ysoTRoCW4A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the keys-next tree with the modules tree
To: Mark Brown <broonie@kernel.org>
Cc: David Howells <dhowells@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 9:20=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the keys-next tree got a conflict in:
>
>   scripts/sign-file.c
>
> between commit:
>
>   d7afd65b4acc7 ("sign-file: Use only the OpenSSL CMS API for signing")
>
> from the modules tree and commit:
>
>   7ca1c9dcb7b0c ("modsign: Enable ML-DSA module signing")
>
> from the keys-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc scripts/sign-file.c
> index 16f2bf2e1e3ce,547b970972301..0000000000000
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@@ -271,20 -314,46 +271,37 @@@ int main(int argc, char **argv
>                 digest_algo =3D EVP_get_digestbyname(hash_algo);
>                 ERR(!digest_algo, "EVP_get_digestbyname");
>
>  -#ifndef USE_PKCS7
>  -
> +               unsigned int flags =3D
> +                       CMS_NOCERTS |
> +                       CMS_PARTIAL |
> +                       CMS_BINARY |
> +                       CMS_DETACHED |
> +                       CMS_STREAM  |
> +                       CMS_NOSMIMECAP |
> +                       CMS_NO_SIGNING_TIME |
> +                       use_keyid;
> +
> +               if ((EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
> +                    EVP_PKEY_is_a(private_key, "ML-DSA-65") ||
> +                    EVP_PKEY_is_a(private_key, "ML-DSA-87")) &&
> +                   OPENSSL_VERSION_MAJOR < 4) {
> +                        /* ML-DSA + CMS_NOATTR is not supported in opens=
sl-3.5
> +                         * and before.
> +                         */
> +                       use_signed_attrs =3D 0;
> +               }
> +
> +               flags |=3D use_signed_attrs;
> +
>                 /* Load the signature message from the digest buffer. */
> -               cms =3D CMS_sign(NULL, NULL, NULL, NULL,
> -                              CMS_NOCERTS | CMS_PARTIAL | CMS_BINARY |
> -                              CMS_DETACHED | CMS_STREAM);
> +               cms =3D CMS_sign(NULL, NULL, NULL, NULL, flags);
>                 ERR(!cms, "CMS_sign");
>
> -               ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo,
> -                                    CMS_NOCERTS | CMS_BINARY |
> -                                    CMS_NOSMIMECAP | CMS_NOATTR |
> -                                    use_keyid),
> +               ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo,=
 flags),
>                     "CMS_add1_signer");
> -               ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) !=
=3D 1,
> +               ERR(CMS_final(cms, bm, NULL, flags) !=3D 1,
>                     "CMS_final");
>
>  -#else
>  -              pkcs7 =3D PKCS7_sign(x509, private_key, NULL, bm,
>  -                                 PKCS7_NOCERTS | PKCS7_BINARY |
>  -                                 PKCS7_DETACHED | use_signed_attrs);
>  -              ERR(!pkcs7, "PKCS7_sign");
>  -#endif
>  -
>                 if (save_sig) {
>                         char *sig_file_name;
>                         BIO *b;

Thanks, Mark. David, I see the patches in keys-next were updated just
a few hours ago. Would it make sense for you to rebase them on top of
next-20260129? Petr's patch removed the use_signed_attrs variable, so
we should ensure it's still initialized correctly. Otherwise the
resolution looks trivial.

Sami
