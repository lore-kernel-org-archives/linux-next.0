From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the tip tree
Date: Mon, 6 Aug 2018 15:12:11 +1000
Message-ID: <20180806151211.710b8615@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_bOe+tZbLn./B9yM7NCAmO_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>
List-Id: linux-next.vger.kernel.org

--Sig_/_bOe+tZbLn./B9yM7NCAmO_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/include/asm/trace/hyperv.h

between commit:

  58ec5e9c9044 ("x86/hyper-v: Trace PV IPI send")

from the tip tree and commit:

  47c054685621 ("X86/Hyper-V: Add hyperv_nested_flush_guest_mapping ftrace =
support")

from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/include/asm/trace/hyperv.h
index 9c0d4b588e3f,e1ffe61de8d6..000000000000
--- a/arch/x86/include/asm/trace/hyperv.h
+++ b/arch/x86/include/asm/trace/hyperv.h
@@@ -28,21 -28,20 +28,35 @@@ TRACE_EVENT(hyperv_mmu_flush_tlb_others
  		      __entry->addr, __entry->end)
  	);
 =20
 +TRACE_EVENT(hyperv_send_ipi_mask,
 +	    TP_PROTO(const struct cpumask *cpus,
 +		     int vector),
 +	    TP_ARGS(cpus, vector),
 +	    TP_STRUCT__entry(
 +		    __field(unsigned int, ncpus)
 +		    __field(int, vector)
 +		    ),
 +	    TP_fast_assign(__entry->ncpus =3D cpumask_weight(cpus);
 +			   __entry->vector =3D vector;
 +		    ),
 +	    TP_printk("ncpus %d vector %x",
 +		      __entry->ncpus, __entry->vector)
 +	);
 +
+ TRACE_EVENT(hyperv_nested_flush_guest_mapping,
+ 	    TP_PROTO(u64 as, int ret),
+ 	    TP_ARGS(as, ret),
+=20
+ 	    TP_STRUCT__entry(
+ 		    __field(u64, as)
+ 		    __field(int, ret)
+ 		    ),
+ 	    TP_fast_assign(__entry->as =3D as;
+ 			   __entry->ret =3D ret;
+ 		    ),
+ 	    TP_printk("address space %llx ret %d", __entry->as, __entry->ret)
+ 	);
+=20
  #endif /* CONFIG_HYPERV */
 =20
  #undef TRACE_INCLUDE_PATH

--Sig_/_bOe+tZbLn./B9yM7NCAmO_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltn2KsACgkQAVBC80lX
0GxyzwgApK/mlth2oBwl+B6s4lGI6/1sOm7yPMFsdixDY8QVHGGx53DN5RL165b7
4Z+aNyXYgxOdxL/BpqdlEahoO11RrGL/n5q9ola2wE0orX1XdddwWlrrQ0YMw0YJ
yF1v56OqsP5fVqwYIRAC39DjV46Xs3ueoeXB952gNXmLglcKUfZdpfAvx4yjJh7w
JlBaGG+Osf/DsdBR4GrSIdrnXpGB3ImPv2cR/fa3GdpjTxOXcrkNxu0nDD+1c2YG
Gmef64ft5i3wFI0kw1PyeqzdYJa4ebQHw4cI5JG4vEk54T+NCtiEsUXv7NKS5Zmx
wNvHOX2+pXKZ+2oWp+0teQHWtMq4kA==
=Z4ON
-----END PGP SIGNATURE-----

--Sig_/_bOe+tZbLn./B9yM7NCAmO_--
