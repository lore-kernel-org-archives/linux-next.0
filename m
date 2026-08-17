Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB14275AFD
	for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 20:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786999367; cv=none; b=QA0xJovriKEp2FycUB61fIW/BDFzQlWxtwpviH8YOxtcl+t/UfOHqmfOu8C3NvS2biZOWcA8qkHUxXZdLTZ6a51Q/bpsen2WzY9LIO8bo7ikpgJRUjp5/eAkzvGWATKcMWGm0AvO8sBcAx0Dr64JUP6VQ+Rp21ZKE/XvQXeW7qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786999367; c=relaxed/simple;
	bh=svWbXfeJLoudikg/olZabdLbTU2vCePAWMKSmhOlRFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIT/R6a0Kh/R14E/61Pe2OIVWwrDaqCVZad7QFjNbsmhMhSp0tOS5Pz5Ww/ah2NpyA7pXx8stcMlcv43noeVEXsjgfyM/YvLqrI0zKtTpHfj4J0UW+09s6i1sOitms9JhswgZjXUT3ARjVouLtK0wRqm63wU1/dYoHTi+GFzWgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5WR2Vn3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5WR2Vn3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1623F1F00A3F
	for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 20:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786999366;
	bh=RHAOt8UTxzN85DGTfPFFsjsSyRKJtP/i3bO5AOH6/MA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F5WR2Vn3PWneen8+CUWBgIEQylcY0x5iQfMnD9GBDaUBaZySYy+xW5KXDACea4iw1
	 fYyJSHqw0FSBYTkJFknsHR30ED9oqHBVCRAuns3LUEWAQIlbyuzLm5La+OybtceSr0
	 BvcHjik4M59u6y58CD8PwbyMal/yp1c25+t44/nu3kaowWUn0xCgRyg2Rwz7bsvjXZ
	 h0Ux9bHi0fA6QZ5QsIiUXjAv5DgeYAuVuGPaL0NQwa/7aSgzO5Orl2V1jIzOGv14/6
	 q/rdDxj7KbU1E2lNApdbGDIaO0d7shJK+jP3f0Qui+qiGcrSFWGeSZusaCj66goZ6X
	 C8vdGrCKF1hEQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b015b2d792so3538179e87.3
        for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 13:42:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqSNJHbgu+VjZAbvN850DX5JQ10gh55cW59hEmxSGflKMpBdbU7z/Q9HlkzWZQ1c+iku4IqR2xsYjaW@vger.kernel.org
X-Gm-Message-State: AOJu0YyMWFvjHsW+k4MMwqolpK4Dovs8pVTeb6xNfD/vbInmk1zdlwVg
	Vzmj1ZSm2WLSBzhlQ3o6s8O/j1Ir/j+Eppans85hDf1zsNK0bW48mEz2LEwj4LoLYK6VfPl4Ih9
	SaITR5jgs4d3BZ8XgmFZqLOHflQn1bJ4=
X-Received: by 2002:a05:6512:2507:b0:5b1:59ec:2452 with SMTP id
 2adb3069b0e04-5b47066ccfdmr464415e87.9.1786999364499; Mon, 17 Aug 2026
 13:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aoMvR5MHCsykmdEO@sirena.org.uk> <223f6f95-7212-49fd-9756-8e54ff3e4040@kernel.org>
In-Reply-To: <223f6f95-7212-49fd-9756-8e54ff3e4040@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 17 Aug 2026 22:42:15 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iN7jUhf9J7tUXOOx0BOtidrzRGUyVpVNSkkuUqLKPx3A@mail.gmail.com>
X-Gm-Features: AcwNN1W_cwX_WMM8EloAJuBy-bF6YOk5bfhMYYTt-8sWphr4y88t-06IWnpEKOw
Message-ID: <CAJZ5v0iN7jUhf9J7tUXOOx0BOtidrzRGUyVpVNSkkuUqLKPx3A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the pm tree
To: Danilo Krummrich <dakr@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Greg KH <greg@kroah.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 10:40=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On 8/17/26 5:56 PM, Mark Brown wrote:
> > diff --cc include/acpi/acpi_bus.h
> > index eaf13f6ac2d3a,7e57f9698f7ce..0000000000000
> > --- a/include/acpi/acpi_bus.h
> > +++ b/include/acpi/acpi_bus.h
> > @@@ -953,18 -996,6 +949,11 @@@ int acpi_scan_add_dep(acpi_handle handl
> >   u32 arch_acpi_add_auto_dep(acpi_handle handle);
> >   #else       /* CONFIG_ACPI */
> >
> >  +static inline struct device *acpi_bus_get_primary_device(struct acpi_=
device *adev)
> >  +{
> >  +    return NULL;
> >  +}
> >  +
> > - static inline bool acpi_of_match_device(const struct acpi_device *ade=
v,
> > -                                     const struct of_device_id *of_mat=
ch_table,
> > -                                     const struct of_device_id **of_id=
)
> > - {
> > -     return false;
> > - }
> > -
> >   static inline int register_acpi_bus_type(void *bus) { return 0; }
> >   static inline int unregister_acpi_bus_type(void *bus) { return 0; }
>
> Looks good to me, thanks!

It also looks good to me, thank you!
