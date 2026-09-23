Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D023451CF76
	for <linux-next@vger.kernel.org>; Wed, 23 Sep 2026 16:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179831; cv=none; b=ac0rqkjdeOTfEocUpmMYZWWxBAnYyx7rwFFLtvdsKmqNiKOhIM8WzJUB2kp4CuhceZ4IQ6CzBsrkCpTp7qNpHk5IAl4HnOv6vAywZaIg0Zn3Ip4OqIR7GHFxDE3SvI5wn7kCIZe8qlISxrodlcgBpaqfYPckEwMHQYU/iN83scE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179831; c=relaxed/simple;
	bh=F8URLCaUitjATe8JY1YV994lNk7CBmwcQeT9MwEsjaw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aJGH3K7mR5IJ8+jfJwMuE7YJhbj91UtDsmwpUlVjlZFjcqr3iZ2DxD6MkBZSLzzzi1kaPxyX04Vor9YNJurenBQyE5fBPQra8xs1gAsi0GW2sCXB9TF4LHbEJL6RHyV7t4U3qhZYhnXkLGY5HBPpFBwWJg/mg5/Nl92Tupnk2DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWVnDRbB; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWVnDRbB"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ece3so933210f8f.3
        for <linux-next@vger.kernel.org>; Wed, 23 Sep 2026 09:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790179825; x=1790784625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/m+xiy+W25B92wmd6RZuaKFriyhGLBFjHM3TjBy6f1Q=;
        b=HWVnDRbBy1gsi1SuHKJyECJNgQEMaPBKN6V926/elFtABO8ObdqgIicoOM+Y6Pd3CA
         4V7LhcK7GkXfU7TLxEt1FKm2lQ8C9F/xpMZ1PPgJdUe+Gq8GswOBlnusHX/aIYGzzlmz
         BGt33Fiq0KeZv4r+Z0j58S6sURkfuyqV81XicfgXeOJvx0fGSESeNa+EC0lj3JDll4ew
         GZI0OMWsF4L/aNzGNe5lkyU84c4oSmrAs8QiD3GBPedTp7KoHZ6b6zU8a7BkTux5MbAO
         ZbE+lXdgURjOeRIyrXMnJo5voC3xfH2rFFI679mMSzD/CmDLy0H4sm8jRCG0hHsYmlsc
         n86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179825; x=1790784625;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/m+xiy+W25B92wmd6RZuaKFriyhGLBFjHM3TjBy6f1Q=;
        b=yFUynAKwlHvi+FN7+qPIg2Avu6NeB8GOTzO/PuozNmL/TMHwR5LLftldL6gLX2HFBT
         EY1E6rbn/ncAOu2wcmLh2jRmhyFWQmvzXZ34vzEHiUrRFkMMYECf0YyXESJq4O+o9ytS
         J/Fx9oD9kfyHPkOTsWGa/xZegfLDzCrYfFCSgc/tMlkpgsN8kru1wlFqTTKD+pGJnjOQ
         PkAh9aS5PzpEYfgSzO53Vzbr+pqgILXKs53gcIsmq2J8GfEOROB1pP9CdAHp2MaoZevE
         BEm1NbCMI7Ki9ShYiUa9eDgx/OddfxbvPzDjf19oWKPWBx77yWoyqZ/4yYL/eOn4GqwS
         1ymQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3zfGfKrThmDwcpHwp99je6tJ+9D4BY9GFvR530sNQf3fISzn82QSgQlkPGi7/vOP5xRlpx16U5oeQ@vger.kernel.org
X-Gm-Message-State: AFuF++meq8h3l7tno5JVUyVdNQ55J53EXDwxvVmmVlSfsCk0W57lDhwG
	c3I7aKEpg34E7lsrg9NO1XBFl+ZqzASQ6KtJ1RLSacXYEadGLOZNg7JqSvvuw+sz
