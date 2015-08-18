From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Aug 17 (staging/hfi1)
Date: Wed, 19 Aug 2015 09:23:00 +1000
Message-ID: <20150819092300.3e97d1ec@canb.auug.org.au>
References: <20150817205533.72ebb3fb@canb.auug.org.au>
	<55D261CA.2070802@infradead.org>
	<32E1700B9017364D9B60AED9960492BC257995D2@fmsmsx120.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60793 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750923AbbHRXXB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Aug 2015 19:23:01 -0400
In-Reply-To: <32E1700B9017364D9B60AED9960492BC257995D2@fmsmsx120.amr.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>

Hi Mike,

On Tue, 18 Aug 2015 14:24:32 +0000 "Marciniszyn, Mike" <mike.marciniszy=
n@intel.com> wrote:
>
> > A:  these and other similar errors:
> >=20
> > In file included from ../drivers/staging/hfi1/chip.c:61:0:
> > ../drivers/staging/hfi1/chip.c: In function =C3=A2=C2=80=C2=98__hfi=
1_trace_LINKVERB=C3=A2=C2=80=C2=99:
> > ../drivers/staging/hfi1/trace.h:1357:20: error: function
> > =C3=A2=C2=80=C2=98__hfi1_trace_LINKVERB=C3=A2=C2=80=C2=99 can never=
 be inlined because it uses variable
> > argument lists  static inline void __hfi1_trace_##fn(const char *fu=
nc, char
> > *fmt, ...) \
> >
>=20
> This was corrected with
> https://www.mail-archive.com/linux-rdma@vger.kernel.org/msg27221.html=
, which I think Doug has picked up.
>=20
> Doug, Randy, Stephen how do we want to handle fixing drivers/staging/=
hfi1 via the staging list vs. the linux-rdma list?

Since the problem was only introduced in the rdma tree (and the trace.h
file only exists there), it needs to be fixed there.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
