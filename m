Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF6F372075
	for <linux-next@vger.kernel.org>; Thu, 21 May 2026 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355548; cv=pass; b=JbW0fV2X18eegfr7s+7CoNETJ5WNFKX9ulEKEjp5xZQ6Nt64YYirb+jym+rGRcPGCjByQ5bw1dktpGK8nJVOEji4yO+ROJinqm5RfJv9pw3PeaD1fKx8Lyzw6Yo7wTUMl70ngThiiOoqMoOeU39Y6eQopmKLFedy/DqHVtSAWX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355548; c=relaxed/simple;
	bh=js5SDLK+zkCRrpw2+cbIyuFJc9IaprQPZ/lIZpi0Edg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YINNRK9KEv1rp5w2DiCKNeXyKJNCPC4aEblB2NxQLT2a6S90pd6jfcIY897TrDcl4hlXSl7A79egcFAR8HFUvYCv9uggtK0OhKUFAv0KizB9JBXoeo5Ec3HGLGz7RAp8zyRpw0wAP163bksPsDm087aKyjvtePGvJrwUPUpG/G4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGe50TOP; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGe50TOP"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bd2087858c4so1231254766b.0
        for <linux-next@vger.kernel.org>; Thu, 21 May 2026 02:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779355545; cv=none;
        d=google.com; s=arc-20240605;
        b=IM4ZCVjhpvmDteaWmrfGgwxpw1Lox9PMcIxLsQ91UukAJpaBec53ROC3E5Q83U1+OS
         sRxMEZvplJ0l9gK1usRJS/xCjCRW2kHS2Bv1HvmWpAVCzYIRaTICnzrGELtzDvuaxW+3
         wkPxuqbsF0zTINIFixFdhqTPXSQvrMGaqAidM7IRX2Qj2mKFrhdYCpuFojoBojtv7oLH
         3KV0RJlwf9/kwP0CjTglJnc+UqsArkbhJjjow7Q5ynOcCzuyHAMIa0P6DDQg4UCNDp8j
         tP7BQCGwOFJGt4CasOSC4Bk+FivHbKXfPsv6vY7ov6hkhoP9VSmQX3AuinEIhQJ4Qe+8
         I/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Le9UrzUF2lq64cth3vk6I47k2qcnr5fpjM2SaIXhn1M=;
        fh=Bh5k8yWGj+YVo19tKlaVUSEB62hlmXKG/vNe5MTa+Ms=;
        b=gYw6LkIMBmxm3I2HnVsj3b1KQHnJP70qnKZiPrrQF2VPi4wwWSJZHrHFaARcp1xAEK
         5yIySFDG4csn0XP3cbN8YzO9cGkzhu7OXbNDtGrxGJpQBQAiWRt0sTtsmAxwCmYSIesQ
         Pl662nHyjwesXgadDjndaNk2odgMyCEXT/zkShBzzmqwmmPVesfAKACxqGVj2KNjU7DO
         1X7NEjxW0Vu1t+EgfZqiu+YgWUVVRer80vmDCa9rdE4BrI12J1HslXwXLds/dPXLJ1Ew
         jxfewt/4cHH+C3EoFCBOMxDc8nv/R/JgzZHdidnl6peJ/rWMEPD8oCSdlb+COPmTMlOR
         PPwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779355545; x=1779960345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Le9UrzUF2lq64cth3vk6I47k2qcnr5fpjM2SaIXhn1M=;
        b=kGe50TOPy7NBVuNK5xjUymqaH8WTqVZSN26ho+io0NMgNAbAwK5LLmaVTLooJcZjXE
         3hn2ldoOmVaRKXSHdOaTvCccC92kDd4aTo3JNcCwGcYccxELorv5zz4FA22x5QY3Q1D2
         wYaTlqQ33mYktDEdhqru8irTq489xqNvzQoq+zOPEc0IEvrxNAiuPL9e1HxkJuhTFPim
         qGp5THbegOYZ5bg7I6G0hrBCkdStOz24zedo3Caa67M6dMW+EyX6yB9x5MY6fnNpeMzH
         4tuvrX5EhRIF3vC09Rl4LWWxKvfDmE+nb+0PztA2hT7ikpNjSKhcC6EeT5Ksly/UJMo9
         R04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355545; x=1779960345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Le9UrzUF2lq64cth3vk6I47k2qcnr5fpjM2SaIXhn1M=;
        b=rwUg+B4YhiDUsC/X4fN/PBdThuSsno7C4iOo1EiIsoGkT6dNzro3bh6e4MXO8cU0FC
         tBudbpRUzhSGfsH3JoqqWIN29FqaIHxl02bOnM+AQQ/2jJ2oO/fydI6MlOc6KnNk2f7C
         Pfe10JwRiNexDSGhOhgV+BY79B+tF5sI8baEWH+9mYqE3Igk72Ai8sF7htKCtau3TmhH
         1GqszDyVINVYeIxItOBi+Cn08lP2s3qvohfXG1HdNXSLyZHjMEMKeMO1rG7fSgYtvW05
         zF5Wr5/mMPdXqkPwtdUJc67TOvG/rB0fBsJ/IxnqqPOK2EKAZqSlmAwbnIMermuz3neq
         C/bQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NMbR8//72ItlkqO9lpmLSShPMdmYHNphgL/kDdrxi2KjJm1C7TFVqQLXPFdZOsymCkvC/6ZS+XGpz@vger.kernel.org
