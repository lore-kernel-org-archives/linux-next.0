Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9853570A0
	for <linux-next@vger.kernel.org>; Thu, 22 Jan 2026 06:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769063790; cv=pass; b=dwpFra0Gv57TuCR74MAhZnXltRzdOnXKFtvUwI/kfYWeM99gf7Amq9v2YF2rIFB1aLIkRrJdvf00J7bIPTUwBhMEuePuy/MXQL3XqxoUUsvJUGkDjyscPRXcg7FTnAARzJA8BLzX2EglGGPn1SlSgmRGLE3a8efbuRG7dzQTnDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769063790; c=relaxed/simple;
	bh=3t5XgmNdWoTSZOqD+xQnIwR2zAKu2BajszBmmP+XSeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xe588wN7o8lHSqw1r1e5nwA2w9Js/LKXy7QpIk7ReFWeSbSa7lwugEetvpHpoNqNycD66tD0klV9SAKubHM1B7TLm98DvIh1KJjfNqrTpccIkGT3Aab3/Y4XIGQFDB3oAjQaOD20H+Heu7E7uyFq3terNS6pwDVcN3Z5EdggsTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sTUWaGsa; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sTUWaGsa"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4359249bbacso1013619f8f.0
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 22:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769063786; cv=none;
        d=google.com; s=arc-20240605;
        b=lYCG/oRnlDTUEuhUBH5Cmd/vdzo53gtdifIgM4E4ZuWh5Zls4BZq5xzPYjFSlUMxrG
         QAhpNkbv3HErIY84m+UNsTnT9F8S0N2qJ2Wo4Q/TK7Loukmna1Dkb9bGsyKzvvdKG1M0
         /T941Dv+/+uR60tVaElUE3ZWFZVPxJkjCBMmgQ/07aE1PFU7fCbkdLNxgJRAMi/NZ7gq
         EAkCH0tN12tql9VkGlwShBv/zS8M44Q5vOaZBU9PjX2KKX+7fLzLTcubby9zEV0ITz5y
         llD4Xn4cOlOP2czCw090YLfx8cCBhAl+Dl12c1i+zcJvEyqKNTs//JzPAE8ipQIlYGBF
         cQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QddNQZle1f13I3IZ1I6r4CCUwCZgeMOKhRKhoQFIlaQ=;
        fh=ZjZJ4DDbhhsagRPPz6UY/rpV3M5mtULXNIWz32WzqEk=;
        b=QoT2JrP0NHrpjU68ADMeX7iXOQYEEfERlBFw6io2tzdgEySt6bJpHKwxsurNx62Kjw
         wZAnl5hFoO075oAFCq+XwKdcGbUCffJy+j187t70JXsQwysg4IiCP3yK5NWDTnMTgLyy
         HDcRPNI81U9j1/OCXgP3E8DzW0EDgSawTy2SrvqxgqgLnwyvGhqvZJ9x5+qsVNXmoO0s
         eF9HTA1HQx4ZpX9EZ/d0JcXe2X6MC8NffBlu933YewXj8TFbVEwQhRC/Wx8tup018HXm
         Pj5vETKNMjdj/zjlq1EUpMPiGWUgD/5CyMmwY9kolIPSYn5TIC13vIEwafdPjuiaW/4G
         40Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769063786; x=1769668586; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QddNQZle1f13I3IZ1I6r4CCUwCZgeMOKhRKhoQFIlaQ=;
        b=sTUWaGsaBnkJwaMmQMBNFr9mil/FjVDE6m7MR+sUxb0C1wJoW5RGQwgwH7zqXWPlZ+
         Q4iZshK06aikqNOrBWNDFBJI8mMY2ozzSyXy55Sl15REls4kMycZJWkF7ePy8DGB5nz+
         0zZ5SGgwyLyS4DYzzo+cKnHORJ/zd+7nf1powkEU/VdhNWjhBSoxDuA6+/RRkHVPB6fm
         AZotJDSK7gwK1xNZAenyn5o52wuSDt+yl8QJkEqKeEGlFnHpPNatIwVlEflEp+2I12Gx
         /pYBi8sZblhOQU35Dg3cI9p9GBCN2VGrOfmOaW6sSWLD+TwvHtgHAR+gxltVXCseOBkI
         VKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769063786; x=1769668586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QddNQZle1f13I3IZ1I6r4CCUwCZgeMOKhRKhoQFIlaQ=;
        b=pQPJY3H6wCf4YJtCL9IYw+8FI/O/P5PuJA6MyYPWHhcmuyKXlad3XKDnhA2/HAy5Vc
         ntvng4cLVdLP6KVVhjsRCi32IXLY9Ty75w0V7qc4xM8Opi2ivuCrYtfSq1vASAiPQFtc
         xXOpkukRgV7URsoTrQmdoBGn8nu8M1+V0/x3VFNGuqqbRptj1BOr7nqFdclHXIV6OQQP
         fR+EgoBSpyMn8NhizgSCQ/5l2DikfXNjvR7eCGIMpFXdlSY19pnR24r6KHFzTbKbKEKA
         QMD3KbHhhKeuLMc3hcnW2hDNbS1m0cwWK/AWoyyI4xN3LdAUfpbgqEhJC4KLHk1nuIMC
         w9bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+VYuZQaUhaVxN32pQKJrhqYPw/QrObzdEE2JtnnAHzeimBh4EV8HTALu0TiLx5l7xgUlKTqXNuzj@vger.kernel.org
