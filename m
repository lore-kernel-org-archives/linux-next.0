From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kvm tree build failure
Date: Tue, 23 Jun 2009 15:53:45 +1000
Message-ID: <20090623155345.11219074.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__23_Jun_2009_15_53_45_+1000_T3Vu.BVqZ7N2gpP_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34703 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751076AbZFWFxs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Jun 2009 01:53:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

--Signature=_Tue__23_Jun_2009_15_53_45_+1000_T3Vu.BVqZ7N2gpP_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next build (s390 allmodconfig) failed like this:

In file included from include/trace/ftrace.h:261,
                 from include/trace/define_trace.h:56,
                 from include/trace/events/kvm.h:55,
                 from arch/s390/kvm/../../../virt/kvm/kvm_main.c:63:
include/trace/events/kvm.h: In function 'ftrace_raw_output_kvm_ack_irq':
include/trace/events/kvm.h:31: error: 'KVM_IRQCHIP_PIC_MASTER' undeclared (=
first use in this function)
include/trace/events/kvm.h:31: error: (Each undeclared identifier is report=
ed only once
include/trace/events/kvm.h:31: error: for each function it appears in.)
include/trace/events/kvm.h:31: error: 'KVM_IRQCHIP_PIC_SLAVE' undeclared (f=
irst use in this function)
include/trace/events/kvm.h:31: error: 'KVM_IRQCHIP_IOAPIC' undeclared (firs=
t use in this function)

Caused by commit acb57be20f6b600848a99796d8f115ec079b8b08 ("KVM: convert
custom marker based tracing to event traces").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__23_Jun_2009_15_53_45_+1000_T3Vu.BVqZ7N2gpP_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpAbekACgkQjjKRsyhoI8yABgCfVIInV/NOtcgZXWOCXx36kUX4
krYAnRDMqMBGPMypuRzjOXtfiCXGud7x
=dBGG
-----END PGP SIGNATURE-----

--Signature=_Tue__23_Jun_2009_15_53_45_+1000_T3Vu.BVqZ7N2gpP_--