X-Gm-Message-State: AOJu0YwX10ki/7sjOKb/JMm0WiqM6LHpdH0I+neUVhS6XG906hSF+kWv
	2Eg+I0o4C9gjQieuwAlY3VXnl6ysD5pXEGdrzn0haosgB9pHqz1t42w0/MACREhVCq/JicfZMUx
	bd/EOXRdyYWX5s6ndx6LEVGSQbQbm5W0=
X-Gm-Gg: Acq92OHhKQwcy+JWfxpGFHVjhSaZSzPJEiZIOjuDgqBbk4Zfh4qgNQpaG4zHgucuSSe
	xhtrmWZPbkB9h50J6kAQcJrQ9caZggVHlMuikYg0JMZIqA8B9nVGKAQzI7IyCuFb19UvGjVRHkZ
	1drYGTiuLs38U11M0aTbIr9mfAfyHqSaIShDD9nHzAicA01uCLe12g9gyte49iF/45Z8x4TyJqQ
	U2/LshCIdy1QL+Uw21cws4N2WgBOsNSi94nYM2j7Xnf6jPS+h2fimIybR39MssdpyYWfxNjPEbD
	EVaadGwxX4gaNCLuUcZV+mFnlZp67MpUeOXGyKe3SDDX34ca3Q==
X-Received: by 2002:a17:907:86a2:b0:bd5:7c2:70c9 with SMTP id
 a640c23a62f3a-bdc15f2bc24mr113789266b.47.1779355544910; Thu, 21 May 2026
 02:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520225245.2962-1-spasswolf@web.de> <fnrz73n5jojl2wlbgrsjdtu5zuwykwbcjzznaijbquuovpoand@i6ihdqn7a6zv>
 <s7cu3dpioidx6mepmai6eyj2pxjs4skbw7v534zbzs6g2fwcis@cvokidcxy3xa> <4f548d61b2dd12e01f401ce4b8c865f238f7b23c.camel@web.de>
In-Reply-To: <4f548d61b2dd12e01f401ce4b8c865f238f7b23c.camel@web.de>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 21 May 2026 11:25:31 +0200
X-Gm-Features: AVHnY4KJNdKYQyfq9dcrIQyWHKYMB450aGPW4UBSN6VH-WfCBVPg7E2sdrdWSX8
Message-ID: <CAGudoHHaEFbft-SmPV+yTj6uMvNYWRQNYAWDP2x_sS=BcvesqA@mail.gmail.com>
Subject: Re: context switch within RCU read-side critical section in
 next-20260518+ with PREEMPT_RT
To: Bert Karwatzki <spasswolf@web.de>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, adobriyan@gmail.com, jack@suse.cz, 
	viro@zeniv.linux.org.uk, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 11:21=E2=80=AFAM Bert Karwatzki <spasswolf@web.de> =