X-Gm-Message-State: AOJu0YwNW6JvIbTuGIgTU7RI3/TOJ6vU9Dxnc7MBLPL9o6wUzhckn2ci
	5GTOWr5BuyStQT4T0AQpkXqM1jxiQFwsLMx0PHV1P+7tyw9JrFKnKvRqDbc0MyBqmzzR3nvePq5
	O/gE+j+ekKZ3tY9w6vwTVAM1CAHCgckfJPqCwcXDR
X-Gm-Gg: AZuq6aIbFHQQ/ib2FK3mEtNCCGGHepPjeweF8MYkmUy5lFz6AFnKWGvxSiFRNoWiGSD
	aFcOlbTQehHNumRsJ/vgJr/fImJsLTMZEw+CLdG7oX2gKzMxbYIBm1bUKbzYmDWj5l3/Mdn7byo
	46FvxbO/z1G+4TFSuwe2bHTyTGClML3T8o3GRhPaz/nnxCyVsLDZFMjYGwc7+m1iy3dYxa+az0D
	ve5uUMHhG3U/UHtgglyRhIE17q6Iz/rlwFmj/dsO0rstUTdYXzdDF0/6TXZASi4Q0cyXA==
X-Received: by 2002:a5d:5d0e:0:b0:435:953e:5897 with SMTP id
 ffacd0b85a97d-435a5fe530emr3281854f8f.25.1769063786320; Wed, 21 Jan 2026
 22:36:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aW5xqLq7gatOy1DV@sirena.org.uk> <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
 <CAJ-ks9=V_JmzEaXUrHPm6K-DyTgkxEhrPCW=2ZgDJpc+4Z83_A@mail.gmail.com>
 <27b562ca-d79b-4f80-be71-ebf5e26ed9ab@sirena.org.uk> <CANiq72nS94wv50XyOJq5CeiVQvb0+3mNdWxJpFy_+2FH1x4RYQ@mail.gmail.com>
 <aa4bc767-8128-440c-a2a2-81fbb6992a8d@sirena.org.uk> <CANiq72njSUPt2CvjBiNyKw1KHSgnMdcBnXNL_pHV4iURYL1n6g@mail.gmail.com>
 <b17da8b5-6640-46ea-ba73-d2f4a08e246c@sirena.org.uk> <CANiq72kT9ThJcr5W0OhBmbwKZCpULjUehNjijTt8W09yB0CxSg@mail.gmail.com>
In-Reply-To: <CANiq72kT9ThJcr5W0OhBmbwKZCpULjUehNjijTt8W09yB0CxSg@mail.gmail.com>
From: David Gow <davidgow@google.com>
Date: Thu, 22 Jan 2026 14:36:14 +0800
X-Gm-Features: AZwV_QgCYGOiclsgn3tTwOXhStV919vEJ5uDE25GpJKzoqRutT5r7UPqnWXEZvQ
Message-ID: <CABVgOS=DHdF6XmVUKH1zTML3kV7ozy8BG4o1dyd07BnngpYx4A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009b86370648f44279"

--0000000000009b86370648f44279
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Jan 2026 at 02:55, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Jan 21, 2026 at 3:56=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

(...snnip...)

