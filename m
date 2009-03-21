From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Staging: comedi: Fix an other build problem
Date: Fri, 20 Mar 2009 21:36:57 -0700
Message-ID: <20090321043657.GC482@kroah.com>
References: <1237567072-30463-1-git-send-email-abogani@texware.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:40413 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750882AbZCUEj3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 21 Mar 2009 00:39:29 -0400
Content-Disposition: inline
In-Reply-To: <1237567072-30463-1-git-send-email-abogani@texware.it>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alessio Igor Bogani <abogani@texware.it>
Cc: Linux-next <linux-next@vger.kernel.org>

On Fri, Mar 20, 2009 at 05:37:52PM +0100, Alessio Igor Bogani wrote:
> [...]
>  CC [M]  drivers/staging/comedi/comedi_compat32.o
>  drivers/staging/comedi/comedi_compat32.c: In function =E2=80=98raw_i=
octl=E2=80=99:
>  drivers/staging/comedi/comedi_compat32.c:451: error: =E2=80=98comedi=
32_chaninfo=E2=80=99 undeclared (first use in this function)
>  drivers/staging/comedi/comedi_compat32.c:451: error: (Each undeclare=
d identifier is reported only once
>  drivers/staging/comedi/comedi_compat32.c:451: error: for each functi=
on it appears in.)
>  drivers/staging/comedi/comedi_compat32.c:454: error: expected expres=
sion before =E2=80=98)=E2=80=99 token
>  drivers/staging/comedi/comedi_compat32.c:454: error: expected expres=
sion before =E2=80=98)=E2=80=99 token
>  drivers/staging/comedi/comedi_compat32.c:457: error: expected expres=
sion before =E2=80=98)=E2=80=99 token
>  drivers/staging/comedi/comedi_compat32.c:457: error: expected expres=
sion before =E2=80=98)=E2=80=99 token
>  drivers/staging/comedi/comedi_compat32.c:460: error: expected expres=
sion before =E2=80=98)=E2=80=99 token
>  drivers/staging/comedi/comedi_compat32.c:460: error: expected expres=
sion before =E2=80=98)=E2=80=99 token
>  drivers/staging/comedi/comedi_compat32.c:463: error: expected expres=
sion before =E2=80=98)=E2=80=99 token
>  drivers/staging/comedi/comedi_compat32.c:463: error: expected expres=
sion before =E2=80=98)=E2=80=99 token
>  drivers/staging/comedi/comedi_compat32.c:466: error: expected expres=
sion before =E2=80=98)=E2=80=99 token
>  drivers/staging/comedi/comedi_compat32.c:466: error: expected expres=
sion before =E2=80=98)=E2=80=99 token
>  [...]

Ah, sorry, I just fixed this before I saw your patch (based on Randy's
previous complaint.)

thanks,

greg k-h
