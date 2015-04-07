From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvms390 tree with the kvm tree
Date: Tue, 7 Apr 2015 18:41:19 +1000
Message-ID: <20150407184119.2513e5dc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZI5XyxShNnjd225YBQ9bB5Q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Jens Freimann <jfrei@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ZI5XyxShNnjd225YBQ9bB5Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in
include/uapi/linux/kvm.h between commits 5fafd8748b36 ("MIPS: KVM: Wire
up FPU capability") and d952bd070f79 ("MIPS: KVM: Wire up MSA
capability") from the kvm tree and commits 47b43c52ee4b ("KVM: s390:
add ioctl to inject local interrupts") and 816c7667ea97 ("KVM: s390:
migrate vcpu interrupt state") from the kvms390 tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/uapi/linux/kvm.h
index 05a2083f7a28,c045c725e521..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -802,8 -809,8 +809,10 @@@ struct kvm_ppc_smmu_info=20
  #define KVM_CAP_S390_MEM_OP 108
  #define KVM_CAP_S390_USER_STSI 109
  #define KVM_CAP_S390_SKEYS 110
 +#define KVM_CAP_MIPS_FPU 111
 +#define KVM_CAP_MIPS_MSA 112
+ #define KVM_CAP_S390_INJECT_IRQ 113
+ #define KVM_CAP_S390_IRQ_STATE 114
 =20
  #ifdef KVM_CAP_IRQ_ROUTING
 =20

--Sig_/ZI5XyxShNnjd225YBQ9bB5Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI5gzAAoJEMDTa8Ir7ZwVsLkP/iLfcE5RuhOcSEwP1j1lV/UZ
HPm6xa+nNI24zQS4owCK6AZMwVbul8TakJzmtFNZn5G39M4yeiUcDTrYShx3iaHu
9LmA0fX1V1QEpBn44hwfEQ62kmuaGf8O1mgmsAuWxgXraApZRfXb7WAbO+ePK5ia
LiJz75Rre5fLRacjidzwyqwGTAhMho7WwqkmckwQTOoV2j+wzwzkYdzpaw0zFMyA
cQwNvvuxousyWgwi/pMWp7wUwnF39JMn95fGEoc9MwT6XbZAnpR9Zum8MqeC5iVO
vaOIWTjUpu8vIrBaVyZYl50HayStOSeaYljELuCwgR98P8i0SECEfNXR46+q44AL
DJahhJ/fB9dTnRahwFD7QyCvDm7eF3IIT1Ywn2IOlDhgFaULELoDw/xJ24hTeqcs
5n5eIWdrCaLdA24676J5Av0NTe6Ezcjiq5UsEIALeHg1/1260Fn3J6CymOBanRbN
pW6uAiAegcGnx8TrWnVkRjZGcfbb70WQ9KsXLgVmzmD7xjBr93id13lI2FJP1cxc
ou/bUwLsuOmzFN1IfJ7mKoH1VfkvwE1yrQ5XFghzV+c6N2sStys6Y5gfeatX0bNB
DOtNe9h+eqio1me2rChc/b5mi25ji+HTi2ilVgIoKomv/3MsegW+U3pjUSoICOnm
lsJhv5SZSWyJGk0IgPNU
=s6u+
-----END PGP SIGNATURE-----

--Sig_/ZI5XyxShNnjd225YBQ9bB5Q--