> > Running rusttest is a bit weird in that it requires a kernel config but
> > seems to work fine so I can do that, I was already planning to run KUni=
t:
>
> We used the `rusttest` target more in the past, before I made the
> KUnit integration of the doctests, but it really doesn't do much
> nowadays and carries a fair bit of complexity on the build system. My
> current thinking is to migrate those tests and then just make it no-op
> until we find a better use case if any for the target name. So it
> isn't critical if you don't run it.
>
> Now, you mention KUnit, and that is very interesting!
>
> The overwhelming majority of our tests are all in fact KUnit-based,
> e.g. these are our doctests (i.e. examples that are built and ran as
> tests):
>
>     [  2.714912] # rust_doctests_kernel: pass:283 fail:0 skip:0 total:283
>
> but we also have a few other suites that come from `#[test]`s
> ("normal" unit tests), e.g.:
>
>      [  2.260774] # rust_atomics: pass:6 fail:0 skip:0 total:6
>
> So, do you mean you plan to run them under QEMU for x86_64 or arm64 or
> similar? That would be amazing for us! I didn't know you planned to do
> runtime tests.
>
> For x86_64 and arm64 things should work fine and it would be great to
> enforce it in linux-next already (I check the KUnit results in several
> trees, including stable/LTSs).
>
> Now, if you mean UML to run them, that is still best-effort with Rust,
> and it may or may not be completely clean at certain moments (Cc'ing
> David, who has been driving that and done a ton of work there).

The UML Rust support is pretty stable for the core Rust bits, KUnit
tests, etc. It can get a little broken from time to time with new
drivers, gcc-based builds (instead of LLVM=3D1), or 32-bit builds.
Ideally, those will work as well --- everything seems fine at the
moment --- and you shouldn't have any problems with just running:

./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_RUST=3Dy
--make_options LLVM=3D1

But do let me know if anything is broken.

Cheers,
-- David

--0000000000009b86370648f44279
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
Dxz3AgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHZtY3XkWtC2
e2Idfk+0JyK7BLzzMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBo
hqjbVaHxZoT6HHUuwQcTlbgXpuVi59bQPrSwb/6Pn1t3h3SLeuUCvOYpoQjxlWy/FexsPW+nWS0I
PUmWpt6sxbIRTKPfb7cPk32XezfnA0jexucybiXzkZKTrbI7zoMOzDIWpTKYZAonB9Zzi7Dso4An
ZOtz/E3yhdR/q1MK30d5fiCS0vorEd0Oy8Jzcc7TJ2HGMzEEXiFFvVrJYJHvfYOeXE4ywAG6YWO0
x78+bXeB9vkeWHhOYKyYXuAXrnHASddEICg1QlJCHDAISMC1Wn/tjqTMTt3sDAe+dhi9V1FEGTbG
g9PxPVP4huJEMIBu/MWNMzHfiW4E7eCHVPrmtX7CFDlMik7qsgQBbO5h6EcxBamhIflfMgoISsRJ
Vyll2E5BNVwkNstMgU3WMg5yIaQcuGFgFnMTrQcaLEEFPV3cCP9pgXovYDirnB7FKNdCZNHfeBY1
HEXJ2jIPDP6nWSbYoRry0TvPgxh5ZeM5+sc1L7kY75C8U4FV3t4qdC+p7rgqfAggdvDPa5BJbTRg
KAzwyf3z7XUrYp38pXybmDnsEcRNBIOEqBXoiBxZXaKQqaY921nWAroMM/6I6CVpTnu6JEeQkoi4
IgGIEaTFPcgAjvpDQ8waLJL84EP6rbLW6dop+97BXbeO9L/fFf40kBhve6IggpJSeU9RdCQ5czGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAYQLf/BIzLow9kWqD8My
PzANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgUBQYa7HQFyutjk2gBGcOez2QWO7W
B1yRAURNXrX2mWAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYw
MTIyMDYzNjI2WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEASGmqUrSVG4r8nkQDRe/r1NOP5zTavajUvW20jmVd5j8ZTac5dw3MfJtOyYpIKn4f
NzMplg3PDkijgZ46UW6OLtgya/bnI02aFF18PCHgyZP+btO6VG0qXYcA2jktIwolJIHfmdMo4P5m
eRYIpFj7SHCiBwlI1QhiUKodFr3gqyUwflFcAuobqoZSx3MXvTzWozHj/5pkFhe/8PbKdPq+MuCa
bXXBTDduM3o1Gc0yrNatG7xN5jbOLlbCJ4xa5kfBLvH/Io46ngaHlm5QrljrecrZnwxC5FYBPPJE
oV7yqcP9bCpLAyg/dhb/iod5ed8MxQ8zu9p2SolbM6gTGHRSuQ==
--0000000000009b86370648f44279--