X-Gm-Gg: AYBFou1c2x7QsO7P+ADkwCyduitWy72aqnmr3IOxasgEyHXyvqfQc66uCIG8PN7hMLn
	/GZyaiNVeFBxyduY9Uv3OpsKbt1s71ucuvfgirjR6RFt0FpDPMIwfsJXGSTuevUk7htXTDlAL0B
	83yldIv5bjm33EU8bJBmePojCfjytl6VOYVkRFqe2hV4i1OJyHvrWMovhNlEgxvlaM58CrDEZkS
	+qEHTK/eaSj9ph09U+xSZHn+eNZV61wFH+Gqjaz88rObLV9dVJN5YaO11ZyAT6pUijevl3aSIb2
	GGOImn2ci8YptfImhIHu8jpE5zIe9QgQvSmYC37lZ6dz5KXB7zeGieJa9SJjS2tCX8q3OGgpMdk
	JF0pjloPFWrzaWUbBB4gH9YgZnY5pJagld5q7jVdv0n1yO/TCCfSEvjnYf9LNP9bwZrXhj7Fhxr
	wChm2HsYdG3Nmjctk97yU52XnbKFvZtjaU/J/tqUElpjmgN3HmhYbq7fP1E0r5sVlDqJcGFGf+9
	NkzqvlNNfBxgft1CM3o1g4IMUX9vwI=
X-Received: by 2002:a05:6000:288d:b0:487:169f:d341 with SMTP id ffacd0b85a97d-4886704a284mr5838759f8f.12.1790179825329;
        Wed, 23 Sep 2026 09:10:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682676c7sm7525620f8f.3.2026.09.23.09.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:10:24 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:10:23 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List 
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [built failure] aicdb.h / __udivdi3
Message-ID: <20260923171023.5a134671@pumpkin>
In-Reply-To: <5d00e8d9c5e8118477efcafeb19b1347268bcc38.camel@mailbox.org>
References: <1ccf42a99c89502a7a5e7038ed2ab2aa5a24dd7a.camel@mailbox.org>
	<0aa303bc-d3e9-4670-91e5-8299ddfcb6db@infradead.org>
	<5d00e8d9c5e8118477efcafeb19b1347268bcc38.camel@mailbox.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Sep 2026 15:41:59 +0200
Manuel Ebner <manuelebnerli@mailbox.org> wrote:

> On Tue, 2026-09-22 at 12:25 -0700, Randy Dunlap wrote:
> > Hi--
> >=20
> > On 9/22/26 11:13 AM, Manuel Ebner wrote: =20
> > > Hi,
> > >=20
> > > I did some built testing with randconf and got some build errors.
> > >=20
> > > First error is:
> > >  =20
> > > > $ make KCFLAGS=3D-Werror -j8 > make_output.txt
> > > > aicasm_symbol.c:47:10: fatal error: aicdb.h: No such file or direct=
ory
> > > > =C2=A0=C2=A0 47 | #include "aicdb.h"
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~ =20
> > >=20
> > > This could be fixed by installing libdb-devel.
> > > But than I got this error with the same configuration:
> > >  =20
> > > > $ make KCFLAGS=3D-Werror -j8 > make_output.txt
> > > > date
> > > > drivers/scsi/aic7xxx/aicasm/aicasm: 880 instructions used
> > > > drivers/scsi/aic7xxx/aicasm/aicasm: 25 of 37 register definitions u=
sed
> > > > /usr/bin/ld.bfd: fs/exfat/super.o: in function `exfat_set_vol_flags=
.isra.0':
> > > > super.c:(.text+0x622): undefined reference to `__udivdi3'
> > > > make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Erro=
r 1
> > > > make[1]: *** [/home/manuel/skripts/next/Makefile:1390: vmlinux] Err=
or 2
> > > > make: *** [Makefile:248: __sub-make] Error 2 =20
> > >=20
> > > What can I do about it?
> > > Is it me/ my system or the kernel? =20
> >=20
> > For the fs/exfat/ build error:
> >=20
> > What is the target (x86_64, i386, arm64, arm, etc.)? =20
>=20
> My system is x86_64.
> But i guess this means the target is 32 bit:
> > CONFIG_X86_32=3Dy =20
> The rest of the .config is below.
>=20
> > What is the compiler and its version? =20
>=20
> gcc (GCC) 16.2.1 20260819 (Red Hat 16.2.1-2)
>=20
> > That error usually means that the target is a 32-bit CPU
> > and the code in question is doing an unsupported divide or
> > modulus function. =20
>=20
> Can the dependencies in the .config be improved to to make this issue imp=
ossible?
>=20
> > It possibly should be using a kernel macro from <linux/math.h>
> > or other headers. =20
>=20
> I figured I didn't successfully checkout next but this shouldn't change t=
his error.

I just tried to build the .config from below against a 'quite recent' linux=
-next.
If fails for a couple of unrelated reasons - I edited the config to fix the=
m.
But there isn't a divide in exfat_set_vol_flags().
I can't see one in the source either.
The usual 'next stage' is to disassemble the .o file and work out which
source line is responsible.

David
