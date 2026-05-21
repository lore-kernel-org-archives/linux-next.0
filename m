Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E32B371D15
	for <linux-next@vger.kernel.org>; Thu, 21 May 2026 09:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355084; cv=pass; b=R1qwMAuy8I/ceaHewP8Aum5bvhChq6mkjjmCaCpG2ZIzOMKJaxsNb8clBhryrpjeBhGBJK6igj3cSdCh/h2ak1PeglyoBp1F08pBmj4ar4k7BCcan27mYsZ6lFK6akyc7g8hOxrTmqp/8MbEVLzLEL49yKZBkkcoE5vnLqIpkWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355084; c=relaxed/simple;
	bh=vwnfSdJLdKaz9ZvYKHUKW6o9hMPAY38OWs/+ezdVxbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SBdzjUFNv88hjTXaogEetktZhOaDeFfrH1HV3tPDRUnpOuLl9a7c0e4x8DpTxmCRKLpjXBjlx062cHPw2DBVzkAbEUXUrNeFSPuq6DRUJqoZbnzHl8I2qpa04kAIrsICC3e5E1jYaTc6eEqV3ONHsQT2+HuEyD64zs3nxJFfum4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W38zozNq; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W38zozNq"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd85ebb368fso855694966b.1
        for <linux-next@vger.kernel.org>; Thu, 21 May 2026 02:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779355075; cv=none;
        d=google.com; s=arc-20240605;
        b=JmTKsa+Rokh1d+N1EdO4z2xy9uV/2+nGlRLTkJUnv8gngrvUh2N+0utsORXQc20KYp
         sergb5y+lFK1+eO1sAnsH7DxRjIywo+3Gh4qmSQx8WCnbofgw4r4yIQwRxX8Q7emVnfm
         0enPkI0C//N7TQKP7svr6lgMUt2r2p256Gcn+dTs89RyKbhXgE1GnvQoJSVHnNVQNamc
         KthJmEFrc3NPCqr88tEWBrrjge/7LtrnJYQe2857gwAiScJUoX0NtyDTQ8Czg5IO/z2T
         w8yi0yvlkrr2REXojEic8EkSn462QpXmOLSZggqdc6JX3mNY5QwWlJ7hWXB8QZDSi2e6
         9Dng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dz3+FDOFPvj/C8tgF4g8dO7NJ50HOG7kSmIeflMib8c=;
        fh=QgtqVVPYIt4B2jfdbrcb+/Fqwiww6bp08Y0oEvRoT9g=;
        b=WCFxSr5isBYEZoXSEgDoRIujwo03pv33a6ewgMYAQzgDBYH5SlZafoChIGlfoZQt6k
         T4UdD3ZwIywAbFXmrvaInHfLcHDRMH6bhfkkS3P3UcRKOGDpZ4MuEpMSp6hygVl+ExUw
         Szmc6jUVV42GR5owBc74gURbWxNVvZmLQqMzkdM8Afi/5Zo+ylHwMUyM6kQG5So0ivJE
         mFG3l0gbALrB77ly/H3LnAAI4jLDzkx8W0enNOcHIJAk6tc5lTsX0uZCoHtsvcj+NBfJ
         B8s7uxHCDSWYAl4wv8WMnwjA/jVMiG3clwcplf9LdWiVVsGHJg0wmi6s1HOaxa3SAxpV
         cttA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779355075; x=1779959875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dz3+FDOFPvj/C8tgF4g8dO7NJ50HOG7kSmIeflMib8c=;
        b=W38zozNqryrQLJ38gOwf/d0E780psCsJOvIl9E5WXWCDipJqX5W16rdQBmdLQrBJmN
         0jIDMBrzaG4gP7SMBbJyd3IKKebaHo9sUm2c1nxdO1jmAATIgNFH2xam6+7UGFj6Osir
         /XRD4uw/oaBWaQ4EFDbSETcDga4Zcdk5DH8lf6GemUJF9Toaf2iFjiSAEJutnDkj52hI
         QzlPtMJsVH7AZeeD7xlvFvBasUMsnHNBx2xtNIU5XKNSIo0gKibYCuHUwEBD5w/x7gb1
         Xl6AW7/GTXXal4ATgzEkSKqASEQ5iraRHqxSgzT/67NzCn2sv9Bl977gz4fLwjygum+c
         Rchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355075; x=1779959875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dz3+FDOFPvj/C8tgF4g8dO7NJ50HOG7kSmIeflMib8c=;
        b=k9npk4Y9C5lfxi11fD7WsmsGmKNyr5Q6iNXeok5ZgPmWM0aHqBejYkfnfR23FIOfdH
         4k5I92rysND0YMS9k0z/kn0wNAVuYxuqVXwbWDTXhg6GKasEa8FjS6w4gyprs0a2YnlQ
         9WOh6TdKPV6JndLOnj4MV0ax5QOU5PaOrluBuL/lFnFnJaXkyXDbLu9VMKP/7n4+etde
         q0QZO8NWBM8uf1/ePL32tBJRC8DZez23aS5d9jrvr4iDnNU1QD4sln+qbeLSiMrBd0Pt
         HHjZsOttYoV+XaxwSSTnOeqqBQkJTZNIw7juhz5A9sVKycW2Y7I70fzpSHAifKPeUUjF
         UXoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+16GC6ZiyJOE2gZoj7Z9NjOKu9Ez1kruB7QPsc1G9RsswZRCfEn4OiUod9fPIlSSviOrh7uKwESv9B@vger.kernel.org
