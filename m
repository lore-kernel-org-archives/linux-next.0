From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Staging: comedi: Fix build problem
Date: Fri, 20 Mar 2009 21:36:34 -0700
Message-ID: <20090321043634.GB482@kroah.com>
References: <1237567010-30354-1-git-send-email-abogani@texware.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:40412 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750706AbZCUEj3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 21 Mar 2009 00:39:29 -0400
Content-Disposition: inline
In-Reply-To: <1237567010-30354-1-git-send-email-abogani@texware.it>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alessio Igor Bogani <abogani@texware.it>
Cc: Linux-next <linux-next@vger.kernel.org>

On Fri, Mar 20, 2009 at 05:36:50PM +0100, Alessio Igor Bogani wrote:
> [...]
>  CC [M]  drivers/staging/comedi/comedi_compat32.o
>  drivers/staging/comedi/comedi_compat32.c: In function =E2=80=98compa=
t_chaninfo=E2=80=99:
>  drivers/staging/comedi/comedi_compat32.c:135: error: dereferencing p=
ointer to incomplete type
>  drivers/staging/comedi/comedi_compat32.c:139: error: dereferencing p=
ointer to incomplete type
>  drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing p=
ointer to incomplete type
>  drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing p=
ointer to incomplete type
>  drivers/staging/comedi/comedi_compat32.c:145: warning: type defaults=
 to =E2=80=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
>  drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing p=
ointer to incomplete type
>  drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing p=
ointer to incomplete type
>  drivers/staging/comedi/comedi_compat32.c:145: warning: type defaults=
 to =E2=80=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
>  drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing p=
ointer to incomplete type
>  drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing p=
ointer to incomplete type
>  drivers/staging/comedi/comedi_compat32.c:145: warning: type defaults=
 to =E2=80=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
>  drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing p=
ointer to incomplete type
>  drivers/staging/comedi/comedi_compat32.c:145: error: dereferencing p=
ointer to incomplete type
>  [...]
>=20
> Signed-off-by: Alessio Igor Bogani <abogani@texware.it>
> ---
>  drivers/staging/comedi/comedi.h      |    4 ++--
>  drivers/staging/comedi/comedi_fops.c |    8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)

Hm, I just fixed this in a cleaner way, and copied you on that patch.

thanks,

greg k-h
