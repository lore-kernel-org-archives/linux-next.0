From: Sudeep Dutt <sudeep.dutt@intel.com>
Subject: Re: randconfig build error with next-20150609, in
 drivers/misc/mic/scif/scif_rb.c
Date: Tue, 09 Jun 2015 11:47:49 -0700
Message-ID: <1433875669.129381.32.camel@localhost>
References: <CA+r1ZhhKZ5LTfxLoFML6LKvQWBa-mmssEbKjJhW23_AEDvJpBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:24389 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753997AbbFISxy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2015 14:53:54 -0400
In-Reply-To: <CA+r1ZhhKZ5LTfxLoFML6LKvQWBa-mmssEbKjJhW23_AEDvJpBA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ashutosh.dixit@intel.com, nikhil.rao@intel.com, Sudeep Dutt <sudeep.dutt@intel.com>

On Tue, 2015-06-09 at 10:48 -0700, Jim Davis wrote:
> Building with the attached random configuration file,
>=20
> drivers/misc/mic/scif/scif_rb.c: In function =E2=80=98scif_rb_write=E2=
=80=99:
> drivers/misc/mic/scif/scif_rb.c:115:11: error: =E2=80=98ENOMEM=E2=80=99=
 undeclared (first use in
>  this function)
>    return -ENOMEM;
>            ^
> drivers/misc/mic/scif/scif_rb.c:115:11: note: each undeclared
> identifier is reported only once for each function it appears in

Thanks for the report Jim. I will post a patch with the fix.

Sudeep Dutt