wrote:
>
> Am Donnerstag, dem 21.05.2026 um 11:09 +0200 schrieb Mateusz Guzik:
> > On Thu, May 21, 2026 at 10:53:03AM +0200, Mateusz Guzik wrote:
> > > Christian, can you fold this in please.
> > >
> > > diff --git a/fs/filesystems.c b/fs/filesystems.c
> > > index 771fc31a69b8..8f17c0abbc95 100644
> > > --- a/fs/filesystems.c
> > > +++ b/fs/filesystems.c
> > > @@ -289,6 +289,7 @@ static __cold noinline int regen_filesystems_stri=
ng(void)
> > >          * Did someone beat us to it?
> > >          */
> > >         if (old && old->gen =3D=3D file_systems_gen) {
> > > +               spin_unlock(&file_systems_lock);
> > >                 kfree(new);
> > >                 return 0;
> > >         }
> > > @@ -297,6 +298,7 @@ static __cold noinline int regen_filesystems_stri=
ng(void)
> > >          * Did the list change in the meantime?
> > >          */
> > >         if (gen !=3D file_systems_gen) {
> > > +               spin_unlock(&file_systems_lock);
> > >                 kfree(new);
> > >                 goto retry;
> > >         }
> > >
> > >
> >
> > Even better, I got the above fixup + some polish listed below:
> > - removed an extra space in newlen calculation
> > - the WARN_ON_ONCE case needs to free 'new', not 'old'
> > - there is no READ_ONCE anymore in filesystems_proc_show()
> >
> > goes into the "fs: cache the string generated by reading /proc/filesyst=
ems"
> > commit.
> >
> > diff --git a/fs/filesystems.c b/fs/filesystems.c
> > index 771fc31a69b8..712316a1e3e0 100644
> > --- a/fs/filesystems.c
> > +++ b/fs/filesystems.c
> > @@ -269,7 +269,7 @@ static __cold noinline int regen_filesystems_string=
(void)
> >       hlist_for_each_entry_rcu(p, &file_systems, list) {
> >               if (!(p->fs_flags & FS_REQUIRES_DEV))
> >                       newlen +=3D strlen("nodev");
> > -             newlen +=3D strlen("\t") + strlen(p->name) +  strlen("\n"=
);
> > +             newlen +=3D strlen("\t") + strlen(p->name) + strlen("\n")=
;
> >       }
> >       spin_unlock(&file_systems_lock);
> >
> > @@ -289,6 +289,7 @@ static __cold noinline int regen_filesystems_string=
(void)
> >        * Did someone beat us to it?
> >        */
> >       if (old && old->gen =3D=3D file_systems_gen) {
> > +             spin_unlock(&file_systems_lock);
> >               kfree(new);
> >               return 0;
> >       }
> > @@ -297,6 +298,7 @@ static __cold noinline int regen_filesystems_string=
(void)
> >        * Did the list change in the meantime?
> >        */
> >       if (gen !=3D file_systems_gen) {
> > +             spin_unlock(&file_systems_lock);
> >               kfree(new);
> >               goto retry;
> >       }
> > @@ -321,13 +323,12 @@ static __cold noinline int regen_filesystems_stri=
ng(void)
> >                * generation above and messes it up.
> >                */
> >               spin_unlock(&file_systems_lock);
> > -             if (old)
> > -                     kfree_rcu(old, rcu);
> > +             kfree(new);
> >               return -EINVAL;
> >       }
> >
> >       /*
> > -      * Paired with consume fence in READ_ONCE() in filesystems_proc_s=
how()
> > +      * Paired with consume fence in rcu_dereference() in filesystems_=
proc_show()
> >        */
> >       smp_store_release(&file_systems_string, new);
> >       spin_unlock(&file_systems_lock);
> >
>
> So it was commit 36b3306779ea
> ("fs: cache the string generated by reading /proc/filesystems")
> which caused the problem. If I had finished the bisection properly instea=
d
> of cutting I probably would have noticed this...
>
> So I tested
>
> diff --git a/fs/filesystems.c b/fs/filesystems.c
> index 771fc31a69b8..8f17c0abbc95 100644
> --- a/fs/filesystems.c
> +++ b/fs/filesystems.c
> @@ -289,6 +289,7 @@ static __cold noinline int regen_filesystems_string(v=
oid)
>          * Did someone beat us to it?
>          */
>         if (old && old->gen =3D=3D file_systems_gen) {
> +               spin_unlock(&file_systems_lock);
>                 kfree(new);
>                 return 0;
>         }
> @@ -297,6 +298,7 @@ static __cold noinline int regen_filesystems_string(v=
oid)
>          * Did the list change in the meantime?
>          */
>         if (gen !=3D file_systems_gen) {
> +               spin_unlock(&file_systems_lock);
>                 kfree(new);
>                 goto retry;
>         }
>
> with next-20260519 (no RT, no LOCKDEP) and got no crash so far (4 boots o=
nly though (next-20260619
> crashed in 2 out of 3 boots without RT)) but I get this warning on every =
boot:
>
> [    2.793416] [    T331] ------------[ cut here ]------------
> [    2.793433] [    T331] DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)
> [    2.793434] [    T331] WARNING: kernel/locking/mutex.c:625 at __mutex_=
lock+0x586/0x10c0, CPU#17: (udev-worker)/331

Just so that we are on the same page: if you take the -next tag as is
and revert the "fs: cache the string generated by reading
/proc/filesystems" commit alone things work fine?
