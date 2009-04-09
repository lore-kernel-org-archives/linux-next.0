From: Greg KH <gregkh@suse.de>
Subject: Re: [BUILD FAILURE 03] Next April 9 : x86_64 randconfig
	[drivers/staging/go7007/go7007-driver.c]
Date: Thu, 9 Apr 2009 08:26:40 -0700
Message-ID: <20090409152640.GB4475@suse.de>
References: <1239272681.5188.37.camel@subratamodak.linux.ibm.com> <1239286279.5188.74.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45855 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935008AbZDIP3T (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Apr 2009 11:29:19 -0400
Content-Disposition: inline
In-Reply-To: <1239286279.5188.74.camel@subratamodak.linux.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Subrata Modak <subrata@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-kernel <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, sachinp <sachinp@linux.vnet.ibm.com>, linux-next <linux-next@vger.kernel.org>

On Thu, Apr 09, 2009 at 07:41:19PM +0530, Subrata Modak wrote:
> Observed the following build error:
>=20
> CC drivers/staging/go7007/go7007-driver.o
> drivers/staging/go7007/go7007-driver.c: In function
> =E2=80=98go7007_register_encoder=E2=80=99:
> drivers/staging/go7007/go7007-driver.c:284: error: =E2=80=98TUNER_SET=
_TYPE=E2=80=99
> undeclared (first use in this function)
> drivers/staging/go7007/go7007-driver.c:284: error: (Each undeclared
> identifier is reported only once
> drivers/staging/go7007/go7007-driver.c:284: error: for each function =
it
> appears in.)
> make[3]: *** [drivers/staging/go7007/go7007-driver.o] Error 1
> make[2]: *** [drivers/staging/go7007] Error 2
> make[1]: *** [drivers/staging] Error 2
> make: *** [drivers] Error 2

Thanks, I see this here now with the 2.6.30-rc1 release.  It was due to
some v4l api changes, I'll fix it up.

thanks,

greg k-h
