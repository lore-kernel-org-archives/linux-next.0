Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98365562611
	for <linux-next@vger.kernel.org>; Tue,  8 Sep 2026 16:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883453; cv=pass; b=mXfgwnRaq9Qk3Lg/rphtdP3CL3MNsqh5HX4IL8EfXyigcSwqV67p5hwsnFdLEN8k8rojgxDGHnnlT2ndmj/sGvTBzLAvD4tJC+TJpTpCuCKjG9vU911iUp06D/+k83BSt6gV9qdEeVulKZPWAvT8FNPKsTxHKlm19n0msSliKes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883453; c=relaxed/simple;
	bh=uy4f6Kdc75tGu226T9MOyKUIXwCE0AeSTkoqwgmc2T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4dgX4mLNax/qIHszg07PayiXgeotcNqY/WN8k4C/nXul10I6isTGiOzq7Cw1PquuR1jhYDe1e4If2n56NpCKtU2tQ2l/LKsw7NmzIzE9293A10u1/1Vbu1ku3GtxSbTLZEpX5zbWQFQ8g4yW2QnanYCoRwF45EbcO3X3qKow1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8eJg1JP; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8eJg1JP"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7e7a51196so76751e0c.0
        for <linux-next@vger.kernel.org>; Tue, 08 Sep 2026 09:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883450; cv=none;
        d=google.com; s=arc-20260327;
        b=oYoigjJfNkHABEJvY4z76i69ydExEvufLxDosfNitLWQi8ub1sLQR6YlThSdXNNdmp
         sJrG+bgfjGfpocfmq8UEyZqrjNAMqutlKD/uWg/xykOCRxIeXStzjKdHMRvTNIqqPOiH
         GGvXlAKmSBkAeGt1Y90YmEu40BwufpCUg/i01MXqH39EtMefLUF2qvLlGxjOzNkzYzrG
         KcARg7HI2qq3VMvjokMfFinn0UZcxUnof0Q73v1MM5FoJacQI71mzxWiCAAcTeUCNQ9G
         lellMrJ9X/j6Tvzr+VxRfHisccCZqOHGmpMehIKQyk8LwyqHGwTAQ4zkGbV57MiT0401
         i67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nt0kh0XYrPSHGJubgJUC0bfBx9LloKYXdOD5FMiKas0=;
        fh=xL5wvx31eQgU7YrT/qXTcjx6598AbtL1BELZ90H3jAM=;
        b=ozsMylEdJU8nK0rZtHHEV6WbEAvhcpke0+pSnQtyMc98FxchCr0rrXWNerbgLclunp
         OXVN96W6P1YXWHAScIGQMubLSB7ABDg3EcWuq01YlcMFinw60xc/l4EG2lIfbnfpP9op
         0D5/zFunItRGfRSNfK1zAwq6Q3KvI+5f79BGiKHkZWYr5sK3HJ4Pq4QIG081XuV8Nuw3
         YLXPxkbcPUkF3DFc+z64t1uwt8iyQREU0jgcxkUBsmRoKXgjRZcAcsUrDNCbhfcb0hr9
         iAIPl7N6vc9YtP8eZaQhtu50JCyHF0oU5XH8tmJ6GKSkYO1DRNw3gcgE6w/pRMxm+v+B
         64rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883450; x=1789488250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nt0kh0XYrPSHGJubgJUC0bfBx9LloKYXdOD5FMiKas0=;
        b=b8eJg1JPoG+Gbh/kbk74UvSjzM0KTnl1QMEiVUZQgC5qIaC8bKzWUOKp3zU/bzMHcW
         DGLopUwf3rrnTyYE9s5XljN6mEjbk8E2HnmFQSUFrTR9IA2otwg8QBhiSg/pcwvbS65g
         lesjUzDMxk/9iH0RVryCMeBrt4OLGWrj1K5kVx2ryQMMlWb+d3YV8gen8mz63hyKlluE
         apW8x8RedsYgyMLM8iUUw/KYqcHTGKTAxY23iJ6Nl6o2KklbsVmpylijp5mVXnP9+Cph
         JnFczgjGVFZIF1OINh4UHYy32yGNW83wOLoKXRDkQWGP+jV2d4IY37jpx3yjnUPx2Te7
         kDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883450; x=1789488250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nt0kh0XYrPSHGJubgJUC0bfBx9LloKYXdOD5FMiKas0=;
        b=jyAiAEFtgRNdushsjKTJme0SOQG7iVy3kzsE2lsYE9bRTbCaPwHieEv0qWN6BLCLLJ
         PodRJ5ajEmKwMuV+6Yf/l2pVxf8grUQq+aKqv2wwDSqGiivcl/YjkrUH+o9ivSk0iT4+
         tIdLIXn2wcg0iZMKst/sOJqWBK27F0J6Y0Mkv2EJN8P2x8ERAuIEDpTwRG7wqgMaCxjE
         tf8gzxm4ntQ504ht6z6zm/CqoolV1mLz/l1K5ilve/YzKoImDqEMCgnKW9SSNQgut544
         D5Q4as2WFBybsatQ6vBVLF1sgjlXKXM9QvmMu3cXQyH/1gePm4Fw+mXFbB1f3SCVI+LJ
         QX/w==