X-Gm-Message-State: AOJu0YzvIsC0AtXgyCfBkjpK3emjB+L17ts7HlpAbzGTe2Hj7FaSmhPk
	ZTTgu7d6K7ph3xVwiUPCl4QBYHlsbgJP8R+SH3LA5Yd9s40P/FzJL/kG2GFyZPBnVDOJS43Jnzg
	GznfCHHdyJiLf04cCK4tTM4cz8ZvxiO8=
X-Gm-Gg: Acq92OHNf5AYNzmhIeah0UYRpBHyfLeLgMuemN+/h0nuDKifh8nt5KWgZqz0Z4mH0av
	YWNEO93DlDM7xZSxgfvvBX9J8txtEF0dTfUqdBvxHhDMy8gZfY60tGPnB2j2ksgxfw/0vBu6xAc
	4yFbo8rqs+Pk2/Z5DV+ZvniPV4qwpXb0m5mljbsquZVAtkCtzm3y5k3KtV90wD2P4kRbgFAvSlv
	72vN4y62xZjvrzRF1agcTftEnu711DaR3BpWBuw3ddXpe55oOwvp6l3BxZW3FaanTh1KVUtYQcx
	U9Iu82wDjS684NWYKkmIjBo8ij4jk0MGimLuhzQ=
X-Received: by 2002:a17:907:c706:b0:bd6:6f5e:ea6f with SMTP id
 a640c23a62f3a-bdc12f8ce8bmr110244466b.19.1779355074839; Thu, 21 May 2026
 02:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520225245.2962-1-spasswolf@web.de> <fnrz73n5jojl2wlbgrsjdtu5zuwykwbcjzznaijbquuovpoand@i6ihdqn7a6zv>
 <20260521090835.hz0aIRaQ@linutronix.de>
In-Reply-To: <20260521090835.hz0aIRaQ@linutronix.de>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 21 May 2026 11:17:43 +0200
X-Gm-Features: AVHnY4KUqUzhgX_BVVTF4RDqMYY98JVjveuj779cZ0EwzI7KynJ8upkWRPUw0Ic
Message-ID: <CAGudoHH0UHvLapX-DhLR=UGv+E6LwjPA28mdSgZydrnsqQw3wA@mail.gmail.com>
Subject: Re: context switch within RCU read-side critical section in
 next-20260518+ with PREEMPT_RT
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Bert Karwatzki <spasswolf@web.de>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, adobriyan@gmail.com, jack@suse.cz, 
	viro@zeniv.linux.org.uk, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 11:08=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-05-21 10:53:03 [+0200], Mateusz Guzik wrote:
> > them in place, but when I was rebasing on top of the RCU-ifing commit I
> > figured I'm going to do guard/scoped_guard in there as well. Later it
> > started failing as the compiler did not like goto retry out of a scoped
> > guard area and the unlocks did not come back.
>
> futex_hash_allocate() has a scoped_guard a goto to again. In case it
> helps.
>

Huh, now I slapped the following for testing purposes and it compiles:
diff --git a/fs/filesystems.c b/fs/filesystems.c
index 771fc31a69b8..d21d264672c5 100644
--- a/fs/filesystems.c
+++ b/fs/filesystems.c
@@ -282,7 +282,7 @@ static __cold noinline int regen_filesystems_string(voi=
d)
        new->len =3D newlen;
        new->string[newlen] =3D '\0';

-       spin_lock(&file_systems_lock);
+       scoped_guard(spinlock, &file_systems_lock) {
        old =3D file_systems_string;

        /*
@@ -320,7 +320,6 @@ static __cold noinline int regen_filesystems_string(voi=
d)
                 * Should never happen of course, keep this in case
someone changes string
                 * generation above and messes it up.
                 */
-               spin_unlock(&file_systems_lock);
                if (old)
                        kfree_rcu(old, rcu);
                return -EINVAL;
@@ -330,7 +329,7 @@ static __cold noinline int regen_filesystems_string(voi=
d)
         * Paired with consume fence in READ_ONCE() in filesystems_proc_sho=
w()
         */
        smp_store_release(&file_systems_string, new);
-       spin_unlock(&file_systems_lock);
+       }
        if (old)
                kfree_rcu(old, rcu);
        return 0;

curious, but ultimately does not matter. I think the current code is a
little better without the guard stuff in this particular place due to
kfree calls.
