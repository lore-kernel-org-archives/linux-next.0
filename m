From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 17 (staging/hfi1)
Date: Mon, 17 Aug 2015 15:35:54 -0700
Message-ID: <55D261CA.2070802@infradead.org>
References: <20150817205533.72ebb3fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:40531 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750921AbbHQWgD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Aug 2015 18:36:03 -0400
In-Reply-To: <20150817205533.72ebb3fb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Mike Marciniszyn <mike.marciniszyn@intel.com>

On 08/17/15 03:55, Stephen Rothwell wrote:
> Hi all,
>=20
> Changes since 20150813:
>=20


Several items:

A:  these and other similar errors:

In file included from ../drivers/staging/hfi1/chip.c:61:0:
=2E./drivers/staging/hfi1/chip.c: In function =C3=A2=C2=80=C2=98__hfi1_=
trace_LINKVERB=C3=A2=C2=80=C2=99:
=2E./drivers/staging/hfi1/trace.h:1357:20: error: function =C3=A2=C2=80=
=C2=98__hfi1_trace_LINKVERB=C3=A2=C2=80=C2=99 can never be inlined beca=
use it uses variable argument lists
 static inline void __hfi1_trace_##fn(const char *func, char *fmt, ...)=
 \
                    ^
=2E./drivers/staging/hfi1/chip.c: In function =C3=A2=C2=80=C2=98__hfi1_=
trace_CNTR=C3=A2=C2=80=C2=99:
=2E./drivers/staging/hfi1/trace.h:1357:20: error: function =C3=A2=C2=80=
=C2=98__hfi1_trace_CNTR=C3=A2=C2=80=C2=99 can never be inlined because =
it uses variable argument lists
 static inline void __hfi1_trace_##fn(const char *func, char *fmt, ...)=
 \
                    ^
=2E./drivers/staging/hfi1/chip.c: In function =C3=A2=C2=80=C2=98__hfi1_=
trace_DC8051=C3=A2=C2=80=C2=99:
=2E./drivers/staging/hfi1/trace.h:1357:20: error: function =C3=A2=C2=80=
=C2=98__hfi1_trace_DC8051=C3=A2=C2=80=C2=99 can never be inlined becaus=
e it uses variable argument lists
 static inline void __hfi1_trace_##fn(const char *func, char *fmt, ...)=
 \
                    ^
=2E./drivers/staging/hfi1/chip.c: In function =C3=A2=C2=80=C2=98__hfi1_=
trace_RCVCTRL=C3=A2=C2=80=C2=99:
=2E./drivers/staging/hfi1/trace.h:1357:20: error: function =C3=A2=C2=80=
=C2=98__hfi1_trace_RCVCTRL=C3=A2=C2=80=C2=99 can never be inlined becau=
se it uses variable argument lists
 static inline void __hfi1_trace_##fn(const char *func, char *fmt, ...)=
 \
                    ^
=2E./drivers/staging/hfi1/chip.c: In function =C3=A2=C2=80=C2=98__hfi1_=
trace_TID=C3=A2=C2=80=C2=99:
=2E./drivers/staging/hfi1/trace.h:1357:20: error: function =C3=A2=C2=80=
=C2=98__hfi1_trace_TID=C3=A2=C2=80=C2=99 can never be inlined because i=
t uses variable argument lists
 static inline void __hfi1_trace_##fn(const char *func, char *fmt, ...)=
 \
                    ^

B:  When CONFIG_PCI is not enabled, lots of these errors:

In file included from ../drivers/staging/hfi1/chip.c:60:0:
=2E./drivers/staging/hfi1/hfi.h:508:20: error: field =C3=A2=C2=80=C2=98=
msix=C3=A2=C2=80=C2=99 has incomplete type
  struct msix_entry msix;
                   ^

=2E./drivers/staging/hfi1/chip.c: In function =C3=A2=C2=80=C2=98disable=
_intx=C3=A2=C2=80=C2=99:
=2E./drivers/staging/hfi1/chip.c:8667:2: error: implicit declaration of=
 function =C3=A2=C2=80=C2=98pci_intx=C3=A2=C2=80=C2=99 [-Werror=3Dimpli=
cit-function-declaration]
  pci_intx(pdev, 0);
  ^

so the driver should depend on PCI or maybe even PCI_MSI.

C.  Please provide some contact info, e.g. in a TODO file or the MAINTA=
INERS file.


--=20
~Randy