X-Forwarded-Encrypted: i=1; AKwUvBwMAmD/3GKcIqWmsyjK6MrDFeDHXGcVah4PETshpf+esTxTvK8hpjym2bIRuUIAbDMQI7EQOwQrsl/w@vger.kernel.org
X-Gm-Message-State: AFuF++ntKFq7jmNMYcGiIILTi9v1fP/2VN1b5QRGJqX3mbCsDFAjSjr2
	N4LwsGVTuYpp2OpCj921tGY3fgq2GZYRgbzD7zuxgmMWWN8zexKNJoixZha8A1ySJ2zxZQufCjm
	AzAHxfUkVL+/DYe7dcgmCOm+PkMOZIGk=
X-Gm-Gg: AYBFou3eiwTN/HRzRnSiJos67RPBYKV6ocT83WWIOkZ4oD66Hsq5FNWj0OktFj3wJrp
	A6F4tl3QS1AMTXw1xVrS4mqnRBvNnC2IxZ9QRoM0+Fj9FudJYrDIVxaQEgf3sLUJ+MMjv3M5uDh
	Mw+3hSP60DdQNUKafGKkibA6BaagTme91A1EJ8twVjGWFX/FqaUOIJdLkbSWQVWQG3rDMnEnyf0
	CpOGj6VZ3gRXvAT+/8bE+twtGSdE/aHNAgAvMC8kbaoBpKbpq+k3tjFwDHiR3QqisAwTw50jK/e
	Te+DR0FDs3+qxggXaQSHPI54x2FkLqEopg2m8t4YTjXQ9zhvw3Te7M0N+X6JJctTwPdFftmFjad
	4aCdrnY74v9z61EBVMdHEBlP83VNQLkE=
X-Received: by 2002:a05:6122:a5c7:10b0:5c1:24b6:a1e0 with SMTP id
 71dfb90a1353d-5c7fbaf3b05mr2679642e0c.3.1788883450339; Tue, 08 Sep 2026
 09:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831183311.1090131-1-alexander.deucher@amd.com>
 <20260831183311.1090131-2-alexander.deucher@amd.com> <aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info>
 <e8a53eb241b2cc912e9cfad5f6a0120aa9683481.camel@mailbox.org> <apyTR-f8W6Jt7uP5@soda.int.kasm.eu>
In-Reply-To: <apyTR-f8W6Jt7uP5@soda.int.kasm.eu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Sep 2026 12:03:57 -0400
X-Gm-Features: AcwNN1UGWQ08V1C6NZZQaio8lehal8RQn4GKIdJFwvOdWZL0ItwTZuEEeLAGaiw
Message-ID: <CADnq5_PjN8X9V0PQ=no39NCAGM9Hp1JezOuKNpHqwo1=WfsPQQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/gem: Add callback for when handle count goes to 0
To: Klara Modin <klarasmodin@gmail.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Felix.Kuehling@amd.com, 
	Mukul Joshi <mukul.joshi@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:25=E2=80=AFAM Klara Modin <klarasmodin@gmail.com> =
wrote:
>
> On 2026-09-05 11:31:41 +0200, Manuel Ebner wrote:
> > On Sat, 2026-09-05 at 07:36 +0200, Thorsten Leemhuis wrote:
> > > On 8/31/26 20:33, Alex Deucher wrote:
> > > > From: Mukul Joshi <mukul.joshi@amd.com>
> > > > ...
> > > ...
> > >
> > > > > error[E0063]: missing field `handle_free` in initializer of `drm_=
gem_object_funcs`
> > > > >    --> rust/kernel/drm/gem/mod.rs:265:58
> > > > >     |
> > > > > 265 |     const OBJECT_FUNCS: bindings::drm_gem_object_funcs =3D =
bindings::drm_gem_object_funcs {
> > > > >     |                                                          ^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `handle_free`
> > > > >
> > > > > error: aborting due to 1 previous error
> > > > >
> > > > > For more information about this error, try `rustc --explain E0063=
`.
> > > > > make[2]: *** [rust/Makefile:799: rust/kernel.o] Error 1
> > > > > make[1]: *** [/builddir/build/BUILD/kernel-7.3.0-build/kernel-nex=
t-20260904/linux-7.3.0-0.0.next.20260904.221.vanilla.fc43.aarch64/Makefile:=
1442: prepare] Error 2
> > > > > make: *** [Makefile:256: __sub-make] Error 2
> > > """
> > > Full log:
> > > https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/ne=
xt/fedora-43-aarch64/10951622-next-next-all/builder-live.log.gz
> > >
> > > Reverting this change and 2/3 from this set fixed the problem for me.
>
> That leaves only the documentation without the feature so might as well
> drop 3/3 too in that case?
>
> Otherwise, the following also fixes it for me:
>
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index e1ebad77ebe2..847e0ee38863 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -278,6 +278,7 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, C=
tx> {
>          vm_ops: core::ptr::null_mut(),
>          evict: None,
>          rss: None,
> +        handle_free: None,
>      };
>
>      /// Returns the `Device` that owns this GEM object.
>

Can you send this as a proper patch?

Thanks,

Alex

> >
> > Verified.
> >
> > Thanks
> >  Manuel
> > >
> > > Ciao, Thorsten
> > > > ...
>
> Regards,
> Klara Modin
