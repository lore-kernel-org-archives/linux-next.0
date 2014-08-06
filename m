From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kvm tree
Date: Wed, 6 Aug 2014 14:39:04 +1000
Message-ID: <20140806143904.6e935789@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/B=vuFyObA=molfM80itDfoL"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55695 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751045AbaHFEjM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Aug 2014 00:39:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@linaro.org>, Cornelia Huck <cornelia.huck@de.ibm.com>

--Sig_/B=vuFyObA=molfM80itDfoL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:


In file included from /scratch/sfr/next/include/linux/preempt.h:10:0,
                 from /scratch/sfr/next/include/linux/preempt_mask.h:4,
                 from /scratch/sfr/next/include/linux/hardirq.h:4,
                 from /scratch/sfr/next/include/linux/kvm_host.h:10,
                 from /scratch/sfr/next/arch/powerpc/kvm/../../../virt/kvm/=
eventfd.c:24:
/scratch/sfr/next/arch/powerpc/kvm/../../../virt/kvm/eventfd.c: In function=
 'kvm_irq_has_notifier':
/scratch/sfr/next/arch/powerpc/kvm/../../../virt/kvm/eventfd.c:879:38: erro=
r: 'struct kvm' has no member named 'irq_ack_notifier_list'
   hlist_for_each_entry_rcu(kian, &kvm->irq_ack_notifier_list,
                                      ^

And several more of the same ...

Caused by commit e4d57e1ee1ab ("KVM: Move irq notifier implementation
into eventfd.c").  This build does not have CONFIG_HAVE_KVM_IRQCHIP
set ...

I have used the kvm tree from next-20140805 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/B=vuFyObA=molfM80itDfoL
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJT4bFtAAoJEMDTa8Ir7ZwVWTUP+wWWFuYBR0yptkn5YXHO4ClF
nEqBT4EptnceyTH4XNr7ixITXfSaNnwrKehD9yJ37Hn6Bn4H8UqeIRiRwW4HZ51Z
os6XfgVmyH11GIGhtCNZte+Go/AbTHdLBJTCo1KlNRej9WJcyiTaX9rUIhr+JQ/y
UHwqyXuXcemaF1Hk188gvz6lm1SQR54CuKMznGzZOSQfXYYl4UyPmiODD7JFHyhW
EYTGifnVWbMDjRGHBjN1Z3TXK7xMAhwzawV70NyPsbm3byVa1vfEy6Cg4SuDbzuN
AcmoGX0/RtD7dtI3f6tLT/Z5Bnzl6iz33/4RLEkEYDzoU1g1M0LM3UGu/Ot5s3sf
Nv86BDihYLmiUTytL2Uma7bgJlpqIIuOBWdrg79bNRcHJ1EGhHEaXMcDz9ZW0V9j
/QLXoX93BOfCI8/PrSzKncJThmJhhS8x+qr9f3Tx8eCKG2LvKK3LXdAQsTpzmQrE
KRIb0v0jbDaCPI2/Z/duhTLaCG0P7vZmIRlRNIjzeuibFOJEACUhRw6kN1gzAmXD
izgliNY5IsI5YoIMhrGoKBE5YZmYOLSxD0HpKMH+TGWnCvyDhtmC2JtYhLeKlGI7
ca/IAhfiUJtyS3a2AmgV7mNA6LhAO3LrkTgW1kERkZEmfgNldqPjOjQFqmm75NF2
Af9N3SiCK47ezYBLwD0+
=/L4S
-----END PGP SIGNATURE-----

--Sig_/B=vuFyObA=molfM80itDfoL--
